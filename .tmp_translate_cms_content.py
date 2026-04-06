import re
import sys
from pathlib import Path
from bs4 import BeautifulSoup, NavigableString

try:
    from deep_translator import GoogleTranslator
except Exception:
    print('MISSING_DEEP_TRANSLATOR')
    sys.exit(2)

sql_path = Path('id-2026-04-06.sql')
text = sql_path.read_text(encoding='utf-8', errors='ignore')

insert_start = text.find("INSERT INTO `cms_content`")
if insert_start == -1:
    print('CMS_CONTENT_INSERT_NOT_FOUND')
    sys.exit(1)

def find_statement_end(src: str, start_idx: int):
    i = start_idx
    n = len(src)
    in_str = False
    while i < n:
        ch = src[i]
        if in_str:
            if ch == "'":
                if i + 1 < n and src[i + 1] == "'":
                    i += 2
                    continue
                in_str = False
            i += 1
            continue
        if ch == "'":
            in_str = True
            i += 1
            continue
        if ch == ';':
            return i
        i += 1
    return -1

insert_end = find_statement_end(text, insert_start)
if insert_end == -1:
    print('CMS_CONTENT_INSERT_END_NOT_FOUND')
    sys.exit(1)

insert_stmt = text[insert_start:insert_end + 1]

insert_re = re.compile(r"(INSERT INTO `cms_content` \([^\)]*\) VALUES\s*)(.*);$", re.S)
m = insert_re.search(insert_stmt)
if not m:
    print('CMS_CONTENT_INSERT_PARSE_FAILED')
    sys.exit(1)

prefix = m.group(1)
values_blob = m.group(2)

cols_match = re.search(r"INSERT INTO `cms_content` \(([^\)]*)\)", prefix)
if not cols_match:
    print('COLUMN_LIST_NOT_FOUND')
    sys.exit(1)

cols = [c.strip().strip('`') for c in cols_match.group(1).split(',')]
col_idx = {c: i for i, c in enumerate(cols)}

translate_cols = ['name', 'title', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'content', 'metadata_description', 'metadata_keywords']
translate_idx = [col_idx[c] for c in translate_cols if c in col_idx]

translator = GoogleTranslator(source='auto', target='en')


def sql_unquote(v: str):
    v = v.strip()
    if v.upper() == 'NULL':
        return None
    if len(v) >= 2 and v[0] == "'" and v[-1] == "'":
        return v[1:-1].replace("''", "'")
    return None


def sql_quote(s: str):
    return "'" + s.replace("'", "''") + "'"


def looks_translatable(s: str):
    if s is None:
        return False
    t = s.strip()
    if not t:
        return False
    if re.fullmatch(r"[0-9\s\-:|/.#%_]+", t):
        return False
    if re.fullmatch(r"https?://\S+", t):
        return False
    return True


def safe_translate(txt: str):
    t = txt.strip()
    if not t:
        return txt
    try:
        out = translator.translate(t)
        if out:
            return txt.replace(t, out)
    except Exception:
        return txt
    return txt


def translate_html(html: str):
    soup = BeautifulSoup(html, 'html.parser')
    for node in list(soup.descendants):
        if isinstance(node, NavigableString):
            parent = node.parent.name if node.parent else ''
            if parent in ('script', 'style'):
                continue
            original = str(node)
            if not looks_translatable(original):
                continue
            translated = safe_translate(original)
            if translated != original:
                node.replace_with(translated)
    return str(soup)


def split_rows(blob: str):
    rows = []
    i = 0
    n = len(blob)
    while i < n:
        while i < n and blob[i] in ' \r\n\t,':
            i += 1
        if i >= n:
            break
        if blob[i] != '(':
            i += 1
            continue
        start = i
        i += 1
        depth = 1
        in_str = False
        while i < n and depth > 0:
            ch = blob[i]
            if in_str:
                if ch == "'":
                    if i + 1 < n and blob[i + 1] == "'":
                        i += 2
                        continue
                    in_str = False
                i += 1
                continue
            else:
                if ch == "'":
                    in_str = True
                elif ch == '(':
                    depth += 1
                elif ch == ')':
                    depth -= 1
                i += 1
        rows.append(blob[start:i])
    return rows


def split_fields(row: str):
    inner = row.strip()
    if inner[0] == '(' and inner[-1] == ')':
        inner = inner[1:-1]
    fields = []
    buf = []
    i = 0
    n = len(inner)
    in_str = False
    while i < n:
        ch = inner[i]
        if in_str:
            if ch == "'":
                if i + 1 < n and inner[i + 1] == "'":
                    buf.append("''")
                    i += 2
                    continue
                in_str = False
                buf.append(ch)
                i += 1
                continue
            buf.append(ch)
            i += 1
            continue
        else:
            if ch == "'":
                in_str = True
                buf.append(ch)
                i += 1
                continue
            if ch == ',':
                fields.append(''.join(buf).strip())
                buf = []
                i += 1
                continue
            buf.append(ch)
            i += 1
    fields.append(''.join(buf).strip())
    return fields

rows = split_rows(values_blob)
translated_count = 0
new_rows = []

for r in rows:
    fields = split_fields(r)
    if len(fields) != len(cols):
        new_rows.append(r)
        continue
    for idx in translate_idx:
        val = sql_unquote(fields[idx])
        if val is None or not looks_translatable(val):
            continue
        if idx == col_idx.get('content'):
            new_val = translate_html(val)
        else:
            new_val = safe_translate(val)
        if new_val != val:
            fields[idx] = sql_quote(new_val)
            translated_count += 1
    new_rows.append('(' + ', '.join(fields) + ')')

new_insert = prefix + '\n\t' + ',\n\t'.join(new_rows) + ';'
new_text = text[:insert_start] + new_insert + text[insert_end + 1:]
sql_path.write_text(new_text, encoding='utf-8')
print(f'TRANSLATED_FIELDS={translated_count}')

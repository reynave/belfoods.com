import re
from pathlib import Path

sql_path = Path('id-2026-04-06.sql')
text = sql_path.read_text(encoding='utf-8', errors='ignore')
insert_re = re.compile(r"(INSERT INTO `cms_content` \([^\)]*\) VALUES\s*)(.*?);", re.S)
m = insert_re.search(text)
print('insert_found', bool(m))
if not m:
    raise SystemExit(1)
prefix = m.group(1)
values_blob = m.group(2)
cols_match = re.search(r"INSERT INTO `cms_content` \(([^\)]*)\)", prefix)
cols = [c.strip().strip('`') for c in cols_match.group(1).split(',')]
print('columns', len(cols), cols)

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
print('rows', len(rows))
for idx, row in enumerate(rows[:3]):
    fields = split_fields(row)
    print('row', idx+1, 'fields', len(fields), 'id_field', fields[0][:20], 'name_field', fields[2][:120])

mismatch = 0
for row in rows:
    if len(split_fields(row)) != len(cols):
        mismatch += 1
print('mismatch', mismatch)

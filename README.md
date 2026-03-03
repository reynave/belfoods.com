# Belfoods.com — Corporate Website + CMS

## Project Overview

Website korporat **Belfoods** (produk makanan beku) yang dibangun menggunakan custom CMS bernama **MirrelCMS 5** (Mirrel5). Proyek ini terdiri dari 2 bagian utama: **frontend website** (server-side rendered oleh CodeIgniter 3) dan **admin panel** (Angular SPA yang sudah di-build ke production).

> **PENTING:** Source code Angular untuk admin panel **tidak tersedia** di repository ini. Yang ada hanya hasil build production di folder `admin/app/`. Jika perlu modifikasi admin panel, perlu akses ke repo Angular terpisah.

---

## Tech Stack

| Layer | Teknologi | Versi |
|-------|-----------|-------|
| Backend Framework | CodeIgniter | 3.x |
| PHP | PHP | 8.x (XAMPP) |
| Database | MySQL | via `mysqli` driver |
| Web Server | Apache | XAMPP (dengan mod_rewrite) |
| Admin Panel (SPA) | Angular | Production build (compiled) |
| Admin Login Page | AngularJS | 1.7.8 |
| Frontend CSS | Bootstrap | 5.3.3 (CDN) |
| Slider | Slick | 1.8.1 |
| Rich Text Editor | TinyMCE | 5 (CDN) |
| File Manager | elFinder | 2.1.50 |
| CAPTCHA | Google reCAPTCHA | v3 |
| Icons | Bootstrap Icons | 1.11.3 (CDN) |

---

## Struktur Direktori

```
belfoods.com/
├── index.php                    # Entry point CodeIgniter
├── .htaccess                    # URL rewrite rules
├── mirrel5_database.sql         # Database schema + seed data
│
├── application/                 # CodeIgniter application folder
│   ├── config/
│   │   ├── autoload.php         # Auto-load: database, parser, session, email, helpers, models (core, model)
│   │   ├── config.php           # Base URL, session, CSRF config
│   │   ├── database.php         # MySQL connection config (db: belfoods, driver: mysqli)
│   │   └── routes.php           # Routing rules
│   │
│   ├── controllers/
│   │   ├── Site.php             # Frontend website controller (halaman publik)
│   │   ├── Api.php              # REST API controller untuk admin panel (1560 baris, ~50+ endpoints)
│   │   ├── Login.php            # Authentication controller (login/logout/token)
│   │   ├── Adminbiz.php         # Admin panel loader (serve Angular SPA)
│   │   └── Override.php         # Utility: sitemap, RSS, URL regeneration, install
│   │
│   ├── models/
│   │   ├── Core.php             # Core CMS engine (1324 baris) — auth, rendering, navigation, SEO, CRUD helpers
│   │   ├── Core_ver1.php        # Backup/versi lama Core.php
│   │   └── Model.php            # Theme-specific custom data loader (per halaman)
│   │
│   └── views/
│       ├── admin/               # Admin views
│       │   ├── index.php        # Shell HTML untuk Angular SPA (load bundles)
│       │   ├── login.php        # Halaman login (AngularJS 1.7.8)
│       │   ├── header.php       # Inline editor scripts (TinyMCE, elFinder, system.js) — injected saat admin login
│       │   └── footer.php       # Admin footer scripts
│       │
│       └── themes/              # Template halaman frontend
│           ├── global/
│           │   ├── header.php   # HTML head, navbar, Bootstrap, fonts
│           │   └── footer.php   # Footer, scripts
│           ├── home.php         # Homepage template
│           ├── product.php      # Product catalog page
│           ├── blog.php         # Blog/article listing
│           ├── KreasiKilat.php  # Kreasi Kilat (recipes) page
│           ├── sales.php        # Sales/promo page
│           ├── industry.php     # Industry page
│           ├── text.php         # Generic text page
│           ├── search.php       # Search results page
│           └── 404.php          # Error page
│
├── admin/                       # Admin panel (Angular production build)
│   ├── index.html               # Angular SPA entry point (JANGAN EDIT — hasil build)
│   ├── app/                     # Compiled Angular bundles (JS, CSS)
│   ├── css/                     # Admin custom CSS (login.css, mirrel5.css)
│   ├── js/                      # Admin JS
│   │   ├── system.js            # Inline frontend editor — TinyMCE, drag-sort, CRUD via postMessage
│   │   ├── app-login.js         # Login page logic
│   │   └── jquery-ui-*/         # jQuery UI (drag & sort)
│   ├── elFinder-2.1.50/         # File manager plugin (terintegrasi TinyMCE)
│   └── img/                     # Admin images
│
├── assets/                      # Frontend static assets
│   ├── js/
│   │   ├── main.js              # Frontend JS (Slick sliders, scroll handler)
│   │   ├── jquery-3.7.1.min.js
│   │   └── slick-1.8.1/         # Slick carousel library
│   ├── style/
│   │   ├── root.css             # CSS variables
│   │   ├── header.css           # Header/navbar styles
│   │   ├── main.css             # Main stylesheet
│   │   └── fonts.css            # Custom font definitions
│   └── fonts/                   # Font files
│
├── public/                      # User-uploaded & managed files
│   ├── thumb.php                # Image thumbnail generator
│   ├── banner/                  # Banner images
│   ├── content/                 # Content article images
│   ├── widget/                  # Widget images
│   ├── product/                 # Product images
│   ├── catalog/                 # Catalog images
│   ├── pages/                   # Page images
│   ├── label/                   # Label images
│   ├── kreasi/                  # Kreasi (recipe) images
│   ├── video/                   # Video files
│   ├── photos/                  # General photos
│   └── belfoods.png             # Logo utama
│
├── system/                      # CodeIgniter system core (JANGAN EDIT)
└── THEMES3/                     # Static HTML mockup/prototype (referensi desain, BUKAN production)
```

---

## Database Schema

Database name: **`belfoods`** | Charset: `utf8` / `utf8_general_ci`

### Tabel Utama

| Tabel | Fungsi | Relasi |
|-------|--------|--------|
| `account` | Akun admin CMS (email, password MD5, token) | — |
| `cms_pages` | Halaman website (hierarki tree via `id_pages`) | `id_pages` → self-referencing parent |
| `cms_content` | Konten artikel per halaman | `id_pages` → `cms_pages.id` |
| `cms_widget` | Widget fleksibel (banner, gallery, subcontent) | `section` → identifier string |
| `cms_label` | Label teks reusable (footer, title, dll) | — |
| `global_setting` | Konfigurasi global (SMTP, embed code, API key) | — |
| `cms_content_column` | Visibility kolom per halaman | `id_pages` → `cms_pages.id` |
| `cms_pages_log` | Audit log perubahan pages | — |
| `cms_content_log` | Audit log (jika ada) | — |
| `cms_widget_log` | Audit log perubahan widget | — |
| `cms_label_log` | Audit log perubahan label | — |

### Kolom Penting di `cms_pages`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | INT | Primary key |
| `id_pages` | INT | Parent page (0 = root) |
| `name` | VARCHAR | Nama halaman |
| `url` | VARCHAR | URL slug |
| `themes` | VARCHAR | Nama file template di `views/themes/` (tanpa `.php`) |
| `status` | TINYINT | 0=disable, 1=enable, 2=hide |
| `presence` | TINYINT | 1=active, 0=soft-deleted |
| `idefault` | TINYINT | 1=homepage |
| `post` | TINYINT | 1=halaman tipe blog/post |
| `sorting` | INT | Urutan tampil |
| `title` | VARCHAR | SEO title (override `name`) |
| `metadata_description` | TEXT | Meta description |
| `metadata_keywords` | TEXT | Meta keywords |
| `img` | VARCHAR | Path gambar halaman |
| `href` | VARCHAR | External link (jika ada) |
| `ilock` | TINYINT | Halaman terkunci (tidak bisa dihapus) |

### Kolom Penting di `cms_content`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | INT | Primary key |
| `id_pages` | INT | FK ke `cms_pages.id` |
| `name` | VARCHAR | Judul konten |
| `url` | VARCHAR | URL slug (berakhiran `.html`) |
| `h1`-`h6` | VARCHAR | Heading fields |
| `content` | LONGTEXT | HTML content (rich text) |
| `img` | VARCHAR | Path gambar utama |
| `status` | TINYINT | 0=disable, 1=enable |
| `presence` | TINYINT | Soft delete flag |
| `sorting` | INT | Urutan |
| `input_date` | DATETIME | Tanggal dibuat |
| `created_by` | VARCHAR | Pembuat |

### Kolom Penting di `cms_widget`

| Kolom | Tipe | Keterangan |
|-------|------|------------|
| `id` | INT | Primary key |
| `section` | VARCHAR | Nama section (e.g., `banner`, `orderNow`, `videoHome`, `sales`, `infoHome`, `subcontent{id}`, `banner{id}`, `{content_id}`) |
| `h1`-`h4` | VARCHAR | Heading fields |
| `content` | LONGTEXT | HTML content |
| `img` | VARCHAR | Path gambar |
| `href` | VARCHAR | Link URL |
| `sorting` | INT | Urutan |

### Kolom Penting di `global_setting`

| ID | Fungsi |
|----|--------|
| 100 | Header embed code |
| 101 | SMTP host |
| 102 | SMTP port |
| 103 | SMTP user (email sender) |
| 104 | SMTP password |
| 105 | Email recipient (contact form) |
| 106 | Email subject |
| 110 | Success message setelah kirim email |
| 111 | Footer embed code |
| 112 | SMTP timeout |

---

## Routing

### Routes (`application/config/routes.php`)

| Pattern | Controller/Method | Keterangan |
|---------|-------------------|------------|
| `/` | `Site::index()` | Homepage (halaman dengan `idefault=1`) |
| `/login/access/` | `Login::access()` | POST login |
| `/login/logout/` | `Login::logout()` | Logout |
| `/sitemap.xml` | `Override::sitemap()` | XML sitemap |
| `/rss` | `Override::rss()` | RSS feed (JSON format) |
| `/info.json` | `Override::infojs()` | System info (CI version, PHP version, Mirrel version) |
| `/p/{catalog}` | `Site::catalog()` | Product catalog |
| `/p/{catalog}/{product}` | `Site::product()` | Product detail |
| `/{any}` | `Site::index($1)` | Dynamic page routing |

### URL Pattern untuk Konten

- **Pages:** `/{url-slug}` → resolves via `cms_pages.url`
- **Content/Artikel:** `/{url-slug}.html` → resolves via `cms_content.url` (selalu berakhiran `.html`)
- **Admin panel:** `/?adminbiz` → redirect ke login
- **Admin CMS:** `/adminbiz` → serve Angular SPA via `Adminbiz` controller

---

## Arsitektur Sistem

### Flow Rendering Frontend

```
Browser Request → index.php → CI3 Router
    ↓
Site::index($segment1)
    ↓
Core::start()
    ├── setVariable()         # Parse URI → tentukan id_pages, id_content, table
    ├── themes()              # Tentukan template mana (dari cms_pages.themes)
    ├── title()               # Resolve <title> tag
    ├── metadata_*()          # SEO meta tags + OpenGraph
    ├── navigation()          # Build menu 3-level
    ├── content_list()        # Ambil konten + inline-edit data attributes
    └── [galleries/banner/subcontent/widget]
    ↓
Model::custom($themes)        # Data custom per theme (widget sections, posts)
    ↓
Load Views:
    views/themes/global/header.php    # HTML head + navbar
    views/themes/{themes}.php         # Template spesifik
    views/themes/global/footer.php    # Footer + scripts
```

### Flow Admin Panel

```
1. Login Flow:
   /login/index → login.php (AngularJS 1.7.8 form)
       ↓ POST /login/access
   Verify email + MD5 password di tabel `account`
       ↓ Success
   Set cookie `mirrel5Login` = token (30 hari)
       ↓ Redirect
   /adminbiz → Adminbiz::index() → load Angular SPA shell

2. Angular Admin SPA:
   admin/app/ (compiled bundles) → <app-root>
       ↓ HTTP calls
   Api.php endpoints (Key + Token header auth)
       ├── pages/* (CRUD halaman)
       ├── content_* (CRUD konten)
       ├── widget_* (CRUD widgets)
       ├── setting_* (config, SMTP, account)
       └── upload (file upload)

3. Inline Frontend Editor (via iframe):
   Angular SPA embed frontend dalam <iframe>
       ↓
   admin/views/admin/header.php inject:
       - TinyMCE 5 (CDN)
       - elFinder 2.1.50
       - jQuery UI 1.12.1 (sortable)
       - system.js (inline editing engine)
       ↓
   Komunikasi iframe ↔ Angular parent via postMessage:
       - fnRouter: navigasi halaman
       - fnModal: buka modal edit di Angular
       - fnUpdateUrl: update URL setelah edit
```

### Autentikasi

- **Login:** POST JSON `{email, password}` ke `/login/access`
- **Password storage:** MD5 hash (di tabel `account`)
- **Token:** MD5 hash dari `id + password + datetime`, disimpan di tabel `account.token`
- **Cookie:** `mirrel5Login` = token, 30 hari expiry
- **API Auth:** Cek cookie `mirrel5Login` ATAU header `Token` cocok dengan record di `account`
- **API Key:** Header `Key` di-validasi terhadap `database.php → $db['default']['key']`

---

## API Endpoints (Api.php)

Semua endpoint di-prefix dengan `/api/`. Auth required (cookie atau Token header).

### Pages

| Method | Endpoint | Fungsi |
|--------|----------|--------|
| GET | `/api/pages/{id_pages}` | List halaman + children + breadcrumb |
| GET | `/api/pages_load/{id}` | Load data halaman untuk edit |
| GET | `/api/pages_detail/{id}` | Detail lengkap halaman |
| POST | `/api/pages_sortable` | Reorder halaman |
| POST | `/api/pages_update` | Update halaman |
| POST | `/api/pages_status` | Toggle status halaman |
| POST | `/api/pages_insert` | Buat halaman baru |
| POST | `/api/pages_addChild` | Buat child page |
| POST | `/api/pages_delete` | Soft-delete halaman (recursive) |
| POST | `/api/pages_upload` | Upload gambar halaman |

### Content

| Method | Endpoint | Fungsi |
|--------|----------|--------|
| GET | `/api/content_index/{page}` | List konten (paginated, 20/page) |
| GET | `/api/content_detail/{id}` | Detail konten untuk edit |
| POST | `/api/content_update` | Update konten |
| POST | `/api/content_delete` | Soft-delete konten |
| POST | `/api/content_upload` | Upload gambar konten |

### Widgets

| Method | Endpoint | Fungsi |
|--------|----------|--------|
| GET | `/api/widget_section/{section}` | List widget per section |
| GET | `/api/widget_detail/{id}` | Detail widget |
| GET | `/api/widget_galleries/{id}` | Gallery widget untuk konten |
| POST | `/api/widget_update` | Update widget |
| POST | `/api/widget_insert` | Insert widget baru |
| POST | `/api/widget_delete` | Hard-delete widget |
| POST | `/api/widget_sortable` | Reorder widget |
| POST | `/api/widget_upload` | Upload gambar widget |

### Inline Editor (dipanggil dari system.js)

| Method | Endpoint | Fungsi |
|--------|----------|--------|
| POST | `/api/fn_text` | Update teks inline |
| POST | `/api/fn_richtext` | Update rich text (base64 encoded) |
| POST | `/api/fn_insert` | Insert widget baru ke section |
| POST | `/api/fn_delete` | Delete widget/content |
| POST | `/api/fn_sortable` | Reorder via drag |
| POST | `/api/fn_addContent` | Quick-add konten |
| POST | `/api/fn_onchanges` | Update kolom (base64) |
| POST | `/api/fnUpdate` | Update kolom (plain) |

### Settings & Upload

| Method | Endpoint | Fungsi |
|--------|----------|--------|
| GET | `/api/setting_load` | Load semua setting |
| POST | `/api/embedCode_update` | Update embed codes |
| POST | `/api/setting_smtp_update` | Update SMTP |
| POST | `/api/setting_account_update` | Update akun admin |
| POST | `/api/upload` | Generic file upload |
| POST | `/api/fn_uploadLink` | Copy gambar dari URL |

---

## Inline Editing System (system.js)

Saat admin login, `system.js` di-inject ke halaman frontend untuk memungkinkan editing langsung:

### CSS Classes untuk Inline Edit

| Class | Fungsi |
|-------|--------|
| `.fnText` | Editable text (TinyMCE inline, single field) |
| `.fnTextplus` | Rich text editor (toolbar tambahan) |
| `.fnRichtext` | Full rich text editor (TinyMCE + media + elFinder) |
| `.fnSortable` | Container yang bisa di-sort (jQuery UI sortable) |
| `.fnInsert` | Tombol insert widget baru |
| `.fnDelete` | Tombol delete item |
| `.fnRouter` | Link navigasi ke halaman di Angular admin |
| `.fnModal` | Buka modal edit di Angular parent |
| `.fnAddContent` | Tombol quick-add konten |
| `.onchanges` | Dropdown/input yang trigger update on change |
| `.update` | Input yang trigger update on change |
| `.handle` | Drag handle untuk sortable |

### Data Attribute Pattern

Elemen inline edit menggunakan `data-json` attribute:
```html
<div class="fnRichtext" data-json='{"table":"cms_content","column":"content","id":"123"}'>
    <!-- Editable content here -->
</div>
```

Format: `{"table": "nama_tabel", "column": "nama_kolom", "id": "record_id"}`

---

## Custom Theme Data (Model.php)

Setiap theme bisa memiliki data custom yang di-load via `Model::custom($theme)`. Data ini tersedia di view sebagai `$custom`.

| Theme | Custom Data |
|-------|-------------|
| `home` | `banner`, `orderNow`, `infoHome`, `videoHome`, `sales`, `kreasiKilat` (post dari page "Kreasi Kilat") |
| `KreasiKilat` | `orderNow`, `kreasiKilatTitle` |
| `blog` | `orderNow` |
| `product` | `orderNow` |
| `text` | `orderNow` |

Widget sections (e.g., `banner`, `orderNow`) diambil dari `cms_widget.section`.

---

## Setup & Installation

### Prerequisites
- XAMPP dengan PHP 8.x
- MySQL/MariaDB
- Apache dengan `mod_rewrite` enabled

### Langkah Install

1. **Clone/copy** project ke folder XAMPP htdocs:
   ```
   C:\xampp\htdocs\website\belfoods.com\
   ```

2. **Buat database** MySQL:
   ```sql
   CREATE DATABASE belfoods CHARACTER SET utf8 COLLATE utf8_general_ci;
   ```

3. **Import database** schema:
   ```sql
   USE belfoods;
   SOURCE mirrel5_database.sql;
   ```
   Atau gunakan auto-install: akses `/override/install` (hanya jalan jika DB kosong, menggunakan `admin/mirrel5-prod.sql`)

4. **Konfigurasi database** di `application/config/database.php`:
   ```php
   'hostname' => 'localhost',
   'username' => 'root',
   'password' => '',
   'database' => 'belfoods',
   ```

5. **Konfigurasi base URL** di `application/config/config.php`:
   ```php
   $config['base_url'] = 'http://localhost/website/belfoods.com/';
   ```

6. **Pastikan `.htaccess`** aktif untuk URL rewriting (remove `index.php` dari URL)

7. **Akses website:**
   - Frontend: `http://localhost/website/belfoods.com/`
   - Admin login: `http://localhost/website/belfoods.com/login/index`
   - Admin panel: `http://localhost/website/belfoods.com/adminbiz`

---

## Catatan Penting untuk AI Agent

### Yang BOLEH Diedit
- `application/controllers/` — semua controller
- `application/models/Core.php` — model utama CMS (hati-hati, 1324 baris, inti sistem)
- `application/models/Model.php` — custom data per theme
- `application/views/themes/` — template frontend (PHP views)
- `application/views/themes/global/` — header & footer global
- `application/config/` — konfigurasi CI3
- `assets/` — CSS, JS, font frontend
- `public/` — file uploads (hanya untuk manage, bukan kode)

### Yang JANGAN Diedit
- `admin/app/` — compiled Angular bundles (hasil build, bukan source)
- `admin/index.html` — Angular SPA entry point (generated)
- `system/` — CodeIgniter core framework
- `admin/elFinder-2.1.50/` — library pihak ketiga
- `admin/js/jquery-ui-1.12.1.custom/` — library pihak ketiga
- `application/models/Core_ver1.php` — backup/versi lama, jangan pakai

### Pattern & Convention
- **Soft delete:** Semua tabel CMS menggunakan `presence` (1=aktif, 0=dihapus), bukan hard delete
- **Status:** 0=disable, 1=enable, 2=hide (khusus pages)
- **URL slug:** Auto-generated dari `name` menggunakan CI `url_title()`, konten berakhiran `.html`
- **Image upload:** Upload ke `public/{tabel}/` (e.g., `public/content/`, `public/widget/`)
- **Thumbnail:** Gunakan `public/thumb.php?src={path}` untuk resize on-the-fly
- **Base64 encoding:** Rich text content dikirim ke API dalam format base64
- **Timezone:** Asia/Jakarta (`+07:00`) di-set di setiap controller constructor
- **Auth pattern:** Cookie `mirrel5Login` atau header `Token` — dicek di `Core::token()`
- **Widget section naming:** String identifier seperti `banner`, `orderNow`, `subcontent{id}`, `banner{id}`, `{content_id}` untuk galleries

### Dependency Autoload
```php
$autoload['libraries'] = array('database', 'parser', 'session', 'email');
$autoload['helper'] = array('html', 'url', 'form', 'directory', 'cookie');
$autoload['model'] = array('core', 'model');
```

Model `core` (Core.php) dan `model` (Model.php) tersedia di semua controller via `$this->core` dan `$this->model`.

### Core Helper: `$this->core->select()`
Fungsi DB helper paling sering dipakai di seluruh project:
```php
$this->core->select($field, $table, $where)
// Contoh: $this->core->select('name', 'cms_pages', 'id=1')
// Return: single value (string) atau false
```

---

## File SQL

- `mirrel5_database.sql` — Database schema lengkap + seed data (di root project)
- `admin/mirrel5-prod.sql` — Database schema untuk auto-install via `/override/install`

---

## Kontak & Info

- **CMS Platform:** MirrelCMS 5 (Mirrel5)
- **CI Version:** CodeIgniter 3.x
- **PHP:** 8.x
- **Info endpoint:** `/info.json` — menampilkan versi CI, Mirrel, dan PHP

# Garuda Gear
A new Flutter project.
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Garuda Gear Mobile

## Tugas 7

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

= Widget Tree adalah representasi logis dari seluruh UI aplikasi Flutter. Setiap elemen visual di Flutter (seperti teks, tombol, ikon, layout) adalah sebuah widget, dan semua widget tersusun secara hierarkis seperti pohon (tree).

Parent (induk) adalah widget yang membungkus atau menampung widget lain, sedangkan child (anak) adalah widget yang berada di dalam parent dan menerima perilaku atau tata letak dari induknya.

Contoh:

Scaffold(
  appBar: AppBar(title: Text('Garuda Gear')),
  body: Center(
    child: Text('Selamat Datang'),
  ),
)

Keterangan:
- Scaffold adalah parent dari Center.
- Center adalah parent dari Text.
- Text adalah child paling bawah.

Setiap perubahan state akan menyebabkan widget terhubung dibangun ulang bersama seluruh child-nya.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
- MaterialApp: Sebagai root widget aplikasi yang menyediakan kerangka Material Design dan tema warna untuk seluruh app.
- Scaffold: Menyediakan struktur utama halaman seperti AppBar, body, dan elemen lainnya (misalnya SnackBar).
- AppBar: Menampilkan judul “Garuda Gear” di bagian atas halaman dengan warna latar dari tema utama aplikasi.
- Text: Menampilkan teks, seperti judul di AppBar, nama user, NPM, kelas, serta pesan “Selamat datang di Garuda Gear!”.
- Padding: Memberi jarak di sekitar konten agar tampilan lebih rapi, misalnya EdgeInsets.all(16.0) pada body.
- Column: Menyusun widget secara vertikal, seperti menempatkan Row, SizedBox, dan Center secara berurutan di body.
- Row: Menyusun tiga InfoCard secara horizontal di bagian atas halaman (NPM, Name, Class).
- InfoCard (custom widget): Widget kustom berbentuk Card untuk menampilkan informasi user (title dan content) secara rapi dengan bayangan lembut.
- Card: Memberikan efek kartu dengan bayangan dan batas melengkung untuk tiap InfoCard.
- Container: Digunakan untuk mengatur ukuran, padding, dan warna latar di berbagai bagian seperti di dalam Card dan ItemCard.
- SizedBox: Menambahkan jarak vertikal antar elemen (contohnya SizedBox(height: 16.0)).
- Center: Menempatkan isi (Column teks dan grid) tepat di tengah halaman.
- GridView.count: Menampilkan daftar item (ItemCard) dalam bentuk grid 3 kolom yang responsif dan bisa menyesuaikan tinggi kontennya.
- ItemHomepage (custom class): Model data sederhana yang menyimpan nama menu, ikon, dan warna untuk setiap item di halaman utama.
- ItemCard (custom widget): Widget kustom untuk menampilkan setiap item pada grid: berisi ikon dan teks dengan warna berbeda.
- Material: Membungkus InkWell agar efek ripple (gelombang saat ditekan) muncul sesuai tema Material Design.
- InkWell: Memberikan efek sentuhan dan menampilkan SnackBar saat kartu ditekan.
- Icon: Menampilkan ikon sesuai item (shopping_basket, shopping_bag, add) dengan warna putih.
- SnackBar: Menampilkan pesan singkat di bagian bawah layar ketika sebuah ItemCard ditekan.
- MediaQuery: Mengambil informasi ukuran layar perangkat untuk menyesuaikan lebar InfoCard.
- EdgeInsets: Menentukan nilai padding atau margin dalam berbagai widget seperti Padding dan Container.
- Theme.of(context): Mengambil tema warna aplikasi agar AppBar mengikuti skema warna utama (colorScheme.primary).
- TextStyle: Mengatur gaya teks seperti warna, ukuran, dan ketebalan huruf di seluruh aplikasi.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp adalah widget utama yang mendefinisikan gaya Material Design untuk seluruh aplikasi.

Fungsinya mencakup:

- Menentukan tema warna, font, dan tampilan aplikasi.
- Menyediakan sistem navigasi dan routing antar halaman.
- Mengelola localization (bahasa dan format lokal).

MaterialApp diletakkan sebagai root widget, karena seluruh widget seperti Scaffold, AppBar, dan TextField memerlukan konteks Material (BuildContext) untuk dapat bekerja dengan tema aplikasi

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget tidak memiliki state internal. UI bersifat tetap dan hanya berubah jika parent memintanya. Tampilannya tetap. StatelessWidget digunakan untuk UI statis seperti teks, ikon, gambar.

StatefulWidget memiliki state yang bisa berubah selama aplikasi berjalan. Ketika state berubah, UI akan dibangun ulang. StatefulWidget digunakan untuk elemen dinamis seperti input form, animasi, counter, atau halaman yang mengambil data dari API.

Contoh:

Text("Hello"): Stateless

Switch, TextField, Slider: Stateful

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah objek yang menyimpan informasi posisi widget dalam tree serta menyediakan akses ke:

- Theme dan MediaQuery (ukuran layar, orientasi).
- Navigator untuk berpindah halaman.
- Parent widget di atasnya.

BuildContext ini digunakan di dalam metode build(BuildContext context) untuk membangun UI.

Tanpa BuildContext, widget tidak bisa mengetahui di mana ia berada di widget tree atau mengakses data dari parent.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload memuat ulang kode sumber yang diubah dan memperbarui tampilan aplikasi tanpa kehilangan state. State tetap dipertahankan.
Sedangkan, hot restart memulai ulang seluruh aplikasi dari awal, seperti menjalankan ulang main(). State hilang dan aplikasi diinisialisasi ulang.

Contoh penggunaan:

- Jika teks atau warna diubah, gunakan Hot Reload.
- Jika variabel global ditambah atau struktur kode besar diubah, gunakan Hot Restart.

## Tugas 8

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

= Navigator.push() menambahkan halaman (rute) baru di atas stack navigasi. Halaman sebelumnya tetap ada di stack, sehingga user dapat menekan tombol "kembali" untuk kembali ke halaman tersebut. Sebaliknya, Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru. Halaman yang lama akan dihapus dari stack, sehingga user tidak bisa kembali ke halaman yang diganti tersebut.

Dalam aplikasi Garuda Gear, push() (seperti di left_drawer.dart atau menu.dart saat menekan "Add Product") digunakan saat membuka halaman formulir ProductFormPage. Setelah selesai, user dapat kembali ke halaman utama. pushReplacement() (seperti di left_drawer.dart saat menekan "Home") digunakan saat kembali ke MyHomePage dari drawer. Ini mencegah penumpukan halaman utama di stack jika user berpindah-pindah antar halaman dari menu drawer.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

= Scaffold berfungsi sebagai kerangka dasar tata letak Material Design untuk setiap halaman, seperti pada menu.dart (MyHomePage) dan productlist_form.dart (ProductFormPage). Scaffold menyediakan slot standar untuk elemen umum seperti appBar, body, dan drawer. Dengan menggunakan Scaffold sebagai fondasi di setiap halaman, struktur visual akan konsisten.

AppBar ditempatkan di slot appBar untuk menyediakan header aplikasi yang seragam ("Garuda Gear" di menu.dart atau "Form Add Product" di productlist_form.dart). 

Drawer (didefinisikan di left_drawer.dart) menyediakan menu navigasi geser. Dengan memanggil drawer: const LeftDrawer() di Scaffold, user diberikan akses yang sama ke navigasi utama dari mana saja di dalam aplikasi.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

= Padding: digunakan untuk memberi jarak satu elemen dengan yang lainnya. Dalam productlist_form.dart, setiap TextFormField dibungkus oleh Padding(padding: const EdgeInsets.all(8.0), ...). Ini memberi jarak antar input field dan antara field dengan tepi layar, membuat formulir lebih mudah dibaca dan disentuh.

SingleChildScrollView: digunakan di productlist_form.dart, di mana Form dibungkus dengan SingleChildScrollView agar saat keyboard virtual muncul atau jika jumlah field melebihi tinggi layar agar user tetap dapat scroll ke bawah untuk mengakses semua field dan tombol "Save". Ini mencegah terjadinya pixel overflow error.

ListView: digunakan di left_drawer.dart untuk menu untuk menampilkan daftar item yang panjang atau dinamis

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

= Penyesuaian warna tema secara terpusat dilakukan di file main.dart di dalam widget MaterialApp. Saya menggunakan properti theme: ThemeData(...) untuk mendefinisikan palet warna global. Dalam kode Garuda Gear, colorScheme diatur menggunakan ColorScheme.fromSwatch(primarySwatch: Colors.blue) untuk warna utama dan .copyWith(secondary: Colors.blueAccent[400]) untuk warna sekunder.

Theme adalah InheritedWidget yang menyebarkan informasi (seperti warna) ke semua widget di bawahnya. Ini memungkinkan widget lain, seperti AppBar di menu.dart, untuk menggunakan warna utama tersebut dengan memanggil Theme.of(context).colorScheme.primary. Dengan cara ini, jika saya ingin mengubah main color theme, saya hanya perlu mengubahnya di main.dart dan seluruh aplikasi akan otomatis diperbarui secara konsisten.

## Tugas 9

1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

= Model (product_entry.dart) memberikan tipe yang jelas, validasi mudah, dan code lebih maintainable dibanding langsung memakai Map<String, dynamic>. Pada aplikasi Garuda Gear saya, ProductEntry.fromJson/toJson memastikan struktur yang dikembalikan endpoint /json/ cocok dengan UI. Ini mencegah error runtime saat FutureBuilder di product_list.dart mencoba membaca properti yang tidak ada.

Jika memakai Map langsung, konsekuensinya adalah hilangnya null-safety dan tipe sehingga mudah terjadi cast error, sulit menelusuri bug, dan perubahan backend memerlukan banyak pengecekan tersebar di UI. Dengan model, perubahan lapisan data cukup disesuaikan di satu tempat.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

= Fungsi package http dan CookieRequest:
- http (low-level): mengirim GET/POST biasa, cocok untuk API tanpa autentikasi berbasis cookie. Tidak otomatis mengelola cookie/CSRF.
- CookieRequest (di main.dart): membungkus request + otomatis menyimpan cookie, mengurus CSRF header, dan menyediakan helper login, postJson, get yang memudahkan workflow Django berbasis sesi.

Di Garuda Gear, semua operasi login/register/postJson/get menggunakan CookieRequest sehingga autentikasi stateful (session cookie) bekerja dengan benar antara Flutter dan Django.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

= Alasan: session/cookie adalah global state: setelah login server mengeluarkan cookie sesi, widget manapun yang akan melakukan request butuh akses ke cookie itu. Di main.dart, saya memakai Provider untuk menyuntikkan satu instance CookieRequest ke seluruh subtree sehingga context.watch<CookieRequest>() di login.dart, productlist_form.dart, product_list.dart dll. selalu memakai session yang sama.

Keuntungan: konsistensi autentikasi (request.logout() benar-benar menghapus cookie untuk seluruh app), lebih mudah testing dan mock.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

= Agar Flutter dapat berkomunikasi dengan Django, diperlukan beberapa konfigurasi: 

(1) menambahkan 10.0.2.2 ke ALLOWED_HOSTS karena Android emulator menggunakan alamat tersebut untuk mengakses localhost host machine, sehingga tanpa ini Django akan menolak request dengan error "DisallowedHost"

(2) mengaktifkan CORS (django-cors-headers) dengan CORS_ALLOW_CREDENTIALS = True dan menambahkan origin Flutter ke CORS_ALLOWED_ORIGINS agar browser/app mengizinkan request lintas domain beserta cookie-nya

(3) mengatur SESSION_COOKIE_SAMESITE = None dan CSRF_COOKIE_SAMESITE = None (dengan SECURE di production) supaya cookie sesi dapat dikirim saat request cross-origin, karena jika tidak diatur cookie tidak akan disertakan dan autentikasi berbasis sesi akan gagal meskipun login berhasil

(4) menambahkan <uses-permission android:name="android.permission.INTERNET" /> di android/app/src/main/AndroidManifest.xml agar aplikasi Android mendapat izin akses internet, tanpa ini semua request jaringan akan terblokir.

Jika konfigurasi ini tidak dilakukan dengan benar, aplikasi Garuda Gear akan mengalami berbagai error seperti koneksi gagal, login tidak persisten (cookie tidak tersimpan), atau CSRF verification failed.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

= Pada aplikasi Garuda Gear, mekanisme pengiriman data dimulai ketika user mengisi form lalu menekan tombol Save yang memicu request.postJson untuk mengirim data JSON ke endpoint Django. Django menerima data tersebut, memvalidasi, menyimpan ke database sebagai objek Product baru, dan mengembalikan response status (success/error). Setelah berhasil, user dinavigasi ke halaman utama dan ketika membuka halaman Product List (product_list.dart), fungsi fetchProduct() dipanggil yang melakukan request.get untuk mengambil semua data produk dalam format JSON dari Django serializer. 

Response JSON kemudian di-parse menjadi List<ProductEntry> menggunakan ProductEntry.fromJson() di dalam model product_entry.dart, dan FutureBuilder menunggu hasil fetch tersebut untuk menampilkan data melalui widget ProductEntryCard yang menampilkan thumbnail, nama, harga, kategori, dan deskripsi produk. 

Jika terjadi error, FutureBuilder menampilkan pesan error. Jika data kosong, ditampilkan pesan There are no products in Garuda Gear.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

= Mekanisme autentikasi pada Garuda Gear dimulai dari register: user mengisi form di register.dart (username, password, confirm password) lalu menekan tombol Register yang memanggil request.postJson untuk mengirim data ke Django; Django memvalidasi data, membuat user baru di database, dan mengembalikan response status success atau error, kemudian jika berhasil user dinavigasi ke LoginPage. Untuk login: user memasukkan username dan password di login.dart, lalu request.login dipanggil; CookieRequest.login() mengirim kredensial ke Django yang memverifikasi melalui authenticate(), jika valid Django membuat session dan mengirim cookie sessionid kembali ke Flutter, CookieRequest menyimpan cookie tersebut dan mengubah state request.loggedIn menjadi true, kemudian app menavigasi user ke MyHomePage() dengan pesan Welcome, [username]. Untuk logout: ketika user menekan tombol Logout (di product_card atau drawer), dipanggil request.logout yang memberitahu Django untuk menghapus session di server, lalu CookieRequest menghapus cookie lokal dan mengubah request.loggedIn menjadi false, kemudian user dinavigasi kembali ke LoginPage. Semua request berikutnya (seperti fetch produk atau create produk) menggunakan instance CookieRequest yang sama dari Provider sehingga cookie session otomatis disertakan di setiap request, menjaga state autentikasi konsisten di seluruh aplikasi.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

= Implementasi checklist dilakukan dengan langkah-langkah berikut:

1) Setup Backend Django: Membuat endpoints /auth/login/, /auth/register/, /auth/logout/, /json/ (untuk list produk), dan /create-flutter/ (untuk create produk) dengan konfigurasi CORS (django-cors-headers dengan CORS_ALLOW_CREDENTIALS=True dan CORS_ALLOWED_ORIGINS), menambahkan 10.0.2.2 dan localhost ke ALLOWED_HOSTS, serta mengatur cookie settings (SESSION_COOKIE_SAMESITE=None dan CSRF_COOKIE_SAMESITE=None).

2) Setup Flutter Dependencies dan Provider: Menambahkan dependencies pbp_django_auth, provider, dan google_fonts ke pubspec.yaml, lalu membuat instance CookieRequest global menggunakan Provider di main.dart agar semua komponen dapat mengakses session yang sama.

3) Membuat Model dan Screens: Membuat model ProductEntry di lib/models/product_entry.dart dengan method fromJson/toJson untuk mapping data JSON dari Django ke objek Dart dengan field name, price, description, category, thumbnail, dan isFeatured. Kemudian implementasi screens: login.dart menggunakan request.login() dan navigasi ke menu jika berhasil; register.dart menggunakan request.postJson() untuk registrasi; productlist_form.dart dengan form validation dan request.postJson() untuk mengirim data produk baru; product_list.dart dengan FutureBuilder yang memanggil fetchProduct() (menggunakan request.get()) dan menampilkan list produk menggunakan ProductEntryCard; product_detail.dart untuk menampilkan detail lengkap produk.

4) Konfigurasi Final dan Testing: Menambahkan <uses-permission android:name="android.permission.INTERNET" /> di AndroidManifest.xml, styling dengan Google Fonts Poppins di main.dart, dan menambahkan AppBar dengan warna dan font konsisten di semua screens. Untuk testing, menjalankan Django server, mengubah base URL di Flutter dari localhost:8000 menjadi 10.0.2.2:8000 untuk emulator Android, lalu menjalankan flutter clean dan flutter run untuk memastikan semua perubahan (terutama yang terkait font dan network) diterapkan dengan full restart, bukan hot reload.
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
# TUBES GDGoC - Uangku
Uangku adalah sebuah platform untuk melakukan tracking pemasukan dan pengeluaran uangmu

# Anggota Tim
1. Muhammad Gavin Arasyi - 103012300262 - S1 Informatika 2023
2. Edsel Septa Haryanto - 103022300016 - S1 Rekayasa Perangkat Lunak 2023

# Cara Instal dan Run Aplikasi

## Running di dalam IDE Android Studio
1. Copy link github
2. Clone Repository ke dalam IDE
3. Aktifkan emulator android
4. Run code

# Fitur

## Fitur Tambah Pendapatan dan Pengeluaran
![alt text](https://github.com/NamkuGavin/tubesGDGoC/blob/8fbf7c12be8d5449ba0fde6231c316f97155a437/screenshot/1_Tambah-Pemasukan.png)
Pengguna dapat menambahkan pendapatan dan pengeluaran

## Tampilan Transaksi
![alt text](https://github.com/NamkuGavin/tubesGDGoC/blob/8fbf7c12be8d5449ba0fde6231c316f97155a437/screenshot/2_Nav-Transaksi.png)
Pengguna dapat melihat riwayat pendapatan dan pengeluaran

## Fitur Edit Pendapatan dan Pengeluaran
![alt text](https://github.com/NamkuGavin/tubesGDGoC/blob/8fbf7c12be8d5449ba0fde6231c316f97155a437/screenshot/3_Edit-Transaksi.png)
Pengguna dapat melakukan edit pada riwayat pendapatan dan pengeluaran

## Tampilan Beranda
![alt text](https://github.com/NamkuGavin/tubesGDGoC/blob/8fbf7c12be8d5449ba0fde6231c316f97155a437/screenshot/4_Nav-Homepage.png)
Pengguna dapat melihat halaman beranda

## Fitur Artikel
![alt text](https://github.com/NamkuGavin/tubesGDGoC/blob/8fbf7c12be8d5449ba0fde6231c316f97155a437/screenshot/5_Artikel.png)
Pengguna dapat melihat artikel seputar bidang ekonomi

## Tampilan Profil
![alt text](https://github.com/NamkuGavin/tubesGDGoC/blob/8fbf7c12be8d5449ba0fde6231c316f97155a437/screenshot/6_Nav-Profile.png)
Pengguna dapat melihat profil dan keluar dari akun

## Edit Profil 
![alt text](https://github.com/NamkuGavin/tubesGDGoC/blob/8fbf7c12be8d5449ba0fde6231c316f97155a437/screenshot/7_Edit-Profile.png)
Pengguna dapat mengedit profil yang ia miliki

# Teknologi
Bahasa Pemrograman : Dart
Platform : Android
Database : Firebase, Data Dummy (Local untuk artikel)
IDE : Android Studio
Version Control : Github
State Management : Provider
Debugging Devices : Samsung Galaxy A52

# Struktur Folder Project
tubes_gdgoc/
├── assets/
│    ├── icons/             # Berisi ikon-ikon aplikasi (biasanya untuk navigasi atau representasi fitur)
│    │   ├── article.png
│    │   ├── home.png
│    │   ├── home_active.png
│    │   ├── profile.png
│    │   ├── profile_active.png
│    │   ├── transaction.png
│    │   ├── transaction_active.png
│    │   ├── transaction_history.png
│    │   ├── trend_down.png
│    │   └── trend_up.png
│    ├── logo/              # Berisi logo-logo penting, seperti logo aplikasi atau logo pihak ketiga
│    │   ├── google.png
│    │   └── UangKu_Logo.png
│    ├── lottie/            # Berisi animasi Lottie dalam format .json
│    │   └── loading.json
├── lib/
│    ├── common/                  # Fungsi umum dan utilitas
│    │   ├── list_data.dart       # Data statis seperti daftar item/kategori
│    │   ├── navigate.dart        # Navigasi global/helper
│    │   ├── notifier.dart        # State notifier atau provider
│    │   ├── validate.dart        # Fungsi validasi input/form
│    │   └── model/
│    │       └── article_model.dart  # Model data untuk artikel
│    ├── service/                 
│    │   └── firebase_service.dart # Abstraksi untuk layanan Firebase
│    ├── ui/                      # Folder utama untuk tampilan (UI) aplikasi
│    │   ├── auth/                # Layar otentikasi
│    │   │   ├── login_screen.dart
│    │   │   └── regiter_screen.dart
│    │   ├── edit_profile/        # Layar untuk edit profil
│    │   │   └── edit_profile_screen.dart
│    │   ├── navigation/          # Navigasi & bottom nav
│    │   │   ├── buttonNav.dart
│    │   │   └── menu/
│    │   │       ├── home.dart
│    │   │       └── profile.dart
│    │   ├── splashscreen/
│    │   │   └── splash_screen.dart
│    │   ├── transaction/         # Layar transaksi
│    │   │   ├── transaction.dart
│    │   │   ├── add_income.dart
│    │   │   ├── add_spending.dart
│    │   │   └── edit_transaction.dart
│    │   └── widget/              # Widget-widget reusable
│    │       ├── article_item.dart
│    │       ├── custom_textfield.dart
│    │       ├── googleSignIn_button.dart
│    │       ├── loading_animation.dart
│    │       ├── profile_item.dart
│    │       ├── snackbar_item.dart
│    │       ├── total_balance.dart
│    │       ├── transaction_history.dart
│    │       └── transaction_item.dart
│    ├── firebase_options.dart     # Konfigurasi Firebase (dari CLI)
│    └── main.dart                 # Entry point aplikasi
├── pubspec.yaml       # File konfigurasi dependensi dan assets

## Penjelasan Tambahan
common/ 
berisi beberapa fungsi dan konfigurasi yang reusable
1. Validate
2. Navigate
3. list_data
4. Notifier
5. folder model/ yang berisi model artikel

service/
berisi service logic penghubung backend firebase

ui/
berisi fitur-fitur berhubungan dengan user interface
1. auth/ = berisi login dan register
2. edit_profile/ = pengaturan profil user
3. navigation/ = bottom navigation dan menu screen (home, profile, dan transaksi)
4. splashscreen/ = splashscreen
5. widget/ = berisi widget-widget reusable

main.dart 
File utama untuk menjalankan aplikasi

firebase.option.dart
file konfigurasi firebase cli
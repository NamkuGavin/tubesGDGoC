# TUBES GDGoC - Uangku
Uangku adalah sebuah platform untuk melakukan tracking pemasukan dan pengeluaran uangmu

Drive Tubes GDGoC Aplikasi Uangku: https://drive.google.com/drive/folders/1OJX2dsN-7ygqjVLCQdccHcnYEt7xGK1L?usp=sharing

# Anggota Tim
1. Muhammad Gavin Arasyi - 103012300262 - S1 Informatika 2023
2. Edsel Septa Haryanto - 103022300016 - S1 Rekayasa Perangkat Lunak 2023

# Cara Instal dan Run Aplikasi

## Running di dalam IDE Android Studio
1. Copy link github
2. Clone Repository ke dalam IDE
3. Aktifkan emulator android
4. Run code

## instalasi menggunakan APK
1. Download APK pada link : https://drive.google.com/file/d/1wEYA58lldDG1UMfoOYjS3AYQBLF8Dk9F/view?usp=sharing
2. Buka file APK
3. Instal

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
![alt text](https://github.com/NamkuGavin/tubesGDGoC/blob/803c37cee37ac3f102f0e1d9e4fef6b05760449b/screenshot/struktur%20folder%201.png)
![alt text](https://github.com/NamkuGavin/tubesGDGoC/blob/803c37cee37ac3f102f0e1d9e4fef6b05760449b/screenshot/struktur%20folder%202.png)

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
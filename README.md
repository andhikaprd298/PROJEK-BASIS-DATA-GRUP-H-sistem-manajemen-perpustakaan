# Sistem Manajemen Perpustakaan Berbasis MySQL

## Deskripsi Project
Project ini merupakan implementasi sistem basis data relasional untuk Sistem Manajemen Perpustakaan menggunakan MySQL. Sistem dirancang untuk mengelola data anggota, petugas, buku, kategori, penerbit, penulis, rak, transaksi peminjaman, pengembalian, reservasi, denda, serta pembayaran denda. Selain implementasi struktur basis data, project ini juga mencakup pembuatan query, view, stored procedure, trigger, dan function sebagai bagian dari pengelolaan data perpustakaan.

---

## Anggota Tim

| No | Nama | NIM |
|----|------------------------------|------------|
| 1 | Carrisa Putri Arabella | K1D024019 |
| 2 | Mukti Toifatul Istiqomah | K1D024021 |
| 3 | Wuri Dwi Ariyanti | K1D024025 |
| 4 | Cariesa Putria Tsabitha | K1D024034 |
| 5 | Andhika Pradana Rahma Dhany | K1D024038 |

---

## Teknologi yang Digunakan

- MySQL
- MySQL Workbench / phpMyAdmin
- SQL (DDL, DML, DQL)
- Git & GitHub

---

## Cara Menjalankan Script

1. Install MySQL Server.
2. Buka MySQL Workbench atau phpMyAdmin.
3. Buat database baru, misalnya:

```sql
CREATE DATABASE perpustakaan;
USE perpustakaan;
```

4. Jalankan file **DDL.sql** untuk membuat seluruh tabel.
5. Jalankan file **DML.sql** untuk mengisi data awal (dummy data).
6. Jalankan file **QUERY.sql** untuk menguji query SELECT.
7. Jalankan file:
   - VIEW.sql
   - PROCEDURE.sql
   - FUNCTION.sql
   - TRIGGER.sql

8. Pastikan seluruh script berhasil dijalankan tanpa error.

---

## Entity Relationship Diagram (ERD)

ERD menggambarkan hubungan antar entitas pada Sistem Manajemen Perpustakaan. Sistem terdiri dari 13 entitas utama, yaitu:

- Anggota
- Petugas
- Buku
- Buku_Eksemplar
- Penulis
- Penerbit
- Kategori
- Rak
- Peminjaman
- Pengembalian
- Reservasi
- Denda
- Pembayaran_Denda

> **Catatan:** Gambar ERD dapat dilihat pada folder `ERD/` atau file `ERD.png`.

---

## Struktur Folder

```
Project-Perpustakaan/
│
├── README.md
├── ERD/
│   └── ERD.png
├── SQL/
│   ├── DDL.sql
│   ├── DML.sql
│   ├── QUERY.sql
│   ├── VIEW.sql
│   ├── PROCEDURE.sql
│   ├── FUNCTION.sql
│   └── TRIGGER.sql
├── Dokumentasi/
│   └── Laporan Project.pdf
└── Assets/
    └── Screenshot/
```

---

## Fitur Sistem

- Pengelolaan data anggota
- Pengelolaan data petugas
- Pengelolaan data buku
- Pengelolaan kategori buku
- Pengelolaan penerbit
- Pengelolaan penulis
- Pengelolaan rak buku
- Transaksi peminjaman
- Transaksi pengembalian
- Reservasi buku
- Pengelolaan denda
- Pembayaran denda
- View
- Stored Procedure
- Trigger
- Function
- Query laporan

---

## Lisensi

Project ini dibuat untuk memenuhi tugas Mata Kuliah **Basis Data** Program Studi Statistika Universitas Jenderal Soedirman dan digunakan untuk keperluan akademik.

DROP DATABASE perpustakaan;
CREATE DATABASE perpustakaan;
USE perpustakaan;
CREATE TABLE Anggota (
id_anggota VARCHAR(10) PRIMARY KEY,
nama_anggota VARCHAR(100) NOT NULL,
alamat TEXT NOT NULL,
no_hp VARCHAR(15) NOT NULL,
email VARCHAR(100) UNIQUE
);
CREATE TABLE Petugas (
id_petugas VARCHAR(10) PRIMARY KEY,
nama_petugas VARCHAR(100) NOT NULL,
jabatan_petugas ENUM('Admin','Pustakawan') NOT NULL
);
CREATE TABLE Kategori (
id_kategori VARCHAR(10) PRIMARY KEY,
nama_kategori VARCHAR(100) NOT NULL
);
CREATE TABLE Penerbit (
id_penerbit VARCHAR(10) PRIMARY KEY,
nama_penerbit VARCHAR(100) NOT NULL,
kota_penerbit VARCHAR(100) NOT NULL
);
CREATE TABLE Penulis (
id_penulis VARCHAR(10) PRIMARY KEY,
nama_penulis VARCHAR(100) NOT NULL,
kebangsaan_penulis VARCHAR(100)
);
CREATE TABLE Rak (
id_rak VARCHAR(10) PRIMARY KEY,
lokasi_rak VARCHAR(20) NOT NULL,
kapasitas_rak VARCHAR(100) NOT NULL
);
CREATE TABLE Buku (
id_buku VARCHAR(10) PRIMARY KEY,
isbn VARCHAR(20) UNIQUE NOT NULL,
judul_buku VARCHAR(150) NOT NULL,
tahun_terbit YEAR NOT NULL,
id_penerbit VARCHAR(10) NOT NULL,
id_rak VARCHAR(10) NOT NULL,

FOREIGN KEY (id_penerbit)
    REFERENCES Penerbit(id_penerbit),

FOREIGN KEY (id_rak)
    REFERENCES Rak(id_rak)

);
CREATE TABLE Eksemplar_Buku (
id_eksemplar VARCHAR(10) PRIMARY KEY,
id_buku VARCHAR(10) NOT NULL,
kondisi_buku ENUM('Baik','Rusak','Hilang') NOT NULL,

FOREIGN KEY (id_buku)
    REFERENCES Buku(id_buku)

);
CREATE TABLE Peminjaman (
    id_peminjaman VARCHAR(10) PRIMARY KEY,
    id_anggota VARCHAR(10) NOT NULL,
    id_petugas VARCHAR(10) NOT NULL,
    id_eksemplar VARCHAR(10) NOT NULL,
    tanggal_pinjam DATE NOT NULL,
    tanggal_jatuh_tempo DATE NOT NULL,
    tanggal_kembali_rencana DATE NOT NULL,
    status_peminjaman ENUM(
        'Tepat Waktu',
        'Terlambat'
    ) NOT NULL,

    FOREIGN KEY (id_anggota)
        REFERENCES Anggota(id_anggota),

    FOREIGN KEY (id_petugas)
        REFERENCES Petugas(id_petugas),

    FOREIGN KEY (id_eksemplar)
        REFERENCES Eksemplar_Buku(id_eksemplar)
);
CREATE TABLE Pengembalian (
id_pengembalian VARCHAR(10) PRIMARY KEY,
id_peminjaman VARCHAR(10) UNIQUE NOT NULL,
tanggal_kembali_aktual DATE NOT NULL,

FOREIGN KEY (id_peminjaman)
    REFERENCES Peminjaman(id_peminjaman)
);
CREATE TABLE Denda (
id_denda VARCHAR(10) PRIMARY KEY,
id_pengembalian VARCHAR(10) UNIQUE NOT NULL,
jenis_denda ENUM(
'Keterlambatan',
'Tidak Ada'
) NOT NULL,
total_denda_rp DECIMAL(10,2) NOT NULL,

FOREIGN KEY (id_pengembalian)
    REFERENCES Pengembalian(id_pengembalian)

);
CREATE TABLE Pembayaran_Denda (
id_bayar_denda VARCHAR(10) PRIMARY KEY,
id_denda VARCHAR(10) NOT NULL,
tgl_bayar DATE NOT NULL,

FOREIGN KEY (id_denda)
    REFERENCES Denda(id_denda)
);
CREATE TABLE Reservasi (
id_reservasi VARCHAR(10) PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
id_buku VARCHAR(10) NOT NULL,
tgl_reservasi DATE NOT NULL,
status_reservasi ENUM(
'Menunggu',
'Terpenuhi',
'Dikonfirmasi',
'Dibatalkan'
) NOT NULL,
kode_reservasi ENUM(
'online',
'offline'
) NOT NULL,

FOREIGN KEY (id_anggota)
    REFERENCES Anggota(id_anggota),

FOREIGN KEY (id_buku)
    REFERENCES Buku(id_buku)
);

USE perpustakaan;

-- ANGGOTA
INSERT INTO Anggota
(id_anggota,nama_anggota,alamat,no_hp,email)
VALUES
('ANG001','Budi Santoso','Jl. Merdeka 1, Jakarta Pusat, DKI Jakarta','081234567890','budi@gmail.com'),
('ANG002','Siti Rahayu','Jl. Sudirman 5, Kota Bandung, Jawa Barat','081234567891','siti@gmail.com'),
('ANG003','Eko Prasetyo','Jl. Gatot Subroto 12, Surabaya, Jawa Timur','081234567892','eko@gmail.com'),
('ANG004','Dewi Kusuma','Jl. Ahmad Yani 7, Yogyakarta, DI Yogyakarta','081234567893','dewi@gmail.com'),
('ANG005','Fajar Nugroho','Jl. Diponegoro 3, Semarang, Jawa Tengah','081234567894','fajar@gmail.com'),
('ANG006','Galih Wibowo','Jl. Pemuda 9, Malang, Jawa Timur','081234567895','galih@gmail.com'),
('ANG007','Hana Permata','Jl. Sudirman 14, Bekasi, Jawa Barat','081234567896','hana@gmail.com'),
('ANG008','Irwan Halim','Jl. Kenari 6, Depok, Jawa Barat','081234567897','irwan@gmail.com'),
('ANG009','Julia Hartini','Jl. Mawar 2, Tangerang, Banten','081234567898','julia@gmail.com'),
('ANG010','Krisna Aditya','Jl. Melati 8, Bogor, Jawa Barat','081234567899','krisna@gmail.com'),
('ANG011','Laras Indah','Jl. Pala 4, Surakarta, Jawa Tengah','081234567800','laras@gmail.com'),
('ANG012','Malik Fauzan','Jl. Dahlia 11, Medan, Sumatera Utara','081234567801','malik@gmail.com'),
('ANG013','Nadia Sari','Jl. Cempaka 3, Palembang, Sumatera Selatan','081234567802','nadia@gmail.com'),
('ANG014','Oscar Pratama','Jl. Anggrek 7, Makassar, Sulawesi Selatan','081234567803','oscar@gmail.com'),
('ANG015','Putri Anjani','Jl. Tulip 2, Banjarmasin, Kalimantan Selatan','081234567804','putri@gmail.com'),
('ANG016','Raka Surya','Jl. Kemuning 5, Balikpapan, Kalimantan Timur','081234567805','raka@gmail.com'),
('ANG017','Sari Utami','Jl. Flamboyan 1, Samarinda, Kalimantan Timur','081234567806','sari@gmail.com'),
('ANG018','Taufik Hidayat','Jl. Nusa Indah 8, Pontianak, Kalimantan Barat','081234567807','taufik@gmail.com');

-- PETUGAS
INSERT INTO Petugas
(id_petugas,nama_petugas,jabatan_petugas)
VALUES
('PTG001','Dewi Lestari','Pustakawan'),
('PTG002','Rudi Hartono','Admin'),
('PTG003','Sari Puspita','Pustakawan');

-- KATEGORI
INSERT INTO Kategori(id_kategori,nama_kategori)
VALUES
('KT001','Fiksi'),
('KT002','Fiksi'),
('KT003','Non-Fiksi'),
('KT004','Non-Fiksi'),
('KT005','Non-Fiksi'),
('KT006','Fiksi'),
('KT007','Non-Fiksi'),
('KT008','Fiksi'),
('KT009','Non-Fiksi'),
('KT010','Non-Fiksi');

-- PENERBIT
INSERT INTO Penerbit
(id_penerbit,nama_penerbit,kota_penerbit)
VALUES
('PNB001','Bentang Pustaka','Yogyakarta'),
('PNB002','Hasta Mitra','Jakarta'),
('PNB003','Gramedia Pustaka','Jakarta'),
('PNB004','HarperCollins Indonesia','Jakarta'),
('PNB005','Plata Publishing','Scottsdale'),
('PNB006','Bloomsbury Publishing','London'),
('PNB007','Pastel Bookks','Bandung'),
('PNB008','Kompas Gramedia','Jakarta'),
('PNB009','Mizan Pustaka','Bandung'),
('PNB010','Crown Business','New York'),
('PNB011','Republika Penerbit','Jakarta'),
('PNB012','Sound Wisdom','Mechanicsburg'),
('PNB013','Random House','New York'),
('PNB014','Canogate Books','Edinburgh');

-- PENULIS
INSERT INTO Penulis
(id_penulis,nama_penulis,kebangsaan_penulis)
VALUES
('PNL001','Andrea Hirata','Indonesia'),
('PNL002','Pramoedya Ananta Toer','Indonesia'),
('PNL003','James Clear','Amerika Serikat'),
('PNL004','Yuval Noah Harari','Israel'),
('PNL005','Paulo Coelho','Brasil'),
('PNL006','Ahmad Fuadi','Indonesia'),
('PNL007','Robert T. Kiyosaki','Amerika Serikat'),
('PNL008','J.K.Rowling','Inggris'),
('PNL009','Pidi Baiq','Indonesia'),
('PNL010','Dee Lestari','Indonesia'),
('PNL011','Henry Manampiring','Indonesia'),
('PNL012','Karen Armstrong','Inggris'),
('PNL013','Peter Thiel','Amerika Serikat'),
('PNL014','Tere Liye','Indonesia'),
('PNL015','Napoleon Hill','Amerika Serikat'),
('PNL016','Eka Kurniawan','Indonesia'),
('PNL017','Charles Duhigg','Amerika Serikat'),
('PNL018','Matt Haig','Inggris');

-- RAK
INSERT INTO Rak
(id_rak,lokasi_rak,kapasitas_rak)
VALUES
('RK001','Lantai 1 – Rak A1','50'),
('RK002','Lantai 1 – Rak B1','40'),
('RK003','Lantai 2 – Rak C2','45'),
('RK004','Lantai 2 – Rak D1','35'),
('RK005','Lantai 3 – Rak E1','30');

-- BUKU
INSERT INTO Buku
(id_buku, judul_buku, isbn, tahun_terbit, id_penerbit, id_rak)
VALUES
('BK001', 'Laskar Pelangi', '978-979-461-514-6', 2005, 'PNB001', 'RK001'),
('BK002', 'Bumi Manusia', '978-979-428-069-8', 1980, 'PNB002', 'RK002'),
('BK003', 'Atomic Habits', '978-602-06-3548-7', 2018, 'PNB003', 'RK003'),
('BK004', 'Sapiens', '978-602-424-278-7', 2011, 'PNB003', 'RK003'),
('BK005', 'The Alchemist', '978-979-22-5879-7', 1988, 'PNB004', 'RK001'),
('BK006', 'Negeri 5 Menara', '978-979-22-5026-5', 2009, 'PNB003', 'RK001'),
('BK007', 'Rich Dad Poor Dad', '978-1-5247-6344-7', 1997, 'PNB005', 'RK004'),
('BK008', 'Harry Potter & Batu Bertuah', '978-979-22-3691-7', 1997, 'PNB006', 'RK001'),
('BK009', 'Dilan 1990', '978-602-8508-38-4', 2014, 'PNB007', 'RK002'),
('BK010', 'Perahu Kertas', '978-979-22-4931-3', 2009, 'PNB001', 'RK001'),
('BK011', 'Filosofi Teras', '978-979-709-976-1', 2018, 'PNB008', 'RK003'),
('BK012', 'Sejarah Tuhan', '978-979-799-522-9', 1993, 'PNB009', 'RK004'),
('BK013', 'Zero to One', '978-0-8041-3929-8', 2014, 'PNB010', 'RK004'),
('BK014', 'Pulang', '978-602-8581-94-4', 2015, 'PNB011', 'RK002'),
('BK015', 'Think and Grow Rich', '978-1-60459-273-7', 1937, 'PNB012', 'RK005'),
('BK016', 'Cantik Itu Luka', '978-979-22-6141-4', 2002, 'PNB003', 'RK001'),
('BK017', 'The Power of Habit', '978-0-8129-8160-3', 2012, 'PNB013', 'RK005'),
('BK018', 'The Midnight Library', '978-0-525-55947-4', 2020, 'PNB014', 'RK001');

-- EKSEMPLAR
INSERT INTO Eksemplar_Buku
(id_eksemplar, id_buku, kondisi_buku)
VALUES
('EKS001', 'BK001', 'Baik'),
('EKS002', 'BK002', 'Baik'),
('EKS003', 'BK003', 'Baik'),
('EKS004', 'BK004', 'Baik'),
('EKS005', 'BK005', 'Baik'),
('EKS006', 'BK001', 'Baik'),
('EKS007', 'BK006', 'Baik'),
('EKS008', 'BK007', 'Rusak'),
('EKS009', 'BK008', 'Baik'),
('EKS010', 'BK009', 'Baik'),
('EKS011', 'BK010', 'Baik'),
('EKS012', 'BK011', 'Baik'),
('EKS013', 'BK012', 'Baik'),
('EKS014', 'BK013', 'Baik'),
('EKS015', 'BK002', 'Baik'),
('EKS016', 'BK014', 'Baik'),
('EKS017', 'BK015', 'Baik'),
('EKS018', 'BK016', 'Baik'),
('EKS019', 'BK017', 'Baik'),
('EKS020', 'BK018', 'Hilang');

-- PEMINJAMAN
INSERT INTO Peminjaman
(id_peminjaman,tanggal_pinjam,tanggal_jatuh_tempo,tanggal_kembali_rencana,status_peminjaman,id_anggota,id_petugas,id_eksemplar)
VALUES
('PJ001','2024-01-05','2024-01-19','2024-01-19','Tepat Waktu','ANG001','PTG001','EKS001'),
('PJ002','2024-01-07','2024-01-21','2024-01-21','Terlambat','ANG002','PTG001','EKS002'),
('PJ003','2024-01-10','2024-01-24','2024-01-24','Tepat Waktu','ANG003','PTG002','EKS003'),
('PJ004','2024-01-12','2024-01-26','2024-01-26','Terlambat','ANG004','PTG002','EKS004'),
('PJ005','2024-01-15','2024-01-29','2024-01-29','Tepat Waktu','ANG005','PTG003','EKS005'),
('PJ006','2024-01-18','2024-02-01','2024-02-01','Terlambat','ANG006','PTG001','EKS006'),
('PJ007','2024-01-20','2024-02-03','2024-02-03','Tepat Waktu','ANG007','PTG002','EKS007'),
('PJ008','2024-01-22','2024-02-05','2024-02-05','Terlambat','ANG008','PTG003','EKS008'),
('PJ009','2024-01-25','2024-02-08','2024-02-08','Tepat Waktu','ANG009','PTG001','EKS009'),
('PJ010','2024-01-28','2024-02-11','2024-02-11','Terlambat','ANG010','PTG002','EKS010'),
('PJ011','2024-02-01','2024-02-15','2024-02-15','Tepat Waktu','ANG001','PTG003','EKS011'),
('PJ012','2024-02-03','2024-02-17','2024-02-17','Terlambat','ANG011','PTG001','EKS012'),
('PJ013','2024-02-05','2024-02-19','2024-02-19','Tepat Waktu','ANG012','PTG002','EKS013'),
('PJ014','2024-02-08','2024-02-22','2024-02-22','Terlambat','ANG013','PTG003','EKS014'),
('PJ015','2024-02-10','2024-02-24','2024-02-24','Tepat Waktu','ANG014','PTG001','EKS015'),
('PJ016','2024-02-12','2024-02-26','2024-02-26','Terlambat','ANG015','PTG002','EKS016'),
('PJ017','2024-02-15','2024-03-01','2024-03-01','Tepat Waktu','ANG002','PTG003','EKS017'),
('PJ018','2024-02-18','2024-03-04','2024-03-04','Terlambat','ANG016','PTG001','EKS018'),
('PJ019','2024-02-20','2024-03-06','2024-03-06','Tepat Waktu','ANG017','PTG002','EKS019'),
('PJ020','2024-02-22','2024-03-08','2024-03-08','Terlambat','ANG018','PTG003','EKS020');

-- PENGEMBALIAN
INSERT INTO Pengembalian
(id_pengembalian,id_peminjaman,tanggal_kembali_aktual)
VALUES
('PKB001', 'PJ001', '2024-01-18 00:00:00'),
('PKB002', 'PJ002', '2024-01-25 00:00:00'),
('PKB003', 'PJ003', '2024-01-24 00:00:00'),
('PKB004', 'PJ004', '2024-02-01 00:00:00'),
('PKB005', 'PJ005', '2024-01-29 00:00:00'),
('PKB006', 'PJ006', '2024-02-05 00:00:00'),
('PKB007', 'PJ007', '2024-02-03 00:00:00'),
('PKB008', 'PJ008', '2024-02-10 00:00:00'),
('PKB009', 'PJ009', '2024-02-08 00:00:00'),
('PKB010', 'PJ010', '2024-02-18 00:00:00'),
('PKB011', 'PJ011', '2024-02-14 00:00:00'),
('PKB012', 'PJ012', '2024-02-20 00:00:00'),
('PKB013', 'PJ013', '2024-02-19 00:00:00'),
('PKB014', 'PJ014', '2024-02-28 00:00:00'),
('PKB015', 'PJ015', '2024-02-24 00:00:00'),
('PKB016', 'PJ016', '2024-03-02 00:00:00'),
('PKB017', 'PJ017', '2024-03-01 00:00:00'),
('PKB018', 'PJ018', '2024-03-09 00:00:00'),
('PKB019', 'PJ019', '2024-03-06 00:00:00'),
('PKB020', 'PJ020', '2024-03-15 00:00:00');

-- DENDA
INSERT INTO Denda
(id_denda,id_pengembalian,jenis_denda,total_denda_rp) 
VALUES
('DN001','PKB001','Tidak Ada',0),
('DN002','PKB002','Keterlambatan',15000),
('DN003','PKB003','Tidak Ada',0),
('DN004','PKB004','Keterlambatan',25000),
('DN005','PKB005','Tidak Ada',0),
('DN006','PKB006','Keterlambatan',10000),
('DN007','PKB007','Tidak Ada',0),
('DN008','PKB008','Keterlambatan',20000),
('DN009','PKB009','Tidak Ada',0),
('DN010','PKB010','Keterlambatan',35000),
('DN011','PKB011','Tidak Ada',0),
('DN012','PKB012','Keterlambatan',15000),
('DN013','PKB013','Tidak Ada',0),
('DN014','PKB014','Keterlambatan',30000),
('DN015','PKB015','Tidak Ada',0),
('DN016','PKB016','Keterlambatan',20000),
('DN017','PKB017','Tidak Ada',0),
('DN018','PKB018','Keterlambatan',25000),
('DN019','PKB019','Tidak Ada',0),
('DN020','PKB020','Keterlambatan',35000);

-- PEMBAYARAN DENDA
INSERT INTO Pembayaran_Denda
(id_bayar_denda,id_denda,tgl_bayar)
VALUES
('BP001','DN001','2024-01-18'),
('BP002','DN002','2024-01-26'),
('BP003','DN003','2024-01-24'),
('BP004','DN004','2024-02-02'),
('BP005','DN005','2024-01-29'),
('BP006','DN006','2024-02-06'),
('BP007','DN007','2024-02-03'),
('BP008','DN008','2024-02-11'),
('BP009','DN009','2024-02-08'),
('BP010','DN010','2024-02-19'),
('BP011','DN011','2024-02-14'),
('BP012','DN012','2024-02-21'),
('BP013','DN013','2024-02-19'),
('BP014','DN014','2024-03-01'),
('BP015','DN015','2024-02-24'),
('BP016','DN016','2024-03-03'),
('BP017','DN017','2024-03-01'),
('BP018','DN018','2024-03-10'),
('BP019','DN019','2024-03-06'),
('BP020','DN020','2024-03-16');

-- RESERVASI
INSERT INTO Reservasi
(id_reservasi,id_anggota,id_buku,tgl_reservasi,status_reservasi,kode_reservasi)
VALUES
('RV001','ANG001','BK001','2024-01-03','Terpenuhi','Online'),
('RV002','ANG002','BK002','2024-01-05','Dikonfirmasi','Online'),
('RV003','ANG003','BK003','2024-01-07','Menunggu','Offline'),
('RV004','ANG004','BK004','2024-01-10','Terpenuhi','Online'),
('RV005','ANG005','BK005','2024-01-14','Dibatalkan','Offline'),
('RV006','ANG006','BK001','2024-01-15','Dikonfirmasi','Online'),
('RV007','ANG007','BK006','2024-01-18','Menunggu','Offline'),
('RV008','ANG008','BK007','2024-01-19','Terpenuhi','Offline'),
('RV009','ANG009','BK008','2024-01-20','Menunggu','Online'),
('RV010','ANG010','BK009','2024-01-22','Dibatalkan','Online'),
('RV011','ANG001','BK010','2024-01-24','Dikonfirmasi','Offline'),
('RV012','ANG011','BK011','2024-01-27','Terpenuhi','Online'),
('RV013','ANG012','BK012','2024-02-03','Dikonfirmasi','Online'),
('RV014','ANG013','BK013','2024-02-05','Menunggu','Offline'),
('RV015','ANG014','BK002','2024-02-08','Dibatalkan','Online'),
('RV016','ANG015','BK014','2024-02-11','Dikonfirmasi','Offline'),
('RV017','ANG002','BK015','2024-02-13','Menunggu','Online'),
('RV018','ANG016','BK016','2024-02-15','Terpenuhi','Online'),
('RV019','ANG017','BK017','2024-02-18','Dikonfirmasi','Offline'),
('RV020','ANG018','BK018','2024-02-20','Terpenuhi','Online');

-- Q1
SELECT * FROM Anggota;

-- Q2
SELECT * FROM Buku
WHERE tahun_terbit > 2000;

-- Q3
SELECT * FROM Eksemplar_Buku
WHERE kondisi_buku='Baik';

-- Q4
SELECT a.nama_anggota,p.tanggal_pinjam,pt.nama_petugas
FROM Peminjaman p
JOIN Anggota a ON p.id_anggota=a.id_anggota
JOIN Petugas pt ON p.id_petugas=pt.id_petugas;

-- Q5
SELECT a.nama_anggota,
       b.judul_buku
FROM Anggota a
JOIN Peminjaman p
ON a.id_anggota = p.id_anggota
JOIN Eksemplar_Buku eb
ON p.id_eksemplar = eb.id_eksemplar
JOIN Buku b
ON eb.id_buku = b.id_buku;

-- Q6
SELECT b.judul_buku,pn.nama_penerbit
FROM Buku b
JOIN Penerbit pn ON b.id_penerbit=pn.id_penerbit;

-- Q7
SELECT b.judul_buku,
       a.nama_anggota,
       r.status_reservasi
FROM Reservasi r
JOIN Anggota a
ON r.id_anggota = a.id_anggota
JOIN Buku b
ON r.id_buku = b.id_buku;

-- Q8 SUBQUERY
SELECT nama_anggota
FROM Anggota
WHERE id_anggota IN
(
    SELECT id_anggota
    FROM Peminjaman
);

-- Q9 CTE
WITH TotalPinjam AS
(
    SELECT
    p.id_anggota,
    COUNT(*) jumlah_pinjam
    FROM Peminjaman p
    GROUP BY p.id_anggota
)
SELECT *
FROM TotalPinjam;

-- Q10
SELECT
r.lokasi_rak,
COUNT(b.id_buku) AS jumlah_buku
FROM Buku b
JOIN Rak r
ON b.id_rak = r.id_rak
GROUP BY r.lokasi_rak
HAVING COUNT(b.id_buku) >= 1;

CREATE VIEW vw_riwayat_peminjaman AS
SELECT
a.nama_anggota,
b.judul_buku,
p.tanggal_pinjam,
p.tanggal_jatuh_tempo
FROM Anggota a
JOIN Peminjaman p
ON a.id_anggota=p.id_anggota
JOIN Eksemplar_Buku eb
ON p.id_eksemplar=eb.id_eksemplar
JOIN Buku b
ON eb.id_buku=b.id_buku;

-- Lihat riwayat peminjaman
SELECT * FROM vw_riwayat_peminjaman;

CREATE VIEW vw_denda_belum_lunas AS
SELECT *
FROM Denda
WHERE jenis_denda='Keterlambatan';
-- Lihat denda yang belum lunas
SELECT * FROM vw_denda_belum_lunas;

DELIMITER //

CREATE PROCEDURE bayar_denda(
IN p_id_bayar_denda VARCHAR(10),
IN p_id_denda VARCHAR(10),
IN p_tgl_bayar DATE
)

BEGIN

INSERT INTO Pembayaran_Denda
(
id_bayar_denda,
id_denda,
tgl_bayar
)

VALUES
(
p_id_bayar_denda,
p_id_denda,
p_tgl_bayar
);

UPDATE Denda
SET jenis_denda='Tidak Ada',
total_denda_rp=0
WHERE id_denda=p_id_denda;

END //

DELIMITER ;

CALL bayar_denda(
'BP021',
'DN001',
CURDATE()
);

-- Cek apakah data pembayaran berhasil masuk
SELECT * FROM Pembayaran_Denda WHERE id_bayar_denda = 'BP021';

-- Cek apakah denda DN001 sudah diupdate
SELECT * FROM Denda WHERE id_denda = 'DN001';

DELIMITER //
DROP TRIGGER IF EXISTS trg_update_status_pinjam;
CREATE TRIGGER trg_update_status_pinjam
AFTER INSERT ON Peminjaman
FOR EACH ROW
BEGIN

UPDATE Eksemplar_Buku
SET status_eksemplar='Dipinjam'
WHERE id_eksemplar=NEW.id_eksemplar;

END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION jumlah_reservasi(
p_id_anggota VARCHAR(10)
)
RETURNS INT
DETERMINISTIC

BEGIN

DECLARE jumlah INT;

SELECT COUNT(*)
INTO jumlah
FROM Reservasi
WHERE id_anggota = p_id_anggota;

RETURN jumlah;

END //

DELIMITER ;

SELECT
id_anggota,
nama_anggota,
jumlah_reservasi(id_anggota) AS total_reservasi
FROM Anggota;
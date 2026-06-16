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
SELECT a.nama_anggota,b.judul_buku
FROM Anggota a
JOIN Peminjaman p ON a.id_anggota=p.id_anggota
JOIN Detail_Peminjaman dp ON p.id_peminjaman=dp.id_peminjaman
JOIN Eksemplar_Buku eb ON dp.id_eksemplar=eb.id_eksemplar
JOIN Buku b ON eb.id_buku=b.id_buku;

-- Q6
SELECT b.judul_buku,pn.nama_penerbit
FROM Buku b
JOIN Penerbit pn ON b.id_penerbit=pn.id_penerbit;

-- Q7
SELECT r.id_reservasi,a.nama_anggota,b.judul_buku
FROM Reservasi r
JOIN Anggota a ON r.id_anggota=a.id_anggota
JOIN Buku b ON r.id_buku=b.id_buku;

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
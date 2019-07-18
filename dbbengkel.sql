-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jul 2019 pada 16.08
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbbengkel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_akses`
--

CREATE TABLE `tbl_akses` (
  `username` varchar(10) NOT NULL,
  `pass` varchar(6) NOT NULL,
  `hak_akses` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_akses`
--

INSERT INTO `tbl_akses` (`username`, `pass`, `hak_akses`) VALUES
('admin', '123456', 'pemilik'),
('petugas', '123456', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `kd_kategori` char(10) NOT NULL,
  `nm_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`kd_kategori`, `nm_kategori`) VALUES
('01', 'OLI'),
('02', 'BAN'),
('03', 'BODY'),
('04', 'LAMPU'),
('05', 'REM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mekanik`
--

CREATE TABLE `tbl_mekanik` (
  `id_mekanik` char(10) NOT NULL,
  `nm_mekanik` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_mekanik`
--

INSERT INTO `tbl_mekanik` (`id_mekanik`, `nm_mekanik`) VALUES
('M01', 'Yanto M'),
('M02', 'SIgit P');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `no_polisi` char(10) NOT NULL,
  `motor` varchar(50) NOT NULL,
  `nm_pelanggan` varchar(50) NOT NULL,
  `alamat` varchar(70) NOT NULL,
  `tgl_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`no_polisi`, `motor`, `nm_pelanggan`, `alamat`, `tgl_masuk`) VALUES
('AD 5784 LU', 'KLX 150BF', 'Reza ', 'Sanggung', '2019-07-04'),
('AD 7156 PA', 'Ninja 250', 'Sigit', 'Salatiga', '2019-07-04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_sparepart`
--

CREATE TABLE `tbl_sparepart` (
  `id_part` char(10) NOT NULL,
  `nama_part` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `kd_kategori` char(10) NOT NULL,
  `harga` int(10) NOT NULL,
  `stok` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_sparepart`
--

INSERT INTO `tbl_sparepart` (`id_part`, `nama_part`, `merk`, `kd_kategori`, `harga`, `stok`) VALUES
('O001', 'Castrol Oil Active Extra 4T', 'Castrol', '01', 26000, 10),
('O002', 'Yamalube Gold 4T', 'Yamalube', '01', 29000, 7),
('O003', 'Yamalube Matic ', 'Yamalube', '01', 27000, 10),
('O004', 'Yamalube Silver 4T', 'Yamalube', '01', 26000, 5),
('O005', 'Federal Oil Ultratec 4T', 'Federal Oil', '01', 21000, 6),
('O006', 'AHM MPX 4AT', 'AHM', '01', 32000, 12),
('O007', 'AHM MPX 4T', 'AHM', '01', 29000, 10),
('O008', 'Top 1 Oil Action Matic 10w-30', 'Top 1', '01', 27000, 7),
('O009', 'Top 1 Oil Action Plus', 'Top 1', '01', 26500, 5),
('O010', 'Top 1 Oil SMO MC 4T', 'Top 1', '01', 25000, 8),
('O011', 'Oli Samping', 'Top 1', '01', 20000, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `kd_transaksi` char(10) NOT NULL,
  `no_polisi` char(10) NOT NULL,
  `motor` varchar(50) NOT NULL,
  `nm_pelanggan` varchar(50) NOT NULL,
  `id_part` char(10) NOT NULL,
  `nama_part` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `qty` int(20) NOT NULL,
  `total` int(20) NOT NULL,
  `bayar` int(20) NOT NULL,
  `kembali` int(20) NOT NULL,
  `id_mekanik` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`kd_transaksi`, `no_polisi`, `motor`, `nm_pelanggan`, `id_part`, `nama_part`, `harga`, `qty`, `total`, `bayar`, `kembali`, `id_mekanik`) VALUES
('P002', 'AD 5784 LU', 'KLX 150BF', 'Reza ', 'O009', 'Top 1 Oil Action Plus', 26500, 2, 53000, 55000, 2000, 'M01'),
('P005', 'AD 5784 LU', 'KLX 150BF', 'Reza ', 'O007', 'AHM MPX 4T', 29000, 2, 58000, 60000, 2000, 'M01'),
('T01', 'AD 5784 LU', 'KLX 150BF', 'Reza ', 'O001', 'Castrol Oil Active Extra 4T', 26000, 2, 104000, 150000, 46000, 'M01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_akses`
--
ALTER TABLE `tbl_akses`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`kd_kategori`);

--
-- Indeks untuk tabel `tbl_mekanik`
--
ALTER TABLE `tbl_mekanik`
  ADD PRIMARY KEY (`id_mekanik`);

--
-- Indeks untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`no_polisi`);

--
-- Indeks untuk tabel `tbl_sparepart`
--
ALTER TABLE `tbl_sparepart`
  ADD PRIMARY KEY (`id_part`),
  ADD KEY `kd_kategori` (`kd_kategori`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`kd_transaksi`),
  ADD KEY `id_mekanik` (`id_mekanik`),
  ADD KEY `id_part` (`id_part`),
  ADD KEY `no_polisi` (`no_polisi`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_sparepart`
--
ALTER TABLE `tbl_sparepart`
  ADD CONSTRAINT `tbl_sparepart_ibfk_1` FOREIGN KEY (`kd_kategori`) REFERENCES `tbl_kategori` (`kd_kategori`);

--
-- Ketidakleluasaan untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`id_mekanik`) REFERENCES `tbl_mekanik` (`id_mekanik`),
  ADD CONSTRAINT `tbl_transaksi_ibfk_2` FOREIGN KEY (`id_part`) REFERENCES `tbl_sparepart` (`id_part`),
  ADD CONSTRAINT `tbl_transaksi_ibfk_3` FOREIGN KEY (`no_polisi`) REFERENCES `tbl_pelanggan` (`no_polisi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2024 at 07:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_silawa`
--
CREATE DATABASE IF NOT EXISTS `db_silawa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_silawa`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `alamat`, `tgl_lahir`, `jabatan`, `password`) VALUES
(1, 'Agus Riyanto', 'Jl. Gatot Subroto No. 20, Jakarta', '1980-03-15', 'Manager', 'adminpass1'),
(2, 'Bambang Supriyadi', 'Jl. Jenderal Sudirman No. 30, Bandung', '1982-04-20', 'Supervisor', 'adminpass2'),
(3, 'Candra Wibowo', 'Jl. Sisingamangaraja No. 5, Surabaya', '1985-05-25', 'Kepala Bagian', 'adminpass3'),
(4, 'Diana Puspita', 'Jl. Raden Intan No. 7, Medan', '1987-06-10', 'Koordinator', 'adminpass4'),
(5, 'Erwin Saputra', 'Jl. MH Thamrin No. 9, Yogyakarta', '1989-07-30', 'Asisten Manager', 'adminpass5');

-- --------------------------------------------------------

--
-- Table structure for table `admin_penugasan`
--

DROP TABLE IF EXISTS `admin_penugasan`;
CREATE TABLE `admin_penugasan` (
  `id_penugasan` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_penugasan`
--

INSERT INTO `admin_penugasan` (`id_penugasan`, `id_admin`, `status`) VALUES
(1, 1, 'Diterima'),
(2, 2, 'Ditolak'),
(3, 3, 'Dalam Proses'),
(4, 4, 'Diterima'),
(5, 5, 'Selesai');

-- --------------------------------------------------------

--
-- Stand-in structure for view `baseview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `baseview`;
CREATE TABLE `baseview` (
`nik_warga` varchar(20)
,`nama` varchar(100)
,`alamat` text
,`tgl_lahir` date
,`jenis_kelamin` enum('Laki-laki','Perempuan')
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `detail_laporan`
--

DROP TABLE IF EXISTS `detail_laporan`;
CREATE TABLE `detail_laporan` (
  `id_detail` int(11) NOT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_laporan`
--

INSERT INTO `detail_laporan` (`id_detail`, `id_laporan`, `lampiran`, `keterangan`) VALUES
(1, 1, 'lampiran1.pdf', 'Foto kejadian kebakaran.'),
(2, 2, 'lampiran2.pdf', 'Dokumentasi jalan berlubang.'),
(3, 3, 'lampiran3.pdf', 'Foto tumpukan sampah.'),
(4, 4, 'lampiran4.pdf', 'Foto aspal retak.'),
(5, 5, 'lampiran5.pdf', 'Foto CCTV rumah.');

-- --------------------------------------------------------

--
-- Stand-in structure for view `finalview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `finalview`;
CREATE TABLE `finalview` (
`nik_warga` varchar(20)
,`nama` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `horizontalview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `horizontalview`;
CREATE TABLE `horizontalview` (
`nik_warga` varchar(20)
,`nama` varchar(100)
,`alamat` text
);

-- --------------------------------------------------------

--
-- Table structure for table `indexedwarga`
--

DROP TABLE IF EXISTS `indexedwarga`;
CREATE TABLE `indexedwarga` (
  `nik_warga` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `klasifikasi`
--

DROP TABLE IF EXISTS `klasifikasi`;
CREATE TABLE `klasifikasi` (
  `id_klasifikasi` int(11) NOT NULL,
  `nama_klasifikasi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klasifikasi`
--

INSERT INTO `klasifikasi` (`id_klasifikasi`, `nama_klasifikasi`) VALUES
(1, 'Fasilitas Umum'),
(2, 'Pelayanan Publik'),
(3, 'Bencana Alam'),
(4, 'Keamanan'),
(5, 'Kebakaran'),
(6, 'Kebersihan');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

DROP TABLE IF EXISTS `laporan`;
CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL,
  `nik_warga` varchar(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `id_klasifikasi` int(11) DEFAULT NULL,
  `lokasi` text DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `nik_warga`, `tanggal`, `status`, `id_admin`, `id_klasifikasi`, `lokasi`, `deskripsi`) VALUES
(1, 'NIK001', '2024-01-01', 'Pending', 1, 5, 'Jl. Merdeka No. 10, Jakarta', 'Kebakaran di area perumahan.'),
(2, 'NIK002', '2024-02-01', 'Selesai', 2, 1, 'Jl. Kemerdekaan No. 5, Bandung', 'Jalan berlubang di wilayah selatan.'),
(3, 'NIK003', '2024-03-01', 'Dalam Proses', 3, 6, 'Jl. Sudirman No. 15, Surabaya', 'Tumpukan sampah di daerah barat.'),
(4, 'NIK004', '2024-04-01', 'Pending', 4, 1, 'Jl. Diponegoro No. 8, Medan', 'Aspal retak di perempatan.'),
(5, 'NIK005', '2024-05-01', 'Selesai', 5, 4, 'Jl. Kartini No. 12, Yogyakarta', 'Tindak pencurian di Jl. Kartini No. 10.');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `action` varchar(50) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text DEFAULT NULL,
  `action_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id_log`, `action`, `table_name`, `old_data`, `new_data`, `action_time`) VALUES
(17, 'BEFORE INSERT', 'Warga', NULL, 'nik_warga: NIK007, nama: Hidayah Renaz', '2024-06-30 14:02:32'),
(18, 'AFTER INSERT', 'Warga', NULL, 'nik_warga: NIK007, nama: Hidayah Renaz', '2024-06-30 14:02:32'),
(19, 'BEFORE UPDATE', 'Warga', 'nik_warga: NIK006, nama: Rachmasari Annisa', 'nik_warga: NIK008, nama: Rachmasari Annisa', '2024-06-30 14:03:26'),
(20, 'AFTER UPDATE', 'Warga', 'nik_warga: NIK006, nama: Rachmasari Annisa', 'nik_warga: NIK008, nama: Rachmasari Annisa', '2024-06-30 14:03:26'),
(23, 'BEFORE DELETE', 'Warga', 'nik_warga: NIK005, nama: Eko Prasetya', NULL, '2024-06-30 14:06:47'),
(24, 'AFTER DELETE', 'Warga', 'nik_warga: NIK005, nama: Eko Prasetya', NULL, '2024-06-30 14:06:47'),
(25, 'BEFORE INSERT', 'Warga', NULL, 'nik_warga: NIK005, nama: Eko Prasetyo', '2024-06-30 14:08:50'),
(26, 'AFTER INSERT', 'Warga', NULL, 'nik_warga: NIK005, nama: Eko Prasetyo', '2024-06-30 14:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `penugasan`
--

DROP TABLE IF EXISTS `penugasan`;
CREATE TABLE `penugasan` (
  `id_penugasan` int(11) NOT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penugasan`
--

INSERT INTO `penugasan` (`id_penugasan`, `id_laporan`, `tgl_mulai`, `tgl_selesai`) VALUES
(1, 1, '2024-01-02', '2024-01-05'),
(2, 2, '2024-02-02', '2024-02-06'),
(3, 3, '2024-03-02', '2024-03-05'),
(4, 4, '2024-04-02', '2024-04-06'),
(5, 5, '2024-05-02', '2024-05-07');

-- --------------------------------------------------------

--
-- Stand-in structure for view `verticalview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `verticalview`;
CREATE TABLE `verticalview` (
`nik_warga` varchar(20)
,`nama` varchar(100)
,`tgl_lahir` date
);

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

DROP TABLE IF EXISTS `warga`;
CREATE TABLE `warga` (
  `nik_warga` varchar(20) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warga`
--

INSERT INTO `warga` (`nik_warga`, `nama`, `alamat`, `tgl_lahir`, `jenis_kelamin`, `password`) VALUES
('NIK001', 'Ahmad Setiawan', 'Jl. Merdeka No. 10, Jakarta', '1985-06-15', 'Laki-laki', 'password1'),
('NIK002', 'Budi Santoso', 'Jl. Kemerdekaan No. 5, Bandung', '1990-07-20', 'Laki-laki', 'password2'),
('NIK003', 'Citra Anggraini', 'Jl. Sudirman No. 15, Surabaya', '1995-08-25', 'Perempuan', 'password3'),
('NIK004', 'Dewi Kartika', 'Jl. Diponegoro No. 8, Medan', '1988-09-10', 'Perempuan', 'password4'),
('NIK005', 'Eko Prasetyo', 'Jl. Kartini No. 12, Yogyakarta', '1992-10-30', 'Laki-laki', 'password5'),
('NIK007', 'Hidayah Renaz', 'Jl. Ring Road, Yogyakarta', '2004-07-01', 'Laki-laki', 'password7'),
('NIK008', 'Rachmasari Annisa', 'Jl. Solo, Yogyakarta', '2003-11-01', 'Perempuan', 'password6');

--
-- Triggers `warga`
--
DROP TRIGGER IF EXISTS `AfterDeleteWarga`;
DELIMITER $$
CREATE TRIGGER `AfterDeleteWarga` AFTER DELETE ON `warga` FOR EACH ROW BEGIN
    INSERT INTO Log (action, table_name, old_data) 
    VALUES ('AFTER DELETE', 'Warga', CONCAT('nik_warga: ', OLD.nik_warga, ', nama: ', OLD.nama));
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `AfterInsertWarga`;
DELIMITER $$
CREATE TRIGGER `AfterInsertWarga` AFTER INSERT ON `warga` FOR EACH ROW BEGIN
    INSERT INTO Log (action, table_name, new_data) 
    VALUES ('AFTER INSERT', 'Warga', CONCAT('nik_warga: ', NEW.nik_warga, ', nama: ', NEW.nama));
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `AfterUpdateWarga`;
DELIMITER $$
CREATE TRIGGER `AfterUpdateWarga` AFTER UPDATE ON `warga` FOR EACH ROW BEGIN
    INSERT INTO Log (action, table_name, old_data, new_data) 
    VALUES ('AFTER UPDATE', 'Warga', CONCAT('nik_warga: ', OLD.nik_warga, ', nama: ', OLD.nama),
            CONCAT('nik_warga: ', NEW.nik_warga, ', nama: ', NEW.nama));
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `BeforeDeleteWarga`;
DELIMITER $$
CREATE TRIGGER `BeforeDeleteWarga` BEFORE DELETE ON `warga` FOR EACH ROW BEGIN
    INSERT INTO Log (action, table_name, old_data) 
    VALUES ('BEFORE DELETE', 'Warga', CONCAT('nik_warga: ', OLD.nik_warga, ', nama: ', OLD.nama));
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `BeforeInsertWarga`;
DELIMITER $$
CREATE TRIGGER `BeforeInsertWarga` BEFORE INSERT ON `warga` FOR EACH ROW BEGIN
    INSERT INTO Log (action, table_name, new_data) 
    VALUES ('BEFORE INSERT', 'Warga', CONCAT('nik_warga: ', NEW.nik_warga, ', nama: ', NEW.nama));
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `BeforeUpdateWarga`;
DELIMITER $$
CREATE TRIGGER `BeforeUpdateWarga` BEFORE UPDATE ON `warga` FOR EACH ROW BEGIN
    INSERT INTO Log (action, table_name, old_data, new_data) 
    VALUES ('BEFORE UPDATE', 'Warga', CONCAT('nik_warga: ', OLD.nik_warga, ', nama: ', OLD.nama),
            CONCAT('nik_warga: ', NEW.nik_warga, ', nama: ', NEW.nama));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `baseview`
--
DROP TABLE IF EXISTS `baseview`;

DROP VIEW IF EXISTS `baseview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `baseview`  AS SELECT `warga`.`nik_warga` AS `nik_warga`, `warga`.`nama` AS `nama`, `warga`.`alamat` AS `alamat`, `warga`.`tgl_lahir` AS `tgl_lahir`, `warga`.`jenis_kelamin` AS `jenis_kelamin`, `warga`.`password` AS `password` FROM `warga` WHERE `warga`.`jenis_kelamin` = 'Laki-laki' ;

-- --------------------------------------------------------

--
-- Structure for view `finalview`
--
DROP TABLE IF EXISTS `finalview`;

DROP VIEW IF EXISTS `finalview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `finalview`  AS SELECT `baseview`.`nik_warga` AS `nik_warga`, `baseview`.`nama` AS `nama` FROM `baseview`WITH CASCADED CHECK OPTION  ;

-- --------------------------------------------------------

--
-- Structure for view `horizontalview`
--
DROP TABLE IF EXISTS `horizontalview`;

DROP VIEW IF EXISTS `horizontalview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `horizontalview`  AS SELECT `warga`.`nik_warga` AS `nik_warga`, `warga`.`nama` AS `nama`, `warga`.`alamat` AS `alamat` FROM `warga` ;

-- --------------------------------------------------------

--
-- Structure for view `verticalview`
--
DROP TABLE IF EXISTS `verticalview`;

DROP VIEW IF EXISTS `verticalview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `verticalview`  AS SELECT `warga`.`nik_warga` AS `nik_warga`, `warga`.`nama` AS `nama`, `warga`.`tgl_lahir` AS `tgl_lahir` FROM `warga` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `idx_nama_jabatan` (`nama`,`jabatan`);

--
-- Indexes for table `admin_penugasan`
--
ALTER TABLE `admin_penugasan`
  ADD PRIMARY KEY (`id_penugasan`,`id_admin`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `detail_laporan`
--
ALTER TABLE `detail_laporan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `indexedwarga`
--
ALTER TABLE `indexedwarga`
  ADD KEY `nik_warga` (`nik_warga`,`nama`);

--
-- Indexes for table `klasifikasi`
--
ALTER TABLE `klasifikasi`
  ADD PRIMARY KEY (`id_klasifikasi`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `nik_warga` (`nik_warga`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_klasifikasi` (`id_klasifikasi`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `penugasan`
--
ALTER TABLE `penugasan`
  ADD PRIMARY KEY (`id_penugasan`),
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`nik_warga`),
  ADD KEY `idx_nama_alamat` (`nik_warga`,`nama`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detail_laporan`
--
ALTER TABLE `detail_laporan`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `klasifikasi`
--
ALTER TABLE `klasifikasi`
  MODIFY `id_klasifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `penugasan`
--
ALTER TABLE `penugasan`
  MODIFY `id_penugasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_penugasan`
--
ALTER TABLE `admin_penugasan`
  ADD CONSTRAINT `admin_penugasan_ibfk_1` FOREIGN KEY (`id_penugasan`) REFERENCES `penugasan` (`id_penugasan`),
  ADD CONSTRAINT `admin_penugasan_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `detail_laporan`
--
ALTER TABLE `detail_laporan`
  ADD CONSTRAINT `detail_laporan_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`);

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`nik_warga`) REFERENCES `warga` (`nik_warga`),
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `laporan_ibfk_3` FOREIGN KEY (`id_klasifikasi`) REFERENCES `klasifikasi` (`id_klasifikasi`);

--
-- Constraints for table `penugasan`
--
ALTER TABLE `penugasan`
  ADD CONSTRAINT `penugasan_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

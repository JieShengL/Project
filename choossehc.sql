-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2023 at 06:00 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `choossehc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `login_id` varchar(10) NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `kata_laluan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`login_id`, `nama_admin`, `kata_laluan`) VALUES
('adminJJ', 'Jason', '717a579e934b79377a5b0c69e4aabc48\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE `bahan` (
  `kod_bahan` varchar(8) NOT NULL,
  `bahan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan`
--

INSERT INTO `bahan` (`kod_bahan`, `bahan`) VALUES
('GL', 'kaca'),
('PL', 'plastik'),
('WD', 'kayu');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `login_id` varchar(10) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kata_laluan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`login_id`, `nama`, `kata_laluan`) VALUES
('userJJ', 'Jason', '472d46cb829018f9dbd65fb8479a49bb');

-- --------------------------------------------------------

--
-- Table structure for table `set_catur`
--

CREATE TABLE `set_catur` (
  `kod_produk` varchar(10) NOT NULL,
  `nama_set` varchar(255) NOT NULL,
  `kod_bahan` varchar(8) NOT NULL,
  `saiz_papan` int(255) NOT NULL,
  `warna_papan` varchar(255) NOT NULL,
  `id_admin` varchar(10) NOT NULL,
  `penerangan` text,
  `gambar` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `set_catur`
--

INSERT INTO `set_catur` (`kod_produk`, `nama_set`, `kod_bahan`, `saiz_papan`, `warna_papan`, `id_admin`, `penerangan`, `gambar`) VALUES
('GL9999', 'Glass Chess Set', 'GL', 50, 'putih/kelabu', 'adminJJ', NULL, ''),
('PL1220', 'Tournament Chess Set', 'PL', 53, 'hijau/putih', 'adminJJ', NULL, ''),
('PL7745', 'Travel Chess Set', 'PL', 25, 'hitam/putih', 'adminJJ', NULL, ''),
('PL7878', 'DGT Chess Set', 'PL', 53, 'perang/kuning', 'adminJJ', NULL, ''),
('WD3355', 'Staunton Chess Set', 'WD', 40, 'perang/kuning', 'adminJJ', NULL, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`kod_bahan`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `set_catur`
--
ALTER TABLE `set_catur`
  ADD PRIMARY KEY (`kod_produk`) USING BTREE,
  ADD KEY `kod_bahan` (`kod_bahan`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `set_catur`
--
ALTER TABLE `set_catur`
  ADD CONSTRAINT `set_catur_ibfk_1` FOREIGN KEY (`kod_bahan`) REFERENCES `bahan` (`kod_bahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `set_catur_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

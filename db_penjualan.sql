-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 12, 2024 at 09:52 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int NOT NULL,
  `nik` bigint DEFAULT NULL,
  `nama` char(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `member` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `nama`, `telp`, `email`, `alamat`, `member`) VALUES
(55, 2345678901234567, 'Jane Smith', '082345678901', 'jane.smith@example.com', 'Jl. Sudirman No. 2, Bandung', 'non-member'),
(56, 3456789012345678, 'Alice Johnson', '083456789012', 'alice.johnson@example.com', 'Jl. Thamrin No. 3, Surabaya', 'member'),
(57, 4567890123456789, 'Bob Brown', '084567890123', 'bob.brown@example.com', 'Jl. Gatot Subroto No. 4, Medan', 'non-member'),
(58, 5678901234567890, 'Charlie Davis', '085678901234', 'charlie.davis@example.com', 'Jl. Diponegoro No. 5, Semarang', 'member'),
(59, 6789012345678901, 'Diana Evans', '086789012345', 'diana.evans@example.com', 'Jl. Pahlawan No. 6, Makassar', 'non-member'),
(60, 7890123456789012, 'Evan Foster', '087890123456', 'evan.foster@example.com', 'Jl. Hasanuddin No. 7, Palembang', 'member'),
(61, 8901234567890123, 'Fiona Green', '088901234567', 'fiona.green@example.com', 'Jl. Kartini No. 8, Yogyakarta', 'non-member'),
(62, 9012345678901234, 'George Harris', '089012345678', 'george.harris@example.com', 'Jl. Dipatiukur No. 9, Malang', 'member'),
(63, 1023456789012345, 'Hannah Ivers', '080123456789', 'hannah.ivers@example.com', 'Jl. Braga No. 10, Denpasar', 'non-member'),
(64, 2345678901234567, 'Jane Smith', '082345678901', 'jane.smith@example.com', 'Jl. Sudirman No. 2, Bandung', 'non-member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2025 at 02:42 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kedai`
--

-- --------------------------------------------------------

--
-- Table structure for table `bandingan`
--

CREATE TABLE `bandingan` (
  `idbandingan` int(11) NOT NULL,
  `idpembeli` varchar(4) DEFAULT NULL,
  `idproduk` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bandingan`
--

INSERT INTO `bandingan` (`idbandingan`, `idpembeli`, `idproduk`) VALUES
(307, 'P055', 'IP13'),
(308, 'P055', 'IP14');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `idpembeli` varchar(4) NOT NULL,
  `password` varchar(8) DEFAULT NULL,
  `namapembeli` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`idpembeli`, `password`, `namapembeli`) VALUES
('', '', ''),
('P045', '6567', 'Lukas'),
('P055', '123490', 'Aman'),
('P099', '7890', 'Degh'),
('P105', '7890', 'John\r\n'),
('P106', '9088', 'Danh'),
('P145', '1098', 'Patton'),
('P199', '34456', 'Owain');

-- --------------------------------------------------------

--
-- Table structure for table `penjual`
--

CREATE TABLE `penjual` (
  `idpenjual` varchar(3) NOT NULL,
  `password` varchar(8) DEFAULT NULL,
  `namapenjual` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjual`
--

INSERT INTO `penjual` (`idpenjual`, `password`, `namapenjual`) VALUES
('123', '1234567', 'chinn'),
('456', '1234785', 'Viewww'),
('J01', '5678', 'Lohn\r\n'),
('J02', '1234', 'Hugo'),
('P10', '7890', 'd');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` varchar(4) NOT NULL,
  `namaproduk` varchar(30) DEFAULT NULL,
  `butiran` varchar(100) DEFAULT NULL,
  `gambar` varchar(20) DEFAULT NULL,
  `harga` decimal(6,2) DEFAULT NULL,
  `idpenjual` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `namaproduk`, `butiran`, `gambar`, `harga`, `idpenjual`) VALUES
('IP13', 'Iphone 13', '                                                                                    Apple A15 Bionic', 'IP13.png', '3199.00', '123'),
('IP14', 'Iphone 14 ', '                                                            A16 Bionic Chip\r\n512GB Storage\r\n6GB Ram ', 'IP14.png', '7899.00', '123'),
('SG23', 'Samsung Galaxy s23', 'Snapdragon 8 gen 2\r\n256 GB\r\n12GB Ram\r\nOcta core', 'SG23.png', '3899.00', '123'),
('SGZ', 'Samsung Z Fold 5', '            Qualcomm SM8550-AC Snapdragon 8 Gen 2 12GB Ram 256GB Storage', 'SGZ.png', '6399.00', '123'),
('VI20', 'Vivo Y20', 'SDM460 6GB Ram 64GB Storage', 'VI20.png', '699.00', '123'),
('XIMI', 'Xiaomi Mi 11', '                        Qualcomm SM8350 Snapdragon 888 8GB Ram 128GB Storage', 'XIMI.png', '1899.00', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bandingan`
--
ALTER TABLE `bandingan`
  ADD PRIMARY KEY (`idbandingan`),
  ADD KEY `idpembeli` (`idpembeli`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`idpembeli`);

--
-- Indexes for table `penjual`
--
ALTER TABLE `penjual`
  ADD PRIMARY KEY (`idpenjual`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idpenjual` (`idpenjual`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bandingan`
--
ALTER TABLE `bandingan`
  MODIFY `idbandingan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bandingan`
--
ALTER TABLE `bandingan`
  ADD CONSTRAINT `bandingan_pembeli` FOREIGN KEY (`idpembeli`) REFERENCES `pembeli` (`idpembeli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bandingan_produk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_penjual` FOREIGN KEY (`idpenjual`) REFERENCES `penjual` (`idpenjual`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

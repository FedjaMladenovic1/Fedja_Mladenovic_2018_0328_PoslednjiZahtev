-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2021 at 08:26 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utakmice`
--

-- --------------------------------------------------------

--
-- Table structure for table `ekipa`
--

CREATE TABLE `ekipa` (
  `id_ekipa` int(11) NOT NULL,
  `naziv_ekipa` varchar(30) NOT NULL,
  `grad_ekipa` varchar(20) NOT NULL,
  `trener` varchar(30) NOT NULL,
  `bodovi` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ekipa`
--

INSERT INTO `ekipa` (`id_ekipa`, `naziv_ekipa`, `grad_ekipa`, `trener`, `bodovi`) VALUES
(1, 'Crvena Zvezda', 'Beograd', 'Neki Trener', 3),
(2, 'Partizan', 'Beograd', 'Neki Trener', 3);

-- --------------------------------------------------------

--
-- Table structure for table `utakmica`
--

CREATE TABLE `utakmica` (
  `id_utakmica` int(11) NOT NULL,
  `id_domacin` int(11) NOT NULL,
  `broj_poena_domacin` int(11) NOT NULL DEFAULT 0,
  `id_gost` int(11) NOT NULL,
  `broj_poena_gost` int(11) NOT NULL DEFAULT 0,
  `datum` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utakmica`
--

INSERT INTO `utakmica` (`id_utakmica`, `id_domacin`, `broj_poena_domacin`, `id_gost`, `broj_poena_gost`, `datum`) VALUES
(2, 2, 100, 1, 85, '2021-03-09'),
(3, 2, 80, 1, 90, '2021-03-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ekipa`
--
ALTER TABLE `ekipa`
  ADD PRIMARY KEY (`id_ekipa`),
  ADD UNIQUE KEY `naziv_ekipa` (`naziv_ekipa`);

--
-- Indexes for table `utakmica`
--
ALTER TABLE `utakmica`
  ADD PRIMARY KEY (`id_utakmica`),
  ADD KEY `id_domacin` (`id_domacin`),
  ADD KEY `id_gost` (`id_gost`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ekipa`
--
ALTER TABLE `ekipa`
  MODIFY `id_ekipa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `utakmica`
--
ALTER TABLE `utakmica`
  MODIFY `id_utakmica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `utakmica`
--
ALTER TABLE `utakmica`
  ADD CONSTRAINT `utakmica_ibfk_1` FOREIGN KEY (`id_domacin`) REFERENCES `ekipa` (`id_ekipa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utakmica_ibfk_2` FOREIGN KEY (`id_gost`) REFERENCES `ekipa` (`id_ekipa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

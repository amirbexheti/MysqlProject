-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2023 at 05:41 PM
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
-- Database: `fakullteti`
--

-- --------------------------------------------------------

--
-- Table structure for table `fakullteti`
--

CREATE TABLE `fakullteti` (
  `ID` int(11) NOT NULL,
  `Emri` varchar(50) NOT NULL,
  `Llokacioni` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lendet`
--

CREATE TABLE `lendet` (
  `ID` int(11) NOT NULL,
  `Emri` varchar(50) NOT NULL,
  `Gjuha` varchar(50) NOT NULL,
  `ID_Fakulteti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notat`
--

CREATE TABLE `notat` (
  `ID` int(11) NOT NULL,
  `ID_Studenti` int(11) NOT NULL,
  `ID_Lendet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profesoret`
--

CREATE TABLE `profesoret` (
  `ID` int(11) NOT NULL,
  `Emri` varchar(50) NOT NULL,
  `Mbiemri` varchar(50) NOT NULL,
  `NR Amez` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ID_Fakulteti` int(11) NOT NULL,
  `ID_Lendet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `studenti`
--

CREATE TABLE `studenti` (
  `ID` int(11) NOT NULL,
  `Emri` varchar(50) NOT NULL,
  `Mbiemri` varchar(50) NOT NULL,
  `NR Amez` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ID_Fakulteti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fakullteti`
--
ALTER TABLE `fakullteti`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lendet`
--
ALTER TABLE `lendet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_LendetFakullteti` (`ID_Fakulteti`);

--
-- Indexes for table `notat`
--
ALTER TABLE `notat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_NotatLendet` (`ID_Lendet`),
  ADD KEY `FK_NotatStudentet` (`ID_Studenti`);

--
-- Indexes for table `profesoret`
--
ALTER TABLE `profesoret`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_ProfesoretFakulltetet` (`ID_Fakulteti`),
  ADD KEY `fk_ProfesoretLendet` (`ID_Lendet`);

--
-- Indexes for table `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_StudentiFakullteti` (`ID_Fakulteti`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lendet`
--
ALTER TABLE `lendet`
  ADD CONSTRAINT `fk_LendetFakullteti` FOREIGN KEY (`ID_Fakulteti`) REFERENCES `fakullteti` (`ID`);

--
-- Constraints for table `notat`
--
ALTER TABLE `notat`
  ADD CONSTRAINT `FK_NotatLendet` FOREIGN KEY (`ID_Lendet`) REFERENCES `lendet` (`ID`),
  ADD CONSTRAINT `FK_NotatStudentet` FOREIGN KEY (`ID_Studenti`) REFERENCES `studenti` (`ID`);

--
-- Constraints for table `profesoret`
--
ALTER TABLE `profesoret`
  ADD CONSTRAINT `fk_ProfesoretFakulltetet` FOREIGN KEY (`ID_Fakulteti`) REFERENCES `fakullteti` (`ID`),
  ADD CONSTRAINT `fk_ProfesoretLendet` FOREIGN KEY (`ID_Lendet`) REFERENCES `lendet` (`ID`);

--
-- Constraints for table `studenti`
--
ALTER TABLE `studenti`
  ADD CONSTRAINT `FK_StudentiFakullteti` FOREIGN KEY (`ID_Fakulteti`) REFERENCES `fakullteti` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2024 at 09:29 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `univrab_surat`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `kop` varchar(255) DEFAULT NULL,
  `label_unit` varchar(255) NOT NULL,
  `auto_no` enum('0','1') NOT NULL DEFAULT '0',
  `no_surat` varchar(255) DEFAULT NULL,
  `no_agenda` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `theme`, `kop`, `label_unit`, `auto_no`, `no_surat`, `no_agenda`, `created_at`) VALUES
(1, 1, 'light', NULL, 'ADMIN', '0', '{URUTAN}/{LABEL}.{BULAN}.{TAHUN}', '{URUTAN}/{LABEL}.{BULAN}.{TAHUN}', '2022-11-14 07:40:17'),
(2, 109, 'light', NULL, '', '0', NULL, NULL, '2022-11-23 08:02:19'),
(3, 35, NULL, NULL, 'REKTOR', '0', '{URUTAN}/{LABEL}.{BULAN}.{TAHUN}', '{URUTAN}/{LABEL}.{BULAN}.{TAHUN}', '2022-11-24 03:01:43'),
(4, 50, 'light', NULL, 'KSI', '0', '1/KSI-UNIVRAB/01/2023', '1/KSI-UNIVRAB/01/2023', '2022-11-30 08:33:40'),
(5, 202, 'light', NULL, '', '0', NULL, NULL, '2022-12-08 06:11:19'),
(6, 200, 'light', NULL, '', '0', NULL, NULL, '2023-01-16 02:22:07'),
(7, 76, NULL, NULL, 'S1 Farmasi-UNIVRAB', '0', '1/S1 Farmasi-UNIVRAB/II/2023', '1/S1 Farmasi-UNIVRAB/II/2023', '2023-02-06 02:56:22'),
(8, 45, 'light', NULL, '', '0', NULL, NULL, '2023-02-17 09:52:05'),
(9, 287, 'dark', NULL, '', '0', NULL, NULL, '2023-02-17 09:53:42'),
(10, 49, 'light', NULL, 'WR.III-UNIVRAB', '0', '009/WR.III-UNIVRAB/III/2023', '001/WR.III-UNIVRAB/III/2023', '2023-03-02 08:30:19'),
(11, 39, 'light', NULL, '', '0', NULL, NULL, '2023-03-16 08:38:48'),
(12, 217, 'light', NULL, '', '0', NULL, NULL, '2023-05-23 04:38:14'),
(13, 324, 'dark', NULL, '', '0', NULL, NULL, '2023-06-08 07:15:57'),
(14, 211, 'light', NULL, 'IK-UNIVRAB', '0', '/IK-UNIVRAB/A/VI/2023', '/IK-UNIVRAB/A/VI/2023', '2023-06-23 03:50:12'),
(15, 335, 'dark', NULL, '', '0', NULL, NULL, '2023-07-21 04:43:19'),
(16, 80, 'light', NULL, '', '0', NULL, NULL, '2023-07-24 04:47:26'),
(17, 323, 'light', NULL, '', '0', NULL, NULL, '2023-07-25 04:30:25'),
(18, 57, 'light', NULL, '', '0', NULL, NULL, '2023-08-10 02:56:34'),
(19, 185, 'light', NULL, '', '0', NULL, NULL, '2023-08-11 02:02:49'),
(20, 306, 'light', NULL, '', '0', NULL, NULL, '2023-08-30 02:47:57'),
(21, 145, 'light', NULL, '', '0', NULL, NULL, '2023-09-04 03:00:11'),
(22, 296, 'light', NULL, '', '0', NULL, NULL, '2023-09-07 10:47:25'),
(23, 91, 'light', NULL, '', '0', NULL, NULL, '2023-09-08 01:17:33'),
(24, 332, 'dark', NULL, '', '0', NULL, NULL, '2023-09-15 04:55:47'),
(25, 56, 'dark', NULL, '', '0', NULL, NULL, '2023-09-29 01:24:50'),
(26, 51, 'dark', NULL, '', '0', NULL, NULL, '2023-09-29 04:33:52'),
(27, 38, 'light', NULL, '', '0', NULL, NULL, '2023-10-13 01:19:24'),
(28, 314, 'light', NULL, '', '0', NULL, NULL, '2023-10-20 02:49:58'),
(29, 289, 'light', NULL, '', '0', NULL, NULL, '2023-10-26 02:23:42'),
(30, 232, 'light', NULL, '', '0', NULL, NULL, '2023-10-27 03:19:00'),
(31, 297, NULL, NULL, 'LPPM', '0', '001/LPPM-UNIVRAB/X/2023', '001/LPPM-UNIVRAB/X/2023', '2023-10-27 03:51:34'),
(32, 272, 'dark', NULL, '', '0', NULL, NULL, '2023-11-17 02:24:07'),
(33, 285, 'light', NULL, '', '0', NULL, NULL, '2023-12-08 01:35:55'),
(34, 182, 'light', NULL, '', '0', NULL, NULL, '2023-12-22 02:17:00'),
(35, 370, 'light', NULL, '', '0', NULL, NULL, '2024-01-05 03:43:55'),
(36, 374, 'light', NULL, '', '0', NULL, NULL, '2024-01-09 05:06:26'),
(37, 375, 'light', NULL, '', '0', NULL, NULL, '2024-01-10 07:06:04'),
(38, 304, 'light', NULL, '', '0', NULL, NULL, '2024-01-23 02:45:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_setting`
--
ALTER TABLE `user_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

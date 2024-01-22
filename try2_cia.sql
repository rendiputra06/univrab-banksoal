-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2022 at 06:10 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `try2_cia`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'member', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `logger`
--

CREATE TABLE `logger` (
  `id` bigint(20) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `token` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `keep_data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logger`
--

INSERT INTO `logger` (`id`, `created_on`, `created_by`, `type`, `type_id`, `token`, `comment`, `keep_data`) VALUES
(9, '2022-07-17 15:10:53', 1, 'group', 10, 'create', 'Membuat Group Baru', NULL),
(10, '2022-07-17 15:29:24', 1, 'group', 3, 'delete', 'Menghapus Data Group', '{"id":"3","name":"publik","description":"Public"}'),
(11, '2022-07-17 15:31:59', 1, 'users', 12, 'delete', 'Menghapus Akun', '{"id":"12","ip_address":"::1","username":"1755201031","password":"$2y$08$\\/DFtqpKbGx66DTkLf6p9PeaVutoQMHdt\\/I9Ns\\/E5SPLY7yAGXDHCa","salt":null,"email":"budiman@gmail.com","activation_code":null,"active_code":null,"forgotten_password_code":null,"forgotten_password_time":null,"remember_code":null,"created_on":"1655799455","last_login":"1655957381","active":"0","activation":"0","first_name":"Budiman","last_name":"","company":"Universitas Abdurrab","phone":"--","img_name":"default.png"}'),
(12, '2022-07-17 15:40:08', 1, 'navi', 19, 'create', 'Membuat Menu baru', ''),
(13, '2022-07-17 15:40:31', 1, 'navi', 19, 'update', 'Mengubah data Menu', ''),
(14, '2022-07-17 15:40:48', 1, 'users', 19, 'delete', 'Menghapus Menu', '{"conn_id":{"affected_rows":null,"client_info":null,"client_version":null,"connect_errno":null,"connect_error":null,"errno":null,"error":null,"error_list":null,"field_count":null,"host_info":null,"info":null,"insert_id":null,"server_info":null,"server_version":null,"stat":null,"sqlstate":null,"protocol_version":null,"thread_id":null,"warning_count":null},"result_id":{"current_field":null,"field_count":null,"lengths":null,"num_rows":null,"type":null},"result_array":[],"result_object":[],"custom_result_object":[],"current_row":0,"num_rows":null,"row_data":null}'),
(15, '2022-07-17 15:45:29', 1, 'users', 1, 'update', 'Mengubah Profile', '');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `active` int(1) NOT NULL,
  `parent` int(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE `menu_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`id`, `name`, `definition`) VALUES
(1, 'side menu', NULL),
(2, 'top menu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `navi`
--

CREATE TABLE `navi` (
  `id` int(11) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `icon_color` varchar(50) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `sort` smallint(6) NOT NULL,
  `parent` smallint(6) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `group_id` smallint(6) NOT NULL,
  `menu_type_id` char(2) NOT NULL,
  `active` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `navi`
--

INSERT INTO `navi` (`id`, `label`, `type`, `icon_color`, `link`, `sort`, `parent`, `icon`, `group_id`, `menu_type_id`, `active`) VALUES
(1, 'Main Navigation', 'label', NULL, 'dashboard', 1, 0, NULL, 0, '1', '1'),
(2, 'Dashboard', 'menu', NULL, 'dashboard', 2, 0, 'home', 0, '1', '1'),
(5, 'Menu', 'menu', NULL, 'menu', 5, 0, 'menu', 0, '1', '1'),
(14, 'Users', 'menu', NULL, 'users', 7, 17, 'user', 1, '1', '1'),
(15, 'Administrator', 'label', NULL, '', 3, 0, 'settings', 1, '1', '1'),
(16, 'Groups', 'menu', NULL, 'users/group', 8, 17, 'users', 1, '1', '1'),
(17, 'Account', 'menu', NULL, '', 4, 0, 'users', 1, '1', '1'),
(18, 'Settings', 'menu', NULL, 'settings', 6, 0, 'settings', 1, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `navi_groups`
--

CREATE TABLE `navi_groups` (
  `id` int(11) NOT NULL,
  `navi_id` int(11) NOT NULL,
  `group_id` mediumint(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `navi_groups`
--

INSERT INTO `navi_groups` (`id`, `navi_id`, `group_id`) VALUES
(2, 20, 2),
(4, 18, 2),
(5, 2, 1),
(6, 2, 2),
(7, 3, 1),
(8, 3, 2),
(9, 5, 1),
(10, 14, 1),
(11, 15, 1),
(12, 16, 1),
(13, 17, 1),
(14, 1, 1),
(15, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `kunci` varchar(255) DEFAULT NULL,
  `nilai` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `kunci`, `nilai`) VALUES
(1, 'system_name', 'Sistem Informasi'),
(2, 'system_title', 'Sistem Informasi'),
(3, 'system_email', 'rendisaputra@univrab.ac.id'),
(4, 'address', 'Jln Riau Ujung, Pekanbaru'),
(5, 'logo', 'logo-sm.svg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `active_code` varchar(6) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `activation` tinyint(1) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `img_name` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `active_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `activation`, `first_name`, `last_name`, `company`, `phone`, `img_name`) VALUES
(1, '::1', 'admin', '$2y$08$OZAhQBvMflbiMiIP0awePe9i8gCoGopgwYkkvW0kjQmqD0jb/kJNm', NULL, 'stikom@unbin.ac.id', NULL, '2CC567', NULL, NULL, NULL, 1589403512, 1658064350, 1, 1, 'Admin', 'Istrator', 'STIKOM', '08121902288', '616802648f9a503268e975367e2c9f78.jpg'),
(3, '::1', 'demouser', '$2y$08$njpz9WfhkfXjPKKA9e0QEORJM2NH5BC941yeDAi.e7qb3LU3.AkN.', NULL, 'rendi@gmail.com', NULL, 'E12E81', NULL, NULL, NULL, 1635170897, 1656303558, 1, 1, 'Rendi', 'Saputra', 'Universitas Abdurrab', '+6276138762', 'default.png'),
(14, '::1', '1755201001', '$2y$08$HZSjRjLfaVUbmzv5HXptf.mNXttItwdsUSOY6OIvdddMWPXVw1HLO', NULL, 'ari.muhammad@gmail.com', NULL, NULL, NULL, NULL, NULL, 1655958397, 1656335491, 1, 0, 'Ari', 'Muhammad', 'Universitas Abdurrab', '--', 'default.png'),
(15, '::1', '1755201002', '$2y$08$qTPOrBcVfSXxYyLw9xov/Ok3iaTLbcqXUszFd5rJ/PqeOQ//pY9xS', NULL, 'arianda@gmail.com', NULL, NULL, NULL, NULL, NULL, 1657985350, NULL, 1, 0, 'Arianda', 'Brimi', 'Universitas Abdurrab', '--', 'default.png');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(130, 3, 1),
(156, 1, 2),
(157, 14, 2),
(160, 15, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `logger`
--
ALTER TABLE `logger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navi`
--
ALTER TABLE `navi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navi_groups`
--
ALTER TABLE `navi_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `logger`
--
ALTER TABLE `logger`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `navi`
--
ALTER TABLE `navi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `navi_groups`
--
ALTER TABLE `navi_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

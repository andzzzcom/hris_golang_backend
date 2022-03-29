-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2022 at 09:18 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `golang_hris`
--

-- --------------------------------------------------------

--
-- Table structure for table `c_admins`
--

CREATE TABLE `c_admins` (
  `id_admin` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `born_place` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `status_active` int(11) NOT NULL,
  `creator` int(11) DEFAULT NULL,
  `last_updater` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_admins`
--

INSERT INTO `c_admins` (`id_admin`, `email`, `password`, `avatar`, `name`, `phone`, `address`, `born_place`, `gender`, `status_active`, `creator`, `last_updater`, `created_date`, `last_updated_date`) VALUES
(1, 'admin@gmail.com', '$2y$10$oo71oURavmzSkuovoZ7EwuuzkWZvIU9OI8QOv/S10JIXB63w0iuSi', 'admin.jpg', 'admin', '5512345', 'alamat default', 'Jakarta', 1, -1, NULL, NULL, '2022-03-25 07:56:52', '2022-03-27 15:07:11'),
(2, 'admin2@gmail.com', '', '1648368338.png', 'abdec', '234242342', 'asdasdasd', 'asdasdsad', 1, 1, 1, 1, '0000-00-00 00:00:00', '2022-03-27 15:05:38'),
(3, 'admin2@gmail.comasdasdasd', '$2y$10$ljSNERwW316jJQscmDF2/OW1R7q72WUeV1zdT84XNdZTwV1t.VFc2', '1648390051.PNG', 'tesasdassadasd', '123232', 'asdsdasd', 'adasdasd', 1, 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `c_departments`
--

CREATE TABLE `c_departments` (
  `id_department` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_active` int(11) NOT NULL,
  `creator` bigint(20) UNSIGNED NOT NULL,
  `last_updater` bigint(20) UNSIGNED NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_departments`
--

INSERT INTO `c_departments` (`id_department`, `name`, `status_active`, `creator`, `last_updater`, `created_date`, `last_updated`) VALUES
(1, 'tessss', 1, 1, 1, '2022-03-26 20:15:17', '2022-03-27 10:16:41'),
(2, 'department 2', 1, 1, 1, '2022-03-26 20:15:17', '2022-03-27 09:25:29'),
(3, 'Department Baru 5', -1, 1, 1, '0000-00-00 00:00:00', '2022-03-27 09:54:47');

-- --------------------------------------------------------

--
-- Table structure for table `c_designations`
--

CREATE TABLE `c_designations` (
  `id_designation` bigint(20) UNSIGNED NOT NULL,
  `id_department` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_active` int(11) NOT NULL,
  `creator` bigint(20) UNSIGNED NOT NULL,
  `last_updater` bigint(20) UNSIGNED NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_designations`
--

INSERT INTO `c_designations` (`id_designation`, `id_department`, `name`, `status_active`, `creator`, `last_updater`, `created_date`, `last_updated`) VALUES
(1, 1, 'testing', 1, 1, 1, '2022-03-26 19:59:31', '2022-03-26 19:59:31'),
(2, 1, 'tes', 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 'tessss', -1, 1, 1, '0000-00-00 00:00:00', '2022-03-27 10:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `c_employees`
--

CREATE TABLE `c_employees` (
  `id_employee` bigint(20) UNSIGNED NOT NULL,
  `id_designation` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `born_date` date NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_active` int(11) NOT NULL,
  `creator` bigint(20) UNSIGNED NOT NULL,
  `last_updater` bigint(20) UNSIGNED NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_employees`
--

INSERT INTO `c_employees` (`id_employee`, `id_designation`, `name`, `email`, `born_date`, `photo`, `gender`, `phone`, `address`, `salary`, `status_active`, `creator`, `last_updater`, `created_date`, `last_updated`) VALUES
(37, 1, 'hello', 'aaa@aaa.com', '2022-03-08', '1620194331.png', '1', '123123123', 'asdasdasd', '123123123123', 1, 1, 1, '0000-00-00 00:00:00', '2022-03-26 17:04:46'),
(38, 1, 'hello', 'aaa@aaa.com', '2022-03-08', '1620194331.png', '1', '123123123', 'asdasdasd', '123123123123', 1, 1, 1, '0000-00-00 00:00:00', '2022-03-26 17:04:46'),
(40, 1, 'hello', 'aaa@aaa.com', '2022-09-09', '1648380972.png', '1', '123123123', 'asdasdasd', '1234567', 1, 1, 1, '0000-00-00 00:00:00', '2022-03-27 18:36:12'),
(41, 1, 'hello', 'asdasdas@asdasd.com', '2022-09-09', '1648380927.png', '1', '123123213', 'asdasdasd', '1234567', 1, 1, 1, '0000-00-00 00:00:00', '2022-03-27 18:35:27'),
(42, 1, 'hello', 'asdasdas@asdasd.com', '2022-09-09', 'a.png', '1', '123123213', 'asdasdasd', '1234567', -1, 1, 1, '0000-00-00 00:00:00', '2022-03-26 17:36:34'),
(43, 1, 'hello', 'admin2@gmail.com', '2022-09-09', '1648285421.PNG', '1', '123213213', 'asdasdasdasdsad', '1234567', 1, 1, 1, '0000-00-00 00:00:00', '2022-03-26 17:04:46'),
(44, 1, 'hello', 'joko@gmail.com', '2022-09-09', '1648285451.PNG', '1', '12345678', 'adsasdasd', '1234567', 1, 1, 1, '0000-00-00 00:00:00', '2022-03-26 17:04:46'),
(45, 1, 'hai name', 'budi@gmail.com', '2022-09-09', '1648285623.png', '1', '1234567', 'asdasdasdsad', '1234567', 1, 1, 1, '0000-00-00 00:00:00', '2022-03-26 17:11:34'),
(46, 1, 'tes235', 'aaa@aaa.com', '2022-09-09', '1648289517.png', '1', '123123123', 'asdasdasd', '1234567', -1, 1, 1, '0000-00-00 00:00:00', '2022-03-26 17:28:58');

-- --------------------------------------------------------

--
-- Table structure for table `c_logs`
--

CREATE TABLE `c_logs` (
  `id_log` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_admin` bigint(20) UNSIGNED NOT NULL,
  `id_menu` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_logs`
--

INSERT INTO `c_logs` (`id_log`, `ip_address`, `id_admin`, `id_menu`, `action`, `created_date`) VALUES
(1, '127.0.0.1', 1, 6, 'login', '2022-03-25 07:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `c_menus`
--

CREATE TABLE `c_menus` (
  `id_menu` bigint(20) UNSIGNED NOT NULL,
  `name_menu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date_menu` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_date_menu` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_menus`
--

INSERT INTO `c_menus` (`id_menu`, `name_menu`, `created_date_menu`, `last_updated_date_menu`, `status_menu`) VALUES
(1, 'admin/department', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(2, 'admin/designation', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(3, 'admin/employee', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(4, 'admin/project', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(5, 'admin/leave', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(6, 'admin/admin', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(7, 'admin/role', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(8, 'admin/menu', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(9, 'admin/role_menu', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(10, 'admin/setting', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `c_roles`
--

CREATE TABLE `c_roles` (
  `id_role` bigint(20) UNSIGNED NOT NULL,
  `name_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date_role` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_date_role` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_roles`
--

INSERT INTO `c_roles` (`id_role`, `name_role`, `created_date_role`, `last_updated_date_role`, `status_role`) VALUES
(1, 'admin', '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `c_roles_menus`
--

CREATE TABLE `c_roles_menus` (
  `id_role_menu` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_role_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_roles_menus`
--

INSERT INTO `c_roles_menus` (`id_role_menu`, `role_id`, `menu_id`, `created_date`, `last_updated_date`, `status_role_menu`) VALUES
(1, 1, 1, '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(2, 1, 2, '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(3, 1, 3, '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(4, 1, 4, '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(5, 1, 5, '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(6, 1, 6, '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(7, 1, 7, '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(8, 1, 8, '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(9, 1, 9, '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1),
(10, 1, 10, '2022-03-25 07:56:52', '2022-03-25 07:56:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `c_settings`
--

CREATE TABLE `c_settings` (
  `id_setting` bigint(20) UNSIGNED NOT NULL,
  `title_web` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle_web` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon_web` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_web` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_settings`
--

INSERT INTO `c_settings` (`id_setting`, `title_web`, `subtitle_web`, `favicon_web`, `logo_web`) VALUES
(1, 'Company Firsts', 'HR Systems', '1648379727.png', '19374b1570ab0005dcf15e8c0555035c.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `c_settings_email`
--

CREATE TABLE `c_settings_email` (
  `id_setting_email` bigint(20) UNSIGNED NOT NULL,
  `mail_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_port` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_encryption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_active` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_settings_email`
--

INSERT INTO `c_settings_email` (`id_setting_email`, `mail_type`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_encryption`, `status_active`, `created_date`, `last_updated_date`) VALUES
(1, 'smtp', 'smtp.gmail.com', '465', 'testingbestlist@gmail.com', 'agfpncrexovbjbih', 'ssl', 1, '2022-03-25 07:56:53', '2022-03-25 07:56:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `c_admins`
--
ALTER TABLE `c_admins`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `c_departments`
--
ALTER TABLE `c_departments`
  ADD PRIMARY KEY (`id_department`),
  ADD KEY `c_departments_creator_foreign` (`creator`),
  ADD KEY `c_departments_last_updater_foreign` (`last_updater`);

--
-- Indexes for table `c_designations`
--
ALTER TABLE `c_designations`
  ADD PRIMARY KEY (`id_designation`),
  ADD KEY `c_designations_id_department_foreign` (`id_department`),
  ADD KEY `c_designations_creator_foreign` (`creator`),
  ADD KEY `c_designations_last_updater_foreign` (`last_updater`);

--
-- Indexes for table `c_employees`
--
ALTER TABLE `c_employees`
  ADD PRIMARY KEY (`id_employee`),
  ADD KEY `c_employees_id_designation_foreign` (`id_designation`),
  ADD KEY `c_employees_creator_foreign` (`creator`),
  ADD KEY `c_employees_last_updater_foreign` (`last_updater`);

--
-- Indexes for table `c_logs`
--
ALTER TABLE `c_logs`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `c_logs_id_admin_foreign` (`id_admin`),
  ADD KEY `c_logs_id_menu_foreign` (`id_menu`);

--
-- Indexes for table `c_menus`
--
ALTER TABLE `c_menus`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `c_roles`
--
ALTER TABLE `c_roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `c_roles_menus`
--
ALTER TABLE `c_roles_menus`
  ADD PRIMARY KEY (`id_role_menu`),
  ADD KEY `c_roles_menus_role_id_foreign` (`role_id`),
  ADD KEY `c_roles_menus_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `c_settings`
--
ALTER TABLE `c_settings`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `c_settings_email`
--
ALTER TABLE `c_settings_email`
  ADD PRIMARY KEY (`id_setting_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `c_admins`
--
ALTER TABLE `c_admins`
  MODIFY `id_admin` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `c_departments`
--
ALTER TABLE `c_departments`
  MODIFY `id_department` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `c_designations`
--
ALTER TABLE `c_designations`
  MODIFY `id_designation` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `c_employees`
--
ALTER TABLE `c_employees`
  MODIFY `id_employee` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `c_logs`
--
ALTER TABLE `c_logs`
  MODIFY `id_log` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `c_menus`
--
ALTER TABLE `c_menus`
  MODIFY `id_menu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `c_roles`
--
ALTER TABLE `c_roles`
  MODIFY `id_role` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `c_roles_menus`
--
ALTER TABLE `c_roles_menus`
  MODIFY `id_role_menu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `c_settings`
--
ALTER TABLE `c_settings`
  MODIFY `id_setting` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `c_settings_email`
--
ALTER TABLE `c_settings_email`
  MODIFY `id_setting_email` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

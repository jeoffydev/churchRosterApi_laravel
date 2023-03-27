-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2023 at 09:43 PM
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
-- Database: `church_roster_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `active`, `title`, `date`, `description`, `created_at`, `updated_at`) VALUES
(1, '1', 'Test title', '01/12/2013', 'Test Description', NULL, NULL),
(2, '1', 'Title JIL ', '10/12/2013', '13 JIL id event', NULL, NULL),
(3, '1', 'Victory title event', '10/04/2023', 'Victory description event', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_06_15_071844_create_user_types_table', 2),
(5, '2022_06_15_074321_create_user_accesses_table', 3),
(6, '2022_06_16_050756_create_organisations_table', 4),
(7, '2022_06_16_052059_add_description_location_to_organisations_table', 5),
(8, '2022_06_16_052654_create_user_organisations_table', 6),
(9, '2022_06_16_101651_change_location_description_nullable_to_organisations_table', 7),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 8),
(11, '2022_07_04_065759_create_services_table', 9),
(12, '2022_07_04_071256_create_user_services_table', 10),
(13, '2022_07_14_004834_create_departments_table', 11),
(14, '2023_03_15_200216_create_events_table', 12),
(15, '2023_03_20_200837_create_organisation_events_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `organisations`
--

CREATE TABLE `organisations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `active` int(11) NOT NULL,
  `org_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organisations`
--

INSERT INTO `organisations` (`id`, `active`, `org_name`, `created_at`, `updated_at`, `description`, `location`) VALUES
(1, 1, 'Nations Church', '2022-06-15 22:05:23', '2022-06-23 14:57:11', 'Nations Church Roster', 'South Dunedin Edited'),
(2, 1, 'Victory Church', '2022-06-15 22:22:22', '2022-06-19 12:26:07', 'Desc here updated', 'Green Island'),
(4, 0, 'Sto Tomas Victory', '2022-06-19 10:59:45', '2022-06-19 11:31:19', 'Description only has been added here', NULL),
(13, 1, 'Jesus Is Lord', '2022-06-21 20:55:29', '2022-06-21 20:56:00', 'JIL desc 1', 'City Centre 1'),
(14, 0, 'New Victory For God Auckland', '2022-06-23 15:31:22', '2022-06-23 15:32:49', 'New victory desc edited', 'Auckland North'),
(15, 1, 'New church from Christchurch', '2022-06-23 21:26:14', '2022-06-23 21:26:14', 'Christchurch desc', 'Christchurch'),
(18, 1, 'TEst church', '2022-06-26 17:14:58', '2022-06-26 17:14:58', 'Inver church', 'Inver');

-- --------------------------------------------------------

--
-- Table structure for table `organisation_events`
--

CREATE TABLE `organisation_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organisation_events`
--

INSERT INTO `organisation_events` (`id`, `event_id`, `org_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 2, 13, NULL, NULL),
(3, 3, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', '60abde4d782231e60902eae1bd45a2a6ceb8944eadd51919304759cba8a42807', '[\"*\"]', NULL, '2022-06-25 16:11:39', '2022-06-25 16:11:39'),
(2, 'App\\Models\\User', 1, 'token', '56496fbac8c32d23d3e2f8f4f3f4eadf9fa5a8581036c846d5e6625f1b748755', '[\"*\"]', NULL, '2022-06-25 16:11:56', '2022-06-25 16:11:56'),
(3, 'App\\Models\\User', 1, 'token', 'c7b4597c85c149feb878bb562e43926f799259bf80033d7305bf8355c6cc5f54', '[\"*\"]', NULL, '2022-06-25 16:14:34', '2022-06-25 16:14:34'),
(4, 'App\\Models\\User', 8, 'token', '8b4e3331ad1e1df500d68ccc828a24be503bfe649d81f842091fb0dc011f4506', '[\"*\"]', '2022-06-25 16:22:37', '2022-06-25 16:15:23', '2022-06-25 16:22:37'),
(5, 'App\\Models\\User', 8, 'token', '7243bf4dd655a4de6fa1785cca95c5ae2b0d49300f3c0f9ba39430ff746edc5d', '[\"*\"]', '2022-06-29 16:38:45', '2022-06-25 16:22:31', '2022-06-29 16:38:45'),
(6, 'App\\Models\\User', 8, 'token', '190b345587f19f3ed2e1cb0469b9456141d5ce0f12d5e70ff39280b9f9c74870', '[\"*\"]', NULL, '2022-06-25 16:30:32', '2022-06-25 16:30:32'),
(7, 'App\\Models\\User', 8, 'token', '37e1ae8775a5173068e58e493a1da324cb11e2622808217d33bf15002a14f8cf', '[\"*\"]', NULL, '2022-06-25 16:48:56', '2022-06-25 16:48:56'),
(8, 'App\\Models\\User', 8, 'token', '6cca380406e69e805b4d7aa890c14d5223e01e43a3b9044db8f964a8043a5632', '[\"*\"]', NULL, '2022-06-26 16:14:15', '2022-06-26 16:14:15'),
(9, 'App\\Models\\User', 8, 'token', 'c0befdd6afdc9dbca5b42506a46e60dafbf6699afb04d4863345baf3d9cdce81', '[\"*\"]', NULL, '2022-06-26 16:20:24', '2022-06-26 16:20:24'),
(10, 'App\\Models\\User', 8, 'token', '3450045d2f6169945ed1a10792bee51a55253c37d4ce115a760850b03f2dbe41', '[\"*\"]', NULL, '2022-06-26 16:20:51', '2022-06-26 16:20:51'),
(11, 'App\\Models\\User', 8, 'token', 'c11ec84096d172592e27d24c479c7dcee39a6e7fd63c9f02d0204690119ee31e', '[\"*\"]', NULL, '2022-06-26 16:21:47', '2022-06-26 16:21:47'),
(12, 'App\\Models\\User', 8, 'token', '3b088fa600cacd33f4072d088ec0c70f7aa8ca2c1064e039f8328fce03a18503', '[\"*\"]', NULL, '2022-06-26 16:22:15', '2022-06-26 16:22:15'),
(13, 'App\\Models\\User', 8, 'token', 'f3bef5097f242ca2e96c5b5fd91874564b52c03f88cb47d4d47e143ff1343984', '[\"*\"]', NULL, '2022-06-26 16:22:33', '2022-06-26 16:22:33'),
(14, 'App\\Models\\User', 8, 'token', 'e8846715f1fdd3f72f8b4113da9cc6e81f689b11679151dc2c9ac39d29d54461', '[\"*\"]', NULL, '2022-06-26 16:23:09', '2022-06-26 16:23:09'),
(15, 'App\\Models\\User', 8, 'token', '2bcdee2a2d803cc788b68a1d522ced6572a10b303b79c107aa04ebfe31de018e', '[\"*\"]', NULL, '2022-06-26 16:24:00', '2022-06-26 16:24:00'),
(16, 'App\\Models\\User', 8, 'token', '7f567419b68872ea6c84660e4bd3928eaea9d37e24c3070635a2e8b9337e6bc4', '[\"*\"]', NULL, '2022-06-26 16:24:13', '2022-06-26 16:24:13'),
(17, 'App\\Models\\User', 8, 'token', '6291d70fcab354d509f6cea86ddc31c2ff7225aef8111b19088dd7c600678293', '[\"*\"]', NULL, '2022-06-26 16:24:46', '2022-06-26 16:24:46'),
(18, 'App\\Models\\User', 8, 'token', '46f225da5b3a8de083b7dc9e659283075cda57c0b08ec604cc82bf6e51ba1ff8', '[\"*\"]', NULL, '2022-06-26 16:25:19', '2022-06-26 16:25:19'),
(19, 'App\\Models\\User', 8, 'token', '0db2228262be1146aceb914b3000c4c0dbfc5cc707bd78d6568a9b5f1add1261', '[\"*\"]', NULL, '2022-06-26 16:25:39', '2022-06-26 16:25:39'),
(20, 'App\\Models\\User', 8, 'token', 'f8956f8b5cad96d71ba746f7e0af5013e4f34789b661f4e8c8327fc28cbe9743', '[\"*\"]', NULL, '2022-06-26 16:26:46', '2022-06-26 16:26:46'),
(21, 'App\\Models\\User', 8, 'token', '09c60174ae60c2b83c1f1ea6ea3dd900500ddc70a8a6bc2ac67897e4eb7a190c', '[\"*\"]', NULL, '2022-06-26 16:27:18', '2022-06-26 16:27:18'),
(22, 'App\\Models\\User', 8, 'token', 'ace4d5b00d3b930becca0dda1243292e7a663672433c63ee85a9c0e688ef7705', '[\"*\"]', NULL, '2022-06-26 16:28:01', '2022-06-26 16:28:01'),
(23, 'App\\Models\\User', 8, 'token', '3cc1600f9350d7105301d05f49d2219d71b634abb568ebc9cdeb29e74df4d2c3', '[\"*\"]', NULL, '2022-06-26 16:28:34', '2022-06-26 16:28:34'),
(24, 'App\\Models\\User', 8, 'token', 'afd9e9dbd37b55a5509382c574dd36b08b25a02b89cbeb27557185e934a200e9', '[\"*\"]', NULL, '2022-06-26 16:28:53', '2022-06-26 16:28:53'),
(25, 'App\\Models\\User', 8, 'token', '7f2ed22625c3d5dd58ea4a19c2b6520ca56ef676068c0e5a60cf389cfed22110', '[\"*\"]', NULL, '2022-06-26 16:34:31', '2022-06-26 16:34:31'),
(26, 'App\\Models\\User', 8, 'token', '160ee71e230a7807876b8b69bbc3cddb9a26673a55dfd46d56c527694ebeedd4', '[\"*\"]', NULL, '2022-06-26 16:34:54', '2022-06-26 16:34:54'),
(27, 'App\\Models\\User', 8, 'token', '7213c4dc982a5c1dae50e9a65db64e172bdccedc427e8e97f8424153e543955c', '[\"*\"]', NULL, '2022-06-26 16:35:24', '2022-06-26 16:35:24'),
(28, 'App\\Models\\User', 8, 'token', '250c0cd6f46a539ae1ecebad520b587ac4d9ebd5c930907b70be7b5a2bcbb388', '[\"*\"]', NULL, '2022-06-26 16:37:24', '2022-06-26 16:37:24'),
(29, 'App\\Models\\User', 8, 'token', '8a96f093c4a8d4022df21913f54ffe53bbc6409b3abd2ccab8d74b6f53e06394', '[\"*\"]', NULL, '2022-06-26 16:37:38', '2022-06-26 16:37:38'),
(30, 'App\\Models\\User', 8, 'token', '220877ec184b4d29c3342a31e93a4c55de79a8f6756ac356504ed8b118897aa2', '[\"*\"]', NULL, '2022-06-26 16:38:17', '2022-06-26 16:38:17'),
(31, 'App\\Models\\User', 8, 'token', 'f0ea7b6777540d24da5a840aa42da61278a97e5cb465c70ae9e54f964cd8e02c', '[\"*\"]', NULL, '2022-06-26 16:38:43', '2022-06-26 16:38:43'),
(32, 'App\\Models\\User', 8, 'token', 'dac8d71b7d1bf34091ecd1b9330e9cc4d6dacfe4e11c68f71403ad29d36b1774', '[\"*\"]', NULL, '2022-06-26 16:38:53', '2022-06-26 16:38:53'),
(33, 'App\\Models\\User', 8, 'token', '9462bd7c3d85d7d0b0c841e4ecf2f9261a869a8c4bbbcbbeb4da94cd6708c944', '[\"*\"]', NULL, '2022-06-26 16:39:05', '2022-06-26 16:39:05'),
(34, 'App\\Models\\User', 8, 'token', '5f77b443625f7687c235b3eb694ff759d08c02580297865552b8561814a41bb8', '[\"*\"]', NULL, '2022-06-26 16:39:33', '2022-06-26 16:39:33'),
(35, 'App\\Models\\User', 8, 'token', '8ee596601616f21059ca29b40ed9c3e4918a4760837c12eac1d72b30cee77222', '[\"*\"]', NULL, '2022-06-26 16:42:47', '2022-06-26 16:42:47'),
(36, 'App\\Models\\User', 8, 'token', '0538df3411e2023663cfdbe42f03051724e2076b1a6beb62f19914f2ef58bf2e', '[\"*\"]', NULL, '2022-06-26 16:43:06', '2022-06-26 16:43:06'),
(37, 'App\\Models\\User', 8, 'token', '64e8a5549de563ec6d0e208f0a5d1fca8a031dcbb6ade011b101bc340eaa662d', '[\"*\"]', NULL, '2022-06-26 16:43:16', '2022-06-26 16:43:16'),
(38, 'App\\Models\\User', 8, 'token', '270a7c516139dc01a0deb51241730a0df30ec7d606b13f9e53b843bb589cdad8', '[\"*\"]', NULL, '2022-06-26 16:44:52', '2022-06-26 16:44:52'),
(39, 'App\\Models\\User', 8, 'token', '800e2a40ed6685b702ac3f040768ad992245a2da102403798da900f6bf1014c7', '[\"*\"]', NULL, '2022-06-26 16:48:32', '2022-06-26 16:48:32'),
(40, 'App\\Models\\User', 8, 'token', '37a57030ab0deaaa202ae949b678c78994bb074ed6dceb28ece8f1ee179a5127', '[\"*\"]', NULL, '2022-06-26 16:53:18', '2022-06-26 16:53:18'),
(41, 'App\\Models\\User', 8, 'token', '201b507752bc73d2b11a151fd70bf918ac19fb9c5d5d2890ab833d6dc4f0dfd5', '[\"*\"]', NULL, '2022-06-26 16:53:41', '2022-06-26 16:53:41'),
(42, 'App\\Models\\User', 8, 'token', 'a2ba76d3e648a83c3a1c2eedb33151a147c1acb17ff4b15951662f0c6a2ebd4b', '[\"*\"]', NULL, '2022-06-26 16:59:51', '2022-06-26 16:59:51'),
(43, 'App\\Models\\User', 8, 'token', '79af1f8752063a23e72e92b3b088ad7020a1fa3d41431478a42f242a1de50c94', '[\"*\"]', NULL, '2022-06-26 17:00:14', '2022-06-26 17:00:14'),
(44, 'App\\Models\\User', 8, 'token', '25a5b7fb5b113dee03e91652835a21c26b46cbfc4220fe9f915c157e689cf39d', '[\"*\"]', NULL, '2022-06-26 17:00:26', '2022-06-26 17:00:26'),
(45, 'App\\Models\\User', 8, 'token', 'cbdc28295d43f1fbd962f641e4971b340a9fbca3406b5e6a9e2ce009f7e3f011', '[\"*\"]', NULL, '2022-06-26 17:02:31', '2022-06-26 17:02:31'),
(46, 'App\\Models\\User', 8, 'token', '0a3892832f90de5458c6cfbb8345fc2aa4fce6c7a57d6c70a19a4fff065cea1b', '[\"*\"]', NULL, '2022-06-26 17:03:15', '2022-06-26 17:03:15'),
(47, 'App\\Models\\User', 8, 'token', '737e7a0c4fffdbae25488dd1b84f447e58fe1672054190cdbabb229b8707fd34', '[\"*\"]', NULL, '2022-06-26 17:06:13', '2022-06-26 17:06:13'),
(48, 'App\\Models\\User', 8, 'token', '762b39cb018f082fff8791ea10ee32d7da6e97a67031e91c67c73d71193d1ff0', '[\"*\"]', NULL, '2022-06-26 17:07:40', '2022-06-26 17:07:40'),
(49, 'App\\Models\\User', 8, 'token', '6ea923891329710e5848e3c44ed5213c63328fd8caf5e4787142ed4de5ebbab7', '[\"*\"]', NULL, '2022-06-26 17:11:15', '2022-06-26 17:11:15'),
(50, 'App\\Models\\User', 8, 'token', 'd361e8f9af29712db040ccd708daea5a78ee5eba20b14c8e2c58bf3784563b02', '[\"*\"]', NULL, '2022-06-26 17:11:37', '2022-06-26 17:11:37'),
(51, 'App\\Models\\User', 8, 'token', 'de0bff729dd451bc0f1b237e3d1aef8bbd8cdde6a4a3524149d9c4641127f341', '[\"*\"]', NULL, '2022-06-26 17:11:46', '2022-06-26 17:11:46'),
(52, 'App\\Models\\User', 8, 'token', '7f6690c1d799e86210dc9d4ba6795eebaba13bc7912c57d5eb9d09d6cbb16417', '[\"*\"]', NULL, '2022-06-26 17:13:18', '2022-06-26 17:13:18'),
(53, 'App\\Models\\User', 8, 'token', '469fc50341e24f151033fbb14bf178c3ffa6c41a7eb10ec3cb3a8bd1d316763c', '[\"*\"]', NULL, '2022-06-26 17:13:31', '2022-06-26 17:13:31'),
(54, 'App\\Models\\User', 8, 'token', '5d7209e5c84814470a4df7894e0b60b8bf227d7b14f85d460c548b432e1b5011', '[\"*\"]', NULL, '2022-06-26 17:14:00', '2022-06-26 17:14:00'),
(55, 'App\\Models\\User', 8, 'token', 'c0e68494072af4859f7b2ee0da0a2a9855e1e4a57d7e1a8bed174174e3adb04e', '[\"*\"]', NULL, '2022-06-29 16:21:46', '2022-06-29 16:21:46'),
(56, 'App\\Models\\User', 8, 'token', '19a1f35689231b5982afcb7bb99edae937bb25ba225fd2dbce9cc4111208f3ac', '[\"*\"]', NULL, '2022-06-29 16:37:07', '2022-06-29 16:37:07'),
(57, 'App\\Models\\User', 8, 'token', '384f92d89ffca7db8460ffe7960563ec17f9d2edea99974a28fffb4016adcb7a', '[\"*\"]', NULL, '2022-06-29 16:37:24', '2022-06-29 16:37:24'),
(58, 'App\\Models\\User', 8, 'token', '034232c1730f7e93de1e45b3f7c8ac09c83e25a04816be72ded26ec8e10b97fe', '[\"*\"]', '2022-06-29 17:05:33', '2022-06-29 16:37:45', '2022-06-29 17:05:33'),
(59, 'App\\Models\\User', 8, 'token', 'b10d4b84d02966b7d61bf136e827e9f1da43071445f00b779b0cdb3d41416200', '[\"*\"]', '2022-06-29 17:30:43', '2022-06-29 17:07:17', '2022-06-29 17:30:43'),
(60, 'App\\Models\\User', 9, 'token', '2186b3c84c1634a831a41adbece4082235033ecc5cca07091e81ef84c0e12a2b', '[\"*\"]', '2022-06-29 17:44:32', '2022-06-29 17:31:23', '2022-06-29 17:44:32'),
(61, 'App\\Models\\User', 9, 'token', '0aa5ca298f3ed487b8a9a18aaffe11dc5ed19725e2e82efd1c72a6d5f1e5f3cb', '[\"*\"]', '2022-06-29 17:45:33', '2022-06-29 17:44:59', '2022-06-29 17:45:33'),
(62, 'App\\Models\\User', 10, 'token', '337b54f5de0ea6a58f4446e3d458def246a50463fbfe10f931432e7271355c45', '[\"*\"]', '2022-06-30 16:05:47', '2022-06-29 17:45:28', '2022-06-30 16:05:47'),
(63, 'App\\Models\\User', 10, 'token', '106c1be540267b0275bdf50e5cfb747441c3af8bb4be3a182f12fcef147dfcdb', '[\"*\"]', NULL, '2022-06-30 16:05:11', '2022-06-30 16:05:11'),
(64, 'App\\Models\\User', 9, 'token', '959d76977665ca2c6a1e47d3d50f9c1a4a83f11fb7537783c4aed91a733d9111', '[\"*\"]', '2022-06-30 16:06:16', '2022-06-30 16:05:44', '2022-06-30 16:06:16'),
(65, 'App\\Models\\User', 8, 'token', '4c1365eb48cfd51b1ff383c3acd834f074fc33aa9a3af3caa636d128bce71944', '[\"*\"]', NULL, '2022-06-30 16:07:09', '2022-06-30 16:07:09'),
(66, 'App\\Models\\User', 8, 'token', '9f37f0593c1f1a123aaefb55db4bbaef4e0f82ba97f69d06a5bf8279761ea029', '[\"*\"]', '2022-07-03 19:23:27', '2022-06-30 16:07:15', '2022-07-03 19:23:27'),
(67, 'App\\Models\\User', 8, 'token', '90f439e04f2edff55dbf2cfa9f9b512ef6976051e10b5662d4f5034bdb5add45', '[\"*\"]', NULL, '2022-06-30 21:45:40', '2022-06-30 21:45:40'),
(68, 'App\\Models\\User', 8, 'token', '9ec5700ba41cfe67c5ca88a157cd6137f40b4adb017227c23b818327779ce289', '[\"*\"]', NULL, '2022-06-30 22:00:04', '2022-06-30 22:00:04'),
(69, 'App\\Models\\User', 8, 'token', 'e3d407582376e3769c50d87bbf11327f1e227f34a5d11154d2eb0e0d8d67d27b', '[\"*\"]', NULL, '2022-06-30 22:04:35', '2022-06-30 22:04:35'),
(70, 'App\\Models\\User', 8, 'token', '63c16b2cd0d54ef4bfa09831e130ba66c5edcce54340a6bccb69ee7825558d29', '[\"*\"]', NULL, '2022-06-30 22:08:47', '2022-06-30 22:08:47'),
(71, 'App\\Models\\User', 8, 'token', '5d0257636337107f7a91b662630b2693cc3a38b37afb2fd78985a48f514a63b0', '[\"*\"]', NULL, '2022-06-30 22:12:17', '2022-06-30 22:12:17'),
(72, 'App\\Models\\User', 8, 'token', 'efe633d9351871e1897c2c30ce72c960741ff15b91742954c415042088a49f58', '[\"*\"]', NULL, '2022-06-30 22:18:27', '2022-06-30 22:18:27'),
(73, 'App\\Models\\User', 8, 'token', '2abe0224f9f734ebb3f37bf3c28392aa553c370aeb7f0f45d7559ca7783b7e05', '[\"*\"]', NULL, '2022-06-30 22:20:47', '2022-06-30 22:20:47'),
(74, 'App\\Models\\User', 8, 'token', 'd826790000271ef367c7fc1a9c02bb68af2f94d6048fec66d73e32723e049b73', '[\"*\"]', NULL, '2022-06-30 22:21:22', '2022-06-30 22:21:22'),
(75, 'App\\Models\\User', 8, 'token', '7248ae5f3ad1db08ce26bfad7274b66c42ea1b05f51cd34481097ef5ede284f4', '[\"*\"]', NULL, '2022-06-30 22:21:40', '2022-06-30 22:21:40'),
(76, 'App\\Models\\User', 8, 'token', 'e445834047c2509edde2885f738d7fd43824da6c9a28ab6d529e0fb7a768bc2f', '[\"*\"]', NULL, '2022-06-30 22:25:16', '2022-06-30 22:25:16'),
(77, 'App\\Models\\User', 8, 'token', '26eb50b72881b9dd031acdc03b9e437e852fde8ecb405aa742df29381f7c43f9', '[\"*\"]', NULL, '2022-06-30 22:25:55', '2022-06-30 22:25:55'),
(78, 'App\\Models\\User', 8, 'token', '6470afb6fce39ca274cea1debb6034803b497e05d8f13a54a29eb74b93fe8713', '[\"*\"]', NULL, '2022-06-30 22:26:05', '2022-06-30 22:26:05'),
(79, 'App\\Models\\User', 8, 'token', 'ff5aae81909b544ff55b9a80060951181851901f152655af8f29a2f58aa60f49', '[\"*\"]', NULL, '2022-06-30 22:29:43', '2022-06-30 22:29:43'),
(80, 'App\\Models\\User', 8, 'token', 'c8a3faaf93ae58e7e3329ec162fdc11ae7dfb4f41a97523ab694eec8871b71ec', '[\"*\"]', NULL, '2022-06-30 22:29:55', '2022-06-30 22:29:55'),
(81, 'App\\Models\\User', 8, 'token', '8aede39864410c108df1689836003ba22f8213fe35a0b4eeff94db63c97b1a14', '[\"*\"]', NULL, '2022-06-30 22:31:33', '2022-06-30 22:31:33'),
(82, 'App\\Models\\User', 8, 'token', 'deb921e99f9c57ead4bce73485f76cc98298e5b90c5c0ee7d3cb8521732261fb', '[\"*\"]', NULL, '2022-07-01 11:10:32', '2022-07-01 11:10:32'),
(83, 'App\\Models\\User', 8, 'token', '12045760c2b860e0a89efbc64f7414122601d748de118b60b1ae10fc5ec94c0e', '[\"*\"]', NULL, '2022-07-01 11:33:22', '2022-07-01 11:33:22'),
(84, 'App\\Models\\User', 8, 'token', '3f866670547c2cc258692499506bf3a716f7492c23827f78a5306f3eac2629b6', '[\"*\"]', NULL, '2022-07-01 11:57:13', '2022-07-01 11:57:13'),
(85, 'App\\Models\\User', 8, 'token', 'bfb716337a312edfeda458e37def5e3200d4ca858b887e5e0644ae6942851f1d', '[\"*\"]', NULL, '2022-07-01 16:14:39', '2022-07-01 16:14:39'),
(86, 'App\\Models\\User', 8, 'token', '09bf13befdabea1bca7055d3af37aaa5005b732a96bc76304a46c1a7c262c613', '[\"*\"]', NULL, '2022-07-01 16:20:04', '2022-07-01 16:20:04'),
(87, 'App\\Models\\User', 8, 'token', 'f17db47a6cc8ccfa7ba2aca5196eb063845aab1a0881d6b9e6b81552a79121c6', '[\"*\"]', NULL, '2022-07-01 16:21:41', '2022-07-01 16:21:41'),
(88, 'App\\Models\\User', 8, 'token', '31d118c0fc48c2dd8e1430217c3399b94353139e9f007d9b694194164882ede4', '[\"*\"]', NULL, '2022-07-01 16:25:35', '2022-07-01 16:25:35'),
(89, 'App\\Models\\User', 8, 'token', '4885ad8869f7aac2a4529d7c122e01ac0e24cd71c16707ee32c2e0e3a787f3be', '[\"*\"]', NULL, '2022-07-01 16:33:54', '2022-07-01 16:33:54'),
(90, 'App\\Models\\User', 8, 'token', '8437972eb1bfd98a1ab78259902334977eaa2142eadb3af85efc9c8d4a9d2d1a', '[\"*\"]', NULL, '2022-07-01 16:39:19', '2022-07-01 16:39:19'),
(91, 'App\\Models\\User', 8, 'token', '746f43a2fc04d0522c5fe922db8fda3116d0265ac23eb060d7f28ffb8580aeed', '[\"*\"]', NULL, '2022-07-01 16:41:44', '2022-07-01 16:41:44'),
(92, 'App\\Models\\User', 8, 'token', '94c17182ccc61620a3291ff38002bcf8d238560b2f09123c926659eed62d55ee', '[\"*\"]', NULL, '2022-07-01 16:43:49', '2022-07-01 16:43:49'),
(93, 'App\\Models\\User', 8, 'token', '5c8f57bf5e30dd1dbe7d0f406a848b262a0f2a205a3d32bce3f550c5d89fcccd', '[\"*\"]', NULL, '2022-07-01 16:51:00', '2022-07-01 16:51:00'),
(94, 'App\\Models\\User', 8, 'token', '980c458273c1adec441fac2897b7b826253fa3019c768d55521bd2c81cf4b48e', '[\"*\"]', NULL, '2022-07-01 16:54:47', '2022-07-01 16:54:47'),
(95, 'App\\Models\\User', 8, 'token', '78c44ca920be9552467fbc2305caa7a3a84cf943df66ad9c1efa011bee404d90', '[\"*\"]', NULL, '2022-07-01 17:00:59', '2022-07-01 17:00:59'),
(96, 'App\\Models\\User', 8, 'token', 'd84c500d1f8860230e9bc5f7d32d3f0c9059f0099bbac02e7c4d0d9d25ea96d7', '[\"*\"]', NULL, '2022-07-01 17:11:33', '2022-07-01 17:11:33'),
(97, 'App\\Models\\User', 8, 'token', '3658f22d93222d8f389ab4d9dcff54ccce34f3aea8051d70b9e8a757d54ae2d9', '[\"*\"]', NULL, '2022-07-01 17:18:39', '2022-07-01 17:18:39'),
(98, 'App\\Models\\User', 8, 'token', 'dc8a81c4a10127b55229ca4b12dfbd42f3d52218f5ddb47fa7220f2cebddf19d', '[\"*\"]', NULL, '2022-07-01 17:24:03', '2022-07-01 17:24:03'),
(99, 'App\\Models\\User', 8, 'token', 'c6752952118397dc75a2838622faeb031f63fa16240ef0f62b78486254c0c163', '[\"*\"]', NULL, '2022-07-01 17:28:42', '2022-07-01 17:28:42'),
(100, 'App\\Models\\User', 8, 'token', '74e7da1bcac64508aac8d5b175d625d7961e2dab613fdf751e0af536c74e361f', '[\"*\"]', NULL, '2022-07-01 17:29:37', '2022-07-01 17:29:37'),
(101, 'App\\Models\\User', 8, 'token', 'dd2f464f703ead8c37a286dbb02d56b452088923bf59e5a6660fc782aab015a0', '[\"*\"]', NULL, '2022-07-01 17:30:29', '2022-07-01 17:30:29'),
(102, 'App\\Models\\User', 8, 'token', '85cae2afcaf64b6d98917ae71aaf627cf3ae78bf73fdb550ca2d26298a53a990', '[\"*\"]', NULL, '2022-07-01 17:32:01', '2022-07-01 17:32:01'),
(103, 'App\\Models\\User', 8, 'token', 'ac5016e7cef2d28f3d287ddf339280d7a2a4c81300768d71d9a0f0e901faae61', '[\"*\"]', NULL, '2022-07-01 17:35:31', '2022-07-01 17:35:31'),
(104, 'App\\Models\\User', 8, 'token', '42415f51f81beca04b7203c98b64c4dded6385f875c8d069df2ef3399c1ce071', '[\"*\"]', NULL, '2022-07-01 17:37:02', '2022-07-01 17:37:02'),
(105, 'App\\Models\\User', 8, 'token', '819ff44298fbe92d220e94a76398a7bb5efff767e7d81241ae85ab5b37dce346', '[\"*\"]', NULL, '2022-07-01 17:41:39', '2022-07-01 17:41:39'),
(106, 'App\\Models\\User', 8, 'token', 'fd11bc6824ad6844bb004883cab6a1e1e45e3168e88c57fc764964ae7e7018c4', '[\"*\"]', NULL, '2022-07-01 17:46:43', '2022-07-01 17:46:43'),
(107, 'App\\Models\\User', 8, 'token', '5c4394effd16278100b3e1632824315f8b16a9e112296f3508fcac5ca2f31833', '[\"*\"]', NULL, '2022-07-01 17:54:09', '2022-07-01 17:54:09'),
(108, 'App\\Models\\User', 8, 'token', '6d9efd668f05c13488d197be9a22225f3eeb2b7ab1ea9979dbb1edb015105da0', '[\"*\"]', '2022-07-01 18:14:34', '2022-07-01 18:12:55', '2022-07-01 18:14:34'),
(109, 'App\\Models\\User', 8, 'token', '4a9990e9776e8fd5725ddf500604e6be937a4eda7820aaa5ea0487887d83d89c', '[\"*\"]', '2022-07-01 18:17:29', '2022-07-01 18:15:51', '2022-07-01 18:17:29'),
(110, 'App\\Models\\User', 8, 'token', 'fcf809d80e0f277bb32f4910dc2323e8e610f94f2777a550d2ef395664e5cfc1', '[\"*\"]', NULL, '2022-07-01 18:17:50', '2022-07-01 18:17:50'),
(111, 'App\\Models\\User', 8, 'token', 'd43b7dfc47298e8ab54b64e288eb33bbde57a52843d6ed2f5be61f4cf47ba483', '[\"*\"]', '2022-07-01 18:22:26', '2022-07-01 18:22:23', '2022-07-01 18:22:26'),
(112, 'App\\Models\\User', 8, 'token', 'e1785861010d0cc1b19dd9b1799807fd26ec39f3c1b734852aaf292e4b4834dd', '[\"*\"]', '2022-07-01 18:24:59', '2022-07-01 18:24:30', '2022-07-01 18:24:59'),
(113, 'App\\Models\\User', 8, 'token', '7f468d1fc7875f515a47d891b78dc0795346e950940e5ffeddf78f94d1a70b0d', '[\"*\"]', NULL, '2022-07-01 18:34:45', '2022-07-01 18:34:45'),
(114, 'App\\Models\\User', 8, 'token', 'b75f75f8c73b4970f63acf5cf5723c71f885f9dae9ded43f51920ac20d6ca029', '[\"*\"]', NULL, '2022-07-01 18:47:08', '2022-07-01 18:47:08'),
(115, 'App\\Models\\User', 8, 'token', '32eddeafaf6e9953879c582c1cd4c525bea35b307204f5f3e02d36d909de8460', '[\"*\"]', NULL, '2022-07-01 18:49:31', '2022-07-01 18:49:31'),
(116, 'App\\Models\\User', 8, 'token', '73f69401fb74470577d25cc38aa4548067f8bb181aebd5e7c1b498973178654d', '[\"*\"]', '2022-07-01 18:58:01', '2022-07-01 18:55:58', '2022-07-01 18:58:01'),
(117, 'App\\Models\\User', 8, 'token', '7505aff3589f06ab92fd815fd742d60a9829d57f2dcfc2d2b0750dbf5fa1e5d2', '[\"*\"]', '2022-07-01 19:11:24', '2022-07-01 19:11:12', '2022-07-01 19:11:24'),
(118, 'App\\Models\\User', 8, 'token', '0c3a0ef202a9e7c40576ac89c7772495ab37c979e0ba5cb5f7f7473ad6df9552', '[\"*\"]', '2022-07-01 19:13:45', '2022-07-01 19:13:35', '2022-07-01 19:13:45'),
(119, 'App\\Models\\User', 8, 'token', 'abda9c519d3fda3e0e9c3d12b8aec95a4bacca10c686bffcd403c6e49a84e8e2', '[\"*\"]', NULL, '2022-07-02 15:16:57', '2022-07-02 15:16:57'),
(120, 'App\\Models\\User', 8, 'token', '23236a1290cd9630acd5598e117dbf4ff1979a374c4c0903ddeea780c3e8f4b9', '[\"*\"]', NULL, '2022-07-02 15:18:33', '2022-07-02 15:18:33'),
(121, 'App\\Models\\User', 8, 'token', '6bf09b85e82485051d9bf3c661edd773a6a5f0ce03b2d73b0177f4943890fcfe', '[\"*\"]', NULL, '2022-07-02 15:23:19', '2022-07-02 15:23:19'),
(122, 'App\\Models\\User', 8, 'token', '72c43c9120b3d7ae08da5676375426d796f29bd9ad236eb5ee9ffb81dabad5a6', '[\"*\"]', '2022-07-02 15:27:22', '2022-07-02 15:27:17', '2022-07-02 15:27:22'),
(123, 'App\\Models\\User', 8, 'token', '58a64ccf88cb1d832282da024b3994e53f754bc53af8f489413efd8bf98c2cfc', '[\"*\"]', NULL, '2022-07-02 15:35:36', '2022-07-02 15:35:36'),
(124, 'App\\Models\\User', 8, 'token', '4f39a28db478b6d1e4cc7c67335aa889a45db5d6a05398ce3ad3aaf7fac7ba69', '[\"*\"]', NULL, '2022-07-02 16:04:48', '2022-07-02 16:04:48'),
(125, 'App\\Models\\User', 8, 'token', 'f14955c3ef54bdc22fb20b19a9acf76d72766e037e0f42cd71b135bb0a098d46', '[\"*\"]', NULL, '2022-07-02 16:11:56', '2022-07-02 16:11:56'),
(126, 'App\\Models\\User', 8, 'token', '1bcc145c1aadd6300f22b557f15df098dc89a5278ced11dd68e7e4c266263e6a', '[\"*\"]', '2022-07-29 10:31:57', '2022-07-02 16:20:20', '2022-07-29 10:31:57'),
(127, 'App\\Models\\User', 8, 'token', 'e6c6a46abb17e89d2b5ac926376828e0312da3eaa3ff2dc969572f2c6fd83094', '[\"*\"]', '2022-07-02 16:38:49', '2022-07-02 16:37:32', '2022-07-02 16:38:49'),
(128, 'App\\Models\\User', 8, 'token', 'b0b1bd5b8461fcfcf537a776b839cf8e0ff3c89c055cfe3d6da049ec90336f46', '[\"*\"]', '2022-07-02 16:42:02', '2022-07-02 16:40:57', '2022-07-02 16:42:02'),
(129, 'App\\Models\\User', 8, 'token', 'df90b9fd0e2a890848c30d41dfb669726ead2d40481f1fe2baa0cfbf1ff4bb4b', '[\"*\"]', '2022-07-02 16:54:51', '2022-07-02 16:51:46', '2022-07-02 16:54:51'),
(130, 'App\\Models\\User', 8, 'token', 'b55a2aeaeb54ee8c5d07074c581fee1d017a07a2f3341e97ad955964215f0de7', '[\"*\"]', '2022-07-02 17:04:02', '2022-07-02 16:59:25', '2022-07-02 17:04:02'),
(131, 'App\\Models\\User', 8, 'token', 'b7c477ff52ca9afa4026ec7c86eea768aaca5032e52077dc6e60779ad06f464b', '[\"*\"]', '2022-07-02 17:08:30', '2022-07-02 17:05:20', '2022-07-02 17:08:30'),
(132, 'App\\Models\\User', 8, 'token', 'dc8c115b1bdae8784fae3ef2ac22c96306a429c40698232842a6a1ce8b81c535', '[\"*\"]', '2022-07-02 17:10:53', '2022-07-02 17:09:01', '2022-07-02 17:10:53'),
(133, 'App\\Models\\User', 8, 'token', 'ba4d3f64d738c4ce60c18598ad097aff5126a13b5014d4f2ee6e54f5734b87ad', '[\"*\"]', '2022-07-02 17:14:28', '2022-07-02 17:12:05', '2022-07-02 17:14:28'),
(134, 'App\\Models\\User', 8, 'token', '0f22fd3d37c613c39d7bdf18cf60fcdab21fe9c186ec2699d049746df3ee3aaf', '[\"*\"]', '2022-07-02 17:16:38', '2022-07-02 17:14:38', '2022-07-02 17:16:38'),
(135, 'App\\Models\\User', 8, 'token', '9a639f0255a7f32be88af517948cd7f8f5258c92b584f967b38ce1193c7ad130', '[\"*\"]', '2022-07-02 17:18:28', '2022-07-02 17:16:47', '2022-07-02 17:18:28'),
(136, 'App\\Models\\User', 8, 'token', 'f42751543d8ebbf3c0a324cbe6f103da781c7a6c05e0e7c13b4c4b1bcb5bb86d', '[\"*\"]', '2022-07-02 17:25:52', '2022-07-02 17:23:35', '2022-07-02 17:25:52'),
(137, 'App\\Models\\User', 8, 'token', '695290055f3369c147c1cf00425a532cd6dfcf8fe77c7ff459cdf3c809c39d83', '[\"*\"]', '2022-07-02 17:26:45', '2022-07-02 17:26:03', '2022-07-02 17:26:45'),
(138, 'App\\Models\\User', 8, 'token', '37511c7c961a7a025cd9b6cb25ce0e10955e53a28b842c18b4fe5d4a18fff44d', '[\"*\"]', '2022-07-02 17:27:07', '2022-07-02 17:26:52', '2022-07-02 17:27:07'),
(139, 'App\\Models\\User', 8, 'token', 'cf9fb1020827eacd14a6979fe5c6865d710a0bcfa90cb983a3be99fbc7ba1436', '[\"*\"]', '2022-07-02 17:31:50', '2022-07-02 17:27:17', '2022-07-02 17:31:50'),
(140, 'App\\Models\\User', 8, 'token', 'c6609b333b24a411f95262bc002750ade304dc2755fd977d5ef2e27c6fd087c7', '[\"*\"]', '2022-07-02 17:39:46', '2022-07-02 17:38:34', '2022-07-02 17:39:46'),
(141, 'App\\Models\\User', 8, 'token', 'a68b99fd5c35165cc5b9903183f819f7a54e8506a209c18893b0924d9aafcc2f', '[\"*\"]', '2022-07-02 17:41:37', '2022-07-02 17:39:46', '2022-07-02 17:41:37'),
(142, 'App\\Models\\User', 8, 'token', '9df2c40cd50d7ef0ac4fed8ec17882c0d5b51f8fba83e67ebc06daf9ef4a1d1e', '[\"*\"]', '2022-07-02 17:44:27', '2022-07-02 17:43:59', '2022-07-02 17:44:27'),
(143, 'App\\Models\\User', 8, 'token', '930e8853240db0b4f07eb522f59d20f3fc847f401d4223ac802cfbb08791fff7', '[\"*\"]', '2022-07-02 17:48:29', '2022-07-02 17:44:26', '2022-07-02 17:48:29'),
(144, 'App\\Models\\User', 8, 'token', 'a0de55c51a42899c5ed3314075ccd064953ba68cb1fbf496b9da52a62082c305', '[\"*\"]', '2022-07-02 17:53:43', '2022-07-02 17:49:50', '2022-07-02 17:53:43'),
(145, 'App\\Models\\User', 8, 'token', '6bcbfb16baafb6bc8ed218411b2f06348f81f972b40b2fa4c9c2cc78617dc698', '[\"*\"]', '2022-07-02 17:56:47', '2022-07-02 17:54:12', '2022-07-02 17:56:47'),
(146, 'App\\Models\\User', 8, 'token', '641f8a82ee589f51f8be0a5c81bf2fc7cdb8d3f6994aa9d91d91e03296961f7e', '[\"*\"]', '2022-07-02 17:59:29', '2022-07-02 17:57:27', '2022-07-02 17:59:29'),
(147, 'App\\Models\\User', 8, 'token', '38ea546f1176510af63491cfb0934cc575a2edadbb7c13bc229826755fca6d59', '[\"*\"]', '2022-07-02 18:04:21', '2022-07-02 18:01:12', '2022-07-02 18:04:21'),
(148, 'App\\Models\\User', 8, 'token', '35d103872d04d2ec784751c7df40f43dff2d8902cc492410bfc330305a9b0faf', '[\"*\"]', '2022-07-02 18:06:30', '2022-07-02 18:05:00', '2022-07-02 18:06:30'),
(149, 'App\\Models\\User', 8, 'token', '5abed3eb4ebdfdb5439b9f39c9ee3ac5c304581802ac81ef1388880d949c4b37', '[\"*\"]', '2022-07-02 18:08:39', '2022-07-02 18:07:37', '2022-07-02 18:08:39'),
(150, 'App\\Models\\User', 8, 'token', '5403020be45c6b2745746fee0afada2cd350fd055a9248b4f268f351132473e6', '[\"*\"]', '2022-07-02 18:12:14', '2022-07-02 18:11:12', '2022-07-02 18:12:14'),
(151, 'App\\Models\\User', 8, 'token', '573f6640fbee313a20b12ea5dd488f5753d196a4874886f3cb46c0c1457336c3', '[\"*\"]', NULL, '2022-07-02 18:15:45', '2022-07-02 18:15:45'),
(152, 'App\\Models\\User', 8, 'token', '92cae41812f08efd5cdb224a4a3452b571d401498d8a40857db8df63fb2256e9', '[\"*\"]', NULL, '2022-07-02 18:20:42', '2022-07-02 18:20:42'),
(153, 'App\\Models\\User', 8, 'token', 'eddda21bee7b2be68b3104efa942c75096ddb99ecaebe24b5dc9c93ddeffbbba', '[\"*\"]', NULL, '2022-07-02 18:26:17', '2022-07-02 18:26:17'),
(154, 'App\\Models\\User', 8, 'token', 'b5adf69257edcf9a058f4fd0b38a08c8acce4d29d7d2ba1d93b4c3f1224b596c', '[\"*\"]', NULL, '2022-07-02 18:29:27', '2022-07-02 18:29:27'),
(155, 'App\\Models\\User', 8, 'token', '74e3f662afdf23e76a258143216fbfa765a79a6b448cd603f9a874b9d7d9c798', '[\"*\"]', NULL, '2022-07-02 18:31:48', '2022-07-02 18:31:48'),
(156, 'App\\Models\\User', 8, 'token', '4bc9faad80dacca74afec655a7463bc8ebf2e26554c72be307368876fd9011e5', '[\"*\"]', NULL, '2022-07-02 18:36:17', '2022-07-02 18:36:17'),
(157, 'App\\Models\\User', 8, 'token', '9b4d579fa5026a3601d193fb84de0b67b8b44ffadb4ebe9215e7843b85a755c3', '[\"*\"]', NULL, '2022-07-02 18:38:43', '2022-07-02 18:38:43'),
(158, 'App\\Models\\User', 8, 'token', 'edf199a2c9faa81434bc9b6a43d0abd2bbfd57012a6856a15e109373a927eac5', '[\"*\"]', NULL, '2022-07-02 18:50:10', '2022-07-02 18:50:10'),
(159, 'App\\Models\\User', 8, 'token', '893a84f792c02c0420b45d5fade355bcbc51ce20617b1011c60155fd9405170d', '[\"*\"]', NULL, '2022-07-02 18:56:57', '2022-07-02 18:56:57'),
(160, 'App\\Models\\User', 8, 'token', '588edd999139023f74a2365d095f224278e57e6b2608782bf51679ec424ba89d', '[\"*\"]', '2022-07-02 18:59:41', '2022-07-02 18:59:31', '2022-07-02 18:59:41'),
(161, 'App\\Models\\User', 8, 'token', '1f25622e55fcb37fb616fb6b806a8aa0f19175b492ea8eec466df92f28b729aa', '[\"*\"]', NULL, '2022-07-02 19:00:38', '2022-07-02 19:00:38'),
(162, 'App\\Models\\User', 8, 'token', '1c78c665c901876c8312d31c4c204fd6c0c185737703f0b438807a3ff4408c96', '[\"*\"]', '2022-07-02 19:05:16', '2022-07-02 19:03:31', '2022-07-02 19:05:16'),
(163, 'App\\Models\\User', 8, 'token', '89d88487608964218758a8af0cba5d2f6734254989ec775c8c350d9692ca4125', '[\"*\"]', '2022-07-04 09:08:18', '2022-07-02 19:05:26', '2022-07-04 09:08:18'),
(164, 'App\\Models\\User', 8, 'token', 'e43bc77c31907b03dd7ea989a01b31e802a1a3e59fe4b2da24b89c3cbd96ec17', '[\"*\"]', NULL, '2022-07-03 19:20:40', '2022-07-03 19:20:40'),
(165, 'App\\Models\\User', 9, 'token', 'dd13381a28f091790befc28d2f1dadc7c543ac119116648543b650d3a9f5cc5c', '[\"*\"]', '2022-07-29 11:02:48', '2022-07-03 19:22:43', '2022-07-29 11:02:48'),
(166, 'App\\Models\\User', 8, 'token', 'b3dda3c9c950f510755b865223b10ae64bc888228d717712716f519d0c882c3e', '[\"*\"]', '2022-07-04 09:32:12', '2022-07-04 09:32:11', '2022-07-04 09:32:12'),
(167, 'App\\Models\\User', 8, 'token', '93a93b8284706824e3b75d62c42bec2b3fa29e3f2c7391b862174bc1d5d91269', '[\"*\"]', '2022-07-04 09:37:06', '2022-07-04 09:36:13', '2022-07-04 09:37:06'),
(168, 'App\\Models\\User', 8, 'token', 'ed5994ce8236d15b9dde7120f1b59e68d00ff5ca27ca2454f2225da76631bb4e', '[\"*\"]', '2022-07-04 09:38:16', '2022-07-04 09:37:05', '2022-07-04 09:38:16'),
(169, 'App\\Models\\User', 8, 'token', '5764a8a0dc69bf573da9aaf84ee1e4ee901f0fa206a3d4024c0ebe864c6b8f12', '[\"*\"]', '2022-07-04 09:38:46', '2022-07-04 09:38:15', '2022-07-04 09:38:46'),
(170, 'App\\Models\\User', 8, 'token', '0d5c68a16703b1d0bc31ffe5311efc4d10695716b629db7d683a976fc1776367', '[\"*\"]', '2022-07-04 11:09:25', '2022-07-04 09:38:45', '2022-07-04 11:09:25'),
(171, 'App\\Models\\User', 8, 'token', 'fc63a0e323f3df60adb9f997a075afcbe5f72ef8dc27fde1410c574ac15eb021', '[\"*\"]', '2022-07-04 11:23:33', '2022-07-04 11:09:35', '2022-07-04 11:23:33'),
(172, 'App\\Models\\User', 8, 'token', '5f78d7ef8ae42f3b6a3d3e0caae87b0e4e5554f239292e78e9a049ff0337cd11', '[\"*\"]', '2022-07-13 12:42:22', '2022-07-04 11:23:32', '2022-07-13 12:42:22'),
(173, 'App\\Models\\User', 9, 'token', '6e8f1ceae98af18585145d9c1157a3cdaa619873346f72312de92ca656f0c086', '[\"*\"]', NULL, '2022-07-13 12:40:03', '2022-07-13 12:40:03'),
(174, 'App\\Models\\User', 8, 'token', '058c819efc1832bb8ff85722ee01cbc92f091a5cb09af8f3e74302e4c84f060a', '[\"*\"]', '2022-07-29 11:02:17', '2022-07-13 12:42:21', '2022-07-29 11:02:17'),
(175, 'App\\Models\\User', 9, 'token', 'bcb996124faa603ab74f782ffa464367ce85ea78226fdcf06198e73bdd8a4b2b', '[\"*\"]', NULL, '2022-07-29 10:30:53', '2022-07-29 10:30:53'),
(176, 'App\\Models\\User', 9, 'token', '9a7aa5a5b5d2fdd3fb7ab5f0b99f8c0c5df60e54bb815fcdf1e5ad95a076f9f3', '[\"*\"]', '2022-07-29 11:08:48', '2022-07-29 11:02:31', '2022-07-29 11:08:48'),
(177, 'App\\Models\\User', 9, 'token', 'e395a19af4457e4d889690dd8051a808938c5de48ce80f8285952a8b58b8c966', '[\"*\"]', '2022-07-29 11:25:15', '2022-07-29 11:09:08', '2022-07-29 11:25:15'),
(178, 'App\\Models\\User', 9, 'token', '87685e7058dffef0a1b0eb1d6a2e48d30e695159c1d92062d9d7374013564917', '[\"*\"]', '2022-08-22 20:26:33', '2022-07-29 11:25:14', '2022-08-22 20:26:33'),
(179, 'App\\Models\\User', 8, 'token', 'd8f6e25d57cd820b2ea51ca00d12a390d0607a891faa782f8fb6378d2fd3e0a6', '[\"*\"]', '2022-08-22 20:30:50', '2022-08-22 20:30:03', '2022-08-22 20:30:50'),
(180, 'App\\Models\\User', 9, 'token', '6f46b9ab9e7891cc6d89ed0b31bf1449d32d21c9e207e9a0697e46f63618a87c', '[\"*\"]', '2022-08-22 20:31:01', '2022-08-22 20:30:50', '2022-08-22 20:31:01'),
(181, 'App\\Models\\User', 8, 'token', '686d54083cccaedf61fcf8e5600fd82ac56651eeb71abcff674e17a55aeed736', '[\"*\"]', '2022-09-24 20:04:35', '2022-09-24 18:09:19', '2022-09-24 20:04:35'),
(182, 'App\\Models\\User', 1, 'token', 'c7f6c47915994124f2b5ec97bcf7dee4e351b3066863a7a1e4b33f7aadda645d', '[\"*\"]', '2023-02-17 10:33:08', '2023-02-17 10:32:13', '2023-02-17 10:33:08'),
(183, 'App\\Models\\User', 1, 'token', '593ba0ab51bd8a8a741261ce9399ce6564319c883af36efd83578a799978b4fd', '[\"*\"]', NULL, '2023-02-17 10:36:49', '2023-02-17 10:36:49'),
(184, 'App\\Models\\User', 1, 'token', '8857b3b130a67bb4ff7a9ccdb55a1f61b74f553813f79f6564a14b186d0e47e3', '[\"*\"]', '2023-02-20 14:01:03', '2023-02-17 10:39:58', '2023-02-20 14:01:03'),
(185, 'App\\Models\\User', 1, 'token', '95f31b8a273d91f47abdfb087ffc07aa87f5635f932b7362c072195f10b6d060', '[\"*\"]', '2023-02-20 15:10:56', '2023-02-20 14:01:01', '2023-02-20 15:10:56'),
(186, 'App\\Models\\User', 1, 'token', 'ecfe2e3072e3547e3d9bbff0398cda4a24b7e817a053e3468c46898b4b7b661a', '[\"*\"]', '2023-02-20 16:31:13', '2023-02-20 15:18:43', '2023-02-20 16:31:13'),
(187, 'App\\Models\\User', 1, 'token', 'c3806b3b4de433ad71d4ec1574086987703ae68d246543c0e6072e1061e5dce1', '[\"*\"]', '2023-03-03 07:29:01', '2023-02-20 16:34:31', '2023-03-03 07:29:01'),
(188, 'App\\Models\\User', 1, 'token', 'b6664483df242c62dcbaa69e444525cdc88ac653ec30c643b5a2a3ba4a6c050d', '[\"*\"]', '2023-03-08 15:06:31', '2023-03-03 07:10:29', '2023-03-08 15:06:31'),
(189, 'App\\Models\\User', 1, 'token', '6812551cfd5ee70bb51059d9db81dec040ebf5a6c1b9681b33154208d04c9222', '[\"*\"]', '2023-03-03 07:30:47', '2023-03-03 07:29:00', '2023-03-03 07:30:47'),
(190, 'App\\Models\\User', 1, 'token', '1983c5e497ca6007ba161732a0c3213c2121754f3c36fd509d3d20119d448631', '[\"*\"]', '2023-03-03 07:57:30', '2023-03-03 07:30:46', '2023-03-03 07:57:30'),
(191, 'App\\Models\\User', 1, 'token', 'e9f19657bab5aecef23d18dfbd568c77ae51844cfe1522a9c84de31b48228106', '[\"*\"]', '2023-03-08 16:16:40', '2023-03-03 07:41:31', '2023-03-08 16:16:40'),
(192, 'App\\Models\\User', 17, 'token', '977d4699692e7dc2f07b9f9f7b5d2c2da37ad4ce5ce02680e1b42a75c3620d23', '[\"*\"]', '2023-03-03 07:59:10', '2023-03-03 07:57:29', '2023-03-03 07:59:10'),
(193, 'App\\Models\\User', 1, 'token', 'b71d0f921f64c01efe8025719a572d67c7d30470aa79fc39721b1080acbee8e8', '[\"*\"]', '2023-03-03 08:35:26', '2023-03-03 07:59:09', '2023-03-03 08:35:26'),
(194, 'App\\Models\\User', 1, 'token', '8445f6bd830c637a5e99cea2fc8e3b371cb4151597faf7e4b98869e5331b9b69', '[\"*\"]', '2023-03-03 08:41:31', '2023-03-03 08:35:25', '2023-03-03 08:41:31'),
(195, 'App\\Models\\User', 17, 'token', '1766fb5063c350c7fcc6ef3e9390aec141f6a61900b1bbdaaffe3bc9a04e6af8', '[\"*\"]', '2023-03-03 08:42:25', '2023-03-03 08:41:30', '2023-03-03 08:42:25'),
(196, 'App\\Models\\User', 1, 'token', 'cab2234e6e88b04c51bb55c0ea13a4a34afd39ae5fffb1e92e074679ad332ce0', '[\"*\"]', '2023-03-03 09:07:01', '2023-03-03 08:42:24', '2023-03-03 09:07:01'),
(197, 'App\\Models\\User', 18, 'token', 'f378900fedbb759a41309d749040ff8a349cb90eaf7b0d81b1add14581d45046', '[\"*\"]', '2023-03-03 09:07:23', '2023-03-03 09:07:00', '2023-03-03 09:07:23'),
(198, 'App\\Models\\User', 1, 'token', '04aa60c5af978b4b4fca4d0541400e42532e8bdd7c5a0054ead45339ff676dd3', '[\"*\"]', '2023-03-03 09:20:01', '2023-03-03 09:07:21', '2023-03-03 09:20:01'),
(199, 'App\\Models\\User', 1, 'token', '170fad5b3b17df0bbecd4a312195796acdc84c812b41226d7f919c1890564a8b', '[\"*\"]', '2023-03-20 16:33:53', '2023-03-08 15:06:47', '2023-03-20 16:33:53'),
(200, 'App\\Models\\User', 1, 'token', '063c9fe43b2c22a6de883b2ee5418d89fe2dd2a0a98159597f7ea1932f341c75', '[\"*\"]', '2023-03-08 16:02:22', '2023-03-08 15:09:21', '2023-03-08 16:02:22'),
(201, 'App\\Models\\User', 19, 'token', '2c5f72952c76086ff654062405c331623d9508ee265d496a626a9e0929efbfdc', '[\"*\"]', '2023-03-08 16:03:34', '2023-03-08 16:02:21', '2023-03-08 16:03:34'),
(202, 'App\\Models\\User', 1, 'token', '5b288e6266493a48aecc78c47a4950ec1581ad07c707bac9f4fac852b9c11288', '[\"*\"]', '2023-03-08 16:06:46', '2023-03-08 16:03:33', '2023-03-08 16:06:46'),
(203, 'App\\Models\\User', 20, 'token', 'b8a99bdba6cba04f1a66eb7b4e78252ae4f56bf7fa5b4262997d9c5fc2c7de30', '[\"*\"]', '2023-03-08 16:39:08', '2023-03-08 16:06:46', '2023-03-08 16:39:08'),
(204, 'App\\Models\\User', 1, 'token', '48bc2d595b791d14b80bc27f5286dc7db811dd2954e47dd4de2d27f47623c276', '[\"*\"]', '2023-03-08 16:41:36', '2023-03-08 16:39:06', '2023-03-08 16:41:36'),
(205, 'App\\Models\\User', 1, 'token', 'b0c92a8390aca8cd4a0e588cb51c4c2cb53273f3ab1ebfab466dfb611618f2bb', '[\"*\"]', '2023-03-13 11:06:42', '2023-03-08 16:41:35', '2023-03-13 11:06:42'),
(206, 'App\\Models\\User', 22, 'token', '0d26b2f8d6c4a8e93e1fdb4135f3836ffbb067481675dcac1bcc28599381dbcd', '[\"*\"]', '2023-03-13 11:41:36', '2023-03-13 11:06:42', '2023-03-13 11:41:36'),
(207, 'App\\Models\\User', 1, 'token', '60044c94ac048ee33dc3b6ba8981c58a2f3c010ab0d8b238529fcddf7b2bef70', '[\"*\"]', '2023-03-13 11:44:47', '2023-03-13 11:41:35', '2023-03-13 11:44:47'),
(208, 'App\\Models\\User', 22, 'token', '03f30f83a8ad7fb5b461080bb9997dde2124e0aa25091ea4fb03d1d12a09e3d8', '[\"*\"]', '2023-03-13 11:47:14', '2023-03-13 11:44:47', '2023-03-13 11:47:14'),
(209, 'App\\Models\\User', 1, 'token', '90ef4a91fbb2e68277f443181d852bcedfbe786e00adaac5e68673885e3c93b2', '[\"*\"]', '2023-03-13 11:47:41', '2023-03-13 11:47:13', '2023-03-13 11:47:41'),
(210, 'App\\Models\\User', 22, 'token', '59fe8f502f913b227a79b3e87d1ca3cfcf69b7b7c8a3eae78ed0ce551f191e08', '[\"*\"]', '2023-03-13 12:00:45', '2023-03-13 11:47:40', '2023-03-13 12:00:45'),
(211, 'App\\Models\\User', 1, 'token', '5f75ebbcc990fa1ceec62fefc00bfa925528dbabad4b46a92eeeeac9ab84b668', '[\"*\"]', '2023-03-13 12:02:27', '2023-03-13 12:00:45', '2023-03-13 12:02:27'),
(212, 'App\\Models\\User', 22, 'token', 'f36956bbb5a1dbadf69dfac709bcc10f0660edfcca4e2f3190a58d991b4c71f7', '[\"*\"]', '2023-03-13 12:05:10', '2023-03-13 12:02:27', '2023-03-13 12:05:10'),
(213, 'App\\Models\\User', 22, 'token', 'efc246fe3158e0c4a0125fa3dbe5f4d408b794e59057f307f61e713428d12679', '[\"*\"]', '2023-03-13 12:06:23', '2023-03-13 12:04:35', '2023-03-13 12:06:23'),
(214, 'App\\Models\\User', 22, 'token', 'b087f1c98fb9b3ad1675d4e3e5f620f5ee60e3f121c3ecc9629a5e137928094c', '[\"*\"]', '2023-03-13 12:14:45', '2023-03-13 12:06:22', '2023-03-13 12:14:45'),
(215, 'App\\Models\\User', 1, 'token', '3fbe43da794cc343f0e4c15783bdf76f6e7db96140228a906e8aa2e57135bdca', '[\"*\"]', '2023-03-13 12:16:29', '2023-03-13 12:14:44', '2023-03-13 12:16:29'),
(216, 'App\\Models\\User', 23, 'token', 'c5c3ac57f36d63a995496fa9224c6426ac67b891d3f5c917e5a2ba99879fff77', '[\"*\"]', '2023-03-13 12:17:22', '2023-03-13 12:16:28', '2023-03-13 12:17:22'),
(217, 'App\\Models\\User', 24, 'token', '2614a2492795f9045ec8d33f754438aa4d7e74a2827d543bde75583178673921', '[\"*\"]', '2023-03-13 12:17:35', '2023-03-13 12:17:21', '2023-03-13 12:17:35'),
(218, 'App\\Models\\User', 1, 'token', '78558d57928a0fb7ac3c3aac9b4f389ca6ebd209a8d5e25ea9762a047f88b270', '[\"*\"]', '2023-03-13 12:19:52', '2023-03-13 12:17:35', '2023-03-13 12:19:52'),
(219, 'App\\Models\\User', 20, 'token', '654f3caed20d8da7363ea0d3fce534388e31f775286f27e25ce9120a0df9e67a', '[\"*\"]', '2023-03-13 12:26:41', '2023-03-13 12:19:51', '2023-03-13 12:26:41'),
(220, 'App\\Models\\User', 23, 'token', 'dd795d5ef2c9ca9f5cd9e6a147e9f6ae20d6f6a3e4cdc3df0a19b81be5c54ea2', '[\"*\"]', '2023-03-15 14:37:22', '2023-03-13 12:26:40', '2023-03-15 14:37:22'),
(221, 'App\\Models\\User', 1, 'token', 'c785bdd1fd85fb884e60963db84f894c1e507698fe7fdd950541b95638b49cce', '[\"*\"]', '2023-03-15 15:02:16', '2023-03-15 14:37:20', '2023-03-15 15:02:16'),
(222, 'App\\Models\\User', 20, 'token', 'a543be5965f71efa667353b8fe068cb410c9907b4eaf60497758b6e3dce814ca', '[\"*\"]', '2023-03-15 15:02:46', '2023-03-15 15:02:15', '2023-03-15 15:02:46'),
(223, 'App\\Models\\User', 1, 'token', 'b67919edd46621c18fa7050bb84cc37ea453f6e4952200d8ab673b17f7eff812', '[\"*\"]', '2023-03-15 16:03:30', '2023-03-15 15:02:45', '2023-03-15 16:03:30'),
(224, 'App\\Models\\User', 23, 'token', '49c745af0385a9ee85f0b70a2eaa2e2b2b0d504f47402183676312738f0f92c2', '[\"*\"]', '2023-03-15 17:00:10', '2023-03-15 16:03:29', '2023-03-15 17:00:10'),
(225, 'App\\Models\\User', 1, 'token', 'bbde94e86a1137086d8829ff653010e2b9d4469866840c8f3a6ea9df86cbfb20', '[\"*\"]', '2023-03-15 17:01:41', '2023-03-15 17:00:09', '2023-03-15 17:01:41'),
(226, 'App\\Models\\User', 23, 'token', '79e23dae57f43d31b986a3426b944f6a979a3408feb44ddccb97c3885984864d', '[\"*\"]', '2023-03-15 17:05:20', '2023-03-15 17:01:40', '2023-03-15 17:05:20'),
(227, 'App\\Models\\User', 1, 'token', '49e3d6fb3d19f6f882c0c3f7c71eedf5e6ea7fd084a3afe2be06ddf8a78bf033', '[\"*\"]', '2023-03-15 17:05:35', '2023-03-15 17:05:19', '2023-03-15 17:05:35'),
(228, 'App\\Models\\User', 24, 'token', 'b1044258fd938d92a50e408f1f97eb046db2275412165b977ceb7accdfee5027', '[\"*\"]', '2023-03-15 17:05:43', '2023-03-15 17:05:34', '2023-03-15 17:05:43'),
(229, 'App\\Models\\User', 1, 'token', 'c2374602d1ea8bcb16458542d3752d4bbbca7813f76c0571a1752bf9107536a7', '[\"*\"]', '2023-03-15 17:08:56', '2023-03-15 17:08:39', '2023-03-15 17:08:56'),
(230, 'App\\Models\\User', 1, 'token', 'a2bfb92ff03a41ee10d9e58206f340b79e8ae1c8a56b4a0cb2fb2df4f15b73b4', '[\"*\"]', '2023-03-15 17:09:18', '2023-03-15 17:08:59', '2023-03-15 17:09:18'),
(231, 'App\\Models\\User', 1, 'token', 'f15be1d5e010a4e03d12dc37d159c155ce1aaf0701ae0d5a9e4c8080f5270698', '[\"*\"]', '2023-03-15 17:13:27', '2023-03-15 17:09:17', '2023-03-15 17:13:27'),
(232, 'App\\Models\\User', 23, 'token', '5bc4f4054aebdabee08b8d0aab014ef0b65af6719550e3321bd56a92dac3b5f5', '[\"*\"]', '2023-03-15 17:14:05', '2023-03-15 17:13:26', '2023-03-15 17:14:05'),
(233, 'App\\Models\\User', 24, 'token', '0f541989fa04905ae63e3d61389501dcadecdc823defc7c2a6daeed919dd7065', '[\"*\"]', '2023-03-15 17:30:53', '2023-03-15 17:14:04', '2023-03-15 17:30:53'),
(234, 'App\\Models\\User', 1, 'token', 'bd2a4c627ea9465d194947a52c7cf282bf44c52e9fb67e4105894ec32b679f45', '[\"*\"]', '2023-03-15 17:31:15', '2023-03-15 17:30:52', '2023-03-15 17:31:15'),
(235, 'App\\Models\\User', 23, 'token', '530027485a0f6eeb3e6b0f863ed2304d15d15219858aeeabdaa70d08e397e0dc', '[\"*\"]', '2023-03-15 17:32:09', '2023-03-15 17:31:14', '2023-03-15 17:32:09'),
(236, 'App\\Models\\User', 20, 'token', 'a7adc83e24808f196e8caba1f133e88a52065f58eb2a530785dcbfc32818b141', '[\"*\"]', '2023-03-15 17:32:55', '2023-03-15 17:32:08', '2023-03-15 17:32:55'),
(237, 'App\\Models\\User', 22, 'token', 'd9304c14aca167b7e63b01718715030774e10cd0dd12f00dadd8ef71390cc61d', '[\"*\"]', '2023-03-15 17:33:10', '2023-03-15 17:32:54', '2023-03-15 17:33:10'),
(238, 'App\\Models\\User', 22, 'token', '4f05932b58168d4b468bb61da8aa7d8c0e6ef994dbc7acd9c5963d40398babf1', '[\"*\"]', '2023-03-15 18:34:17', '2023-03-15 17:33:09', '2023-03-15 18:34:17'),
(239, 'App\\Models\\User', 1, 'token', '1e084ce3d68ae1e6ed449b955c09190f039272c3668b0e5fe5161e38bbe124b6', '[\"*\"]', '2023-03-15 18:34:54', '2023-03-15 18:34:16', '2023-03-15 18:34:54'),
(240, 'App\\Models\\User', 20, 'token', '7ddc74f5c51e9a6f839a69b4d61113a81994d543a0c708da077b2d87f2d49c2f', '[\"*\"]', '2023-03-15 18:35:10', '2023-03-15 18:34:53', '2023-03-15 18:35:10'),
(241, 'App\\Models\\User', 22, 'token', '678cfb85230a3b20a2160249c60a0ef202333cb5748b1a4da8ca17d83d71e674', '[\"*\"]', '2023-03-15 18:35:34', '2023-03-15 18:35:09', '2023-03-15 18:35:34'),
(242, 'App\\Models\\User', 22, 'token', 'd3c97c81ed806f50782f4046b785f669b66035912dc590b63e6c35bcaa891df2', '[\"*\"]', '2023-03-15 18:38:02', '2023-03-15 18:35:33', '2023-03-15 18:38:02'),
(243, 'App\\Models\\User', 1, 'token', '432f90d993c9b84bdc9e7ded7c6056e1397ac98c417ea2c6f747b9c536c1afce', '[\"*\"]', '2023-03-15 18:38:15', '2023-03-15 18:38:01', '2023-03-15 18:38:15'),
(244, 'App\\Models\\User', 1, 'token', '1a6ac89a6e95580f2e7890360a4c71f1f34cefb41e1138188df20721d8d3d2ff', '[\"*\"]', '2023-03-15 18:38:20', '2023-03-15 18:38:15', '2023-03-15 18:38:20'),
(245, 'App\\Models\\User', 1, 'token', '675fa9bfb5626c320a9857cf0fac53cd733fa08eecfc59c376a084fa42f8918f', '[\"*\"]', '2023-03-15 18:40:50', '2023-03-15 18:40:36', '2023-03-15 18:40:50'),
(246, 'App\\Models\\User', 22, 'token', '23a56f1cbe55910d19766b28854c0013884dbf0b3162d65150d61c9d59e15581', '[\"*\"]', '2023-03-15 18:41:03', '2023-03-15 18:40:49', '2023-03-15 18:41:03'),
(247, 'App\\Models\\User', 22, 'token', '00cb2a101e6001171b17840aec91e4ab3af3cce28e68ccdb82a202781c3630fb', '[\"*\"]', '2023-03-15 18:41:05', '2023-03-15 18:41:02', '2023-03-15 18:41:05'),
(248, 'App\\Models\\User', 1, 'token', '03209b4e4d09870569b3dbe25b877832051fb404ea1563ee97e3e06aa317b4e0', '[\"*\"]', '2023-03-15 18:44:32', '2023-03-15 18:44:23', '2023-03-15 18:44:32'),
(249, 'App\\Models\\User', 20, 'token', '859f8654f658bb93aeeaf1cb46a654ae4b0d88c58176e7ca4e17ec5cbfa04ea6', '[\"*\"]', '2023-03-15 18:45:25', '2023-03-15 18:44:46', '2023-03-15 18:45:25'),
(250, 'App\\Models\\User', 22, 'token', '7b24253e1e957c75268b40fe11c13ff9cfab35bb5913142427508bb1b88f2325', '[\"*\"]', '2023-03-15 18:46:39', '2023-03-15 18:45:24', '2023-03-15 18:46:39'),
(251, 'App\\Models\\User', 1, 'token', '5098c2696adeb58ae7370d5f16bbe0fd41a8db7271938e8cc117c2ade903911b', '[\"*\"]', '2023-03-15 18:46:58', '2023-03-15 18:46:38', '2023-03-15 18:46:58'),
(252, 'App\\Models\\User', 20, 'token', 'e3e348676467d07e5697b89a3decc161f7a9676001f6d29fac982b6ef2fe92f3', '[\"*\"]', '2023-03-15 18:47:24', '2023-03-15 18:46:57', '2023-03-15 18:47:24'),
(253, 'App\\Models\\User', 22, 'token', '1f54a4d2726dcd31f5280b959f17d88c5684f960e7741b563d812acdbc3cc84c', '[\"*\"]', '2023-03-15 18:49:48', '2023-03-15 18:47:23', '2023-03-15 18:49:48'),
(254, 'App\\Models\\User', 1, 'token', 'ffcf335ac33ba47c02b73bace83c3176a6ab260364648349f99e41bba59bd223', '[\"*\"]', '2023-03-20 09:22:03', '2023-03-20 06:47:11', '2023-03-20 09:22:03'),
(255, 'App\\Models\\User', 20, 'token', 'ade6f4bc984b4e1a8059c07828c24dafb44bf6069fc57dd1b5e4648df42319b8', '[\"*\"]', '2023-03-20 10:28:54', '2023-03-20 09:22:02', '2023-03-20 10:28:54'),
(256, 'App\\Models\\User', 23, 'token', '4242b667156a44ac848fa204b54547d848054146245cd5c16ef6b748d8362ca7', '[\"*\"]', '2023-03-20 10:29:12', '2023-03-20 10:28:53', '2023-03-20 10:29:12'),
(257, 'App\\Models\\User', 1, 'token', 'e19240de181b326436822c087634c07617e10629bc2c0fb6ab2e451d11142273', '[\"*\"]', '2023-03-20 10:37:39', '2023-03-20 10:29:11', '2023-03-20 10:37:39'),
(258, 'App\\Models\\User', 20, 'token', 'd7f44ede39b38f065e723a845f7698f5b2edcd55a657e81663165da393ddef54', '[\"*\"]', '2023-03-20 10:37:57', '2023-03-20 10:37:39', '2023-03-20 10:37:57'),
(259, 'App\\Models\\User', 23, 'token', '1660b44bb4d3fbad41266444a8d870b0a6c700ec0c04c021b29e048171c2e8af', '[\"*\"]', '2023-03-20 10:39:43', '2023-03-20 10:37:57', '2023-03-20 10:39:43'),
(260, 'App\\Models\\User', 20, 'token', '022e535b5e4a0b95909d9adf97d20f5a9d0f6d8f1a8a86104949aa1280d08544', '[\"*\"]', '2023-03-20 10:40:11', '2023-03-20 10:39:42', '2023-03-20 10:40:11'),
(261, 'App\\Models\\User', 23, 'token', 'f3c02926a079d7ad0c55721c4b45b47cf28ee9defc5450a20d8e0cd89208ae94', '[\"*\"]', '2023-03-20 10:41:30', '2023-03-20 10:40:11', '2023-03-20 10:41:30'),
(262, 'App\\Models\\User', 24, 'token', 'd7352438abc362c35cbe391557d573220ea3ff808443683f6b8c43fa1ec3675f', '[\"*\"]', '2023-03-20 10:48:20', '2023-03-20 10:41:29', '2023-03-20 10:48:20'),
(263, 'App\\Models\\User', 1, 'token', '5f2c3ca71d3aeeef9ece7c63057d1b1507a97cf0fed2281fe3bdafdff1b33e41', '[\"*\"]', '2023-03-20 10:52:23', '2023-03-20 10:48:19', '2023-03-20 10:52:23'),
(264, 'App\\Models\\User', 22, 'token', '1849dc4991f4b624083bf0f4d0a71470f6a3e8fc1eab3e508e31d5fb6acddc49', '[\"*\"]', '2023-03-20 11:45:36', '2023-03-20 10:52:23', '2023-03-20 11:45:36'),
(265, 'App\\Models\\User', 20, 'token', 'c74aa4461ca1a35670c37d95cf1d99c6298aa8ef9dfc20853d9da61f5c8d2de2', '[\"*\"]', '2023-03-20 11:47:03', '2023-03-20 11:45:35', '2023-03-20 11:47:03'),
(266, 'App\\Models\\User', 22, 'token', '8362f5091aab2a75ecdb8c91394eb460de10e622945956ebc0e8f49e9bd90741', '[\"*\"]', '2023-03-20 12:26:06', '2023-03-20 11:47:02', '2023-03-20 12:26:06'),
(267, 'App\\Models\\User', 23, 'token', 'e1a8ab9aa5c94e8e93d766d8c171d703f681b94d3880f036ec5c89eed9b1e769', '[\"*\"]', '2023-03-20 12:26:20', '2023-03-20 12:26:06', '2023-03-20 12:26:20'),
(268, 'App\\Models\\User', 24, 'token', '74fabfbdbfb7609628d34e4e8a8b04b9b281f48bfcf3b01e66665a1b3394fb31', '[\"*\"]', '2023-03-20 12:35:13', '2023-03-20 12:26:19', '2023-03-20 12:35:13'),
(269, 'App\\Models\\User', 1, 'token', '6619b9272a17941fbaf515cbfca0a3f615926a6e3b70359a6dabcfc88e868ea7', '[\"*\"]', '2023-03-20 12:36:24', '2023-03-20 12:35:12', '2023-03-20 12:36:24'),
(270, 'App\\Models\\User', 20, 'token', 'e3c5b75763d1f24da14b4dd48bdba93e7479e0e770ee03e9391822becf25665f', '[\"*\"]', '2023-03-20 12:37:00', '2023-03-20 12:36:23', '2023-03-20 12:37:00'),
(271, 'App\\Models\\User', 24, 'token', '614d5737f74ccd702803a3748c71493bd5a68ff1a5de7f6e45759e3b215dd5c2', '[\"*\"]', '2023-03-20 12:37:12', '2023-03-20 12:37:00', '2023-03-20 12:37:12'),
(272, 'App\\Models\\User', 22, 'token', 'd2cf9e2da284268ed400f79f84c03f672ea3e32e5a87d3ee522e16bb732202e8', '[\"*\"]', '2023-03-20 13:41:41', '2023-03-20 12:37:11', '2023-03-20 13:41:41'),
(273, 'App\\Models\\User', 1, 'token', '63145c82a0774f7718ca71d6abe9d83a5fa016c055205d521872d373a19bff15', '[\"*\"]', '2023-03-20 13:42:54', '2023-03-20 13:42:28', '2023-03-20 13:42:54'),
(274, 'App\\Models\\User', 1, 'token', '161991a816c4533ac11ae16dd44639ccd2731457653dfd6aa40cc3cafb7ffefb', '[\"*\"]', '2023-03-20 13:56:56', '2023-03-20 13:42:53', '2023-03-20 13:56:56'),
(275, 'App\\Models\\User', 20, 'token', '9012edff6de49fbdeec7fe3eaf3c52da2838f84e745a12325e88319594623fc7', '[\"*\"]', '2023-03-20 13:57:23', '2023-03-20 13:56:55', '2023-03-20 13:57:23'),
(276, 'App\\Models\\User', 23, 'token', '2a878821ab59142d60f4f6e82205c937b8774bb6baeea53de2751d3b6d4098b7', '[\"*\"]', '2023-03-20 13:58:05', '2023-03-20 13:57:22', '2023-03-20 13:58:05'),
(277, 'App\\Models\\User', 1, 'token', '9f12d65777f9431e16319f5693b600851d41c83d7e62d5d36782138eec7299ac', '[\"*\"]', '2023-03-20 14:00:14', '2023-03-20 13:58:03', '2023-03-20 14:00:14'),
(278, 'App\\Models\\User', 29, 'token', 'a0bfb555790a7b14eb1fb947cc8bb404d5bfd8c908935362d1a63e09962aaed0', '[\"*\"]', '2023-03-20 14:06:06', '2023-03-20 14:00:12', '2023-03-20 14:06:06'),
(279, 'App\\Models\\User', 29, 'token', '830c432933e18bbd1141403c431188ca9c00e796a3bac5a241b263de37ed968d', '[\"*\"]', '2023-03-20 14:06:55', '2023-03-20 14:06:05', '2023-03-20 14:06:55');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(280, 'App\\Models\\User', 30, 'token', 'f92a8fec7b665ad7be6a1ee18c779a2ebd1441697eefaaeb0dfb271e2184fe55', '[\"*\"]', '2023-03-20 14:11:51', '2023-03-20 14:06:54', '2023-03-20 14:11:51'),
(281, 'App\\Models\\User', 22, 'token', '9af93488bf013d8b99cef2f4a5483a40d2893824988b415bc3f986fc8cff172c', '[\"*\"]', '2023-03-20 14:12:32', '2023-03-20 14:11:49', '2023-03-20 14:12:32'),
(282, 'App\\Models\\User', 1, 'token', '5890374133f730e86058e4cefea621bfc8c14dafbd41a7424e3e8aebf5dda614', '[\"*\"]', '2023-03-20 14:17:27', '2023-03-20 14:12:30', '2023-03-20 14:17:27'),
(283, 'App\\Models\\User', 20, 'token', '32c5a44f56ae2194a20b0f18a8d74633f8eb6dc7ae3113153a6a1fe02b8078cd', '[\"*\"]', '2023-03-20 14:28:49', '2023-03-20 14:17:25', '2023-03-20 14:28:49'),
(284, 'App\\Models\\User', 1, 'token', '868a2062a080b0f7b81f045da4eb9b71d3ddd8008179ff042e5eba190e579d06', '[\"*\"]', '2023-03-20 14:43:08', '2023-03-20 14:28:47', '2023-03-20 14:43:08'),
(285, 'App\\Models\\User', 20, 'token', 'ffeda19ddf3384be9187c7ecf5c26f36a43281de3f730412048bfe8e36e0a8ca', '[\"*\"]', '2023-03-20 14:44:43', '2023-03-20 14:43:07', '2023-03-20 14:44:43'),
(286, 'App\\Models\\User', 1, 'token', '3e32cab100da32547b19cd342175c0b3ad9184d7299861e54cf3af2aab2fbcb3', '[\"*\"]', '2023-03-20 14:46:17', '2023-03-20 14:44:42', '2023-03-20 14:46:17'),
(287, 'App\\Models\\User', 31, 'token', 'e4586c6897d0e96bf70d02f3bfcd37a2d2ba9a7a755f79f10154679bad9f8ba0', '[\"*\"]', '2023-03-20 14:47:13', '2023-03-20 14:46:16', '2023-03-20 14:47:13'),
(288, 'App\\Models\\User', 32, 'token', '68db73b143107796bdb0afca5e7f0f848ed44eb6a4e6e40afddd8613d1c9dff4', '[\"*\"]', '2023-03-20 14:48:07', '2023-03-20 14:47:47', '2023-03-20 14:48:07'),
(289, 'App\\Models\\User', 20, 'token', 'b60dc248d5045c351fd7d3f0dfa1eea25a73d27947690ecff1c62633b9606fa3', '[\"*\"]', '2023-03-20 14:48:20', '2023-03-20 14:48:06', '2023-03-20 14:48:20'),
(290, 'App\\Models\\User', 22, 'token', '2f8e31eb25fc54c6a03145d62b9e4e67ae5e26e33c081185724b5843969239e8', '[\"*\"]', '2023-03-20 14:48:45', '2023-03-20 14:48:31', '2023-03-20 14:48:45'),
(291, 'App\\Models\\User', 20, 'token', '489ce66d285fb46deb33f9ac041d7892295e3fd87a6fe23405cae47af3b80c30', '[\"*\"]', '2023-03-22 06:53:52', '2023-03-22 06:53:37', '2023-03-22 06:53:52'),
(292, 'App\\Models\\User', 22, 'token', '70af99e569aa30cd95318c6e096e6e6e057bf56c4188caae1367053001f7e2d6', '[\"*\"]', '2023-03-22 06:54:40', '2023-03-22 06:54:04', '2023-03-22 06:54:40'),
(293, 'App\\Models\\User', 1, 'token', '07ea006d303c5181a1c7660cedcbc4c4c1b4e7cb5fb456f7ac5e2e1147d2043c', '[\"*\"]', '2023-03-22 10:26:34', '2023-03-22 10:16:01', '2023-03-22 10:26:34'),
(294, 'App\\Models\\User', 20, 'token', '98659643b3f0c20ebdd85e62e5848900f9a1c5d413e3635d2f2542eb95c1775e', '[\"*\"]', '2023-03-22 10:26:59', '2023-03-22 10:26:33', '2023-03-22 10:26:59'),
(295, 'App\\Models\\User', 22, 'token', 'c00e40fd6ff421af1fcc7d6227f74c975f9933346e7b1b1447ef387d1c35f327', '[\"*\"]', '2023-03-22 10:30:43', '2023-03-22 10:26:58', '2023-03-22 10:30:43'),
(296, 'App\\Models\\User', 1, 'token', '20007a195c99a707e8759b848b055e8b9ae11303238e84945cb8d3581af9bbd4', '[\"*\"]', '2023-03-22 10:34:27', '2023-03-22 10:30:43', '2023-03-22 10:34:27'),
(297, 'App\\Models\\User', 22, 'token', 'eb7e22f1ba694e011535d39f7e820923694a2335f9ee74d3fa6411449e52d8cd', '[\"*\"]', '2023-03-22 10:34:59', '2023-03-22 10:34:27', '2023-03-22 10:34:59'),
(298, 'App\\Models\\User', 1, 'token', 'd47c44196299fa433a6be000f479f43fb5b0251337cec75e3faa1efac17ebd12', '[\"*\"]', '2023-03-22 10:35:11', '2023-03-22 10:34:58', '2023-03-22 10:35:11'),
(299, 'App\\Models\\User', 22, 'token', 'ca7a43ceaf746001a2e9dd691b90f5615f1d8456b92a34a9a41c0fc9f3061209', '[\"*\"]', '2023-03-22 10:37:38', '2023-03-22 10:35:10', '2023-03-22 10:37:38'),
(300, 'App\\Models\\User', 1, 'token', 'c3f5f7dd50df82c3fd27ef23ea22c1eacb9c5e0e4ee9edb3e60517dade83109e', '[\"*\"]', '2023-03-22 10:39:10', '2023-03-22 10:36:50', '2023-03-22 10:39:10'),
(301, 'App\\Models\\User', 20, 'token', 'dd629df9fd80cd5702f7d126cd23b4049542b04333b8c6cb876d93ee1a65b2f3', '[\"*\"]', '2023-03-22 10:45:08', '2023-03-22 10:39:10', '2023-03-22 10:45:08'),
(302, 'App\\Models\\User', 1, 'token', '4eb3912e81b740804f7343b70f127090e3ca0373a3e2ca2f6275cf508f948ecf', '[\"*\"]', '2023-03-22 10:49:18', '2023-03-22 10:45:07', '2023-03-22 10:49:18'),
(303, 'App\\Models\\User', 20, 'token', 'e9ef3da02b4f89fc3b843c9707cecf8de1d98157776d9926941707709ba92a9e', '[\"*\"]', '2023-03-22 10:59:26', '2023-03-22 10:49:18', '2023-03-22 10:59:26'),
(304, 'App\\Models\\User', 1, 'token', '7d8ef5cdc9cd5caf183bf229533cae3831cca24c5a1fc386ff7bb19976dc636c', '[\"*\"]', '2023-03-22 11:11:09', '2023-03-22 10:59:25', '2023-03-22 11:11:09'),
(305, 'App\\Models\\User', 20, 'token', '254089e87535f444bcaa42fdd28aab95b26b287b3a363161329278dd56d2d957', '[\"*\"]', '2023-03-22 11:15:29', '2023-03-22 11:11:09', '2023-03-22 11:15:29'),
(306, 'App\\Models\\User', 1, 'token', 'fc99169c70fb820251a6aa5ee38d5f4548b2bb014e5ba4e07ce7477f6bc23f13', '[\"*\"]', '2023-03-22 11:31:14', '2023-03-22 11:15:28', '2023-03-22 11:31:14'),
(307, 'App\\Models\\User', 20, 'token', '5ba76411024c117ffef5deaa61168673b90c93fa68a6f60643d23424ae928a62', '[\"*\"]', '2023-03-22 11:34:01', '2023-03-22 11:31:13', '2023-03-22 11:34:01'),
(308, 'App\\Models\\User', 1, 'token', 'd37b688d7c6706006e721d831421b03c941598ca148fc20494f44d927ef55b08', '[\"*\"]', '2023-03-22 11:37:33', '2023-03-22 11:34:00', '2023-03-22 11:37:33'),
(309, 'App\\Models\\User', 22, 'token', '6bd9fb00251815bc85583d71b357e27f30f78743858565683ae1b721f1578ce4', '[\"*\"]', '2023-03-22 11:37:43', '2023-03-22 11:37:32', '2023-03-22 11:37:43'),
(310, 'App\\Models\\User', 20, 'token', 'ef0b42acf8dc62c2421c1de3f0eb19c756c0097e2d68fc10287d8f533c0908cf', '[\"*\"]', '2023-03-22 11:38:48', '2023-03-22 11:37:42', '2023-03-22 11:38:48'),
(311, 'App\\Models\\User', 1, 'token', 'fda166dc946066e461a68509a4ea350cd81a6699966402c96fb2b18ba3443f91', '[\"*\"]', '2023-03-22 11:39:20', '2023-03-22 11:38:47', '2023-03-22 11:39:20'),
(312, 'App\\Models\\User', 20, 'token', 'd11a77d387a29540d027844bd0c42d587ecd89fd3618c673dcf8fb9d0f0624aa', '[\"*\"]', '2023-03-22 11:41:50', '2023-03-22 11:39:19', '2023-03-22 11:41:50'),
(313, 'App\\Models\\User', 1, 'token', '8d131a14f620ccb55d1e753e86ac27760f2a141e1d183ce92dc7edfeff6aea13', '[\"*\"]', '2023-03-22 11:43:00', '2023-03-22 11:41:49', '2023-03-22 11:43:00'),
(314, 'App\\Models\\User', 1, 'token', '33b124be97abc3d1abc632f3694ef3d203aa4efc113d862ab095b21a45555d2a', '[\"*\"]', '2023-03-22 11:43:17', '2023-03-22 11:42:59', '2023-03-22 11:43:17'),
(315, 'App\\Models\\User', 20, 'token', '18cd83aa187a5a8e865b7eee6c6b181ea90e60bfd2a98d0049f125022c85ff59', '[\"*\"]', '2023-03-22 11:49:24', '2023-03-22 11:43:16', '2023-03-22 11:49:24'),
(316, 'App\\Models\\User', 1, 'token', 'e5f3893ebf282f6e99436c146e5145cd79ebb781a72829d21ae8c67a176f5474', '[\"*\"]', '2023-03-22 11:53:26', '2023-03-22 11:49:23', '2023-03-22 11:53:26'),
(317, 'App\\Models\\User', 20, 'token', '232e4b10bd04f4e4d012569004ea46a27149911a903c18229cb4ff637d9973e4', '[\"*\"]', '2023-03-22 11:54:44', '2023-03-22 11:53:25', '2023-03-22 11:54:44'),
(318, 'App\\Models\\User', 1, 'token', '444ee34a54f57fdf4b88c4f39a8cd3ac374fb37fa94bf3d86a0cf34dedec1575', '[\"*\"]', '2023-03-22 12:00:07', '2023-03-22 11:54:52', '2023-03-22 12:00:07'),
(319, 'App\\Models\\User', 1, 'token', '9f53b74ed68c4f2229d38981347259afee598e240395ac0004af06a46489b2d3', '[\"*\"]', '2023-03-22 12:00:20', '2023-03-22 12:00:06', '2023-03-22 12:00:20'),
(320, 'App\\Models\\User', 1, 'token', 'd5e87fe574829008ba3eaabf2c1f43216a8510dad0bbf0644b3383bf9616fcdf', '[\"*\"]', '2023-03-22 12:00:35', '2023-03-22 12:00:19', '2023-03-22 12:00:35'),
(321, 'App\\Models\\User', 20, 'token', '8a58c155085aa3a470aed8791370d74d5241cac77037be6e04a8fc7a12a68ff6', '[\"*\"]', '2023-03-22 12:01:09', '2023-03-22 12:00:34', '2023-03-22 12:01:09'),
(322, 'App\\Models\\User', 1, 'token', '114ca7d343abbca31a90d3c2c9c278871c1407336cd566e88e60c45a1d311092', '[\"*\"]', '2023-03-22 12:01:24', '2023-03-22 12:01:08', '2023-03-22 12:01:24'),
(323, 'App\\Models\\User', 20, 'token', 'c93b0ac177e34136c8db3d33628b24227f6e7961e590fff864cbdb3fbac1ea86', '[\"*\"]', '2023-03-22 12:04:02', '2023-03-22 12:01:24', '2023-03-22 12:04:02'),
(324, 'App\\Models\\User', 20, 'token', 'c8c96c15f6a5d89deed1bf1a4dcd120bd66395af33089ef922dbe502658ffb6d', '[\"*\"]', '2023-03-22 12:04:15', '2023-03-22 12:04:02', '2023-03-22 12:04:15'),
(325, 'App\\Models\\User', 1, 'token', '6a9f02a205fa28472ab18edb67cff464415c7ef5debc4ee7cfd5a23c441d544f', '[\"*\"]', '2023-03-22 12:04:52', '2023-03-22 12:04:15', '2023-03-22 12:04:52'),
(326, 'App\\Models\\User', 20, 'token', '7538455f91c46d28cf64f372cd1b817a979a052ebd90a82f2b80a3ac8072eac5', '[\"*\"]', '2023-03-22 12:05:31', '2023-03-22 12:04:51', '2023-03-22 12:05:31'),
(327, 'App\\Models\\User', 1, 'token', 'b2c8c771f6f6892770cde8d39fd99b923496b037abdc168b358cdbc9a4bfec9a', '[\"*\"]', '2023-03-22 12:07:03', '2023-03-22 12:05:31', '2023-03-22 12:07:03'),
(328, 'App\\Models\\User', 1, 'token', 'a6b459a3ff94bee586c21714ec622403677851f32ffd8fba1f4e279f6e7a8318', '[\"*\"]', '2023-03-22 12:07:22', '2023-03-22 12:07:02', '2023-03-22 12:07:22'),
(329, 'App\\Models\\User', 20, 'token', 'af34d2573be4129745ba55b1d80a95b2fd784380704dfa2bc9e7345df1a7576d', '[\"*\"]', '2023-03-22 12:10:23', '2023-03-22 12:07:21', '2023-03-22 12:10:23'),
(330, 'App\\Models\\User', 1, 'token', '820e89ce1564971393093c649604218b9a49a743e4f8930a09efad2316442a46', '[\"*\"]', '2023-03-22 12:10:37', '2023-03-22 12:10:22', '2023-03-22 12:10:37'),
(331, 'App\\Models\\User', 20, 'token', 'e50f968668248d20480323a69542fd32f9c2ce7f11f1bfe5f7c0db9986edfacb', '[\"*\"]', '2023-03-22 12:14:31', '2023-03-22 12:10:37', '2023-03-22 12:14:31'),
(332, 'App\\Models\\User', 1, 'token', 'cc074983b1ef7cba49ecea201b010031f63ffba1f9b14c9b38488b97de0f8cdb', '[\"*\"]', '2023-03-22 12:14:44', '2023-03-22 12:14:30', '2023-03-22 12:14:44'),
(333, 'App\\Models\\User', 20, 'token', 'da880074c7a1e8c4253e4e50cc797e8259d78c211c21ba1adc01da9e59d59eba', '[\"*\"]', '2023-03-22 12:14:57', '2023-03-22 12:14:43', '2023-03-22 12:14:57'),
(334, 'App\\Models\\User', 22, 'token', 'dd9cedaca3dfd527edd134f787f1b46b2e0871e1939a78968b98a6db8e544f20', '[\"*\"]', '2023-03-22 12:15:05', '2023-03-22 12:14:56', '2023-03-22 12:15:05'),
(335, 'App\\Models\\User', 1, 'token', '06a6f8e3877c2ae0253b7d02e01e5f1e552b4a49c431e9e167e21d5b06fffa11', '[\"*\"]', '2023-03-22 12:15:17', '2023-03-22 12:15:04', '2023-03-22 12:15:17'),
(336, 'App\\Models\\User', 20, 'token', 'c063505f5ea5ddf51cbf53a09b3d3e9b8df1af9a14780cbb373e9161760bffcc', '[\"*\"]', '2023-03-22 12:15:29', '2023-03-22 12:15:17', '2023-03-22 12:15:29'),
(337, 'App\\Models\\User', 22, 'token', '02025251f10dfacc6043b787f6101b17d01927fb4da80667db9bbb8d09316bdb', '[\"*\"]', '2023-03-22 12:15:37', '2023-03-22 12:15:28', '2023-03-22 12:15:37'),
(338, 'App\\Models\\User', 1, 'token', 'e0fa430cbe576208f2029ca858c351013203170bf11c97e218ffa0b8f9261687', '[\"*\"]', '2023-03-22 12:16:47', '2023-03-22 12:15:36', '2023-03-22 12:16:47'),
(339, 'App\\Models\\User', 20, 'token', '65f4799c3d648cbf31b75e5bee1d277de8c0b7414955a14be827206af7c26345', '[\"*\"]', '2023-03-22 12:17:11', '2023-03-22 12:16:46', '2023-03-22 12:17:11'),
(340, 'App\\Models\\User', 22, 'token', '5618319f4d5d04d643ebfd9bde362bb4d5cc3c57bb9d8ce49e29e9cbb7aecc76', '[\"*\"]', '2023-03-22 12:17:16', '2023-03-22 12:17:10', '2023-03-22 12:17:16'),
(341, 'App\\Models\\User', 1, 'token', '721fdb44ff10f4963ebe59be43ee8931724556b70e33e66bdb589f354b13ef0b', '[\"*\"]', '2023-03-22 12:21:01', '2023-03-22 12:17:15', '2023-03-22 12:21:01'),
(342, 'App\\Models\\User', 20, 'token', '5ab127d846d11ba6b10c3d578ceba553d86c83bb4b10d0eaa7b100c25f4c8b3d', '[\"*\"]', '2023-03-22 12:21:19', '2023-03-22 12:21:00', '2023-03-22 12:21:19'),
(343, 'App\\Models\\User', 1, 'token', '7da3c538951a6a8d789c95713983956c970949c92236c6915e350bf38528d30c', '[\"*\"]', '2023-03-22 12:21:35', '2023-03-22 12:21:18', '2023-03-22 12:21:35'),
(344, 'App\\Models\\User', 20, 'token', 'e8befb3f41180690f0f97cd6eae521b2ae3b056cabb737955c84d4fde3bbb354', '[\"*\"]', '2023-03-22 12:22:19', '2023-03-22 12:21:34', '2023-03-22 12:22:19'),
(345, 'App\\Models\\User', 23, 'token', 'f623dac84115b3d7aafc24d7a598900dc20fc87175a683079ccb2b0a9f6d80a2', '[\"*\"]', '2023-03-22 12:22:38', '2023-03-22 12:22:18', '2023-03-22 12:22:38'),
(346, 'App\\Models\\User', 20, 'token', 'a48bec6d532ed6e34ba9742e8b47e8b0d2574bf9dafbb16d1cd026692c203a58', '[\"*\"]', '2023-03-22 12:25:25', '2023-03-22 12:22:37', '2023-03-22 12:25:25'),
(347, 'App\\Models\\User', 1, 'token', 'c32ec48a1129ecb809611854f2d87740cfc4c627f1fde66b62916a7d5606889d', '[\"*\"]', '2023-03-22 12:26:30', '2023-03-22 12:25:24', '2023-03-22 12:26:30'),
(348, 'App\\Models\\User', 20, 'token', '6ee2cce3721b6ce2f39c50cde9133eeaab1df7926f2667f9366dec6334867128', '[\"*\"]', '2023-03-22 12:26:47', '2023-03-22 12:26:29', '2023-03-22 12:26:47'),
(349, 'App\\Models\\User', 23, 'token', '92e003fdad5a5604d5a1e8f19dc85325130ed8cf89c494c5290e1ec4ff9bdd64', '[\"*\"]', '2023-03-22 12:27:16', '2023-03-22 12:26:46', '2023-03-22 12:27:16'),
(350, 'App\\Models\\User', 20, 'token', '82987bedcd4e627b43ca112a6c02159ce792500c2b9ec5fbbbe25e9fbd697b98', '[\"*\"]', '2023-03-22 12:27:38', '2023-03-22 12:27:15', '2023-03-22 12:27:38'),
(351, 'App\\Models\\User', 20, 'token', '094df0376d410f32ef5d5254adb40f0cc54608c956f2fd007f9a67cd46d00776', '[\"*\"]', '2023-03-22 12:27:53', '2023-03-22 12:27:37', '2023-03-22 12:27:53'),
(352, 'App\\Models\\User', 23, 'token', '6516ac6a971f9665b05d6dbf56a55da6765661fab81f9c7e30caca9ae3bbb188', '[\"*\"]', '2023-03-22 12:28:59', '2023-03-22 12:27:52', '2023-03-22 12:28:59'),
(353, 'App\\Models\\User', 22, 'token', 'a7d4accbc96d61c4e0003ac7e5461103f48cf469abfd3eac765ca12279886f94', '[\"*\"]', '2023-03-22 12:29:06', '2023-03-22 12:28:58', '2023-03-22 12:29:06'),
(354, 'App\\Models\\User', 1, 'token', 'c653c6bf9f1f4d46bcd3418fd21c6231a2950fb76f6606027ad1c742dffe5823', '[\"*\"]', '2023-03-22 12:29:18', '2023-03-22 12:29:05', '2023-03-22 12:29:18'),
(355, 'App\\Models\\User', 20, 'token', 'cee20aec5bd6cbaca27cad4dccd6e8e49cee8d88327683abce9e719708a9c4d2', '[\"*\"]', '2023-03-22 12:29:27', '2023-03-22 12:29:17', '2023-03-22 12:29:27'),
(356, 'App\\Models\\User', 24, 'token', '31003ef00110740113d17bfd1c703509a7ea6dbbeb56ac33ddbe81c2b062abbb', '[\"*\"]', '2023-03-22 12:42:27', '2023-03-22 12:29:26', '2023-03-22 12:42:27'),
(357, 'App\\Models\\User', 1, 'token', '63c2011affeafff408afc63c8cbc0389fceaf237a3e07cd74c452d8e810f40f8', '[\"*\"]', '2023-03-22 12:44:59', '2023-03-22 12:42:26', '2023-03-22 12:44:59'),
(358, 'App\\Models\\User', 33, 'token', 'b64b6542fa7a5a31feac67e948eba9c65b24a2673c822a5cca441e036349e542', '[\"*\"]', '2023-03-22 13:28:22', '2023-03-22 12:44:58', '2023-03-22 13:28:22'),
(359, 'App\\Models\\User', 34, 'token', '656819b18a23e4f9552d2e52f0ecf4a3d718a63684ed08e95854ec84d685deb0', '[\"*\"]', '2023-03-22 13:28:31', '2023-03-22 13:28:21', '2023-03-22 13:28:31'),
(360, 'App\\Models\\User', 1, 'token', '8e07ee099502101d7666b0a1dead31c9b0a878056eca814d77e5f9dc7da0a557', '[\"*\"]', '2023-03-22 13:33:58', '2023-03-22 13:28:30', '2023-03-22 13:33:58'),
(361, 'App\\Models\\User', 1, 'token', '8d88ce3ebf419c1ff7644d4986ff08028941362a25e478aeb3af972610ce4ca1', '[\"*\"]', '2023-03-22 13:35:38', '2023-03-22 13:33:57', '2023-03-22 13:35:38'),
(362, 'App\\Models\\User', 1, 'token', '30fea5cebec0dff18cfb958d4187d64b05afe1193fdf5e51ea576926dd293aaa', '[\"*\"]', '2023-03-22 13:35:53', '2023-03-22 13:35:37', '2023-03-22 13:35:53'),
(363, 'App\\Models\\User', 20, 'token', 'c7ccf65f70edca42e456b765f912424c8552760d95d572d49b9f81725e7345bf', '[\"*\"]', '2023-03-22 13:36:19', '2023-03-22 13:35:52', '2023-03-22 13:36:19'),
(364, 'App\\Models\\User', 23, 'token', '34fa21c9ef3df625cd6545a2a50723b32f59659d6a615fd0a0f49ae1cd3b6f2d', '[\"*\"]', '2023-03-22 13:38:06', '2023-03-22 13:36:18', '2023-03-22 13:38:06'),
(365, 'App\\Models\\User', 1, 'token', '01af8194f6d9111235ec47f6d3a1913a0a8e7cbc2e546b769cdfb3f4f1f10162', '[\"*\"]', '2023-03-22 13:41:02', '2023-03-22 13:38:05', '2023-03-22 13:41:02'),
(366, 'App\\Models\\User', 20, 'token', '645b46de3e0fecfac7806259fa31b55394d261290ca7ab6e0fd8efe6ac70847a', '[\"*\"]', '2023-03-22 13:43:17', '2023-03-22 13:41:02', '2023-03-22 13:43:17'),
(367, 'App\\Models\\User', 1, 'token', '2ebf67d313638c5a11e3025d1dee55e6aa467300f989b24a7ab17e794c45d4eb', '[\"*\"]', '2023-03-22 13:44:58', '2023-03-22 13:43:16', '2023-03-22 13:44:58'),
(368, 'App\\Models\\User', 20, 'token', 'b47765d20a66a3bece87c6988a70807588b77c20b752bb55fc7e6cc0401118c5', '[\"*\"]', '2023-03-22 13:45:40', '2023-03-22 13:44:57', '2023-03-22 13:45:40'),
(369, 'App\\Models\\User', 1, 'token', '3d16ddd4b8886a695282358f5000b01606d39b8e77479f1423550677f10af9a5', '[\"*\"]', '2023-03-22 13:46:45', '2023-03-22 13:45:39', '2023-03-22 13:46:45'),
(370, 'App\\Models\\User', 20, 'token', 'e52c70b68373539f54bb002e93dd039450e263f1cf345e4574d22f14a9e3860e', '[\"*\"]', '2023-03-22 13:49:31', '2023-03-22 13:46:44', '2023-03-22 13:49:31'),
(371, 'App\\Models\\User', 1, 'token', '89e86272a03a3f4d35742636576d054d96465c8badcb62d09223e9001900cd39', '[\"*\"]', '2023-03-22 13:50:19', '2023-03-22 13:49:30', '2023-03-22 13:50:19'),
(372, 'App\\Models\\User', 20, 'token', '1c69eb9b493d3c9c9a8eec163e8a0f466a16e8323dfcdb369a2ab4ed11953830', '[\"*\"]', '2023-03-22 13:52:57', '2023-03-22 13:50:18', '2023-03-22 13:52:57'),
(373, 'App\\Models\\User', 20, 'token', '8e2392e7a2b1432445002972493d189ec2fb9d9df43e7c08d01cc50e9b34e330', '[\"*\"]', '2023-03-22 13:53:05', '2023-03-22 13:52:57', '2023-03-22 13:53:05'),
(374, 'App\\Models\\User', 1, 'token', '8b0f53a93a2b149db01ffa3dc6ba840b019ae19f1db4fa4dcc50464a69a2b8a7', '[\"*\"]', '2023-03-22 13:53:21', '2023-03-22 13:53:04', '2023-03-22 13:53:21'),
(375, 'App\\Models\\User', 23, 'token', '6b4cb9f394a1fe8c7db9b20c708b3678c3cd196711eebf09f82820d9c0e51733', '[\"*\"]', '2023-03-22 13:54:15', '2023-03-22 13:53:20', '2023-03-22 13:54:15'),
(376, 'App\\Models\\User', 1, 'token', 'a06f4727fbe4b38c8b37109e608107a2f214e1ccabb5818b640460e658e0948f', '[\"*\"]', '2023-03-22 13:54:37', '2023-03-22 13:54:14', '2023-03-22 13:54:37'),
(377, 'App\\Models\\User', 20, 'token', '61b286e45d0be3b96a84ee6b2806530b749f4ff25c0ac3dd0602f09790badc66', '[\"*\"]', '2023-03-22 13:54:50', '2023-03-22 13:54:37', '2023-03-22 13:54:50'),
(378, 'App\\Models\\User', 23, 'token', 'e0d19051b23a76ecefe8d200957627f12aee11dc065f5838f3975a2bb9f43f94', '[\"*\"]', '2023-03-22 13:55:10', '2023-03-22 13:54:49', '2023-03-22 13:55:10'),
(379, 'App\\Models\\User', 20, 'token', 'aff978292faee1f7447a7bb80b016fea41aaa421303dfb943df577596ba01687', '[\"*\"]', '2023-03-22 13:55:28', '2023-03-22 13:55:09', '2023-03-22 13:55:28'),
(380, 'App\\Models\\User', 1, 'token', '84e175e740249417876f62f11905eca708a9863e37ecf40183d5763a293f81b3', '[\"*\"]', '2023-03-22 13:55:39', '2023-03-22 13:55:27', '2023-03-22 13:55:39'),
(381, 'App\\Models\\User', 23, 'token', '9cc0fcb092172bcc20498228732d1301fdb3f124f404ec889107877bf9fca956', '[\"*\"]', '2023-03-22 13:55:50', '2023-03-22 13:55:38', '2023-03-22 13:55:50'),
(382, 'App\\Models\\User', 20, 'token', '6972aa2f3331afc3fa04d5e32f7227efa768270bdd2a72d0d0aa1ff411ac5703', '[\"*\"]', '2023-03-22 13:56:11', '2023-03-22 13:55:49', '2023-03-22 13:56:11'),
(383, 'App\\Models\\User', 22, 'token', 'e58f46c9c60287e2f9101d8e11366d593de991be532cb54a1cd289109ccfa5d7', '[\"*\"]', '2023-03-22 13:56:21', '2023-03-22 13:56:10', '2023-03-22 13:56:21'),
(384, 'App\\Models\\User', 24, 'token', '82812943ba44099f7632555f3ef43d7066b8f48e42c9b4a08e7082e0dfa63c9e', '[\"*\"]', '2023-03-22 13:58:11', '2023-03-22 13:56:20', '2023-03-22 13:58:11'),
(385, 'App\\Models\\User', 22, 'token', '2ff7896615dd20e11bb531f351ede952db1fae8f322f475497945e1b6ce3ee2c', '[\"*\"]', '2023-03-22 14:00:32', '2023-03-22 13:58:10', '2023-03-22 14:00:32'),
(386, 'App\\Models\\User', 24, 'token', '67f7bba59c8da4644071193ee90d328456e6f7862a7eddc8aab23548e15897de', '[\"*\"]', '2023-03-22 14:01:22', '2023-03-22 14:00:31', '2023-03-22 14:01:22'),
(387, 'App\\Models\\User', 22, 'token', '8cf83351dde3a279231d3a2f97b5c73ec8e6024fdf62492c5b35559d71e1ff97', '[\"*\"]', '2023-03-22 14:02:28', '2023-03-22 14:01:21', '2023-03-22 14:02:28'),
(388, 'App\\Models\\User', 24, 'token', '4e83ec0dcdbc1cabecbb8b930ab284776e4b7b3b17d87499a0d9276e9ed6e564', '[\"*\"]', '2023-03-22 14:02:42', '2023-03-22 14:02:27', '2023-03-22 14:02:42'),
(389, 'App\\Models\\User', 22, 'token', '463a239871b92e2cfca028176f4e0b43528881b612f56139df4d88a19378b222', '[\"*\"]', '2023-03-22 14:03:28', '2023-03-22 14:02:41', '2023-03-22 14:03:28'),
(390, 'App\\Models\\User', 24, 'token', 'baf30feae48ee8afd2c1b18d6cae35bc030cab1e585e06263f521d8b77e7677b', '[\"*\"]', '2023-03-22 14:05:57', '2023-03-22 14:03:27', '2023-03-22 14:05:57'),
(391, 'App\\Models\\User', 22, 'token', '1faae0bf617cabc5f23c9744e28a154b61305aea9694a3f9e0f783ec172a69e1', '[\"*\"]', '2023-03-22 14:06:56', '2023-03-22 14:05:56', '2023-03-22 14:06:56'),
(392, 'App\\Models\\User', 24, 'token', '0313d03d9e5a516637158cff941f1fa67e3eff60e773b348b6d93f6b66bc09b7', '[\"*\"]', '2023-03-22 14:08:02', '2023-03-22 14:06:55', '2023-03-22 14:08:02'),
(393, 'App\\Models\\User', 22, 'token', 'c124d74113fd01dee1c0bab9c613de4bccca38d13070606268ce2dcfea2f323c', '[\"*\"]', '2023-03-22 14:09:29', '2023-03-22 14:08:01', '2023-03-22 14:09:29'),
(394, 'App\\Models\\User', 24, 'token', '02fd6b94ab764aa552aafef12594465b89b1ee48270ecb6181f2487809c2c561', '[\"*\"]', '2023-03-22 14:10:51', '2023-03-22 14:09:28', '2023-03-22 14:10:51'),
(395, 'App\\Models\\User', 22, 'token', '07880f7cb412f3f1e6d5a4a92fbbf3733a6eeb61aeec23fbf270e19d0ed95070', '[\"*\"]', '2023-03-22 14:11:09', '2023-03-22 14:10:50', '2023-03-22 14:11:09'),
(396, 'App\\Models\\User', 1, 'token', '8834256be46fa50fb9c22a9adb0b5946da956832659bdac68d229af707a989f7', '[\"*\"]', '2023-03-22 14:11:59', '2023-03-22 14:11:08', '2023-03-22 14:11:59'),
(397, 'App\\Models\\User', 1, 'token', '349eb92374bfa9ad94cd512ba6e3cc345d05f4f418c49ada8069cc5abfa83623', '[\"*\"]', '2023-03-22 14:12:22', '2023-03-22 14:11:59', '2023-03-22 14:12:22'),
(398, 'App\\Models\\User', 20, 'token', '0e3359b1ff68818918686ac33ff03c891f804a19672c5ece3104a760c981ea0c', '[\"*\"]', '2023-03-22 14:12:31', '2023-03-22 14:12:21', '2023-03-22 14:12:31'),
(399, 'App\\Models\\User', 1, 'token', 'ff5de8322b878c87af2a3c675715eaa78938edf852a01dd0cf2429282494066a', '[\"*\"]', '2023-03-22 14:12:40', '2023-03-22 14:12:31', '2023-03-22 14:12:40'),
(400, 'App\\Models\\User', 20, 'token', '8c5633c929e925d6f663a6a51156cd7cb489ad96fe53c5931b672eb65c9e0747', '[\"*\"]', '2023-03-22 14:12:50', '2023-03-22 14:12:40', '2023-03-22 14:12:50'),
(401, 'App\\Models\\User', 22, 'token', '13ffb7ff0a3453561d94959560d6b83ed1b3315bdf5d17610b37020132647bb2', '[\"*\"]', '2023-03-22 14:13:31', '2023-03-22 14:12:49', '2023-03-22 14:13:31'),
(402, 'App\\Models\\User', 1, 'token', 'f0acd9800488088fd5cf78043b31ef266db51b9049a57339210df34304b62edf', '[\"*\"]', '2023-03-22 14:13:53', '2023-03-22 14:13:30', '2023-03-22 14:13:53'),
(403, 'App\\Models\\User', 22, 'token', '772d2d12a956e20463a65623f9ca5411a57b574c195a1b05b5a221d085f097be', '[\"*\"]', '2023-03-22 14:14:01', '2023-03-22 14:13:52', '2023-03-22 14:14:01'),
(404, 'App\\Models\\User', 1, 'token', 'e92d87319dbf4e4f710d28722e38341aab50c61e27f82cd0404e11a8db4467c8', '[\"*\"]', '2023-03-22 14:14:12', '2023-03-22 14:14:00', '2023-03-22 14:14:12'),
(405, 'App\\Models\\User', 22, 'token', '81529743eaab364d53f69245df3d8e6a30ede927539cbec1a1f3cf8fd8d31e1e', '[\"*\"]', '2023-03-22 14:14:22', '2023-03-22 14:14:11', '2023-03-22 14:14:22'),
(406, 'App\\Models\\User', 24, 'token', '6c310796e3dabb69e65d76dd6661a5de0f7047d72bc82ec41ee8612d0d7d6424', '[\"*\"]', '2023-03-22 14:14:29', '2023-03-22 14:14:21', '2023-03-22 14:14:29'),
(407, 'App\\Models\\User', 1, 'token', '35736149f3560617a596765f89925ee312b4569ccae6613dec2c3cde7f7b2b9f', '[\"*\"]', '2023-03-22 14:14:40', '2023-03-22 14:14:29', '2023-03-22 14:14:40'),
(408, 'App\\Models\\User', 22, 'token', '06de7ddb05825623407b0e6e7b354ddf2e93bf76552c50692d46b69a9c58f2a5', '[\"*\"]', '2023-03-22 14:14:49', '2023-03-22 14:14:39', '2023-03-22 14:14:49'),
(409, 'App\\Models\\User', 20, 'token', 'b1ae671f4759054139ba20e7674626426c3d4d6c8aa2dd234d59daaa9a84c3a4', '[\"*\"]', '2023-03-22 14:15:03', '2023-03-22 14:14:48', '2023-03-22 14:15:03'),
(410, 'App\\Models\\User', 1, 'token', '5c91edf2e079daa84e6c0fc91628ef3281415d6ccde6899530de21311d2e547b', '[\"*\"]', '2023-03-22 14:15:37', '2023-03-22 14:15:03', '2023-03-22 14:15:37'),
(411, 'App\\Models\\User', 1, 'token', 'b66c28e983bb7d0e4a3060714aebfe0db322a461c9c63617b04f2c2cdee787b2', '[\"*\"]', '2023-03-22 14:16:00', '2023-03-22 14:15:36', '2023-03-22 14:16:00'),
(412, 'App\\Models\\User', 22, 'token', '721fe68920a6f0053b514c965914c11067c2a467e8b6491a5a93c43f2721057c', '[\"*\"]', '2023-03-22 14:17:01', '2023-03-22 14:15:59', '2023-03-22 14:17:01'),
(413, 'App\\Models\\User', 1, 'token', '220aa97b17b7730216f0763de22876a4238d8529e0f233ddb0c338e98acf3722', '[\"*\"]', '2023-03-22 14:20:38', '2023-03-22 14:17:00', '2023-03-22 14:20:38'),
(414, 'App\\Models\\User', 1, 'token', 'd535000c67b22c44ab2fa3f6a23f37b5e7567a0951130972c7de0e7a07803e7c', '[\"*\"]', '2023-03-22 14:20:52', '2023-03-22 14:20:37', '2023-03-22 14:20:52'),
(415, 'App\\Models\\User', 20, 'token', '5990a648a453b4ae480133752eb0ee54b705183dc277a565947611691fecf627', '[\"*\"]', '2023-03-22 14:21:00', '2023-03-22 14:20:51', '2023-03-22 14:21:00'),
(416, 'App\\Models\\User', 22, 'token', '8f88cc744ac8f9c52f6888a11888ab756444fd32a97663091cc423e8591e90a0', '[\"*\"]', '2023-03-22 14:21:28', '2023-03-22 14:20:59', '2023-03-22 14:21:28'),
(417, 'App\\Models\\User', 1, 'token', '1801e4b60d9c790387bcded1f25bfca6e94065690a945b6ba2c3100873de1ccf', '[\"*\"]', '2023-03-22 14:21:43', '2023-03-22 14:21:27', '2023-03-22 14:21:43'),
(418, 'App\\Models\\User', 22, 'token', '39c223f8fbd0458ee5783c1891638b8f65f076d12f9f3808e881de76873d62c2', '[\"*\"]', '2023-03-22 14:21:49', '2023-03-22 14:21:42', '2023-03-22 14:21:49'),
(419, 'App\\Models\\User', 1, 'token', 'c65bbc5ae24643a07bb29fb7ff6d214ac92b757aa92b238cdf2b4d6134a0dcad', '[\"*\"]', '2023-03-22 14:22:04', '2023-03-22 14:21:49', '2023-03-22 14:22:04'),
(420, 'App\\Models\\User', 22, 'token', 'f3096ed154fa47c4441d1364ea36b4f930cd96fd3f37ecd2c3993aa59d5df27f', '[\"*\"]', '2023-03-22 14:22:17', '2023-03-22 14:22:03', '2023-03-22 14:22:17'),
(421, 'App\\Models\\User', 24, 'token', 'f80a695517522e961b37094f52d9d3edabb569dad351ec99541772627a61e2b8', '[\"*\"]', '2023-03-22 14:22:21', '2023-03-22 14:22:16', '2023-03-22 14:22:21');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jeoffy Hipolito', 'jeoffy_hipolito@yahoo.com', '2022-06-14 20:30:39', '$2y$10$XzCUtvdL0Wnc4W1Yw1SdZu.1fezQVaDGVbxNJsw8gprHSudHq57Ze', 'y04nnLtl27h9C3pY7NOLcD3gGboCsIvv0sJmCnvOf3BlFRILuFUuUO0gZrTK', '2022-06-14 20:30:39', '2022-06-14 20:30:39'),
(16, 'Jeoffy', 'jeoffy_hipolito2@yahoo.com', NULL, '$2y$10$ddP40i0FpXn1px2Q5dSaF.kUHpNYiZXfLewPCtsolA/6u5KdEVnue', NULL, '2022-07-03 19:22:09', '2022-07-03 19:22:09'),
(17, 'Contractor Jeoffy NEW', 'jeoffy_contractor@yahoo.com', NULL, '$2y$10$FROWfBNQzpjcgnx3qLobde62nxbjJrHIkAXU.6MYWWe4NwRNJBHQq', NULL, '2023-03-03 07:56:32', '2023-03-03 07:56:32'),
(18, 'Justin Beiber', 'justin@haha.com', NULL, '$2y$10$STfujpnObvSQvqVv2AsmRuVOA1AfPfSOxubawOMSxnuqOdlzzALwS', NULL, '2023-03-03 09:05:41', '2023-03-03 09:05:41'),
(19, 'test contractor1', 'test_contractor@email.com', NULL, '$2y$10$M/cppxpLudrJ3bQUvUhcdeAL8K9ehbnjQ7FuEKV5VfARxPcuB1Z/S', NULL, '2023-03-03 09:11:10', '2023-03-03 09:11:10'),
(20, 'Victory Contractor', 'victory_contractor@email.com', NULL, '$2y$10$RaH5VeYHRHUfHrRX3ubtzeG5NT9ifBkM6HC5olHtnNDGbFaLt2/nK', NULL, '2023-03-08 16:05:40', '2023-03-08 16:05:40'),
(22, 'Victory Member', 'victory_member@email.com', NULL, '$2y$10$jrJwsLgwK12rQmAQps1oUOEAb1UVcQN9edwHIbx6K030B5zPG2QhK', NULL, '2023-03-08 16:19:26', '2023-03-08 16:19:26'),
(23, 'JIL contractor', 'jil_contructor@email.com', NULL, '$2y$10$oIrT9zspuvZclARWfTAYeOPPuMqh1OGBGnaHSC6XRSJ9QCWmaIYGq', NULL, '2023-03-13 12:15:51', '2023-03-13 12:15:51'),
(24, 'JIL Member', 'jil_member@email.com', NULL, '$2y$10$S2qPXvw4uopKukPi6jvQnecVt8lPi0HluEWZtoxbbCbmekzTRTHGO', NULL, '2023-03-13 12:16:58', '2023-03-13 12:16:58'),
(25, 'Victory member 2', 'victory_member2@email.com', NULL, '$2y$10$CvKuFsStUjBG5YmgqtTcqe84djE15w9a8/.WUBdizljJCj30dMZhS', NULL, '2023-03-13 12:21:36', '2023-03-13 12:21:36'),
(26, 'JIL member 2', 'jil_member2@email.com', NULL, '$2y$10$3.HhaRGUOD//EuNH1X/7puHb2KlJdIWBC.fC3FUaSr71MKqkOW3ne', NULL, '2023-03-13 12:27:02', '2023-03-13 12:27:02'),
(27, 'CC Church', 'Christchurch_contractor@email.com', NULL, '$2y$10$nFLuU/SCrs3byKW60dhqXuaewBX3BpIoXbGdK7TjwLRoQeuMpMSl2', NULL, '2023-03-20 13:43:40', '2023-03-20 13:43:40'),
(28, 'JIL Member 3', 'jil_member3@email.com', NULL, '$2y$10$KMudd5PtmVoMuNyqn50v/OQ9qX3S/weTALqwuXtk0JCDbhOGIMY6q', NULL, '2023-03-20 13:57:51', '2023-03-20 13:57:51'),
(29, 'CC Church2', 'cc_church2@email.com', NULL, '$2y$10$NsaxTJpBwfK9gKDlR0USBepMVQax.68TfYg87M5IxTRnyJZ5CuI72', NULL, '2023-03-20 13:58:52', '2023-03-20 13:58:52'),
(30, 'CC Church 3', 'cc_church3@yahoo.com', NULL, '$2y$10$hVomOnspbFNtGO.ISaAw7.YStWJmFYoT1mtjRJuXnNhy8Xk6POF/C', NULL, '2023-03-20 14:06:38', '2023-03-20 14:06:38'),
(31, 'Test Church Contractor', 'test_church_contractor@email.com', NULL, '$2y$10$ToQCDmODN8iJvAtTYbczguRZETmz1IK1/M6mo.4ULzLQ8OxRyrDge', NULL, '2023-03-20 14:45:48', '2023-03-20 14:45:48'),
(32, 'Test Church Member', 'test_church_member@email.com', NULL, '$2y$10$K8sPvOdk4gqU2YrFjzsoCOfRQZfZjmN4ruHNaOqGJvLojwq7F3ZDu', NULL, '2023-03-20 14:47:04', '2023-03-20 14:47:04'),
(33, 'Nations Contractor', 'nations_contractor@email.com', NULL, '$2y$10$yR9xMaGdr3beDwuzeh7LvuMrTS14YjwscKosEmjjOkjeyQ353FaIS', NULL, '2023-03-22 12:43:14', '2023-03-22 12:43:14'),
(34, 'Nations Member', 'nations_member@email.com', NULL, '$2y$10$WrYE78FPrT1pd0.JgsrXLuhY87T9/vbUzivUrO.UyxRlQ/uUhwtBG', NULL, '2023-03-22 12:48:10', '2023-03-22 12:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_accesses`
--

CREATE TABLE `user_accesses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `access_level` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_accesses`
--

INSERT INTO `user_accesses` (`id`, `user_id`, `access_level`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-06-14 20:32:51', '2022-06-14 20:32:51'),
(7, 8, 3, '2022-06-21 19:37:33', '2022-06-21 19:37:33'),
(8, 9, 3, '2022-06-21 19:37:56', '2022-06-21 19:37:56'),
(9, 10, 3, '2022-06-21 19:38:21', '2022-06-21 19:38:21'),
(11, 12, 3, '2022-06-21 20:56:26', '2022-06-21 20:56:26'),
(14, 15, 3, '2022-06-26 17:15:27', '2022-06-26 17:15:27'),
(15, 16, 3, '2022-07-03 19:22:09', '2022-07-03 19:22:09'),
(16, 17, 3, '2023-03-03 07:56:32', '2023-03-03 07:56:32'),
(17, 18, 3, '2023-03-03 09:05:41', '2023-03-03 09:05:41'),
(18, 19, 3, '2023-03-03 09:11:10', '2023-03-03 09:11:10'),
(19, 20, 3, '2023-03-08 16:05:40', '2023-03-08 16:05:40'),
(20, 22, 2, '2023-03-08 16:19:26', '2023-03-08 16:19:26'),
(21, 23, 3, '2023-03-13 12:15:51', '2023-03-13 12:15:51'),
(22, 24, 2, '2023-03-13 12:16:58', '2023-03-13 12:16:58'),
(23, 25, 2, '2023-03-13 12:21:36', '2023-03-13 12:21:36'),
(24, 26, 2, '2023-03-13 12:27:02', '2023-03-13 12:27:02'),
(25, 27, 3, '2023-03-20 13:43:41', '2023-03-20 13:43:41'),
(26, 28, 2, '2023-03-20 13:57:51', '2023-03-20 13:57:51'),
(27, 29, 3, '2023-03-20 13:58:52', '2023-03-20 13:58:52'),
(28, 30, 2, '2023-03-20 14:06:38', '2023-03-20 14:06:38'),
(29, 31, 3, '2023-03-20 14:45:48', '2023-03-20 14:45:48'),
(30, 32, 2, '2023-03-20 14:47:04', '2023-03-20 14:47:04'),
(31, 33, 3, '2023-03-22 12:43:14', '2023-03-22 12:43:14'),
(32, 34, 2, '2023-03-22 12:48:10', '2023-03-22 12:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_organisations`
--

CREATE TABLE `user_organisations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_organisations`
--

INSERT INTO `user_organisations` (`id`, `user_id`, `org_id`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '2022-06-21 19:37:33', '2022-06-21 19:37:33'),
(4, 9, 1, '2022-06-21 19:37:56', '2022-06-21 19:37:56'),
(5, 10, 4, '2022-06-21 19:38:21', '2022-06-21 19:38:21'),
(7, 12, 1, '2022-06-21 20:56:26', '2022-06-29 17:27:02'),
(10, 15, 2, '2022-06-26 17:15:27', '2022-07-03 19:21:27'),
(11, 16, 13, '2022-07-03 19:22:09', '2022-07-03 19:22:09'),
(12, 17, 2, '2023-03-03 07:56:32', '2023-03-03 07:56:32'),
(13, 18, 2, '2023-03-03 09:05:41', '2023-03-03 09:05:41'),
(14, 19, 3, '2023-03-03 09:11:10', '2023-03-03 09:11:10'),
(15, 20, 2, '2023-03-08 16:05:40', '2023-03-08 16:05:40'),
(16, 22, 2, '2023-03-08 16:19:26', '2023-03-08 16:19:26'),
(17, 23, 13, '2023-03-13 12:15:51', '2023-03-13 12:15:51'),
(18, 24, 13, '2023-03-13 12:16:58', '2023-03-13 12:16:58'),
(19, 25, 2, '2023-03-13 12:21:36', '2023-03-13 12:21:36'),
(20, 26, 13, '2023-03-13 12:27:02', '2023-03-13 12:27:02'),
(21, 27, 15, '2023-03-20 13:43:40', '2023-03-20 13:43:40'),
(22, 28, 13, '2023-03-20 13:57:51', '2023-03-20 13:57:51'),
(23, 29, 15, '2023-03-20 13:58:52', '2023-03-20 13:58:52'),
(24, 30, 15, '2023-03-20 14:06:38', '2023-03-20 14:06:38'),
(25, 31, 18, '2023-03-20 14:45:48', '2023-03-20 14:45:48'),
(26, 32, 18, '2023-03-20 14:47:04', '2023-03-20 14:47:04'),
(27, 33, 1, '2023-03-22 12:43:14', '2023-03-22 12:43:14'),
(28, 34, 1, '2023-03-22 12:48:10', '2023-03-22 12:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_services`
--

CREATE TABLE `user_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `type_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2022-06-14 20:32:11', '2022-06-14 20:32:11'),
(2, 'Member', '2022-06-14 20:32:11', '2022-06-14 20:32:11'),
(3, 'Contractor', '2022-06-14 20:32:11', '2022-06-14 20:32:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisations`
--
ALTER TABLE `organisations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisation_events`
--
ALTER TABLE `organisation_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_accesses`
--
ALTER TABLE `user_accesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_organisations`
--
ALTER TABLE `user_organisations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_services`
--
ALTER TABLE `user_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `organisations`
--
ALTER TABLE `organisations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `organisation_events`
--
ALTER TABLE `organisation_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_accesses`
--
ALTER TABLE `user_accesses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_organisations`
--
ALTER TABLE `user_organisations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_services`
--
ALTER TABLE `user_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

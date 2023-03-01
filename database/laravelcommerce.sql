-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2023 at 01:33 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelcommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_admin` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `person_name`, `email`, `email_verified_at`, `password`, `status`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Admin', 'admin@gmail.com', NULL, '$2y$10$qzyBq54bJZ1K.k/eaUhPhOJl7yVxduYZkgENV2TQYY770VoN9C/K2', 'active', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_color` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `person_name`, `has_color`, `created_at`, `updated_at`) VALUES
(1, 'Color', 1, NULL, NULL),
(2, 'Size', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `person_name`, `color_code`, `attribute_id`, `created_at`, `updated_at`) VALUES
(1, 'L', '', 2, NULL, NULL),
(2, 'S', '', 2, NULL, NULL),
(3, 'M', '', 2, NULL, NULL),
(4, 'XL', '', 2, NULL, NULL),
(5, 'White', '#FFFFFF', 1, NULL, NULL),
(6, 'Black', '#000000', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_type` enum('home','popup','promo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `content`, `url`, `banner_type`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'home', 'frontend/assets/images/banners/01.jfif', 'active', '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(2, NULL, NULL, 'home', 'frontend/assets/images/banners/02.jfif', 'active', '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(3, NULL, NULL, 'promo', 'frontend/assets/images/banners/03.jfif', 'active', '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(4, NULL, NULL, 'promo', 'frontend/assets/images/banners/04.jfif', 'active', '2023-01-24 09:51:08', '2023-01-24 09:51:08');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT 0,
  `position` int(11) DEFAULT 0,
  `parent_id` int(11) DEFAULT 0,
  `is_menu` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) DEFAULT 0,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `banner`, `icon`, `level`, `position`, `parent_id`, `is_menu`, `featured`, `status`, `meta_title`, `meta_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Wedding Dress', 'wedding-dress', NULL, 'frontend/assets/images/icons/wedding-dress.svg', 0, 1, 0, 1, 1, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(2, 'Bridesmaid Dresses', 'bridesmaid-dresses', NULL, 'frontend/assets/images/icons/bridesmaid.svg', 0, 2, 0, 1, 1, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(3, 'Wedding Party', 'wedding-party', NULL, 'frontend/assets/images/icons/wedding.svg', 0, 3, 0, 1, 1, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(4, 'Prom Dresses', 'prom-dresses', NULL, 'frontend/assets/images/icons/prom-night.svg', 0, 4, 0, 1, 1, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(5, 'Special Occasions', 'special-occasions', NULL, 'frontend/assets/images/icons/special.svg', 0, 5, 0, 1, 0, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(6, 'Accessories', 'accessories', NULL, 'frontend/assets/images/icons/accessories.svg', 0, 6, 0, 1, 0, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(7, 'Wedding Guest Dresses', 'wedding-guest-dresses', NULL, NULL, 1, NULL, 3, 0, 0, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(8, 'Flower Girls Dresses', 'flower-girls-dresses', NULL, NULL, 1, 0, 3, 0, 0, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(9, 'Men Accessories', 'men-accessories', NULL, NULL, 1, 0, 6, 0, 0, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(10, 'Headpieces', 'headpieces', NULL, NULL, 1, 0, 2, 0, 0, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(11, 'Luxury Collection', 'luxury-collection', NULL, NULL, 1, 0, 2, 0, 0, 'active', NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `value` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `start_date`, `expire_date`, `type`, `status`, `value`, `created_at`, `updated_at`) VALUES
(1, 'New Year Offer', 'ABC1234', '2023-01-27', '2023-01-31', 'fixed', 'active', 100.00, '2023-01-27 19:14:23', '2023-01-27 19:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `person_name`, `symbol`, `exchange_rate`, `code`, `flag`, `flag_path`, `status`, `created_at`, `updated_at`) VALUES
(1, 'US dollar', '$', 1.00, 'USD', 'frontend/assets/img/us-flag.jpg', 'frontend/assets/img/us-flag.jpg', 'active', NULL, NULL),
(2, 'Spain Euro', '€', 0.82, 'SPA', 'frontend/assets/img/spain-flag.jpg', 'frontend/assets/img/spain-flag.jpg', 'active', NULL, NULL),
(3, 'Russian Ruble', '₽', 72.86, 'RUS', 'frontend/assets/img/russia-flag.jpg', 'frontend/assets/img/russia-flag.jpg', 'active', NULL, NULL),
(4, 'France Euro', '€', 0.82, 'FRA', 'frontend/assets/img/france-flag.jpg', 'frontend/assets/img/france-flag.jpg', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `f_a_q_s`
--

CREATE TABLE `f_a_q_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `title`, `file_name`, `admin_id`, `created_at`, `updated_at`) VALUES
(4, 'Screenshot_204.png', '1-1674756662.png', 1, '2023-01-26 10:26:03', '2023-01-26 10:26:03'),
(5, '230605979_392284018898238_8601129681866098523_n.jpg', '1-1674756766.jpg', 1, '2023-01-26 10:27:47', '2023-01-26 10:27:47'),
(6, 'IMG_20221015_085954.jpg', '1-1674756789.jpg', 1, '2023-01-26 10:28:11', '2023-01-26 10:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  `app_user_id` int(11) DEFAULT NULL,
  `file_width` int(11) DEFAULT NULL,
  `file_height` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `file_name`, `file_path`, `file_size`, `file_type`, `file_extension`, `create_user`, `update_user`, `app_id`, `app_user_id`, `file_width`, `file_height`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'avatar', 'demo/general/avatar.jpg', NULL, 'image/jpeg', 'jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'avatar-2', 'demo/general/avatar-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'avatar-3', 'demo/general/avatar-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'ico_adventurous', 'demo/general/ico_adventurous.png', NULL, 'image/png', 'png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'ico_localguide', 'demo/general/ico_localguide.png', NULL, 'image/png', 'png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'ico_maps', 'demo/general/ico_maps.png', NULL, 'image/png', 'png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'ico_paymethod', 'demo/general/ico_paymethod.png', NULL, 'image/png', 'png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'logo', 'demo/general/logo.svg', NULL, 'image/svg+xml', 'svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'bg_contact', 'demo/general/bg-contact.jpg', NULL, 'image/jpeg', 'jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'favicon', 'demo/general/favicon.png', NULL, 'image/png', 'png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'thumb-vendor-register', 'demo/general/thumb-vendor-register.jpg', NULL, 'image/jpeg', 'jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'bg-video-vendor-register1', 'demo/general/bg-video-vendor-register1.jpg', NULL, 'image/jpeg', 'jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'ico_chat_1', 'demo/general/ico_chat_1.svg', NULL, 'image/svg', 'svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'ico_friendship_1', 'demo/general/ico_friendship_1.svg', NULL, 'image/svg', 'svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'ico_piggy-bank_1', 'demo/general/ico_piggy-bank_1.svg', NULL, 'image/svg', 'svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'home-mix', 'demo/general/home-mix.jpg', NULL, 'image/jpeg', 'jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'image_home_mix_1', 'demo/general/image_home_mix_1.jpg', NULL, 'image/jpeg', 'jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'image_home_mix_2', 'demo/general/image_home_mix_2.jpg', NULL, 'image/jpeg', 'jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'image_home_mix_3', 'demo/general/image_home_mix_3.jpg', NULL, 'image/jpeg', 'jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `subtotal` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` enum('pending','process','delivered','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` double(8,2) DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `coupon` double(8,2) DEFAULT 0.00,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scountry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spostcode` int(11) DEFAULT NULL,
  `sstate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saddress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saddress2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `total_amount`, `subtotal`, `payment_method`, `payment_status`, `order_status`, `payment_details`, `delivery_charge`, `quantity`, `coupon`, `first_name`, `last_name`, `email`, `phone`, `country`, `postcode`, `state`, `address`, `address2`, `scountry`, `spostcode`, `sstate`, `saddress`, `saddress2`, `note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'KETRA-1000', 3000.00, 3000.00, 'cod', 'unpaid', 'pending', NULL, 100.00, 2, 100.00, 'Ahmad', 'Bayrakdar', 'ahmad.berkdar.sy@gmail.com', '+7173568684364', 'United Arab Emirates', 31091, 'Dubai', 'Al Barsha 1', 'MOE', 'UAE', 31091, 'UAE', 'Dubai', NULL, 'thank you for watching', NULL, '2023-01-27 19:39:39', '2023-01-27 19:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `variation` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_details`, `quantity`, `price`, `discount`, `variation`, `variant`, `shipping_method_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '{\"id\":4,\"title\":\"Prajwal product\",\"slug\":\"prajwal-product\",\"summary\":\"<p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span><br><\\/p>\",\"description\":\"<p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br><\\/p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span>\",\"features\":\"<p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br><\\/p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span>\",\"current_stock\":0,\"product_label\":\"hot\",\"cat_ids\":1,\"unit\":\"pc\",\"min_qty\":10,\"refundable\":1,\"thumbnail_image\":\"storage\\/images\\/products\\/1-1674756662.png\",\"images\":\"[\\\"storage\\\\\\/images\\\\\\/products\\\\\\/1-1674756766.jpg\\\",\\\"storage\\\\\\/images\\\\\\/products\\\\\\/1-1674756789.jpg\\\",null,null,null,null]\",\"is_featured\":1,\"unit_price\":\"1200.00\",\"purchase_price\":\"1000.00\",\"discount\":\"200.00\",\"discount_type\":\"amount\",\"colors\":\"[\\\"#FFFFFF\\\",\\\"#000000\\\"]\",\"variant_products\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"attribute_id\\\":\\\"2\\\",\\\"values\\\":[\\\"L\\\",\\\"S\\\"]}]\",\"variation\":\"[]\",\"processing_time\":null,\"shipping_time\":null,\"user_id\":1,\"added_by\":\"admin\",\"status\":\"active\",\"meta_title\":\"Prajwal product\",\"meta_keywords\":null,\"meta_description\":\"<p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span><br><\\/p>\",\"deleted_at\":null,\"created_at\":\"2023-01-26T18:13:41.000000Z\",\"updated_at\":\"2023-01-26T18:13:41.000000Z\"}', 4, '2400.00', '800.00', 'White-S', NULL, 1, NULL, '2023-01-27 19:39:39', '2023-01-27 19:39:39'),
(2, 1, 5, '{\"id\":5,\"title\":\"Prajwal product\",\"slug\":\"prajwal-product-uprrV\",\"summary\":\"<p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span><br><\\/p>\",\"description\":\"<p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br><\\/p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span>\",\"features\":\"<p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br><\\/p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span>\",\"current_stock\":0,\"product_label\":\"hot\",\"cat_ids\":1,\"unit\":\"pc\",\"min_qty\":10,\"refundable\":1,\"thumbnail_image\":\"storage\\/images\\/products\\/1-1674756662.png\",\"images\":\"[\\\"storage\\\\\\/images\\\\\\/products\\\\\\/1-1674756766.jpg\\\",\\\"storage\\\\\\/images\\\\\\/products\\\\\\/1-1674756789.jpg\\\",null,null,null,null]\",\"is_featured\":1,\"unit_price\":\"1200.00\",\"purchase_price\":\"1000.00\",\"discount\":\"200.00\",\"discount_type\":\"amount\",\"colors\":\"[\\\"#FFFFFF\\\",\\\"#000000\\\"]\",\"variant_products\":1,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"attribute_id\\\":\\\"2\\\",\\\"values\\\":[\\\"L\\\",\\\"S\\\"]}]\",\"variation\":\"[]\",\"processing_time\":null,\"shipping_time\":null,\"user_id\":1,\"added_by\":\"admin\",\"status\":\"active\",\"meta_title\":\"Prajwal product\",\"meta_keywords\":null,\"meta_description\":\"<p><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">Hi,<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">:<\\/span><br style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\"><span style=\\\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\\\">there is around approx. 10-12 Ready functionals Forms where you need to add\\/remove some text fields and need some functionally changes\\/add-on etc.<\\/span><br><\\/p>\",\"deleted_at\":null,\"created_at\":\"2023-01-26T18:24:07.000000Z\",\"updated_at\":\"2023-01-26T18:24:07.000000Z\"}', 2, '600.00', '400.00', 'Black-S', NULL, 1, NULL, '2023-01-27 19:39:39', '2023-01-27 19:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_stock` int(11) NOT NULL DEFAULT 0,
  `product_label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_ids` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(4) NOT NULL DEFAULT 1,
  `thumbnail_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `unit_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `purchase_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) DEFAULT 0.00,
  `discount_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_products` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `features`, `current_stock`, `product_label`, `cat_ids`, `unit`, `min_qty`, `refundable`, `thumbnail_image`, `images`, `is_featured`, `unit_price`, `purchase_price`, `discount`, `discount_type`, `colors`, `variant_products`, `attributes`, `choice_options`, `variation`, `processing_time`, `shipping_time`, `user_id`, `added_by`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Canon EOS185', 'canon-eos185', '<p>The biggest change in the\\u00a0<strong>Canon EOS 1500D</strong>\\u00a0is the sensor resolution.</p>', '<p>The biggest change in the\\u00a0<strong>Canon EOS 1500D</strong>\\u00a0is the sensor resolution. It is now a 24.1-megapixel APS-C sensor, compared to the 18-megapixel APS-C sensor on the 1300D. ... Just like the 1300D, the\\u00a0<strong>EOS 1500D<\\/strong>\\u00a0features NFC and Wi-Fi for connecting it to your smartphone<\\/p>', NULL, 100, 'new', 2, 'pc', 5, 0, 'frontend/assets/images/products/1.jpg', NULL, 1, '324.36', '324.36', '0.00', 'amount', '[]', 0, 'null', '[]', NULL, NULL, NULL, 1, 'admin', 'active', NULL, NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(2, 'Test Product', 'test-product', '<p>The biggest change in the\\u00a0<strong>Canon EOS 1500D</strong>\\u00a0is the sensor resolution.</p>', '<p>The biggest change in the\\u00a0<strong>Canon EOS 1500D</strong>\\u00a0is the sensor resolution. It is now a 24.1-megapixel APS-C sensor, compared to the 18-megapixel APS-C sensor on the 1300D. ... Just like the 1300D, the\\u00a0<strong>EOS 1500D<\\/strong>\\u00a0features NFC and Wi-Fi for connecting it to your smartphone<\\/p>', NULL, 100, 'new', 1, 'pc', 5, 0, 'frontend/assets/images/products/2.jpg', NULL, 1, '100.00', '90.00', '10.00', 'amount', '[]', 0, 'null', '[]', NULL, NULL, NULL, 1, 'admin', 'active', NULL, NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(3, 'Test Product 2', 'test-product-2', '<p>The biggest change in the\\u00a0<strong>Canon EOS 1500D</strong>\\u00a0is the sensor resolution.</p>', '<p>The biggest change in the\\u00a0<strong>Canon EOS 1500D</strong>\\u00a0is the sensor resolution. It is now a 24.1-megapixel APS-C sensor, compared to the 18-megapixel APS-C sensor on the 1300D. ... Just like the 1300D, the\\u00a0<strong>EOS 1500D<\\/strong>\\u00a0features NFC and Wi-Fi for connecting it to your smartphone<\\/p>', NULL, 100, 'new', 2, 'pc', 5, 0, 'frontend/assets/images/products/3.jpg', NULL, 1, '1000.00', '500.00', '50.00', 'percent', '[]', 0, 'null', '[]', NULL, NULL, NULL, 1, 'admin', 'active', NULL, NULL, NULL, NULL, '2023-01-24 09:51:08', '2023-01-24 09:51:08'),
(4, 'Prajwal product', 'prajwal-product', '<p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span><br></p>', '<p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br></p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span>', '<p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br></p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span>', 0, 'hot', 1, 'pc', 10, 1, 'storage/images/products/1-1674756662.png', '[\"storage\\/images\\/products\\/1-1674756766.jpg\",\"storage\\/images\\/products\\/1-1674756789.jpg\",null,null,null,null]', 1, '1200.00', '1000.00', '200.00', 'amount', '[\"#FFFFFF\",\"#000000\"]', 0, '[\"2\"]', '[{\"attribute_id\":\"2\",\"values\":[\"L\",\"S\"]}]', '[]', NULL, NULL, 1, 'admin', 'active', 'Prajwal product', NULL, '<p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span><br></p>', NULL, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(5, 'Prajwal product', 'prajwal-product-uprrV', '<p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span><br></p>', '<p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br></p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span>', '<p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br></p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span>', 0, 'hot', 1, 'pc', 10, 1, 'storage/images/products/1-1674756662.png', '[\"storage\\/images\\/products\\/1-1674756766.jpg\",\"storage\\/images\\/products\\/1-1674756789.jpg\",null,null,null,null]', 1, '1200.00', '1000.00', '200.00', 'amount', '[\"#FFFFFF\",\"#000000\"]', 1, '[\"2\"]', '[{\"attribute_id\":\"2\",\"values\":[\"L\",\"S\"]}]', '[]', NULL, NULL, 1, 'admin', 'active', 'Prajwal product', NULL, '<p><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">Hi,</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">I am looking for experienced laravel php web developer for some simple customisation on readymade POS system</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">:</span><br style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\"><span style=\"color: rgb(0, 30, 0); font-family: &quot;Neue Montreal&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; letter-spacing: 0.6px;\">there is around approx. 10-12 Ready functionals Forms where you need to add/remove some text fields and need some functionally changes/add-on etc.</span><br></p>', NULL, '2023-01-26 10:39:07', '2023-01-26 10:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `attribute_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(2, 4, 2, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(3, 5, 1, '2023-01-26 10:39:07', '2023-01-26 10:39:07'),
(4, 5, 2, '2023-01-26 10:39:07', '2023-01-26 10:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_value_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `product_id`, `attribute_id`, `attribute_value_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 5, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(2, 4, 1, 6, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(3, 4, 2, 1, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(4, 4, 2, 2, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(5, 5, 1, 5, '2023-01-26 10:39:07', '2023-01-26 10:39:07'),
(6, 5, 1, 6, '2023-01-26 10:39:07', '2023-01-26 10:39:07'),
(7, 5, 2, 1, '2023-01-26 10:39:07', '2023-01-26 10:39:07'),
(8, 5, 2, 2, '2023-01-26 10:39:07', '2023-01-26 10:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rate` double(8,2) NOT NULL DEFAULT 0.00,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `person_name`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal R.', 1, 2.50, 'Hello Just testing', 'active', '2023-01-25 06:47:42', '2023-01-25 06:47:42');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(20,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 4, 'White-L', 800.00, 111, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(2, 4, 'White-S', 600.00, 111, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(3, 4, 'Black-L', 400.00, 111, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(4, 4, 'Black-S', 300.00, 111, '2023-01-26 10:28:41', '2023-01-26 10:28:41'),
(5, 5, 'White-L', 800.00, 111, '2023-01-26 10:39:07', '2023-01-26 10:39:07'),
(6, 5, 'White-S', 600.00, 111, '2023-01-26 10:39:07', '2023-01-26 10:39:07'),
(7, 5, 'Black-L', 400.00, 111, '2023-01-26 10:39:07', '2023-01-26 10:39:07'),
(8, 5, 'Black-S', 300.00, 111, '2023-01-26 10:39:07', '2023-01-26 10:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variation_combinations`
--

CREATE TABLE `product_variation_combinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_variation_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$',
  `system_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1.0',
  `website_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recaptcha` tinyint(1) NOT NULL DEFAULT 0,
  `recaptcha_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recaptcha_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitors` int(11) NOT NULL DEFAULT 0,
  `copyright_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '© Copyrights 2023. All rights reserved.',
  `about_us` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_policy` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_payment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_policy` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_conditions` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancellation_policy` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_sandbox` tinyint(1) NOT NULL DEFAULT 1,
  `delivery_time` int(11) NOT NULL DEFAULT 20,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_title`, `meta_description`, `meta_keywords`, `logo`, `favicon`, `phone`, `office_time`, `email`, `address`, `currency`, `system_version`, `website_url`, `facebook_url`, `instagram_url`, `twitter_url`, `youtube_url`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `visitors`, `copyright_text`, `about_us`, `return_policy`, `shipping_payment`, `privacy_policy`, `terms_conditions`, `cancellation_policy`, `paypal_sandbox`, `delivery_time`, `created_at`, `updated_at`) VALUES
(1, 'RAYKIRA Shopping Site', 'RAYKIRA online Shopping ', 'Shopping, Fashion dress, ecommerce', 'backend/assets/images/logo.png', '', '+971553879113', ' 9 AM - 6 PM . MON-FRI', 'AHMAD.BERKDAR.SY@GMAIL.COM', 'Dubai, UAE', '$', '1.0', NULL, 'https://facebook.com/', 'https://instagram.com/', 'https://twitter.com/', 'https://youtube.com/', 0, NULL, NULL, 6, '© Copyrights 2023. All rights reserved.', '{\"description1\":\"Testing\",\"description2\":\"Hello\",\"image1\":\"1674697447-Category01.png\",\"image1_path\":\"storage\\/frontend\\/images\\/settings\\/1674697447-Category01.png\",\"image2\":\"1674697447-Category02.png\",\"image2_path\":\"storage\\/frontend\\/images\\/settings\\/1674697447-Category02.png\"}', NULL, NULL, NULL, 'Terms and condition', 'Cancellation page.', 0, 20, NULL, '2023-02-28 18:54:53');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` double(8,2) NOT NULL DEFAULT 0.00,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `shipping_address`, `delivery_time`, `delivery_charge`, `status`, `created_at`, `updated_at`) VALUES
(1, 'China', '4-5 days', 100.00, 'active', NULL, NULL),
(2, 'Nepal', '8-9 days', 300.00, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scountry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spostcode` int(11) DEFAULT NULL,
  `sstate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saddress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saddress2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `image_path`, `phone`, `status`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Customer', 'Customer', 'customer@gmail.com', NULL, '$2y$10$44yt.jK.hlMiruipMfqyBunuimcpokCqD1PHJ6wKk4ZDIoUm2rqE6', NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `why_chooses`
--

CREATE TABLE `why_chooses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_orders_product_id_foreign` (`product_id`),
  ADD KEY `product_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variation_combinations`
--
ALTER TABLE `product_variation_combinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribes_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `why_chooses`
--
ALTER TABLE `why_chooses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variation_combinations`
--
ALTER TABLE `product_variation_combinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `why_chooses`
--
ALTER TABLE `why_chooses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD CONSTRAINT `product_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `shipping_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

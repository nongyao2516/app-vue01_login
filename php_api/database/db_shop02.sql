-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2026 at 10:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop02`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'เครื่องใช้ไฟฟ้า'),
(2, 'เสื้อผ้า'),
(3, 'รองเท้า');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `firstName`, `lastName`, `phone`, `username`, `password`) VALUES
(00000002, 'วิภา', 'สุขสันต์', '0898765432', 'wipa', 'wipa2025'),
(00000003, 'John', 'Doe', '0991122334', 'johnd', 'securepwd'),
(00000004, 'เมษา', 'เด็กดี', '038743690', 'mesa', '$2y$10$tSSl6/EruDffk'),
(00000005, 'มานะ', 'มีใจ', '038754920', 'mana', '$2y$10$tA0rn9nxLE.i6q5U5qvgMuij0eJZJkNEQMTRn3lJsDECEt1jSq58u'),
(00000006, 'ชูใจ', 'เด็กดี', '038743690', 'shoojai', '$2y$10$9JiaB6GjUeHH1pWQlsYpyebE7FVT8zZgINfMV2Ud16XKRlPGCtW5m');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `department` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `image` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `full_name`, `department`, `salary`, `active`, `image`, `created_at`) VALUES
(0000000001, 'สมชาย คนดี', 'การตลาด', 25000.00, 1, '1771149319_images.jpg', '2026-01-18 10:27:14'),
(0000000002, 'สมหญิง ดีงาม', 'เทคโนโลยี', 28000.00, 1, '1771149309_istockphoto-486570435-612x612.jpg', '2026-01-18 10:27:14'),
(0000000003, 'อนันต์ สุขใจ', 'การตลาด', 25000.00, 1, '1771149296_RO30DPOHK1.jpg', '2026-01-18 10:27:14'),
(0000000004, 'สุดา พรมดี', 'ทรัพยากรบุคคล', 32000.00, 1, '', '2026-01-18 10:27:14'),
(0000000005, 'นวรัตน์  เกิดผล', 'เทคโนโลยี', 25000.00, 1, '1771149236_istockphoto-1406705759-612x612.jpg', '2026-01-25 09:43:49'),
(0000000006, 'มานี มีตา ', 'เทคโนโลยี', 25000.00, 1, '1771662178_IT.png', '2026-01-25 11:32:54'),
(0000000008, 'มานะ ดีใจ', 'เทคโนโลยี', 35000.00, 1, '1771149093_cat.jpg', '2026-02-15 09:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` text DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) NOT NULL COMMENT 'รหัสประเภทสินค้า',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `image`, `stock`, `category_id`, `created_at`) VALUES
(00000000001, 'เสื้อยืดคอกลม', 'เสื้อยืดผ้าฝ้าย 100% สวมใส่สบาย', 199.00, '1771667593_1760498908_p6.jpg', 50, 1, '2026-01-25 10:42:55'),
(00000000002, 'กางเกงยีนส์', 'กางเกงยีนส์ทรงกระบอก สีฟ้าอ่อน', 850.00, '1771664104_IT.png', 20, 2, '2026-01-25 10:42:55'),
(00000000003, 'รองเท้าผ้าใบ', 'รองเท้าผ้าใบสีขาว ใส่ได้ทุกโอกาส', 1299.00, '1771667576_3.jfif', 20, 3, '2026-01-25 10:42:55'),
(00000000004, 'สมุดรายงาน', 'สมุดรายงาน ปกแข็ง', 119.00, '1771665862_7.jfif', 12, 1, '2026-02-15 08:45:45'),
(00000000007, 'ทีวี', 'ทีวี 50 นิ้ว', 45000.00, '1771665126_zoom13.jpg', 20, 1, '2026-02-21 08:56:14'),
(00000000008, 'sadsad', 'sadsa', 200.00, '1771665165_1758077915_p6.jpg', 324, 3, '2026-02-21 09:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL COMMENT 'รหัสสินค้า',
  `type_name` varchar(30) NOT NULL COMMENT 'ชื่อประเภท'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`) VALUES
(1, 'เครื่องใช้ไฟฟ้า'),
(2, 'เครื่องเขียน');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสินค้า', AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

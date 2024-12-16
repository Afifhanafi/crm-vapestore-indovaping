-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2024 at 11:10 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm_indovaping`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` varchar(36) NOT NULL,
  `type` varchar(32) NOT NULL,
  `status` varchar(64) NOT NULL,
  `details` text NOT NULL,
  `order_id` varchar(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_history`
--

CREATE TABLE `complaint_history` (
  `id` varchar(36) NOT NULL,
  `complaint_id` varchar(36) NOT NULL,
  `status` varchar(32) NOT NULL,
  `details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `address` text NOT NULL,
  `points` int(11) NOT NULL,
  `membership` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(36) NOT NULL,
  `status` varchar(32) NOT NULL,
  `shipping_address` text NOT NULL,
  `shipping_type` varchar(64) NOT NULL,
  `payment_type` varchar(64) NOT NULL,
  `total` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` varchar(36) NOT NULL,
  `order_id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(36) NOT NULL,
  `name` varchar(256) NOT NULL,
  `price` int(11) NOT NULL,
  `msrp_price` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL,
  `best_seller` tinyint(1) NOT NULL DEFAULT 0,
  `discount` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `msrp_price`, `stock`, `best_seller`, `discount`, `created_at`, `deleted_at`) VALUES
('0bef79e1-d9cd-4b27-8b3a-94ea807a78fe', 'Slank Poppies - Sweet Caramel Muffin with Banana Cheese, nic: 3,6,9 mg, 60ML', 110000, 150000, 45, 0, 0, '2024-06-09 04:35:42', NULL),
('0e5a8ef9-621b-4444-8b7c-0c9aa24c490a', 'Lunar - Strawberry Cheese Cake, nic : 3,6 mg, 60ML', 110000, 150000, 11, 0, 0, '2024-06-09 04:47:46', NULL),
('12ce01c3-d03f-44c1-b975-947d1f4bfbf1', 'Paradewa Athena - The Taste of Anggur Athena, nic : 3,6mg. 60ML', 110000, 145000, 30, 0, 0, '2024-06-09 04:51:36', NULL),
('19828487-87ea-46cd-bada-5d4f750b6f0c', 'Melds - Berrys Croffle, nic: 3/7mg, 60ML', 105000, 0, 30, 0, 0, '2024-06-09 04:24:24', NULL),
('4e7a5be4-c5d3-44c6-aeb4-6579f98fa4ab', 'Melds - Berrys Croffle, 3/7 mg, 60 ml', 105000, 0, 100, 0, 0, '2024-06-03 04:29:33', NULL),
('686644ee-e811-4741-bc59-cc3cc0737040', 'Bananalicous Less Sweet - Banana Strawberry Cream, nic : 3,6 mg, 60ML', 115000, 155000, 35, 0, 0, '2024-06-09 04:45:37', NULL),
('702909aa-7013-412b-9480-f3652528c2f8', 'Melds - Berrys Croffle, nic : 3,7mg. 60ML', 105000, 145000, 35, 0, 0, '2024-07-01 13:44:46', NULL),
('765f284d-8800-4887-ade6-b105e25ea473', 'Glu Zone - Sirsak Bubblegum. nic : 3 mg, 60ML', 100000, 135000, 10, 0, 0, '2024-06-09 04:44:38', NULL),
('82218312-21bf-4390-bae9-381d9219f537', 'Ice BluNanaRilla - Bluberry Banana Smoothies Ice, nic : 3,6mg, 60ML', 115000, 150000, 15, 0, 0, '2024-06-09 04:50:16', NULL),
('82b592b4-fffb-4f6b-9453-a0907f917958', 'Proven - Strawberry Vanila Custard, nic : 3,6 mg, 60ML', 145000, 190000, 30, 0, 0, '2024-06-09 04:46:35', NULL),
('86c3c126-008e-48b2-9370-001947bfe27e', 'Mangopy - Mangga, nic: 3 mg, 60ML ', 100000, 135000, 15, 0, 0, '2024-06-09 04:43:39', NULL),
('8af4cbff-2ed0-4204-af3c-1f20a883fa85', 'IceBananaRilla - Banana Strawberry Smoothies, nic : 3,6 mg 60ML', 115000, 150000, 10, 0, 0, '2024-06-09 04:48:25', NULL),
('ec54b40e-94cd-4386-9e28-1a82173f18a7', 'Paradewa - Apple Zeus, nic : 3,6mg, 60L ', 110000, 145000, 20, 0, 0, '2024-06-09 04:50:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suggestion`
--

CREATE TABLE `suggestion` (
  `id` varchar(36) NOT NULL,
  `type` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `complaint_history`
--
ALTER TABLE `complaint_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_history_complaint_id` (`complaint_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_customer` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_item_order` (`order_id`),
  ADD KEY `order_item_product` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suggestion`
--
ALTER TABLE `suggestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suggestion_customer` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaint_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `complaint_history`
--
ALTER TABLE `complaint_history`
  ADD CONSTRAINT `c_history_complaint_id` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_item_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_item_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `suggestion`
--
ALTER TABLE `suggestion`
  ADD CONSTRAINT `suggestion_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2022 at 08:40 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `phone`, `name`, `password`) VALUES
(1, '123456', 'Mr. X', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `o_id`, `product_id`, `qty`, `unit_price`) VALUES
(1, 1, 1, 1, 12000),
(2, 1, 2, 1, 60000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(20) NOT NULL,
  `customer_id` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `status`, `price`) VALUES
(1, '123456', 'Ordered', 72000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` double NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`) VALUES
(1, 'Macbook', 12000, '1645601733_MacBook.jpg'),
(2, 'I Phone 12', 60000, '1645601754_IPhone12.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL,
  `expired_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `userid`, `token`, `created_at`, `expired_at`) VALUES
(1, 1, 'dcPnGBfN6KpOkFFTzGKAkmgBy8r6aMXltokigcbKOx77vn2z5qNDJAonFBFMMMV0', '2021-11-28 06:56:27', '2021-11-28 13:22:04'),
(3, 1, 'GoNogn7peCqBUlGfNYF7kN3vKyn0UjYBPgv2QMEqI2WpyVbCf44OnP7X1hj1Bq76', '2021-11-28 09:20:08', '2021-11-28 15:30:15'),
(5, 1, 'BYefJhiAy34dbmmzlRYvfu56xOKy1yaSP6odQBUQ3ARUJYcRs6vGN4ss3TY2hq0w', '2021-11-28 09:29:53', '2021-11-29 12:49:05'),
(7, 1, 'F5yXbmURGA9r9LEwvlClFyQkbARA2sDV8hBqU3eUwNOStNPdVkfPdVlNpyu9ahku', '2021-11-29 07:10:54', '2021-11-29 13:51:38'),
(12, 1, 'nelflfELW4nmVk3RnE5QSc8CTHWbIqbXzwKMpHyxZyZBOVMEuz53kznP7AaUQudQ', '2021-11-30 12:49:35', '2021-11-30 18:57:19'),
(17, 1, 'gtv5GzNSKdyjYG37A0Bw6aSBgrbKpTVblswwM9g7Pgay12p9WIeGjW6m87OBfHFb', '2021-12-01 06:14:29', '2021-12-01 12:42:02'),
(19, 1, 'q5oFz8cCSGsStOBp3rTwQibrQlSszuxF8ild9LgMKla5PcmxF5aA6ALeiBEgh2co', '2021-12-01 06:43:19', '2021-12-01 12:44:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `type`) VALUES
(1, 'user', '1234', 'Admin'),
(2, 'user1', '1234', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`phone`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

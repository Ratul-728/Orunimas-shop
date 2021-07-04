-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2021 at 01:22 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orunimasshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderlist`
--

CREATE TABLE `orderlist` (
  `id` int(11) NOT NULL,
  `invoice` varchar(20) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productid` int(11) NOT NULL,
  `price` double(10,4) NOT NULL,
  `isdiscount` varchar(1) NOT NULL DEFAULT '0' COMMENT '0-no discount, 1-discount',
  `discountprice` double(10,2) DEFAULT NULL,
  `qty` int(3) NOT NULL,
  `weights` varchar(10) NOT NULL,
  `taste` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `userphone` varchar(15) NOT NULL,
  `useraddress` varchar(300) NOT NULL,
  `insidedhaka` varchar(1) NOT NULL COMMENT '1-inside dhaka, 2-outside dhaka',
  `deliverycharge` double(10,2) NOT NULL,
  `makedt` datetime NOT NULL,
  `st` varchar(1) NOT NULL DEFAULT '1' COMMENT '1-processing, 2-deliver to delivery man, 3-deliverd,4-not deliverd'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderlist`
--

INSERT INTO `orderlist` (`id`, `invoice`, `productname`, `productid`, `price`, `isdiscount`, `discountprice`, `qty`, `weights`, `taste`, `userid`, `userphone`, `useraddress`, `insidedhaka`, `deliverycharge`, `makedt`, `st`) VALUES
(41, '01072021213220', 'Mango', 5, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-02 01:32:20', '1'),
(42, '01072021213220', 'Orange', 6, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '1', 60.00, '2021-07-02 01:32:20', '1'),
(43, '01072021213220', 'Apple', 7, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-02 01:32:20', '1'),
(44, '01072021213238', 'Mango', 5, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-02 01:32:38', '2'),
(45, '01072021213238', 'Orange', 6, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '1', 60.00, '2021-07-02 01:32:38', '2'),
(46, '01072021213238', 'Apple', 7, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-02 01:32:38', '2'),
(47, '01072021213504', 'Mango', 5, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-02 01:35:04', '3'),
(48, '01072021213504', 'Orange', 6, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '1', 60.00, '2021-07-02 01:35:04', '3'),
(49, '01072021213504', 'Apple', 7, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-02 01:35:04', '3'),
(50, '01072021215209', 'Mango', 5, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-02 01:52:09', '4'),
(51, '01072021215209', 'Orange', 6, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '1', 60.00, '2021-07-02 01:52:09', '4'),
(52, '01072021215209', 'Apple', 7, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-02 01:52:09', '4'),
(57, '02072021135927', 'Mango', 5, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-02 17:59:27', '1'),
(58, '02072021135927', 'Orange', 6, 150.5000, '0', NULL, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '1', 60.00, '2021-07-02 17:59:27', '1'),
(65, '03072021213950', 'Mango', 5, 150.5000, '1', 0.00, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-04 01:39:50', '1'),
(66, '03072021213950', 'Orange', 6, 150.5000, '1', 0.00, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '1', 60.00, '2021-07-04 01:39:50', '1'),
(67, '03072021214452', 'Mango', 5, 147.4900, '1', 3.01, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-04 01:44:52', '1'),
(68, '03072021214452', 'Orange', 6, 147.4900, '1', 3.01, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '1', 60.00, '2021-07-04 01:44:52', '1'),
(69, '03072021214528', 'Mango', 5, 150.5000, '0', 0.00, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '2', 100.00, '2021-07-04 01:45:28', '1'),
(70, '03072021214528', 'Orange', 6, 150.5000, '0', 0.00, 2, '1kg', 'Sweet', 1, '01555566666', 'House no: 23', '1', 60.00, '2021-07-04 01:45:28', '1');

-- --------------------------------------------------------

--
-- Table structure for table `preorder`
--

CREATE TABLE `preorder` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `productname` varchar(200) NOT NULL,
  `price` double(10,4) NOT NULL,
  `qty` int(3) NOT NULL,
  `weights` varchar(20) NOT NULL,
  `taste` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `makedt` datetime NOT NULL,
  `st` varchar(1) NOT NULL DEFAULT '1' COMMENT '1-Proccessing, 2-Stock available, 3-stock can''t be available\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `preorder`
--

INSERT INTO `preorder` (`id`, `productid`, `productname`, `price`, `qty`, `weights`, `taste`, `userid`, `makedt`, `st`) VALUES
(1, 11, 'Mango', 200.5000, 3, '1kg', 'Savory', 1, '2021-07-03 03:39:30', '1'),
(2, 11, 'Mango', 200.5000, 3, '1kg', 'Savory', 1, '2021-07-03 03:39:42', '1');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double(10,4) NOT NULL,
  `qty` int(3) NOT NULL,
  `weights` varchar(10) NOT NULL,
  `taste` varchar(50) DEFAULT NULL,
  `details` varchar(250) DEFAULT NULL,
  `makedt` datetime NOT NULL,
  `st` varchar(1) NOT NULL DEFAULT '1' COMMENT '1-stock availbe\r\n0 -stock out & pre-order\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `qty`, `weights`, `taste`, `details`, `makedt`, `st`) VALUES
(5, 'Mango', 150.5000, 11, '1kg', 'Sweet', 'Rajshahi\'s mango ', '2021-07-02 00:03:02', '1'),
(6, 'Orange', 150.5000, 9, '1kg', 'Sweet', 'Rajshahi\'s mango ', '2021-07-02 00:25:45', '1'),
(7, 'Apple', 150.5000, 0, '1kg', 'Sour', 'China\'s Apple ', '2021-07-02 17:27:23', '0'),
(8, 'Apple', 150.5000, 3, '1kg', 'Sweet', 'Rajshahi\'s mango ', '2021-07-02 00:26:11', '1'),
(9, 'Apple', 550.5000, 5, '1kg', 'Salty', 'China\'s Apple ', '2021-07-02 17:28:25', '1'),
(10, 'Apple', 200.0000, 5, '1kg', 'Savory', 'China\'s Apple ', '2021-07-02 17:28:53', '1'),
(11, 'Mango', 200.5000, 0, '1kg', 'Savory', 'China\'s Mango ', '2021-07-02 17:29:25', '0'),
(12, 'Mango', 175.0000, 5, '1kg', 'Sour', 'China\'s Mango ', '2021-07-02 17:29:50', '1'),
(13, 'Orange', 325.0000, 5, '1kg', 'Sour', 'China\'s Orange ', '2021-07-02 17:30:07', '1'),
(14, 'Orange', 50.5000, 0, '1kg', 'Salty', 'China\'s Orange ', '2021-07-02 17:30:18', '0');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` int(4) NOT NULL,
  `discountcode` varchar(15) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `ispercent` varchar(1) NOT NULL COMMENT '1-Yes, 0-No',
  `itemno` int(2) NOT NULL,
  `makedt` datetime NOT NULL,
  `st` varchar(1) NOT NULL DEFAULT '1' COMMENT '1-active, 0-disable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `discountcode`, `amount`, `ispercent`, `itemno`, `makedt`, `st`) VALUES
(1, 'happykappy', 2.00, '1', 3, '2021-07-03 21:22:10', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderlist`
--
ALTER TABLE `orderlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preorder`
--
ALTER TABLE `preorder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderlist`
--
ALTER TABLE `orderlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `preorder`
--
ALTER TABLE `preorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

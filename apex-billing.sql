-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2018 at 12:04 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `apex-billing`
--

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE IF NOT EXISTS `coupons` (
`coupon_id` int(11) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_type` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coupon_value` varchar(255) NOT NULL,
  `coupon_valid_from` varchar(255) NOT NULL,
  `coupon_valid_to` varchar(255) NOT NULL,
  `coupon_usage` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `coupon_code`, `coupon_type`, `timestamp`, `coupon_value`, `coupon_valid_from`, `coupon_valid_to`, `coupon_usage`) VALUES
(5, 'HILL50', 'Fast', '2018-04-05 19:32:43', '500', '5 march 2018', '5 june 2018', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`order_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `delivery_date` varchar(255) NOT NULL,
  `delivery_time` varchar(255) NOT NULL,
  `note_for_store` text NOT NULL,
  `delivery_mode` enum('Take away','Delivery') NOT NULL,
  `subtotal` varchar(255) NOT NULL,
  `delivery_fee` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `store_id` varchar(255) NOT NULL,
  `order_status` enum('New','Processing','Hold','Completed') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `fname`, `lname`, `contact`, `email`, `address`, `city`, `pincode`, `delivery_date`, `delivery_time`, `note_for_store`, `delivery_mode`, `subtotal`, `delivery_fee`, `grand_total`, `timestamp`, `store_id`, `order_status`) VALUES
(1, 'Anubhav', 'Saxena', '9911609299', 'aksaxena1991@gmail.com', 'Utsav Vihar', 'New Delhi', '110081', '31-12-2016', '01:00', '4545', 'Delivery', '891', '60', '1099', '2016-12-31 14:21:12', '3', 'New'),
(2, 'Anubhav', 'Saxena', '9911609299', 'aksaxena1991@gmail.com', 'Utsav Vihar', 'New Delhi', '110081', '31-12-2016', '01:00', '4545', 'Delivery', '891', '60', '1099', '2016-12-31 14:26:17', '3', 'New'),
(3, 'Anubhav', 'Saxena', '9911609299', 'aksaxena1991@gmail.com', 'Utsav Vihar', 'New Delhi', '110081', '31-12-2016', '01:00', '4545', 'Delivery', '891', '60', '1099', '2016-12-31 14:36:00', '3', 'New'),
(4, 'Anubhav', 'saxena', '9911609299', 'aksaxena1991@gmail.com', 'Utsav Vihar', 'New Delhi', '110081', '31-12-2016', '15:20', '25', 'Delivery', '891', '60', '1099', '2016-12-31 14:48:34', '3', 'New'),
(5, 'Anubhav', 'Saxena', '9911609299', 'aksaxena1991@gmail.com', 'Utsav Vihar', 'New Delhi', '110081', '31-12-2016', '12:12', 'cash', 'Delivery', '3379', '60', '4000', '2016-12-31 14:53:57', '3', 'New'),
(6, 'Anubhaav', 'Saxena', '9911609299', 'aksaxena1991@gmail.com', 'Utsav Vihar', 'New Delhi', '110081', '31-12-2016', '12:12', 'none', 'Delivery', '1987', '60', '2377', '2016-12-31 15:14:01', '3', 'New');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE IF NOT EXISTS `order_details` (
`order_detail_id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_quantity` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `order_id`, `product_id`, `product_price`, `timestamp`, `product_quantity`) VALUES
(1, '1', '3', '99', '2016-12-31 14:21:12', '9'),
(2, '2', '3', '99', '2016-12-31 14:26:18', '9'),
(3, '3', '3', '99', '2016-12-31 14:36:00', '9'),
(4, '4', '3', '99', '2016-12-31 14:48:34', '9'),
(5, '5', '3', '99', '2016-12-31 14:53:57', '8'),
(6, '5', '2', '199', '2016-12-31 14:53:57', '13'),
(7, '6', '3', '99', '2016-12-31 15:14:01', '6'),
(8, '6', '2', '199', '2016-12-31 15:14:02', '7');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
`reg_id` int(11) NOT NULL,
  `reg_username` varchar(255) NOT NULL,
  `reg_password` varchar(255) NOT NULL,
  `reg_email` varchar(255) NOT NULL,
  `reg_reset_code` varchar(255) DEFAULT NULL,
  `tiimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`reg_id`, `reg_username`, `reg_password`, `reg_email`, `reg_reset_code`, `tiimestamp`) VALUES
(28, 'aksaxena1991', '1234', 'aksaxena1991@gmail.com', NULL, '2018-06-19 21:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
 ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
 ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
 ADD PRIMARY KEY (`reg_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
 ADD PRIMARY KEY (`session_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

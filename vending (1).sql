-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 14, 2017 at 11:25 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vending`
--

-- --------------------------------------------------------

--
-- Table structure for table `coin`
--

CREATE TABLE IF NOT EXISTS `coin` (
  `coin_id` int(11) NOT NULL AUTO_INCREMENT,
  `coin_denomination` decimal(10,2) NOT NULL,
  `coin_value` decimal(10,2) NOT NULL,
  `coin_qty` int(11) NOT NULL,
  PRIMARY KEY (`coin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `coin`
--

INSERT INTO `coin` (`coin_id`, `coin_denomination`, `coin_value`, `coin_qty`) VALUES
(1, '1.00', '1.00', 100),
(2, '2.00', '2.00', 100),
(3, '5.00', '5.00', 100),
(4, '10.00', '10.00', 100),
(5, '0.50', '0.50', 100);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `product_desc` text NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_desc`, `product_price`, `product_qty`, `product_name`) VALUES
(1, 'Coca Cola 330ml', '11.00', 100, 'Coca Cola'),
(2, 'Coca Cola Can 330ml', '10.50', 100, 'Coca Cola Can');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_desc` text NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_name` text NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_desc`, `product_price`, `product_qty`, `product_name`) VALUES
(1, 'Coca Cola 330ml', '5.00', 62, 'Coke'),
(2, 'Creme Soda', '12.50', 114, 'Creme Soda'),
(13, 'Bonaqua Pump 750ml', '11.50', 100, 'Bonaqua Pump'),
(14, 'Fanta Orange 500ml Buddy', '12.00', 94, 'Fanta Orange'),
(15, 'Fanta Grape 500ml Buddy', '12.00', 100, 'Fanta Grape'),
(16, 'Lindt Milk Chocolate', '25.00', 0, 'Lindt Chocolate 100g'),
(17, 'Aero Mint 125g', '18.50', 100, 'Aero Mint 125g'),
(18, 'Chomp 5g', '0.50', 250, 'Chomp 5g'),
(22, 'GLC Hotel Voucher', '350.00', 120, 'GLC Hotel Voucher');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

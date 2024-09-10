-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.32 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for smarttrade
CREATE DATABASE IF NOT EXISTS `smarttrade` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smarttrade`;

-- Dumping structure for table smarttrade.address
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `line1` text NOT NULL,
  `line2` text NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `city_id` int NOT NULL,
  `user_id` int NOT NULL,
  `first_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_city1_idx` (`city_id`),
  KEY `fk_address_user1_idx` (`user_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_address_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.address: ~2 rows (approximately)
REPLACE INTO `address` (`id`, `line1`, `line2`, `postal_code`, `mobile`, `city_id`, `user_id`, `first_name`, `last_name`) VALUES
	(1, '291/1,', 'Uduhulpotha', '90100', '0751441764', 1, 5, 'Chanaka', 'Sanjeewa'),
	(2, '53/3,', 'Fort Railway station', '00100', '0712223450', 3, 4, 'Tharanga', 'Kumari');

-- Dumping structure for table smarttrade.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_product1_idx` (`product_id`),
  KEY `fk_cart_user1_idx` (`user_id`),
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.cart: ~5 rows (approximately)
REPLACE INTO `cart` (`id`, `product_id`, `qty`, `user_id`) VALUES
	(7, 14, 4, 4),
	(8, 16, 3, 4),
	(9, 17, 4, 4),
	(10, 13, 3, 4);

-- Dumping structure for table smarttrade.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.category: ~6 rows (approximately)
REPLACE INTO `category` (`id`, `name`) VALUES
	(1, 'Apple'),
	(2, 'Samsung'),
	(3, 'Sony'),
	(4, 'Xiomi'),
	(5, 'Google'),
	(6, 'Oppo'),
	(7, 'Huawei');

-- Dumping structure for table smarttrade.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.city: ~4 rows (approximately)
REPLACE INTO `city` (`id`, `name`) VALUES
	(1, 'Bandarawela'),
	(2, 'Badulla'),
	(3, 'Colombo'),
	(4, 'Haliela');

-- Dumping structure for table smarttrade.color
CREATE TABLE IF NOT EXISTS `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.color: ~9 rows (approximately)
REPLACE INTO `color` (`id`, `name`) VALUES
	(1, 'Black'),
	(2, 'White'),
	(3, 'Red'),
	(4, 'Blue'),
	(5, 'Green'),
	(6, 'Gold'),
	(7, 'Purple'),
	(8, 'Orange'),
	(9, 'Two Color Combinations'),
	(10, 'Other'),
	(11, 'Silver');

-- Dumping structure for table smarttrade.model
CREATE TABLE IF NOT EXISTS `model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_model_category_idx` (`category_id`),
  CONSTRAINT `fk_model_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.model: ~29 rows (approximately)
REPLACE INTO `model` (`id`, `name`, `category_id`) VALUES
	(1, 'Galaxy A06', 2),
	(2, 'Galaxy F14 4G', 2),
	(3, 'Galaxy Z Fold6', 2),
	(4, 'Galaxy M35', 2),
	(5, 'Galaxy F55', 2),
	(6, 'Galaxy C55', 2),
	(7, 'iPhone 13 Pro Max (2024)', 1),
	(8, 'iPad Pro 11 (2024)', 1),
	(9, 'iPhone 15 Pro Max', 1),
	(10, 'Phone 14 Pro Max', 1),
	(11, 'iPhone SE (2022)', 1),
	(12, 'MatePad Air (2024)', 7),
	(13, 'Pura 70 Pro', 7),
	(14, 'MatePad 11.5 S', 7),
	(15, 'Huawei nova Flip', 7),
	(16, 'Nova 12 SE', 7),
	(17, 'Pixel 9 Pro XL', 5),
	(18, 'Pixel Fold', 5),
	(19, 'Pixel 6 Pro', 5),
	(20, 'Pixel 4a 5G', 5),
	(21, 'Reno12 F 4G', 6),
	(22, 'Oppo Find X7', 6),
	(23, 'F25 Pro', 6),
	(24, 'Xiaomi Redmi 14C', 4),
	(25, 'Poco Pad 5G', 4),
	(26, 'Redmi K70 Ultra', 4),
	(27, 'Poco X6 Neo', 4),
	(28, 'Xperia 10 VI', 3),
	(29, 'Xperia XZ Premium', 3),
	(30, 'Xperia XZ1 Compact', 3),
	(31, 'Samsung A04E', 2),
	(32, 'Galaxy A05', 2);

-- Dumping structure for table smarttrade.order
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `datetime` datetime NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user1_idx` (`user_id`),
  KEY `fk_order_address1_idx` (`address_id`),
  CONSTRAINT `fk_order_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.order: ~0 rows (approximately)

-- Dumping structure for table smarttrade.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_order1_idx` (`order_id`),
  KEY `fk_order_item_product1_idx` (`product_id`),
  KEY `fk_order_item_order_status1_idx` (`order_status_id`),
  CONSTRAINT `fk_order_item_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_order_item_order_status1` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `fk_order_item_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.order_item: ~0 rows (approximately)

-- Dumping structure for table smarttrade.order_status
CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.order_status: ~0 rows (approximately)
REPLACE INTO `order_status` (`id`, `name`) VALUES
	(1, 'Pending'),
	(2, 'Approved'),
	(3, 'Rejected'),
	(4, 'Fulfilled'),
	(5, 'Closed'),
	(6, 'Paid'),
	(7, 'Delivered');

-- Dumping structure for table smarttrade.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `qty` int NOT NULL,
  `date_time` datetime NOT NULL,
  `model_id` int NOT NULL,
  `storage_id` int NOT NULL,
  `color_id` int NOT NULL,
  `user_id` int NOT NULL,
  `condition_id` int NOT NULL,
  `product_status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_model1_idx` (`model_id`),
  KEY `fk_product_storage1_idx` (`storage_id`),
  KEY `fk_product_color1_idx` (`color_id`),
  KEY `fk_product_user1_idx` (`user_id`),
  KEY `fk_product_condition1_idx` (`condition_id`),
  KEY `fk_product_product_status1_idx` (`product_status_id`),
  CONSTRAINT `fk_product_color1` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  CONSTRAINT `fk_product_condition1` FOREIGN KEY (`condition_id`) REFERENCES `product_condition` (`id`),
  CONSTRAINT `fk_product_model1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  CONSTRAINT `fk_product_status` FOREIGN KEY (`product_status_id`) REFERENCES `product_status` (`id`),
  CONSTRAINT `fk_product_storage1` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `fk_product_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.product: ~4 rows (approximately)
REPLACE INTO `product` (`id`, `title`, `description`, `price`, `qty`, `date_time`, `model_id`, `storage_id`, `color_id`, `user_id`, `condition_id`, `product_status_id`) VALUES
	(13, 'iPhone 13 Pro 128 GB Blue', 'APPLPE IPHONE 13 BLUE <br/>\r\n5G CONNECTIVITY <br/>\r\n128GB MEMORY <br/>\r\nSIMFREE <br/>\r\nSUPER RETINA XDR DISPLAY <br/>\r\nDUAL 12MP CAMERA SYSTEM WIDE & ULTRA WIDE <br/>', 156000, 30, '2024-09-11 02:32:20', 7, 5, 4, 4, 1, 1),
	(14, ' Apple iPhone 13 Red 256 GB', 'APPLPE IPHONE 13 RED <br/>\r\n5G CONNECTIVITY <br/>\r\n256GB MEMORY <br/>\r\nSIMFREE <br/>\r\nSUPER RETINA XDR DISPLAY <br/>\r\nDUAL 12MP CAMERA SYSTEM WIDE & ULTRA WIDE <br/>', 200000, 30, '2024-09-11 02:36:53', 7, 6, 3, 4, 1, 1),
	(15, ' Apple iPhone 13 Blue 512GB', 'APPLPE IPHONE 13 GOLD<br/>\r\n5G CONNECTIVITY <br/>\r\n512GB MEMORY <br/>\r\nSIMFREE <br/>\r\nSUPER RETINA XDR DISPLAY <br/>\r\nDUAL 12MP CAMERA SYSTEM WIDE & ULTRA WIDE <br/>', 420000, 10, '2024-09-11 02:38:03', 7, 7, 6, 4, 1, 1),
	(16, ' Apple iPhone 13 Green 128GB', 'APPLPE IPHONE 13 GREEN<br/>\r\n5G CONNECTIVITY <br/>\r\n512GB MEMORY <br/>\r\nSIMFREE <br/>\r\nSUPER RETINA XDR DISPLAY <br/>\r\nDUAL 12MP CAMERA SYSTEM WIDE & ULTRA WIDE <br/>', 160000, 15, '2024-09-11 02:39:18', 7, 5, 5, 4, 1, 1),
	(17, ' Apple iPhone 14 Indigo 512GB', 'APPLPE IPHONE 14 INDIGO<br/>\r\n5G CONNECTIVITY <br/>\r\n512GB MEMORY <br/>\r\nSIMFREE <br/>\r\nSUPER RETINA XDR DISPLAY <br/>\r\nDUAL 12MP CAMERA SYSTEM WIDE & ULTRA WIDE <br/>', 210000, 30, '2024-09-11 02:41:01', 10, 7, 9, 4, 1, 1);

-- Dumping structure for table smarttrade.product_condition
CREATE TABLE IF NOT EXISTS `product_condition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.product_condition: ~2 rows (approximately)
REPLACE INTO `product_condition` (`id`, `name`) VALUES
	(1, 'Brand New'),
	(2, 'Used');

-- Dumping structure for table smarttrade.product_status
CREATE TABLE IF NOT EXISTS `product_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.product_status: ~2 rows (approximately)
REPLACE INTO `product_status` (`id`, `name`) VALUES
	(1, 'Active'),
	(2, 'Inactive');

-- Dumping structure for table smarttrade.storage
CREATE TABLE IF NOT EXISTS `storage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.storage: ~7 rows (approximately)
REPLACE INTO `storage` (`id`, `value`) VALUES
	(1, '8 GB'),
	(2, '16 GB'),
	(3, '32 GB'),
	(4, '64 GB'),
	(5, '128 GB'),
	(6, '256 GB'),
	(7, '512 GB'),
	(8, '1 TB'),
	(9, '6 GB'),
	(10, '4 GB');

-- Dumping structure for table smarttrade.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(45) NOT NULL,
  `verification` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table smarttrade.user: ~4 rows (approximately)
REPLACE INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `verification`) VALUES
	(1, 'Sadeesha', 'Nilakshini', 'sadeeshanilakshini@gmail.com', 'sadeeN@325', '876543'),
	(3, 'Chanaka', 'Sanjeewa', 'chanakaelectro@gmail.com', 'chanaEL@68', 'Verified'),
	(4, 'Sadeesha', 'Nilakshini', 'sadeeshanilakshi25@gmail.com', 'sadeeNilaks@325', 'Verified'),
	(5, 'Delta', 'Codex', 'deltacodexsoftwares@gmail.com', 'thariCHA@8754', 'Verified'),
	(6, 'Kasuni', 'Jayamali', 'kasunijayamali.kj@gmail.com', 'KasuniGD@2024', 'Verified'),
	(7, 'Gayan', 'Dhanushka', 'gayandhanushka@gmail.com', 'grayanDH@456', 'Verified');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

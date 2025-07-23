-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: fashion_store
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'nike_banner1.jpg','Sản Phẩm Mới Ra Mắt',0),(2,'nike_banner2.jpg','Sản Phẩm Mới Ra Mắt 2',0),(3,'nike_banner3.jpg','Sản Phẩm Mới Ra Mắt 3',1),(4,'nike_banner4.jpg','Sản Phẩm Mới Ra Mắt 4',1),(5,'adidas_banner.jpg','Sản Phẩm Mới Ra Mắt 5',1),(6,'banner1.jpg',NULL,0),(7,'banner2.jpg',NULL,0);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (2,'Adidas'),(5,'Gucci'),(6,'LV'),(1,'Nike'),(3,'Puma'),(4,'Viettien');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,2,1,2),(2,3,2,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID duy nhất của mục trong giỏ hàng',
  `user_id` int NOT NULL COMMENT 'ID của người dùng (khóa ngoại từ bảng users)',
  `product_id` int NOT NULL COMMENT 'ID của sản phẩm (khóa ngoại từ bảng products)',
  `size` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Size sản phẩm đã chọn (S, M, L, 38, 39, ...)',
  `quantity` int NOT NULL DEFAULT '1' COMMENT 'Số lượng sản phẩm trong giỏ',
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian thêm sản phẩm vào giỏ',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Thời gian cập nhật mục trong giỏ hàng',
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Màu sắc sản phẩm đã chọn',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKqlofaqyddfoc47f1wgdyn393r` (`user_id`,`product_id`,`color`,`size`),
  UNIQUE KEY `uk_user_product_color_size` (`user_id`,`product_id`,`color`,`size`),
  KEY `fk_cart_product` (`product_id`),
  CONSTRAINT `fk_cart_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (2,1,1,NULL,2,'2025-05-14 01:49:58','2025-06-13 02:29:06',NULL),(3,1,2,NULL,1,'2025-05-14 01:50:05','2025-06-13 02:29:06',NULL),(5,2,2,NULL,2,'2025-05-21 05:26:24','2025-05-21 05:26:24',NULL),(23,14,10,NULL,1,'2025-05-24 12:52:16','2025-05-24 12:52:16',NULL),(24,14,8,NULL,1,'2025-05-24 12:52:18','2025-05-24 12:52:18',NULL),(51,1,8,NULL,1,'2025-06-13 02:17:52','2025-06-13 02:29:06',NULL),(52,1,9,NULL,1,'2025-06-13 02:17:52','2025-06-13 02:29:06',NULL),(53,1,10,NULL,1,'2025-06-13 02:17:52','2025-06-13 02:29:06',NULL),(213,11,22,'39',1,'2025-06-30 22:18:46','2025-06-30 22:18:46','Trắng'),(230,17,22,'39',1,'2025-07-09 02:42:45','2025-07-09 02:42:45','Trắng'),(231,17,23,'40',1,'2025-07-09 02:42:49','2025-07-09 02:42:49',''),(232,17,20,'L',1,'2025-07-09 02:42:53','2025-07-09 02:42:53','Be'),(299,12,26,'M',1,'2025-07-17 11:27:30','2025-07-17 11:27:30','Trắng'),(300,12,23,'40',1,'2025-07-17 11:27:32','2025-07-17 11:27:32',''),(326,9,26,'L',1,'2025-07-18 03:07:16','2025-07-18 03:07:16','Trắng'),(327,9,26,'XL',1,'2025-07-18 03:07:16','2025-07-18 03:07:16','Trắng');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Thời trang nam',NULL,NULL,NULL),(2,'Thời trang nữ',NULL,NULL,NULL),(3,'Thời trang trẻ em',NULL,NULL,NULL),(4,'Thời trang cặp đôi',NULL,NULL,NULL),(5,'Túi xách',NULL,NULL,NULL),(6,'Giày',NULL,NULL,NULL),(7,'Dép',NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL COMMENT 'ID của phòng chat',
  `sender_id` int NOT NULL COMMENT 'ID của người gửi (có thể là user hoặc admin)',
  `sender_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'USER hoặc ADMIN',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_seen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_chatmessage_room` (`room_id`),
  CONSTRAINT `fk_chatmessage_room` FOREIGN KEY (`room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
INSERT INTO `chat_messages` VALUES (1,1,9,'USER','hi','2025-06-29 17:35:59',1),(2,1,9,'USER','Hiii','2025-06-29 17:36:12',1),(3,1,9,'USER','Hi','2025-06-29 17:37:25',1),(4,1,9,'USER','hi','2025-06-29 17:47:26',1),(5,1,9,'USER','hi','2025-06-29 17:49:00',1),(6,1,9,'USER','huuu','2025-06-29 17:58:30',1),(7,1,9,'USER','Hello shop','2025-06-29 17:58:42',1),(8,1,9,'USER','Shop thay toi khong','2025-06-29 17:58:54',1),(9,1,9,'USER','hi','2025-06-29 18:12:48',1),(10,1,1,'ADMIN','hi','2025-06-29 18:13:13',1),(11,1,1,'ADMIN','Toi co thay ban nhe','2025-06-29 18:13:24',1),(12,1,9,'USER','Hii','2025-06-29 18:13:31',1),(13,1,9,'USER','ii','2025-06-29 18:16:54',1),(14,1,9,'USER','hhhh','2025-06-29 18:17:00',1),(15,2,12,'USER','Hi shop','2025-06-29 18:17:30',1),(16,1,9,'USER','ok','2025-06-29 19:03:37',1),(17,1,9,'USER','ok','2025-06-29 19:03:53',1),(18,1,9,'USER','Ok','2025-06-29 19:09:18',1),(19,2,1,'ADMIN','hi','2025-06-29 19:13:42',0),(20,1,1,'ADMIN','Hi','2025-06-29 19:22:11',1),(21,1,9,'USER','Oi','2025-06-29 19:42:15',1),(22,1,1,'ADMIN','Chi','2025-06-29 19:42:28',1),(23,1,1,'ADMIN','chi','2025-06-29 19:42:33',1),(24,1,1,'ADMIN','???','2025-06-29 19:44:40',1),(25,1,9,'USER','????','2025-06-29 19:44:54',1),(26,1,9,'USER','hii','2025-06-29 20:20:09',0),(27,2,12,'USER','?','2025-06-29 20:22:39',0),(28,2,12,'USER','?','2025-06-29 20:22:44',0),(29,2,12,'USER','?','2025-06-29 20:28:29',0),(30,1,9,'USER','hh','2025-06-30 16:33:43',0),(31,3,11,'USER','22','2025-06-30 22:19:04',0),(32,2,1,'ADMIN','.','2025-07-15 15:09:05',0),(33,3,1,'ADMIN','Ok','2025-07-15 15:09:17',0),(34,1,9,'USER','j','2025-07-15 15:17:04',0),(35,1,1,'ADMIN','L','2025-07-15 15:17:11',0),(36,1,9,'USER','H','2025-07-15 15:17:15',0),(37,1,1,'ADMIN','G','2025-07-15 15:17:17',0),(38,1,9,'USER','K','2025-07-15 15:17:32',0),(39,1,1,'ADMIN','K','2025-07-15 15:18:16',0),(40,1,9,'USER','K','2025-07-15 15:18:38',0),(41,1,9,'USER',',','2025-07-15 15:41:18',0),(42,1,1,'ADMIN','Ok','2025-07-16 13:58:05',0),(43,1,9,'USER','Ok','2025-07-16 14:07:30',0);
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_rooms`
--

DROP TABLE IF EXISTS `chat_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `last_message_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_sender_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Người gửi cuối cùng (USER hoặc ADMIN)',
  `last_message_timestamp` datetime DEFAULT NULL COMMENT 'Thời gian của tin nhắn cuối cùng',
  `unread_by_user` int NOT NULL DEFAULT '0' COMMENT 'Số tin nhắn user chưa đọc',
  `unread_by_admin` int NOT NULL DEFAULT '0' COMMENT 'Số tin nhắn admin chưa đọc',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`user_id`),
  CONSTRAINT `fk_chatroom_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_rooms`
--

LOCK TABLES `chat_rooms` WRITE;
/*!40000 ALTER TABLE `chat_rooms` DISABLE KEYS */;
INSERT INTO `chat_rooms` VALUES (1,9,'Ok','USER','2025-07-16 14:07:30',0,1,'2025-06-30 00:35:53','2025-07-16 14:07:30'),(2,12,'.','ADMIN','2025-07-15 15:09:05',1,0,'2025-06-30 01:17:23','2025-07-15 15:09:05'),(3,11,'Ok','ADMIN','2025-07-15 15:09:17',1,0,'2025-06-30 22:18:59','2025-07-15 15:09:17');
/*!40000 ALTER TABLE `chat_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `min_order_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'SALE10',10.00,'2025-12-31',500000.00),(2,'FREESHIP',100.00,'2025-06-30',0.00);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `loyalty_points` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `is_admin_notification` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_notification_user` (`user_id`),
  KEY `fk_notification_order` (`order_id`),
  CONSTRAINT `fk_notification_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_notification_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,9,0,86,'Trạng thái đơn hàng #86','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',1,'2025-06-29 09:26:31'),(2,9,0,86,'Trạng thái đơn hàng #86','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',1,'2025-06-29 09:27:24'),(3,9,0,86,'Trạng thái đơn hàng #86','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',1,'2025-06-29 09:35:17'),(4,NULL,1,85,'Đơn hàng đã bị hủy','Người dùng peter đã hủy đơn hàng #85.',1,'2025-06-29 09:35:55'),(5,NULL,1,84,'Đơn hàng đã bị hủy','Người dùng peter đã hủy đơn hàng #84.',1,'2025-06-29 09:59:52'),(6,9,0,86,'Trạng thái đơn hàng #86','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',1,'2025-06-29 10:13:31'),(7,9,0,82,'Trạng thái đơn hàng #82','Đơn hàng của bạn đã được cập nhật sang trạng thái: CANCELLED_BY_ADMIN',1,'2025-06-29 10:13:57'),(8,NULL,1,81,'Đơn hàng đã bị hủy','Người dùng peter đã hủy đơn hàng #81.',1,'2025-06-29 10:19:52'),(9,9,0,80,'Trạng thái đơn hàng #80','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',1,'2025-06-29 10:21:51'),(10,NULL,1,88,'Đơn hàng đã bị hủy','Người dùng peter đã hủy đơn hàng #88.',1,'2025-06-29 10:29:34'),(11,NULL,1,79,'Đơn hàng đã bị hủy','Người dùng peter đã hủy đơn hàng #79.',1,'2025-06-29 10:43:30'),(12,9,0,80,'Trạng thái đơn hàng #80','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-06-29 11:10:59'),(13,9,0,75,'Trạng thái đơn hàng #75','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-06-29 11:13:08'),(14,9,0,75,'Trạng thái đơn hàng #75','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-06-29 11:17:07'),(15,9,0,75,'Trạng thái đơn hàng #75','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',1,'2025-06-29 11:17:45'),(16,9,0,78,'Trạng thái đơn hàng #78','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',1,'2025-06-29 11:29:35'),(17,9,0,77,'Trạng thái đơn hàng #77','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',1,'2025-06-29 11:34:29'),(18,9,0,77,'Trạng thái đơn hàng #77','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',1,'2025-06-29 11:38:44'),(19,9,0,76,'Trạng thái đơn hàng #76','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-06-29 16:28:50'),(20,9,0,76,'Trạng thái đơn hàng #76','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-06-29 16:29:01'),(21,9,0,76,'Trạng thái đơn hàng #76','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',1,'2025-06-29 16:29:10'),(22,NULL,1,74,'Đơn hàng đã bị hủy','Người dùng peter đã hủy đơn hàng #74.',1,'2025-06-29 16:30:04'),(23,9,0,72,'Trạng thái đơn hàng #72','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-06-29 19:05:21'),(24,9,0,72,'Trạng thái đơn hàng #72','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-06-29 19:05:28'),(25,NULL,1,89,'Đơn hàng đã bị hủy','Người dùng peter đã hủy đơn hàng #89.',1,'2025-06-29 19:10:57'),(26,9,0,75,'Trạng thái đơn hàng #75','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-06-29 20:28:59'),(27,9,0,75,'Trạng thái đơn hàng #75','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',1,'2025-06-29 20:29:02'),(28,9,0,90,'Trạng thái đơn hàng #90','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-06-29 21:54:24'),(29,9,0,90,'Trạng thái đơn hàng #90','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-06-29 21:54:27'),(30,9,0,90,'Trạng thái đơn hàng #90','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-06-29 21:54:30'),(31,9,0,90,'Trạng thái đơn hàng #90','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-06-29 21:54:33'),(32,9,0,90,'Trạng thái đơn hàng #90','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',1,'2025-06-29 21:54:36'),(33,9,0,92,'Trạng thái đơn hàng #92','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-06-30 16:14:25'),(34,9,0,92,'Trạng thái đơn hàng #92','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-06-30 17:51:59'),(35,9,0,91,'Trạng thái đơn hàng #91','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-06-30 17:52:07'),(36,11,0,19,'Trạng thái đơn hàng #19','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-06-30 21:46:45'),(37,11,0,19,'Trạng thái đơn hàng #19','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-06-30 21:46:50'),(38,9,0,73,'Trạng thái đơn hàng #73','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',1,'2025-06-30 21:48:16'),(39,11,0,93,'Trạng thái đơn hàng #93','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-06-30 21:51:12'),(40,NULL,1,94,'Đơn hàng đã bị hủy','Người dùng user đã hủy đơn hàng #94.',0,'2025-06-30 22:18:23'),(41,9,0,92,'Trạng thái đơn hàng #92','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-06-30 22:20:54'),(42,11,0,93,'Trạng thái đơn hàng #93','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-06-30 22:21:24'),(43,11,0,93,'Trạng thái đơn hàng #93','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-06-30 22:21:27'),(44,11,0,93,'Trạng thái đơn hàng #93','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-06-30 22:21:30'),(45,11,0,93,'Trạng thái đơn hàng #93','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-06-30 22:22:55'),(46,9,0,95,'Trạng thái đơn hàng #95','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-06-30 22:34:06'),(47,9,0,95,'Trạng thái đơn hàng #95','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-06-30 22:34:09'),(48,9,0,95,'Trạng thái đơn hàng #95','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-06-30 22:34:12'),(49,9,0,95,'Trạng thái đơn hàng #95','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-06-30 22:34:15'),(50,9,0,95,'Trạng thái đơn hàng #95','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-06-30 22:34:18'),(51,9,0,71,'Trạng thái đơn hàng #71','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-01 08:08:57'),(52,9,0,71,'Trạng thái đơn hàng #71','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-01 08:09:21'),(53,9,0,71,'Trạng thái đơn hàng #71','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-07-01 08:09:37'),(54,9,0,71,'Trạng thái đơn hàng #71','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-07-01 08:09:56'),(55,9,0,71,'Trạng thái đơn hàng #71','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-07-01 08:10:08'),(56,9,0,96,'Trạng thái đơn hàng #96','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-03 15:47:03'),(57,9,0,96,'Trạng thái đơn hàng #96','Đơn hàng của bạn đã được cập nhật sang trạng thái: CANCELLED_BY_ADMIN',0,'2025-07-03 15:47:25'),(58,NULL,1,97,'Đơn hàng đã bị hủy','Người dùng Hung đã hủy đơn hàng #97.',0,'2025-07-09 02:03:56'),(59,17,0,98,'Trạng thái đơn hàng #98','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-09 02:30:04'),(60,17,0,98,'Trạng thái đơn hàng #98','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-09 02:30:06'),(61,17,0,98,'Trạng thái đơn hàng #98','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-07-09 02:30:09'),(62,17,0,98,'Trạng thái đơn hàng #98','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-07-09 02:30:12'),(63,17,0,98,'Trạng thái đơn hàng #98','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-07-09 02:30:15'),(64,9,0,102,'Trạng thái đơn hàng #102','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-14 02:40:52'),(65,9,0,102,'Trạng thái đơn hàng #102','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-14 02:40:56'),(66,9,0,102,'Trạng thái đơn hàng #102','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-07-14 03:27:39'),(67,9,0,102,'Trạng thái đơn hàng #102','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-07-14 03:27:42'),(68,9,0,102,'Trạng thái đơn hàng #102','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',1,'2025-07-14 03:27:50'),(69,9,0,103,'Trạng thái đơn hàng #103','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-14 03:49:58'),(70,9,0,103,'Trạng thái đơn hàng #103','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-14 03:50:03'),(71,9,0,103,'Trạng thái đơn hàng #103','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-07-14 03:50:06'),(72,9,0,103,'Trạng thái đơn hàng #103','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-07-14 03:50:09'),(73,9,0,103,'Trạng thái đơn hàng #103','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-07-14 03:50:12'),(74,9,0,99,'Trạng thái đơn hàng #99','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-14 04:15:58'),(75,9,0,99,'Trạng thái đơn hàng #99','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-14 04:16:01'),(76,9,0,99,'Trạng thái đơn hàng #99','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-07-14 04:16:04'),(77,9,0,99,'Trạng thái đơn hàng #99','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-07-14 04:16:08'),(78,9,0,99,'Trạng thái đơn hàng #99','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-07-14 04:16:11'),(79,9,0,104,'Trạng thái đơn hàng #104','Đơn hàng của bạn đã được cập nhật sang trạng thái: CANCELLED_BY_ADMIN',0,'2025-07-15 15:27:49'),(80,9,0,105,'Trạng thái đơn hàng #105','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',1,'2025-07-15 15:29:06'),(81,9,0,105,'Trạng thái đơn hàng #105','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-15 15:29:19'),(82,9,0,105,'Trạng thái đơn hàng #105','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',1,'2025-07-15 15:29:29'),(83,9,0,105,'Trạng thái đơn hàng #105','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-07-15 15:31:56'),(84,9,0,101,'Trạng thái đơn hàng #101','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-15 15:33:52'),(85,9,0,106,'Trạng thái đơn hàng #106','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',1,'2025-07-15 15:35:53'),(86,9,0,106,'Trạng thái đơn hàng #106','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',1,'2025-07-15 15:36:04'),(87,9,0,107,'Trạng thái đơn hàng #107','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-15 15:39:20'),(88,9,0,107,'Trạng thái đơn hàng #107','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-15 15:39:26'),(89,9,0,107,'Trạng thái đơn hàng #107','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-07-15 15:39:34'),(90,9,0,107,'Trạng thái đơn hàng #107','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-07-15 15:39:46'),(91,9,0,107,'Trạng thái đơn hàng #107','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-07-15 15:39:53'),(92,NULL,1,109,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #109.',1,'2025-07-16 15:16:48'),(93,9,0,109,'Trạng thái đơn hàng #109','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',1,'2025-07-16 15:17:07'),(94,9,0,109,'Trạng thái đơn hàng #109','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-16 15:17:26'),(95,9,0,109,'Trạng thái đơn hàng #109','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-07-16 15:17:45'),(96,9,0,108,'Trạng thái đơn hàng #108','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-16 15:18:04'),(97,NULL,1,108,'Đơn hàng đã bị hủy','Người dùng Hung đã hủy đơn hàng #108.',0,'2025-07-16 15:18:22'),(98,9,0,100,'Trạng thái đơn hàng #100','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-16 15:18:54'),(99,9,0,100,'Trạng thái đơn hàng #100','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-16 15:19:22'),(100,9,0,109,'Trạng thái đơn hàng #109','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-07-16 15:22:08'),(101,NULL,1,110,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #110.',1,'2025-07-16 15:33:25'),(102,9,0,110,'Trạng thái đơn hàng #110','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-16 15:33:41'),(103,9,0,110,'Trạng thái đơn hàng #110','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-16 15:38:57'),(104,9,0,110,'Trạng thái đơn hàng #110','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-07-17 08:53:11'),(105,9,0,110,'Trạng thái đơn hàng #110','Đơn hàng của bạn đã được cập nhật sang trạng thái: DELIVERED',0,'2025-07-17 08:54:08'),(106,9,0,110,'Trạng thái đơn hàng #110','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-07-17 08:59:52'),(107,9,0,35,'Trạng thái đơn hàng #35','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-07-17 09:00:47'),(108,9,0,21,'Trạng thái đơn hàng #21','Đơn hàng của bạn đã được cập nhật sang trạng thái: COMPLETED',0,'2025-07-17 09:01:08'),(109,NULL,1,111,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #111.',0,'2025-07-17 09:04:04'),(110,NULL,1,112,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #112.',0,'2025-07-17 09:18:15'),(111,NULL,1,113,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #113.',0,'2025-07-17 09:20:41'),(112,NULL,1,114,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #114.',0,'2025-07-17 09:46:45'),(113,NULL,1,115,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #115.',0,'2025-07-17 09:56:44'),(114,NULL,1,116,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #116.',1,'2025-07-17 10:02:25'),(115,NULL,1,117,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #117.',1,'2025-07-17 10:03:34'),(116,NULL,1,117,'Đơn hàng đã bị hủy','Người dùng Hung đã hủy đơn hàng #117.',0,'2025-07-17 10:03:47'),(117,NULL,1,116,'Đơn hàng đã bị hủy','Người dùng Hung đã hủy đơn hàng #116.',1,'2025-07-17 10:12:02'),(118,NULL,1,115,'Đơn hàng đã bị hủy','Người dùng Hung đã hủy đơn hàng #115.',0,'2025-07-17 10:14:49'),(119,NULL,1,118,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #118.',0,'2025-07-17 10:15:04'),(120,NULL,1,118,'Đơn hàng đã bị hủy','Người dùng Hung đã hủy đơn hàng #118.',0,'2025-07-17 10:15:14'),(121,NULL,1,119,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #119.',0,'2025-07-17 10:19:53'),(122,NULL,1,119,'Đơn hàng đã bị hủy','Người dùng Hung đã hủy đơn hàng #119.',0,'2025-07-17 10:20:01'),(123,NULL,1,120,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #120.',0,'2025-07-17 10:31:02'),(124,NULL,1,121,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #121.',0,'2025-07-17 10:32:10'),(125,9,0,121,'Trạng thái đơn hàng #121','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-17 10:32:30'),(126,9,0,121,'Trạng thái đơn hàng #121','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-17 10:32:33'),(127,NULL,1,122,'Đơn hàng mới từ người dùng','Người dùng Bui vừa đặt đơn hàng #122.',0,'2025-07-17 11:27:23'),(128,NULL,1,123,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #123.',0,'2025-07-17 15:01:13'),(129,NULL,1,124,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #124.',0,'2025-07-17 15:13:01'),(130,NULL,1,125,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #125.',0,'2025-07-17 15:17:33'),(131,NULL,1,126,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #126.',0,'2025-07-17 15:19:16'),(132,NULL,1,127,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #127.',1,'2025-07-17 15:27:58'),(133,NULL,1,128,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #128.',1,'2025-07-17 15:29:34'),(134,NULL,1,129,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #129.',1,'2025-07-17 16:55:46'),(135,NULL,1,130,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #130.',1,'2025-07-17 16:56:05'),(136,9,0,130,'Trạng thái đơn hàng #130','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-17 16:58:24'),(137,9,0,130,'Trạng thái đơn hàng #130','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-17 16:59:06'),(138,NULL,1,131,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #131.',0,'2025-07-18 01:38:33'),(139,9,0,131,'Trạng thái đơn hàng #131','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-18 01:39:25'),(140,9,0,131,'Trạng thái đơn hàng #131','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-18 01:39:43'),(141,12,0,122,'Trạng thái đơn hàng #122','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-18 01:40:00'),(142,9,0,129,'Trạng thái đơn hàng #129','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-18 01:40:29'),(143,9,0,129,'Trạng thái đơn hàng #129','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-18 01:40:40'),(144,9,0,131,'Trạng thái đơn hàng #131','Đơn hàng của bạn đã được cập nhật sang trạng thái: SHIPPED',0,'2025-07-18 01:44:08'),(145,NULL,1,132,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #132.',0,'2025-07-18 02:11:30'),(146,9,0,132,'Trạng thái đơn hàng #132','Đơn hàng của bạn đã được cập nhật sang trạng thái: CANCELLED_BY_ADMIN',0,'2025-07-18 02:11:57'),(147,NULL,1,133,'Đơn hàng mới từ người dùng','Người dùng Hung vừa đặt đơn hàng #133.',0,'2025-07-18 02:58:48'),(148,9,0,133,'Trạng thái đơn hàng #133','Đơn hàng của bạn đã được cập nhật sang trạng thái: CONFIRMED',0,'2025-07-18 03:02:07'),(149,9,0,133,'Trạng thái đơn hàng #133','Đơn hàng của bạn đã được cập nhật sang trạng thái: PROCESSING',0,'2025-07-18 03:02:10'),(150,9,0,133,'Trạng thái đơn hàng #133','Đơn hàng của bạn đã được cập nhật sang trạng thái: CANCELLED_BY_ADMIN',0,'2025-07-18 03:02:59');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL COMMENT 'FK đến orders.id',
  `product_id` int DEFAULT NULL COMMENT 'FK đến products.id, cho phép NULL nếu sản phẩm bị xóa',
  `quantity` int NOT NULL,
  `price_at_purchase` double NOT NULL COMMENT 'Giá sản phẩm tại thời điểm mua',
  `created_at` datetime(6) DEFAULT NULL,
  `product_variant_id` int DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_order` (`order_id`),
  KEY `fk_orderitem_product` (`product_id`),
  KEY `fk_order_item_variant` (`product_variant_id`),
  CONSTRAINT `fk_order_item_variant` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FKltmtlue0wixrg1cf0xo7x0l4d` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,18,1,1,450000,'2025-06-02 02:31:52.729523',NULL,NULL,NULL),(2,18,NULL,2,5000000,'2025-06-02 02:31:52.732064',NULL,NULL,NULL),(3,19,1,1,450000,'2025-06-02 02:34:27.286630',NULL,NULL,NULL),(4,19,NULL,2,5000000,'2025-06-02 02:34:27.287630',NULL,NULL,NULL),(5,20,1,1,450000,'2025-06-02 07:20:02.482999',NULL,NULL,NULL),(6,20,2,1,2200000,'2025-06-02 07:20:02.486510',NULL,NULL,NULL),(7,20,NULL,1,550000,'2025-06-02 07:20:02.489078',NULL,NULL,NULL),(8,20,8,1,2300000,'2025-06-02 07:20:02.491970',NULL,NULL,NULL),(9,20,9,1,7500000,'2025-06-02 07:20:02.492979',NULL,NULL,NULL),(10,21,NULL,1,5000000,'2025-06-02 07:35:06.040906',NULL,NULL,NULL),(11,22,1,22,450000,'2025-06-04 06:55:37.051242',NULL,NULL,NULL),(12,22,NULL,3,5000000,'2025-06-04 06:55:37.063061',NULL,NULL,NULL),(13,23,NULL,1,5000000,'2025-06-10 10:35:24.806628',NULL,NULL,NULL),(14,24,NULL,1,5000000,'2025-06-10 10:42:50.812725',NULL,NULL,NULL),(15,24,9,1,7500000,'2025-06-10 10:42:50.814142',NULL,NULL,NULL),(16,25,NULL,1,550000,'2025-06-10 10:45:05.852425',NULL,NULL,NULL),(17,26,2,1,2200000,'2025-06-10 10:51:24.514091',NULL,NULL,NULL),(18,27,NULL,1,5000000,'2025-06-10 10:54:48.949997',NULL,NULL,NULL),(19,28,NULL,1,550000,'2025-06-10 11:57:02.147860',NULL,NULL,NULL),(20,29,NULL,1,1500000,'2025-06-10 12:15:08.639344',NULL,NULL,NULL),(21,30,8,1,2300000,'2025-06-10 12:28:17.509679',NULL,NULL,NULL),(22,31,1,1,450000,'2025-06-10 12:39:54.996856',NULL,NULL,NULL),(23,32,NULL,1,5000000,'2025-06-10 12:40:47.051490',NULL,NULL,NULL),(24,33,2,1,2200000,'2025-06-10 12:47:34.725118',NULL,NULL,NULL),(25,34,1,1,450000,'2025-06-10 16:39:55.712230',NULL,NULL,NULL),(26,34,2,1,2200000,'2025-06-10 16:39:55.715154',NULL,NULL,NULL),(27,35,2,1,2200000,'2025-06-11 09:25:53.668188',NULL,NULL,NULL),(28,35,NULL,1,5000000,'2025-06-11 09:25:53.669189',NULL,NULL,NULL),(29,36,1,1,450000,'2025-06-11 13:46:20.574420',NULL,NULL,NULL),(30,37,1,2,450000,'2025-06-12 21:00:17.039322',NULL,NULL,NULL),(31,38,2,1,2200000,'2025-06-12 21:43:53.422459',NULL,NULL,NULL),(32,39,1,1,500000,'2025-06-13 09:39:02.107465',NULL,NULL,NULL),(33,40,1,1,500000,'2025-06-16 20:55:44.784626',NULL,NULL,NULL),(34,40,2,1,2200000,'2025-06-16 20:55:44.786999',NULL,NULL,NULL),(35,40,NULL,1,500000,'2025-06-16 20:55:44.789795',NULL,NULL,NULL),(36,40,8,1,2300000,'2025-06-16 20:55:44.792186',NULL,NULL,NULL),(37,40,9,1,7500000,'2025-06-16 20:55:44.794226',NULL,NULL,NULL),(38,41,17,1,1234,'2025-06-20 05:16:46.651760',NULL,NULL,NULL),(39,42,NULL,1,500000,'2025-06-20 09:24:21.169491',NULL,NULL,NULL),(40,42,17,1,1234,'2025-06-20 09:24:21.173193',NULL,NULL,NULL),(41,43,2,1,2200000,'2025-06-20 09:25:35.188966',NULL,NULL,NULL),(42,43,NULL,1,500000,'2025-06-20 09:25:35.190253',NULL,NULL,NULL),(43,44,17,1,1234,'2025-06-20 09:27:57.114693',NULL,NULL,NULL),(44,45,17,1,1234,'2025-06-20 09:28:25.271885',NULL,NULL,NULL),(45,46,17,1,1234,'2025-06-20 09:34:29.026164',NULL,NULL,NULL),(46,47,17,1,1234,'2025-06-20 09:36:31.328307',NULL,NULL,NULL),(47,48,17,1,1234,'2025-06-20 09:49:49.086296',NULL,NULL,NULL),(48,49,17,1,1234,'2025-06-20 10:28:20.891031',NULL,NULL,NULL),(49,50,NULL,1,1234,'2025-06-20 10:34:31.572776',NULL,NULL,NULL),(50,51,NULL,2,1234,'2025-06-20 10:48:18.963189',NULL,NULL,NULL),(51,52,17,1,1234,'2025-06-20 10:50:11.870599',NULL,NULL,NULL),(52,53,NULL,1,1234,'2025-06-20 11:03:05.761083',NULL,NULL,NULL),(53,54,NULL,1,1234,'2025-06-20 11:08:58.992635',NULL,NULL,NULL),(54,55,17,1,1234,'2025-06-20 11:09:33.959658',NULL,NULL,NULL),(55,56,17,1,1234,'2025-06-20 11:19:52.865799',NULL,NULL,NULL),(56,57,17,1,1234,'2025-06-20 11:27:10.346305',NULL,NULL,NULL),(57,58,NULL,1,1234,'2025-06-20 11:32:19.434051',NULL,NULL,NULL),(58,59,NULL,1,1234,'2025-06-20 11:33:02.049375',NULL,NULL,NULL),(59,60,1,2,500000,'2025-06-20 14:48:53.693478',NULL,NULL,NULL),(60,60,2,1,2200000,'2025-06-20 14:48:53.696632',NULL,NULL,NULL),(61,60,NULL,1,500000,'2025-06-20 14:48:53.698631',NULL,NULL,NULL),(62,60,NULL,1,550000,'2025-06-20 14:48:53.699983',NULL,NULL,NULL),(63,60,8,1,2300000,'2025-06-20 14:48:53.700982',NULL,NULL,NULL),(64,60,9,1,7500000,'2025-06-20 14:48:53.704412',NULL,NULL,NULL),(65,60,10,1,1200000,'2025-06-20 14:48:53.705919',NULL,NULL,NULL),(66,60,NULL,1,1500000,'2025-06-20 14:48:53.707930',NULL,NULL,NULL),(67,61,1,1,500000,'2025-06-20 15:07:54.222741',NULL,NULL,NULL),(68,62,17,1,1234,'2025-06-20 15:14:12.601146',NULL,NULL,NULL),(69,63,17,1,1234,'2025-06-22 16:09:25.452765',NULL,NULL,NULL),(70,64,1,1,500000,'2025-06-25 21:10:57.728407',NULL,NULL,NULL),(71,64,8,2,2300000,'2025-06-25 21:10:57.732025',NULL,NULL,NULL),(72,64,9,1,7500000,'2025-06-25 21:10:57.733130',NULL,NULL,NULL),(73,64,17,1,1234,'2025-06-25 21:10:57.734139',NULL,NULL,NULL),(74,64,19,2,11111,'2025-06-25 21:10:57.736131',NULL,NULL,NULL),(75,65,NULL,2,500000,'2025-06-26 19:48:31.477038',NULL,NULL,NULL),(76,65,8,1,2300000,'2025-06-26 19:48:31.479349',NULL,NULL,NULL),(77,65,19,1,11111,'2025-06-26 19:48:31.480711',NULL,NULL,NULL),(78,66,NULL,1,500000,'2025-06-27 19:34:36.083876',NULL,NULL,NULL),(79,66,8,1,2300000,'2025-06-27 19:34:36.087053',NULL,NULL,NULL),(80,66,19,1,11111,'2025-06-27 19:34:36.088077',NULL,NULL,NULL),(81,67,8,1,2300000,'2025-06-27 19:41:58.038121',NULL,NULL,NULL),(82,68,NULL,1,1500000,'2025-06-27 20:03:02.081486',NULL,NULL,NULL),(83,69,17,1,1234,'2025-06-27 20:11:42.329566',NULL,NULL,NULL),(84,70,17,1,1234,'2025-06-27 20:18:13.337002',NULL,'l','l'),(85,71,8,1,2300000,'2025-06-27 20:21:36.412250',NULL,NULL,NULL),(86,72,8,1,2300000,'2025-06-27 20:22:34.379838',NULL,NULL,NULL),(87,73,10,1,1200000,'2025-06-27 20:29:57.591390',NULL,NULL,NULL),(88,74,17,1,1234,'2025-06-27 20:39:23.334569',NULL,NULL,NULL),(89,75,NULL,1,1500000,'2025-06-27 20:42:47.068775',NULL,NULL,NULL),(90,76,1,1,500000,'2025-06-27 20:50:10.360069',NULL,NULL,NULL),(91,77,1,1,500000,'2025-06-27 20:55:21.227331',NULL,NULL,NULL),(92,78,17,1,1234,'2025-06-27 21:03:16.187794',NULL,NULL,NULL),(93,79,9,1,7500000,'2025-06-27 21:15:17.043631',NULL,NULL,NULL),(94,80,NULL,1,500000,'2025-06-27 21:26:52.565545',NULL,NULL,NULL),(95,81,8,1,2300000,'2025-06-27 21:42:15.508138',NULL,NULL,NULL),(96,82,NULL,1,500000,'2025-06-27 21:56:17.368139',NULL,NULL,NULL),(97,83,17,1,1234,'2025-06-27 22:56:24.682942',NULL,NULL,NULL),(98,84,9,1,7500000,'2025-06-28 05:08:13.925353',NULL,NULL,NULL),(99,85,19,2,11111,'2025-06-28 05:39:03.440110',NULL,NULL,NULL),(100,86,10,1,1200000,'2025-06-28 05:41:27.609496',NULL,NULL,NULL),(101,87,10,2,1200000,'2025-06-28 05:45:14.261046',NULL,NULL,NULL),(102,88,NULL,1,500000,'2025-06-29 10:29:26.961125',NULL,NULL,NULL),(103,89,8,1,2300000,'2025-06-29 19:10:47.764029',NULL,NULL,NULL),(104,89,17,1,1234,'2025-06-29 19:10:47.776816',NULL,NULL,NULL),(105,90,17,1,300000,'2025-06-29 20:45:29.630504',NULL,NULL,NULL),(106,91,9,1,7500000,'2025-06-29 22:22:18.396647',NULL,NULL,NULL),(107,91,10,3,1200000,'2025-06-29 22:22:18.400810',NULL,NULL,NULL),(108,91,19,2,400000,'2025-06-29 22:22:18.403483',NULL,NULL,NULL),(109,92,22,1,450000,'2025-06-30 16:13:14.626841',NULL,NULL,NULL),(110,93,1,1,950000,'2025-06-30 21:50:03.022790',NULL,NULL,NULL),(111,94,23,1,399000,'2025-06-30 22:18:13.062298',NULL,NULL,NULL),(112,95,10,1,600000,'2025-06-30 22:29:23.344810',NULL,NULL,NULL),(113,95,23,2,399000,'2025-06-30 22:29:23.346026',NULL,NULL,NULL),(114,96,17,1,300000,'2025-07-03 14:50:17.501607',NULL,NULL,NULL),(115,96,23,2,399000,'2025-07-03 14:50:17.505607',NULL,NULL,NULL),(116,97,8,1,2200000,'2025-07-09 02:03:47.136542',NULL,NULL,NULL),(117,98,23,1,399000,'2025-07-09 02:29:16.101770',NULL,NULL,NULL),(118,99,1,1,950000,'2025-07-14 02:13:09.184883',NULL,NULL,NULL),(119,99,8,1,2200000,'2025-07-14 02:13:09.200926',NULL,NULL,NULL),(120,99,17,1,300000,'2025-07-14 02:13:09.202709',NULL,NULL,NULL),(121,99,20,1,500000,'2025-07-14 02:13:09.203221',NULL,NULL,NULL),(122,99,22,1,450000,'2025-07-14 02:13:09.205687',NULL,NULL,NULL),(123,99,23,2,399000,'2025-07-14 02:13:09.211223',NULL,NULL,NULL),(124,100,22,1,450000,'2025-07-14 02:18:48.653498',NULL,NULL,NULL),(125,101,20,1,500000,'2025-07-14 02:33:53.826727',NULL,NULL,NULL),(126,102,17,1,300000,'2025-07-14 02:37:49.346515',NULL,'Đen','L'),(127,103,8,1,2200000,'2025-07-14 03:42:47.887372',NULL,'','42'),(128,103,17,1,300000,'2025-07-14 03:42:47.889372',NULL,'Đen','L'),(129,104,2,1,2000000,'2025-07-15 15:26:30.666643',NULL,'Đen','41'),(130,105,2,1,2000000,'2025-07-15 15:28:39.096172',NULL,'Đen','41'),(131,105,8,1,2200000,'2025-07-15 15:28:39.098697',NULL,'','42'),(132,105,17,1,300000,'2025-07-15 15:28:39.099730',NULL,'Đen','L'),(133,106,2,2,2000000,'2025-07-15 15:35:32.819754',NULL,'Trắng','41'),(134,106,17,3,300000,'2025-07-15 15:35:32.822307',NULL,NULL,NULL),(135,106,21,2,175000,'2025-07-15 15:35:32.824317',NULL,'Trắng','38'),(136,106,23,2,399000,'2025-07-15 15:35:32.825318',NULL,NULL,NULL),(137,107,22,1,450000,'2025-07-15 15:38:57.816786',NULL,'Đen','39'),(138,108,26,1,450000,'2025-07-16 15:07:26.576401',NULL,'Trắng','L'),(139,108,29,1,500000,'2025-07-16 15:07:26.580979',NULL,'','M'),(140,109,27,1,450000,'2025-07-16 15:16:47.674968',NULL,'','M'),(141,110,24,1,350000,'2025-07-16 15:33:24.511840',NULL,'','M'),(142,110,26,1,450000,'2025-07-16 15:33:24.513879',NULL,'Đỏ','S'),(143,110,26,2,450000,'2025-07-16 15:33:24.514878',NULL,'Trắng','M'),(144,110,26,1,450000,'2025-07-16 15:33:24.516385',NULL,'Trắng','XL'),(145,111,25,1,450000,'2025-07-17 09:04:03.611886',NULL,'','M'),(146,111,25,1,450000,'2025-07-17 09:04:03.614316',NULL,'','S'),(147,111,30,2,699000,'2025-07-17 09:04:03.616386',NULL,'','40'),(148,112,22,1,450000,'2025-07-17 09:18:14.653401',NULL,'Đen','38'),(149,113,30,1,699000,'2025-07-17 09:20:41.403469',NULL,'','39'),(150,113,30,1,699000,'2025-07-17 09:20:41.405985',NULL,'','40'),(151,114,28,1,450000,'2025-07-17 09:46:44.690202',NULL,'','M'),(152,114,29,1,500000,'2025-07-17 09:46:44.690708',NULL,'','S'),(153,115,29,1,500000,'2025-07-17 09:56:43.549705',NULL,'','S'),(154,115,30,1,699000,'2025-07-17 09:56:43.550711',NULL,'','39'),(155,116,30,1,699000,'2025-07-17 10:02:25.391079',NULL,'','40'),(156,117,29,1,500000,'2025-07-17 10:03:34.147785',NULL,'','L'),(157,118,29,1,500000,'2025-07-17 10:15:03.783394',NULL,'','L'),(158,118,30,1,699000,'2025-07-17 10:15:03.786368',NULL,'','40'),(159,119,29,1,500000,'2025-07-17 10:19:52.582409',NULL,'','L'),(160,120,2,1,2000000,'2025-07-17 10:31:01.561765',NULL,'Đen','39'),(161,121,2,1,250000,'2025-07-17 10:32:10.389554',NULL,'Đen','40'),(162,122,30,1,699000,'2025-07-17 11:27:22.898056',NULL,'','40'),(163,123,23,1,399000,'2025-07-17 15:01:12.673597',NULL,'','39'),(164,123,23,1,399000,'2025-07-17 15:01:12.676855',NULL,'','40'),(165,124,17,1,300000,'2025-07-17 15:13:01.237594',NULL,'Đen','M'),(166,125,22,1,450000,'2025-07-17 15:17:32.926897',NULL,'Trắng','38'),(167,126,21,1,175000,'2025-07-17 15:19:16.195462',NULL,'','40'),(168,127,1,1,950000,'2025-07-17 15:27:58.259479',NULL,'Vàng','39'),(169,127,1,1,950000,'2025-07-17 15:27:58.261477',NULL,'Xanh','38'),(170,128,26,1,450000,'2025-07-17 15:29:33.917191',NULL,'Đen','L'),(171,129,30,1,699000,'2025-07-17 16:55:46.299190',NULL,'','39'),(172,130,24,1,350000,'2025-07-17 16:56:05.140715',NULL,'','L'),(173,131,26,1,450000,'2025-07-18 01:38:33.032018',NULL,'Trắng','L'),(174,131,26,1,450000,'2025-07-18 01:38:33.036670',NULL,'Trắng','XL'),(175,132,29,1,500000,'2025-07-18 02:11:30.093572',NULL,'','S'),(176,133,29,1,500000,'2025-07-18 02:58:48.473451',NULL,'den','M');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shipping_address` text,
  `notes` text,
  `shipping_fee` double DEFAULT '0',
  `discount` double DEFAULT '0',
  `payment_status` varchar(50) DEFAULT 'unpaid',
  `shipping_status` varchar(50) DEFAULT 'not_shipped',
  `deleted` tinyint(1) DEFAULT '0',
  `admin_cancel_reason` text,
  `receiver_name` varchar(255) NOT NULL,
  `receiver_phone` varchar(20) NOT NULL,
  `subtotal_price` double NOT NULL,
  `user_cancel_reason` text,
  `voucher_discount_amount` decimal(10,2) DEFAULT NULL,
  `applied_voucher_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `FKquja91os7rhbsum9np4p11s89` (`applied_voucher_id`),
  CONSTRAINT `FKquja91os7rhbsum9np4p11s89` FOREIGN KEY (`applied_voucher_id`) REFERENCES `vouchers` (`id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,900000,'pending','COD','2025-03-28 14:19:13','2025-05-21 09:30:47',NULL,NULL,0,0,'unpaid','not_shipped',0,NULL,'','',0,NULL,NULL,NULL),(2,3,2200000,'processing','CreditCard','2025-03-28 14:19:13','2025-05-21 09:30:47',NULL,NULL,0,0,'unpaid','not_shipped',0,NULL,'','',0,NULL,NULL,NULL),(4,1,2000000,'completed','momo','2025-01-15 03:00:00','2025-05-21 09:30:47',NULL,NULL,0,0,'unpaid','not_shipped',0,NULL,'','',0,NULL,NULL,NULL),(5,2,1500000,'completed','cod','2025-02-10 08:30:00','2025-05-21 09:30:47',NULL,NULL,0,0,'unpaid','not_shipped',0,NULL,'','',0,NULL,NULL,NULL),(10,1,1790000,'CONFIRMED','momo','2025-04-01 06:45:00','2025-06-02 02:09:04',NULL,NULL,0,0,'unpaid','not_shipped',0,NULL,'','',0,NULL,NULL,NULL),(11,3,990000,'CANCELLED_BY_ADMIN','COD','2025-04-02 03:20:00','2025-06-02 02:10:28',NULL,NULL,0,0,'unpaid','not_shipped',0,'Hết hàng tồn kho.','','',0,NULL,NULL,NULL),(14,1,780000,'completed','COD','2025-02-15 11:10:00','2025-06-11 15:23:52',NULL,NULL,0,0,'unpaid','not_shipped',0,NULL,'','',0,NULL,NULL,NULL),(15,3,1120000,'completed','CreditCard','2025-02-20 07:55:00','2025-06-11 15:23:52',NULL,NULL,0,0,'unpaid','not_shipped',0,NULL,'','',0,NULL,NULL,NULL),(18,9,10380000,'COMPLETED','COD','2025-06-01 19:31:53','2025-06-02 02:36:55','123 Đường ABC, Phường XYZ, Quận KLM, Thành phố EFG',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Người Nhận Test','0909123456',10450000,NULL,100000.00,3),(19,11,10380000,'COMPLETED','COD','2025-06-01 19:34:27','2025-06-30 21:46:50','123 Đường ABC, Phường XYZ, Quận KLM, Thành phố EFG',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Người Nhận Test','0909123456',10450000,NULL,100000.00,3),(20,9,13030000,'SHIPPED','COD','2025-06-02 00:20:02','2025-06-10 23:18:59','22, Xã Cần Đăng, Huyện Châu Thành, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'hun','0987654321',13000000,NULL,NULL,NULL),(21,9,4980000,'COMPLETED','COD','2025-06-02 00:35:06','2025-07-17 09:01:08','22, Xã Phú Cát, Huyện Quốc Oai, Thành phố Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'bvh','0987654321',5000000,NULL,50000.00,4),(22,9,24930000,'PENDING','COD','2025-06-03 23:55:37','2025-06-04 06:55:37','22, Xã Quảng Thành, Huyện Châu Đức, Tỉnh Bà Rịa - Vũng Tàu',NULL,30000,0,'unpaid','not_shipped',0,NULL,'kkk','0987654321',24900000,NULL,NULL,NULL),(23,9,5030000,'PENDING','COD','2025-06-10 03:35:25','2025-06-10 10:35:25','22, Phường Hòa An, Quận Cẩm Lệ, Thành phố Đà Nẵng',NULL,30000,0,'unpaid','not_shipped',0,NULL,'hhh','0987654321',5000000,NULL,NULL,NULL),(24,9,12530000,'CONFIRMED','COD','2025-06-10 03:42:51','2025-06-11 08:54:12','22, Xã Long Giang, Huyện Chợ Mới, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'hhh','0987654321',12500000,NULL,NULL,NULL),(25,9,580000,'PENDING','COD','2025-06-10 03:45:06','2025-06-10 10:45:06','22i, Xã Phú Hưng, Huyện Phú Tân, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'iii','0987654321',550000,NULL,NULL,NULL),(26,9,2230000,'PENDING','COD','2025-06-10 03:51:25','2025-06-10 10:51:25','22, Xã Long Tân, Huyện Long Đất, Tỉnh Bà Rịa - Vũng Tàu',NULL,30000,0,'unpaid','not_shipped',0,NULL,'123','0987654321',2200000,NULL,NULL,NULL),(27,9,5030000,'CANCELLED_BY_ADMIN','COD','2025-06-10 03:54:49','2025-06-11 09:29:51','22, Xã Bình Mỹ, Huyện Bắc Tân Uyên, Tỉnh Bình Dương',NULL,30000,0,'unpaid','not_shipped',0,'heheehhee','fff','0987654321',5000000,NULL,NULL,NULL),(28,9,580000,'CANCELLED_BY_USER','COD','2025-06-10 04:57:02','2025-06-10 11:57:09','221, Xã Minh Tân, Huyện Dầu Tiếng, Tỉnh Bình Dương',NULL,30000,0,'unpaid','not_shipped',0,NULL,'fghjk','0987654321',550000,'Người dùng yêu cầu hủy.',NULL,NULL),(29,9,1500000,'COMPLETED','COD','2025-06-10 05:15:09','2025-06-11 08:25:24','22, Phường Hòa Thuận Tây, Quận Hải Châu, Thành phố Đà Nẵng',NULL,30000,0,'unpaid','not_shipped',0,NULL,'222','0987654321',1500000,NULL,30000.00,5),(30,9,2300000,'CANCELLED_BY_USER','COD','2025-06-10 05:28:18','2025-06-10 12:46:59','22, Xã Long Giang, Huyện Chợ Mới, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'fff','0987654321',2300000,'Người dùng yêu cầu hủy.',30000.00,5),(31,9,450000,'CANCELLED_BY_USER','COD','2025-06-10 05:39:55','2025-06-10 12:46:22','22, Xã Phú Long, Huyện Phú Tân, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'kkkk','0987654321',450000,'Người dùng yêu cầu hủy.',30000.00,5),(32,9,5000000,'CANCELLED_BY_USER','COD','2025-06-10 05:40:47','2025-06-10 12:40:56','22, Xã Long Tân, Huyện Long Đất, Tỉnh Bà Rịa - Vũng Tàu',NULL,30000,0,'unpaid','not_shipped',0,NULL,'vvv','0987654321',5000000,'Người dùng yêu cầu hủy.',30000.00,5),(33,9,2200000,'CANCELLED_BY_ADMIN','COD','2025-06-10 05:47:35','2025-06-11 08:25:45','22, Xã Long Giang, Huyện Chợ Mới, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,'het hang','hhgh','0987654321',2200000,NULL,30000.00,5),(34,9,2650000,'CANCELLED_BY_ADMIN','COD','2025-06-10 09:39:56','2025-06-11 08:53:55','22, Phường Tân Thiện, Thành phố Đồng Xoài, Tỉnh Bình Phước',NULL,30000,0,'unpaid','not_shipped',0,'Sản phẩm bạn đặt đã hết hàng đột xuất. Mong bạn thông cảm.','555','0987654321',2650000,NULL,30000.00,5),(35,9,7200000,'COMPLETED','COD','2025-06-11 02:25:54','2025-07-17 09:00:47','22, Xã Phước Hoà, Huyện Phú Giáo, Tỉnh Bình Dương',NULL,30000,0,'unpaid','not_shipped',0,NULL,'hh35','0987654321',7200000,NULL,30000.00,5),(36,13,450000,'CONFIRMED','COD','2025-06-11 06:46:21','2025-06-11 16:31:08','22A, Xã Long Tân, Huyện Long Đất, Tỉnh Bà Rịa - Vũng Tàu',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hu','0987654321',450000,NULL,30000.00,5),(37,9,930000,'CANCELLED_BY_USER','COD','2025-06-12 14:00:17','2025-06-12 21:00:25','22, Xã Hòa Ninh, Huyện Hòa Vang, Thành phố Đà Nẵng',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Jifff','0987654322',900000,'Người dùng yêu cầu hủy.',NULL,NULL),(38,9,2230000,'CANCELLED_BY_ADMIN','COD','2025-06-12 14:43:53','2025-06-12 21:46:43','22, Xã Lộc Thuận, Huyện Lộc Ninh, Tỉnh Bình Phước',NULL,30000,0,'unpaid','not_shipped',0,'het hang','Jifff','0987654322',2200000,NULL,NULL,NULL),(39,12,500000,'PENDING','COD','2025-06-13 02:39:02','2025-06-13 09:39:02','123, Xã Kiến Thành, Huyện Chợ Mới, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Bui','0987654321',500000,NULL,30000.00,5),(40,9,13000000,'PENDING','COD','2025-06-16 13:55:45','2025-06-16 20:55:45','22, Xã Kiến Thành, Huyện Chợ Mới, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Jifff','0987654322',13000000,NULL,30000.00,6),(41,9,30000,'CANCELLED_BY_USER','COD','2025-06-19 22:16:47','2025-06-20 05:17:02','222, Phường Hòa Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Jifff','0987654322',1234,'Người dùng yêu cầu hủy.',1234.00,5),(42,9,531234,'PENDING','COD','2025-06-20 02:24:21','2025-06-20 09:24:21','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',501234,NULL,NULL,NULL),(43,9,2730000,'PENDING','VIETQR','2025-06-20 02:25:35','2025-06-20 09:25:35','222, Xã Hòa Hưng, Huyện Xuyên Mộc, Tỉnh Bà Rịa - Vũng Tàu',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',2700000,NULL,NULL,NULL),(44,9,31234,'PENDING','VIETQR','2025-06-20 02:27:57','2025-06-20 09:27:57','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(45,9,31234,'PENDING','VIETQR','2025-06-20 02:28:25','2025-06-20 09:28:25','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(46,9,30000,'PENDING','VIETQR','2025-06-20 02:34:29','2025-06-20 09:34:29','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,1234.00,5),(47,9,31234,'PENDING','VIETQR','2025-06-20 02:36:31','2025-06-20 09:36:31','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(48,9,31234,'PENDING','VIETQR','2025-06-20 02:49:49','2025-06-20 09:49:49','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(49,9,31234,'COMPLETED','VIETQR','2025-06-20 03:28:21','2025-06-20 10:32:03','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(50,9,30000,'PENDING','VIETQR','2025-06-20 03:34:32','2025-06-20 10:34:32','22, Phường Phước Hưng, Thành phố Bà Rịa, Tỉnh Bà Rịa - Vũng Tàu',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,1234.00,5),(51,9,30000,'PENDING','VIETQR','2025-06-20 03:48:19','2025-06-20 10:48:19','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',2468,NULL,2468.00,5),(52,9,31234,'PENDING','VIETQR','2025-06-20 03:50:12','2025-06-20 10:50:12','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(53,9,31234,'PENDING','COD','2025-06-20 04:03:06','2025-06-20 11:03:06','22, Xã Long Hà, Huyện Phú Riềng, Tỉnh Bình Phước',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(54,9,31234,'PENDING','COD','2025-06-20 04:08:59','2025-06-20 11:08:59','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(55,9,31234,'PENDING','COD','2025-06-20 04:09:34','2025-06-20 11:09:34','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(56,9,31234,'PENDING','COD','2025-06-20 04:19:53','2025-06-20 11:19:53','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(57,9,30000,'PENDING','COD','2025-06-20 04:27:10','2025-06-20 11:27:10','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,1234.00,5),(58,9,31234,'PENDING','COD','2025-06-20 04:32:19','2025-06-20 11:32:19','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(59,9,31234,'PROCESSING','VIETQR','2025-06-20 04:33:02','2025-06-20 11:38:48','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',1234,NULL,NULL,NULL),(60,9,16750000,'PENDING','VIETQR','2025-06-20 07:48:54','2025-06-20 14:48:54','22, Xã Long Giang, Huyện Chợ Mới, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'hehee','0987654322',16750000,NULL,30000.00,5),(61,9,500000,'COMPLETED','COD','2025-06-20 08:07:54','2025-06-26 13:35:31','22, Xã Hòa Hội, Huyện Xuyên Mộc, Tỉnh Bà Rịa - Vũng Tàu',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654322',500000,NULL,30000.00,5),(62,9,31234,'CANCELLED_BY_ADMIN','COD','2025-06-20 08:14:13','2025-06-25 10:37:48','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,'het hang','user','0987654322',1234,NULL,NULL,NULL),(63,9,30000,'CANCELLED_BY_USER','VIETQR','2025-06-22 09:09:25','2025-06-25 03:29:39','22, Xã Long Giang, Huyện Chợ Mới, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peter','0987654322',1234,'Người dùng yêu cầu hủy.',1234.00,5),(64,9,12653456,'PENDING','VIETQR','2025-06-25 14:10:58','2025-06-25 21:10:58','22, Xã Hòa Hưng, Huyện Xuyên Mộc, Tỉnh Bà Rịa - Vũng Tàu',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',12623456,NULL,NULL,NULL),(65,9,3241111,'PENDING','COD','2025-06-26 12:48:31','2025-06-26 19:48:31','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',3311111,NULL,100000.00,3),(66,9,2841111,'PENDING','COD','2025-06-27 12:34:36','2025-06-27 19:34:36','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',2811111,NULL,NULL,NULL),(67,9,2330000,'PENDING','VIETQR','2025-06-27 12:41:58','2025-06-27 19:41:58','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',2300000,NULL,NULL,NULL),(68,9,1530000,'PENDING','COD','2025-06-27 13:03:02','2025-06-27 20:03:02','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',1500000,NULL,NULL,NULL),(69,9,31234,'PENDING','COD','2025-06-27 13:11:42','2025-06-27 20:11:42','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',1234,NULL,NULL,NULL),(70,9,30000,'PENDING','COD','2025-06-27 13:18:13','2025-06-27 20:18:13','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',1234,NULL,1234.00,6),(71,9,2330000,'COMPLETED','COD','2025-06-27 13:21:36','2025-07-01 08:10:09','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',2300000,NULL,NULL,NULL),(72,9,2330000,'PROCESSING','COD','2025-06-27 13:22:34','2025-06-29 19:05:28','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',2300000,NULL,NULL,NULL),(73,9,1230000,'CONFIRMED','COD','2025-06-27 13:29:58','2025-06-30 21:48:16','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',1200000,NULL,NULL,NULL),(74,9,30000,'CANCELLED_BY_USER','COD','2025-06-27 13:39:23','2025-06-29 16:30:04','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',1234,'Người dùng yêu cầu hủy.',1234.00,6),(75,9,1430000,'COMPLETED','COD','2025-06-27 13:42:47','2025-06-29 20:29:02','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',1500000,NULL,100000.00,3),(76,9,480000,'DELIVERED','COD','2025-06-27 13:50:10','2025-06-29 16:29:17','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',500000,NULL,50000.00,4),(77,9,480000,'PROCESSING','COD','2025-06-27 13:55:21','2025-06-29 11:38:44','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',500000,NULL,50000.00,4),(78,9,30000,'CONFIRMED','COD','2025-06-27 14:03:16','2025-06-29 11:29:35','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',1234,NULL,1234.00,5),(79,9,7430000,'CANCELLED_BY_USER','COD','2025-06-27 14:15:17','2025-06-29 10:43:30','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',7500000,'Người dùng yêu cầu hủy.',100000.00,3),(80,9,430000,'PROCESSING','COD','2025-06-27 14:26:53','2025-06-29 11:10:59','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',500000,NULL,100000.00,3),(81,9,2300000,'CANCELLED_BY_USER','COD','2025-06-27 14:42:16','2025-06-29 10:19:52','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',2300000,'Người dùng yêu cầu hủy.',30000.00,6),(82,9,500000,'CANCELLED_BY_ADMIN','COD','2025-06-27 14:56:17','2025-06-29 10:13:57','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,'huy','peterr','0987654322',500000,NULL,30000.00,5),(83,9,30000,'DELIVERED','COD','2025-06-27 15:56:25','2025-06-27 23:23:05','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peterr','0987654322',1234,NULL,1234.00,6),(84,9,7430000,'CANCELLED_BY_USER','COD','2025-06-27 22:08:14','2025-06-29 09:59:52','22, Xã Long Tân, Huyện Long Đất, Tỉnh Bà Rịa - Vũng Tàu',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peter','0987654322',7500000,'Người dùng yêu cầu hủy.',100000.00,3),(85,9,30000,'CANCELLED_BY_USER','COD','2025-06-27 22:39:03','2025-06-29 09:35:55','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peter','0987654322',22222,'Người dùng yêu cầu hủy.',22222.00,6),(86,9,1130000,'COMPLETED','COD','2025-06-27 22:41:28','2025-06-29 10:13:31','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peter','0987654322',1200000,NULL,100000.00,3),(87,9,2330000,'CANCELLED_BY_ADMIN','COD','2025-06-27 22:45:14','2025-06-28 05:46:44','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,'goi khong nghe may','peter','0987654322',2400000,NULL,100000.00,3),(88,9,530000,'CANCELLED_BY_USER','COD','2025-06-29 03:29:27','2025-06-29 10:29:34','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peter','0987654322',500000,'Người dùng yêu cầu hủy.',NULL,NULL),(89,9,2331234,'CANCELLED_BY_USER','COD','2025-06-29 12:10:48','2025-06-29 19:10:57','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peter','0987654322',2301234,'Người dùng yêu cầu hủy.',NULL,NULL),(90,9,280000,'COMPLETED','VIETQR','2025-06-29 13:45:30','2025-06-29 21:54:36','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peter','0987654322',300000,NULL,50000.00,4),(91,9,11930000,'CONFIRMED','COD','2025-06-29 15:22:18','2025-06-30 17:52:07','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peter','0987654322',11900000,NULL,NULL,NULL),(92,9,390000,'SHIPPED','COD','2025-06-30 09:13:15','2025-06-30 22:20:54','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'peter','0987654322',450000,NULL,90000.00,3),(93,11,880000,'COMPLETED','VIETQR','2025-06-30 14:50:03','2025-06-30 22:22:55','112, Xã Vĩnh An, Huyện Châu Thành, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654321',950000,NULL,100000.00,3),(94,11,429000,'CANCELLED_BY_USER','COD','2025-06-30 15:18:13','2025-06-30 22:18:23','112, Bến Nghé, Quận 1, TP. Hồ Chí Minh',NULL,30000,0,'unpaid','not_shipped',0,NULL,'user','0987654321',399000,'Người dùng yêu cầu hủy.',NULL,NULL),(95,9,1428000,'COMPLETED','COD','2025-06-30 15:29:23','2025-06-30 22:34:18','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',1398000,NULL,NULL,NULL),(96,9,1028000,'CANCELLED_BY_ADMIN','VIETQR','2025-07-03 07:50:17','2025-07-03 15:47:25','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,'het hang','Hung','0987654322',1098000,NULL,100000.00,3),(97,9,2200000,'CANCELLED_BY_USER','COD','2025-07-08 19:03:47','2025-07-09 02:03:56','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',2200000,'Người dùng yêu cầu hủy.',30000.00,5),(98,17,429000,'COMPLETED','COD','2025-07-08 19:29:16','2025-07-09 02:30:15','222, Xã Phước Sang, Huyện Phú Giáo, Tỉnh Bình Dương',NULL,30000,0,'unpaid','not_shipped',0,NULL,'uhh@gmail.com','0987867543',399000,NULL,NULL,NULL),(99,9,5128000,'COMPLETED','COD','2025-07-13 19:13:09','2025-07-14 04:16:11','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',5198000,NULL,100000.00,3),(100,9,450000,'PROCESSING','COD','2025-07-13 19:18:49','2025-07-16 15:19:22','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',450000,NULL,30000.00,5),(101,9,500000,'CONFIRMED','COD','2025-07-13 19:33:54','2025-07-15 15:33:52','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',500000,NULL,30000.00,5),(102,9,330000,'COMPLETED','VIETQR','2025-07-13 19:37:49','2025-07-14 03:27:50','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',300000,NULL,NULL,NULL),(103,9,2430000,'COMPLETED','COD','2025-07-13 20:42:48','2025-07-14 03:50:12','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',2500000,NULL,100000.00,3),(104,9,2030000,'CANCELLED_BY_ADMIN','COD','2025-07-15 08:26:31','2025-07-15 15:27:49','22, Xã Bình Mỹ, Huyện Bắc Tân Uyên, Tỉnh Bình Dương',NULL,30000,0,'unpaid','not_shipped',0,'het hang','Hung','0987654322',2000000,NULL,NULL,NULL),(105,9,4430000,'COMPLETED','COD','2025-07-15 08:28:39','2025-07-15 15:31:56','22, Xã Hàm Đức, Huyện Hàm Thuận Bắc, Tỉnh Bình Thuận',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',4500000,NULL,100000.00,3),(106,9,6028000,'PROCESSING','COD','2025-07-15 08:35:33','2025-07-15 15:36:04','22, Xã Hòa Bình Thạnh, Huyện Châu Thành, Tỉnh An Giang',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',6048000,NULL,50000.00,4),(107,9,450000,'COMPLETED','VIETQR','2025-07-15 08:38:58','2025-07-15 15:39:53','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',450000,NULL,30000.00,5),(108,9,880000,'CANCELLED_BY_USER','COD','2025-07-16 08:07:27','2025-07-16 15:18:22','22, Phường Hòa Phát, Quận Cẩm Lệ, Thành phố Đà Nẵng',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',950000,'Người dùng yêu cầu hủy.',100000.00,3),(109,9,480000,'COMPLETED','COD','2025-07-16 08:16:48','2025-07-16 15:22:08','22, Xã Phước Sơn, Huyện Bù Đăng, Tỉnh Bình Phước',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',450000,NULL,NULL,NULL),(110,9,2080000,'COMPLETED','COD','2025-07-16 08:33:25','2025-07-17 08:59:52','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',2150000,NULL,100000.00,3),(111,9,2228000,'PENDING','COD','2025-07-17 02:04:04','2025-07-17 09:04:04','22, Thị trấn Đất Đỏ, Huyện Long Đất, Tỉnh Bà Rịa - Vũng Tàu',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',2298000,NULL,100000.00,3),(112,9,480000,'PENDING','COD','2025-07-17 02:18:15','2025-07-17 09:18:15','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',450000,NULL,NULL,NULL),(113,9,1428000,'PENDING','COD','2025-07-17 02:20:41','2025-07-17 09:20:41','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',1398000,NULL,NULL,NULL),(114,9,980000,'PENDING','COD','2025-07-17 02:46:45','2025-07-17 09:46:45','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',950000,NULL,NULL,NULL),(115,9,1229000,'CANCELLED_BY_USER','COD','2025-07-17 02:56:44','2025-07-17 10:14:49','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',1199000,'Người dùng yêu cầu hủy.',NULL,NULL),(116,9,729000,'CANCELLED_BY_USER','COD','2025-07-17 03:02:25','2025-07-17 10:12:02','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',699000,'Người dùng yêu cầu hủy.',NULL,NULL),(117,9,530000,'CANCELLED_BY_USER','COD','2025-07-17 03:03:34','2025-07-17 10:03:47','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',500000,'Người dùng yêu cầu hủy.',NULL,NULL),(118,9,1229000,'CANCELLED_BY_USER','COD','2025-07-17 03:15:04','2025-07-17 10:15:14','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',1199000,'Người dùng yêu cầu hủy.',NULL,NULL),(119,9,530000,'CANCELLED_BY_USER','COD','2025-07-17 03:19:53','2025-07-17 10:20:01','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',500000,'Người dùng yêu cầu hủy.',NULL,NULL),(120,9,2000000,'PENDING','COD','2025-07-17 03:31:02','2025-07-17 10:31:02','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',2000000,NULL,30000.00,5),(121,9,280000,'PROCESSING','COD','2025-07-17 03:32:10','2025-07-17 10:32:33','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',250000,NULL,NULL,NULL),(122,12,729000,'CONFIRMED','COD','2025-07-17 04:27:23','2025-07-18 01:40:00','123, Xã Phình Hồ, Huyện Trạm Tấu, Tỉnh Yên Bái',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Bui','0987654321',699000,NULL,NULL,NULL),(123,9,828000,'PENDING','VIETQR','2025-07-17 08:01:13','2025-07-17 15:01:13','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',798000,NULL,NULL,NULL),(124,9,330000,'PENDING','COD','2025-07-17 08:13:01','2025-07-17 15:13:01','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',300000,NULL,NULL,NULL),(125,9,480000,'PENDING','COD','2025-07-17 08:17:33','2025-07-17 15:17:33','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',450000,NULL,NULL,NULL),(126,9,205000,'PENDING','VIETQR','2025-07-17 08:19:16','2025-07-17 15:19:16','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',175000,NULL,NULL,NULL),(127,9,1930000,'PENDING','COD','2025-07-17 08:27:58','2025-07-17 15:27:58','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',1900000,NULL,NULL,NULL),(128,9,480000,'PENDING','COD','2025-07-17 08:29:34','2025-07-17 15:29:34','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',450000,NULL,NULL,NULL),(129,9,699000,'PROCESSING','COD','2025-07-17 09:55:46','2025-07-18 01:40:40','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',699000,NULL,30000.00,6),(130,9,350000,'PROCESSING','VIETQR','2025-07-17 09:56:05','2025-07-17 16:59:06','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',350000,NULL,30000.00,5),(131,9,830000,'DELIVERED','COD','2025-07-17 18:38:33','2025-07-18 01:44:19','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,NULL,'Hung','0987654322',900000,NULL,100000.00,3),(132,9,530000,'CANCELLED_BY_ADMIN','COD','2025-07-17 19:11:30','2025-07-18 02:11:57','22, Phúc Xá, Ba Đình, Hà Nội',NULL,30000,0,'unpaid','not_shipped',0,'het hang','Hung','0987654322',500000,NULL,NULL,NULL),(133,9,530000,'CANCELLED_BY_ADMIN','VIETQR','2025-07-17 19:58:48','2025-07-18 03:02:59','22, Xã Hồng Thái, Huyện A Lưới, Thành phố Huế',NULL,30000,0,'unpaid','not_shipped',0,'khong lien he dcc','Hung','0987654322',500000,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `payment_status` enum('pending','completed','failed') DEFAULT 'pending',
  `transaction_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'pending',NULL,900000.00,'2025-03-28 14:19:20'),(2,2,'completed','TXN12345',2200000.00,'2025-03-28 14:19:20');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `fk_pc_category` (`category_id`),
  CONSTRAINT `fk_pc_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pc_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_image_product` (`product_id`),
  CONSTRAINT `fk_image_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (25,17,'/images/products/1a159aaa-f887-49ec-a660-57bb2d2550b9.jpg',0),(26,17,'/images/products/2218f2aa-cca8-47fe-a9d9-596d7c6a2220.jpg',0),(27,17,'/images/products/ca5b5e2e-366c-402a-bbbb-f3e548358b74.jpg',0),(48,19,'/images/products/8edc57d2-5d67-45ec-b538-9ca19ff129e4.jpg',0),(49,19,'/images/products/42489f75-bf3c-4116-a102-4180101e5104.jpg',0),(50,19,'/images/products/1a11fffa-c1cc-4989-8543-6981c41c824b.jpg',0),(54,20,'/images/products/b270a124-3f97-47a9-ab17-2ca646ee96d6.jpg',0),(55,20,'/images/products/7f225834-4969-414b-a112-ef812a65686e.jpg',0),(56,20,'/images/products/ec850747-18db-4885-9279-dfa84b238e3d.jpg',0),(57,21,'/images/products/ff781810-108d-44be-a002-0b0728beeaf4.jpg',0),(58,21,'/images/products/78619b8c-c92c-40a2-9f71-aea0ce482166.jpg',0),(59,21,'/images/products/30495553-93cd-49bc-91ee-ff467fe24763.jpg',0),(60,1,'/images/products/22abe4db-9eb3-4382-8035-26317c202214.jpg',0),(61,1,'/images/products/72897af0-f3c4-4a40-a370-a8e1a82eb08f.jpg',0),(62,1,'/images/products/a656d223-9b17-4930-bd07-3a744e5808eb.jpg',0),(63,22,'/images/products/5fc6c4d9-13fc-4eeb-bd03-c472c1261e0d.jpg',0),(64,22,'/images/products/634529c2-dd10-4e93-a003-bceabed77b71.jpg',0),(65,22,'/images/products/16c77f50-ec74-41f6-8b64-70cee989e2a1.jpg',0),(66,23,'/images/products/64eed3c5-256c-424f-bb79-2258f2ff8bf5.jpg',0),(67,23,'/images/products/7f8974bb-7514-4295-b441-997b4fbfdab9.jpg',0),(68,23,'/images/products/f511834d-f33c-468a-b393-eef962694cab.jpg',0),(69,2,'/images/products/9f26b433-71d8-46e2-9379-cc466dd6e5e9.jpg',0),(70,2,'/images/products/ff5c9489-73f5-4266-a730-088d874edb3a.jpg',0),(71,2,'/images/products/5516b330-75b4-4b37-9aba-5d6a6cb8838b.jpg',0),(72,8,'/images/products/82268411-7fca-4389-8b71-7641e9e3b337.jpg',0),(73,8,'/images/products/bae72c8d-eeba-4b05-a723-81edd1600624.jpg',0),(74,8,'/images/products/a4753339-24e6-43ee-9109-42db30edcb93.jpg',0),(81,9,'/images/products/83269d4d-bddb-4067-9c4c-96607c397446.jpg',0),(82,9,'/images/products/9dbed627-6f30-41c8-b6fe-f125eca9eec0.jpg',0),(83,10,'/images/products/bd4b3326-e925-474a-9db8-48a293256522.jpg',0),(84,10,'/images/products/de5bb5fe-84a7-4fe9-a4a4-2b7c4ae2f5df.jpg',0),(85,10,'/images/products/e7ff67ad-eb91-4983-bb9b-84a9c47e6871.jpg',0),(86,24,'/images/products/6e24bb32-51ce-47db-bc63-afb6b9bff88a.jpg',0),(87,24,'/images/products/0e65e021-f044-4e92-8762-52bf2e11a1d9.jpg',0),(88,24,'/images/products/981230f3-dbcd-4bc7-a6af-c0557e40a32b.jpg',0),(89,25,'/images/products/8cfab3e6-3228-4d35-83a9-e022bdc210e9.jpg',0),(90,25,'/images/products/58f512f4-ac23-43e8-9f7c-0d717333e8e1.jpg',0),(91,25,'/images/products/2b16589f-5c59-49c8-9b17-1bd78805af91.jpg',0),(92,26,'/images/products/634a7ffd-46bc-4327-aeb2-70009b6efa01.jpg',0),(93,26,'/images/products/3ace082c-6e2b-4beb-b11d-91f2b52a2646.jpg',0),(94,26,'/images/products/7fbe0f28-a81e-42f2-ab2f-9e29e1ddff31.jpg',0),(95,27,'/images/products/3e98c767-cb2c-48fc-a7d9-573dd2e9f3d9.jpg',0),(96,27,'/images/products/ac2ad3f7-d57e-43f9-b732-ea0bfa535054.jpg',0),(97,27,'/images/products/40c2777d-b9e1-4f36-864b-2dab1a2d74d7.jpg',0),(98,28,'/images/products/9b72f31c-d2f0-42ce-aef4-e94d05bd7b96.jpg',0),(99,28,'/images/products/7ad5915e-37a7-4a2b-9e7e-585167bd5b39.jpg',0),(100,29,'/images/products/c2ec034b-ea68-40b5-9f17-6b448c37e253.jpg',0),(101,29,'/images/products/3e6e367d-e71a-483d-bdd3-6b1b26576a67.jpg',0),(102,29,'/images/products/0fee0ae7-27ed-4ed6-a9f3-6c92caf0d3ed.jpg',0),(103,30,'/images/products/fa80ce42-3ae7-43c2-b1fd-ae4bea45e6bf.jpg',0),(104,30,'/images/products/2650d5f7-07e7-459b-a652-9afdd7f67799.jpg',0),(105,30,'/images/products/9d1f5353-ed9e-4eba-bbae-c54d76e9a069.jpg',0);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `rating` int NOT NULL COMMENT 'Điểm đánh giá từ 1 đến 5',
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_product_order` (`user_id`,`product_id`,`order_id`),
  KEY `fk_review_product` (`product_id`),
  KEY `fk_review_order` (`order_id`),
  CONSTRAINT `fk_review_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
INSERT INTO `product_reviews` VALUES (9,1,61,5,'Áo rất đẹp, chất liệu vải mát, sẽ ủng hộ shop lần sau!','2025-06-26 13:40:13','2025-06-26 13:40:13',1),(9,17,83,5,'Ok dayyy','2025-06-28 00:29:41','2025-06-28 00:29:41',2),(9,17,90,5,'dep','2025-06-29 21:54:45','2025-06-29 21:54:45',4),(11,1,19,5,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 01:57:43','2025-07-09 01:57:43',5),(12,1,39,5,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 01:57:43','2025-07-09 01:57:43',6),(9,2,20,4,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 01:57:43','2025-07-09 01:57:43',7),(9,8,20,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 01:57:43','2025-07-09 01:57:43',8),(9,9,20,4,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 01:57:44','2025-07-09 01:57:44',9),(9,10,60,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 01:57:44','2025-07-09 01:57:44',10),(9,17,41,4,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 01:57:44','2025-07-09 01:57:44',11),(9,19,64,4,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 01:57:44','2025-07-09 01:57:44',12),(9,22,92,4,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 01:57:44','2025-07-09 01:57:44',13),(9,23,95,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 01:57:44','2025-07-09 01:57:44',14),(11,23,94,4,'Tư vấn nhiệt tình, sẽ giới thiệu cho bạn bè.','2025-07-09 01:57:44','2025-07-09 01:57:44',15),(13,1,36,6,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 01:59:25','2025-07-09 01:59:25',16),(16,1,NULL,5,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:42','2025-07-09 02:21:42',17),(6,1,NULL,5,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:42','2025-07-09 02:21:42',18),(3,1,NULL,4,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',19),(14,1,NULL,4,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',20),(15,1,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',21),(2,1,NULL,4,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',22),(1,1,NULL,4,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',23),(6,2,NULL,4,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',24),(15,2,NULL,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',25),(2,2,NULL,5,'Tư vấn nhiệt tình, sẽ giới thiệu cho bạn bè.','2025-07-09 02:21:43','2025-07-09 02:21:43',26),(1,2,NULL,5,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',27),(13,2,NULL,4,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',28),(14,2,NULL,4,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',29),(16,2,NULL,5,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',30),(12,2,NULL,5,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',31),(14,8,NULL,5,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',32),(12,8,NULL,5,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',33),(11,8,NULL,4,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',34),(1,8,NULL,4,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',35),(3,8,NULL,5,'Tư vấn nhiệt tình, sẽ giới thiệu cho bạn bè.','2025-07-09 02:21:43','2025-07-09 02:21:43',36),(6,8,NULL,4,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',37),(15,8,NULL,5,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',38),(1,9,NULL,4,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',39),(2,9,NULL,5,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',40),(13,9,NULL,5,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',41),(15,9,NULL,5,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',42),(3,9,NULL,4,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',43),(14,9,NULL,5,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',44),(6,9,NULL,4,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',45),(13,10,NULL,4,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',46),(6,10,NULL,4,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',47),(14,10,NULL,4,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',48),(2,10,NULL,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',49),(3,10,NULL,5,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',50),(12,10,NULL,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',51),(1,10,NULL,5,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',52),(16,10,NULL,5,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',53),(11,10,NULL,4,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',54),(15,10,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',55),(12,17,NULL,4,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',56),(14,17,NULL,5,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',57),(13,17,NULL,5,'Tư vấn nhiệt tình, sẽ giới thiệu cho bạn bè.','2025-07-09 02:21:43','2025-07-09 02:21:43',58),(2,17,NULL,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',59),(3,17,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',60),(16,17,NULL,5,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',61),(6,17,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',62),(11,17,NULL,5,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',63),(3,19,NULL,5,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',64),(1,19,NULL,5,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',65),(12,19,NULL,4,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',66),(14,19,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',67),(15,19,NULL,4,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',68),(6,19,NULL,5,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',69),(13,19,NULL,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',70),(11,19,NULL,4,'Tư vấn nhiệt tình, sẽ giới thiệu cho bạn bè.','2025-07-09 02:21:43','2025-07-09 02:21:43',71),(16,20,NULL,4,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',72),(11,20,NULL,5,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',73),(12,20,NULL,4,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',74),(13,20,NULL,5,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',75),(2,20,NULL,5,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',76),(6,20,NULL,4,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',77),(15,20,NULL,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',78),(1,20,NULL,4,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',79),(14,20,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',80),(16,21,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',81),(3,21,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',82),(14,21,NULL,4,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',83),(12,21,NULL,5,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',84),(6,21,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',85),(9,21,NULL,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',86),(2,21,NULL,4,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',87),(15,21,NULL,4,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',88),(13,21,NULL,4,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',89),(11,21,NULL,4,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',90),(1,21,NULL,5,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',91),(2,22,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',92),(1,22,NULL,4,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',93),(13,22,NULL,5,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',94),(16,22,NULL,4,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',95),(12,22,NULL,5,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',96),(15,22,NULL,4,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',97),(11,22,NULL,5,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',98),(14,22,NULL,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',99),(6,23,NULL,5,'Form áo đẹp, mặc lên vừa vặn. Mình rất thích.','2025-07-09 02:21:43','2025-07-09 02:21:43',100),(3,23,NULL,4,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',101),(15,23,NULL,5,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:43','2025-07-09 02:21:43',102),(14,23,NULL,4,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:43','2025-07-09 02:21:43',103),(13,23,NULL,5,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:43','2025-07-09 02:21:43',104),(12,23,NULL,4,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:43','2025-07-09 02:21:43',105),(16,23,NULL,5,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:43','2025-07-09 02:21:43',106),(11,2,NULL,4,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:45','2025-07-09 02:21:45',107),(13,8,NULL,4,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:45','2025-07-09 02:21:45',108),(2,8,NULL,4,'Tư vấn nhiệt tình, sẽ giới thiệu cho bạn bè.','2025-07-09 02:21:45','2025-07-09 02:21:45',109),(16,8,NULL,4,'Sản phẩm tuyệt vời, chất lượng rất tốt!','2025-07-09 02:21:45','2025-07-09 02:21:45',110),(12,9,NULL,4,'Tư vấn nhiệt tình, sẽ giới thiệu cho bạn bè.','2025-07-09 02:21:45','2025-07-09 02:21:45',111),(11,9,NULL,4,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:46','2025-07-09 02:21:46',112),(16,9,NULL,4,'Tư vấn nhiệt tình, sẽ giới thiệu cho bạn bè.','2025-07-09 02:21:46','2025-07-09 02:21:46',113),(15,17,NULL,5,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:46','2025-07-09 02:21:46',114),(1,17,NULL,4,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:46','2025-07-09 02:21:46',115),(16,19,NULL,5,'Tư vấn nhiệt tình, sẽ giới thiệu cho bạn bè.','2025-07-09 02:21:46','2025-07-09 02:21:46',116),(2,19,NULL,5,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:46','2025-07-09 02:21:46',117),(9,20,NULL,5,'Giao hàng nhanh, đóng gói cẩn thận. Sẽ ủng hộ shop lần sau.','2025-07-09 02:21:46','2025-07-09 02:21:46',118),(6,22,NULL,4,'Đường may chắc chắn, không có chỉ thừa. Hoàn thiện tốt.','2025-07-09 02:21:46','2025-07-09 02:21:46',119),(3,22,NULL,5,'Chất vải mát, mặc rất thoải mái. Rất đáng tiền.','2025-07-09 02:21:46','2025-07-09 02:21:46',120),(2,23,NULL,4,'Màu sắc giống hình, không bị phai màu sau khi giặt.','2025-07-09 02:21:46','2025-07-09 02:21:46',121),(17,23,98,5,'San pham tuyet voi','2025-07-09 02:30:48','2025-07-09 02:30:48',122),(9,17,102,5,'','2025-07-14 03:28:21','2025-07-14 03:28:21',123),(9,22,107,5,'','2025-07-15 15:40:08','2025-07-15 15:40:08',124),(9,17,105,5,'','2025-07-15 15:40:16','2025-07-15 15:40:16',125),(9,8,105,5,'','2025-07-15 15:40:18','2025-07-15 15:40:18',126),(9,2,105,5,'','2025-07-15 15:40:19','2025-07-15 15:40:19',127),(9,27,109,5,'','2025-07-16 15:21:35','2025-07-16 15:21:35',128),(9,26,110,5,'ok','2025-07-17 08:54:20','2025-07-17 08:54:20',129),(9,24,110,5,'ok','2025-07-17 08:54:31','2025-07-17 08:54:31',130),(9,26,131,5,'','2025-07-18 01:44:30','2025-07-18 01:44:30',131);
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL COMMENT 'Khóa ngoại, liên kết đến bảng products(id)',
  `size` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Kích thước của sản phẩm (ví dụ: S, M, L, 38, 39)',
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Màu sắc của sản phẩm (ví dụ: Đen, Trắng)',
  `stock` int NOT NULL DEFAULT '0' COMMENT 'Số lượng tồn kho cho phiên bản này',
  `price` double DEFAULT NULL COMMENT 'Giá riêng cho phiên bản này (nếu có, nếu không sẽ lấy giá từ sản phẩm chính)',
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL hình ảnh riêng cho phiên bản này (nếu có)',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_variant_product` (`product_id`),
  CONSTRAINT `fk_variant_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
INSERT INTO `product_variants` VALUES (7,2,'39','Đen',99,NULL,'adidas_ultraboost_black_39.jpg','2025-06-01 10:05:00'),(8,2,'40','Đen',14,250000,'adidas_ultraboost_black_40.jpg','2025-06-01 10:05:00'),(9,2,'41','Đen',12,NULL,'adidas_ultraboost_black_41.jpg','2025-06-01 10:05:00'),(10,2,'40','Trắng',20,NULL,'adidas_ultraboost_white_40.jpg','2025-06-01 10:05:00'),(11,2,'41','Trắng',18,NULL,'adidas_ultraboost_white_41.jpg','2025-06-01 10:05:00'),(15,9,'S','T',11,NULL,NULL,'2025-06-01 10:15:00'),(16,9,'M','B',11,NULL,NULL,'2025-06-01 10:15:00'),(40,10,'L','',100,NULL,NULL,'2025-06-13 10:12:16'),(41,8,'41','',111,NULL,NULL,'2025-06-13 10:17:20'),(42,1,'39','Xanh',110,NULL,NULL,'2025-06-13 10:17:59'),(44,17,'M','Đen',10,NULL,NULL,'2025-06-17 00:19:45'),(47,19,'S','Đen',100,NULL,NULL,'2025-06-25 03:25:05'),(48,19,'M','Trắng',100,NULL,NULL,'2025-06-25 17:30:41'),(50,20,'M','Be',100,NULL,NULL,'2025-06-29 20:34:46'),(51,20,'L','Xanh',100,NULL,NULL,'2025-06-29 20:34:46'),(52,20,'XL','Lam',100,NULL,NULL,'2025-06-29 20:34:46'),(53,19,'L','Vàng',100,NULL,NULL,'2025-06-29 20:42:42'),(54,17,'L','Trắng',11,NULL,NULL,'2025-06-29 20:44:16'),(55,21,'36','',100,NULL,NULL,'2025-06-29 20:50:48'),(56,21,'37','',100,NULL,NULL,'2025-06-29 20:50:48'),(57,21,'38','',100,NULL,NULL,'2025-06-29 20:50:48'),(58,21,'39','',12,NULL,NULL,'2025-06-29 20:50:48'),(59,21,'40','',21,NULL,NULL,'2025-06-29 20:50:48'),(60,1,'38','Vàng',10,NULL,NULL,'2025-06-29 20:55:28'),(61,22,'38','Đen',11,NULL,NULL,'2025-06-29 21:18:52'),(62,22,'39','Trắng',11,NULL,NULL,'2025-06-29 21:18:52'),(63,23,'39','',10,NULL,NULL,'2025-06-29 21:22:40'),(64,23,'40','',10,NULL,NULL,'2025-06-29 21:22:40'),(65,23,'38','',11,NULL,NULL,'2025-06-29 21:22:40'),(66,8,'40','',111,NULL,NULL,'2025-06-30 17:35:29'),(67,8,'39','',111,NULL,NULL,'2025-06-30 17:35:29'),(68,8,'42','',111,NULL,NULL,'2025-06-30 17:35:29'),(69,10,'S','',11,NULL,NULL,'2025-06-30 17:45:28'),(70,10,'M','',1,NULL,NULL,'2025-06-30 17:45:28'),(72,24,'S','',111,NULL,NULL,'2025-07-16 14:44:33'),(73,24,'M','',111,NULL,NULL,'2025-07-16 14:44:33'),(74,24,'L','',110,NULL,NULL,'2025-07-16 14:44:33'),(75,25,'L','',22,NULL,NULL,'2025-07-16 14:48:02'),(76,25,'M','',22,NULL,NULL,'2025-07-16 14:48:02'),(77,25,'S','',1,NULL,NULL,'2025-07-16 14:48:02'),(78,26,'S','',11,NULL,NULL,'2025-07-16 14:52:00'),(79,26,'M','Đỏ',11,NULL,NULL,'2025-07-16 14:52:00'),(80,26,'L','Trắng',9,NULL,NULL,'2025-07-16 14:52:00'),(81,26,'XL','Đen',10,NULL,NULL,'2025-07-16 14:52:00'),(82,27,'S','',11,NULL,NULL,'2025-07-16 14:54:32'),(83,27,'M','',11,NULL,NULL,'2025-07-16 14:54:32'),(84,27,'L','',11,NULL,NULL,'2025-07-16 14:54:32'),(85,27,'XL','',11,NULL,NULL,'2025-07-16 14:54:32'),(86,27,'XXL','',11,NULL,NULL,'2025-07-16 14:54:32'),(87,28,'S','',11,NULL,NULL,'2025-07-16 14:57:14'),(88,28,'M','',10,NULL,NULL,'2025-07-16 14:57:14'),(89,28,'L','',11,NULL,NULL,'2025-07-16 14:57:14'),(90,29,'S','den',7,NULL,NULL,'2025-07-16 14:59:59'),(91,29,'M','',11,NULL,NULL,'2025-07-16 14:59:59'),(92,29,'L','',8,NULL,NULL,'2025-07-16 14:59:59'),(93,30,'39','',0,NULL,NULL,'2025-07-16 15:06:18'),(94,30,'40','',0,NULL,NULL,'2025-07-16 15:06:18'),(95,22,'38','Trắng',10,NULL,NULL,'2025-07-17 15:15:54'),(96,22,'39','Đen',11,NULL,NULL,'2025-07-17 15:17:19');
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `price` double DEFAULT NULL,
  `stock` int DEFAULT '0',
  `category_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name_id` varchar(255) DEFAULT NULL,
  `is_favorite` tinyint(1) DEFAULT '0',
  `is_popular` tinyint(1) DEFAULT '0',
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Dép Quai Ngang Unisex Crocs Classic V2','DÉP QUAI NGANG UNISEX CROCS CLASSIC CRUSH\nNâng tầm phong cách thời trang với Crocs Classic Crush. Sở hữu phần đế cao đặc trưng và thiết kế táo bạo của dòng Crush, dép Crocs với quai kép có các lỗ nhỏ để bạn thỏa sức trang trí với phụ kiện Jibbitz™, thể hiện cá tính riêng. Những sản phẩm của Crocs luôn mang lại cảm giác thoải mái mà bạn yêu thích và cập nhật xu hướng giúp bạn luôn tự tin dù ở bất cứ đâu.',950000,120,7,3,'nike_tshirt.jpg','2025-03-28 14:19:00','Nike',0,0,'2025-07-17 15:27:58.269292'),(2,'Giày Sneaker Nam Adidas Grand Court Cloudfoam Comfort','GIÀY SNEAKER NAM ADIDAS GRAND COURT CLOUDFOAM COMFORT\nNếu bạn chỉ được phép có một đôi giày sneaker thì có lẽ đó chính là đôi giày này. Đôi giày adidas Grand Court này có 3 Sọc kinh điển giúp phong cách sneaker của bạn luôn gọn gàng và chỉn chu. Lớp đệm Cloudfoam Comfort mang lại cảm giác mềm mại và êm ái bên trong.',2000000,163,6,2,'adidas_ultraboost.jpg','2025-03-28 14:19:00','Adidas',0,1,'2025-07-17 10:32:10.393564'),(8,'Giày Thể Thao Nam Adidas Ultraboost 1.0','GIÀY THỂ THAO NAM ADIDAS ULTRABOOST 1.0\nKhi đi dạo trong công viên cũng như chạy bộ cuối tuần cùng bạn bè, đôi giày adidas Ultraboost 1.0 này sẽ giúp bạn luôn thoải mái. Thân giày adidas PRIMEKNIT ôm chân nhẹ nhàng, đồng thời đệm BOOST ở đế giữa nâng niu từ bước chân đầu tiên cho tới những bước cuối cùng',2200000,444,6,2,'puma_rsx.jpg','2025-04-02 10:01:15','Puma',0,0,'2025-07-17 09:56:17.167332'),(9,'Áo Hoodie Nữ Under Armour Unstoppable Sleeveless','ÁO HOODIE NỮ UNDER ARMOUR UNSTOPPABLE SLEEVELESS\nÁo Hoodie Nữ Under Armour Unstoppable Sleeveless được làm từ chất liệu fleece cao cấp nhất, mịn màng cả hai mặt, co giãn khi cần và thoáng khí dễ dàng. Bên cạnh đó, kiểu áo không tay mang đến cho bạn vẻ ngoài thể thao và năng động.',750000,22,2,5,'gucci_dress.jpg','2025-04-02 10:01:15','Gucci',0,0,'2025-06-30 22:08:57.727858'),(10,'Áo Hoodie Nữ Under Armour Half Zip Pullover','ÁO HOODIE NỮ UNDER ARMOUR HALF ZIP PULLOVER - ĐEN\nÁo Hoodie Nữ Under Armour Half Zip Pullover thuộc dòng sản phẩm Project Rock - do chính cựu vận động viên đô vật WWE, Dwayne Johnson đánh giá và kiểm duyệt. Chiếc áo sở hữu chất liệu siêu mềm mại, nhẹ và giữ ấm - lý tưởng cho các hoạt động ngày lạnh.',600000,111,2,5,'adidas_women_bag.jpg','2025-04-02 10:01:15','Adidas',0,0,'2025-06-30 22:29:23.349070'),(17,'Áo Thun Nam Nike Dri-Fit Uv Hyverse Ss - Đen','ÁO TAY NGẮN THỂ THAO NAM NIKE DF UV HYVERSE\nSẵn sàng cho những buổi tập luyện với áo thun thấm hút mồ hôi của Nike, với cảm giác mềm mại và thoải mái, giúp bạn chinh phục mọi mục tiêu tập luyện. Áo thun đa năng phù hợp với nhiều bài tập khác nhau như chạy bộ, tập gym hoặc thậm chí là yoga.\n\nƯu điểm sản phẩm\nCông nghệ Nike Dri-FIT thấm hút mồ hôi và khô nhanh hơn, giúp bạn luôn khô ráo và thoải mái hơn.\n\nKhả năng chống nắng UVA và UVBB, bảo vệ bạn khỏi các tia gây hại của ánh nắng mặt trời.\n\nChất liệu dệt mịn, mềm mại.\n\nCác đường may phẳng mang lại cảm giác mịn màng trên da.\n\nTHÔNG SỐ\nPhù hợp Chạy bộ, Tập luyện và Yoga\nLogo Swoosh ở phía trái ngực\n100% polyester\nCó thể giặt máy\nMã sản phẩm: DV9840-010',300000,21,1,1,'nike_kids_shoes.jpg','2025-06-16 17:19:45',NULL,0,1,'2025-07-17 15:13:01.248439'),(19,'Áo Thun Nam Nike Max90 - Be','Áo Thun Nam Nike Max90 sử dụng chất liệu cao cấp dày dặn này mang đến phong cách thanh lịch pha nét cổ điển với logo Swoosh độc đáo trên ngực. Kiểu dáng đậm chất Max90 cho phép bạn thoải mái vận động. Phối ngay chiếc áo phong cách này cùng đôi giày Nike yêu thích để tạo nên out-fit ấn tượng mỗi ngày!',400000,300,1,1,'nike_kids_shoes.jpg','2025-06-24 20:25:05',NULL,0,0,'2025-07-17 09:55:58.845403'),(20,'Áo Thun Nam Nike Dri-Fit Oc 2 - Be','Áo Thun Nam Nike Dri-Fit Oc 2 có thiết kế nhẹ, thoáng khí với phom dáng cổ điển, giúp bạn di chuyển thoải mái. Công nghệ Dri-FIT thấm hút mồ hôi và khô nhanh, giữ cơ thể khô ráo và thoải mái suốt cả ngày.',500000,300,1,1,NULL,'2025-06-26 05:34:33',NULL,0,1,'2025-07-17 09:55:55.610078'),(21,'Dép Quai Ngang Unisex Crocs Classic Crush','DÉP QUAI NGANG UNISEX CROCS CLASSIC CRUSH\nNâng tầm phong cách thời trang với Crocs Classic Crush. Sở hữu phần đế cao đặc trưng và thiết kế táo bạo của dòng Crush, dép Crocs với quai kép có các lỗ nhỏ để bạn thỏa sức trang trí với phụ kiện Jibbitz™, thể hiện cá tính riêng. Những sản phẩm của Crocs luôn mang lại cảm giác thoải mái mà bạn yêu thích và cập nhật xu hướng giúp bạn luôn tự tin dù ở bất cứ đâu.',175000,333,7,3,NULL,'2025-06-29 13:50:48',NULL,0,0,'2025-07-17 15:19:16.199012'),(22,'Giày Sandals Unisex Fila Tori','Đón chào mùa hè rực rỡ cùng Giày Sandals Unisex Fila Tori, sản phẩm thời trang mới nhất mang đậm phong cách \"Gopcore\" độc đáo của FILA. Thiết kế đế giày thể thao khỏe khoắn kết hợp cùng quai ngang ôm trọn bàn chân với màu sắc nữ tính, tạo nên tổng thể vừa nhẹ nhàng, vừa mát mẻ, cho bạn sải bước tự tin dưới nắng',450000,43,6,5,NULL,'2025-06-29 14:18:52',NULL,0,1,'2025-07-17 15:17:32.930405'),(23,'Giày Sandal Unisex Fila Pong Sd','GIÀY SANDAL UNISEX FILA FILA PONG SD - ĐỎ\nĐưa sự thoải mái vượt bậc lên một tầm cao mới với Giày Sandal Unisex Fila Pong SD. Được chế tác từ 100% cao su EVA cao cấp, đôi sandal này mang đến cảm giác êm ái, nhẹ nhàng trên từng bước chân, đồng hành cùng bạn suốt ngày dài năng động. Thiết kế tiêu chuẩn với những đường nét tinh tế',399000,31,6,6,NULL,'2025-06-29 14:22:40',NULL,0,1,'2025-07-17 15:01:12.689314'),(24,'Áo Thun Nữ Adidas Z.N.E.','ÁO THUN NỮ ADIDAS Z.N.E.\nBất kể bạn đang cổ vũ trên khán đài hay dạo bước trên đường phố, chiếc áo thun adidas này sẽ mang đến cho bạn phong cách nhẹ nhàng và tích cực. Họa tiết graphic in dẻo phủ nhám lấy cảm hứng từ những vạch kẻ trên sân bóng tô điểm chất thể thao, cùng chất vải cotton mát lạnh cho cảm giác dễ chịu trên da. Sẵn sàng cho tiết',350000,332,2,4,NULL,'2025-07-16 07:44:33',NULL,0,1,'2025-07-17 16:56:05.142988'),(25,'Áo Thun Nữ Nike Oversized','',450000,45,2,1,NULL,'2025-07-16 07:48:02',NULL,0,0,'2025-07-17 09:55:37.211390'),(26,'Áo Thun Nam Adidas Z.N.E.','ÁO THUN NAM ADIDAS Z.N.E.\nBất kể bạn đang cổ vũ trên khán đài hay dạo bước trên đường phố, chiếc áo thun adidas này sẽ mang đến cho bạn phong cách nhẹ nhàng và tích cực. Họa tiết graphic in dẻo phủ nhám lấy cảm hứng từ những vạch kẻ trên sân bóng tô điểm chất thể thao, cùng chất vải cotton mát lạnh cho cảm giác dễ chịu trên da.',450000,41,1,1,NULL,'2025-07-16 07:52:00',NULL,0,1,'2025-07-18 01:38:33.046761'),(27,'Áo Thun Nam Under Armour Meridian Pocket','ÁO THUN NAM UNDER ARMOUR MERIDIAN POCKET\nĐừng để cảm giác mềm mại đánh lừa bạn. Áo Thun Ngắn Tay Under Armour Meridian Pocket Nam được thiết kế đặc biệt để mang lại cảm giác thoải mái nhưng vẫn giữ được hiệu suất tối đa. Chiếc áo thun này có khả năng co giãn tốt, khô nhanh, mang lại cảm giác hoàn hảo',450000,55,1,4,NULL,'2025-07-16 07:54:32',NULL,0,0,'2025-07-17 09:55:16.881425'),(28,'Áo Thun Nam Under Armour Badge Of Honor','ÁO THUN NAM UNDER ARMOUR BADGE OF HONOR - TRẮNG\nÁo Thun Nam Under Armour Badge Of Honor từ bộ sưu tập Project Rock của Dwayne Johnson kết hợp sự thoải mái và tinh thần quyết tâm. Chất liệu cao cấp và công nghệ tiên tiến giúp duy trì phong độ trong mọi bài tập',450000,32,1,5,NULL,'2025-07-16 07:57:14',NULL,0,0,'2025-07-17 09:55:10.707873'),(29,'Áo Thun Tay Ngắn Nam Under Armour Trophy','Áo Thun Tay Ngắn Nam Under Armour Trophy',500000,26,1,6,NULL,'2025-07-16 07:59:59',NULL,0,0,'2025-07-18 02:58:48.485007'),(30,'Giày Chạy Bộ Nữ Puma Velocity Nitro 4','GIÃ€Y CHáº Y Bá»˜ Ná»® PUMA VELOCITY NITRO 4\nGiÃ y Cháº¡y Bá»™ Ná»¯ Puma Velocity Nitro 4 Ä‘Æ°á»£c thiáº¿t káº¿ Ä‘á»ƒ Ä‘á»“ng hÃ nh cÃ¹ng báº¡n trÃªn má»i cung Ä‘Æ°á»ng â€“ tá»« nhá»¯ng bÆ°á»›c cháº¡y Ä‘áº§u tiÃªn Ä‘áº¿n má»¥c tiÃªu phÃ¡ ká»· lá»¥c cÃ¡ nhÃ¢n. PhiÃªn báº£n nháº¹ nháº¥t cá»§a dÃ²ng Velocity, giÃ y sá»Ÿ há»¯u Ä‘á»‡m NITROFOAMâ„¢ trÃ n suá»‘t chiá»u dÃ i Ä‘áº¿, mang láº¡i cáº£m giÃ¡c Ä‘Ã n há»“i vÃ  hoÃ n tráº£ nÄƒng lÆ°á»£ng vÆ°á»£t trá»™i. \0\0',699000,0,6,3,NULL,'2025-07-16 08:06:18',NULL,0,0,'2025-07-18 02:09:51.649529');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,1,5,'Áo đẹp, chất liệu tốt','2025-03-28 14:20:37'),(2,3,2,4,'Giày êm nhưng hơi chật','2025-03-28 14:20:37');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `password_reset_otp` varchar(255) DEFAULT NULL,
  `otp_reset_expiry_time` datetime DEFAULT NULL COMMENT 'Thời gian OTP reset hết hạn',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Trạng thái hoạt động của tài khoản (true=active, false=inactive)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@shop.com','123456','0123456789','Hà Nội, Việt Nam','/images/avatars/d5ddf15e-a003-4716-adbf-86d19480e041.png','admin','2025-03-28 14:18:46','Admin','2025-07-16 13:54:32',NULL,NULL,NULL,1),(2,'Nguyễn Văn A','nguyenvana@gmail.com','user123','0987654321','TP. HCM, Việt Nam',NULL,'user','2025-03-28 14:18:46','A','2025-05-23 16:21:02',NULL,NULL,NULL,1),(3,'Trần Thị B','tranthib@gmail.com','user456','0912345678','Đà Nẵng, Việt Nam',NULL,'admin','2025-03-28 14:18:46','B','2025-05-23 16:23:06',NULL,NULL,NULL,0),(6,'Bui Van Hung','hungf@gmail.com','123456','0987654321','122, Phúc Xá, Ba Đình, Hà Nội',NULL,'user','2025-05-13 08:13:22',NULL,'2025-06-11 09:33:27',NULL,'590620','2025-06-11 09:43:14',1),(9,'Hung','uh@gmail.com','123456','0987654322','22, Phúc Xá, Ba Đình, Hà Nội','/images/avatars/8b3a928a-abf8-4576-9397-551188bd2de3.png','user','2025-05-13 10:51:34','1','2025-07-16 14:39:54',NULL,'221942','2025-05-23 16:20:28',1),(11,'user','user@gmail.com','12345678','0987654321','112, Bến Nghé, Quận 1, TP. Hồ Chí Minh','/images/avatars/4261c124-2b12-45be-97d3-810b1540cf5f.jpg','user','2025-05-21 15:05:34',NULL,'2025-06-30 21:49:29',NULL,NULL,NULL,1),(12,'Bui','huhu@gmail.com','123456','0987654321','123, Xã Phình Hồ, Huyện Trạm Tấu, Tỉnh Yên Bái','/images/avatars/45298f45-ecc7-423e-9ee0-41f6146fd2c5.png','user','2025-05-24 04:46:39',NULL,'2025-07-17 10:37:32','male','667027','2025-06-16 21:27:11',1),(13,'Hu','hu@gmail.com','123456','0987654321','22A, Xã Minh Tân, Huyện Cẩm Khê, Tỉnh Phú Thọ',NULL,'user','2025-05-24 05:46:52',NULL,'2025-05-24 12:46:52','other',NULL,NULL,1),(14,'hu','hu@shop.com','123456','0987654322','123, Xã Kiến Thành, Huyện Chợ Mới, Tỉnh An Giang',NULL,'user','2025-05-24 05:51:28',NULL,'2025-05-24 12:51:28','female',NULL,NULL,1),(15,'huhu','uhuh@gmail.com','123456','0987654321','123A, Xã Tân Phước, Huyện Đồng Phú, Tỉnh Bình Phước',NULL,'user','2025-05-24 05:53:39',NULL,'2025-05-24 13:01:27','male','848665','2025-05-24 13:11:13',1),(16,'BVH','buivanhug1201@gmail.com','123456','0987654323','123, Xã Minh Tân, Huyện Cẩm Khê, Tỉnh Phú Thọ',NULL,'user','2025-06-22 11:33:30',NULL,'2025-06-22 18:35:19','male',NULL,NULL,1),(17,'uhh@gmail.com','uhh@gmail.com','123456','0987867543','222, Xã Phước Sang, Huyện Phú Giáo, Tỉnh Bình Dương','/images/avatars/96e6d496-c2e9-4e70-8542-8092ffc266ac.jpg','user','2025-07-08 19:28:54',NULL,'2025-07-09 02:31:42','male',NULL,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã mà người dùng sẽ nhập',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'Mô tả chi tiết về chương trình giảm giá',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Loại giảm giá: PERCENTAGE, FIXED_AMOUNT',
  `discount_value` decimal(10,2) NOT NULL COMMENT 'Giá trị giảm (phần trăm hoặc số tiền)',
  `min_order_value` decimal(12,2) DEFAULT '0.00' COMMENT 'Giá trị đơn hàng tối thiểu để áp dụng',
  `max_discount_amount` decimal(10,2) DEFAULT NULL COMMENT 'Số tiền giảm tối đa (cho PERCENTAGE)',
  `start_date` datetime NOT NULL COMMENT 'Ngày bắt đầu hiệu lực',
  `end_date` datetime NOT NULL COMMENT 'Ngày kết thúc hiệu lực',
  `usage_limit_per_voucher` int DEFAULT NULL COMMENT 'Số lần mã này có thể được sử dụng tối đa',
  `usage_limit_per_user` int DEFAULT '1' COMMENT 'Số lần một người dùng có thể sử dụng mã này',
  `current_usage_count` int NOT NULL DEFAULT '0' COMMENT 'Số lần mã này đã được sử dụng',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Mã có đang hoạt động không',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (3,'SUMMER20','Giảm giá 20% cho tất cả đơn hàng mùa hè','PERCENTAGE',20.00,50000.00,100000.00,'2025-05-31 17:00:00','2025-08-31 16:59:59',1000,100,17,1,'2025-05-25 19:01:31','2025-07-18 01:38:33'),(4,'WELCOME50K','Giảm 50.000 VNĐ cho đơn hàng đầu tiên trên 2.000.000 VNĐ','FIXED_AMOUNT',50000.00,2000000.00,50000.00,'2025-05-19 17:00:00','2025-12-31 16:59:59',500,10,5,1,'2025-05-25 19:31:43','2025-07-15 15:35:33'),(5,'FREESHIP','Freeship cho đơn hàng','FIXED_AMOUNT',30000.00,1.00,30000.00,'2025-05-19 17:00:00','2025-12-31 16:59:59',100,100,22,1,'2025-05-25 19:31:43','2025-07-17 16:56:05'),(6,'GIAM30K','Giam 30k','FIXED_AMOUNT',30000.00,1.00,30000.00,'2025-06-09 17:00:00','2025-07-30 17:00:00',NULL,10,7,1,'2025-06-10 15:41:44','2025-07-17 16:55:46'),(7,'TEST','éttt','PERCENTAGE',22.00,0.00,2222.00,'2025-07-07 17:00:00','2025-07-17 17:00:00',NULL,1,0,0,'2025-07-09 02:44:02','2025-07-14 03:58:06');
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_items`
--

DROP TABLE IF EXISTS `wishlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_items` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID duy nhất của mục yêu thích',
  `user_id` int NOT NULL COMMENT 'ID của người dùng (khóa ngoại từ bảng users)',
  `product_id` int NOT NULL COMMENT 'ID của sản phẩm (khóa ngoại từ bảng products)',
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian thêm vào danh sách yêu thích',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_product_wishlist` (`user_id`,`product_id`) COMMENT 'Đảm bảo mỗi user chỉ yêu thích một sản phẩm một lần',
  UNIQUE KEY `UKtp53unkks741xiqi6m620i7mx` (`user_id`,`product_id`),
  KEY `fk_wishlist_product` (`product_id`),
  CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_items`
--

LOCK TABLES `wishlist_items` WRITE;
/*!40000 ALTER TABLE `wishlist_items` DISABLE KEYS */;
INSERT INTO `wishlist_items` VALUES (28,14,1,'2025-06-11 13:47:41'),(31,13,2,'2025-06-11 13:48:42'),(32,13,10,'2025-06-11 13:48:47'),(69,9,23,'2025-07-11 04:33:58'),(70,9,29,'2025-07-16 15:06:52'),(74,12,22,'2025-07-17 11:27:08'),(75,9,28,'2025-07-18 02:57:23');
/*!40000 ALTER TABLE `wishlist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fashion_store'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-23 12:17:22

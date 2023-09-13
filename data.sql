-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: laravelhotel
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogs_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (9,'special music event','6443c4deaeb5f.jpg','Are you planning a music event and looking for the perfect location to host it? Look no further than our hotel, where we offer everything you need to make your music event a success!\r\n\r\nOur hotel is the ideal location for music events of all sizes, from intimate performances to large concerts. Our versatile event spaces can accommodate any type of music event, whether you\'re hosting a concert, a DJ night, a live band, or any other type of music event. Our event spaces are equipped with state-of-the-art audio and visual equipment, ensuring that your music sounds its best and your audience can fully enjoy the performance.\r\n\r\nBut our hotel offers more than just great event spaces. Our luxurious accommodations are perfect for musicians and their guests, providing the perfect place to relax and unwind after a long day of rehearsals and performances. Our hotel features comfortable rooms and suites with all the amenities you need to feel at home, including high-speed internet, flat-screen TVs, and comfortable bedding.',1,'2023-04-22 11:28:30','2023-04-22 11:28:30'),(10,'just for your hapinness:food event','6443c50b0088b.jpg','when it comes to dining, our hotel has you covered. Our restaurant offers a variety of delicious options to fuel your event, from casual snacks to full meals. And after the event, our bar is the perfect place to unwind and celebrate a successful performance.\r\n\r\nOur hotel is also conveniently located near many local attractions, so your guests can enjoy all that the area has to offer. From museums and galleries to shopping and nightlife, there\'s something for everyone in our vibrant city.\r\n\r\nSo if you\'re planning a music event, choose our hotel as your venue. With our state-of-the-art event spaces, luxurious accommodations, and convenient location, we\'re the perfect choice for your next music event. Contact us today to learn more and to book your event space!',1,'2023-04-22 11:29:15','2023-04-22 11:29:15'),(11,'large scale event','6443db526602f.jpg','Are you planning a large-scale event, such as a conference or a wedding? If so, one of the most critical aspects to consider is the venue, and specifically the event hotel where your guests will be staying. In this blog post, we\'ll take a closer look at event hotels, what they offer, and why they\'re an excellent option for your next event.\r\n\r\nFirst of all, what is an event hotel? An event hotel is a hotel that specializes in hosting large events such as conferences, weddings, and other gatherings. These hotels have multiple conference rooms and ballrooms that can accommodate hundreds or even thousands of guests. They also have a range of amenities and services that cater specifically to event organizers, such as audio-visual equipment, catering, and event planning staff.',1,'2023-04-22 13:04:18','2023-04-22 13:04:18');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `facilities_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'bycycle','BICYCLING','Relax and recharge in the tranquility of our serene hotel',1,'2023-04-21 23:08:26','2023-04-21 23:08:26'),(2,'piscine','WALKING','great piscine',1,'2023-04-21 23:09:00','2023-04-21 23:09:00');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility_room_type`
--

DROP TABLE IF EXISTS `facility_room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility_room_type` (
  `facility_id` int unsigned NOT NULL,
  `room_type_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `facility_room_type_facility_id_index` (`facility_id`),
  KEY `facility_room_type_room_type_id_index` (`room_type_id`),
  CONSTRAINT `facility_room_type_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `facility_room_type_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility_room_type`
--

LOCK TABLES `facility_room_type` WRITE;
/*!40000 ALTER TABLE `facility_room_type` DISABLE KEYS */;
INSERT INTO `facility_room_type` VALUES (2,1,'2023-04-21 23:09:40','2023-04-21 23:09:40'),(1,2,'2023-04-21 23:10:18','2023-04-21 23:10:18');
/*!40000 ALTER TABLE `facility_room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Appetizer','Soup','Salad','Main Course','Dessert') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'pizza','Appetizer','QAJCvGY8eZtZCMxwp0aOv9Wpl8Ucpvioo4h2buky.jpg',100.00,'delicious pizza made with love',1,'2023-04-21 23:05:50','2023-04-21 23:05:50'),(2,'lunch','Appetizer','yaQTR7LyVyb3bQbY1DVugUWbcDs6x8q9EWTcxzGq.jpg',500.00,'welcome to our hotel for delicious food',1,'2023-04-21 23:06:34','2023-04-21 23:06:34'),(3,'italian food','Appetizer','LJtevJF3qzwGUmVbDOdTHkZhxiLZjKLS56l2IELD.jpg',250.00,'this is italiano',1,'2023-04-21 23:07:08','2023-04-21 23:07:08');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `room_type_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_room_type_id_index` (`room_type_id`),
  CONSTRAINT `images_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'iEjqdMUQ62F7ILx7U7900YxJZ7a8gnymFVRlJiaE.jpg','room 1',0,1,1,'2023-04-21 23:49:43','2023-04-21 23:50:10'),(2,'opVc6lPvNbg7j5uMgAfxogb9MDTR80RO1BBEskmR.jpg','room 1',1,1,1,'2023-04-21 23:50:10','2023-04-21 23:50:10'),(3,'Pg6ozTQKapBVV9UH220IdAQT04ZVu3rl5pmL6VsL.jpg','room 2',0,1,2,'2023-04-21 23:50:43','2023-04-21 23:51:01'),(4,'hlzA86aZoSGzkxruFSrvMxsjggF3idQh1rWjPOea.jpg','room 2',1,1,2,'2023-04-21 23:51:01','2023-04-21 23:51:01'),(5,'r70ivpHo0no3yS0q5e5LNsIrrQ1gDZMsmsJGoKmI.jpg','room3',1,1,3,'2023-04-21 23:51:41','2023-04-21 23:51:41');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_04_15_140419_create_blogs_table',1),(6,'2023_04_15_151341_create_facilities_table',1),(7,'2023_04_15_164506_create_foods_table',1),(8,'2023_04_15_171457_create_pages_table',1),(9,'2023_04_15_180310_create_room_types_table',1),(10,'2023_04_15_180853_create_sliders_table',1),(11,'2023_04_15_181733_create_subscribers_table',1),(12,'2023_04_15_188888_create_images_table',1),(13,'2023_04_15_188889_create_rooms_table',1),(14,'2023_04_15_199999_create_room_bookings_table',1),(15,'2023_04_15_200133_create_facility_room_type_table',1),(18,'2023_04_15_201101_create_reviews_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` enum('0','1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL,
  `approval_status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `room_booking_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_room_booking_id_index` (`room_booking_id`),
  CONSTRAINT `reviews_room_booking_id_foreign` FOREIGN KEY (`room_booking_id`) REFERENCES `room_bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'I recently stayed at the Hilton Garden Inn in downtown Seattle, and I must say that I was thoroughly impressed with my experience.','3','approved',1,'2023-04-22 13:57:41','2023-04-22 14:24:57'),(2,'My room was spacious, clean, and modern with all the amenities I needed for a comfortable stay, including a flat-screen TV, a mini-fridge, and a coffee maker.','4','approved',2,'2023-04-22 14:10:52','2023-04-22 14:25:04'),(3,'The hotel\'s facilities were top-notch. The fitness center had all the equipment I needed for a good workout, and the pool and hot tub','3','approved',3,'2023-04-22 14:19:57','2023-04-22 14:25:01');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_bookings`
--

DROP TABLE IF EXISTS `room_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_bookings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `arrival_date` date NOT NULL,
  `departure_date` date DEFAULT NULL,
  `room_cost` int NOT NULL,
  `status` enum('pending','checked_in','checked_out','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_bookings_room_id_index` (`room_id`),
  KEY `room_bookings_user_id_index` (`user_id`),
  CONSTRAINT `room_bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_bookings`
--

LOCK TABLES `room_bookings` WRITE;
/*!40000 ALTER TABLE `room_bookings` DISABLE KEYS */;
INSERT INTO `room_bookings` VALUES (1,1,12,'2023-04-22','2023-04-23',584,'checked_in',1,'2023-04-22 13:05:42','2023-04-22 13:08:52'),(2,4,13,'2023-04-23','2023-04-24',249,'checked_out',1,'2023-04-22 14:07:13','2023-04-22 14:10:09'),(3,7,14,'2023-04-23','2023-04-25',1447,'checked_in',0,'2023-04-22 14:13:24','2023-04-22 14:14:33');
/*!40000 ALTER TABLE `room_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_types`
--

DROP TABLE IF EXISTS `room_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_per_day` int NOT NULL,
  `discount_percentage` int NOT NULL DEFAULT '0',
  `size` int DEFAULT NULL,
  `max_adult` int DEFAULT '0',
  `max_child` int DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `room_service` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_types`
--

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;
INSERT INTO `room_types` VALUES (1,'luxues',500,6,125,2,2,'Discover your own personal oasis at our tranquil hotel',1,1,'2023-04-21 23:09:39','2023-04-21 23:09:39'),(2,'standard',200,0,250,2,3,'Discover your own personal oasis at our tranquil hotel',1,1,'2023-04-21 23:10:18','2023-04-21 23:10:18'),(3,'classic',600,3,650,2,3,'this is classical room',1,1,'2023-04-21 23:10:55','2023-04-21 23:10:55');
/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `room_number` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `room_type_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rooms_room_number_unique` (`room_number`),
  KEY `rooms_room_type_id_index` (`room_type_id`),
  CONSTRAINT `rooms_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'1','first room great',1,1,1,'2023-04-21 23:11:13','2023-04-21 23:11:13'),(2,'2','second room fantasctic',1,1,1,'2023-04-21 23:11:28','2023-04-21 23:11:28'),(3,'3','extra',1,1,1,'2023-04-21 23:11:49','2023-04-21 23:11:49'),(4,'4','great',1,1,2,'2023-04-21 23:12:15','2023-04-21 23:12:15'),(5,'5','extra',1,1,2,'2023-04-21 23:12:26','2023-04-21 23:12:26'),(6,'6','magic',1,1,2,'2023-04-21 23:12:36','2023-04-21 23:12:36'),(7,'7','test',1,1,3,'2023-04-21 23:12:59','2023-04-21 23:12:59'),(8,'8','wow',1,1,3,'2023-04-21 23:13:08','2023-04-21 23:13:08'),(9,'9','fine',1,1,3,'2023-04-21 23:13:17','2023-04-21 23:13:17');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `small_title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_text` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,'jU60rumhXIRW4pMVEUbtDbD0h5D0JZUdxzzfDz31.jpg','our hotel is great','The Ultimate Urban Oasis','Escape to our luxurious hotel and experience a tranquil retreat in the heart of the city.',NULL,NULL,1,'2023-04-21 23:01:54','2023-04-21 23:01:54'),(2,'y6yZTEKnkFFRJefPXRYzDDCGEg5cm0wQ9ezvbl8x.jpg','Luxury Redefined','Experience Our Hotel','Our hotel offers a lavish escape for the discerning traveler seeking unparalleled luxury.',NULL,NULL,1,'2023-04-21 23:04:08','2023-04-21 23:04:08'),(3,'wtbmH4iGecxfJW3UA9H0PmZge8otsYtuy0hc3HjF.jpg','Stay in Style','Discover Our Chic Hotel','Immerse yourself in an atmosphere of understated elegance at our hotel.',NULL,NULL,1,'2023-04-21 23:05:07','2023-04-21 23:05:07');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','others') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_facebook_id_unique` (`facebook_id`),
  UNIQUE KEY `users_twitter_id_unique` (`twitter_id`),
  UNIQUE KEY `users_google_id_unique` (`google_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','male','0912118872','Brgy.Enclaro,Binalbagan,Negros Occidental','admin@gmail.com','$2y$10$.Sksk0aeO2tqTQx18H0/BuCfPNEyc20Ym2.gBIPBt6s52rlbQ.3ZK','boy-1.png','hello from the other world',NULL,NULL,NULL,'admin',1,'lgwV2CED5OLypL8WkMTgg6hYW4JwsdEGVixAZdCYWSUXQ1MMuyBKAb3uzIRs','2023-04-21 22:48:11',NULL),(2,'Lyric','King','male','2748169735','699 Kassulke Mount Apt. 520\nIanport, IN 92582','jaquan58@example.com','$2y$10$DRiaZ7KFTJtqHU0PKT9/JOvomeMnUt8BPD6M48ZwQFxJmNov28fWW','boy.png','Non sed nam sint exercitationem. Assumenda placeat ipsum rerum a doloribus. Minima at voluptatibus tempore velit.',NULL,NULL,NULL,'user',1,'LOA2yLKb26','2023-04-21 22:48:14','2023-04-21 22:48:14'),(3,'Julio','Kuvalis','male','2073657524','291 Kreiger Trace\nSchambergerburgh, DE 72812','oda09@example.org','$2y$10$1nsnzd3hraIpSG.vBtxvzeKcNtgrJBluZ5thrm8PbaU7M18AHQwci','man-2.png','Nulla architecto ut aut in iure. Vitae eius aliquid et aut commodi aperiam odio. Assumenda perferendis eligendi culpa ratione quod asperiores.',NULL,NULL,NULL,'user',1,'IAHVFeFKuY','2023-04-21 22:48:14','2023-04-21 22:48:14'),(4,'Jewel','Gusikowski','others','228714451X','5342 Madalyn Ranch Apt. 549\nEmardmouth, ND 86116-2318','mitchell.birdie@example.net','$2y$10$Q2Rjokjkvv3Ksr39W1VKrOgBlklJUUxDFAnIyuSH8WiRBgN3W8PsK','man-2.png','Illo eos commodi voluptate. Repellendus recusandae enim eius id quo quae. Maiores deleniti ab eum aliquam rem dignissimos minima.',NULL,NULL,NULL,'user',1,'fTiwbhbajb','2023-04-21 22:48:14','2023-04-21 22:48:14'),(5,'Keanu','O\'Conner','female','6099062025','960 Art Loaf\nLerafurt, OR 74608-6062','abernathy.gerry@example.com','$2y$10$7V6cgrSexrLHEoAxzox3E.p88QtLYUyij2fhH3WMLyxQ/gpnTHSgO','girl-2.png','Voluptas maxime voluptatibus nihil sint aliquam et. Dolor est odit dolore fugit maxime consequatur. Officia id sed aut. Praesentium in sint eos libero.',NULL,NULL,NULL,'user',1,'XBIleLg1XA','2023-04-21 22:48:15','2023-04-21 22:48:15'),(6,'Tyson','Windler','male','6088120746','3584 Grant Throughway Suite 409\nBeerfurt, DC 43144','ipadberg@example.org','$2y$10$WgKfirTJZTLlTdmNL.vbSeVnsX4xscdxmQx662Ijdj4A9eHUsOFwy','man-1.png','Inventore asperiores nisi ex asperiores. Dicta aperiam hic odit et voluptatem et. Dolores dolorem voluptatem mollitia.',NULL,NULL,NULL,'user',1,'HaxEDMTaXq','2023-04-21 22:48:15','2023-04-21 22:48:15'),(7,'Chanel','McLaughlin','others','9844138140','61644 Yadira Ways Apt. 164\nLake Mireilleberg, OH 68389-4110','kira.thompson@example.org','$2y$10$oBTXZNMpWuQzriRVOE4zkOKiUXQhIJB/DJaOU/W4aX.sfQANiagsi','boy-1.png','Et aperiam omnis distinctio aperiam sed repellendus ut. Numquam similique quidem quisquam dolorem laudantium perferendis amet. Doloribus nisi necessitatibus et natus. Occaecati in hic veniam.',NULL,NULL,NULL,'user',1,'iCRmiZopGr','2023-04-21 22:48:15','2023-04-21 22:48:15'),(8,'Eldridge','Blanda','others','5693846504','35382 Gene Shores\nEast Heber, SD 98745-5281','srice@example.com','$2y$10$RjktB0wsaSMBD8IRIQ8xSeRWVconYLFyGDp0HJ5JSPwzcWvDqVuzS','boy.png','Atque inventore soluta aperiam harum. Voluptatem ea eos voluptatem molestiae saepe. Veritatis omnis atque sit nulla culpa alias.',NULL,NULL,NULL,'user',1,'Bm07cixWe8','2023-04-21 22:48:15','2023-04-21 22:48:15'),(9,'Jermain','Okuneva','female','7471782013','62578 Lyric Isle Apt. 012\nWest Aurelio, NJ 17100','leone83@example.com','$2y$10$BLWCqgkGNFiXJBjCczxlE.ajziCwQZuI7ndKQBFNFLCov9e3zrutK','girl-1.png','Numquam eius voluptates quo tempora iure cumque ea. Itaque consequatur autem quia est nemo cupiditate id.',NULL,NULL,NULL,'user',1,'gFWAn0EbdA','2023-04-21 22:48:16','2023-04-21 22:48:16'),(10,'Kathryn','Pouros','female','8941006708','718 Wyman Mission\nNew Aliyahstad, WY 11219-1280','lschuster@example.org','$2y$10$sPMb/nu9K82dg7kM71ZBUuu8vRrVopyvz44csW/H1xm2l7kRA4MjK','girl-2.png','Ea cupiditate natus voluptatem repudiandae deserunt. Ratione dolores deserunt dolor. Illo nobis maxime quia aliquam soluta. Perferendis et facilis et distinctio dolorem quos debitis nihil.',NULL,NULL,NULL,'user',1,'3mFOEtUxjS','2023-04-21 22:48:16','2023-04-21 22:48:16'),(11,'Noelia','Jacobs','male','559279956X','166 Karianne Rest Suite 872\nEast Macie, PA 43913-8933','terry.bobbie@example.org','$2y$10$xS6lqZrLFtC6bbz1n8fnGuJhyVgKEw/5KciTIuYM8Now1fHO0arl2','man-3.png','Eligendi sed recusandae similique ut. Et reprehenderit magni autem delectus tempore dolor. Nesciunt in exercitationem ducimus.',NULL,NULL,NULL,'user',1,'hTiyqGYhfN','2023-04-21 22:48:16','2023-04-21 22:48:16'),(12,'ima','ima','female',NULL,NULL,'ima@gmail.com','$2y$10$guf64hD.I9ZKLHew4Tk9vuH0uuORjYCD0lEcbUG.IgyEEpxMY7Pe.','0TllccTRzLBDlZDGKWfg99SBCNc6fJLleYhOZWhE.jpg',NULL,NULL,NULL,NULL,'user',1,NULL,'2023-04-22 12:53:42','2023-04-22 13:10:56'),(13,'imana','imana','female','123456','10 imana','imana@gmail.com','$2y$10$EN5FDR1McnmQoRmdEB2yluupSpli/QzVLx/vnYrjpKy0AN9v0mQWS','Amd5ZUKVXINscjKR45qAs75QKbTlgRKhzRcbPN7V.jpg',NULL,NULL,NULL,NULL,'user',1,NULL,'2023-04-22 14:05:43','2023-04-22 14:05:43'),(14,'imanita','imanita','female','124356','10 hey','imanita@gmail.com','$2y$10$0U0MLTvY31zv.Oi9J332H.i7z4C70GtyMvK1fdEQlwL9NjqYQLUD.','PGGfocFPg86ALh6V3IAboPioSdcuokUFkz51P6IJ.jpg',NULL,NULL,NULL,NULL,'user',1,NULL,'2023-04-22 14:06:27','2023-04-22 14:06:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-22 14:30:29

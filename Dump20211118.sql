CREATE DATABASE  IF NOT EXISTS `heroku_3c80e739a0b0a74` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `heroku_3c80e739a0b0a74`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: heroku_3c80e739a0b0a74
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `accessmodes`
--

DROP TABLE IF EXISTS `accessmodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessmodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `mode` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessmodes`
--

LOCK TABLES `accessmodes` WRITE;
/*!40000 ALTER TABLE `accessmodes` DISABLE KEYS */;
INSERT INTO `accessmodes` VALUES (1,'/admin/customers',100),(2,'/admin/seller',100),(3,'/admin/pets',100),(4,'/admin/breeds',100),(5,'/admin/breed/highlights',100),(6,'/admin/services',100),(7,'/admin/products',100),(8,'/admin/products/size',100),(9,'/admin/products/flavor',100),(10,'/admin/product/highlights',100),(11,'/admin/products/color',100),(12,'/admin/products/purchase',100),(13,'/admin',100),(16,'/admin/breed/highlights/add',100),(17,'/admin/breed/highlights/change',100),(18,'/admin/breeds/change',100),(19,'/admin/breeds/add',100);
/*!40000 ALTER TABLE `accessmodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance` int NOT NULL,
  `action` int NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `action_accessmode1_idx` (`instance`),
  KEY `action_accessmode2_idx` (`action`),
  CONSTRAINT `action_accessmode1` FOREIGN KEY (`instance`) REFERENCES `accessmodes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `action_accessmode2` FOREIGN KEY (`action`) REFERENCES `accessmodes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,5,16,0),(2,5,17,1),(3,4,18,1),(4,4,19,0);
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `admin-breed`
--

DROP TABLE IF EXISTS `admin-breed`;
/*!50001 DROP VIEW IF EXISTS `admin-breed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `admin-breed` AS SELECT 
 1 AS `id`,
 1 AS `pet`,
 1 AS `breed`,
 1 AS `thumbnail`,
 1 AS `gender`,
 1 AS `price`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `admin-product`
--

DROP TABLE IF EXISTS `admin-product`;
/*!50001 DROP VIEW IF EXISTS `admin-product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `admin-product` AS SELECT 
 1 AS `id`,
 1 AS `category`,
 1 AS `brand`,
 1 AS `pname`,
 1 AS `thumbnail`,
 1 AS `price`,
 1 AS `rating`,
 1 AS `note`,
 1 AS `qty`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `admin-purchase`
--

DROP TABLE IF EXISTS `admin-purchase`;
/*!50001 DROP VIEW IF EXISTS `admin-purchase`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `admin-purchase` AS SELECT 
 1 AS `id`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `email`,
 1 AS `pname`,
 1 AS `purchasedate`,
 1 AS `deliverydate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (21,'Andhra Bank'),(31,'Axis Bank'),(41,'Allahabad Bank'),(51,'Bank of Bahrain and Kuwait'),(61,'Bank of Baroda - Corporate Ban'),(71,'Bank of Baroda - Retail Bankin'),(81,'Bank of India'),(91,'Bank of Maharashtra'),(101,'Canara Bank'),(111,'Central Bank of India'),(121,'City Union Bank'),(131,'Corporation Bank'),(141,'Deutsche Bank'),(151,'Development Credit Bank'),(161,'Dhanlaxmi Bank'),(171,'Federal Bank'),(181,'ICICI Bank'),(191,'IDBI Bank'),(201,'Indian Bank'),(211,'Indian Overseas Bank'),(221,'IndusInd Bank'),(231,'ING Vysya Bank'),(241,'Jammu and Kashmir Bank'),(251,'Karnataka Bank Ltd'),(261,'Karur Vysya Bank'),(271,'Kotak Bank'),(281,'Laxmi Vilas Bank'),(291,'Oriental Bank of Commerce'),(301,'Punjab National Bank - Corpora'),(311,'Punjab National Bank - Retail '),(321,'Punjab & Sind Bank'),(331,'Shamrao Vitthal Co-operative B'),(341,'South Indian Bank'),(351,'State Bank of Bikaner & Jaipur'),(361,'State Bank of Hyderabad'),(371,'State Bank of India'),(381,'State Bank of Mysore'),(391,'State Bank of Patiala'),(401,'State Bank of Travancore'),(411,'Syndicate Bank'),(421,'Tamilnad Mercantile Bank Ltd.'),(431,'UCO Bank'),(441,'Union Bank of India'),(451,'United Bank of India'),(461,'Vijaya Bank'),(471,'Yes Bank Ltd');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_details`
--

DROP TABLE IF EXISTS `bank_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_details` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `accnumber` int NOT NULL,
  `ifsc` int NOT NULL,
  `bank` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_bank_idx` (`uid`),
  KEY `bankd_bank_idx` (`bank`),
  CONSTRAINT `bankd_bank` FOREIGN KEY (`bank`) REFERENCES `bank` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_bank` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_details`
--

LOCK TABLES `bank_details` WRITE;
/*!40000 ALTER TABLE `bank_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'pedigree'),(2,'all4pets'),(11,'Pet santa'),(12,'Beaphar'),(13,'Savic'),(14,'Jolly Pets'),(15,'Pet en Care'),(16,'Royal Canin'),(17,'Touchdog'),(18,'Drools'),(19,'Dibaq');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breedcolor`
--

DROP TABLE IF EXISTS `breedcolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breedcolor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `breed` int NOT NULL,
  `color` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `color_breed_idx` (`breed`),
  CONSTRAINT `color_breed` FOREIGN KEY (`breed`) REFERENCES `breeds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breedcolor`
--

LOCK TABLES `breedcolor` WRITE;
/*!40000 ALTER TABLE `breedcolor` DISABLE KEYS */;
/*!40000 ALTER TABLE `breedcolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `breeddata`
--

DROP TABLE IF EXISTS `breeddata`;
/*!50001 DROP VIEW IF EXISTS `breeddata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `breeddata` AS SELECT 
 1 AS `id`,
 1 AS `pet`,
 1 AS `thumbnail`,
 1 AS `gender`,
 1 AS `breed`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `breedhighlights`
--

DROP TABLE IF EXISTS `breedhighlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breedhighlights` (
  `id` int NOT NULL AUTO_INCREMENT,
  `breed` int NOT NULL,
  `highlight` varchar(370) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `breed_highlight_idx` (`breed`),
  CONSTRAINT `breed_highlight` FOREIGN KEY (`breed`) REFERENCES `breeds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breedhighlights`
--

LOCK TABLES `breedhighlights` WRITE;
/*!40000 ALTER TABLE `breedhighlights` DISABLE KEYS */;
INSERT INTO `breedhighlights` VALUES (6,7,'Adapts Well To Apartment Living'),(7,7,'Tolerates Cold Weather'),(8,7,'Tolerates Hot Weather'),(9,7,'Kid-Friendly'),(10,7,'Potential For Playfulnes'),(11,7,'Tendency To Bark Or Howl'),(12,7,'Easy To Train'),(14,7,'Size of Males stand 24 to 26 inches; females stand 22 to 24 inches. Weight ranges from 75 to 95 pounds'),(15,7,'Wanderlust Potential'),(16,7,'Life Span: 10 to 14 years'),(17,7,'Dog Breed Group: Herding Dogs'),(18,8,'Dog Breed Group: Companion Dogs'),(19,8,'Height: 12 to 15 inches tall at the shoulder'),(20,7,'Weight: 40 to 50 pounds'),(21,8,'Life Span: 8 to 12 years'),(22,8,'Weight: 40 to 50 pounds'),(23,8,'Adapts Well To Apartment Living'),(24,8,'Tolerates Cold Weather'),(25,8,'Tolerates Being Alone'),(26,8,'Affectionate With Family'),(27,8,'Kid-Friendly'),(28,8,'Amount Of Shedding'),(29,8,'Tendency To Bark Or Howl'),(30,8,'Potential For Playfulness'),(31,9,'Adapts Well To Apartment Living'),(32,9,'Affectionate With Family'),(33,9,'Friendly Toward Strangers'),(34,9,'Easy To Groom'),(35,9,'Moderate Tendency To Bark Or Howl'),(36,9,'High Potential For Playfulness'),(37,9,'Dog Breed Group: Working Dogs'),(38,9,'Height: 21 to 25 inches at the shoulder'),(39,9,'Weight: 60 to 70 pounds'),(40,9,'Life Span: 10 to 12 years'),(41,10,'Dog Breed Group: Companion Dogs'),(42,10,'Height: 9 to 12 inches tall at the shoulder'),(43,10,'Weight: 8 to 14 pounds'),(44,10,'Life Span: 12 to 14 years'),(45,10,'Adapts Well To Apartment Living'),(46,10,'High Sensitivity Level '),(47,10,'High Affectionate With Family'),(48,10,'Less Tolerates Cold Weather'),(49,10,'less Tolerates Hot Weather'),(50,10,'Moderate Tendency To Bark Or Howl'),(51,10,'Moderate Potential For Playfulness'),(52,11,'Dog Breed Group: Working Dogs'),(53,11,'Height: 21 to 27 inches tall at the shoulder'),(54,11,'Weight: 55 to 70 pounds'),(55,11,'Life Span: 12 to 15 years'),(56,11,'Adapts Well To Apartment Living'),(57,11,'High Sensitivity Level'),(58,11,'Highly Tolerates Cold Weather'),(59,11,'Moderately Tolerates Hot Weather'),(60,11,'High amount Of Shedding'),(61,11,'High Intelligence'),(62,11,'Low Tendency To Bark Or Howl'),(63,11,'Potential For Playfulness');
/*!40000 ALTER TABLE `breedhighlights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breeds`
--

DROP TABLE IF EXISTS `breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `petid` int NOT NULL,
  `breed` varchar(45) NOT NULL,
  `thumbnail` varchar(500) NOT NULL,
  `gender` tinyint NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `breed_pet_idx` (`petid`),
  CONSTRAINT `breed_pet` FOREIGN KEY (`petid`) REFERENCES `pets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breeds`
--

LOCK TABLES `breeds` WRITE;
/*!40000 ALTER TABLE `breeds` DISABLE KEYS */;
INSERT INTO `breeds` VALUES (7,6,'Germen Shepherd','https://upload.wikimedia.org/wikipedia/commons/d/d0/German_Shepherd_-_DSC_0346_%2810096362833%29.jpg',0,5000,20),(8,6,'Bulldog','https://dogtime.com/assets/uploads/gallery/bulldog-dog-breed-pictures/8-running.jpg',1,10000,21),(9,6,'Boxer','https://upload.wikimedia.org/wikipedia/commons/6/6f/Male_fawn_Boxer_undocked.jpg',1,11500,5),(10,6,'Bolognese ','https://www.dogbreedslist.info/uploads/allimg/dog-pictures/Bolognese-dog-2.jpg',0,7500,23),(11,6,'Chinook','https://breed-assets.wisdompanel.com/dog/chinook/Chinook_Color_Small_file_copy.png',0,8500,8),(12,6,'Labsky','https://www.dogtime.com/assets/uploads/2019/07/labsky-mixed-dog-breed-pictures-cover.jpg',0,13000,23),(13,6,'King Shepherd','https://www.perfectdogbreeds.com/wp-content/uploads/2019/04/king-Shepherd-Breed-Info-Is-This-The-Best-Shepherd-For-You-Cover.jpg',0,15500,3),(14,6,'Kishu Ken','https://petkeen.com/wp-content/uploads/2021/03/kishu_ken_dog.jpg',0,7600,11),(15,6,'Akita','http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001904/Akita-On-White-01.jpg',0,9500,25),(16,6,'Bassador','https://vetstreet.brightspotcdn.com/dims4/default/d9f8398/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F44%2F0a%2Fba1a027e4a5aa5c5f08166f58b7d%2Fbasador-1.jpg',0,6500,26),(17,6,'Berger PIcard','https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/03193707/Berger-Picard-standing-in-a-field.jpg',1,10500,11),(18,6,'Boxweiler','https://www.loveyourdog.com/wp-content/uploads/2019/09/Boxer-Mixes-900x500.jpg',1,85000,40),(19,7,'Abyssinian','https://www.thesprucepets.com/thmb/7p0TopOHEHX3aQsdYzRdidbS0Lo=/2121x1414/filters:fill(auto,1)/GettyImages-165827729-efc11c02690f457a81ef6ccbfa8eb34d.jpg',1,2290,1),(20,7,'British Shorthair','http://www.discoveranimals.org/uploads/pets/BritishShorthair.jpg',0,3000,3),(21,7,'Persian Cat','https://www.carl-dick.de/WebRoot/Store7/Shops/61449137/5BC6/03CE/EFAE/E016/0322/0A0C/6D05/5658/3433.jpg',1,2000,30),(22,6,'Maine Coon','https://www.tica.org/images/TopCats/2020/BOB/Maine-Coon/Maine-Coon-1-Alter-Cottneye-Joe-McRae.jpg',1,3500,12),(23,7,'Exotic Shorthair','https://vetstreet.brightspotcdn.com/dims4/default/4af17a9/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2Fda%2F3f%2Faaaf93ab43f1aa42df7fc0c38e28%2FExotic-Shorthair-AP-1CEWS1-645sm3614.jpg',1,5500,15),(24,7,'Scottish Fold','https://cf.ltkcdn.net/cats/images/orig/243170-1600x1030-scottish-fold-cat.jpg',0,4500,2),(25,7,'Ragdoll','https://image.shutterstock.com/image-photo/ragdoll-kitten-on-pillow-looking-260nw-515476243.jpg',0,6500,7);
/*!40000 ALTER TABLE `breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `pid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cartpid_idx` (`pid`),
  KEY `cartuid_idx` (`uid`),
  CONSTRAINT `cartpid` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cartuid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (45,81,42),(46,81,41),(48,81,43);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!50001 DROP VIEW IF EXISTS `cart_item`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cart_item` AS SELECT 
 1 AS `uid`,
 1 AS `pid`,
 1 AS `name`,
 1 AS `thumbnail`,
 1 AS `price`,
 1 AS `color`,
 1 AS `flavor`,
 1 AS `size`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cartview`
--

DROP TABLE IF EXISTS `cartview`;
/*!50001 DROP VIEW IF EXISTS `cartview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cartview` AS SELECT 
 1 AS `id`,
 1 AS `uid`,
 1 AS `category`,
 1 AS `brand`,
 1 AS `pname`,
 1 AS `thumbnail`,
 1 AS `price`,
 1 AS `rating`,
 1 AS `note`,
 1 AS `qty`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (31,'Food'),(41,'Clothes'),(51,'Grooming Products'),(61,'Treats'),(71,'Accessories'),(81,'Litter and Housebreaking'),(91,'Toys');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `charges`
--

DROP TABLE IF EXISTS `charges`;
/*!50001 DROP VIEW IF EXISTS `charges`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `charges` AS SELECT 
 1 AS `planid`,
 1 AS `service`,
 1 AS `plan`,
 1 AS `discount`,
 1 AS `price`,
 1 AS `feature`,
 1 AS `about`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ci_color`
--

DROP TABLE IF EXISTS `ci_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ci_color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart` int NOT NULL,
  `color` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citem_idx` (`cart`),
  KEY `ccolor_idx` (`color`),
  CONSTRAINT `ccolor` FOREIGN KEY (`color`) REFERENCES `color` (`id`) ON DELETE CASCADE,
  CONSTRAINT `citem` FOREIGN KEY (`cart`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_color`
--

LOCK TABLES `ci_color` WRITE;
/*!40000 ALTER TABLE `ci_color` DISABLE KEYS */;
INSERT INTO `ci_color` VALUES (25,46,2);
/*!40000 ALTER TABLE `ci_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_flavor`
--

DROP TABLE IF EXISTS `ci_flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ci_flavor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart` int NOT NULL,
  `flavor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cfcart_idx` (`cart`),
  KEY `ciflavor_idx` (`flavor`),
  CONSTRAINT `cfcart` FOREIGN KEY (`cart`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ciflavor` FOREIGN KEY (`flavor`) REFERENCES `flavor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_flavor`
--

LOCK TABLES `ci_flavor` WRITE;
/*!40000 ALTER TABLE `ci_flavor` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_flavor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_size`
--

DROP TABLE IF EXISTS `ci_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ci_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart` int NOT NULL,
  `size` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cs_cart_idx` (`cart`),
  KEY `ci_size_idx` (`size`),
  CONSTRAINT `ci_size` FOREIGN KEY (`size`) REFERENCES `size` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cs_cart` FOREIGN KEY (`cart`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_size`
--

LOCK TABLES `ci_size` WRITE;
/*!40000 ALTER TABLE `ci_size` DISABLE KEYS */;
INSERT INTO `ci_size` VALUES (40,45,14),(41,46,13),(43,48,15);
/*!40000 ALTER TABLE `ci_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` int NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staterel_idx` (`state`),
  CONSTRAINT `staterel` FOREIGN KEY (`state`) REFERENCES `states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=881 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (11,41,'central delhi'),(21,41,'north delhi'),(31,41,'south delhi'),(41,41,'east delhi'),(51,41,'north east delhi'),(61,41,'north west delhi'),(71,41,'new delhi'),(81,41,'west delhi'),(91,41,'shahdara'),(101,41,'south east delhi'),(241,11,'amritsar'),(251,11,'hoshiarpur'),(261,11,'faridkot'),(271,11,'batala'),(281,11,'firozpur'),(291,11,'gurdaspur'),(301,11,'jalandhar'),(311,11,'ludhiana'),(321,11,'kapurthala'),(331,11,'patiala'),(341,11,'nabha'),(351,11,'rupnagar'),(361,11,'sangrur'),(371,31,'ambala'),(381,31,'bhiwani'),(391,31,'gurgaon'),(401,31,'faridabad'),(411,31,'hisar'),(421,31,'firozpur jhirka'),(431,31,'hansi'),(441,31,'jind'),(451,31,'kaithal'),(461,31,'kurukshetra'),(471,31,'panipat'),(481,31,'karnal'),(491,31,'pehowa'),(501,31,'rohtak'),(511,31,'sirsa'),(521,31,'sonipat'),(531,31,'rewadi'),(541,21,'sector 1'),(551,21,'sector 10'),(561,21,'sector 11'),(571,21,'sector 14'),(581,21,'sector 15'),(591,21,'sector 16'),(601,21,'sector 17'),(611,21,'sector 18'),(621,21,'sector 19'),(631,21,'sector 20'),(641,21,'sector 21'),(651,21,'sector 22'),(661,21,'sector 23'),(671,21,'sector 24'),(681,21,'sector 26'),(691,21,'sector 27'),(701,21,'sector 28'),(711,21,'sector 29'),(721,21,'sector 30'),(731,21,'sector 31'),(741,21,'sector 32'),(751,21,'sector 33'),(761,21,'sector 34'),(771,21,'sector 35'),(781,21,'sector 36'),(791,21,'sector 37'),(801,21,'sector 40'),(811,21,'manimajra'),(821,21,'mohali'),(831,21,'industrial area phase 1'),(841,21,'industrial area phase 2'),(851,21,'dlf mulanpur'),(861,21,'madhya marg'),(871,21,'mc dhanas');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcolor_idx` (`pid`),
  CONSTRAINT `pcolor` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (2,41,'Pink');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flavor`
--

DROP TABLE IF EXISTS `flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flavor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `flavor` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pflavor_idx` (`pid`),
  CONSTRAINT `pflavor` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flavor`
--

LOCK TABLES `flavor` WRITE;
/*!40000 ALTER TABLE `flavor` DISABLE KEYS */;
INSERT INTO `flavor` VALUES (11,43,'Non-Veg'),(12,44,'Salmon $ Rice');
/*!40000 ALTER TABLE `flavor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlights`
--

DROP TABLE IF EXISTS `highlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `highlights` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `highlight` varchar(350) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `highprod_idx` (`pid`),
  CONSTRAINT `highprod` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlights`
--

LOCK TABLES `highlights` WRITE;
/*!40000 ALTER TABLE `highlights` DISABLE KEYS */;
INSERT INTO `highlights` VALUES (44,41,'Present in attractive color'),(45,41,'Multi utility bowl'),(46,41,'Food and water can be given together in same bowl'),(47,41,'Length - 11.9 cm'),(48,41,'Width - 11.9 cm'),(49,41,'Height -4.8 cm'),(50,41,'Height -4.8 cm'),(51,42,'Ideal for dogs with dry skin and danruff'),(54,42,'Tea tree oil gently soothes the damaged skin'),(55,42,'Promotes glossy coat and soft supple skin'),(56,42,'Contains neem and tulsi, natural antiseptic'),(57,42,'Suitable for - All dog breeds'),(58,42,'ideal for - dogs with dry skin'),(59,42,'Ingredients - Each ml. contains : Ext. Amla 2mg, Neem 2mg, Tulsi 2mg, Chana 2mg, Rusmari 2mg, Kayaputi oil 4mg. base q.s. '),(60,42,'For animal use only'),(61,42,'Store in a cool dark place'),(62,43,'Dibaq Sense Salmon Adult Canned Dog Food - 380 gm'),(63,43,'Sensitive Digestion'),(64,43,'Glutten Free'),(65,43,'Joint Protector Pack'),(66,44,'SMALL CRUNCHY CROQUETTES. SPECIAL DESIGN, DENTAL HEALTH'),(67,44,'FATTY ACIDS, BIOTIN AND ZINC, TO CARE FOR THE SKIN AND COAT'),(68,44,'WITH INULIN, A PREBIOTIC BENEFICIAL FOR INTESTINAL FLORA');
/*!40000 ALTER TABLE `highlights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `instance_accessibility`
--

DROP TABLE IF EXISTS `instance_accessibility`;
/*!50001 DROP VIEW IF EXISTS `instance_accessibility`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `instance_accessibility` AS SELECT 
 1 AS `category`,
 1 AS `instance`,
 1 AS `url`,
 1 AS `mode`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `instances`
--

DROP TABLE IF EXISTS `instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL,
  `instance` varchar(45) NOT NULL,
  `access` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `instancecategory_idx` (`category`),
  KEY `instanceacess_idx` (`access`),
  CONSTRAINT `instancecategory` FOREIGN KEY (`category`) REFERENCES `modal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instances`
--

LOCK TABLES `instances` WRITE;
/*!40000 ALTER TABLE `instances` DISABLE KEYS */;
INSERT INTO `instances` VALUES (1,1,'customer',1),(2,1,'seller',2),(3,2,'pets',3),(4,2,'breeds',4),(5,2,'highlights',5),(6,2,'services',6),(7,3,'products',7),(8,3,'product size',8),(9,3,'product flavour',9),(10,3,'product highlights',10),(11,3,'product color',11),(12,3,'purchase',12);
/*!40000 ALTER TABLE `instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_logs`
--

DROP TABLE IF EXISTS `login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_uid` int NOT NULL,
  `instance` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_instance` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_user_idx` (`log_uid`),
  KEY `log_user` (`log_uid`),
  CONSTRAINT `user_logs` FOREIGN KEY (`log_uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_logs`
--

LOCK TABLES `login_logs` WRITE;
/*!40000 ALTER TABLE `login_logs` DISABLE KEYS */;
INSERT INTO `login_logs` VALUES (3,81,'2021-05-10 10:04:28','2021-05-10 10:04:42'),(4,81,'2021-05-10 10:05:28','2021-05-10 11:14:51'),(5,81,'2021-05-10 11:16:03','2021-05-10 13:37:02'),(6,81,'2021-05-10 13:40:41','2021-05-11 07:32:44'),(7,71,'2021-05-11 07:25:38',NULL),(8,81,'2021-05-11 07:33:01','2021-05-11 07:33:25'),(9,81,'2021-05-11 07:37:06','2021-06-15 12:19:16'),(10,81,'2021-06-15 12:19:35',NULL);
/*!40000 ALTER TABLE `login_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modal`
--

DROP TABLE IF EXISTS `modal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modal`
--

LOCK TABLES `modal` WRITE;
/*!40000 ALTER TABLE `modal` DISABLE KEYS */;
INSERT INTO `modal` VALUES (1,'User'),(2,'Inventory'),(3,'shop');
/*!40000 ALTER TABLE `modal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pdata`
--

DROP TABLE IF EXISTS `pdata`;
/*!50001 DROP VIEW IF EXISTS `pdata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pdata` AS SELECT 
 1 AS `id`,
 1 AS `pname`,
 1 AS `brand`,
 1 AS `thumbnail`,
 1 AS `price`,
 1 AS `rating`,
 1 AS `note`,
 1 AS `qty`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `petdata`
--

DROP TABLE IF EXISTS `petdata`;
/*!50001 DROP VIEW IF EXISTS `petdata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `petdata` AS SELECT 
 1 AS `petid`,
 1 AS `pet`,
 1 AS `pic`,
 1 AS `bid`,
 1 AS `breed`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pet` varchar(45) NOT NULL,
  `pic` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (6,'Dog','https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d'),(7,'Cat','https://images.theconversation.com/files/350865/original/file-20200803-24-50u91u.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL,
  `brand` int NOT NULL,
  `pname` varchar(150) NOT NULL,
  `thumbnail` varchar(500) NOT NULL,
  `price` int NOT NULL,
  `rating` float NOT NULL,
  `note` varchar(1000) NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_idx` (`category`),
  KEY `p_brand_idx` (`brand`),
  CONSTRAINT `product_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (41,71,13,'Savic Picnic Bowls 1 - 300ml','https://i.dogspot.in/imgthumb/300x280-1365001091210.jpg',120,4.6,'Colors may vary according to present inventory',120),(42,51,2,'Tea Tree Oil Anti-Dandruff Pet Shampoo 500 ml','https://i.dogspot.in/imgthumb/300x280-1355403583613.jpg',300,4.3,'Tea Tree Oil Anti Dandruff Shampoo is a special shampoo to meet the dry skin needs of your pets. Made with the natural tea tree oil, the shampoo is gentle on the skin and nourishes the skin. Dry skin causes dandruff which can cause irritation and itching. Tea Tree oil Anti Dandruff Pet Shampoo keeps the skin moisturised and does not cause any rashes on the skin. The neem and tulsi are natural antiseptics and soothe the skin that has been damaged due to dandru',200),(43,31,19,'Dibaq Sense Salmon Adult Canned Dog Food - 380 gm','https://i.dogspot.in/imgthumb/300x280-77526005616133807710.jpg',310,4.6,'Dibaq Sense Salmon Adult Canned Dog Food - 380 gm',201),(44,31,19,'Dibaq DNM Salmon & Rice Adult Dog Food','https://i.dogspot.in/imgthumb/300x280-82593529416159623170.jpg',1850,4.7,'Natural food for small breed adult dogs with medium-high levels of physical activity, prepared with carefully selected natural ingredients. Product description Extruded croquette, brown-coloured, bone-shaped, 11-14 mm in diameter and 5-6 mm thick. SMALL CRUNCHY CROQUETTES. SPECIAL DESIGN, DENTAL HEALTH FATTY ACIDS, BIOTIN AND ZINC, TO CARE FOR THE SKIN AND COAT WITH INULIN, A PREBIOTIC BENEFICIAL FOR INTESTINAL FLORA Composition: Chicken (35%), corn, rice (10%), chicken oil, poultry protein hydrolysate, potato starch, dehydrated fish (source of omega 3 and omega 6 fatty acids), egg, carob, salt, brewers yeast, natural plant extracts (melissa 0.01%,, yucca 0.02%), citric extracts (source of natural antioxidants), chicory root 0.1% (source of inulin).',50),(46,31,1,'Pedigree Dog Food Active Adult Professional - 10 Kg','https://i.dogspot.in/imgthumb/300x280-131940020114714225143.jpg',3000,4.8,'Adult Dog Weight in kgs	For Active Dogs (Gm/D)	Pregnant 6 wk (Gm/D)	Pregnant 7 wk (Gm/D) 5 10 kg	125-200	125-225	150-275 10-25 kg	200-400	225-475	275-525 25-30 kg	400-700	475-775	525-900 50-70 kg	700-875	775-1000	900-1150 70-90 kg	875-1050	1000-1225	1150-1400 Adult Dog Weight in kgs	Pregnant 8 wk Lactating 1-2 & 5-6 wk (Gm/D)	Lactating wk 3-4 (Gm/D) 5 -10 kg	175-300	425-725 10-25 kg	300-625	725-1425 25-30 kg	625-1025	1425-2400 50-70 kg	1025-1325	2400-3050 70-90 kg	1325-1600	3050-3700',20);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `pid` int NOT NULL,
  `purchasedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deliverydate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_uid_idx` (`uid`),
  KEY `purchase_pid_idx` (`pid`),
  CONSTRAINT `purchase_pid` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `radata`
--

DROP TABLE IF EXISTS `radata`;
/*!50001 DROP VIEW IF EXISTS `radata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `radata` AS SELECT 
 1 AS `id`,
 1 AS `pid`,
 1 AS `fname`,
 1 AS `lname`,
 1 AS `rating`,
 1 AS `review`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `pid` int NOT NULL,
  `rating` int NOT NULL,
  `review` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rproduct_idx` (`pid`),
  KEY `ruser_idx` (`user`),
  CONSTRAINT `rproduct` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ruser` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `thumbnail` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (11,'Pet boarding','https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/petservices%2Fboarding2.jpg?alt=media&token=3df9e539-26b7-4dd9-9f01-30a40e5fe2e8','Pet boarding is when your dog stays at a boarding facility with other dogs. These places provide your dog with a kennel or sleeping area to stay in and have staff available for walks.'),(21,'Pet sitting','https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/petservices%2Fpetsitting.jpg?alt=media&token=94d671e3-5075-4a7e-abb7-1e35f41f8cd6','We supervise or care your pets while you are away from home. Key responsibilities include providing food and water.'),(31,'Pet grooming','https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/petservices%2Fgrooming.jpg?alt=media&token=9ec1c675-2e90-4f75-8301-716e73136231','we provide hygienic care and cleaning of a pet. This session consists of a pet being brushed, bathed, and dried as well as trimmed or clipped.'),(41,'Pet walking','https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/petservices%2Fwalking.jpg?alt=media&token=b4aea7d0-bb38-4a56-ac09-aef4ef62fd1d','We provide a walker that will walk with the dog from the pet\'s residence and then returning. It includes exercise and companionship.'),(51,'Pet day care','https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/petservices%2Fdaycare.jpg?alt=media&token=ff90c643-4fc5-435d-aa79-2be51d7c4797','In Daycare we provide, short-term daytime care for dogs, Parents, or in the case of the dog daycare, owners, have a busy schedule.'),(61,'Pet training','https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/petservices%2Fpettraining.jpg?alt=media&token=a5831f24-cde1-480f-b35c-55eae083a8b9','We provide proper training to your pets. we provide positive reinforcement, scientific training, clicker training, electronic training, mirror training, alpha dog or dominance training, relationship-based training'),(71,'Pet doctor','https://firebasestorage.googleapis.com/v0/b/petpeaker-4a4fa.appspot.com/o/petservices%2Fpetdoctor.jpg?alt=media&token=586885dc-8a60-4a90-99a9-38fe1d6fc9d7','we provide a pet doctor for your pet. Customers can easily book it and they will serve at customer authorized location.');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfeatures`
--

DROP TABLE IF EXISTS `sfeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfeatures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spid` int NOT NULL,
  `feature` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sf_id_idx` (`spid`),
  CONSTRAINT `sf_id` FOREIGN KEY (`spid`) REFERENCES `splans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfeatures`
--

LOCK TABLES `sfeatures` WRITE;
/*!40000 ALTER TABLE `sfeatures` DISABLE KEYS */;
INSERT INTO `sfeatures` VALUES (1,1,'hair dressing for your pet'),(2,2,'head massage for your pet'),(3,1,'Dog bathing in tub'),(4,2,'Dog checkup'),(5,2,'Dog monthly checkup');
/*!40000 ALTER TABLE `sfeatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `size` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `psize_idx` (`pid`),
  CONSTRAINT `psize` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (13,41,'300ml'),(14,42,'500ml'),(15,43,'380gm'),(16,44,'3Kg');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splans`
--

DROP TABLE IF EXISTS `splans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `splans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` int NOT NULL,
  `plan` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `discount` int NOT NULL DEFAULT '0',
  `about` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `s_plan_idx` (`sid`),
  CONSTRAINT `s_plan` FOREIGN KEY (`sid`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `splans`
--

LOCK TABLES `splans` WRITE;
/*!40000 ALTER TABLE `splans` DISABLE KEYS */;
INSERT INTO `splans` VALUES (1,11,'noob',1000,0,'This plan is not for people having small PP. So just fuck off'),(2,11,'pro',2000,0,'This plan is not for people having small PP. So just fuck off');
/*!40000 ALTER TABLE `splans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `s_id` int NOT NULL,
  `designation` int NOT NULL,
  `experiance` int NOT NULL DEFAULT '0',
  `salary` int DEFAULT NULL,
  `joiningdate` datetime DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staff_data`
--

DROP TABLE IF EXISTS `staff_data`;
/*!50001 DROP VIEW IF EXISTS `staff_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staff_data` AS SELECT 
 1 AS `id`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `email`,
 1 AS `gender`,
 1 AS `password`,
 1 AS `loginstatus`,
 1 AS `mode`,
 1 AS `active`,
 1 AS `designation`,
 1 AS `experiance`,
 1 AS `salary`,
 1 AS `joiningdate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (11,'Punjab'),(21,'chandigarh(UT)'),(31,'haryana'),(41,'delhi(NCT)');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` tinyint DEFAULT '1',
  `password` varchar(230) NOT NULL,
  `loginstatus` tinyint DEFAULT '1',
  `mode` int DEFAULT '0',
  `active` tinyint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (61,'harshit','ahuja','webmasterprojects2001@gmail.com',0,'flmvwa4gatAA9k3DKH//TxDHjYTJu2j3D1Fo04i30AM=',1,100,1),(71,'harshit','ahuja','harshitahuja2091@gmail.com',0,'mhvrVm7MO/bLmTxAXDlAEbAvk8Y0UuOG9KQe1//AY8o=',1,150,1),(81,'abhshek','kumar','webmasters2091@gmail.com',0,'mhvrVm7MO/bLmTxAXDlAEbAvk8Y0UuOG9KQe1//AY8o=',1,1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_user_idx` (`uid`),
  CONSTRAINT `address_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (31,61,'dharampur');
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!50001 DROP VIEW IF EXISTS `userdata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `userdata` AS SELECT 
 1 AS `id`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `email`,
 1 AS `address`,
 1 AS `gender`,
 1 AS `password`,
 1 AS `loginstatus`,
 1 AS `mode`,
 1 AS `accnumber`,
 1 AS `ifsc`,
 1 AS `bank`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `whishlist`
--

DROP TABLE IF EXISTS `whishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `pid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uidwhishlist_idx` (`uid`),
  KEY `pidwhishlist_idx` (`pid`),
  CONSTRAINT `pidwhishlist` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `uidwhishlist` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whishlist`
--

LOCK TABLES `whishlist` WRITE;
/*!40000 ALTER TABLE `whishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!50001 DROP VIEW IF EXISTS `wishlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wishlist` AS SELECT 
 1 AS `id`,
 1 AS `uid`,
 1 AS `category`,
 1 AS `brand`,
 1 AS `pname`,
 1 AS `thumbnail`,
 1 AS `price`,
 1 AS `rating`,
 1 AS `note`,
 1 AS `qty`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `admin-breed`
--

/*!50001 DROP VIEW IF EXISTS `admin-breed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin-breed` AS select `bd`.`id` AS `id`,`p`.`pet` AS `pet`,`bd`.`breed` AS `breed`,`bd`.`thumbnail` AS `thumbnail`,`bd`.`gender` AS `gender`,`bd`.`price` AS `price`,`bd`.`stock` AS `stock` from (`breeds` `bd` join `pets` `p` on((`p`.`id` = `bd`.`petid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `admin-product`
--

/*!50001 DROP VIEW IF EXISTS `admin-product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin-product` AS select `pd`.`id` AS `id`,`ct`.`name` AS `category`,`br`.`name` AS `brand`,`pd`.`pname` AS `pname`,`pd`.`thumbnail` AS `thumbnail`,`pd`.`price` AS `price`,`pd`.`rating` AS `rating`,`pd`.`note` AS `note`,`pd`.`qty` AS `qty` from ((`products` `pd` join `category` `ct` on((`pd`.`category` = `ct`.`id`))) join `brands` `br` on((`br`.`id` = `pd`.`brand`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `admin-purchase`
--

/*!50001 DROP VIEW IF EXISTS `admin-purchase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin-purchase` AS select `pr`.`id` AS `id`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`email` AS `email`,`pd`.`pname` AS `pname`,`pr`.`purchasedate` AS `purchasedate`,`pr`.`deliverydate` AS `deliverydate` from ((`purchase` `pr` join `products` `pd` on((`pr`.`pid` = `pd`.`id`))) join `user` `u` on((`u`.`id` = `pr`.`uid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `breeddata`
--

/*!50001 DROP VIEW IF EXISTS `breeddata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `breeddata` AS select `breeds`.`id` AS `id`,`breeds`.`petid` AS `pet`,`breeds`.`thumbnail` AS `thumbnail`,`breeds`.`gender` AS `gender`,`breeds`.`breed` AS `breed`,`breeds`.`price` AS `price` from `breeds` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cart_item`
--

/*!50001 DROP VIEW IF EXISTS `cart_item`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cart_item` AS select `c`.`uid` AS `uid`,`p`.`id` AS `pid`,`p`.`pname` AS `name`,`p`.`thumbnail` AS `thumbnail`,`p`.`price` AS `price`,`co`.`color` AS `color`,`ff`.`flavor` AS `flavor`,`sz`.`size` AS `size` from (((((((`cart` `c` left join `ci_color` `cc` on((`c`.`id` = `cc`.`cart`))) left join `ci_flavor` `cif` on((`cif`.`cart` = `c`.`id`))) join `products` `p` on((`p`.`id` = `c`.`pid`))) left join `color` `co` on((`co`.`id` = `cc`.`color`))) left join `flavor` `ff` on((`ff`.`id` = `cif`.`flavor`))) left join `ci_size` `ciz` on((`ciz`.`cart` = `c`.`id`))) left join `size` `sz` on((`sz`.`id` = `ciz`.`size`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cartview`
--

/*!50001 DROP VIEW IF EXISTS `cartview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cartview` AS select `p`.`id` AS `id`,`w`.`uid` AS `uid`,`p`.`category` AS `category`,`p`.`brand` AS `brand`,`p`.`pname` AS `pname`,`p`.`thumbnail` AS `thumbnail`,`p`.`price` AS `price`,`p`.`rating` AS `rating`,`p`.`note` AS `note`,`p`.`qty` AS `qty` from (`cart` `w` join `products` `p`) where (`w`.`pid` = `p`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `charges`
--

/*!50001 DROP VIEW IF EXISTS `charges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `charges` AS select `sp`.`id` AS `planid`,`sp`.`sid` AS `service`,`sp`.`plan` AS `plan`,`sp`.`discount` AS `discount`,`sp`.`price` AS `price`,`sf`.`feature` AS `feature`,`sp`.`about` AS `about` from (`splans` `sp` join `sfeatures` `sf` on((`sp`.`id` = `sf`.`spid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `instance_accessibility`
--

/*!50001 DROP VIEW IF EXISTS `instance_accessibility`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `instance_accessibility` AS select `m`.`category` AS `category`,`i`.`instance` AS `instance`,`am`.`url` AS `url`,`am`.`mode` AS `mode` from ((`instances` `i` join `modal` `m` on((`i`.`category` = `m`.`id`))) join `accessmodes` `am` on((`i`.`access` = `am`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pdata`
--

/*!50001 DROP VIEW IF EXISTS `pdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`developer`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pdata` AS select `p`.`id` AS `id`,`p`.`pname` AS `pname`,`br`.`name` AS `brand`,`p`.`thumbnail` AS `thumbnail`,`p`.`price` AS `price`,`p`.`rating` AS `rating`,`p`.`note` AS `note`,`p`.`qty` AS `qty` from ((`category` `c` join `products` `p` on((`p`.`category` = `c`.`id`))) join `brands` `br` on((`p`.`brand` = `br`.`id`))) where (0 <> `p`.`price`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `petdata`
--

/*!50001 DROP VIEW IF EXISTS `petdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `petdata` AS select `p`.`id` AS `petid`,`p`.`pet` AS `pet`,`p`.`pic` AS `pic`,`b`.`id` AS `bid`,`b`.`breed` AS `breed` from (`pets` `p` join `breeds` `b` on((`p`.`id` = `b`.`petid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `radata`
--

/*!50001 DROP VIEW IF EXISTS `radata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`developer`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `radata` AS select `u`.`id` AS `id`,`r`.`pid` AS `pid`,`u`.`firstname` AS `fname`,`u`.`lastname` AS `lname`,`r`.`rating` AS `rating`,`r`.`review` AS `review` from (`rating` `r` join `user` `u` on((`r`.`user` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_data`
--

/*!50001 DROP VIEW IF EXISTS `staff_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_data` AS select `u`.`id` AS `id`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`email` AS `email`,`u`.`gender` AS `gender`,`u`.`password` AS `password`,`u`.`loginstatus` AS `loginstatus`,`u`.`mode` AS `mode`,`u`.`active` AS `active`,`s`.`designation` AS `designation`,`s`.`experiance` AS `experiance`,`s`.`salary` AS `salary`,`s`.`joiningdate` AS `joiningdate` from (`user` `u` join `staff` `s`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userdata`
--

/*!50001 DROP VIEW IF EXISTS `userdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`developer`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userdata` AS select `u`.`id` AS `id`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`email` AS `email`,`ua`.`address` AS `address`,`u`.`gender` AS `gender`,`u`.`password` AS `password`,`u`.`loginstatus` AS `loginstatus`,`u`.`mode` AS `mode`,`o`.`accnumber` AS `accnumber`,`o`.`ifsc` AS `ifsc`,`o`.`bank` AS `bank` from ((`user` `u` left join `bank_details` `o` on((`u`.`id` = `o`.`id`))) left join `user_address` `ua` on((`ua`.`uid` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wishlist`
--

/*!50001 DROP VIEW IF EXISTS `wishlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wishlist` AS select `p`.`id` AS `id`,`w`.`uid` AS `uid`,`p`.`category` AS `category`,`p`.`brand` AS `brand`,`p`.`pname` AS `pname`,`p`.`thumbnail` AS `thumbnail`,`p`.`price` AS `price`,`p`.`rating` AS `rating`,`p`.`note` AS `note`,`p`.`qty` AS `qty` from (`whishlist` `w` join `products` `p`) where (`w`.`pid` = `p`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18 12:15:02

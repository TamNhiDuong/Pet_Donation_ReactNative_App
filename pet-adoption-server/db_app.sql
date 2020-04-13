-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: petAdoption
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) NOT NULL,
  `date_order` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` float NOT NULL DEFAULT '0',
  `note` text,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `f1` (`id_customer`),
  CONSTRAINT `f1` FOREIGN KEY (`id_customer`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (34,7,'2017-04-15 07:14:16',292,NULL,0);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bill` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` float DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `f2` (`id_bill`),
  KEY `f3` (`id_product`),
  CONSTRAINT `f2` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id`),
  CONSTRAINT `f3` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
INSERT INTO `bill_detail` VALUES (13,34,33,3,157),(14,34,34,3,135);
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `f5` (`id_product`),
  CONSTRAINT `f5` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (54,'54.jpg',29),(55,'55.jpg',29),(56,'56.jpg',30),(57,'57.jpg',30),(58,'58.jpg',31),(59,'59.jpg',31),(60,'60.jpg',32),(61,'61.jpg',32),(62,'62.jpg',33),(63,'63.jpg',33),(64,'64.jpg',34),(65,'65.jpg',34);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `price` float DEFAULT '0',
  `color` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `new` tinyint(4) NOT NULL DEFAULT '0',
  `readyForAdopt` tinyint(1) NOT NULL DEFAULT '0',
  `vaccinatedLastTime` varchar(255) DEFAULT '25th March 2020',
  `weight` varchar(255) DEFAULT '3 kilogram',
  `gender` varchar(255) DEFAULT 'female',
  
  PRIMARY KEY (`id`),
  KEY `f4` (`id_type`),
  CONSTRAINT `f4` FOREIGN KEY (`id_type`) REFERENCES `product_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES 
(29,'Kiki',4,5,'Brown','Young','Kiki suffered from mange, parasites, bacterial infections and malnutrition Thanks to the love and care of a veterinary clinic, she not only survived by thrived..',1,1,'25th March 2020', '3 kilogram', 'female'),
(30,'Koko',4,5,'White','Full grown','Koko was found in Ohio on the side of the road eating a dead skunk with her sister. A kind woman took the dogs in, cleaned them up, and set her up for a long journey to HCM city.',1,1,'25th March 2020', '3 kilogram', 'female'),
(31,'Bum',4,6,'Brown','Young','Bum was born with a heredity condition that caused a deformity, and the man trying to sell him outside of a grocery store simply left him there when nobody wanted him.',1,1,'25th March 2020', '3 kilogram', 'female'),
(32,'Bom',4,7,'Wheat','Young','The dog\'s owner had passed, and his son took her, but didn\'t really want her. She had been chained to a tree with only a small wire kennel as her shelter with no food or water, and she could barely even walk.',1,1,'25th March 2020', '3 kilogram', 'female'),
(33,'Musti',5,8,'Black','Old','Musti was found on the streets of HCM city as a stray, he had several wounds and injuries from being attacked by a dog. ',1,1,'25th March 2020', '3 kilogram', 'female'),
(34,'Moon',6,3,'Mix','Young','Moon was hit by a car and had to learn to live with three legs, a volunteer took him home for some much-needed TLC and strength training.',1,1,'25th March 2020', '3 kilogram', 'female');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (4,'Dog','dog.jpg'),(5,'Cat','cat.jpg'),(6,'Others','bunny.jpg');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'huong@gmail.com','c4ca4238a0b923820dcc509a6f75849b',NULL,NULL,NULL),(2,'','d41d8cd98f00b204e9800998ecf8427e','',NULL,NULL),(4,'huonggg@gmail.com','c4ca4238a0b923820dcc509a6f75849b','huong',NULL,NULL),(6,'huonggssssg@gmail.com','c4ca4238a0b923820dcc509a6f75849b','huong',NULL,NULL),(7,'huossssggag@gmail.com','c4ca4238a0b923820dcc509a6f75849b','Hương siêu nhân','234567890','123343 lê thị riêng');
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

-- Dump completed on 2020-04-12 17:39:07

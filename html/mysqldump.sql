-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: project1
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `project1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `project1` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `project1`;

--
-- Table structure for table `discription`
--

DROP TABLE IF EXISTS `discription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discription` (
  `item_no` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`item_no`),
  CONSTRAINT `fk_dis` FOREIGN KEY (`item_no`) REFERENCES `items` (`item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discription`
--

LOCK TABLES `discription` WRITE;
/*!40000 ALTER TABLE `discription` DISABLE KEYS */;
INSERT INTO `discription` VALUES (1,'this is laptop by HP it is available in 360 models and it is customizable'),(2,'this is laptop by DELL it is very old in comaparition but on other hand it is available for very low price'),(3,'samsung galaxy s8 it has edge screen looks amazing and also powerfull'),(4,'Apple iphone 11 available only in our store all screen phone'),(6,'its a world famous jersey made in new jersey'),(7,'this is solar powerd wireless keyboard only available if you are student of njit'),(8,'this headset made specially for DJs try it you will love it'),(9,'were it in your interview and you will get a job otherwise take your money back');
/*!40000 ALTER TABLE `discription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_no`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'envy360',45,800,'laptop'),(2,'inspiron5040',50,250,'laptop'),(3,'s8',50,750,'phone'),(4,'iphone11',50,1500,'phone'),(6,'jerseyyy',50,40,'cloth'),(7,'keyboard',200,15,'ace'),(8,'Sonyheadset508',75,250,'ace'),(9,'Black_suit36',67,124,'cloth');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lowwater`
--

DROP TABLE IF EXISTS `lowwater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lowwater` (
  `indexx` int(2) DEFAULT NULL,
  `markk` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lowwater`
--

LOCK TABLES `lowwater` WRITE;
/*!40000 ALTER TABLE `lowwater` DISABLE KEYS */;
INSERT INTO `lowwater` VALUES (1,50);
/*!40000 ALTER TABLE `lowwater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `item_no` int(11) DEFAULT NULL,
  `day` int(2) DEFAULT NULL,
  `month` int(2) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_no` int(3) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_no`),
  KEY `item_no` (`item_no`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`item_no`) REFERENCES `items` (`item_no`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (3,22,2,18,3750,'user',5,3),(2,22,2,18,750,'user1',3,4),(3,24,2,18,2250,'user',3,5),(4,24,2,18,3000,'user',2,6),(4,24,2,18,3000,'user',2,7),(3,24,2,18,750,'user',1,8),(3,24,2,18,750,'user',1,9),(3,24,2,18,750,'user',1,10),(3,24,2,18,750,'user',1,11),(1,24,2,18,2400,'shivam',3,12),(4,24,2,18,7500,'shivam',5,13),(6,1,3,18,200,'root',5,14),(6,1,3,18,200,'root',5,15),(4,1,3,18,4500,'shivam',3,16),(2,1,3,18,1250,'shivam',5,17),(6,1,3,18,200,'shivam',5,18),(1,1,3,18,4000,'shivam',5,19),(3,1,3,18,8250,'shivam',11,20),(1,1,3,18,4000,'user1',5,21),(7,1,3,18,3000,'user1',200,22);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('customer','827ccb0eea8a706c4c34a16891f84e7b'),('root','7b24afc8bc80e548d66c4e7ff72171c5'),('shivam','64a43b6ca15d128ac6a0679b39bc9c07'),('user','827ccb0eea8a706c4c34a16891f84e7b'),('user1','5f4dcc3b5aa765d61d8327deb882cf99');
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

-- Dump completed on 2018-03-01 19:26:57

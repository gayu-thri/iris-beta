CREATE DATABASE  IF NOT EXISTS `iris_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `iris_db`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: iris-se-database.mysql.database.azure.com    Database: iris_db
-- ------------------------------------------------------
-- Server version	5.6.42.0

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
-- Table structure for table `email_verification`
--

DROP TABLE IF EXISTS `email_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verification` (
  `f_email` varchar(50) NOT NULL,
  `acc_date` varchar(10) NOT NULL,
  `acc_time` varchar(15) NOT NULL,
  `otp` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`f_email`,`acc_date`,`acc_time`)
) /*!50100 TABLESPACE `innodb_system` */ ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verification`
--

LOCK TABLES `email_verification` WRITE;
/*!40000 ALTER TABLE `email_verification` DISABLE KEYS */;
INSERT INTO `email_verification` VALUES ('12345','2019-12-31','07:44:54','4321'),('egayu3@gmail.com','1/8/2020','1:05:07 PM','09623'),('rahul@mail.com','1/8/2020','7:04:53 PM','94940'),('srishilesh@gmail.com','1/17/2020','12:42:07 AM','66655'),('srishilesh@gmail.com','1/17/2020','12:43:41 AM','10616'),('srishilesh@gmail.com','1/17/2020','12:44:15 AM','64653'),('srishilesh@gmail.com','1/17/2020','12:44:25 AM','72797'),('srishilesh@gmail.com','1/4/2020','1:59:24 PM','02523'),('srishilesh@gmail.com','1/4/2020','2:10:38 PM','12002'),('srishilesh@gmail.com','1/4/2020','2:11:06 PM','56200'),('srishilesh@gmail.com','1/8/2020','1:45:06 PM','12345'),('srishilesh@gmail.com','1/8/2020','2:50:00 PM','67890');
/*!40000 ALTER TABLE `email_verification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-06 22:28:25

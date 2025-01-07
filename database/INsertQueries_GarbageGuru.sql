CREATE DATABASE  IF NOT EXISTS `p24_garbagegurudb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `p24_garbagegurudb`;

-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: p24_garbagegurudb
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `area_id` bigint NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Shivajinagar'),(2,'Kothrud'),(3,'Hinjewadi'),(4,'Wakad'),(5,'Baner'),(6,'Aundh'),(7,'Hadapsar'),(8,'Viman Nagar'),(9,'Kharadi'),(10,'Kondhwa');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'General Waste'),(2,'Recyclable Waste'),(3,'Organic Waste'),(4,'Hazardous Waste'),(5,'E-Waste'),(6,'Construction Waste '),(7,'Plastic Waste'),(8,'Metal Waste');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dustbin`
--

DROP TABLE IF EXISTS `dustbin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dustbin` (
  `dustbin_id` bigint NOT NULL AUTO_INCREMENT,
  `allocated_date` datetime(6) DEFAULT NULL,
  `dust_no` bigint DEFAULT NULL,
  `garbage_qty_in_kg` int DEFAULT NULL,
  `last_clean_date` datetime(6) DEFAULT NULL,
  `area_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`dustbin_id`),
  KEY `FKewbkwyryk4orm395bpdl66loi` (`area_id`),
  KEY `FK6neaasuam3gak7x7bn9g0s3dg` (`category_id`),
  KEY `FKekawtetfa09ybbje33hm66632` (`status_id`),
  KEY `FKt76xyc8h1gk8wyvbaiu8itg8n` (`user_id`),
  CONSTRAINT `FK6neaasuam3gak7x7bn9g0s3dg` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FKekawtetfa09ybbje33hm66632` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`),
  CONSTRAINT `FKewbkwyryk4orm395bpdl66loi` FOREIGN KEY (`area_id`) REFERENCES `address` (`area_id`),
  CONSTRAINT `FKt76xyc8h1gk8wyvbaiu8itg8n` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dustbin`
--

LOCK TABLES `dustbin` WRITE;
/*!40000 ALTER TABLE `dustbin` DISABLE KEYS */;
/*!40000 ALTER TABLE `dustbin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` bigint NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'0-10%'),(2,'11-20%'),(3,'21-30%'),(4,'31-40%'),(5,'41-50%'),(6,'51-60%'),(7,'61-70%'),(8,'71-80%'),(9,'81-90%'),(10,'91-100%');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `aadhar_no` varchar(255) NOT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKtes4yxiu2caq71t4kw8bx7mbi` (`aadhar_no`),
  UNIQUE KEY `UKpwrpg821nujmmnavoq7s420jn` (`email_id`),
  UNIQUE KEY `UKk8d0f2n7n88w1a16yhua64onx` (`user_name`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'12365478912','987456321','admin@gmail.com','Admin','Admin','admin123','admin',2),(2,'1234567890121','1234567890','john1@example.com','John','Doe','password123','john_doe1',1),(3,'123412341234','1234567891','mayuri@gmail.com','mayuri','tate','mayuri@123','mayuritate',1),(4,'1234567890178','1234567855','sachine@example.com','sachin','holekar','456@123','sachin1',1),(5,'147852369124','9547851525','sayali@gmail.com','sayali','bhavsar','sayali@123','sayalib302',1),(6,'254789652525','8457269541','mugdha@gmail.com','mugdha','goupale','mugdha@123','mugdha123',1),(8,'987545455445','9634789521','prerna@gmail.com','prerna','patil','prerna@123','prerna123',1);
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

-- Dump completed on 2025-01-06 14:48:13

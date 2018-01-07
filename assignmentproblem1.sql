DROP SCHEMA IF EXISTS `assignmentproblem1`;
CREATE SCHEMA `assignmentproblem1` ;

-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: assignmentproblem1
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `cost`
--

USE `assignmentproblem1`;

DROP TABLE IF EXISTS `cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost` (
  `dc_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `cost` double NOT NULL,
  KEY `fk_dc_id_idx` (`dc_id`),
  KEY `fk_store_id_idx` (`store_id`),
  CONSTRAINT `fk_dc_id` FOREIGN KEY (`dc_id`) REFERENCES `dcs` (`dc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost`
--

LOCK TABLES `cost` WRITE;
/*!40000 ALTER TABLE `cost` DISABLE KEYS */;
INSERT INTO `cost` VALUES (0,0,500),(0,1,350),(0,2,250),(0,3,1300),(0,5,750),(1,0,600),(1,1,200),(1,2,500),(1,4,850),(1,5,900),(2,0,250),(2,2,175),(2,3,300),(2,4,500),(2,5,400),(3,1,875),(3,2,1000),(3,3,1100),(3,4,900),(4,0,1000),(4,1,450),(4,3,900),(4,4,300),(4,5,800);
/*!40000 ALTER TABLE `cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcs`
--

DROP TABLE IF EXISTS `dcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcs` (
  `dc_id` bigint(20) NOT NULL,
  `capacity` bigint(20) NOT NULL,
  PRIMARY KEY (`dc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcs`
--

LOCK TABLES `dcs` WRITE;
/*!40000 ALTER TABLE `dcs` DISABLE KEYS */;
INSERT INTO `dcs` VALUES (0,10),(1,20),(2,5),(3,15),(4,10);
/*!40000 ALTER TABLE `dcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `dc_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `truckloads` bigint(20) NOT NULL,
  KEY `fk_dc_id_idx` (`dc_id`),
  KEY `fk_store_id_idx` (`store_id`),
  CONSTRAINT `fk_dc_id_results` FOREIGN KEY (`dc_id`) REFERENCES `dcs` (`dc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_store_id_results` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `store_id` bigint(20) NOT NULL,
  `requirements` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (0,5),(1,4),(2,7),(3,8),(4,5),(5,5);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-12 22:44:20

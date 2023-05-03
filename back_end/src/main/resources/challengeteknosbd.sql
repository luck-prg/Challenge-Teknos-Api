-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: challengeteknos
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` bigint NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `preview` varchar(200) DEFAULT NULL,
  `size` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `tekmail_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgjtdriho19isurr3qook9k9il` (`tekmail_id`),
  CONSTRAINT `FKgjtdriho19isurr3qook9k9il` FOREIGN KEY (`tekmail_id`) REFERENCES `tek_mails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,'diagrama',NULL,'4mb','png','fulanito.com',2),(2,'diagrama',NULL,'4mb','png','fulanito.com',3),(3,'diagrama',NULL,'4mb','png','fulanito.com',4);
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments_seq`
--

DROP TABLE IF EXISTS `attachments_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments_seq`
--

LOCK TABLES `attachments_seq` WRITE;
/*!40000 ALTER TABLE `attachments_seq` DISABLE KEYS */;
INSERT INTO `attachments_seq` VALUES (101);
/*!40000 ALTER TABLE `attachments_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` VALUES (1,'move_to_inbox','inbox','Inbox'),(2,'send','sent','Sent'),(3,'drafts','drafts','Drafts'),(4,'info','spam','Spam'),(5,'delete','trash','Trash'),(6,'star','starred','Starred'),(7,'label','important','Important');
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_seq`
--

DROP TABLE IF EXISTS `folders_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folders_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_seq`
--

LOCK TABLES `folders_seq` WRITE;
/*!40000 ALTER TABLE `folders_seq` DISABLE KEYS */;
INSERT INTO `folders_seq` VALUES (1);
/*!40000 ALTER TABLE `folders_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels` (
  `label_id` bigint NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  KEY `FKs8vj7o8co3q6scvdusr16lpcu` (`label_id`),
  CONSTRAINT `FKs8vj7o8co3q6scvdusr16lpcu` FOREIGN KEY (`label_id`) REFERENCES `tek_mails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
INSERT INTO `labels` VALUES (1,'label1'),(1,'label2'),(2,'label1'),(2,'label2'),(3,'label1'),(3,'label2'),(4,'label1'),(4,'label2');
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` bigint NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'assets/images/avatars/vincent.jpg','lawrencecollins@creapond.com','Luciano Alejo'),(2,NULL,'johndoe@creapond.com','me'),(3,NULL,'joshuad@creapond.com','joshua'),(4,'assets/images/avatars/vincent.jpg','lawrencecollins@creapond.com','Juan de garbarino');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas_seq`
--

DROP TABLE IF EXISTS `personas_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas_seq`
--

LOCK TABLES `personas_seq` WRITE;
/*!40000 ALTER TABLE `personas_seq` DISABLE KEYS */;
INSERT INTO `personas_seq` VALUES (101);
/*!40000 ALTER TABLE `personas_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptores`
--

DROP TABLE IF EXISTS `receptores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receptores` (
  `tekmail_id` bigint NOT NULL,
  `persona_id` bigint NOT NULL,
  KEY `FKc0xuqqu779hj336wtesk15n7s` (`persona_id`),
  KEY `FKg0qfpd7084qqxxoordtc5g89o` (`tekmail_id`),
  CONSTRAINT `FKc0xuqqu779hj336wtesk15n7s` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `FKg0qfpd7084qqxxoordtc5g89o` FOREIGN KEY (`tekmail_id`) REFERENCES `tek_mails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptores`
--

LOCK TABLES `receptores` WRITE;
/*!40000 ALTER TABLE `receptores` DISABLE KEYS */;
INSERT INTO `receptores` VALUES (1,2),(1,3),(2,2),(2,3),(3,2),(3,3),(4,2),(4,3);
/*!40000 ALTER TABLE `receptores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tek_mails`
--

DROP TABLE IF EXISTS `tek_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tek_mails` (
  `id` bigint NOT NULL,
  `draft_c` tinyint(1) DEFAULT '0',
  `has_attachments_c` tinyint(1) DEFAULT '0',
  `important_c` tinyint(1) DEFAULT '0',
  `message_c` text,
  `read_c` tinyint(1) DEFAULT '0',
  `spam_c` tinyint(1) DEFAULT '0',
  `starred_c` tinyint(1) DEFAULT '0',
  `subject_c` text,
  `time_c` varchar(255) DEFAULT NULL,
  `trash_c` tinyint(1) DEFAULT '0',
  `emisor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKch0d9py5hwxu01nifmggwqijh` (`emisor_id`),
  CONSTRAINT `FKch0d9py5hwxu01nifmggwqijh` FOREIGN KEY (`emisor_id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tek_mails`
--

LOCK TABLES `tek_mails` WRITE;
/*!40000 ALTER TABLE `tek_mails` DISABLE KEYS */;
INSERT INTO `tek_mails` VALUES (1,0,0,1,'aca va un mensaje muy largo',1,0,1,'primer mail','28 Jun',0,1),(2,0,1,0,'aca va un mensaje muy largo',0,0,0,'primer mail','28 Jun',0,1),(3,0,1,0,'aca va un mensaje muy largo',0,1,0,'obtenga una casa Gratis','28 Jun',0,4),(4,0,1,0,'aca va un mensaje muy largo',0,0,0,'obtenga una casa gratis','28 Jun',0,4);
/*!40000 ALTER TABLE `tek_mails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tek_mails_seq`
--

DROP TABLE IF EXISTS `tek_mails_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tek_mails_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tek_mails_seq`
--

LOCK TABLES `tek_mails_seq` WRITE;
/*!40000 ALTER TABLE `tek_mails_seq` DISABLE KEYS */;
INSERT INTO `tek_mails_seq` VALUES (101);
/*!40000 ALTER TABLE `tek_mails_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-03 13:15:12

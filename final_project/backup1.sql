-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: irb2014
-- ------------------------------------------------------
-- Server version	5.7.15

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
-- Table structure for table `Tournament`
--

DROP TABLE IF EXISTS `Tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tournament` (
  `T_ID` int(11) NOT NULL AUTO_INCREMENT,
  `T_Name` varchar(5) NOT NULL,
  `T_Date` date NOT NULL,
  PRIMARY KEY (`T_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tournament`
--

LOCK TABLES `Tournament` WRITE;
/*!40000 ALTER TABLE `Tournament` DISABLE KEYS */;
INSERT INTO `Tournament` VALUES (1,'HK7s','2014-03-29'),(2,'L7s','2014-05-18'),(3,'D7s','2014-12-07'),(4,'GC7s','2014-10-11'),(5,'T7s','2014-04-05'),(6,'NZ7s','2014-02-07'),(7,'S7s','2014-05-11'),(8,'PE7s','2014-12-15'),(9,'USA7s','2014-02-16');
/*!40000 ALTER TABLE `Tournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Team` (
  `Team_ID` int(11) NOT NULL,
  `Team_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES (1,'Argentina 7s'),(2,'American Samoa 7s'),(3,'Australia 7s'),(4,'Belgium 7s'),(5,'Brazil 7s'),(6,'Canada 7s'),(7,'England 7s'),(8,'Fiji 7s'),(9,'France 7s'),(10,'Hong Kong'),(11,'Japan 7s'),(12,'Kenya 7s'),(13,'New Zealand 7s'),(14,'Papua New Guinea'),(15,'Portugal 7s'),(16,'South Africa 7s'),(17,'Russia 7s'),(18,'Samoa 7s'),(19,'Scotland 7s'),(20,'USA 7s'),(21,'Wales 7s'),(22,'Zimbabwe');
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Game`
--

DROP TABLE IF EXISTS `Game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Game` (
  `Game_ID` int(11) NOT NULL AUTO_INCREMENT,
  `T_ID` int(11) NOT NULL,
  `Team_1` int(11) NOT NULL,
  `Team_2` int(11) NOT NULL,
  `T_Game_Number` int(11) NOT NULL,
  `Game_Time` time NOT NULL,
  `Score_1` int(11) NOT NULL,
  `Score_2` int(11) NOT NULL,
  `Winner` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Game_ID`),
  KEY `T_ID` (`T_ID`),
  KEY `Team_1` (`Team_1`),
  KEY `Team_2` (`Team_2`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`T_ID`) REFERENCES `Tournament` (`T_ID`),
  CONSTRAINT `game_ibfk_2` FOREIGN KEY (`Team_1`) REFERENCES `Team` (`Team_ID`),
  CONSTRAINT `game_ibfk_3` FOREIGN KEY (`Team_2`) REFERENCES `Team` (`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Game`
--

LOCK TABLES `Game` WRITE;
/*!40000 ALTER TABLE `Game` DISABLE KEYS */;
INSERT INTO `Game` VALUES (1,1,8,13,45,'21:00:00',33,19,'Fiji 7s'),(2,1,16,18,44,'20:30:00',26,5,'South Africa 7s'),(3,1,3,20,43,'20:00:00',21,17,'Australia 7s'),(4,1,9,19,42,'19:30:00',5,26,'Scotland 7s'),(5,1,12,11,41,'19:00:00',26,7,'Kenya 7s'),(6,1,18,13,40,'18:08:00',14,15,'New Zealand 7s'),(7,1,8,16,39,'17:46:00',21,15,'Fiji 7s'),(8,1,20,1,38,'17:24:00',28,14,'USA 7s'),(9,1,7,3,37,'17:02:00',7,12,'Australia 7s'),(10,1,21,19,36,'16:40:00',0,34,'Scotland 7s'),(11,1,6,9,35,'16:18:00',19,38,'France 7s'),(12,1,4,11,34,'15:56:00',7,42,'Japan 7s'),(13,1,12,15,33,'15:34:00',21,0,'Kenya 7s'),(14,1,13,1,32,'14:04:00',31,21,'New Zealand 7s'),(15,1,20,18,31,'13:42:00',15,26,'Samoa 7s'),(16,1,16,3,30,'13:20:00',7,5,'South Africa 7s'),(17,1,8,7,29,'12:58:00',14,12,'Fiji 7s'),(18,1,19,11,28,'12:36:00',28,7,'Scotland 7s'),(19,1,21,4,27,'12:14:00',38,7,'Wales 7s'),(20,1,9,15,26,'11:52:00',26,14,'France 7s'),(21,1,6,12,25,'11:30:00',21,10,'Canada 7s'),(22,1,8,6,24,'19:48:00',45,0,'Fiji 7s'),(23,1,13,3,23,'19:26:00',14,5,'New Zealand 7s'),(24,1,16,9,22,'19:04:00',29,7,'South Africa 7s'),(25,1,20,7,21,'18:42:00',21,21,''),(26,1,18,4,20,'18:20:00',29,5,'Samoa 7s'),(27,1,19,15,19,'17:58:00',14,12,'Scotland 7s'),(28,1,1,11,18,'17:36:00',19,14,'Argentina 7s'),(29,1,12,21,17,'17:14:00',12,19,'Wales 7s'),(30,1,8,4,16,'15:46:00',38,7,'Fiji 7s'),(31,1,6,18,15,'15:24:00',19,24,'Samoa 7s'),(32,1,13,15,14,'15:02:00',24,24,''),(33,1,3,19,13,'14:40:00',21,5,'Australia 7s'),(34,1,16,11,12,'14:18:00',27,0,'South Africa 7s'),(35,1,9,1,11,'13:56:00',5,26,'Argentina 7s'),(36,1,20,21,10,'13:34:00',40,12,'USA 7s'),(37,1,7,12,9,'13:12:00',17,7,'England 7s'),(38,1,8,18,8,'22:44:00',38,12,'Fiji 7s'),(39,1,13,19,7,'22:22:00',26,7,'New Zealand 7s'),(40,1,16,1,6,'22:00:00',24,0,'South Africa 7s'),(41,1,20,12,5,'21:38:00',21,14,'USA 7s'),(42,1,6,4,4,'21:16:00',28,12,'Canada 7s'),(43,1,3,15,3,'20:54:00',33,5,'Australia 7s'),(44,1,9,11,2,'20:32:00',24,7,'France 7s'),(45,1,7,21,1,'20:10:00',26,19,'England 7s'),(46,2,3,20,45,'02:27:00',22,45,'USA 7s'),(47,2,8,7,44,'02:02:00',26,12,'Fiji 7s'),(48,2,16,13,43,'01:32:00',14,26,'New Zealand 7s'),(49,2,12,1,42,'01:02:00',26,12,'Kenya 7s'),(50,2,11,9,41,'00:22:00',21,19,'Japan 7s'),(51,2,20,7,40,'23:40:00',43,12,'USA 7s'),(52,2,8,3,39,'23:18:00',7,33,'Australia 7s'),(53,2,6,13,38,'22:56:00',15,33,'New Zealand 7s'),(54,2,16,19,37,'22:34:00',31,7,'South Africa 7s'),(55,2,1,21,36,'22:12:00',26,14,'Argentina 7s'),(56,2,18,12,35,'21:50:00',7,38,'Kenya 7s'),(57,2,9,5,34,'21:28:00',35,12,'France 7s'),(58,2,15,11,33,'21:06:00',21,26,'Japan 7s'),(59,2,7,13,32,'20:34:00',21,17,'England 7s'),(60,2,20,6,31,'20:12:00',29,10,'USA 7s'),(61,2,19,3,30,'19:50:00',19,31,'Australia 7s'),(62,2,8,16,29,'19:28:00',19,7,'Fiji 7s'),(63,2,21,5,28,'19:06:00',29,0,'Wales 7s'),(64,2,9,1,27,'18:44:00',14,17,'Argentina 7s'),(65,2,12,11,26,'18:22:00',24,12,'Kenya 7s'),(66,2,18,15,25,'18:00:00',33,14,'Samoa 7s'),(67,2,7,19,24,'02:46:00',19,22,'Scotland 7s'),(68,2,12,5,23,'02:24:00',19,14,'Kenya 7s'),(69,2,13,3,22,'02:02:00',24,10,'New Zealand 7s'),(70,2,21,11,21,'01:40:00',24,21,'Wales 7s'),(71,2,8,6,20,'01:18:00',31,14,'Fiji 7s'),(72,2,1,18,19,'00:56:00',10,19,'Samoa 7s'),(73,2,20,16,18,'00:34:00',21,12,'USA 7s'),(74,2,9,15,17,'00:12:00',26,19,'France 7s'),(75,2,7,5,16,'23:40:00',56,7,'England 7s'),(76,2,19,12,15,'23:18:00',26,12,'Scotland 7s'),(77,2,13,11,14,'22:56:00',26,14,'New Zealand 7s'),(78,2,3,21,13,'22:34:00',19,14,'Australia 7s'),(79,2,8,18,12,'22:12:00',26,12,'Fiji 7s'),(80,2,6,1,11,'21:50:00',26,5,'Canada 7s'),(81,2,20,15,10,'21:28:00',28,12,'USA 7s'),(82,2,16,9,9,'21:06:00',28,7,'South Africa 7s'),(83,2,7,12,8,'20:34:00',40,0,'England 7s'),(84,2,19,5,7,'20:12:00',19,14,'Scotland 7s'),(85,2,13,21,6,'19:50:00',38,0,'New Zealand 7s'),(86,2,3,11,5,'19:28:00',41,0,'Australia 7s'),(87,2,8,1,4,'19:06:00',24,19,'Fiji 7s'),(88,2,6,18,3,'18:44:00',17,14,'Canada 7s'),(89,2,20,9,2,'18:22:00',24,19,'USA 7s'),(90,2,16,15,1,'18:00:00',19,0,'South Africa 7s'),(91,3,3,16,45,'01:12:00',7,33,'South Africa 7s'),(92,3,8,13,44,'00:40:00',26,12,'Fiji 7s'),(93,3,19,1,43,'00:10:00',12,26,'Argentina 7s'),(94,3,9,18,42,'23:42:00',21,31,'Samoa 7s'),(95,3,6,12,41,'23:14:00',19,12,'Canada 7s'),(96,3,16,13,40,'22:17:00',28,0,'South Africa 7s'),(97,3,8,3,39,'21:55:00',24,29,''),(98,3,1,7,38,'21:33:00',21,19,'Argentina 7s'),(99,3,21,19,37,'21:11:00',7,31,'Scotland 7s'),(100,3,15,18,36,'19:44:00',14,19,'Samoa 7s'),(101,3,9,20,35,'19:22:00',24,15,'France 7s'),(102,3,5,12,34,'19:00:00',7,22,'Kenya 7s'),(103,3,6,11,33,'18:38:00',29,14,'Canada 7s'),(104,3,13,7,32,'17:06:00',29,7,'New Zealand 7s'),(105,3,16,1,31,'16:44:00',40,0,'South Africa 7s'),(106,3,3,19,30,'16:22:00',22,17,'Australia 7s'),(107,3,8,21,29,'16:00:00',31,17,'Fiji 7s'),(108,3,18,12,28,'15:36:00',40,5,'Samoa 7s'),(109,3,15,5,27,'15:14:00',19,0,'Portugal 7s'),(110,3,20,11,26,'14:52:00',14,12,'USA 7s'),(111,3,9,6,25,'14:30:00',42,19,'France 7s'),(112,3,7,3,24,'01:31:00',5,12,'Australia 7s'),(113,3,20,12,23,'01:09:00',26,17,'USA 7s'),(114,3,18,13,22,'00:47:00',0,41,'New Zealand 7s'),(115,3,19,11,21,'00:25:00',47,0,'Scotland 7s'),(116,3,8,1,20,'21:52:00',33,21,'Fiji 7s'),(117,3,9,5,19,'21:30:00',24,14,'France 7s'),(118,3,16,21,18,'21:08:00',12,5,'South Africa 7s'),(119,3,15,6,17,'20:46:00',26,7,'Portugal 7s'),(120,3,3,20,16,'19:36:00',26,10,'Australia 7s'),(121,3,7,12,15,'19:14:00',38,0,'England 7s'),(122,3,13,19,14,'18:52:00',43,0,'New Zealand 7s'),(123,3,18,11,13,'18:30:00',38,12,'Samoa 7s'),(124,3,1,9,12,'18:06:00',26,21,'Argentina 7s'),(125,3,8,5,11,'17:44:00',36,5,'Fiji 7s'),(126,3,21,15,10,'17:22:00',26,21,'Wales 7s'),(127,3,16,6,9,'17:00:00',24,12,'South Africa 7s'),(128,3,3,12,8,'16:36:00',29,12,'Australia 7s'),(129,3,7,20,7,'16:14:00',19,10,'England 7s'),(130,3,13,11,6,'15:52:00',36,0,'New Zealand 7s'),(131,3,18,19,5,'15:30:00',14,21,'Scotland 7s'),(132,3,1,5,4,'15:06:00',17,5,'Argentina 7s'),(133,3,8,9,3,'14:44:00',54,7,'Fiji 7s'),(134,3,21,6,2,'14:22:00',14,19,'Canada 7s'),(135,3,16,15,1,'14:00:00',36,0,'South Africa 7s'),(136,4,7,1,1,'09:50:00',19,21,'Argentina 7s'),(137,4,6,20,2,'10:12:00',15,17,'USA 7s'),(138,4,13,9,3,'10:34:00',36,7,'New Zealand 7s'),(139,4,18,11,4,'10:56:00',40,14,'Samoa 7s'),(140,4,16,21,5,'11:18:00',19,12,'South Africa 7s'),(141,4,12,2,6,'11:40:00',42,0,'Kenya 7s'),(142,4,8,19,7,'12:02:00',40,7,'Fiji 7s'),(143,4,3,15,8,'12:24:00',29,0,'Australia 7s'),(144,4,7,20,9,'12:51:00',14,7,'England 7s'),(145,4,6,1,10,'13:13:00',12,14,'Argentina 7s'),(146,4,13,11,11,'13:35:00',59,0,'New Zealand 7s'),(147,4,18,9,12,'13:57:00',19,12,'Samoa 7s'),(148,4,16,2,13,'14:39:00',48,0,'South Africa 7s'),(149,4,12,21,14,'15:01:00',19,24,'Wales 7s'),(150,4,8,15,15,'15:23:00',38,0,'Fiji 7s'),(151,4,3,19,16,'15:45:00',24,14,'Australia 7s'),(152,4,1,20,17,'16:07:00',26,12,'Argentina 7s'),(153,4,7,6,18,'16:29:00',19,12,'England 7s'),(154,4,9,11,19,'17:11:00',33,14,'France 7s'),(155,4,13,18,20,'17:33:00',28,17,'New Zealand 7s'),(156,4,21,2,21,'17:55:00',36,0,'Wales 7s'),(157,4,16,12,22,'18:17:00',45,0,'South Africa 7s'),(158,4,19,15,23,'18:39:00',21,21,''),(159,4,8,3,24,'19:01:00',35,12,'Fiji 7s'),(160,4,9,6,25,'09:20:00',21,19,'France 7s'),(161,4,19,2,26,'09:42:00',24,12,'Scotland 7s'),(162,4,20,11,27,'10:04:00',26,5,'USA 7s'),(163,4,12,15,28,'10:26:00',17,19,'Portugal 7s'),(164,4,13,7,29,'10:48:00',7,31,'England 7s'),(165,4,8,21,30,'11:10:00',31,10,'Fiji 7s'),(166,4,1,18,31,'11:32:00',21,24,'Samoa 7s'),(167,4,16,3,32,'11:54:00',12,10,'South Africa 7s'),(168,4,6,2,33,'12:20:00',50,0,'Canada 7s'),(169,4,11,12,34,'12:43:00',15,17,'Kenya 7s'),(170,4,9,19,35,'13:05:00',26,0,'France 7s'),(171,4,20,15,36,'13:27:00',33,0,'USA 7s'),(172,4,13,21,37,'14:09:00',39,5,'New Zealand 7s'),(173,4,1,3,38,'14:31:00',21,17,'Argentina 7s'),(174,4,7,8,39,'14:53:00',7,48,'Fiji 7s'),(175,4,18,16,40,'15:15:00',28,12,'Samoa 7s'),(176,4,6,12,41,'15:40:00',40,7,'Canada 7s'),(177,4,9,20,42,'16:17:00',15,31,'USA 7s'),(178,4,13,1,43,'16:47:00',36,21,'New Zealand 7s'),(179,4,7,16,44,'17:17:00',19,0,'England 7s'),(180,4,8,18,45,'17:49:00',31,24,'Fiji 7s'),(181,5,16,7,45,'19:00:00',14,21,'England 7s'),(182,5,8,6,44,'18:36:00',21,19,'Fiji 7s'),(183,5,19,13,43,'18:04:00',14,21,'New Zealand 7s'),(184,5,3,20,42,'17:35:00',12,17,''),(185,5,1,15,41,'17:06:00',7,12,'Portugal 7s'),(186,5,7,6,40,'16:44:00',14,5,'England 7s'),(187,5,8,16,39,'16:22:00',5,7,'South Africa 7s'),(188,5,9,13,38,'16:00:00',12,19,'New Zealand 7s'),(189,5,11,19,37,'15:38:00',5,14,'Scotland 7s'),(190,5,18,20,36,'15:16:00',5,22,'USA 7s'),(191,5,21,3,35,'14:54:00',12,17,'Australia 7s'),(192,5,10,15,34,'14:32:00',17,19,'Portugal 7s'),(193,5,1,12,33,'14:10:00',17,12,'Argentina 7s'),(194,5,13,6,32,'13:26:00',15,19,'Canada 7s'),(195,5,9,7,31,'13:04:00',0,10,'England 7s'),(196,5,16,19,30,'12:42:00',22,0,'South Africa 7s'),(197,5,8,11,29,'12:20:00',41,5,'Fiji 7s'),(198,5,15,20,28,'11:58:00',0,39,'USA 7s'),(199,5,18,10,27,'11:36:00',21,0,'Samoa 7s'),(200,5,12,3,26,'11:14:00',5,14,'Australia 7s'),(201,5,21,1,25,'10:52:00',14,7,'Wales 7s'),(202,5,9,11,24,'21:04:00',24,19,'France 7s'),(203,5,18,1,23,'20:42:00',26,26,''),(204,5,6,12,22,'20:20:00',26,10,'Canada 7s'),(205,5,16,20,21,'19:58:00',24,15,'South Africa 7s'),(206,5,19,15,20,'19:36:00',17,12,'Scotland 7s'),(207,5,13,3,19,'19:14:00',14,19,'Australia 7s'),(208,5,21,10,18,'18:52:00',31,5,'Wales 7s'),(209,5,8,7,17,'18:30:00',33,19,'Fiji 7s'),(210,5,1,9,16,'16:52:00',7,17,'France 7s'),(211,5,18,11,15,'16:30:00',12,26,'Japan 7s'),(212,5,20,6,14,'16:08:00',22,14,'USA 7s'),(213,5,16,12,13,'15:46:00',26,0,'South Africa 7s'),(214,5,3,19,12,'15:24:00',14,17,'Scotland 7s'),(215,5,13,15,11,'15:02:00',26,7,'New Zealand 7s'),(216,5,7,21,10,'14:40:00',10,7,'England 7s'),(217,5,8,10,9,'14:18:00',35,14,'Fiji 7s'),(218,5,1,11,8,'13:34:00',14,14,''),(219,5,18,9,7,'13:12:00',14,12,'Samoa 7s'),(220,5,20,12,6,'12:50:00',5,27,'Kenya 7s'),(221,5,16,6,5,'12:28:00',29,7,'South Africa 7s'),(222,5,3,15,4,'12:06:00',10,12,'Portugal 7s'),(223,5,13,19,3,'11:44:00',38,0,'New Zealand 7s'),(224,5,7,10,2,'11:22:00',33,0,'England 7s'),(225,5,8,21,1,'11:00:00',19,10,'Fiji 7s'),(226,6,7,13,45,'16:55:00',21,27,'New Zealand 7s'),(227,6,19,16,44,'16:23:00',7,40,'South Africa 7s'),(228,6,8,3,43,'15:53:00',24,0,'Fiji 7s'),(229,6,9,1,42,'15:23:00',29,5,'France 7s'),(230,6,18,6,41,'14:53:00',10,26,'Canada 7s'),(231,6,16,13,40,'13:37:00',7,17,'New Zealand 7s'),(232,6,19,7,39,'13:12:00',19,24,'England 7s'),(233,6,12,3,38,'12:46:00',5,21,'Australia 7s'),(234,6,20,8,37,'12:24:00',10,12,'Fiji 7s'),(235,6,1,15,36,'12:02:00',47,12,'Argentina 7s'),(236,6,9,21,35,'11:40:00',43,0,'France 7s'),(237,6,11,6,34,'11:18:00',21,28,'Canada 7s'),(238,6,18,14,33,'10:56:00',47,5,'Samoa 7s'),(239,6,13,3,32,'10:31:00',26,7,'New Zealand 7s'),(240,6,12,16,31,'10:10:00',5,19,'South Africa 7s'),(241,6,8,7,30,'09:49:00',21,26,''),(242,6,20,19,29,'09:28:00',15,19,'Scotland 7s'),(243,6,6,15,28,'09:03:00',0,26,'Portugal 7s'),(244,6,1,11,27,'08:42:00',38,5,'Argentina 7s'),(245,6,21,14,26,'08:21:00',41,0,'Wales 7s'),(246,6,9,18,25,'08:00:00',26,19,'France 7s'),(247,6,13,7,24,'17:00:00',24,5,'New Zealand 7s'),(248,6,6,14,23,'16:38:00',41,0,'Canada 7s'),(249,6,1,19,22,'16:16:00',14,21,'Scotland 7s'),(250,6,12,18,21,'15:54:00',28,14,'Kenya 7s'),(251,6,3,8,20,'14:54:00',5,14,'Fiji 7s'),(252,6,21,15,19,'14:32:00',20,12,'Wales 7s'),(253,6,16,20,18,'14:10:00',26,14,'South Africa 7s'),(254,6,9,11,17,'13:48:00',35,17,'France 7s'),(255,6,7,6,16,'13:26:00',27,5,'England 7s'),(256,6,13,14,15,'13:04:00',38,7,'New Zealand 7s'),(257,6,19,12,14,'12:42:00',14,19,'Kenya 7s'),(258,6,1,18,13,'12:20:00',21,21,''),(259,6,8,21,12,'11:58:00',42,19,'Fiji 7s'),(260,6,3,15,11,'11:36:00',29,0,'Australia 7s'),(261,6,20,9,10,'11:14:00',38,7,'USA 7s'),(262,6,16,11,9,'10:52:00',24,7,'South Africa 7s'),(263,6,7,14,8,'10:30:00',29,0,'England 7s'),(264,6,13,6,7,'10:08:00',26,5,'New Zealand 7s'),(265,6,19,18,6,'09:46:00',14,12,'Scotland 7s'),(266,6,1,12,5,'09:24:00',31,7,'Argentina 7s'),(267,6,8,15,4,'09:03:00',31,19,'Fiji 7s'),(268,6,3,21,3,'08:42:00',36,5,'Australia 7s'),(269,6,20,11,2,'08:21:00',40,5,'USA 7s'),(270,6,16,9,1,'08:00:00',5,22,'France 7s'),(271,7,8,13,45,'03:50:00',24,17,'Fiji 7s'),(272,7,20,7,44,'03:16:00',19,24,'England 7s'),(273,7,16,19,43,'02:48:00',12,10,'South Africa 7s'),(274,7,21,1,42,'02:20:00',12,7,'Wales 7s'),(275,7,18,15,41,'01:52:00',22,12,'Samoa 7s'),(276,7,7,13,40,'01:20:00',0,5,'New Zealand 7s'),(277,7,20,8,39,'00:58:00',5,19,'Fiji 7s'),(278,7,6,19,38,'00:36:00',12,14,'Scotland 7s'),(279,7,3,16,37,'00:14:00',12,21,'South Africa 7s'),(280,7,1,12,36,'23:52:00',24,7,'Argentina 7s'),(281,7,9,21,35,'23:30:00',5,12,'Wales 7s'),(282,7,17,15,34,'23:08:00',7,10,'Portugal 7s'),(283,7,11,18,33,'22:46:00',14,24,'Samoa 7s'),(284,7,13,19,32,'22:04:00',17,7,'New Zealand 7s'),(285,7,6,7,31,'21:42:00',7,14,'England 7s'),(286,7,8,16,30,'21:20:00',15,0,'Fiji 7s'),(287,7,3,20,29,'20:58:00',7,14,'USA 7s'),(288,7,12,15,28,'20:36:00',12,0,'Kenya 7s'),(289,7,1,17,27,'20:14:00',14,0,'Argentina 7s'),(290,7,21,18,26,'19:52:00',5,0,'Wales 7s'),(291,7,9,11,25,'19:30:00',19,0,'France 7s'),(292,7,8,19,24,'04:21:00',45,5,'Fiji 7s'),(293,7,21,15,23,'03:59:00',42,7,'Wales 7s'),(294,7,16,13,22,'03:37:00',19,24,'New Zealand 7s'),(295,7,18,12,21,'03:15:00',22,29,'Kenya 7s'),(296,7,7,9,20,'02:53:00',26,7,'England 7s'),(297,7,3,17,19,'02:31:00',31,5,'Australia 7s'),(298,7,6,11,18,'02:09:00',38,0,'Canada 7s'),(299,7,20,1,17,'01:47:00',21,14,'USA 7s'),(300,7,19,21,16,'01:10:00',12,7,'Scotland 7s'),(301,7,8,15,15,'00:48:00',40,12,'Fiji 7s'),(302,7,13,18,14,'00:26:00',26,19,'New Zealand 7s'),(303,7,16,12,13,'00:04:00',22,5,'South Africa 7s'),(304,7,9,3,12,'23:42:00',7,38,'Australia 7s'),(305,7,7,17,11,'23:20:00',43,7,'England 7s'),(306,7,11,20,10,'22:58:00',7,38,'USA 7s'),(307,7,6,1,9,'22:36:00',12,21,'Argentina 7s'),(308,7,19,15,8,'22:04:00',19,14,'Scotland 7s'),(309,7,8,21,7,'21:42:00',40,17,'Fiji 7s'),(310,7,13,12,6,'21:20:00',22,7,'New Zealand 7s'),(311,7,16,18,5,'20:58:00',19,12,'South Africa 7s'),(312,7,9,17,4,'20:36:00',21,19,'France 7s'),(313,7,7,3,3,'20:14:00',17,17,''),(314,7,11,1,2,'19:52:00',12,12,''),(315,7,6,20,1,'19:30:00',40,0,'Canada 7s'),(316,8,16,13,45,'02:30:00',26,17,'South Africa 7s'),(317,8,3,1,44,'01:58:00',34,19,'Australia 7s'),(318,8,8,20,43,'01:33:00',14,21,'USA 7s'),(319,8,6,12,42,'01:08:00',24,5,'Canada 7s'),(320,8,18,15,41,'00:43:00',14,19,'Portugal 7s'),(321,8,13,1,40,'00:01:00',29,0,'New Zealand 7s'),(322,8,16,3,39,'23:39:00',19,10,'South Africa 7s'),(323,8,20,19,38,'23:17:00',26,19,'USA 7s'),(324,8,7,8,37,'22:55:00',0,31,'Fiji 7s'),(325,8,12,9,36,'22:13:00',14,12,'Kenya 7s'),(326,8,21,6,35,'21:51:00',14,24,'Canada 7s'),(327,8,11,15,34,'21:29:00',15,24,'Portugal 7s'),(328,8,18,22,33,'21:07:00',21,14,'Samoa 7s'),(329,8,1,19,32,'20:25:00',24,19,'Argentina 7s'),(330,8,13,20,31,'20:03:00',28,7,'New Zealand 7s'),(331,8,8,3,30,'19:41:00',19,31,'Australia 7s'),(332,8,16,7,29,'19:19:00',31,7,'South Africa 7s'),(333,8,15,9,28,'18:57:00',7,42,'France 7s'),(334,8,11,12,27,'18:35:00',12,26,'Kenya 7s'),(335,8,6,22,26,'18:13:00',22,5,'Canada 7s'),(336,8,21,18,25,'17:51:00',24,22,'Wales 7s'),(337,8,16,21,24,'02:58:00',36,0,'South Africa 7s'),(338,8,20,12,23,'02:36:00',33,5,'USA 7s'),(339,8,13,7,22,'02:14:00',5,0,'New Zealand 7s'),(340,8,18,11,21,'01:52:00',14,17,'Japan 7s'),(341,8,3,1,20,'01:10:00',21,31,'Argentina 7s'),(342,8,15,22,19,'00:48:00',19,7,'Portugal 7s'),(343,8,8,19,18,'00:26:00',19,12,'Fiji 7s'),(344,8,9,6,17,'00:04:00',24,21,'France 7s'),(345,8,21,20,16,'23:20:00',12,38,'USA 7s'),(346,8,16,12,15,'22:58:00',38,7,'South Africa 7s'),(347,8,7,18,14,'22:36:00',22,7,'England 7s'),(348,8,13,11,13,'22:14:00',29,0,'New Zealand 7s'),(349,8,1,15,12,'21:52:00',14,7,'Argentina 7s'),(350,8,3,22,11,'21:30:00',50,0,'Australia 7s'),(351,8,19,9,10,'21:08:00',19,12,'Scotland 7s'),(352,8,8,6,9,'20:46:00',26,7,'Fiji 7s'),(353,8,21,12,8,'20:04:00',29,5,'Wales 7s'),(354,8,16,20,7,'19:42:00',26,0,'South Africa 7s'),(355,8,7,11,6,'19:20:00',45,0,'England 7s'),(356,8,13,18,5,'18:58:00',24,7,'New Zealand 7s'),(357,8,1,22,4,'18:36:00',31,5,'Argentina 7s'),(358,8,3,15,3,'18:14:00',33,21,'Australia 7s'),(359,8,19,6,2,'17:52:00',12,14,'Canada 7s'),(360,8,8,9,1,'17:30:00',45,5,'Fiji 7s'),(361,9,8,13,45,'08:25:00',35,19,'Fiji 7s'),(362,9,16,20,44,'08:00:00',31,0,'South Africa 7s'),(363,9,7,3,43,'07:35:00',14,21,'Australia 7s'),(364,9,12,1,42,'07:10:00',24,21,'Kenya 7s'),(365,9,15,21,41,'06:45:00',19,12,'Portugal 7s'),(366,9,13,20,40,'05:54:00',26,12,'New Zealand 7s'),(367,9,8,16,39,'05:32:00',24,19,'Fiji 7s'),(368,9,3,6,38,'05:10:00',17,0,'Australia 7s'),(369,9,9,7,37,'04:48:00',5,26,'England 7s'),(370,9,19,1,36,'04:26:00',19,21,'Argentina 7s'),(371,9,18,12,35,'04:04:00',5,19,'Kenya 7s'),(372,9,21,11,34,'03:42:00',47,33,'Wales 7s'),(373,9,5,15,33,'03:20:00',19,26,'Portugal 7s'),(374,9,6,20,32,'11:20:00',0,20,'USA 7s'),(375,9,3,13,31,'10:58:00',7,28,'New Zealand 7s'),(376,9,16,7,30,'10:36:00',21,14,'South Africa 7s'),(377,9,8,9,29,'10:14:00',31,12,'Fiji 7s'),(378,9,1,11,28,'09:52:00',15,12,'Argentina 7s'),(379,9,19,21,27,'09:30:00',19,14,'Scotland 7s'),(380,9,15,12,26,'09:08:00',7,17,'Kenya 7s'),(381,9,18,5,25,'08:46:00',26,7,'Samoa 7s'),(382,9,19,3,24,'06:52:00',14,40,'Australia 7s'),(383,9,7,12,23,'06:30:00',21,14,'England 7s'),(384,9,13,8,22,'06:05:00',12,14,'Fiji 7s'),(385,9,16,20,21,'05:40:00',19,19,''),(386,9,9,5,20,'05:14:00',26,7,'France 7s'),(387,9,1,6,19,'04:52:00',7,24,'Canada 7s'),(388,9,21,18,18,'04:30:00',19,26,'Samoa 7s'),(389,9,15,11,17,'04:08:00',21,19,'Portugal 7s'),(390,9,3,9,16,'14:30:00',31,14,'Australia 7s'),(391,9,19,5,15,'14:08:00',38,14,'Scotland 7s'),(392,9,12,1,14,'13:46:00',14,19,'Argentina 7s'),(393,9,7,6,13,'13:24:00',12,15,'Canada 7s'),(394,9,8,21,12,'13:02:00',28,24,'Fiji 7s'),(395,9,13,18,11,'12:40:00',15,5,'New Zealand 7s'),(396,9,20,15,10,'12:18:00',19,7,'USA 7s'),(397,9,16,11,9,'11:56:00',42,5,'South Africa 7s'),(398,9,3,5,8,'11:34:00',45,0,'Australia 7s'),(399,9,19,9,7,'11:12:00',7,19,'France 7s'),(400,9,12,6,6,'10:50:00',22,21,'Kenya 7s'),(401,9,7,1,5,'10:28:00',19,17,'England 7s'),(402,9,8,18,4,'10:06:00',36,0,'Fiji 7s'),(403,9,13,21,3,'09:44:00',40,7,'New Zealand 7s'),(404,9,20,11,2,'09:22:00',52,12,'USA 7s'),(405,9,16,15,1,'09:00:00',19,0,'South Africa 7s');
/*!40000 ALTER TABLE `Game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team_Tournament`
--

DROP TABLE IF EXISTS `Team_Tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Team_Tournament` (
  `Team_ID` int(11) NOT NULL,
  `T_ID` int(11) NOT NULL,
  PRIMARY KEY (`Team_ID`,`T_ID`),
  KEY `T_ID` (`T_ID`),
  CONSTRAINT `team_tournament_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `Team` (`Team_ID`),
  CONSTRAINT `team_tournament_ibfk_2` FOREIGN KEY (`T_ID`) REFERENCES `Tournament` (`T_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team_Tournament`
--

LOCK TABLES `Team_Tournament` WRITE;
/*!40000 ALTER TABLE `Team_Tournament` DISABLE KEYS */;
INSERT INTO `Team_Tournament` VALUES (1,1),(3,1),(4,1),(6,1),(7,1),(8,1),(9,1),(11,1),(12,1),(13,1),(15,1),(16,1),(18,1),(19,1),(20,1),(21,1),(1,2),(3,2),(5,2),(6,2),(7,2),(8,2),(9,2),(11,2),(12,2),(13,2),(15,2),(16,2),(18,2),(19,2),(20,2),(21,2),(1,3),(3,3),(5,3),(6,3),(7,3),(8,3),(9,3),(11,3),(12,3),(13,3),(15,3),(16,3),(18,3),(19,3),(20,3),(21,3),(1,4),(2,4),(3,4),(6,4),(7,4),(8,4),(9,4),(11,4),(12,4),(13,4),(15,4),(16,4),(18,4),(19,4),(20,4),(21,4),(1,5),(3,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5),(13,5),(15,5),(16,5),(18,5),(19,5),(20,5),(21,5),(1,6),(3,6),(6,6),(7,6),(8,6),(9,6),(11,6),(12,6),(13,6),(14,6),(15,6),(16,6),(18,6),(19,6),(20,6),(21,6),(1,7),(3,7),(6,7),(7,7),(8,7),(9,7),(11,7),(12,7),(13,7),(15,7),(16,7),(17,7),(18,7),(19,7),(20,7),(21,7),(1,8),(3,8),(6,8),(7,8),(8,8),(9,8),(11,8),(12,8),(13,8),(15,8),(16,8),(18,8),(19,8),(20,8),(21,8),(22,8),(1,9),(3,9),(5,9),(6,9),(7,9),(8,9),(9,9),(11,9),(12,9),(13,9),(15,9),(16,9),(18,9),(19,9),(20,9),(21,9);
/*!40000 ALTER TABLE `Team_Tournament` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-06 17:14:33

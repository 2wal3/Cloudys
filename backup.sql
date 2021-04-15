-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: Cloudys
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `adotta`
--

DROP TABLE IF EXISTS `adotta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adotta` (
  `id_server` int(11) NOT NULL,
  `macchina_virtuale` int(11) NOT NULL,
  PRIMARY KEY (`id_server`,`macchina_virtuale`),
  KEY `macchina_virtuale` (`macchina_virtuale`),
  CONSTRAINT `adotta_ibfk_1` FOREIGN KEY (`id_server`) REFERENCES `server` (`id_server`),
  CONSTRAINT `adotta_ibfk_2` FOREIGN KEY (`macchina_virtuale`) REFERENCES `macchinavirtuale` (`id_mv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adotta`
--

LOCK TABLES `adotta` WRITE;
/*!40000 ALTER TABLE `adotta` DISABLE KEYS */;
/*!40000 ALTER TABLE `adotta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicazione`
--

DROP TABLE IF EXISTS `applicazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicazione` (
  `id_app` int(11) NOT NULL,
  `versione` varchar(25) NOT NULL,
  `tipologia_licenza` varchar(15) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `costo` float NOT NULL,
  PRIMARY KEY (`id_app`,`versione`,`tipologia_licenza`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicazione`
--

LOCK TABLES `applicazione` WRITE;
/*!40000 ALTER TABLE `applicazione` DISABLE KEYS */;
INSERT INTO `applicazione` VALUES (1,'1.0','base','appcloudys',1000),(1,'1.0','free trial','appcloudys',0),(1,'1.0','professional','appcloudys',2000),(2,'1.0','base','civic sense',3400),(2,'1.0','free trial','civic sense',0),(2,'1.0','professional','civic sense',5000),(3,'2.2.0','base','bestappeu',10000),(3,'2.2.0','free trial','bestappeu',0),(3,'2.2.0','professional','bestappeu',15000),(4,'6.0','base','Photoshop CC',300),(4,'6.0','free trial','Photoshop CC',0),(4,'6.0','professional','Photoshop CC',600);
/*!40000 ALTER TABLE `applicazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cod_fisc` char(16) NOT NULL,
  `email` varchar(35) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `cognome` varchar(25) NOT NULL,
  `referente` char(16) DEFAULT NULL,
  `bonus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_fisc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('BLSLBA85D52C351L','blasialba@virgilio.it','Alba','Blasi',NULL,0),('BNCLGU76H14F205H','luigibianchi@mail2tor.com','Luigi','Bianchi',NULL,0),('BRCDNC99A29A638I','domenicobarca48@gmail.com','Domenico','Barca',NULL,0),('BRCLCU01A17F202Q','lucabarca@mail2tor.com','Luca','Barca',NULL,0),('BSOCLD67E56C984U','claudiobisio@virgilio.it','Claudio','Bisio','MAIWTR93S23F206E',0),('BTACLD92R08H501V','claudioabate@live.com','Claudio','Abate',NULL,0),('BUITON84F67M123U','buitony@mail2tor.com','Tonino','Buzzanca','PLMSFN94T16F842I',0),('CIAUET76F54C765B','bitcoin@live.it','Paolo','Bitta','MAIWTR93S23F206E',0),('CRLRRT97D08L049F','bobcarlos@mail2tor.com','Roberto','Carlucci',NULL,0),('DMIGNN89R08A727M','giovadimaio@gmail.com','Giovanni','Di Maio',NULL,0),('DMIGNN89R08A727U','luigigiorgi@virgilio.it','Luigi','Giorgianni','MAIWTR93S23F206E',0),('GRRCHR87E55H632D','chiaragrz@gmail.com','Chiara','Giarrizzo',NULL,0),('LPUBUE67E56C984G','Lpugigi@virgilio.it','Luigi','Lupo','MAIWTR93S23F206E',0),('LPUSFN95T31L049D','stefywolf@mail2tor.com','Stefano','Lupo',NULL,0),('LUOIET98F67B721C','emailtest@virgilio.it','Luisa','Grassi','MAIWTR93S23F206E',0),('MAIWTR93S23F206E','waltermaio@hotmail.com','Walter','Maio',NULL,2),('MNNTZA92S45F407R','tizimanna@virgilio.it','Tiziana','Manna','MAIWTR93S23F206E',0),('NRRDNC98B26L049X','narraccidomenico@gmail.com','Domenico','Narracci',NULL,0),('PLMSFN94T16F842I','stefypoly@mail2tor.com','Stefano','Polimena',NULL,4);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emessa`
--

DROP TABLE IF EXISTS `emessa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emessa` (
  `id_fattura` int(11) NOT NULL,
  `id_mv` int(11) NOT NULL,
  PRIMARY KEY (`id_fattura`,`id_mv`),
  KEY `id_mv` (`id_mv`),
  CONSTRAINT `emessa_ibfk_1` FOREIGN KEY (`id_fattura`) REFERENCES `fattura` (`id_fattura`),
  CONSTRAINT `emessa_ibfk_2` FOREIGN KEY (`id_mv`) REFERENCES `macchinavirtuale` (`id_mv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emessa`
--

LOCK TABLES `emessa` WRITE;
/*!40000 ALTER TABLE `emessa` DISABLE KEYS */;
/*!40000 ALTER TABLE `emessa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esegue`
--

DROP TABLE IF EXISTS `esegue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esegue` (
  `id_mv` int(11) NOT NULL,
  `id_app` int(11) NOT NULL,
  `versione` varchar(25) NOT NULL,
  `tipologia_licenza` varchar(15) NOT NULL,
  PRIMARY KEY (`id_mv`,`id_app`,`tipologia_licenza`),
  KEY `id_app` (`id_app`,`versione`,`tipologia_licenza`),
  CONSTRAINT `esegue_ibfk_1` FOREIGN KEY (`id_mv`) REFERENCES `macchinavirtuale` (`id_mv`),
  CONSTRAINT `esegue_ibfk_2` FOREIGN KEY (`id_app`, `versione`, `tipologia_licenza`) REFERENCES `applicazione` (`id_app`, `versione`, `tipologia_licenza`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esegue`
--

LOCK TABLES `esegue` WRITE;
/*!40000 ALTER TABLE `esegue` DISABLE KEYS */;
/*!40000 ALTER TABLE `esegue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fattura`
--

DROP TABLE IF EXISTS `fattura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fattura` (
  `id_fattura` int(11) NOT NULL,
  `importo` float NOT NULL,
  `descrizione` varchar(100) NOT NULL,
  `cliente` varchar(25) NOT NULL,
  PRIMARY KEY (`id_fattura`),
  KEY `cliente` (`cliente`),
  CONSTRAINT `fattura_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cod_fisc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fattura`
--

LOCK TABLES `fattura` WRITE;
/*!40000 ALTER TABLE `fattura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fattura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harddisk`
--

DROP TABLE IF EXISTS `harddisk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harddisk` (
  `id_hdd` int(11) NOT NULL AUTO_INCREMENT,
  `capacita` int(11) NOT NULL,
  `idserver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hdd`),
  KEY `harddisk_ibfk_1` (`idserver`),
  CONSTRAINT `harddisk_ibfk_1` FOREIGN KEY (`idserver`) REFERENCES `server` (`id_server`)
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harddisk`
--

LOCK TABLES `harddisk` WRITE;
/*!40000 ALTER TABLE `harddisk` DISABLE KEYS */;
INSERT INTO `harddisk` VALUES (1,2048,1),(2,1024,1),(3,500,1),(4,2048,2),(5,1024,2),(6,500,2),(7,2048,3),(8,1024,4),(9,500,4),(10,2048,5),(11,1024,5),(12,500,5),(13,2048,6),(14,1024,6),(15,500,NULL),(16,2048,NULL),(17,1024,NULL),(18,500,NULL),(19,2048,NULL),(20,1024,NULL),(21,500,NULL),(22,2048,NULL),(23,1024,NULL),(24,500,NULL),(25,2048,NULL),(26,1024,NULL),(27,500,NULL),(28,2048,NULL),(29,1024,NULL),(30,500,NULL),(31,2048,NULL),(32,1024,NULL),(33,500,NULL),(34,2048,NULL),(35,1024,NULL),(36,500,NULL),(37,2048,NULL),(38,1024,NULL),(39,500,NULL),(40,2048,NULL),(41,1024,NULL),(42,500,NULL),(43,2048,NULL),(44,1024,NULL),(45,500,NULL),(46,2048,NULL),(47,1024,NULL),(48,500,NULL),(49,2048,NULL),(50,1024,NULL),(51,500,NULL),(52,2048,NULL),(53,1024,NULL),(54,500,NULL),(55,2048,NULL),(56,1024,NULL),(57,500,NULL),(58,2048,NULL),(59,1024,NULL),(60,500,NULL),(61,2048,NULL),(62,1024,NULL),(63,500,NULL),(64,2048,NULL),(65,1024,NULL),(66,500,NULL),(67,2048,NULL),(68,1024,NULL),(69,500,NULL),(70,2048,NULL),(71,1024,NULL),(72,500,NULL),(73,2048,NULL),(74,1024,NULL),(75,500,NULL),(76,2048,NULL),(77,1024,NULL),(78,500,NULL),(79,2048,NULL),(80,1024,NULL),(81,500,NULL),(82,2048,NULL),(83,1024,NULL),(84,500,NULL),(85,2048,NULL),(86,1024,NULL),(87,500,NULL),(88,2048,NULL),(89,1024,NULL),(90,500,NULL),(91,2048,NULL),(92,1024,NULL),(93,500,NULL),(94,2048,NULL),(95,1024,NULL),(96,500,NULL),(97,2048,NULL),(98,1024,NULL),(99,500,NULL),(100,2048,NULL),(101,1024,NULL),(102,500,NULL),(103,2048,NULL),(104,1024,NULL),(105,500,NULL),(106,2048,NULL),(107,1024,NULL),(108,500,NULL),(109,2048,NULL),(110,1024,NULL),(111,500,NULL),(112,2048,NULL),(113,1024,NULL),(114,500,NULL),(115,2048,NULL),(116,1024,NULL),(117,500,NULL),(118,2048,NULL),(119,1024,NULL),(120,500,NULL),(121,2048,NULL),(122,1024,NULL),(123,500,NULL),(124,2048,NULL),(125,1024,NULL),(126,500,NULL),(127,2048,NULL),(128,1024,NULL),(129,500,NULL),(130,2048,NULL),(131,1024,NULL),(132,500,NULL),(133,2048,NULL),(134,1024,NULL),(135,500,NULL),(136,2048,NULL),(137,1024,NULL),(138,500,NULL),(139,2048,NULL),(140,1024,NULL),(141,500,NULL),(142,2048,NULL),(143,1024,NULL),(144,500,NULL),(145,2048,NULL),(146,1024,NULL),(147,500,NULL),(148,2048,NULL),(149,1024,NULL),(150,500,NULL),(151,2048,NULL),(152,1024,NULL),(153,500,NULL),(154,2048,NULL),(155,1024,NULL),(156,500,NULL),(157,2048,NULL),(158,1024,NULL),(159,500,NULL),(160,2048,NULL),(161,1024,NULL),(162,500,NULL),(163,2048,NULL),(164,1024,NULL),(165,500,NULL),(166,2048,NULL),(167,1024,NULL),(168,500,NULL),(169,2048,NULL),(170,1024,NULL),(171,500,NULL),(172,2048,NULL),(173,1024,NULL),(174,500,NULL),(175,2048,NULL),(176,1024,NULL),(177,500,NULL),(178,2048,NULL),(179,1024,NULL),(180,500,NULL),(181,2048,NULL),(182,1024,NULL),(183,500,NULL),(184,2048,NULL),(185,1024,NULL),(186,500,NULL),(187,2048,NULL),(188,1024,NULL),(189,500,NULL),(190,2048,NULL),(191,1024,NULL),(192,500,NULL),(193,2048,NULL),(194,1024,NULL),(195,500,NULL),(196,2048,NULL),(197,1024,NULL),(198,500,NULL),(199,2048,NULL),(200,1024,NULL),(201,500,NULL),(202,2048,NULL),(203,1024,NULL),(204,500,NULL),(205,2048,NULL),(206,1024,NULL),(207,500,NULL),(208,2048,NULL),(209,1024,NULL),(210,500,NULL),(211,2048,NULL),(212,1024,NULL),(213,500,NULL),(214,2048,NULL),(215,1024,NULL),(216,500,NULL),(217,2048,NULL),(218,1024,NULL),(219,500,NULL),(220,2048,NULL),(221,1024,NULL),(222,500,NULL),(223,2048,NULL),(224,1024,NULL),(225,500,NULL),(226,2048,NULL),(227,1024,NULL),(228,500,NULL),(229,2048,NULL),(230,1024,NULL),(231,500,NULL),(232,2048,NULL),(233,1024,NULL),(234,500,NULL),(235,2048,NULL),(236,1024,NULL),(237,500,NULL),(238,2048,NULL),(239,1024,NULL),(240,500,NULL),(241,2048,NULL),(242,1024,NULL),(243,500,NULL),(244,2048,NULL),(245,1024,NULL),(246,500,NULL),(247,2048,NULL),(248,1024,NULL),(249,500,NULL),(250,2048,NULL),(251,1024,NULL),(252,500,NULL),(253,2048,NULL),(254,1024,NULL),(255,500,NULL),(256,2048,NULL),(257,1024,NULL),(258,500,NULL),(259,2048,NULL),(260,1024,NULL),(261,500,NULL),(262,2048,NULL),(263,1024,NULL),(264,500,NULL),(265,2048,NULL),(266,1024,NULL),(267,500,NULL),(268,2048,NULL),(269,1024,NULL),(270,500,NULL),(271,2048,NULL),(272,1024,NULL),(273,500,NULL),(274,2048,NULL),(275,1024,NULL),(276,500,NULL),(277,2048,NULL),(278,1024,NULL),(279,500,NULL),(280,2048,NULL),(281,1024,NULL),(282,500,NULL),(283,2048,NULL),(284,1024,NULL),(285,500,NULL),(286,2048,NULL),(287,1024,NULL),(288,500,NULL),(289,2048,NULL),(290,1024,NULL),(291,500,NULL),(292,2048,NULL),(293,1024,NULL),(294,500,NULL),(295,2048,NULL),(296,1024,NULL),(297,500,NULL),(298,2048,NULL),(299,1024,NULL),(300,500,NULL),(301,2048,NULL),(302,1024,NULL),(303,500,NULL),(304,2048,NULL),(305,1024,NULL),(306,500,NULL),(307,2048,NULL),(308,1024,NULL),(309,500,NULL),(310,2048,NULL),(311,1024,NULL),(312,500,NULL),(313,2048,NULL),(314,1024,NULL),(315,500,NULL),(316,2048,NULL),(317,1024,NULL),(318,500,NULL),(319,2048,NULL),(320,1024,NULL),(321,500,NULL),(322,2048,NULL),(323,1024,NULL),(324,500,NULL),(325,2048,NULL),(326,1024,NULL),(327,500,NULL),(328,2048,NULL),(329,1024,NULL),(330,500,NULL),(331,2048,NULL),(332,1024,NULL),(333,500,NULL),(334,2048,NULL),(335,1024,NULL),(336,500,NULL),(337,2048,NULL),(338,1024,NULL),(339,500,NULL),(340,2048,NULL),(341,1024,NULL),(342,500,NULL),(343,2048,NULL),(344,1024,NULL),(345,500,NULL),(346,2048,NULL),(347,1024,NULL),(348,500,NULL),(349,2048,NULL),(350,1024,NULL),(351,500,NULL),(352,2048,NULL),(353,1024,NULL),(354,500,NULL),(355,2048,NULL),(356,1024,NULL),(357,500,NULL),(358,2048,NULL),(359,1024,NULL),(360,500,NULL),(361,2048,NULL),(362,1024,NULL),(363,500,NULL),(364,2048,NULL),(365,1024,NULL),(366,500,NULL),(367,2048,NULL),(368,1024,NULL),(369,500,NULL),(370,2048,NULL),(371,1024,NULL),(372,500,NULL),(373,2048,NULL),(374,1024,NULL),(375,500,NULL),(376,2048,NULL),(377,1024,NULL),(378,500,NULL),(379,2048,NULL),(380,1024,NULL),(381,500,NULL),(382,2048,NULL),(383,1024,NULL),(384,500,NULL),(385,2048,NULL),(386,1024,NULL),(387,500,NULL),(388,2048,NULL),(389,1024,NULL),(390,500,NULL),(391,2048,NULL),(392,1024,NULL),(393,500,NULL),(394,2048,NULL),(395,1024,NULL),(396,500,NULL),(397,2048,NULL),(398,1024,NULL),(399,500,NULL),(400,2048,NULL),(401,1024,NULL),(402,500,NULL),(403,2048,NULL),(404,1024,NULL),(405,500,NULL),(406,2048,NULL),(407,1024,NULL),(408,500,NULL),(409,2048,NULL),(410,1024,NULL),(411,500,NULL),(412,2048,NULL),(413,1024,NULL),(414,500,NULL),(415,2048,NULL),(416,1024,NULL),(417,500,NULL),(418,2048,NULL),(419,1024,NULL),(420,500,NULL),(421,2048,NULL),(422,1024,NULL),(423,500,NULL),(424,2048,NULL),(425,1024,NULL),(426,500,NULL),(427,2048,NULL),(428,1024,NULL),(429,500,NULL),(430,2048,NULL),(431,1024,NULL),(432,500,NULL),(433,2048,NULL),(434,1024,NULL),(435,500,NULL),(436,2048,NULL),(437,1024,NULL),(438,500,NULL),(439,2048,NULL),(440,1024,NULL),(441,500,NULL),(442,2048,NULL),(443,1024,NULL),(444,500,NULL),(445,2048,NULL),(446,1024,NULL),(447,500,NULL),(448,2048,NULL),(449,1024,NULL),(450,500,NULL),(451,2048,NULL),(452,1024,NULL),(453,500,NULL),(454,2048,NULL),(455,1024,NULL),(456,500,NULL),(457,2048,NULL),(458,1024,NULL),(459,500,NULL),(460,2048,NULL),(461,1024,NULL),(462,500,NULL),(463,2048,NULL),(464,1024,NULL),(465,500,NULL),(466,2048,NULL),(467,1024,NULL),(468,500,NULL),(469,2048,NULL),(470,1024,NULL),(471,500,NULL),(472,2048,NULL),(473,1024,NULL),(474,500,NULL),(475,2048,NULL),(476,1024,NULL),(477,500,NULL),(478,2048,NULL),(479,1024,NULL),(480,500,NULL),(481,2048,NULL),(482,1024,NULL),(483,500,NULL),(484,2048,NULL),(485,1024,NULL),(486,500,NULL),(487,2048,NULL),(488,1024,NULL),(489,500,NULL),(490,2048,NULL),(491,1024,NULL),(492,500,NULL),(493,2048,NULL),(494,1024,NULL),(495,500,NULL),(496,2048,NULL),(497,1024,NULL),(498,500,NULL),(499,2048,NULL),(500,1024,NULL),(501,500,NULL),(502,2048,NULL),(503,1024,NULL),(504,500,NULL),(505,2048,NULL),(506,1024,NULL),(507,500,NULL),(508,2048,NULL),(509,1024,NULL),(510,500,NULL),(511,2048,NULL),(512,1024,NULL),(513,500,NULL),(514,2048,NULL),(515,1024,NULL),(516,500,NULL),(517,2048,NULL),(518,1024,NULL),(519,500,NULL),(520,2048,NULL),(521,1024,NULL),(522,500,NULL),(523,2048,NULL),(524,1024,NULL),(525,500,NULL),(526,2048,NULL),(527,1024,NULL),(528,500,NULL),(529,2048,NULL),(530,1024,NULL),(531,500,NULL),(532,2048,NULL),(533,1024,NULL),(534,500,NULL),(535,2048,NULL),(536,1024,NULL),(537,500,NULL),(538,2048,NULL),(539,1024,NULL),(540,500,NULL),(541,2048,NULL),(542,1024,NULL),(543,500,NULL),(544,2048,NULL),(545,1024,NULL),(546,500,NULL),(547,2048,NULL),(548,1024,NULL),(549,500,NULL),(550,2048,NULL),(551,1024,NULL),(552,500,NULL),(553,2048,NULL),(554,1024,NULL),(555,500,NULL),(556,2048,NULL),(557,1024,NULL),(558,500,NULL),(559,2048,NULL),(560,1024,NULL),(561,500,NULL),(562,2048,NULL),(563,1024,NULL),(564,500,NULL),(565,2048,NULL),(566,1024,NULL),(567,500,NULL),(568,2048,NULL),(569,1024,NULL),(570,500,NULL),(571,2048,NULL),(572,1024,NULL),(573,500,NULL),(574,2048,NULL),(575,1024,NULL),(576,500,NULL),(577,2048,NULL),(578,1024,NULL),(579,500,NULL),(580,2048,NULL),(581,1024,NULL),(582,500,NULL),(583,2048,NULL),(584,1024,NULL),(585,500,NULL),(586,2048,NULL),(587,1024,NULL),(588,500,NULL),(589,2048,NULL),(590,1024,NULL),(591,500,NULL),(592,2048,NULL),(593,1024,NULL),(594,500,NULL),(595,2048,NULL),(596,1024,NULL),(597,500,NULL),(598,2048,NULL),(599,1024,NULL),(600,500,NULL),(601,2048,NULL),(602,1024,NULL),(603,500,NULL),(604,2048,NULL),(605,1024,NULL),(606,500,NULL),(607,2048,NULL),(608,1024,NULL),(609,500,NULL),(610,2048,NULL),(611,1024,NULL),(612,500,NULL),(613,2048,NULL),(614,1024,NULL),(615,500,NULL),(616,2048,NULL),(617,1024,NULL),(618,500,NULL),(619,2048,NULL),(620,1024,NULL),(621,500,NULL),(622,2048,NULL),(623,1024,NULL),(624,500,NULL),(625,2048,NULL),(626,1024,NULL),(627,500,NULL),(628,2048,NULL),(629,1024,NULL),(630,500,NULL),(631,2048,NULL),(632,1024,NULL),(633,500,NULL),(634,2048,NULL),(635,1024,NULL),(636,500,NULL),(637,2048,NULL),(638,1024,NULL),(639,500,NULL),(640,2048,NULL),(641,1024,NULL),(642,500,NULL),(643,2048,NULL),(644,1024,NULL),(645,500,NULL),(646,2048,NULL),(647,1024,NULL),(648,500,NULL),(649,2048,NULL),(650,1024,NULL),(651,500,NULL),(652,2048,NULL),(653,1024,NULL),(654,500,NULL),(655,2048,NULL),(656,1024,NULL),(657,500,NULL),(658,2048,NULL),(659,1024,NULL),(660,500,NULL),(661,2048,NULL),(662,1024,NULL),(663,500,NULL),(664,2048,NULL),(665,1024,NULL),(666,500,NULL),(667,2048,NULL),(668,1024,NULL),(669,500,NULL),(670,2048,NULL),(671,1024,NULL),(672,500,NULL),(673,2048,NULL),(674,1024,NULL),(675,500,NULL),(676,2048,NULL),(677,1024,NULL),(678,500,NULL),(679,2048,NULL),(680,1024,NULL),(681,500,NULL),(682,2048,NULL),(683,1024,NULL),(684,500,NULL),(685,2048,NULL),(686,1024,NULL),(687,500,NULL),(688,2048,NULL),(689,1024,NULL),(690,500,NULL),(691,2048,NULL),(692,1024,NULL),(693,500,NULL),(694,2048,NULL),(695,1024,NULL),(696,500,NULL),(697,2048,NULL),(698,1024,NULL),(699,500,NULL),(700,2048,NULL),(701,1024,NULL),(702,500,NULL),(703,2048,NULL),(704,1024,NULL),(705,500,NULL),(706,2048,NULL),(707,1024,NULL),(708,500,NULL),(709,2048,NULL),(710,1024,NULL),(711,500,NULL),(712,2048,NULL),(713,1024,NULL),(714,500,NULL),(715,2048,NULL),(716,1024,NULL),(717,500,NULL),(718,2048,NULL),(719,1024,NULL),(720,500,NULL),(721,2048,NULL),(722,1024,NULL),(723,500,NULL),(724,2048,NULL),(725,1024,NULL),(726,500,NULL),(727,2048,NULL),(728,1024,NULL),(729,500,NULL),(730,2048,NULL),(731,1024,NULL),(732,500,NULL),(733,2048,NULL),(734,1024,NULL),(735,500,NULL),(736,2048,NULL),(737,1024,NULL),(738,500,NULL),(739,2048,NULL),(740,1024,NULL),(741,500,NULL),(742,2048,NULL),(743,1024,NULL),(744,500,NULL),(745,2048,NULL),(746,1024,NULL),(747,500,NULL),(748,2048,NULL),(749,1024,NULL),(750,500,NULL),(751,2048,NULL),(752,1024,NULL),(753,500,NULL),(754,2048,NULL),(755,1024,NULL),(756,500,NULL),(757,2048,NULL),(758,1024,NULL),(759,500,NULL),(760,2048,NULL),(761,1024,NULL),(762,500,NULL),(763,2048,NULL),(764,1024,NULL),(765,500,NULL),(766,2048,NULL),(767,1024,NULL),(768,500,NULL),(769,2048,NULL),(770,1024,NULL),(771,500,NULL),(772,2048,NULL),(773,1024,NULL),(774,500,NULL),(775,2048,NULL),(776,1024,NULL),(777,500,NULL),(778,2048,NULL),(779,1024,NULL),(780,500,NULL),(781,2048,NULL),(782,1024,NULL),(783,500,NULL),(784,2048,NULL),(785,1024,NULL),(786,500,NULL),(787,2048,NULL),(788,1024,NULL),(789,500,NULL),(790,2048,NULL),(791,1024,NULL),(792,500,NULL),(793,2048,NULL),(794,1024,NULL),(795,500,NULL),(796,2048,NULL),(797,1024,NULL),(798,500,NULL),(799,2048,NULL),(800,1024,NULL);
/*!40000 ALTER TABLE `harddisk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macchinavirtuale`
--

DROP TABLE IF EXISTS `macchinavirtuale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macchinavirtuale` (
  `id_mv` int(11) NOT NULL AUTO_INCREMENT,
  `n_core` int(11) NOT NULL,
  `ram` int(11) NOT NULL,
  `processore` varchar(15) NOT NULL,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_distruzione` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sistema_operativo` varchar(25) NOT NULL,
  `cliente` varchar(25) NOT NULL,
  `costo_macchina` double NOT NULL,
  `costo_totale` double DEFAULT '0',
  PRIMARY KEY (`id_mv`),
  KEY `cliente` (`cliente`),
  KEY `sistema_operativo` (`sistema_operativo`),
  CONSTRAINT `macchinavirtuale_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cod_fisc`),
  CONSTRAINT `macchinavirtuale_ibfk_2` FOREIGN KEY (`sistema_operativo`) REFERENCES `sistemaoperativo` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macchinavirtuale`
--

LOCK TABLES `macchinavirtuale` WRITE;
/*!40000 ALTER TABLE `macchinavirtuale` DISABLE KEYS */;
/*!40000 ALTER TABLE `macchinavirtuale` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cloudys`.`macchinavirtuale_AFTER_INSERT` AFTER INSERT ON `macchinavirtuale` FOR EACH ROW
BEGIN
 DECLARE id_fisica INTEGER;
 DECLARE cf, cf1 char(16);
 DECLARE fisc_prova char(16);
    

   
   SELECT id_server
   FROM server
   WHERE ram - ris_occup >= new.ram
   limit 1
   INTO id_fisica;
   
   
   INSERT INTO adotta
   ( id_server,
     macchina_virtuale
     )
   VALUES
   ( id_fisica,
   NEW.id_mv
     );
     
     update server
     set ris_occup = ris_occup + new.ram
     where id_server = id_fisica;

	

set cf=new.cliente;
    select referente
    from cliente, macchinavirtuale
    where cliente.cod_fisc=macchinavirtuale.cliente && cf=cod_fisc
    limit 1
    into fisc_prova;
    if fisc_prova != 'null' then
  select cod_fisc
        from cliente
        where fisc_prova=cod_fisc
        limit 1
        into cf1;
		set SQL_SAFE_UPDATES=0;
        
        update cliente set bonus= bonus+1 where cod_fisc=cf1; 
	
		set SQL_SAFE_UPDATES=1;
	end if;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cloudys`.`aggiorna_ram_AFTER_UPDATE` AFTER UPDATE ON `macchinavirtuale` FOR EACH ROW
BEGIN
declare idfisica, ram_fisica, ram_virtuale integer;
    
    select ram
    from macchinavirtuale
    where new.id_mv=id_mv
    into ram_virtuale;
    
    select id_server
    from adotta, macchinavirtuale
 where adotta.macchina_virtuale=macchinavirtuale.id_mv && new.id_mv=macchina_virtuale
    into idfisica;
    
    update server
    set ris_occup = ris_occup - ram_virtuale
    where idfisica=id_server;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sceglie`
--

DROP TABLE IF EXISTS `sceglie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sceglie` (
  `cliente` varchar(25) NOT NULL,
  `sistema_operativo` varchar(16) NOT NULL,
  PRIMARY KEY (`cliente`,`sistema_operativo`),
  KEY `sistema_operativo` (`sistema_operativo`),
  CONSTRAINT `sceglie_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cod_fisc`),
  CONSTRAINT `sceglie_ibfk_2` FOREIGN KEY (`sistema_operativo`) REFERENCES `sistemaoperativo` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sceglie`
--

LOCK TABLES `sceglie` WRITE;
/*!40000 ALTER TABLE `sceglie` DISABLE KEYS */;
/*!40000 ALTER TABLE `sceglie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `id_server` int(11) NOT NULL AUTO_INCREMENT,
  `modello_processore` varchar(20) NOT NULL,
  `n_core` int(11) NOT NULL,
  `ram` int(11) NOT NULL,
  `ris_occup` int(11) DEFAULT '0',
  PRIMARY KEY (`id_server`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,'Intel Xeon e5',16,64,0),(2,'Intel i3',8,16,0),(3,'Intel i9',32,16,0),(4,'Intel i7',16,32,0),(5,'Intel Xeon e7',32,64,0),(6,'Intel Xeon e5',8,16,0),(7,'Intel Xeon e7',8,16,0),(8,'Intel Xeon e3',4,4,0),(9,'Intel Xeon e9',8,32,0),(10,'Intel Xeon e5',16,16,0),(11,'Intel Xeon e9',8,16,0),(12,'Intel Xeon e7',4,8,0),(13,'Intel Xeon e5',8,16,0),(14,'Intel Xeon e5',6,32,0),(15,'Intel Xeon e9',8,32,0),(16,'Intel Xeon e5',16,16,0),(17,'Intel Xeon e9',8,16,0),(18,'Intel i7',4,8,0),(19,'Intel Xeon e5',8,16,0),(20,'Intel i5',8,16,0),(21,'Intel Xeon e7',4,8,0),(22,'Intel i3',8,16,0),(23,'Intel Xeon e5',6,32,0),(24,'Intel Xeon e9',8,32,0),(25,'Intel Xeon e5',16,16,0),(26,'Intel Xeon e9',8,16,0),(27,'Intel Xeon e7',4,8,0),(28,'Intel i7',4,8,0),(29,'Intel Xeon e5',8,16,0),(30,'Intel i5',8,16,0),(31,'Intel Xeon e7',4,8,0),(32,'Intel i3',8,16,0),(33,'Intel Xeon e5',16,16,0),(34,'Intel Xeon e9',8,16,0),(35,'Intel Xeon e7',4,8,0),(36,'Intel Xeon e5',8,16,0),(37,'Intel Xeon e9',8,16,0),(38,'Intel Xeon e7',4,8,0),(39,'Intel i7',4,8,0),(40,'Intel Xeon e5',8,16,0),(41,'Intel i5',8,16,0),(42,'Intel Xeon e7',4,8,0),(43,'Intel i3',8,16,0),(44,'Intel Xeon e5',8,16,0),(45,'Intel Xeon e7',4,8,0),(46,'Intel Xeon e5',8,16,0),(47,'Intel Xeon e5',6,32,0),(48,'Intel Xeon e9',8,32,0),(49,'Intel Xeon e5',16,16,0),(50,'Intel Xeon e9',8,16,0),(51,'Intel Xeon e7',4,8,0),(52,'Intel Xeon e5',8,16,0),(53,'Intel i7',4,8,0),(54,'Intel Xeon e5',8,16,0),(55,'Intel i5',8,16,0),(56,'Intel Xeon e7',4,8,0),(57,'Intel i3',8,16,0),(58,'Intel Xeon e9',8,16,0),(59,'Intel Xeon e7',4,8,0),(60,'Intel Xeon e5',8,16,0),(61,'Intel Xeon e5',6,32,0),(62,'Intel Xeon e9',8,32,0),(63,'Intel i7',4,8,0),(64,'Intel Xeon e5',8,16,0),(65,'Intel i5',8,16,0),(66,'Intel Xeon e7',4,8,0),(67,'Intel i3',8,16,0),(68,'Intel Xeon e5',16,16,0),(69,'Intel Xeon e9',8,16,0),(70,'Intel i7',4,8,0),(71,'Intel Xeon e5',8,16,0),(72,'Intel i5',8,16,0),(73,'Intel Xeon e7',4,8,0),(74,'Intel i3',8,16,0),(75,'Intel i9',8,32,0),(76,'Intel i9',8,32,0),(77,'Intel i3',2,4,0),(78,'Intel i7',4,8,0),(79,'Intel i5',6,16,0),(80,'Intel i9',8,32,0),(81,'Intel i3',2,4,0),(82,'Intel i7',4,8,0),(83,'Intel i5',6,16,0),(84,'Intel i3',2,4,0),(85,'Intel i7',4,8,0),(86,'Intel i5',6,16,0),(87,'Intel i7',4,8,0),(88,'Intel i5',6,16,0),(89,'Intel i9',8,32,0),(90,'Intel i3',2,4,0),(91,'Intel i3',2,4,0),(92,'Intel i7',4,8,0),(93,'Intel i7',4,8,0),(94,'Intel i5',6,16,0),(95,'Intel i9',8,32,0),(96,'Intel i3',2,4,0),(97,'Intel i7',4,8,0),(98,'Intel i5',6,16,0),(99,'Intel i7',4,8,0),(100,'Intel i5',6,16,0),(101,'Intel i9',8,32,0),(102,'Intel i3',2,4,0),(103,'Intel i7',4,8,0),(104,'Intel i5',6,16,0),(105,'Intel i5',6,16,0),(106,'Intel i7',4,8,0),(107,'Intel i5',6,16,0),(108,'Intel i9',8,32,0),(109,'Intel i3',2,4,0),(110,'Intel i7',4,8,0),(111,'Intel i5',6,16,0),(112,'Intel i9',8,32,0),(113,'Intel i3',2,4,0),(114,'Intel i3',2,4,0),(115,'Intel i9',8,32,0),(116,'Intel i3',2,4,0),(117,'Intel i7',4,8,0),(118,'Intel i5',6,16,0),(119,'Intel i9',8,32,0),(120,'Intel i3',2,4,0),(121,'Intel i7',4,8,0),(122,'Intel i5',6,16,0),(123,'Intel i3',2,4,0),(124,'Intel i7',4,8,0),(125,'Intel i5',6,16,0),(126,'Intel i7',4,8,0),(127,'Intel i5',6,16,0),(128,'Intel i9',8,32,0),(129,'Intel i3',2,4,0),(130,'Intel i3',2,4,0),(131,'Intel i7',4,8,0),(132,'Intel i7',4,8,0),(133,'Intel i5',6,16,0),(134,'Intel i9',8,32,0),(135,'Intel i3',2,4,0),(136,'Intel i7',4,8,0),(137,'Intel i5',6,16,0),(138,'Intel i7',4,8,0),(139,'Intel i5',6,16,0),(140,'Intel i9',8,32,0),(141,'Intel i9',8,32,0),(142,'Intel i3',2,4,0),(143,'Intel i3',2,4,0),(144,'Intel i7',4,8,0),(145,'Intel i5',6,16,0),(146,'Intel i7',4,8,0),(147,'Intel i5',6,16,0),(148,'Intel i9',8,32,0),(149,'Intel i3',2,4,0),(150,'Intel i3',2,4,0),(151,'Intel i7',4,8,0),(152,'Intel i5',6,16,0),(153,'Intel i7',4,8,0),(154,'Intel i5',6,16,0),(155,'Intel i9',8,32,0),(156,'Intel i3',2,4,0),(157,'Intel i7',4,8,0),(158,'Intel i5',6,16,0),(159,'Intel i5',6,16,0),(160,'Intel i7',4,8,0),(161,'Intel i5',6,16,0),(162,'Intel i9',8,32,0),(163,'Intel i3',2,4,0),(164,'Intel i7',4,8,0),(165,'Intel i5',6,16,0),(166,'Intel i9',8,32,0),(167,'Intel i3',2,4,0),(168,'Intel i7',4,8,0),(169,'Intel i5',6,16,0),(170,'Intel i5',6,16,0),(171,'Intel i7',4,8,0),(172,'Intel i5',6,16,0),(173,'Intel i9',8,32,0),(174,'Intel i3',2,4,0),(175,'Intel i7',4,8,0),(176,'Intel i5',6,16,0),(177,'Intel i9',8,32,0),(178,'Intel i3',2,4,0),(179,'Intel i3',2,4,0),(180,'Intel i7',4,8,0),(181,'Intel i5',6,16,0),(182,'Intel i7',4,8,0),(183,'Intel i5',6,16,0),(184,'Intel i9',8,32,0),(185,'Intel i3',2,4,0),(186,'Intel i3',2,4,0),(187,'Intel i7',4,8,0),(188,'Intel i5',6,16,0),(189,'Intel i7',4,8,0),(190,'Intel i5',6,16,0),(191,'Intel i9',8,32,0),(192,'Intel i3',2,4,0),(193,'Intel i7',4,8,0),(194,'Intel i5',6,16,0),(195,'Intel i5',6,16,0),(196,'Intel i7',4,8,0),(197,'Intel i5',6,16,0),(198,'Intel i9',8,32,0),(199,'Intel i3',2,4,0),(200,'Intel i7',4,8,0),(201,'Intel i5',6,16,0),(202,'Intel i9',8,32,0),(203,'Intel i3',2,4,0),(204,'Intel i3',2,4,0),(205,'Intel i7',4,8,0),(206,'Intel i5',6,16,0),(207,'Intel i7',4,8,0),(208,'Intel i5',6,16,0),(209,'Intel i9',8,32,0),(210,'Intel i3',2,4,0),(211,'Intel i3',2,4,0),(212,'Intel i7',4,8,0),(213,'Intel i5',6,16,0),(214,'Intel i7',4,8,0),(215,'Intel i5',6,16,0),(216,'Intel i9',8,32,0),(217,'Intel i7',4,8,0),(218,'Intel i5',6,16,0),(219,'Intel i7',4,8,0),(220,'Intel i5',6,16,0),(221,'Intel i9',8,32,0),(222,'Intel i3',2,4,0),(223,'Intel i3',2,4,0),(224,'Intel i7',4,8,0),(225,'Intel i5',6,16,0),(226,'Intel i7',4,8,0),(227,'Intel i5',6,16,0),(228,'Intel i9',8,32,0),(229,'Intel i3',2,4,0),(230,'Intel i7',4,8,0),(231,'Intel i5',6,16,0),(232,'Intel i5',6,16,0),(233,'Intel i7',4,8,0),(234,'Intel i5',6,16,0),(235,'Intel i9',8,32,0),(236,'Intel i3',2,4,0),(237,'Intel i7',4,8,0),(238,'Intel i5',6,16,0),(239,'Intel i9',8,32,0),(240,'Intel i3',2,4,0),(241,'Intel i3',2,4,0),(242,'Intel i7',4,8,0),(243,'Intel i5',6,16,0),(244,'Intel i7',4,8,0),(245,'Intel i5',6,16,0),(246,'Intel i9',8,32,0),(247,'Intel i3',2,4,0),(248,'Intel i3',2,4,0),(249,'Intel i7',4,8,0),(250,'Intel i5',6,16,0);
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistemaoperativo`
--

DROP TABLE IF EXISTS `sistemaoperativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistemaoperativo` (
  `nome` varchar(25) NOT NULL,
  `costo` float NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistemaoperativo`
--

LOCK TABLES `sistemaoperativo` WRITE;
/*!40000 ALTER TABLE `sistemaoperativo` DISABLE KEYS */;
INSERT INTO `sistemaoperativo` VALUES ('BobOs',100),('Debian',35),('Linux',30),('Raspbian',30),('Tails',9.99),('Windows 10',30),('Windows 7',19.9),('Windows XP',50);
/*!40000 ALTER TABLE `sistemaoperativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usufruisce`
--

DROP TABLE IF EXISTS `usufruisce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usufruisce` (
  `id_app` int(11) NOT NULL,
  `sistema_operativo` varchar(25) NOT NULL,
  `versione_app` varchar(25) NOT NULL,
  `tipologia_licenza` varchar(15) NOT NULL,
  PRIMARY KEY (`id_app`,`sistema_operativo`,`versione_app`,`tipologia_licenza`),
  KEY `id_app` (`id_app`,`versione_app`,`tipologia_licenza`),
  KEY `sistema_operativo` (`sistema_operativo`),
  CONSTRAINT `usufruisce_ibfk_1` FOREIGN KEY (`id_app`, `versione_app`, `tipologia_licenza`) REFERENCES `applicazione` (`id_app`, `versione`, `tipologia_licenza`),
  CONSTRAINT `usufruisce_ibfk_2` FOREIGN KEY (`sistema_operativo`) REFERENCES `sistemaoperativo` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usufruisce`
--

LOCK TABLES `usufruisce` WRITE;
/*!40000 ALTER TABLE `usufruisce` DISABLE KEYS */;
/*!40000 ALTER TABLE `usufruisce` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-07 18:46:22

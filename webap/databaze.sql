/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: tancing
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES
(1,'s');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porotci`
--

DROP TABLE IF EXISTS `porotci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `porotci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porotci`
--

LOCK TABLES `porotci` WRITE;
/*!40000 ALTER TABLE `porotci` DISABLE KEYS */;
INSERT INTO `porotci` VALUES
(28,'Čákorová Kateřina'),
(10,'Chladný Marián'),
(23,'Chmelík Lukáš'),
(1,'Činčura Jindřich'),
(13,'Dlouhý Bohumil'),
(41,'Dorina Tatiana'),
(43,'Dvořáček Jan'),
(38,'Dvořáková Marie'),
(14,'Elschek Walter'),
(8,'Fáber Juraj'),
(29,'Gregoriades Filip'),
(32,'Hagarová Edita'),
(39,'Hána Vladimír'),
(2,'Henzély Igor'),
(40,'Holý Oldřich'),
(22,'Hradilová Jana'),
(48,'Janák Matěj'),
(44,'Kasalová Ela'),
(45,'Kasalová Marika'),
(3,'Kladrubský Michal'),
(33,'Klápová Jana'),
(50,'Kolářová Eva'),
(4,'Koťátková Šárka'),
(55,'Krtička Jaroslav'),
(52,'Krtičková Jana'),
(24,'Maslák Daniel'),
(42,'Mertlík Petr'),
(47,'Mičjan Vlastimil'),
(53,'Mičjanová Ludmila'),
(20,'Mikesková Nikola'),
(35,'Musal Jan'),
(36,'Musalová Jana'),
(11,'Němečková Miloslava'),
(25,'Novák Jaroslav'),
(57,'Nováková Barbora'),
(5,'Ondřej Adam'),
(37,'Ondřej Daniel'),
(26,'Pixa Jiří'),
(15,'Pleyer Štěpán'),
(9,'Poláček Marek'),
(49,'Prucková Tereza'),
(6,'Rydl Ondřej'),
(30,'Ševčík Jiří'),
(46,'Špánik Milan'),
(34,'Stano Tibor'),
(54,'Stumpf Jiří'),
(27,'Tancibudek Miloš'),
(56,'Třeštiková Andrea'),
(51,'Vejchar David'),
(12,'Vidašič Peter'),
(31,'Wallová Kateřina'),
(7,'Žoudlík Václav');
/*!40000 ALTER TABLE `porotci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `souteze`
--

DROP TABLE IF EXISTS `souteze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `souteze` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `points` int(11) NOT NULL,
  `finals` int(11) NOT NULL,
  `date` date NOT NULL,
  `umisteni` int(11) NOT NULL,
  `pary` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `souteze`
--

LOCK TABLES `souteze` WRITE;
/*!40000 ALTER TABLE `souteze` DISABLE KEYS */;
INSERT INTO `souteze` VALUES
(1,'Praha Říčany','E',16,0,'2025-02-14',2,6),
(2,'Praha Říčany','E',32,0,'2025-02-15',1,14),
(3,'Praha Říčany','E',26,0,'2025-02-16',2,26),
(4,'Praha Smíchov','E',17,0,'2025-03-16',4,17),
(5,'Nové Strašecí','E',28,0,'2025-04-05',1,12),
(6,'Pardubice','E',39,0,'2025-04-06',1,21),
(7,'Rakovník','E',24,0,'2025-04-12',1,8),
(8,'Hradec Králové','E',37,0,'2025-04-18',1,19),
(9,'Neratovice','D',26,1,'2025-05-03',3,20),
(10,'Zichovec','D',13,0,'2025-05-10',2,5),
(11,'Kutná Hora','D',34,1,'2025-05-11',1,16);
/*!40000 ALTER TABLE `souteze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `souteze_porotci`
--

DROP TABLE IF EXISTS `souteze_porotci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `souteze_porotci` (
  `souteze_id` int(11) NOT NULL,
  `porotci_id` int(11) NOT NULL,
  `porotce_index` int(11) NOT NULL,
  PRIMARY KEY (`souteze_id`,`porotci_id`),
  KEY `porotci_id` (`porotci_id`),
  CONSTRAINT `souteze_porotci_ibfk_1` FOREIGN KEY (`souteze_id`) REFERENCES `souteze` (`id`),
  CONSTRAINT `souteze_porotci_ibfk_2` FOREIGN KEY (`porotci_id`) REFERENCES `porotci` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `souteze_porotci`
--

LOCK TABLES `souteze_porotci` WRITE;
/*!40000 ALTER TABLE `souteze_porotci` DISABLE KEYS */;
INSERT INTO `souteze_porotci` VALUES
(1,1,0),
(1,2,1),
(1,3,2),
(1,4,3),
(1,5,4),
(1,6,5),
(1,7,6),
(2,5,3),
(2,6,5),
(2,8,0),
(2,9,4),
(2,10,1),
(2,11,2),
(2,12,6),
(3,2,2),
(3,5,4),
(3,7,6),
(3,13,0),
(3,14,1),
(3,15,5),
(3,20,3),
(4,7,6),
(4,22,0),
(4,23,1),
(4,24,2),
(4,25,3),
(4,26,4),
(4,27,5),
(5,3,2),
(5,4,3),
(5,20,4),
(5,28,0),
(5,29,1),
(5,30,5),
(5,31,6),
(6,6,4),
(6,7,6),
(6,9,3),
(6,32,0),
(6,33,1),
(6,34,5),
(6,35,2),
(7,9,6),
(7,13,0),
(7,36,4),
(7,37,5),
(7,38,1),
(7,39,2),
(7,40,3),
(8,37,5),
(8,41,0),
(8,42,4),
(8,43,1),
(8,44,2),
(8,45,3),
(8,46,6),
(9,41,0),
(9,42,3),
(9,47,4),
(9,48,1),
(9,49,5),
(9,50,2),
(9,51,6),
(10,9,4),
(10,37,3),
(10,41,0),
(10,51,6),
(10,52,1),
(10,53,2),
(10,54,5),
(11,13,0),
(11,30,5),
(11,37,4),
(11,53,2),
(11,55,1),
(11,56,6),
(11,57,3);
/*!40000 ALTER TABLE `souteze_porotci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vysledky`
--

DROP TABLE IF EXISTS `vysledky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vysledky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soutez_id` int(11) NOT NULL,
  `samba` varchar(100) DEFAULT NULL,
  `chacha` varchar(100) DEFAULT NULL,
  `jive` varchar(100) DEFAULT NULL,
  `rumba` varchar(100) DEFAULT NULL,
  `paso` varchar(100) DEFAULT NULL,
  `round` varchar(100) NOT NULL,
  `pary` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `soutez_id` (`soutez_id`),
  CONSTRAINT `vysledky_ibfk_1` FOREIGN KEY (`soutez_id`) REFERENCES `souteze` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vysledky`
--

LOCK TABLES `vysledky` WRITE;
/*!40000 ALTER TABLE `vysledky` DISABLE KEYS */;
INSERT INTO `vysledky` VALUES
(1,9,'xxxxxxx','xxxxx-x','xxxxxxx','xxxxxxx',NULL,'1',20),
(2,9,'xxx-xxx','xxxxxxx','xxx---x','xxxxx-x',NULL,'2',13),
(3,9,'6512342','6511226','5631574','6521243',NULL,'final',7),
(4,8,'xxxxxxx','xxxxxx-','xxxxxx-',NULL,NULL,'1',6),
(5,8,'xxxxxx-','xxxxxx-','xxxxxx-',NULL,NULL,'2',12),
(6,8,'2111115','3311115','2131135',NULL,NULL,'final',19),
(7,7,'xxxxxxx','xxxxxxx','xxxxxxx',NULL,NULL,'1',8),
(8,7,'1121511','2121211','1132111',NULL,NULL,'final',5),
(9,6,'xxxxxxx','xxxxxxx','xx-xxxx',NULL,NULL,'1',21),
(10,6,'xxxxxxx','xxxxxxx','xxxxxx-',NULL,NULL,'2',14),
(11,6,'1111112','1212115','2212116',NULL,NULL,'final',6),
(12,5,'xxxxxxx','xxxxxxx','x-xxxxx',NULL,NULL,'1',12),
(13,5,'1511122','1311112','1211111',NULL,NULL,'final',6),
(14,4,'xxxxxxx','xxxxxxx','xxxxx-x',NULL,NULL,'1',17),
(15,4,'xxxxxx-','xxxxxxx','xxxxx-x',NULL,NULL,'2',11),
(16,4,'2344445','2332123','4367353',NULL,NULL,'final',7),
(17,3,'xxxxxx-','-xxxxx-','xxxxx--',NULL,NULL,'1',26),
(18,3,'xxxx-xx','-xxxxxx','-xxxx--',NULL,NULL,'2',12),
(19,3,'1214674','2114245','7323547',NULL,NULL,'final',7),
(20,2,'xxxxxxx','xxxxxxx','xxxx-xx',NULL,NULL,'1',14),
(21,2,'xxxxxxx','xxxxxxx','xx-x-xx',NULL,NULL,'2',12),
(22,2,'2322525','2213311','2132541',NULL,NULL,'final',6),
(23,1,'x-xxxx-','xxxxxx-','xx-xxx-',NULL,NULL,'1',6),
(24,1,'1422224','1233222','2433223',NULL,NULL,'final',4),
(25,10,'3121322','3111322','2221322','2211412',NULL,'final',5),
(26,11,'xxxxxxx','xxxxxxx','xxxxxxx','xxxxxxx',NULL,'1',16),
(27,11,'x-xxxxx','xxxxxxx','xxxxxxx','--xxxxx',NULL,'2',12),
(28,11,'2611111','6121111','2531111','2411111',NULL,'final',7);
/*!40000 ALTER TABLE `vysledky` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-05-17 10:42:40

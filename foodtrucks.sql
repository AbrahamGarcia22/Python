-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: FOODTRUCKS
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `EMPLEADO`
--

DROP TABLE IF EXISTS `EMPLEADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLEADO` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(45) DEFAULT NULL,
  `rfc` char(13) DEFAULT NULL,
  `no_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `no_sucursal` (`no_sucursal`),
  CONSTRAINT `EMPLEADO_ibfk_1` FOREIGN KEY (`no_sucursal`) REFERENCES `SUCURSAL` (`no_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLEADO`
--

LOCK TABLES `EMPLEADO` WRITE;
/*!40000 ALTER TABLE `EMPLEADO` DISABLE KEYS */;
INSERT INTO `EMPLEADO` VALUES (3,'Brad Pitt','PIBR100302ABC',1),(4,'Cristiano Ronaldo','R0CR800302ABC',1);
/*!40000 ALTER TABLE `EMPLEADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO` (
  `upc` char(12) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `antidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`upc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
INSERT INTO `PRODUCTO` VALUES ('750107383000','Aguafiel',8.50,200),('750107383123','Pringles',10.00,10),('750107383132','Café Americano',15.00,30),('750107383133','Turin Chocolate sin azúcar',190.00,15);
/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO_TICKET`
--

DROP TABLE IF EXISTS `PRODUCTO_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO_TICKET` (
  `upc` char(12) NOT NULL,
  `no_ticket` int(11) NOT NULL,
  `cantidad` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`upc`,`no_ticket`),
  KEY `no_ticket` (`no_ticket`),
  CONSTRAINT `PRODUCTO_TICKET_ibfk_1` FOREIGN KEY (`upc`) REFERENCES `PRODUCTO` (`upc`),
  CONSTRAINT `PRODUCTO_TICKET_ibfk_2` FOREIGN KEY (`no_ticket`) REFERENCES `TICKET` (`no_ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO_TICKET`
--

LOCK TABLES `PRODUCTO_TICKET` WRITE;
/*!40000 ALTER TABLE `PRODUCTO_TICKET` DISABLE KEYS */;
INSERT INTO `PRODUCTO_TICKET` VALUES ('750107383000',2,1),('750107383123',2,1),('750107383133',3,2);
/*!40000 ALTER TABLE `PRODUCTO_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUCURSAL`
--

DROP TABLE IF EXISTS `SUCURSAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUCURSAL` (
  `no_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUCURSAL`
--

LOCK TABLES `SUCURSAL` WRITE;
/*!40000 ALTER TABLE `SUCURSAL` DISABLE KEYS */;
INSERT INTO `SUCURSAL` VALUES (1,'NUTRETEC');
/*!40000 ALTER TABLE `SUCURSAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKET`
--

DROP TABLE IF EXISTS `TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TICKET` (
  `no_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `total` decimal(5,2) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `no_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`no_ticket`),
  KEY `id_empleado` (`id_empleado`),
  KEY `no_sucursal` (`no_sucursal`),
  CONSTRAINT `TICKET_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `EMPLEADO` (`id_empleado`),
  CONSTRAINT `TICKET_ibfk_2` FOREIGN KEY (`no_sucursal`) REFERENCES `SUCURSAL` (`no_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKET`
--

LOCK TABLES `TICKET` WRITE;
/*!40000 ALTER TABLE `TICKET` DISABLE KEYS */;
INSERT INTO `TICKET` VALUES (2,'2020-04-01 00:00:00',NULL,3,1),(3,'2020-04-01 12:42:00',NULL,4,1);
/*!40000 ALTER TABLE `TICKET` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-18 20:02:40

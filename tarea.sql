-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: tarea
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
  `no_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `no_emp_sup` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `CP` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `nombre_kiosko` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`no_empleado`),
  KEY `nombre_kiosko` (`nombre_kiosko`),
  CONSTRAINT `EMPLEADO_ibfk_1` FOREIGN KEY (`nombre_kiosko`) REFERENCES `KIOSKO` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLEADO`
--

LOCK TABLES `EMPLEADO` WRITE;
/*!40000 ALTER TABLE `EMPLEADO` DISABLE KEYS */;
INSERT INTO `EMPLEADO` VALUES (1,NULL,'123@mail.mx','5529330298','Danna Paola','Rivera','calle 1','Polanco','11300','CDMX','Michoacana'),(2,1,'0932@mail.mx','5216382222','Abraham','Garcia','calle 4','Coyoacan','11200','CDMX','Michoacana'),(3,1,'0922@mail.mx','5546382222','Belinda','Peregrin','calle 29','Condesa','11200','CDMX','Cafeteria'),(4,1,'1122@mail.mx','5546389082','Miguel Angel','Hernandez','calle 2','Condesa','11200','CDMX','Cafeteria');
/*!40000 ALTER TABLE `EMPLEADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KIOSKO`
--

DROP TABLE IF EXISTS `KIOSKO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KIOSKO` (
  `nombre` varchar(45) NOT NULL,
  `localizacion` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KIOSKO`
--

LOCK TABLES `KIOSKO` WRITE;
/*!40000 ALTER TABLE `KIOSKO` DISABLE KEYS */;
INSERT INTO `KIOSKO` VALUES ('Cafeteria','Condesa'),('Michoacana','Coyoacan');
/*!40000 ALTER TABLE `KIOSKO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO` (
  `EAN` char(13) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`EAN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO`
--

LOCK TABLES `PRODUCTO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO` DISABLE KEYS */;
INSERT INTO `PRODUCTO` VALUES ('1','Helado',20.30),('2','Cafe',10.21),('3','Paleta',15.00),('4','Pan',12.50),('5','Chocolate',22.20),('6','Frappe',40.12);
/*!40000 ALTER TABLE `PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO_has_KIOSKO`
--

DROP TABLE IF EXISTS `PRODUCTO_has_KIOSKO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO_has_KIOSKO` (
  `PRODUCTO_EAN` char(13) NOT NULL,
  `KIOSKO_nombre` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`PRODUCTO_EAN`),
  KEY `KIOSKO_nombre` (`KIOSKO_nombre`),
  CONSTRAINT `PRODUCTO_has_KIOSKO_ibfk_1` FOREIGN KEY (`KIOSKO_nombre`) REFERENCES `KIOSKO` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO_has_KIOSKO`
--

LOCK TABLES `PRODUCTO_has_KIOSKO` WRITE;
/*!40000 ALTER TABLE `PRODUCTO_has_KIOSKO` DISABLE KEYS */;
INSERT INTO `PRODUCTO_has_KIOSKO` VALUES ('1','Michoacana',20),('2','Michoacana',12),('3','Cafeteria',8),('4','Cafeteria',3);
/*!40000 ALTER TABLE `PRODUCTO_has_KIOSKO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTO_has_VENTA`
--

DROP TABLE IF EXISTS `PRODUCTO_has_VENTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTO_has_VENTA` (
  `PRODUCTO_EAN` char(13) DEFAULT NULL,
  `VENTA_no_venta` int(11) DEFAULT NULL,
  KEY `PRODUCTO_EAN` (`PRODUCTO_EAN`),
  KEY `VENTA_no_venta` (`VENTA_no_venta`),
  CONSTRAINT `PRODUCTO_has_VENTA_ibfk_1` FOREIGN KEY (`PRODUCTO_EAN`) REFERENCES `PRODUCTO` (`EAN`),
  CONSTRAINT `PRODUCTO_has_VENTA_ibfk_2` FOREIGN KEY (`VENTA_no_venta`) REFERENCES `VENTA` (`no_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTO_has_VENTA`
--

LOCK TABLES `PRODUCTO_has_VENTA` WRITE;
/*!40000 ALTER TABLE `PRODUCTO_has_VENTA` DISABLE KEYS */;
INSERT INTO `PRODUCTO_has_VENTA` VALUES ('1',1),('2',1),('1',1),('1',2),('2',2),('4',3),('1',4),('2',4);
/*!40000 ALTER TABLE `PRODUCTO_has_VENTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENTA`
--

DROP TABLE IF EXISTS `VENTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VENTA` (
  `no_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kiosko_venta` varchar(45) DEFAULT NULL,
  `no_empleado_venta` int(11) DEFAULT NULL,
  PRIMARY KEY (`no_venta`),
  KEY `kiosko_venta` (`kiosko_venta`),
  KEY `no_empleado_venta` (`no_empleado_venta`),
  CONSTRAINT `VENTA_ibfk_1` FOREIGN KEY (`kiosko_venta`) REFERENCES `KIOSKO` (`nombre`),
  CONSTRAINT `VENTA_ibfk_2` FOREIGN KEY (`no_empleado_venta`) REFERENCES `EMPLEADO` (`no_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENTA`
--

LOCK TABLES `VENTA` WRITE;
/*!40000 ALTER TABLE `VENTA` DISABLE KEYS */;
INSERT INTO `VENTA` VALUES (1,'2020-04-15 00:20:31','Michoacana',2),(2,'2020-04-15 00:22:23','Michoacana',2),(3,'2020-04-15 00:22:42','Cafeteria',4),(4,'2020-04-15 00:22:53','Michoacana',1);
/*!40000 ALTER TABLE `VENTA` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-18 20:01:43

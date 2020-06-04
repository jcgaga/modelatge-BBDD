-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: optica
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `idBrand` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL,
  `proveiderId` int NOT NULL,
  PRIMARY KEY (`idBrand`),
  UNIQUE KEY `idBrandProveider_UNIQUE` (`idBrand`),
  KEY `fk_Proveider_idProveider_idx` (`proveiderId`),
  CONSTRAINT `fk_Proveider_idProveider` FOREIGN KEY (`proveiderId`) REFERENCES `provider` (`idProvider`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Oakley',1),(2,'Polaroid',2),(3,'Arnette',3),(4,'Carrera',2),(5,'Bollé',1),(6,'Police',3);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `postalCode` int NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  `registrationDate` datetime NOT NULL,
  `recomendedUserId` int DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `idClient_UNIQUE` (`idClient`),
  KEY `fk_RecomendedUser_idRecomendedUser_idx` (`recomendedUserId`),
  CONSTRAINT `fk_RecomendedUser_idRecomendedUser` FOREIGN KEY (`recomendedUserId`) REFERENCES `recomendedclient` (`idRecomendedClient`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (2,'Mario',8019,'932165487','mario@hotmail.com','2020-05-03 00:00:00',15),(3,'Cristina',8021,'935684574','cristina@gmail.com','2020-05-14 00:00:00',16),(4,'David',8016,'935892345','david@yahoo.com','2020-05-30 00:00:00',17),(5,'Marta',8903,'935682384','marta@gmail.com','2020-06-04 00:00:00',18),(6,'Pepe',8046,'932165587','pepe@hotmail.com','2020-05-03 00:00:00',19),(7,'María',8087,'935684354','maria@gmail.com','2020-05-04 00:00:00',20),(8,'Jorge',8069,'935892652','jorge@yahoo.com','2020-05-06 00:00:00',21),(9,'Sabrina',8120,'935682497','sabrina@gmail.com','2020-06-04 00:00:00',22);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `idEmployee` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`idEmployee`),
  UNIQUE KEY `idEmployee_UNIQUE` (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Joan'),(2,'Marta'),(3,'Pere'),(4,'Silvia'),(5,'David'),(6,'Tania');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasscolor`
--

DROP TABLE IF EXISTS `glasscolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasscolor` (
  `idGlassColor` int NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`idGlassColor`),
  UNIQUE KEY `idGlassesColor_UNIQUE` (`idGlassColor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasscolor`
--

LOCK TABLES `glasscolor` WRITE;
/*!40000 ALTER TABLE `glasscolor` DISABLE KEYS */;
INSERT INTO `glasscolor` VALUES (1,'Red'),(2,'Blue'),(3,'Green'),(4,'Yellow'),(5,'Black'),(6,'Orange');
/*!40000 ALTER TABLE `glasscolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `idGlasses` int NOT NULL AUTO_INCREMENT,
  `brandId` int NOT NULL,
  `graduationGlassRight` int NOT NULL,
  `graduationGlassLeft` int NOT NULL,
  `glassesFrameTypeId` int NOT NULL,
  `glassesFrameColorId` int NOT NULL,
  `glassColorRightId` int NOT NULL,
  `glassColorLeftId` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`idGlasses`),
  UNIQUE KEY `idGlasses_UNIQUE` (`idGlasses`),
  KEY `fk_Brand_idBrand_idx` (`brandId`),
  KEY `fk_GlassesFrame_idGlassesFrame_idx` (`glassesFrameTypeId`),
  KEY `fk_GlassesFrameColor_idGlassesFrameColor_idx` (`glassesFrameColorId`),
  KEY `fk_GlassColor_idGlassColor_idx` (`glassColorRightId`),
  KEY `fk_GlassColor_idGlassColor_Left_idx` (`glassColorLeftId`),
  CONSTRAINT `fk_Brand_idBrand` FOREIGN KEY (`brandId`) REFERENCES `brand` (`idBrand`),
  CONSTRAINT `fk_GlassColor_idGlassColor_Left` FOREIGN KEY (`glassColorLeftId`) REFERENCES `glasscolor` (`idGlassColor`),
  CONSTRAINT `fk_GlassColor_idGlassColor_Right` FOREIGN KEY (`glassColorRightId`) REFERENCES `glasscolor` (`idGlassColor`),
  CONSTRAINT `fk_GlassesFrameColor_idGlassesFrameColor` FOREIGN KEY (`glassesFrameColorId`) REFERENCES `glassesframecolor` (`idGlassesFrameColor`),
  CONSTRAINT `fk_GlassesFrameType_idGlassesFrameType` FOREIGN KEY (`glassesFrameTypeId`) REFERENCES `glassesframetype` (`idGlassesFrameType`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,1,2,3,1,1,2,2,500),(2,3,5,5,3,4,4,4,320),(3,5,2,3,2,2,6,6,180),(4,2,7,7,3,5,1,1,220),(5,4,3,3,1,2,6,6,560),(6,6,1,1,2,5,3,3,440),(7,3,5,5,1,2,2,2,210),(8,6,4,4,3,4,1,1,356),(9,1,8,8,2,3,5,5,750),(10,4,8,8,1,2,6,6,780);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glassesframecolor`
--

DROP TABLE IF EXISTS `glassesframecolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glassesframecolor` (
  `idGlassesFrameColor` int NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`idGlassesFrameColor`),
  UNIQUE KEY `idGlassesFrameColor_UNIQUE` (`idGlassesFrameColor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glassesframecolor`
--

LOCK TABLES `glassesframecolor` WRITE;
/*!40000 ALTER TABLE `glassesframecolor` DISABLE KEYS */;
INSERT INTO `glassesframecolor` VALUES (1,'Black'),(2,'Pink'),(3,'Silver'),(4,'Gold'),(5,'Blue');
/*!40000 ALTER TABLE `glassesframecolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glassesframetype`
--

DROP TABLE IF EXISTS `glassesframetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glassesframetype` (
  `idGlassesFrameType` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`idGlassesFrameType`),
  UNIQUE KEY `idGlassesFrame_UNIQUE` (`idGlassesFrameType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glassesframetype`
--

LOCK TABLES `glassesframetype` WRITE;
/*!40000 ALTER TABLE `glassesframetype` DISABLE KEYS */;
INSERT INTO `glassesframetype` VALUES (1,'Floating'),(2,'Paste'),(3,'Metallic');
/*!40000 ALTER TABLE `glassesframetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glassessale`
--

DROP TABLE IF EXISTS `glassessale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glassessale` (
  `idGlassesSale` int NOT NULL AUTO_INCREMENT,
  `employeeId` int NOT NULL,
  `clientId` int NOT NULL,
  `glassesId` int NOT NULL,
  PRIMARY KEY (`idGlassesSale`),
  UNIQUE KEY `idGlassesSale_UNIQUE` (`idGlassesSale`),
  KEY `fk_Employee_idEmployee_idx` (`employeeId`),
  KEY `fk_Client_idClient_idx` (`clientId`),
  KEY `fk_Glasses_idGlasses_idx` (`glassesId`),
  CONSTRAINT `fk_Client_idClient` FOREIGN KEY (`clientId`) REFERENCES `client` (`idClient`),
  CONSTRAINT `fk_Employee_idEmployee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`idEmployee`),
  CONSTRAINT `fk_Glasses_idGlasses` FOREIGN KEY (`glassesId`) REFERENCES `glasses` (`idGlasses`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glassessale`
--

LOCK TABLES `glassessale` WRITE;
/*!40000 ALTER TABLE `glassessale` DISABLE KEYS */;
INSERT INTO `glassessale` VALUES (11,6,2,1),(12,6,2,2),(13,4,3,3),(14,2,4,4),(15,3,5,5),(16,5,6,6),(17,1,7,7),(18,3,8,8),(19,2,9,9),(20,2,9,10);
/*!40000 ALTER TABLE `glassessale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `idProvider` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `street` varchar(45) NOT NULL,
  `number` int NOT NULL,
  `floor` int NOT NULL,
  `door` int NOT NULL,
  `city` varchar(45) NOT NULL,
  `postalCode` int NOT NULL,
  `phone` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `nif` varchar(8) NOT NULL,
  PRIMARY KEY (`idProvider`),
  UNIQUE KEY `idProvider_UNIQUE` (`idProvider`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'Prosun','Pallars',73,0,12,'Barcelona',8019,'933564859','933587781','4596547F'),(2,'Kamaleons','Camí del Mar',75,4,2,'Valencia',46001,'961176806','961586955','8968781J'),(3,'Marola','Camino de las Azaleas',247,1,6,'Gijón',33201,'985176806','985176812','6489324H');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recomendedclient`
--

DROP TABLE IF EXISTS `recomendedclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recomendedclient` (
  `idRecomendedClient` int NOT NULL AUTO_INCREMENT,
  `clientId1` int NOT NULL,
  `clientId2` int DEFAULT NULL,
  PRIMARY KEY (`idRecomendedClient`),
  KEY `fk_Client_idClient_Client1_idx` (`clientId1`),
  KEY `fk_Client_idClient_Client2_idx` (`clientId2`),
  CONSTRAINT `fk_Client_idClient_Client1` FOREIGN KEY (`clientId1`) REFERENCES `client` (`idClient`),
  CONSTRAINT `fk_Client_idClient_Client2` FOREIGN KEY (`clientId2`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendedclient`
--

LOCK TABLES `recomendedclient` WRITE;
/*!40000 ALTER TABLE `recomendedclient` DISABLE KEYS */;
INSERT INTO `recomendedclient` VALUES (15,2,NULL),(16,3,2),(17,4,3),(18,5,2),(19,6,5),(20,7,4),(21,8,6),(22,9,7);
/*!40000 ALTER TABLE `recomendedclient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-04 11:20:20

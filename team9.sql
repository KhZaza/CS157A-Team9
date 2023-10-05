-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: team_9
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `AdminID` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('383953fe-61a9-11ee-971a-a74a79842739','Ivana','Admin','D@taB@seMan@g156~'),('38395b4c-61a9-11ee-971a-a74a79842739','Khaled','Admin','KkH@13d~~156'),('38395c6e-61a9-11ee-971a-a74a79842739','FredJ','Admin','Fr3DJH3YD00D'),('38395cc8-61a9-11ee-971a-a74a79842739','John','Admin','P0t@0F@rm3r2'),('38395d18-61a9-11ee-971a-a74a79842739','Kate','Admin','T0m@toF@rm3r1'),('38395fac-61a9-11ee-971a-a74a79842739','Nate','Admin','!Summ3rD@yZ2001!'),('3839601a-61a9-11ee-971a-a74a79842739','Gabe','Admin','Gr3@tG@bsy2000~'),('38396060-61a9-11ee-971a-a74a79842739','Jenny','Admin','!M@cb00kUs3r156$'),('383960ba-61a9-11ee-971a-a74a79842739','Mike','Admin','W1ndOwU$3r86#156'),('38396100-61a9-11ee-971a-a74a79842739','Monica','Admin','#Th3Wh1t3House~#');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `CartID` varchar(45) NOT NULL,
  `Items` varchar(45) DEFAULT NULL,
  `Total Price` int DEFAULT NULL,
  PRIMARY KEY (`CartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `History` int DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('FitnessFreak','1S@nJOseSt@t3UniSad1',NULL,'9303 Garden Lane Schererville, IN 46375','pinaeple@gmail.com'),('FoodieAdventures','##C0mput3rSc13nc3%1##',NULL,'8252 SW. Orange St. Rolla, MO 65401','cookiesncream@gmail.com'),('GamingFanatic','P!LLB0ttlez99#',NULL,' 54 NW. Wild Horse Court, Glen Ellyn, IL 60137','zootehnic@gmail.com'),('JaneDoe','!!WaterB0ttle800()!!',NULL,'80 Beach St. Jamaica Plain, MA 02130','claytent@yahoo.com'),('JohnSmith','156_Us3r13_156~CS~',NULL,'123 New York, New York','goldshowe@gmail.com'),('MovieBuffs','*CS*D3P@RT*156*',NULL,' 7360 Wagon Ave. Tucson, AZ 85718','apollodone@gmail.com'),('MusicLover','Ti$$ueB0X147!',NULL,'7071 Del Monte Street Murfreesboro, TN 37128','potao@yahoo.com'),('TechGeek','98SUSh1Fish98',NULL,'340 Longfellow Street, Marietta, GA 30008','qball9@gmail.com'),('Traveler101','S0ckANDS@nd@1$66',NULL,' 30 Philmont Street, Oxon Hill, MD 20745','tomatopota@gmail.com'),('User101001','@M1k3WUTHEPr0f156@',NULL,' 13 Lincoln Dr. Allentwon, PA 18102','madagas@yahoo.com');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `Subject` varchar(45) DEFAULT NULL,
  `Body` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES (8,'Shipping','Hello, wanted to say great job on shipping speed!'),(9,'Boxes','The boxes were nicely secured'),(10,'What does Cart do?','What does a Cart do?'),(11,'Order Amount','How many items can we put in our orders at once?'),(12,'Perfect items!','Your items were nicely packaged and great.'),(13,'NICE!','This car part works really well.'),(14,'POOR','This car part is poorly made.'),(15,'Top notch stuff!','Item is great!'),(16,'Return policy','How do I return a product?'),(17,'Nice quality!','The part was perfectly made and fit my car nicely!');
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inventory` (
  `InventoryID` int NOT NULL AUTO_INCREMENT,
  `Qty` int DEFAULT NULL,
  PRIMARY KEY (`InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manufacturer`
--

DROP TABLE IF EXISTS `Manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manufacturer` (
  `ManufacturerID` int NOT NULL AUTO_INCREMENT,
  `Brand` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manufacturer`
--

LOCK TABLES `Manufacturer` WRITE;
/*!40000 ALTER TABLE `Manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) DEFAULT NULL,
  `Total Price` int NOT NULL,
  `Contact Info` varchar(45) NOT NULL,
  `Shipping Address` varchar(45) NOT NULL,
  `Payment Method` varchar(45) NOT NULL,
  `CustomerID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID_idx` (`CustomerID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Part`
--

DROP TABLE IF EXISTS `Part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Part` (
  `PartID` int NOT NULL AUTO_INCREMENT,
  `[Sell]Price` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Part`
--

LOCK TABLES `Part` WRITE;
/*!40000 ALTER TABLE `Part` DISABLE KEYS */;
/*!40000 ALTER TABLE `Part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tag` (
  `TagID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) DEFAULT NULL,
  `Brand` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-04 22:00:02

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
-- Table structure for table `Access`
--

DROP TABLE IF EXISTS `Access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Access` (
  `Username_A` varchar(45) NOT NULL,
  `CartID_A` varchar(45) NOT NULL,
  KEY `Username_idx` (`Username_A`),
  KEY `CartID_A_idx` (`CartID_A`),
  CONSTRAINT `CartID_A` FOREIGN KEY (`CartID_A`) REFERENCES `Cart` (`CartID`),
  CONSTRAINT `Username_A` FOREIGN KEY (`Username_A`) REFERENCES `Customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access`
--

LOCK TABLES `Access` WRITE;
/*!40000 ALTER TABLE `Access` DISABLE KEYS */;
/*!40000 ALTER TABLE `Access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Added To`
--

DROP TABLE IF EXISTS `Added To`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Added To` (
  `PartID_Ad` int NOT NULL,
  `CartID_Ad` varchar(45) NOT NULL,
  `Qty` int NOT NULL DEFAULT '1' COMMENT 'Default is always 1 since you always just add one item to the cart unless you specify the amount. ',
  KEY `PartID_Ad_idx` (`PartID_Ad`),
  KEY `CartID_Ad_idx` (`CartID_Ad`),
  CONSTRAINT `CartID_Ad` FOREIGN KEY (`CartID_Ad`) REFERENCES `Cart` (`CartID`),
  CONSTRAINT `PartID_Ad` FOREIGN KEY (`PartID_Ad`) REFERENCES `Part` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Added To`
--

LOCK TABLES `Added To` WRITE;
/*!40000 ALTER TABLE `Added To` DISABLE KEYS */;
/*!40000 ALTER TABLE `Added To` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `Becomes`
--

DROP TABLE IF EXISTS `Becomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Becomes` (
  `CartID` varchar(45) NOT NULL,
  `OrderID` int NOT NULL,
  `Order_Date` int NOT NULL,
  KEY `CartID_idx` (`CartID`),
  KEY `OrderID_idx` (`OrderID`),
  CONSTRAINT `CartID` FOREIGN KEY (`CartID`) REFERENCES `Cart` (`CartID`),
  CONSTRAINT `OrderID` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Becomes`
--

LOCK TABLES `Becomes` WRITE;
/*!40000 ALTER TABLE `Becomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Becomes` ENABLE KEYS */;
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
-- Table structure for table `Contains`
--

DROP TABLE IF EXISTS `Contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contains` (
  `InventoryID_Co` int NOT NULL,
  `PartID_Co` int NOT NULL,
  KEY `PartID_Co_idx` (`PartID_Co`),
  KEY `InventoryID_Co_idx` (`InventoryID_Co`),
  CONSTRAINT `InventoryID_Co` FOREIGN KEY (`InventoryID_Co`) REFERENCES `Inventory` (`InventoryID`),
  CONSTRAINT `PartID_Co` FOREIGN KEY (`PartID_Co`) REFERENCES `Part` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contains`
--

LOCK TABLES `Contains` WRITE;
/*!40000 ALTER TABLE `Contains` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contains` ENABLE KEYS */;
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
-- Table structure for table `Gives`
--

DROP TABLE IF EXISTS `Gives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gives` (
  `Username` varchar(45) DEFAULT NULL,
  `FeedbackID` int DEFAULT NULL,
  KEY `Username_idx` (`Username`),
  KEY `FeedbackID_idx` (`FeedbackID`),
  CONSTRAINT `FeedbackID` FOREIGN KEY (`FeedbackID`) REFERENCES `Feedback` (`FeedbackID`),
  CONSTRAINT `Username` FOREIGN KEY (`Username`) REFERENCES `Customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gives`
--

LOCK TABLES `Gives` WRITE;
/*!40000 ALTER TABLE `Gives` DISABLE KEYS */;
INSERT INTO `Gives` VALUES ('JaneDoe',8),('FitnessFreak',15),('Traveler101',17),('JohnSmith',16),('GamingFanatic',14),('MusicLover',13),('MusicLover',12),('TechGeek',11),('MovieBuffs',10),('MovieBuffs',8);
/*!40000 ALTER TABLE `Gives` ENABLE KEYS */;
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
-- Table structure for table `Manage`
--

DROP TABLE IF EXISTS `Manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manage` (
  `AdminID_M` varchar(255) NOT NULL,
  `InventoryID` int NOT NULL,
  KEY `AdminID_M_idx` (`AdminID_M`),
  KEY `InventoryID_M_idx` (`InventoryID`),
  CONSTRAINT `AdminID_M` FOREIGN KEY (`AdminID_M`) REFERENCES `Admin` (`AdminID`),
  CONSTRAINT `InventoryID_M` FOREIGN KEY (`InventoryID`) REFERENCES `Inventory` (`InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manage`
--

LOCK TABLES `Manage` WRITE;
/*!40000 ALTER TABLE `Manage` DISABLE KEYS */;
/*!40000 ALTER TABLE `Manage` ENABLE KEYS */;
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
  PRIMARY KEY (`OrderID`)
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
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `AdminID_R` varchar(255) NOT NULL,
  `FeedbackID_R` int NOT NULL,
  `Completed_R` int NOT NULL DEFAULT '0' COMMENT 'Default is 0 for False because assume that all the feedback reports have not been read yet. An Admin will make it 1 if it’s completed. ',
  KEY `AdminID_R_idx` (`AdminID_R`),
  KEY `FeedbackID_R_idx` (`FeedbackID_R`),
  CONSTRAINT `AdminID_R` FOREIGN KEY (`AdminID_R`) REFERENCES `Admin` (`AdminID`),
  CONSTRAINT `FeedbackID_R` FOREIGN KEY (`FeedbackID_R`) REFERENCES `Feedback` (`FeedbackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES ('383953fe-61a9-11ee-971a-a74a79842739',8,0),('383953fe-61a9-11ee-971a-a74a79842739',10,1),('383953fe-61a9-11ee-971a-a74a79842739',11,0),('38395c6e-61a9-11ee-971a-a74a79842739',12,0),('38395c6e-61a9-11ee-971a-a74a79842739',13,1),('38395c6e-61a9-11ee-971a-a74a79842739',14,1),('38395b4c-61a9-11ee-971a-a74a79842739',15,0),('38395b4c-61a9-11ee-971a-a74a79842739',16,0),('38395b4c-61a9-11ee-971a-a74a79842739',17,0),('38396100-61a9-11ee-971a-a74a79842739',9,0);
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Search`
--

DROP TABLE IF EXISTS `Search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Search` (
  `Username_S` varchar(45) NOT NULL,
  `PartID_S` int NOT NULL,
  KEY `Username_S_idx` (`Username_S`),
  KEY `PartID_S_idx` (`PartID_S`),
  CONSTRAINT `PartID_S` FOREIGN KEY (`PartID_S`) REFERENCES `Part` (`PartID`),
  CONSTRAINT `Username_S` FOREIGN KEY (`Username_S`) REFERENCES `Customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Search`
--

LOCK TABLES `Search` WRITE;
/*!40000 ALTER TABLE `Search` DISABLE KEYS */;
/*!40000 ALTER TABLE `Search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplies`
--

DROP TABLE IF EXISTS `Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplies` (
  `ManufactuerID_Su` int NOT NULL,
  `PartID_Su` int NOT NULL,
  `[BUY]Price` int NOT NULL,
  `Delivery Date` datetime NOT NULL,
  KEY `ManufacturerID_Su_idx` (`ManufactuerID_Su`),
  KEY `PartID_idx` (`PartID_Su`),
  CONSTRAINT `ManufacturerID_Su` FOREIGN KEY (`ManufactuerID_Su`) REFERENCES `Manufacturer` (`ManufacturerID`),
  CONSTRAINT `PartID_Su` FOREIGN KEY (`PartID_Su`) REFERENCES `Part` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplies`
--

LOCK TABLES `Supplies` WRITE;
/*!40000 ALTER TABLE `Supplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `View`
--

DROP TABLE IF EXISTS `View`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `View` (
  `Usernames` varchar(45) NOT NULL,
  `OrderIDs` int NOT NULL,
  KEY `Username_idx` (`Usernames`),
  KEY `OrderIDs_idx` (`OrderIDs`),
  CONSTRAINT `OrderIDs` FOREIGN KEY (`OrderIDs`) REFERENCES `Order` (`OrderID`),
  CONSTRAINT `Usernames` FOREIGN KEY (`Usernames`) REFERENCES `Customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `View`
--

LOCK TABLES `View` WRITE;
/*!40000 ALTER TABLE `View` DISABLE KEYS */;
/*!40000 ALTER TABLE `View` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-05  5:46:18

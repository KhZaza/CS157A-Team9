-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (x86_64)
--
-- Host: 127.0.0.1    Database: team9
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access` (
  `Username` varchar(45) NOT NULL,
  `CartID` varchar(45) NOT NULL,
  `currentCart` int DEFAULT '0',
  KEY `Username_idx` (`Username`),
  KEY `CartID_A_idx` (`CartID`),
  CONSTRAINT `CartID_A` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`),
  CONSTRAINT `Username_A` FOREIGN KEY (`Username`) REFERENCES `customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES ('11','59',NULL),('11','60',NULL),('potato','502',1),('Gail','9431',1);
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `added to`
--

DROP TABLE IF EXISTS `added to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `added to` (
  `PartID` int NOT NULL,
  `CartID` varchar(45) NOT NULL,
  `Qty` int NOT NULL DEFAULT '1' COMMENT 'Default is always 1 since you always just add one item to the cart unless you specify the amount. ',
  KEY `PartID_Ad_idx` (`PartID`),
  KEY `CartID_Ad_idx` (`CartID`),
  CONSTRAINT `CartID_Ad` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`),
  CONSTRAINT `PartID_AD` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `added to`
--

LOCK TABLES `added to` WRITE;
/*!40000 ALTER TABLE `added to` DISABLE KEYS */;
INSERT INTO `added to` VALUES (16,'59',2),(16,'60',1),(17,'60',1),(17,'60',1),(25,'1397',20),(27,'8723',3),(17,'502',100),(21,'502',1),(16,'9431',1),(17,'9431',1),(16,'9431',3);
/*!40000 ALTER TABLE `added to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminID` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('1','1','Admin','1'),('383953fe-61a9-11ee-971a-a74a79842739','Ivana','Admin','D@taB@seMan@g156~'),('38395b4c-61a9-11ee-971a-a74a79842739','Khaled','Admin','KkH@13d~~156'),('38395c6e-61a9-11ee-971a-a74a79842739','FredJ','Admin','Fr3DJH3YD00D'),('38395cc8-61a9-11ee-971a-a74a79842739','John','Admin','P0t@0F@rm3r2'),('38395d18-61a9-11ee-971a-a74a79842739','Kate','Admin','T0m@toF@rm3r1'),('38395fac-61a9-11ee-971a-a74a79842739','Nate','Admin','!Summ3rD@yZ2001!'),('3839601a-61a9-11ee-971a-a74a79842739','Gabe','Admin','Gr3@tG@bsy2000~'),('38396060-61a9-11ee-971a-a74a79842739','Jenny','Admin','!M@cb00kUs3r156$'),('383960ba-61a9-11ee-971a-a74a79842739','Mike','Admin','W1ndOwU$3r86#156'),('38396100-61a9-11ee-971a-a74a79842739','Monica','Admin','#Th3Wh1t3House~#'),('mikewu','mikewu','Admin','mike');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `becomes`
--

DROP TABLE IF EXISTS `becomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `becomes` (
  `CartID` varchar(45) NOT NULL,
  `OrderID` int NOT NULL,
  `Order_Date` varchar(45) NOT NULL COMMENT 'please delete this after. note to self',
  KEY `CartID_idx` (`CartID`),
  KEY `OrderID_idx` (`OrderID`),
  CONSTRAINT `CartID` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`),
  CONSTRAINT `OrderID` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `becomes`
--

LOCK TABLES `becomes` WRITE;
/*!40000 ALTER TABLE `becomes` DISABLE KEYS */;
INSERT INTO `becomes` VALUES ('59',59,'1984'),('60',66,'2022'),('9431',76,'2023-12-04'),('9431',77,'2023-12-04'),('9431',78,'2023-12-04'),('9431',79,'2023-12-04'),('9431',80,'2023-12-04'),('9431',82,'2023-12-04');
/*!40000 ALTER TABLE `becomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CartID` varchar(45) NOT NULL,
  `Total Price` int DEFAULT '-1',
  PRIMARY KEY (`CartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('1',NULL),('1397',-1),('2842',-1),('502',-1),('59',60),('60',100),('61',160),('62',200),('63',270),('64',470),('65',98),('66',355),('67',470),('68',65),('8723',-1),('9431',826);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `InventoryID_Co` int NOT NULL,
  `PartID_Co` int NOT NULL,
  KEY `PartID_Co_idx` (`PartID_Co`),
  KEY `InventoryID_Co_idx` (`InventoryID_Co`),
  CONSTRAINT `InventoryID_Co` FOREIGN KEY (`InventoryID_Co`) REFERENCES `inventory` (`InventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cookies`
--

DROP TABLE IF EXISTS `Cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cookies` (
  `Username` varchar(255) NOT NULL,
  `SessionToken` varchar(255) NOT NULL,
  PRIMARY KEY (`SessionToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cookies`
--

LOCK TABLES `Cookies` WRITE;
/*!40000 ALTER TABLE `Cookies` DISABLE KEYS */;
INSERT INTO `Cookies` VALUES ('potato','_tB1ROR7NhxdXiId2SkYsoU-DUE'),('Gail','-nvTOBIi5H8fKBWnnsnDq_xLaao'),('gail','1NeO46FnQUcC4Cdu6L1QIqO5Sxk'),('potato','2P_xd02P4lPp3-ipe4P3dKTVo4I'),('potato','3zSUxOWZsm_nwNbtl2GK1buTTMU'),('potato','46VoXVvw3JBHMN8f9mquTk5GnhE'),('Gail','4tmcvSs13LA8R5KV2lTCFJl66nk'),('potato','5NpRB5MxPmAxq3BgHU0_zsPBjZ4'),('Gail','6Z6soVP_IAD-_1_IE018XnCrD6o'),('Gail','AGug5sfjbklfEYe7Ut-i00rrK0k'),('potato','AN9PcHU3rUEqXPJUVS5CGGE5CM0'),('Gail','bj0CwXtitbEy4gBHuq1dKX17C-Q'),('Gail','GinSkvwmLsavzrXBDFFG8ZWR1BE'),('Gail','gJr-rQMH4RQdMyjLMk4TAWjt0sc'),('Gail','gN_F4akS8_EoYn736HsK4xpA8M8'),('gail','H11w0396OE_D9DW2WJhf_C7HwnI'),('gail','i_yqpeSUQS0zOkQXAyqnVpD-M1A'),('Gail','jc6IVVRAjU9Tm6lwl7Fz_fZB4sc'),('12','jc75NZkbdNEQOkjbiueocs7mafw'),('Gail','JihNBrPdIoga-o9tyueAHwcXU34'),('gail','jv4h9IfqxpElTBNPv0xm5QKphes'),('potato','KFCpEtVMZJgLAAJZZpIcsyJ2_Kk'),('Gail','MWDDKJe1uem55rG-xCzOFG9_B5M'),('potato','PisOalYELb-i6yphiSv6h4ZWTX4'),('potato','Rj-29HvNFRgzjr5ZXuQqg-7gooI'),('potato','sgKQj6bP-4Ol0QHw7LK1N2E_zk0'),('potato','tLN939I_7YqKUiatxKgxvODZneg'),('Gail','U6NWiHENY1xqoGIIFcNBIiaVYXM'),('gail','vtArPWAVYDJMo54dRYWjWB8UbbQ'),('11','yrKkskaWyXZtqINVsryhllH5YqY');
/*!40000 ALTER TABLE `Cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Username` varchar(45) NOT NULL,
  `FName` varchar(45) NOT NULL,
  `LName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1','toto','toto','toto@gmail.com','1','toto'),('11','bob','potato','bobpotato@gmail.com','$2a$12$NEjVa5V4JjcBcc2M5aWLd.3Sf4STo9dV41wZedKgnAy0Y0KA3dRIG','123 potato'),('12','12','12','12@gmail.com','$2a$12$m3n/9thmukSN3fQgnKFotu8sSSqjBwTwEZ/PsERbc28tHvNrhSAFq','12'),('123213123','21321312312','21321312321','21312312@gmail.com','$2a$12$aMEtnp/xNEbyfHBqPoHMZ.hXbOKqGGgGfMe7VIzPCYkWxDPdjcsb.','sadasdas'),('2','2','2','2@gmail.com','2','2'),('3','3','3','3@gmail.com','3','3'),('4','4','4','4@gmail.com','$2a$12$dodOz6aYM2FCMeQciOTbsuJX/T6/uWDJ7mxHSq.N8cAXopdDXSZha','a'),('5','5','5','5@gmail.com','5','5'),('6','6','6','6@gmail.com','6','6'),('asdasdsa','sadasdsa','sadasdsa','sadasd@gmail.com','$2a$12$CiNp5Z24zdXDiuTjOpNdA.06vkWeNXl3EwSVNphl3Dryg4mO2KeE6','sdasds'),('asdsa','sdasd','sdasdas','asdasd@gmail.com','$2a$12$GffuaZ4WY1oCowFgP9jYJOAhv4Q9R3SAnsgqNr3e2.DosSoRXBVHe','12321'),('FitnessFreak','Fred','James','pinaeple@gmail.com','1S@nJOseSt@t3UniSad1','9303 Garden Lane Schererville, IN 46375'),('FoodieAdventures','Eve','Christ','cookiesncream@gmail.com','##C0mput3rSc13nc3%1##','8252 SW. Orange St. Rolla, MO 65401'),('Gail','Gail','Lewis','Gail.Lewis@sjsu.edu','$2a$12$cZBZeSno6RNA3fBv1CSbRuHI1bgxuG9gbYHS7ozAqOWV//hBonhG6','4324 Dream st, pari, Ca'),('GamingFanatic','Cal','Zaza','zootehnic@gmail.com','P!LLB0ttlez99#',' 54 NW. Wild Horse Court, Glen Ellyn, IL 60137'),('ivana','ivana','ivana','ivana@gmail.com','11111111Aa','ivana'),('JaneDoe','Jane','Doe','claytent@yahoo.com','!!WaterB0ttle800()!!','80 Beach St. Jamaica Plain, MA 02130'),('JohnSmith','John','Smith','goldshowe@gmail.com','156_Us3r13_156~CS~','123 New York, New York'),('MovieBuffs','Monica','Buffs','apollodone@gmail.com','*CS*D3P@RT*156*',' 7360 Wagon Ave. Tucson, AZ 85718'),('MusicLover','Mac','Love','potao@yahoo.com','Ti$$ueB0X147!','7071 Del Monte Street Murfreesboro, TN 37128'),('p','p','p','p@gmail.com','$2a$12$htkOJm62JQQEaRPowe/0Ze7t.OHBa193N.DrIneADehP8G68KfNrK','1'),('pllaspdasd','ava','avava','avas@gmail.com','$2a$12$Q18RQrbq0x8Sng6I0vEsC.Q4T8tFE8wejj8Sgx06kMyZFSQtskYve','sadsadsa'),('pooooooooooo','popopo','popopop','popop@yahoo.com','$2a$12$jFtJkPQNcbQVpiqm9mZeNOqzTsnJKR4wn1II1auvruqsNcA1eMOp6','asdasd'),('potato','potat','potat','potat@gmail.com','$2a$12$6/2p7muesmksxv2zFxjYmuo2hJwW6fDN/ov6zjrTDke4AG8OdiyA2','potato'),('sadasdasdasdasd','asdasdasdas','sadasdasdsa','sdadsadasdas@yahoo.com','$2a$12$ZAoXgsfv9pp/vOdgtoXaEu8nyI3dGuHwbd6xeFQ.a.0eTj7b0/Weq','asdasdsa'),('TechGeek','Tecca','German','qball9@gmail.com','98SUSh1Fish98','340 Longfellow Street, Marietta, GA 30008'),('Traveler101','Tequila','Johnson','tomatopota@gmail.com','S0ckANDS@nd@1$66',' 30 Philmont Street, Oxon Hill, MD 20745'),('User101001','Kate','Tam','madagas@yahoo.com','@M1k3WUTHEPr0f156@',' 13 Lincoln Dr. Allentwon, PA 18102');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `Subject` varchar(45) DEFAULT NULL,
  `Body` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (8,'Shipping','Hello, wanted to say great job on shipping speed!'),(9,'Boxes','The boxes were nicely secured'),(10,'What does Cart do?','What does a Cart do?'),(11,'Order Amount','How many items can we put in our orders at once?'),(12,'Perfect items!','Your items were nicely packaged and great.'),(13,'NICE!','This car part works really well.'),(14,'POOR','This car part is poorly made.'),(15,'Top notch stuff!','Item is great!'),(16,'Return policy','How do I return a product?'),(17,'Nice quality!','The part was perfectly made and fit my car nicely!'),(33,'1','1'),(35,'asdasdsa','sadasdad'),(37,NULL,NULL),(38,'potato','potato'),(39,'sad','asd'),(40,'aa','aa'),(41,'as','a'),(42,'Nice','Nice package'),(43,'Nice','Nice package'),(44,'Nice','Nice package'),(45,NULL,NULL);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gives`
--

DROP TABLE IF EXISTS `gives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gives` (
  `Username` varchar(45) DEFAULT NULL,
  `FeedbackID` int DEFAULT NULL,
  KEY `Username_idx` (`Username`),
  KEY `FeedbackID_idx` (`FeedbackID`),
  CONSTRAINT `FeedbackID` FOREIGN KEY (`FeedbackID`) REFERENCES `feedback` (`FeedbackID`),
  CONSTRAINT `Username` FOREIGN KEY (`Username`) REFERENCES `customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gives`
--

LOCK TABLES `gives` WRITE;
/*!40000 ALTER TABLE `gives` DISABLE KEYS */;
INSERT INTO `gives` VALUES ('JaneDoe',8),('FitnessFreak',15),('Traveler101',17),('JohnSmith',16),('GamingFanatic',14),('MusicLover',13),('MusicLover',12),('TechGeek',11),('MovieBuffs',10),('MovieBuffs',8),('11',43),('11',44),('11',45);
/*!40000 ALTER TABLE `gives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `InventoryID` int NOT NULL AUTO_INCREMENT,
  `Qty` int DEFAULT NULL,
  PRIMARY KEY (`InventoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (10,10),(11,20),(12,20),(13,30),(14,12),(15,6),(16,4),(17,6),(18,8),(19,8);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manage`
--

DROP TABLE IF EXISTS `manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manage` (
  `AdminID` varchar(255) NOT NULL,
  `QTY` int NOT NULL DEFAULT '1',
  `PartID` int DEFAULT NULL,
  KEY `AdminID_idx` (`AdminID`),
  KEY `PartID2_idx` (`PartID`),
  CONSTRAINT `AdminID` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`),
  CONSTRAINT `PartID` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manage`
--

LOCK TABLES `manage` WRITE;
/*!40000 ALTER TABLE `manage` DISABLE KEYS */;
INSERT INTO `manage` VALUES ('1',0,NULL),('1',1,NULL),('1',2,NULL);
/*!40000 ALTER TABLE `manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `ManufacturerID` int NOT NULL AUTO_INCREMENT,
  `Brand` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Mercedes','German'),(2,'BMW','German'),(3,'Dodge','US'),(4,'Volvo','UK'),(5,'Ford','US'),(6,'Toyota','Japan'),(7,'Honda','Japan'),(8,'Nissan','Japan'),(9,'Chevrolet','US'),(10,'Mazda','Japan');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `Contact Info` varchar(45) DEFAULT NULL,
  `Shipping Address` varchar(100) DEFAULT NULL,
  `CustomerID` varchar(255) DEFAULT NULL,
  `Status` varchar(45) DEFAULT 'Pending',
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (59,'zootehnic@gmail.com',' 54 NW. Wild Horse Court, Glen Ellyn, IL 60137','11','Pending'),(60,'tomatopota@gmail.com',' 54 NW. Wild Horse Court, Glen Ellyn, IL 60137','ivana','Pending'),(61,'qball9@gmail.com','340 Longfellow Street, Marietta, GA 30008','ivana','Pending'),(62,'potao@yahoo.com','7071 Del Monte Street Murfreesboro, TN 37128','JaneDoe','Pending'),(63,'pinaeple@gmail.com','9303 Garden Lane Schererville, IN 46375','JaneDoe','Pending'),(64,'madagas@yahoo.com',' 13 Lincoln Dr. Allentwon, PA 18102','JohnSmith','Pending'),(65,'goldshowe@gmail.com','123 New York, New York','JohnSmith','Pending'),(66,'cookiesncream@gmail.com','9303 Garden Lane Schererville, IN 46375','11','Pending'),(67,'claytent@yahoo.com','123 New York, New York','TechGeek','Pending'),(68,'apollodone@gmail.com',' 7360 Wagon Ave. Tucson, AZ 85718','TechGeek','Pending'),(69,NULL,NULL,'1','Pending'),(70,NULL,NULL,'Gail','Pending'),(71,NULL,NULL,'Gail','Pending'),(72,NULL,NULL,'Gail','Pending'),(73,NULL,NULL,'Gail','Pending'),(74,NULL,NULL,'Gail','Pending'),(75,NULL,NULL,'Gail','Pending'),(76,NULL,NULL,'Gail','Pending'),(77,NULL,NULL,'Gail','Pending'),(78,NULL,NULL,'gail','Pending'),(79,NULL,NULL,'gail','Pending'),(80,NULL,NULL,'gail','Pending'),(81,'Test','null, Test, Test 645645','gail','Pending'),(82,NULL,NULL,'gail','Pending'),(83,'','null, ,  ','gail','Pending');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part` (
  `PartID` int NOT NULL AUTO_INCREMENT,
  `Category` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Sell Price` int NOT NULL,
  `Description` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`PartID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (16,'Engine','Coil',192,'Component in the ignition system that generates high-voltage electricity to create a spark in the spark plugs, which ignites the air-fuel mixture in the engine\'s cylinders.','https://m.media-amazon.com/images/I/61X5aCIWRCL._AC_UF894,1000_QL80_.jpg'),(17,'Engine','Spark Plug',58,'Device that fits into each cylinder of an internal combustion engine to ignite the air-fuel mixture by creating a spark.','https://m.media-amazon.com/images/I/71tqIg+ETUL.jpg'),(18,'Engine','Serpentine Drive Belt Kit',55,'A single, long belt that drives various engine accessories such as the alternator, water pump, and power steering pump. The kit includes the belt and related components.','https://m.media-amazon.com/images/I/51M4CMN0rEL.jpg'),(19,'Engine','Alternator',253,'an electrical generator that charges the vehicle\'s battery and provides power to the electrical systems when the engine is running.','https://m.media-amazon.com/images/I/81RBQAENBoL.jpg'),(20,'Engine','Water Pump',420,'A component of the engine cooling system that circulates coolant (water and antifreeze) through the engine to maintain an optimal operating temperature.','https://m.media-amazon.com/images/I/51m1GSJrHdL._AC_SL1000_.jpg'),(21,'Engine','Thermostat',701,'A temperature-sensitive valve that regulates the flow of coolant through the engine to maintain the desired operating temperature.','https://m.media-amazon.com/images/I/81djPTynaoL._AC_SL1500_.jpg'),(22,'Engine','Idle Pulley',65,'A tensioner pulley used in the serpentine belt system to maintain proper tension on the belt.','https://m.media-amazon.com/images/I/61J+-7fQkrL._AC_SL1500_.jpg'),(23,'Engine','Valve Cover Gaskey',253,'This gasket seals the gap between the valve cover and the cylinder head to prevent oil leaks from the engine.','https://m.media-amazon.com/images/I/61J+-7fQkrL._AC_SL1500_.jpg'),(24,'Engine','Head Gasket',811,'Critical seal between the engine block and the cylinder head, preventing coolant and oil from mixing and sealing the combustion chambers.','https://m.media-amazon.com/images/I/71t6LaysVpL._AC_SL1500_.jpg'),(25,'Engine','Engine Oil Filter',15,'Traps impurities and debris in the engine oil, preventing them from damaging the engine.','https://m.media-amazon.com/images/I/71swwdyHRjL._AC_SL1500_.jpg'),(26,'Engine','Turbo',3441,'Compresses air and increases engine performance by forcing more air into the cylinders for combustion.','https://m.media-amazon.com/images/I/61keGqwtuDL._AC_SL1500_.jpg'),(27,'Engine','Supercharger',2537,'Type of forced induction device that increases engine power by compressing air and delivering it to the engine','https://m.media-amazon.com/images/I/61yxdmtBVHL._AC_SX679_.jpg'),(28,'potato','potato',1,'potato salad','potato'),(30,'tomato','Tomato',2,'Tomato','Tomato'),(31,'Brake','Brake Pads',1,'This is just a simple brake pad. ','https://m.media-amazon.com/images/I/71uLQVjm1pL._AC_UF1000,1000_QL80_.jpg');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `AdminID_R` varchar(255) NOT NULL,
  `FeedbackID_R` int NOT NULL,
  `Completed_R` int NOT NULL DEFAULT '0' COMMENT 'Default is 0 for False because assume that all the feedback reports have not been read yet. An Admin will make it 1 if it’s completed. ',
  KEY `AdminID_R_idx` (`AdminID_R`),
  KEY `FeedbackID_R_idx` (`FeedbackID_R`),
  CONSTRAINT `AdminID_R` FOREIGN KEY (`AdminID_R`) REFERENCES `admin` (`AdminID`),
  CONSTRAINT `FeedbackID_R` FOREIGN KEY (`FeedbackID_R`) REFERENCES `feedback` (`FeedbackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('383953fe-61a9-11ee-971a-a74a79842739',8,0),('383953fe-61a9-11ee-971a-a74a79842739',10,1),('383953fe-61a9-11ee-971a-a74a79842739',11,0),('38395c6e-61a9-11ee-971a-a74a79842739',12,0),('38395c6e-61a9-11ee-971a-a74a79842739',13,1),('38395c6e-61a9-11ee-971a-a74a79842739',14,1),('38395b4c-61a9-11ee-971a-a74a79842739',15,0),('38395b4c-61a9-11ee-971a-a74a79842739',16,0),('38395b4c-61a9-11ee-971a-a74a79842739',17,0),('38396100-61a9-11ee-971a-a74a79842739',9,0);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search` (
  `Username` varchar(45) NOT NULL,
  `PartID` int DEFAULT NULL,
  KEY `Username_S_idx` (`Username`),
  KEY `PartID_idx` (`PartID`),
  KEY `PartID_search_idx` (`PartID`),
  CONSTRAINT `PartID_search` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`),
  CONSTRAINT `Username_S` FOREIGN KEY (`Username`) REFERENCES `customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
INSERT INTO `search` VALUES ('TechGeek',NULL),('TechGeek',NULL),('MovieBuffs',NULL),('User101001',NULL),('User101001',NULL),('FoodieAdventures',NULL),('JohnSmith',NULL),('JohnSmith',NULL),('GamingFanatic',NULL),('JaneDoe',NULL);
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `ManufacturerID_Su` int NOT NULL,
  `PartID_Su` int NOT NULL,
  `Buy Price` int NOT NULL,
  `Delivery Date` date NOT NULL,
  KEY `ManufacturerID_Su_idx` (`ManufacturerID_Su`),
  KEY `PartID_idx` (`PartID_Su`),
  CONSTRAINT `ManufacturerID_Su` FOREIGN KEY (`ManufacturerID_Su`) REFERENCES `manufacturer` (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,10,55,'2016-05-20'),(2,12,95,'2005-08-26'),(3,11,300,'2002-06-12'),(4,13,300,'2021-03-25'),(5,14,300,'2021-03-25'),(6,15,50,'2021-03-25'),(7,16,30,'2011-03-21'),(8,17,60,'2011-03-21'),(9,18,260,'2017-06-13'),(10,19,100,'2017-06-13');
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view`
--

DROP TABLE IF EXISTS `view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view` (
  `Username` varchar(45) NOT NULL,
  `OrderID` int NOT NULL,
  `Status` varchar(45) NOT NULL DEFAULT 'not shipped',
  KEY `Username_idx` (`Username`),
  KEY `OrderIDs_idx` (`OrderID`),
  CONSTRAINT `OrderIDs` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `Usernames` FOREIGN KEY (`Username`) REFERENCES `customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view`
--

LOCK TABLES `view` WRITE;
/*!40000 ALTER TABLE `view` DISABLE KEYS */;
INSERT INTO `view` VALUES ('gail',81,'not shipped'),('gail',83,'not shipped');
/*!40000 ALTER TABLE `view` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04 12:37:34

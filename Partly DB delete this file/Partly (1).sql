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
  KEY `CartID_A_idx` (`CartID`),
  KEY `username_idx` (`Username`),
  CONSTRAINT `Username_A` FOREIGN KEY (`Username`) REFERENCES `customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES ('KURDI23','7644',0),('kurdi23','7431',0),('kurdi23','8447',0),('sharm','415',0),('sharm','327',0),('sharm','5043',0),('pop32','9342',0),('pop32','8435',0),('pop32','1332',0),('pop32','5653',0),('pop32','7318',0),('pop32','6743',0),('pop32','3798',0),('pop32','3454',0),('pop32','4600',1),('kurdi23','9119',1);
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
  CONSTRAINT `CartID_Ad` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PartID_AD` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `added to`
--

LOCK TABLES `added to` WRITE;
/*!40000 ALTER TABLE `added to` DISABLE KEYS */;
INSERT INTO `added to` VALUES (26,'7644',1),(33,'7644',1),(18,'7431',1),(22,'8447',1),(23,'8447',4),(22,'8447',1),(36,'8447',5),(33,'8447',6),(31,'8447',1),(33,'8447',1),(19,'8447',1),(17,'8447',345),(21,'8447',1),(22,'8447',15),(36,'8447',1),(32,'8447',1),(19,'8447',4),(18,'415',1),(19,'327',1),(34,'5043',1),(18,'9342',1),(16,'8435',1),(36,'1332',1),(16,'5653',1),(22,'7318',1),(31,'6743',1),(31,'3798',1),(33,'3454',1),(18,'4600',1),(18,'9119',1),(23,'9119',1);
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
  `Order_Date` varchar(45) DEFAULT NULL,
  KEY `CartID_idx` (`CartID`),
  KEY `OrderID_idx` (`OrderID`),
  CONSTRAINT `CartID` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrderID` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `becomes`
--

LOCK TABLES `becomes` WRITE;
/*!40000 ALTER TABLE `becomes` DISABLE KEYS */;
INSERT INTO `becomes` VALUES ('7644',74,'2023-12-10'),('7431',75,'2023-12-10'),('8447',76,'2023-12-10'),('415',79,'2023-12-10'),('327',80,'2023-12-10'),('5043',81,'2023-12-10'),('9342',82,'2023-12-10'),('8435',83,'2023-12-10'),('1332',84,'2023-12-10'),('5653',85,'2023-12-10'),('7318',86,'2023-12-10'),('6743',87,'2023-12-10'),('3798',88,'2023-12-10'),('3454',89,'2023-12-10');
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
INSERT INTO `cart` VALUES ('1',NULL),('1332',899),('1397',-1),('2429',105),('2842',2345),('327',253),('3454',20),('3798',30),('415',55),('4600',-1),('502',534),('5043',50),('5653',30),('59',60),('60',100),('61',160),('62',200),('63',270),('6311',899),('64',470),('65',98),('66',355),('67',470),('6743',30),('68',65),('6843',120),('7318',22),('7431',55),('7644',3461),('8435',30),('8447',11763),('8723',533),('9119',-1),('9342',55);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
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
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cookies`
--

LOCK TABLES `Cookies` WRITE;
/*!40000 ALTER TABLE `Cookies` DISABLE KEYS */;
INSERT INTO `Cookies` VALUES ('pop32','NsdUAzjE8mfNGwAGICb7q3njyck');
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
INSERT INTO `customer` VALUES ('Fatsfl','Marigo','sdasdas','asdasd@gmail.com','$2a$12$GffuaZ4WY1oCowFgP9jYJOAhv4Q9R3SAnsgqNr3e2.DosSoRXBVHe','24147 Clinton Court, Hayward CA 94545'),('FitnessFreak','Fred','Laroza','pinaeple@gmail.com','1S@nJOseSt@t3UniSad1','9303 Garden Lane Schererville, IN 46375'),('FoodieAdventures','Eve','Christ','cookiesncream@gmail.com','##C0mput3rSc13nc3%1##','8252 SW. Orange St. Rolla, MO 65401'),('Gail22','Gail','Lewis','gail.lewi@gmail.com','$2a$12$YcJkU0NQU19o.rBDza6flOYeqS8gACh4ULwFIBezZvayIlb6V9IOy','4876 Norris Road, Fremont CA 94536'),('GamingFanatic','Cal','Zaza','zootehnic@gmail.com','P!LLB0ttlez99#',' 54 NW. Wild Horse Court, Glen Ellyn, IL 60137'),('iamauser','username','lastname','useremail@gmail.com','$2a$12$ksPQ5axVbGwzSIo64WeUVupBSuiebCLRJmexv04fXycsK/lkcRo.i','107 Guaymas Place, Davis CA 95616'),('JaneDoe','Jane','Doe','claytent@yahoo.com','!!WaterB0ttle800()!!','80 Beach St. Jamaica Plain, MA 02130'),('Joey12','Joey','Joe','Joey@gmail.com','$2a$12$XHw2yUucBfmnPf30D.4E.uTDCDbXSUI.uNsZ1ZI3V/hlSYKRZ71aO','1797 Pasatiempo Drive, Chico CA 95928'),('JohnSmith','John','Smith','goldshowe@gmail.com','156_Us3r13_156~CS~','1643 Oxford Street, Berkeley CA 94709'),('Kurdi23','Khalood','Holod','habibi@gmail.com','$2a$12$DDmrOjBprltUKzOKNjLPme7CHkyZH1PYPqmpUljPl3nj.iLQRp7Pi','2443 Sierra Nevada Road, Mammoth Lakes CA 93546.'),('mike12','Khaled','test','test@gm.ck','$2a$12$7EEG2MIWEHaTkM4yc25o/.eJn/F.FxToZ.ARH6YILmemTW6ctalt6','18789 Crane Avenue, Castro Valley CA 94546'),('MovieBuffs','Monica','Buffs','apollodone@gmail.com','*CS*D3P@RT*156*',' 7360 Wagon Ave. Tucson, AZ 85718'),('MusicLover','Mac','Love','potao@yahoo.com','Ti$$ueB0X147!','7071 Del Monte Street Murfreesboro, TN 37128'),('pllaspdasd','ava','avava','avas@gmail.com','$2a$12$Q18RQrbq0x8Sng6I0vEsC.Q4T8tFE8wejj8Sgx06kMyZFSQtskYve','4231 Miramonte Way, Union City CA 94587'),('pooooooooooo','popopo','popopop','popop@yahoo.com','$2a$12$jFtJkPQNcbQVpiqm9mZeNOqzTsnJKR4wn1II1auvruqsNcA1eMOp6','2902 Flint Street, Union City CA 94587'),('pop32','poplog','Floaca','Floca@gmail.com','$2a$12$yjtS3EeJjn3WegaUSAb1PeOY9/AvQsldnn/UtLjjLlolR9yDJn3Yq','222 Quince Street, San Diego CA 92103222 Quince Street, San Diego CA 92103'),('potato','potat','potat','potat@gmail.com','$2a$12$6/2p7muesmksxv2zFxjYmuo2hJwW6fDN/ov6zjrTDke4AG8OdiyA2','2807 Huxley Place, Fremont CA 94555'),('Rah32','Rahmi','Latizi','latizi@gmail.com','$2a$12$o4UH0UcAn1/iAhCJwq5Jn.QvQIm3JJtedlEZGaJZ.tyuc1wwMNFGK','2685 California Street, Mountain View CA 94040.'),('Ramiboyz','Rami','Anyaz','Anazy@yahoo.com','$2a$12$Nwk7RB4pKyFQVJUkSYAtAOCJw7/uk1bj/IztkF/XDOLV9L/weDSee','4439 Gale Street, Livermore CA 94550.'),('Rotoza','Sharmts','Rotiza','sadasd@gmail.com','$2a$12$CiNp5Z24zdXDiuTjOpNdA.06vkWeNXl3EwSVNphl3Dryg4mO2KeE6','169 Avenida Drive, Berkeley CA 94708'),('sadasdasdasdasd','asdasdasdas','sadasdasdsa','sdadsadasdas@yahoo.com','$2a$12$ZAoXgsfv9pp/vOdgtoXaEu8nyI3dGuHwbd6xeFQ.a.0eTj7b0/Weq','asdasdsa'),('sharm','Shamrta','Local','Fornocamp@gmail.com','$2a$12$U66OrLa8ImcS4IWEt9dg0.tDBIgme23FjWF1sfY9yFXWpe.tE/OzS','11522 Country Spring Court, Cupertino CA 95014'),('TechGeek','Tecca','German','qball9@gmail.com','98SUSh1Fish98','340 Longfellow Street, Marietta, GA 30008'),('Traveler101','Tequila','Johnson','tomatopota@gmail.com','S0ckANDS@nd@1$66',' 30 Philmont Street, Oxon Hill, MD 20745'),('User101001','Kate','Tam','madagas@yahoo.com','@M1k3WUTHEPr0f156@',' 13 Lincoln Dr. Allentwon, PA 18102'),('ZOba','Maholq','sharmha','sharma@gmail.com','$2a$12$vTCr5szOnvnFHoAsh474puD0TIkpsuRfIo/GpMxWlZ.GsAmYQdvQC','3377 Sandstone Court, Pleasanton CA 94588');
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (8,'Shipping','Hello, wanted to say great job on shipping speed!'),(9,'Boxes','The boxes were nicely secured'),(10,'What does Cart do?','What does a Cart do?'),(11,'Order Amount','How many items can we put in our orders at once?'),(12,'Perfect items!','Your items were nicely packaged and great.'),(13,'NICE!','This car part works really well.'),(14,'POOR','This car part is poorly made.'),(15,'Top notch stuff!','Item is great!'),(16,'Return policy','How do I return a product?'),(17,'Nice quality!','The part was perfectly made and fit my car nicely!'),(42,'Perfect looks','Nice package'),(43,'I like it ','its fast '),(44,'Nice','Nice package'),(46,'Very nice website','Really line the interface'),(47,'Cart is not working as I want','Please add more buttons and I like to have more features to test. '),(48,'Really good looks','Nice colors'),(49,'Fancy','Looks perfect good job'),(50,'nav bar','Can you change the color of the nav bar'),(51,'New feature','Can you please add a new feature like phone calls'),(52,'Mechanic shop','Where is the nearest machine shop next to 98437'),(53,'Responsive','Very responsive and user friendly '),(54,'Feddbak','Good Feedback page'),(55,'Can I be an admin','Who to be an admin'),(56,'Can I buy this website','Can I buy any website'),(57,'Developers in need','Can I have contact with the developers '),(58,'What is the best this ','What is the best this about this life'),(59,'new part','Can you please add new parts '),(60,'What is the limit to buy','Is there a limit on how much to buy?'),(61,'Setting page','Can you please add more pictures');
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
  CONSTRAINT `FeedbackID` FOREIGN KEY (`FeedbackID`) REFERENCES `feedback` (`FeedbackID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Username` FOREIGN KEY (`Username`) REFERENCES `customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gives`
--

LOCK TABLES `gives` WRITE;
/*!40000 ALTER TABLE `gives` DISABLE KEYS */;
INSERT INTO `gives` VALUES ('Kurdi23',47),('kurdi23',48),('pop32',49),('pop32',50),('pop32',51),('pop32',52),('pop32',53),('pop32',54),('pop32',55),('pop32',56),('pop32',57),('pop32',58),('pop32',59),('pop32',60),('pop32',61);
/*!40000 ALTER TABLE `gives` ENABLE KEYS */;
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
  CONSTRAINT `AdminID` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PartID` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manage`
--

LOCK TABLES `manage` WRITE;
/*!40000 ALTER TABLE `manage` DISABLE KEYS */;
INSERT INTO `manage` VALUES ('1',50,16),('mikewu',141,31),('1',67,16),('mikewu',169,17),('1',155,18),('mikewu',78,19),('1',184,20),('mikewu',47,21),('1',93,22),('mikewu',132,23),('1',41,24),('mikewu',72,25),('1',45,26),('mikewu',121,27),('1',131,31),('mikewu',99,32),('1',62,33),('mikewu',124,34),('1',93,16),('mikewu',55,17),('1',103,18),('mikewu',162,19);
/*!40000 ALTER TABLE `manage` ENABLE KEYS */;
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
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (62,'potao@yahoo.com','7071 Del Monte Street Murfreesboro, TN 37128','JaneDoe','Pending'),(63,'pinaeple@gmail.com','9303 Garden Lane Schererville, IN 46375','JaneDoe','Pending'),(64,'madagas@yahoo.com',' 13 Lincoln Dr. Allentwon, PA 18102','JohnSmith','Pending'),(65,'goldshowe@gmail.com','123 New York, New York','JohnSmith','Pending'),(67,'claytent@yahoo.com','1528 Stafford Avenue, Hayward CA 94541','TechGeek','Pending'),(68,'apollodone@gmail.com',' 7360 Wagon Ave. Tucson, AZ 85718','TechGeek','Pending'),(70,'john@example.com','125 John Street, Santa Cruz CA 95060','mike12','Pending'),(71,'john@example.com','3835 Oakes Drive, Hayward CA 94542','mike12','Pending'),(72,'john@example.com','2134 West Mills Drive, Orange CA 92868','Joey12','Pending'),(73,'john@example.com','5396 North Reese Avenue, Fresno CA 93722','iamauser','Pending'),(74,'habib@gmail.com','2531 Prestwick Avenue, Concord CA 94519','KURDI23','Pending'),(75,'Facyll@long.com','968 Virginia Avenue, Olivehurst CA 95961','kurdi23','Pending'),(76,'Ramiwer@yhoo.com','1011 Devon Drive, Hayward CA 94542','kurdi23','Pending'),(77,'normaldu@gmail.com','310 12th Avenue, Santa Cruz CA 95062','TechGeek','Pending'),(78,'liover222@gmail.com','330 Michell Court, Livermore CA 94551','MusicLover','Delivered'),(79,'gward@optonline.net\n','970 Old Oak Road, Livermore CA 94550','sharm','Pending'),(80,'dexter@att.net\n','4016 Doane Street, Fremont CA 94538','sharm','Pending'),(81,'gward@optonline.net\n','310 12th Avenue, Santa Cruz CA 95062','sharm','Pending'),(82,'marnanel@mac.com\n','1987 Boxer Court, San Lorenzo CA 94580','pop32','Pending'),(83,'marnanel@mac.com\n','2134 West Mills Drive, Orange CA 92868','pop32','Pending'),(84,'pappp@live.com\n','4016 Doane Street, Fremont CA 94538','pop32','Pending'),(85,'shazow@mac.com\n','6214 Herzog Street, Oakland CA 94608','pop32','Pending'),(86,'pappp@live.com\n','22825 Paseo Place, Hayward CA 94541','pop32','Pending'),(87,'shazow@mac.com\n','1987 Boxer Court, San Lorenzo CA 94580','pop32','Pending'),(88,'parkes@sbcglobal.net\n','22825 Paseo Place, Hayward CA 94541','pop32','Pending'),(89,'pappp@live.com\n','11522 Country Spring Court, Cupertino CA 95014','pop32','Pending');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (16,'Engine','Coil',30,'Component in the ignition system that generates high-voltage electricity to create a spark in the spark plugs, which ignites the air-fuel mixture in the engine\'s cylinders.','https://m.media-amazon.com/images/I/61X5aCIWRCL._AC_UF894,1000_QL80_.jpg'),(17,'Engine','Spark Plug',12,'Device that fits into each cylinder of an internal combustion engine to ignite the air-fuel mixture by creating a spark.','https://m.media-amazon.com/images/I/71tqIg+ETUL.jpg'),(18,'Engine','Serpentine Drive Belt Kit',55,'A single, long belt that drives various engine accessories such as the alternator, water pump, and power steering pump. The kit includes the belt and related components.','https://m.media-amazon.com/images/I/51M4CMN0rEL.jpg'),(19,'Engine','Alternator',253,'an electrical generator that charges the vehicle\'s battery and provides power to the electrical systems when the engine is running.','https://m.media-amazon.com/images/I/81RBQAENBoL.jpg'),(20,'Engine','Water Pump',420,'A component of the engine cooling system that circulates coolant (water and antifreeze) through the engine to maintain an optimal operating temperature.','https://m.media-amazon.com/images/I/51m1GSJrHdL._AC_SL1000_.jpg'),(21,'Engine','Thermostat',32,'A temperature-sensitive valve that regulates the flow of coolant through the engine to maintain the desired operating temperature.','https://m.media-amazon.com/images/I/81djPTynaoL._AC_SL1500_.jpg'),(22,'Engine','Idle Pulley',22,'A tensioner pulley used in the serpentine belt system to maintain proper tension on the belt.','https://m.media-amazon.com/images/I/61J+-7fQkrL._AC_SL1500_.jpg'),(23,'Engine','Transmission Mount',87,'Durability is superior for cars, trucks and SUVs; road salt, oil, and a host of other common under car contaminants will eventually destroy the rubber bushings on your vehicles, not to mention the weight and torque forces that typically compress rubber','https://m.media-amazon.com/images/I/71aRXanT5dL._AC_SL1500_.jpg'),(24,'Engine','Valve Cover Gaskey',76,'This gasket seals the gap between the valve cover and the cylinder head to prevent oil leaks from the engine.','https://m.media-amazon.com/images/I/71t6LaysVpL._AC_SL1500_.jpg'),(25,'Engine','Head Gasket',124,'Critical seal between the engine block and the cylinder head, preventing coolant and oil from mixing and sealing the combustion chambers.','https://m.media-amazon.com/images/I/71swwdyHRjL._AC_SL1500_.jpg'),(26,'Engine','Turbo',3441,'Compresses air and increases engine performance by forcing more air into the cylinders for combustion.','https://m.media-amazon.com/images/I/61keGqwtuDL._AC_SL1500_.jpg'),(27,'Engine','Supercharger',2537,'Type of forced induction device that increases engine power by compressing air and delivering it to the engine','https://m.media-amazon.com/images/I/61yxdmtBVHL._AC_SX679_.jpg'),(31,'Brake','Brake Pads',30,'This is just a simple brake pad. ','https://m.media-amazon.com/images/I/71uLQVjm1pL._AC_UF1000,1000_QL80_.jpg'),(32,'Oil','ATF',40,'FOR USE IN 95% of ATF VEHICLES INCLUDING MOST CVTs in operation with US registered light duty applications\r\nHIGH PERFORMANCE CONDITIONING AGENTS prolong seal elasticity to prevent leaks','https://m.media-amazon.com/images/I/61Y7U92jX4L.__AC_SY300_SX300_QL70_FMwebp_.jpg'),(33,'Fluid','Blinker Fluid',20,'Lights running low? Need a boost in brightness? Get your car\'s headlights shining bright with Saltiel Good\'s Blinker Fluid!','https://m.media-amazon.com/images/I/516nF4k5LOL._AC_SL1000_.jpg'),(34,'Lights','Philips H7 Headlight Blub',50,'Get up to 30% more vision on the road compared to a standard minimum legal requirements in low beam headlamp test results\r\nChoose Philips Vision headlights for increased comfort and safety','https://m.media-amazon.com/images/I/71+PH3IutaL._AC_SL1500_.jpg'),(36,'Engine','700HP Billet Stage 3 Twin Turbos',899,'twin turbos','https://m.media-amazon.com/images/I/61il-kbtnRL._AC_SL1000_.jpg');
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
  CONSTRAINT `AdminID_R` FOREIGN KEY (`AdminID_R`) REFERENCES `admin` (`AdminID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FeedbackID_R` FOREIGN KEY (`FeedbackID_R`) REFERENCES `feedback` (`FeedbackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('1',8,1),('mikewu',9,0),('1',10,1),('mikewu',11,0),('1',12,1),('mikewu',13,0),('1',14,1),('mikewu',15,0),('1',16,1),('mikewu',17,0),('1',8,1),('mikewu',9,0),('1',10,1),('mikewu',11,0),('1',12,1),('mikewu',13,0),('1',14,1),('mikewu',15,0),('1',16,1),('mikewu',17,0);
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
  CONSTRAINT `PartID_search` FOREIGN KEY (`PartID`) REFERENCES `part` (`PartID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Username_S` FOREIGN KEY (`Username`) REFERENCES `customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
INSERT INTO `search` VALUES ('sharm',16),('Rotoza',17),('Ramiboyz',18),('MusicLover',19),('sharm',20),('Rotoza',21),('Ramiboyz',22),('MusicLover',23),('sharm',24),('Rotoza',25),('Ramiboyz',26),('MusicLover',27),('sharm',31),('Rotoza',32),('Ramiboyz',33),('MusicLover',34),('sharm',16),('Rotoza',17),('Ramiboyz',18),('MusicLover',19);
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
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
  CONSTRAINT `OrderIDs` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Usernames` FOREIGN KEY (`Username`) REFERENCES `customer` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view`
--

LOCK TABLES `view` WRITE;
/*!40000 ALTER TABLE `view` DISABLE KEYS */;
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

-- Dump completed on 2023-12-10 15:57:24

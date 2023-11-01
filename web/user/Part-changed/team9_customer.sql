-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: team9
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
  `History` int DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1','1','1','1@gmail.com','1','1',NULL),('2','2','2','2@gmail.com','2','2',NULL),('3','3','3','3@gmail.com','3','3',NULL),('4','4','4','4@gmail.com','$2a$12$dodOz6aYM2FCMeQciOTbsuJX/T6/uWDJ7mxHSq.N8cAXopdDXSZha','a',NULL),('5','5','5','5@gmail.com','5','5',NULL),('6','6','6','6@gmail.com','6','6',NULL),('asdsa','sdasd','sdasdas','asdasd@gmail.com','$2a$12$GffuaZ4WY1oCowFgP9jYJOAhv4Q9R3SAnsgqNr3e2.DosSoRXBVHe','12321',NULL),('FitnessFreak','Fred','James','pinaeple@gmail.com','1S@nJOseSt@t3UniSad1','9303 Garden Lane Schererville, IN 46375',NULL),('FoodieAdventures','Eve','Christ','cookiesncream@gmail.com','##C0mput3rSc13nc3%1##','8252 SW. Orange St. Rolla, MO 65401',NULL),('GamingFanatic','Cal','Zaza','zootehnic@gmail.com','P!LLB0ttlez99#',' 54 NW. Wild Horse Court, Glen Ellyn, IL 60137',NULL),('ivana','ivana','ivana','ivana@gmail.com','11111111Aa','ivana',NULL),('JaneDoe','Jane','Doe','claytent@yahoo.com','!!WaterB0ttle800()!!','80 Beach St. Jamaica Plain, MA 02130',NULL),('JohnSmith','John','Smith','goldshowe@gmail.com','156_Us3r13_156~CS~','123 New York, New York',NULL),('MovieBuffs','Monica','Buffs','apollodone@gmail.com','*CS*D3P@RT*156*',' 7360 Wagon Ave. Tucson, AZ 85718',NULL),('MusicLover','Mac','Love','potao@yahoo.com','Ti$$ueB0X147!','7071 Del Monte Street Murfreesboro, TN 37128',NULL),('p','p','p','p@gmail.com','$2a$12$htkOJm62JQQEaRPowe/0Ze7t.OHBa193N.DrIneADehP8G68KfNrK','1',NULL),('pllaspdasd','ava','avava','avas@gmail.com','$2a$12$Q18RQrbq0x8Sng6I0vEsC.Q4T8tFE8wejj8Sgx06kMyZFSQtskYve','sadsadsa',NULL),('TechGeek','Tecca','German','qball9@gmail.com','98SUSh1Fish98','340 Longfellow Street, Marietta, GA 30008',NULL),('Traveler101','Tequila','Johnson','tomatopota@gmail.com','S0ckANDS@nd@1$66',' 30 Philmont Street, Oxon Hill, MD 20745',NULL),('User101001','Kate','Tam','madagas@yahoo.com','@M1k3WUTHEPr0f156@',' 13 Lincoln Dr. Allentwon, PA 18102',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-30 22:52:53

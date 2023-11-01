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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (16,'Engine','Coil',192,'Component in the ignition system that generates high-voltage electricity to create a spark in the spark plugs, which ignites the air-fuel mixture in the engine\'s cylinders.','https://m.media-amazon.com/images/I/61X5aCIWRCL._AC_UF894,1000_QL80_.jpg'),(17,'Engine','Spark Plug',58,'Device that fits into each cylinder of an internal combustion engine to ignite the air-fuel mixture by creating a spark.','https://m.media-amazon.com/images/I/71tqIg+ETUL.jpg'),(18,'Engine','Serpentine Drive Belt Kit',55,'A single, long belt that drives various engine accessories such as the alternator, water pump, and power steering pump. The kit includes the belt and related components.','https://m.media-amazon.com/images/I/51M4CMN0rEL.jpg'),(19,'Engine','Alternator',253,'an electrical generator that charges the vehicle\'s battery and provides power to the electrical systems when the engine is running.','https://m.media-amazon.com/images/I/81RBQAENBoL.jpg'),(20,'Engine','Water Pump',420,'A component of the engine cooling system that circulates coolant (water and antifreeze) through the engine to maintain an optimal operating temperature.','https://m.media-amazon.com/images/I/51m1GSJrHdL._AC_SL1000_.jpg'),(21,'Engine','Thermostat',701,'A temperature-sensitive valve that regulates the flow of coolant through the engine to maintain the desired operating temperature.','https://m.media-amazon.com/images/I/81djPTynaoL._AC_SL1500_.jpg'),(22,'Engine','Idle Pulley',65,'A tensioner pulley used in the serpentine belt system to maintain proper tension on the belt.','https://m.media-amazon.com/images/I/61J+-7fQkrL._AC_SL1500_.jpg'),(23,'Engine','Valve Cover Gaskey',253,'This gasket seals the gap between the valve cover and the cylinder head to prevent oil leaks from the engine.','https://m.media-amazon.com/images/I/61J+-7fQkrL._AC_SL1500_.jpg'),(24,'Engine','Head Gasket',811,'Critical seal between the engine block and the cylinder head, preventing coolant and oil from mixing and sealing the combustion chambers.','https://m.media-amazon.com/images/I/71t6LaysVpL._AC_SL1500_.jpg'),(25,'Engine','Engine Oil Filter',15,'Traps impurities and debris in the engine oil, preventing them from damaging the engine.','https://m.media-amazon.com/images/I/71swwdyHRjL._AC_SL1500_.jpg'),(26,'Engine','Turbo',3441,'Compresses air and increases engine performance by forcing more air into the cylinders for combustion.','https://m.media-amazon.com/images/I/61keGqwtuDL._AC_SL1500_.jpg'),(27,'Engine','Supercharger',2537,'Type of forced induction device that increases engine power by compressing air and delivering it to the engine','https://m.media-amazon.com/images/I/61yxdmtBVHL._AC_SX679_.jpg');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
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

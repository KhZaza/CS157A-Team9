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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(10) NOT NULL,
  `Total Price` int NOT NULL,
  `Contact Info` varchar(45) NOT NULL,
  `Shipping Address` varchar(100) NOT NULL,
  `Payment Method` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (59,'shipped',60,'zootehnic@gmail.com',' 54 NW. Wild Horse Court, Glen Ellyn, IL 60137','Visa'),(60,'delivered',100,'tomatopota@gmail.com',' 54 NW. Wild Horse Court, Glen Ellyn, IL 60137','Mastercard'),(61,'processed',160,'qball9@gmail.com','340 Longfellow Street, Marietta, GA 30008','Visa'),(62,'delivered',200,'potao@yahoo.com','7071 Del Monte Street Murfreesboro, TN 37128','Visa'),(63,'completed',270,'pinaeple@gmail.com','9303 Garden Lane Schererville, IN 46375','PayPal'),(64,'completed',470,'madagas@yahoo.com',' 13 Lincoln Dr. Allentwon, PA 18102','Mastercard'),(65,'processed',98,'goldshowe@gmail.com','123 New York, New York','Mastercard'),(66,'delivered',355,'cookiesncream@gmail.com','9303 Garden Lane Schererville, IN 46375','Visa'),(67,'completed',470,'claytent@yahoo.com','123 New York, New York','Paypal'),(68,'completed',65,'apollodone@gmail.com',' 7360 Wagon Ave. Tucson, AZ 85718','Mastercard');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
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

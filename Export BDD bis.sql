-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: plateforme
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `IdClient` varchar(10) NOT NULL,
  `NomC` varchar(50) DEFAULT NULL,
  `PrénomC` varchar(50) DEFAULT NULL,
  `LatitudeC` varchar(50) DEFAULT NULL,
  `LongitudeC` varchar(50) DEFAULT NULL,
  `TelephoneC` mediumtext,
  `EmailC` varchar(50) DEFAULT NULL,
  `regimeAlC` varchar(50) DEFAULT NULL,
  `Id_Utilisateur` varchar(50) NOT NULL,
  PRIMARY KEY (`IdClient`),
  UNIQUE KEY `Id_Utilisateur` (`Id_Utilisateur`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`Id_Utilisateur`) REFERENCES `utilisateur` (`Id_Utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `IdCommande` varchar(10) NOT NULL,
  `IdClient` varchar(10) DEFAULT NULL,
  `dateComm` datetime DEFAULT NULL,
  PRIMARY KEY (`IdCommande`),
  KEY `IdClient` (`IdClient`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`IdClient`) REFERENCES `client` (`IdClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constituer_de_`
--

DROP TABLE IF EXISTS `constituer_de_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constituer_de_` (
  `Id_Plat` varchar(10) NOT NULL,
  `IdCommande` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_Plat`,`IdCommande`),
  KEY `IdCommande` (`IdCommande`),
  CONSTRAINT `constituer_de__ibfk_1` FOREIGN KEY (`Id_Plat`) REFERENCES `plat` (`Id_Plat`),
  CONSTRAINT `constituer_de__ibfk_2` FOREIGN KEY (`IdCommande`) REFERENCES `commande` (`IdCommande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constituer_de_`
--

LOCK TABLES `constituer_de_` WRITE;
/*!40000 ALTER TABLE `constituer_de_` DISABLE KEYS */;
/*!40000 ALTER TABLE `constituer_de_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisinier`
--

DROP TABLE IF EXISTS `cuisinier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisinier` (
  `IDCuisinier` varchar(10) NOT NULL,
  `nomP` varchar(50) DEFAULT NULL,
  `prenomP` varchar(50) DEFAULT NULL,
  `LatitudeP` varchar(50) DEFAULT NULL,
  `LongitudeP` varchar(50) DEFAULT NULL,
  `adresseP` varchar(50) DEFAULT NULL,
  `telephoneP` mediumtext,
  `emailP` varchar(50) DEFAULT NULL,
  `spécialités` varchar(50) DEFAULT NULL,
  `Id_Utilisateur` char(50) NOT NULL,
  PRIMARY KEY (`IDCuisinier`),
  UNIQUE KEY `Id_Utilisateur` (`Id_Utilisateur`),
  CONSTRAINT `cuisinier_ibfk_1` FOREIGN KEY (`Id_Utilisateur`) REFERENCES `utilisateur` (`Id_Utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisinier`
--

LOCK TABLES `cuisinier` WRITE;
/*!40000 ALTER TABLE `cuisinier` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuisinier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluer`
--

DROP TABLE IF EXISTS `evaluer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluer` (
  `IdClient` varchar(10) NOT NULL,
  `IDCuisinier` varchar(10) NOT NULL,
  `Note` int DEFAULT NULL,
  `commentaire` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`IdClient`,`IDCuisinier`),
  KEY `IDCuisinier` (`IDCuisinier`),
  CONSTRAINT `evaluer_ibfk_1` FOREIGN KEY (`IdClient`) REFERENCES `client` (`IdClient`),
  CONSTRAINT `evaluer_ibfk_2` FOREIGN KEY (`IDCuisinier`) REFERENCES `cuisinier` (`IDCuisinier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluer`
--

LOCK TABLES `evaluer` WRITE;
/*!40000 ALTER TABLE `evaluer` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livrer`
--

DROP TABLE IF EXISTS `livrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livrer` (
  `IDCuisinier` varchar(10) NOT NULL,
  `IdCommande` varchar(10) NOT NULL,
  `AdresseDep` varchar(50) DEFAULT NULL,
  `AdresseArr` varchar(50) DEFAULT NULL,
  `Distance_` decimal(15,2) DEFAULT NULL,
  `CheminOpt` varchar(900) DEFAULT NULL,
  `Statut` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDCuisinier`,`IdCommande`),
  KEY `IdCommande` (`IdCommande`),
  CONSTRAINT `livrer_ibfk_1` FOREIGN KEY (`IDCuisinier`) REFERENCES `cuisinier` (`IDCuisinier`),
  CONSTRAINT `livrer_ibfk_2` FOREIGN KEY (`IdCommande`) REFERENCES `commande` (`IdCommande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livrer`
--

LOCK TABLES `livrer` WRITE;
/*!40000 ALTER TABLE `livrer` DISABLE KEYS */;
/*!40000 ALTER TABLE `livrer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat`
--

DROP TABLE IF EXISTS `plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plat` (
  `Id_Plat` varchar(10) NOT NULL,
  `NomP` char(50) DEFAULT NULL,
  `DateFabP` datetime DEFAULT NULL,
  `typeP` varchar(50) DEFAULT NULL,
  `DateP` datetime DEFAULT NULL,
  `Prix` decimal(15,2) DEFAULT NULL,
  `Nationalité` char(50) DEFAULT NULL,
  `Rég_ali` char(50) DEFAULT NULL,
  `IngrP` varchar(50) DEFAULT NULL,
  `Nb_portionsP` int DEFAULT NULL,
  `photoP` blob,
  `IDCuisinier` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id_Plat`),
  KEY `IDCuisinier` (`IDCuisinier`),
  CONSTRAINT `plat_ibfk_1` FOREIGN KEY (`IDCuisinier`) REFERENCES `cuisinier` (`IDCuisinier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat`
--

LOCK TABLES `plat` WRITE;
/*!40000 ALTER TABLE `plat` DISABLE KEYS */;
/*!40000 ALTER TABLE `plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `Id_Utilisateur` varchar(50) NOT NULL,
  `Mot_de_Passe` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-04 13:04:39

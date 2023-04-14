CREATE DATABASE  IF NOT EXISTS `euro_fit_david` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `euro_fit_david`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: euro_fit_david
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `abonnement`
--

DROP TABLE IF EXISTS `abonnement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonnement` (
  `id_abonnement` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `bilan_IMC` int DEFAULT NULL,
  `acces_club` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_abonnement`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonnement`
--

LOCK TABLES `abonnement` WRITE;
/*!40000 ALTER TABLE `abonnement` DISABLE KEYS */;
INSERT INTO `abonnement` VALUES (1,'VIP',200,1,1),(2,'premium version internationa',175,1,1),(3,'Premium',150,1,1),(4,'cycliste international',150,1,0),(5,'cycliste d’eau douce',100,0,1),(6,'le muscle est partout',150,0,1),(7,'membre international',135,1,1),(8,'brain-l fit international',130,0,1),(9,'b less-fit',125,1,1),(10,'membre',100,0,1),(11,'coach',50,1,1);
/*!40000 ALTER TABLE `abonnement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresse` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(100) NOT NULL,
  `id_pays` int NOT NULL,
  `id_ville` int NOT NULL,
  `id_code_postal` int NOT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `fk_adresse_pays` (`id_pays`),
  KEY `fk_adresse_ville` (`id_ville`),
  KEY `fk_adresse_code_postal` (`id_code_postal`),
  CONSTRAINT `fk_adresse_code_postal` FOREIGN KEY (`id_code_postal`) REFERENCES `code_postal` (`id_code_postal`),
  CONSTRAINT `fk_adresse_pays` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`),
  CONSTRAINT `fk_adresse_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'6 Rue de la Tisonnière',1,1,9),(2,'Busch 12',6,6,1),(3,'La Frétière',1,1,9),(4,'12 Rue de la Paix',1,1,1),(5,'45 Rue du Faubourg Saint-Honoré',1,1,8),(6,'25 Rue des Francs-Bourgeois',1,1,3),(7,'7 Rue de Rivoli',1,1,4),(8,'30 Rue du Bac',1,1,7),(9,'27 Rue Saint-Guillaume',1,1,6),(10,'14 Rue de Castiglione',4,4,5);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assureur`
--

DROP TABLE IF EXISTS `assureur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assureur` (
  `id_assureur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `contrat` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `id_adresse` int DEFAULT NULL,
  PRIMARY KEY (`id_assureur`),
  KEY `fk_assureur_adresse` (`id_adresse`),
  CONSTRAINT `fk_assureur_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assureur`
--

LOCK TABLES `assureur` WRITE;
/*!40000 ALTER TABLE `assureur` DISABLE KEYS */;
INSERT INTO `assureur` VALUES (1,'Allianz','Contrat 1','01 02 03 04 05','contact@allianz.fr',1),(2,'AXA','Contrat 2','01 02 03 04 06','contact@axa.fr',2);
/*!40000 ALTER TABLE `assureur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carte_bancaire`
--

DROP TABLE IF EXISTS `carte_bancaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carte_bancaire` (
  `id_carte_bancaire` int NOT NULL AUTO_INCREMENT,
  `code_16_chiffre` varchar(16) DEFAULT NULL,
  `date_d_expiration` date DEFAULT NULL,
  `cryptogramme` int DEFAULT NULL,
  PRIMARY KEY (`id_carte_bancaire`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carte_bancaire`
--

LOCK TABLES `carte_bancaire` WRITE;
/*!40000 ALTER TABLE `carte_bancaire` DISABLE KEYS */;
INSERT INTO `carte_bancaire` VALUES (1,'1234567890123456','2024-12-31',123),(2,'9876543210987654','2023-06-30',456),(3,'1111222233334444','2025-09-30',789),(4,'5555666677778888','2024-03-31',234),(5,'9999000011112222','2023-11-30',567);
/*!40000 ALTER TABLE `carte_bancaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificat_medical`
--

DROP TABLE IF EXISTS `certificat_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificat_medical` (
  `id_certificat_medical` int NOT NULL AUTO_INCREMENT,
  `date_certificat` date NOT NULL,
  `id_medecin` int NOT NULL,
  PRIMARY KEY (`id_certificat_medical`),
  KEY `fk_certificat_medical_medecin` (`id_medecin`),
  CONSTRAINT `fk_certificat_medical_medecin` FOREIGN KEY (`id_medecin`) REFERENCES `medecin` (`id_medecin`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificat_medical`
--

LOCK TABLES `certificat_medical` WRITE;
/*!40000 ALTER TABLE `certificat_medical` DISABLE KEYS */;
INSERT INTO `certificat_medical` VALUES (1,'2023-04-01',1),(2,'2023-03-28',2),(3,'2023-03-29',3),(4,'2023-04-02',4),(5,'2023-03-31',5),(6,'2023-04-03',6),(7,'2023-04-05',7),(8,'2023-04-07',8),(9,'2023-04-06',9),(10,'2023-04-04',10);
/*!40000 ALTER TABLE `certificat_medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clim`
--

DROP TABLE IF EXISTS `clim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clim` (
  `id_clim` int NOT NULL AUTO_INCREMENT,
  `clim` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_clim`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clim`
--

LOCK TABLES `clim` WRITE;
/*!40000 ALTER TABLE `clim` DISABLE KEYS */;
INSERT INTO `clim` VALUES (1,1),(2,0),(3,1),(4,0),(5,1);
/*!40000 ALTER TABLE `clim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `id_club` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `licence` varchar(50) DEFAULT NULL,
  `id_sauna` int DEFAULT NULL,
  `id_clim` int DEFAULT NULL,
  `id_salle` int DEFAULT NULL,
  `id_equipement` int DEFAULT NULL,
  `id_abonnement` int DEFAULT NULL,
  `id_assureur` int DEFAULT NULL,
  `id_adresse` int NOT NULL,
  PRIMARY KEY (`id_club`),
  KEY `fk_club_sauna` (`id_sauna`),
  KEY `fk_club_clim` (`id_clim`),
  KEY `fk_club_salle` (`id_salle`),
  KEY `fk_club_equipement` (`id_equipement`),
  KEY `fk_club_abonnement` (`id_abonnement`),
  KEY `fk_club_assureur` (`id_assureur`),
  KEY `fk_club_adresse` (`id_adresse`),
  CONSTRAINT `fk_club_abonnement` FOREIGN KEY (`id_abonnement`) REFERENCES `abonnement` (`id_abonnement`),
  CONSTRAINT `fk_club_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`),
  CONSTRAINT `fk_club_assureur` FOREIGN KEY (`id_assureur`) REFERENCES `assureur` (`id_assureur`),
  CONSTRAINT `fk_club_clim` FOREIGN KEY (`id_clim`) REFERENCES `clim` (`id_clim`),
  CONSTRAINT `fk_club_equipement` FOREIGN KEY (`id_equipement`) REFERENCES `equipement` (`id_equipement`),
  CONSTRAINT `fk_club_salle` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`),
  CONSTRAINT `fk_club_sauna` FOREIGN KEY (`id_sauna`) REFERENCES `sauna` (`id_sauna`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,'L.Santos mountain park','01 02 03 04 07','contact@cluba.com','A-1234',1,1,1,1,1,1,2),(2,'Fleeca fit','01 02 03 04 08','contact@clubb.com','B-5678',2,2,2,3,3,1,4),(3,'Diamond goal','01 02 03 04 09','contact@clubc.com','C-9101',3,3,3,4,4,2,9);
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `id_coach` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `id_abonnement` int DEFAULT NULL,
  PRIMARY KEY (`id_coach`),
  KEY `fk_coach_abonnement` (`id_abonnement`),
  CONSTRAINT `fk_coach_abonnement` FOREIGN KEY (`id_abonnement`) REFERENCES `abonnement` (`id_abonnement`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'Dupont','Jean',11),(2,'Martin','Julie',11);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_postal`
--

DROP TABLE IF EXISTS `code_postal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code_postal` (
  `id_code_postal` int NOT NULL AUTO_INCREMENT,
  `code_postal` varchar(10) NOT NULL,
  PRIMARY KEY (`id_code_postal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_postal`
--

LOCK TABLES `code_postal` WRITE;
/*!40000 ALTER TABLE `code_postal` DISABLE KEYS */;
INSERT INTO `code_postal` VALUES (1,'75001'),(2,'75002'),(3,'75003'),(4,'75004'),(5,'75005'),(6,'75006'),(7,'75007'),(8,'75008'),(9,'75009'),(10,'75010');
/*!40000 ALTER TABLE `code_postal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connexion`
--

DROP TABLE IF EXISTS `connexion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connexion` (
  `id_connexion` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `question_secrete` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_connexion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connexion`
--

LOCK TABLES `connexion` WRITE;
/*!40000 ALTER TABLE `connexion` DISABLE KEYS */;
INSERT INTO `connexion` VALUES (1,'johndoe123','Gertrude','le nom de ma grand mere?'),(2,'janesmith456','bleue','ma couleur favorite'),(3,'bobbrown789','pat','le nom de mon chien'),(4,'alicejones012','titanic','mon film préférée'),(5,'tomwilson345','tacos','plat favori');
/*!40000 ALTER TABLE `connexion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipement`
--

DROP TABLE IF EXISTS `equipement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipement` (
  `id_equipement` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_equipement`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipement`
--

LOCK TABLES `equipement` WRITE;
/*!40000 ALTER TABLE `equipement` DISABLE KEYS */;
INSERT INTO `equipement` VALUES (1,'musculation','Barres de poids libres'),(2,'musculation','Machines à poulies'),(3,'cardio','Tapis de course'),(4,'cardio','Vélos elliptiques'),(5,'danse','Miroirs'),(6,'danse','Barres de ballet'),(7,'yoga','Tapis de yoga'),(8,'yoga','Bloc de yoga'),(9,'natation','Maillots de bain'),(10,'natation','Lunettes de natation');
/*!40000 ALTER TABLE `equipement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fournisseur` (
  `id_fournisseur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `numero_facture` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mail` varchar(100) NOT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES (1,'Fournisseur 1','123456','01 23 45 67 89','fournisseur1@mail.com'),(2,'Fournisseur 2','789012','06 12 34 56 78','fournisseur2@mail.com'),(3,'Fournisseur 3','345678','02 34 56 78 90','fournisseur3@mail.com'),(4,'Fournisseur 4','901234','03 45 67 89 01','fournisseur4@mail.com'),(5,'Fournisseur 5','567890','05 67 89 01 23','fournisseur5@mail.com');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `sexe` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,1),(2,0),(3,1),(4,0),(5,1);
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magasin`
--

DROP TABLE IF EXISTS `magasin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magasin` (
  `id_magasin` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `id_fournisseur` int NOT NULL,
  PRIMARY KEY (`id_magasin`),
  KEY `fk_magasin_fournisseur` (`id_fournisseur`),
  CONSTRAINT `fk_magasin_fournisseur` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magasin`
--

LOCK TABLES `magasin` WRITE;
/*!40000 ALTER TABLE `magasin` DISABLE KEYS */;
INSERT INTO `magasin` VALUES (1,'Magasin 1','01 23 45 67 89','magasin1@mail.com',1),(2,'Magasin 2','06 12 34 56 78','magasin2@mail.com',2),(3,'Magasin 3','02 34 56 78 90','magasin3@mail.com',3),(4,'Magasin 4','03 45 67 89 01','magasin4@mail.com',4),(5,'Magasin 5','05 67 89 01 23','magasin5@mail.com',5);
/*!40000 ALTER TABLE `magasin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medecin` (
  `id_medecin` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `id_adresse` int NOT NULL,
  PRIMARY KEY (`id_medecin`),
  KEY `fk_Medecin_adresse` (`id_adresse`),
  CONSTRAINT `fk_Medecin_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medecin`
--

LOCK TABLES `medecin` WRITE;
/*!40000 ALTER TABLE `medecin` DISABLE KEYS */;
INSERT INTO `medecin` VALUES (1,'Duggan','Agatha','A.Dug@gmail.com','+33 6 78 54 32 89',1),(2,'Jonas','Karim','karim.jonas@gmail.com','+45 13 46 79 82',2),(3,'Martinez','Sacha','Samar@hotmail.com','+336 11 56 84 93',3),(4,'Dubois','Nathalie','nathalie.dubois@gmail.com','+33 6 12 34 56 78',4),(5,'Smith','John','john.smith@gmail.com','+44 20 1234 5678',5),(6,'Müller','Hans','hans.mueller@gmail.com','+49 30 1234 5678',6),(7,'Janssen','Liesbeth','liesbeth.janssen@gmail.com','+31 6 12 34 56 78',7),(8,'Lefèvre','Sophie','sophie.lefevre@gmail.com','+32 2 123 45 67',8),(9,'García','Juan','juan.garcia@gmail.com','+34 91 123 45 67',9),(10,'Lopes','Marta','marta.lopes@gmail.com','+351 91 234 56 78',10);
/*!40000 ALTER TABLE `medecin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membre`
--

DROP TABLE IF EXISTS `membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membre` (
  `id_membre` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `horaire` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `id_adresse` int DEFAULT NULL,
  `id_certificat_medical` int DEFAULT NULL,
  `id_connexion` int DEFAULT NULL,
  `id_carte_bancaire` int DEFAULT NULL,
  `id_genre` int DEFAULT NULL,
  `id_parrainage` int DEFAULT NULL,
  `id_coach` int DEFAULT NULL,
  `id_abonnement` int DEFAULT NULL,
  `id_club` int DEFAULT NULL,
  `id_produit` int DEFAULT NULL,
  PRIMARY KEY (`id_membre`),
  KEY `fk_membre_adresse` (`id_adresse`),
  KEY `fk_membre_certificat_medical` (`id_certificat_medical`),
  KEY `fk_membre_connexion` (`id_connexion`),
  KEY `fk_membre_carte_bancaire` (`id_carte_bancaire`),
  KEY `fk_membre_genre` (`id_genre`),
  KEY `fk_membre_parrainage` (`id_parrainage`),
  KEY `fk_membre_coach` (`id_coach`),
  KEY `fk_membre_abonnement` (`id_abonnement`),
  KEY `fk_membre_club` (`id_club`),
  KEY `fk_membre_produit` (`id_produit`),
  CONSTRAINT `fk_membre_abonnement` FOREIGN KEY (`id_abonnement`) REFERENCES `abonnement` (`id_abonnement`),
  CONSTRAINT `fk_membre_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`),
  CONSTRAINT `fk_membre_carte_bancaire` FOREIGN KEY (`id_carte_bancaire`) REFERENCES `carte_bancaire` (`id_carte_bancaire`),
  CONSTRAINT `fk_membre_certificat_medical` FOREIGN KEY (`id_certificat_medical`) REFERENCES `certificat_medical` (`id_certificat_medical`),
  CONSTRAINT `fk_membre_club` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`),
  CONSTRAINT `fk_membre_coach` FOREIGN KEY (`id_coach`) REFERENCES `coach` (`id_coach`),
  CONSTRAINT `fk_membre_connexion` FOREIGN KEY (`id_connexion`) REFERENCES `connexion` (`id_connexion`),
  CONSTRAINT `fk_membre_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`),
  CONSTRAINT `fk_membre_parrainage` FOREIGN KEY (`id_parrainage`) REFERENCES `parrainage` (`id_parrainage`),
  CONSTRAINT `fk_membre_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membre`
--

LOCK TABLES `membre` WRITE;
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
INSERT INTO `membre` VALUES (16,'Martin','Jean',35,'9h-12h','jean.martin@example.com','+33123456789',1,1,1,1,1,1,1,3,1,1),(17,'Durand','Sophie',27,'14h-18h','sophie.durand@example.com','+33765432198',2,2,2,2,2,2,1,1,2,2),(18,'Lefebvre','Antoine',45,'8h-10h','antoine.lefebvre@example.com','+33678901234',3,3,3,3,1,3,2,2,3,5),(19,'Leroy','Caroline',29,'18h-20h','caroline.leroy@example.com','+33654321098',4,4,4,4,2,4,1,3,2,4),(20,'Moreau','Pierre',33,'12h-14h','pierre.moreau@example.com','+33123456789',5,5,5,5,1,5,1,2,1,1);
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parrainage`
--

DROP TABLE IF EXISTS `parrainage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parrainage` (
  `id_parrainage` int NOT NULL AUTO_INCREMENT,
  `parrain` varchar(50) DEFAULT NULL,
  `couleur_carte` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_parrainage`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parrainage`
--

LOCK TABLES `parrainage` WRITE;
/*!40000 ALTER TABLE `parrainage` DISABLE KEYS */;
INSERT INTO `parrainage` VALUES (1,'John Doe','red'),(2,'Jane Smith','red'),(3,'Bob Brown','red'),(4,'Alice Jones','red'),(5,'Tom Wilson','red');
/*!40000 ALTER TABLE `parrainage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pays` (
  `id_pays` int NOT NULL AUTO_INCREMENT,
  `nom_pays` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,'France'),(2,'Allemagne'),(3,'Espagne'),(4,'Italie'),(5,'Royaume-Uni'),(6,'Pays-Bas'),(7,'Belgique'),(8,'Portugal'),(9,'Suisse'),(10,'Suède');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `nom_produit` varchar(50) NOT NULL,
  `prix` float NOT NULL,
  `id_magasin` int NOT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `fk_produit_magasin` (`id_magasin`),
  CONSTRAINT `fk_produit_magasin` FOREIGN KEY (`id_magasin`) REFERENCES `magasin` (`id_magasin`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'Produit 1',10.99,1),(2,'Produit 2',9.99,2),(3,'Produit 3',8.99,3),(4,'Produit 4',11.99,4),(5,'Produit 5',7.99,5);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salle` (
  `id_salle` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salle`
--

LOCK TABLES `salle` WRITE;
/*!40000 ALTER TABLE `salle` DISABLE KEYS */;
INSERT INTO `salle` VALUES (1,'musculation','Salle de musculation A'),(2,'cardio','Salle de cardio B'),(3,'danse','Salle de danse C'),(4,'yoga','Salle de yoga D'),(5,'natation','Piscine E');
/*!40000 ALTER TABLE `salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sauna`
--

DROP TABLE IF EXISTS `sauna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sauna` (
  `id_sauna` int NOT NULL AUTO_INCREMENT,
  `sauna` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_sauna`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sauna`
--

LOCK TABLES `sauna` WRITE;
/*!40000 ALTER TABLE `sauna` DISABLE KEYS */;
INSERT INTO `sauna` VALUES (1,1),(2,0),(3,1),(4,0),(5,1);
/*!40000 ALTER TABLE `sauna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ville`
--

DROP TABLE IF EXISTS `ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ville` (
  `id_ville` int NOT NULL AUTO_INCREMENT,
  `nom_ville` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ville`
--

LOCK TABLES `ville` WRITE;
/*!40000 ALTER TABLE `ville` DISABLE KEYS */;
INSERT INTO `ville` VALUES (1,'Paris'),(2,'Berlin'),(3,'Madrid'),(4,'Rome'),(5,'Londres'),(6,'Amsterdam'),(7,'Bruxelles'),(8,'Lisbonne'),(9,'Genève'),(10,'Stockholm');
/*!40000 ALTER TABLE `ville` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vue_medecins`
--

DROP TABLE IF EXISTS `vue_medecins`;
/*!50001 DROP VIEW IF EXISTS `vue_medecins`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vue_medecins` AS SELECT 
 1 AS `nom`,
 1 AS `prenom`,
 1 AS `mail`,
 1 AS `telephone`,
 1 AS `adresse_complete`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vue_medecins`
--

/*!50001 DROP VIEW IF EXISTS `vue_medecins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vue_medecins` AS select `m`.`nom` AS `nom`,`m`.`prenom` AS `prenom`,`m`.`mail` AS `mail`,`m`.`telephone` AS `telephone`,concat(`a`.`adresse`,', ',`v`.`nom_ville`,', ',`c`.`code_postal`,', ',`p`.`nom_pays`) AS `adresse_complete` from ((((`medecin` `m` join `adresse` `a` on((`m`.`id_adresse` = `a`.`id_adresse`))) join `ville` `v` on((`a`.`id_ville` = `v`.`id_ville`))) join `code_postal` `c` on((`a`.`id_code_postal` = `c`.`id_code_postal`))) join `pays` `p` on((`a`.`id_pays` = `p`.`id_pays`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 11:53:19

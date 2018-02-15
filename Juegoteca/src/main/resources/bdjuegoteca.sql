CREATE DATABASE  IF NOT EXISTS `bdjuegoteca` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bdjuegoteca`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bdjuegoteca
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generos` (
  `idGenero` int(11) NOT NULL AUTO_INCREMENT,
  `nombreGenero` varchar(45) NOT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Terror'),(2,'Conduccion'),(3,'Aventura'),(4,'Accion'),(5,'Otro'),(6,'Estrategia'),(7,'Plataformas'),(12,'Realidad Virtual');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juegos` (
  `idJuego` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `numJugadores` varchar(45) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `pegi` int(11) NOT NULL,
  `idGenero` int(11) NOT NULL,
  PRIMARY KEY (`idJuego`),
  KEY `idGenero_Juegos_Generos_idx` (`idGenero`),
  CONSTRAINT `idGenero_Juegos_Generos` FOREIGN KEY (`idGenero`) REFERENCES `generos` (`idGenero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
INSERT INTO `juegos` VALUES (2,'God Of war 3','1 Jugador','Matar Dioses',18,6),(3,'Donkey Kong 2','1-2','Come platanos',3,12),(7,'Mario Bros','1-2','Un plataformas',3,7),(8,'Call of duty','1- 12 Jugadores','Tiros',18,4);
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegoteca`
--

DROP TABLE IF EXISTS `juegoteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juegoteca` (
  `idJuegoteca` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idJuego` int(11) NOT NULL,
  `comentario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idJuegoteca`),
  KEY `idUsuario_Juegoteca_Usuario_idx` (`idUsuario`),
  KEY `idJuego_Juegoteca_Juegos_idx` (`idJuego`),
  CONSTRAINT `idJuego_Juegoteca_Juegos` FOREIGN KEY (`idJuego`) REFERENCES `juegos` (`idJuego`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_Juegoteca_Usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegoteca`
--

LOCK TABLES `juegoteca` WRITE;
/*!40000 ALTER TABLE `juegoteca` DISABLE KEYS */;
/*!40000 ALTER TABLE `juegoteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `edad` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `password` varchar(45) CHARACTER SET keybcs2 NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (20,'Adrian','Ortega Cereceto',14,'yo@yo','Z&ťíQ╥\0š╗≤║Ľ▐_',1),(22,'Luis','Fernandez',32,'a@a','oM╓Yň?≈Ω╟!╫c─',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-15  8:43:36

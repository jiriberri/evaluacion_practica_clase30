-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: evaluacion_practica_clase30
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'categoria 1'),(2,'categoria 2'),(3,'categoria 3'),(4,'categoria 4'),(5,'categoria 5');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `fecha_de_creacion` datetime NOT NULL,
  `fecha_ultima_modificacion` datetime NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `puede_ser_eliminada` tinyint NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha_eliminacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario_idx` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'nota1 de Mariano','2020-01-03 10:00:00','2020-01-03 20:00:00','esta es la primer nota de Mariano',0,10,NULL),(2,'nota1 de Julian','2021-07-12 10:00:00','2021-08-03 20:00:00','esta es la primer nota de Julian',0,2,NULL),(3,'nota1 de Cosme','2021-01-12 15:00:00','2021-03-06 08:00:00','esta es la primer nota de Cosme Fulanito',0,4,NULL),(4,'nota1 de Lautaro','2021-10-05 09:30:00','2021-10-05 12:00:00','esta es la primer nota de Lautaro',0,8,NULL),(5,'nota2 de Julian','2021-11-01 03:00:00','2021-11-04 12:00:00','esta es la segunda nota de Julian',0,2,NULL),(6,'nota1 de Pepe','2021-09-20 10:00:00','2021-10-01 19:00:00','esta es la primer nota de Pepe',1,3,'2021-10-01 23:00:00'),(7,'nota1 de Roberto','2021-03-12 17:00:00','2021-08-01 10:00:00','esta es la primer nota de Roberto',1,5,'2021-09-01 15:00:00'),(8,'nota2 de Cosme','2021-04-10 07:30:00','2021-05-08 09:00:00','esta es la segunda nota de Cosme Fulanito',0,4,NULL),(9,'nota3 de Julian','2021-11-07 11:34:00','2021-11-07 19:39:00','esta es la tercer nota de Julian',1,2,'2021-11-08 08:00:00'),(10,'nota1 de Lionel','2021-10-10 10:10:10','2021-11-11 11:11:11','esta es la primer nota de Lionel Messi',1,6,NULL);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_categorias`
--

DROP TABLE IF EXISTS `notas_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_notas` int NOT NULL,
  `id_categorias` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_notas_idx` (`id_notas`),
  KEY `id_categorias_idx` (`id_categorias`),
  CONSTRAINT `id_categorias` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id`),
  CONSTRAINT `id_notas` FOREIGN KEY (`id_notas`) REFERENCES `notas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_categorias`
--

LOCK TABLES `notas_categorias` WRITE;
/*!40000 ALTER TABLE `notas_categorias` DISABLE KEYS */;
INSERT INTO `notas_categorias` VALUES (1,3,5),(2,10,2),(3,5,4),(4,2,5),(5,3,1),(6,2,3),(7,9,4),(8,8,2),(9,4,2),(10,1,1),(11,6,2),(12,8,5),(13,7,1);
/*!40000 ALTER TABLE `notas_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'fulanito','fulanito@gmail.com'),(2,'Julian','julianiriberri@gmail.com'),(3,'Pepe','pepe@yahoo.com'),(4,'Cosme','cosmefulano@hotmail.com'),(5,'Roberto','robertokpo@gmail.com'),(6,'Lionel','messi_lionel10@hotmail.com'),(7,'Juana','juanita@gmail.com'),(8,'Lautaro','laucha@yahoo.com'),(9,'Pablo','pablito_clavito@hotmail.com'),(10,'Mariano','marian@hotmail.com');
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

-- Dump completed on 2021-11-08 20:51:25

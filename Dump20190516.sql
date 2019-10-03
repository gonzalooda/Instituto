-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: instituto
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `alumnos` (
  `idALUMNOS` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  `DNI` varchar(45) NOT NULL,
  `MAIL` varchar(45) NOT NULL,
  `TELEFONO` varchar(45) NOT NULL,
  `OBSERVACIONES` varchar(45) DEFAULT NULL,
  `LEGAJO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idALUMNOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `carreras` (
  `idcarreras` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  `PLAN` varchar(45) DEFAULT NULL,
  `OBSERVACION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcarreras`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (2,'MARKETING','1998','CUALQUIERA'),(5,'GESTION','1991','OTRA CARRERA');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catedras`
--

DROP TABLE IF EXISTS `catedras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8;
CREATE TABLE `catedras` (
  `idCATEDRAS` int(11) NOT NULL AUTO_INCREMENT,
  `IDMATERIA` int(11) NOT NULL,
  `IDPROFEROES` int(11) NOT NULL,
  PRIMARY KEY (`idCATEDRAS`),
  KEY `CATEDRAMATERIA_idx` (`IDMATERIA`),
  KEY `CATEDRAPROFESOR_idx` (`IDPROFEROES`),
  CONSTRAINT `CATEDRAMATERIA` FOREIGN KEY (`IDMATERIA`) REFERENCES `materias` (`idmaterias`),
  CONSTRAINT `CATEDRAPROFESOR` FOREIGN KEY (`IDPROFEROES`) REFERENCES `profesores` (`idprofesores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catedras`
--

LOCK TABLES `catedras` WRITE;
/*!40000 ALTER TABLE `catedras` DISABLE KEYS */;
/*!40000 ALTER TABLE `catedras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8;
CREATE TABLE `examen` (
  `idEXAMEN` int(11) NOT NULL AUTO_INCREMENT,
  `IDMATERIA` int(11) NOT NULL,
  `FECHA` datetime NOT NULL,
  `PRESIDENTE` int(11) NOT NULL,
  `VOCAL1` int(11) NOT NULL,
  `VOCAL2` int(11) NOT NULL,
  `SUPLENTE` int(11) NOT NULL,
  `AULA` varchar(45) DEFAULT NULL,
  `OBSERVACIONES` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEXAMEN`),
  KEY `MATERIAEXAMEN_idx` (`IDMATERIA`),
  KEY `PRESIDENTEPROFESOR_idx` (`PRESIDENTE`),
  KEY `VOCAL1PROFESOR_idx` (`VOCAL1`),
  KEY `VOCAL2PROFESOR_idx` (`VOCAL2`),
  KEY `SUPLENTEPROFESOR_idx` (`SUPLENTE`),
  CONSTRAINT `MATERIAEXAMEN` FOREIGN KEY (`IDMATERIA`) REFERENCES `materias` (`idmaterias`),
  CONSTRAINT `PRESIDENTEPROFESOR` FOREIGN KEY (`PRESIDENTE`) REFERENCES `profesores` (`idprofesores`),
  CONSTRAINT `SUPLENTEPROFESOR` FOREIGN KEY (`SUPLENTE`) REFERENCES `profesores` (`idprofesores`),
  CONSTRAINT `VOCAL1PROFESOR` FOREIGN KEY (`VOCAL1`) REFERENCES `profesores` (`idprofesores`),
  CONSTRAINT `VOCAL2PROFESOR` FOREIGN KEY (`VOCAL2`) REFERENCES `profesores` (`idprofesores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen`
--

LOCK TABLES `examen` WRITE;
/*!40000 ALTER TABLE `examen` DISABLE KEYS */;
/*!40000 ALTER TABLE `examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8;
CREATE TABLE `inscripcion` (
  `idINSCRIPCION` int(11) NOT NULL AUTO_INCREMENT,
  `IDALUMNOS` int(11) NOT NULL,
  `IDEXAMEN` int(11) NOT NULL,
  `SITUACION` varchar(45) NOT NULL,
  `OBSERVACIONES` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idINSCRIPCION`),
  KEY `ALUMNOINSCRIPCION_idx` (`IDALUMNOS`),
  KEY `ALUMNOEXAMEN_idx` (`IDEXAMEN`),
  CONSTRAINT `ALUMNOINSCRIPCION` FOREIGN KEY (`IDALUMNOS`) REFERENCES `alumnos` (`idalumnos`),
  CONSTRAINT `EXAMENINSCRIPCION` FOREIGN KEY (`IDEXAMEN`) REFERENCES `examen` (`idexamen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `materias` (
  `idMATERIAS` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  `IDCARRERA` int(11) NOT NULL,
  `OBSERVACIONES` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMATERIAS`),
  KEY `MATERIACARRERA_idx` (`IDCARRERA`),
  CONSTRAINT `MATERIACARRERA` FOREIGN KEY (`IDCARRERA`) REFERENCES `carreras` (`idcarreras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `profesores` (
  `idPROFESORES` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  `MAIL` varchar(45) NOT NULL,
  `TELEFONO` varchar(45) DEFAULT NULL,
  `CELULAR` varchar(45) DEFAULT NULL,
  `OBSERVACIONES` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPROFESORES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-16 16:42:37

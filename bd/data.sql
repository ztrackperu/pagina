-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pztrack
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `beneficios`
--

DROP TABLE IF EXISTS `beneficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` varchar(350) NOT NULL,
  `foto` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficios`
--

LOCK TABLES `beneficios` WRITE;
/*!40000 ALTER TABLE `beneficios` DISABLE KEYS */;
INSERT INTO `beneficios` VALUES (1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','20240228215148.jpg',1,'2024-02-21 20:36:15','2024-03-25 21:10:56',1,1),(2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240325161902.jpg',1,'2024-02-22 14:22:36','2024-03-25 21:19:02',1,1),(3,'Revision del recorrido','ZTRACK utiliza GNSS para asegurar visibilidad constante de activos.','20240223170339.jpg',1,'2024-02-22 14:23:11','2024-02-24 22:33:17',1,1),(4,'Correos Automaticos','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','20240325161807.jpg',1,'2024-02-22 14:23:44','2024-03-25 21:18:07',1,1),(5,'Reportes','Configurar las recepciones de reportes diarios , semanales o mensuales de tu dispositivo.','20240223170355.jpg',1,'2024-02-22 14:24:04','2024-02-26 20:57:52',1,1),(6,'Compatibilidad','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','20240325161933.jpg',1,'2024-02-22 14:24:26','2024-03-25 21:19:33',1,1),(7,'Consumo de combustible','El sensor de nivel de combustible brinda informacion precisa, analisis de consumo y alertas antirrobo de combustible','20240223170415.jpg',1,'2024-02-22 14:24:46','2024-02-26 20:57:57',1,1),(8,'prueba23','hola','20240228215230.jpg',0,'2024-02-24 16:33:38','2024-03-25 21:12:05',1,1),(9,'capaz','sab','20240228213121.jpg',0,'2024-02-28 20:30:19','2024-03-25 21:12:02',1,1);
/*!40000 ALTER TABLE `beneficios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicas`
--

DROP TABLE IF EXISTS `caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` varchar(350) NOT NULL,
  `foto` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas` VALUES (11,'Supervision en tiempo real','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240325164107.jpg',1,'2024-02-28 19:39:23','2024-03-25 21:41:07',1,1),(12,'Gestion de alarmas y notificaciones','Configura y recibe alarmas por averias, definiendo parametros como temperatura o mensaje de error.','20240325164121.jpg',1,'2024-02-28 20:03:50','2024-03-25 21:41:21',1,1),(13,'Control de nivel de combustible','Los generadores tienen un sensor capaz de dar informacion precisa del nivel de combustible, esta informacion esta disponible para ti en linea!.','20240325164133.jpg',1,'2024-02-28 20:09:44','2024-03-25 21:41:33',1,1),(14,'Toma de decisiones informadas','Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','20240325164146.jpg',1,'2024-03-25 15:25:19','2024-03-25 21:41:46',1,1),(15,'Alertas por robo de combustible','Ante niveles de combustible inusuales, la plataforma emite alertas.','20240325164158.jpg',1,'2024-03-25 15:35:52','2024-03-25 21:41:59',1,1),(16,'Reduccion de Costos','El monitoreo constante previene daños costosos a la carga y reduce el indice de reclamaciones con los seguros.','20240325164210.jpg',1,'2024-03-25 15:36:25','2024-03-25 21:42:10',1,1),(17,'Seguimiento y reportes','Configura la recepcion de reportes diarios, semanales o mensuales de tu dispositivo.','20240325164225.jpg',1,'2024-03-25 15:37:41','2024-03-25 21:42:25',1,1),(18,'Confidencialidad y seguridad de datos','Garantiza la Confidencialidad e integridad de los datos emitidos por tu dispositivo.','20240325164236.jpg',1,'2024-03-25 15:37:59','2024-03-25 21:42:36',1,1);
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` text NOT NULL,
  `correo` varchar(100) NOT NULL,
  `foto` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES (1,'Vida Informático','925491523','Lima - Perú','angelsifuentes@gmail.com','logo.png');
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_permisos`
--

DROP TABLE IF EXISTS `detalle_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_permiso` (`id_permiso`),
  CONSTRAINT `detalle_permisos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `detalle_permisos_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_permisos`
--

LOCK TABLES `detalle_permisos` WRITE;
/*!40000 ALTER TABLE `detalle_permisos` DISABLE KEYS */;
INSERT INTO `detalle_permisos` VALUES (56,2,5),(57,3,4),(58,4,5),(59,5,11),(66,6,4),(67,6,14),(68,6,15);
/*!40000 ALTER TABLE `detalle_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formulario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL,
  `email_cliente` varchar(250) NOT NULL,
  `telefono_cliente` varchar(12) NOT NULL,
  `asunto_formulario` varchar(150) NOT NULL,
  `mensaje` text NOT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulario`
--

LOCK TABLES `formulario` WRITE;
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
INSERT INTO `formulario` VALUES (8,'kevin','kevin.anderson.huete@gmail.com','912209293','xdfsf','sssssssssssssssssssssssssss',0,'2024-02-20 17:29:24','2024-02-20 17:29:24',1,1),(9,'kevin','kevin.anderson.huete@gmail.com','912209293','pedido','sadadasdads',0,'2024-02-20 18:48:44','2024-02-20 18:48:44',1,1),(10,'wwq','asd@gmail.com','123123','asdasd','sadsd',0,'2024-02-22 16:25:28','2024-02-22 16:25:28',1,1),(11,'123132','asd@gmaill.com1','2313','asdasa','dasd',1,'2024-02-22 18:58:30','2024-02-22 18:58:30',1,1),(12,'eeer','asa@gmail.com','133','123','213',1,'2024-02-22 19:18:57','2024-02-22 19:18:57',1,1),(13,'asasd','asdasd@sadasdasd.com','asdasd','asdasd','asdasd',1,'2024-02-23 15:51:56','2024-02-23 15:51:56',1,1),(14,'asdad','asdda@asdasdasd','123123','sdasd','asdads',1,'2024-02-28 21:41:28','2024-02-28 21:41:28',1,1);
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funciones` varchar(150) DEFAULT NULL,
  `categoria` varchar(350) NOT NULL,
  `foto` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

LOCK TABLES `funciones` WRITE;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES (4,'Registro de temperaturas','Monitoreo','20240228215626.jpg',1,'2024-02-21 19:38:24','2024-02-29 02:56:26',1,1),(5,'Estado del equipo','Monitoreo','20240228215633.jpg',1,'2024-02-21 19:39:19','2024-02-29 02:56:33',1,1),(6,'Ubicacion','Monitoreo','20240228215641.jpg',1,'2024-02-21 20:07:27','2024-02-29 02:56:41',1,1),(7,'Configuracion de alarmas','Control','20240228215648.jpg',1,'2024-02-22 14:21:01','2024-02-29 02:56:52',1,1),(8,'Consumo','Control','20240228215709.jpg',1,'2024-02-22 14:21:19','2024-03-25 21:10:33',1,1),(9,'Cambios de temperatura','Control','20240228215719.jpg',1,'2024-02-22 14:21:37','2024-02-29 02:57:19',1,1);
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_beneficios`
--

DROP TABLE IF EXISTS `h_beneficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_beneficios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beneficios_id` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` varchar(350) NOT NULL,
  `foto` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_beneficios`
--

LOCK TABLES `h_beneficios` WRITE;
/*!40000 ALTER TABLE `h_beneficios` DISABLE KEYS */;
INSERT INTO `h_beneficios` VALUES (1,0,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','20240221213615.jpg',1,'2024-02-21 20:36:15',1,'CREADO'),(2,1,'Graficas Interactivas55','Obten el recorrido historico de tu dispositivo y en tiempo real.','20240221213615.jpg',1,'2024-02-21 20:55:48',1,'MODIFICADO'),(3,1,'Graficas Interactivas55aa','Obten el recorrido historico de tu dispositivo y en tiempo real.','20240221220101.jpg',1,'2024-02-21 21:01:01',1,'MODIFICADO'),(4,1,'Graficas Interactivas55aa','Obten el recorrido historico de tu dispositivo y en tiempo real.','',0,'2024-02-21 21:01:55',1,'ELIMINADO'),(5,1,'Graficas Interactivas55aa','Obten el recorrido historico de tu dispositivo y en tiempo real.','',1,'2024-02-21 21:01:57',1,'RESTAURADO'),(6,1,'Graficas Interactivas55aa','Obten el recorrido historico de tu dispositivo y en tiempo real.','',0,'2024-02-21 22:48:30',1,'ELIMINADO'),(7,1,'Graficas Interactivas55aa','Obten el recorrido historico de tu dispositivo y en tiempo real.','',1,'2024-02-21 22:57:43',1,'RESTAURADO'),(8,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','20240222152213.jpg',1,'2024-02-22 14:22:13',1,'MODIFICADO'),(9,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240222152236.jpg',1,'2024-02-22 14:22:36',1,'CREADO'),(10,3,'Revision del recorrido','ZTRACK utiliza GNSS para asegurar visibilidad constante de activos.','20240222152311.jpg',1,'2024-02-22 14:23:11',1,'CREADO'),(11,3,'Revision del recorrido','ZTRACK utiliza GNSS para asegurar visibilidad constante de activos.','20240222152326.jpg',1,'2024-02-22 14:23:26',1,'MODIFICADO'),(12,4,'Correos Automaticos','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','20240222152344.jpg',1,'2024-02-22 14:23:44',1,'CREADO'),(13,5,'Reportes','Configurar las recepciones de reportes diarios , semanales o mensuales de tu dispositivo.','20240222152404.jpg',1,'2024-02-22 14:24:04',1,'CREADO'),(14,6,'Compatibilidad','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','20240222152426.jpg',1,'2024-02-22 14:24:26',1,'CREADO'),(15,7,'Consumo de combustible','El sensor de nivel de combustible brinda informacion precisa, analisis de consumo y alertas antirrobo de combustible','20240222152446.jpg',1,'2024-02-22 14:24:46',1,'CREADO'),(16,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','',0,'2024-02-22 15:52:13',1,'ELIMINADO'),(17,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','',1,'2024-02-22 15:56:28',1,'RESTAURADO'),(18,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','',1,'2024-02-22 15:56:30',1,'RESTAURADO'),(19,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','',1,'2024-02-22 15:56:41',1,'RESTAURADO'),(20,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','',1,'2024-02-22 15:57:24',1,'RESTAURADO'),(21,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','',1,'2024-02-22 15:57:31',1,'RESTAURADO'),(22,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','',1,'2024-02-22 15:57:36',1,'RESTAURADO'),(23,3,'Revision del recorrido','ZTRACK utiliza GNSS para asegurar visibilidad constante de activos.','',1,'2024-02-22 15:57:43',1,'RESTAURADO'),(24,7,'Consumo de combustible','El sensor de nivel de combustible brinda informacion precisa, analisis de consumo y alertas antirrobo de combustible','20240222152446.jpg',1,'2024-02-22 20:32:22',1,'MODIFICADO'),(25,7,'Consumo de combustible','El sensor de nivel de combustible brinda informacion precisa, analisis de consumo y alertas antirrobo de combustible','',0,'2024-02-22 20:32:24',1,'ELIMINADO'),(26,6,'Compatibilidad','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','',0,'2024-02-22 20:32:27',1,'ELIMINADO'),(27,5,'Reportes','Configurar las recepciones de reportes diarios , semanales o mensuales de tu dispositivo.','',0,'2024-02-22 20:32:28',1,'ELIMINADO'),(28,4,'Correos Automaticos','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','',0,'2024-02-22 20:32:30',1,'ELIMINADO'),(29,3,'Revision del recorrido','ZTRACK utiliza GNSS para asegurar visibilidad constante de activos.','',0,'2024-02-22 20:32:32',1,'ELIMINADO'),(30,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','',0,'2024-02-22 20:32:34',1,'ELIMINADO'),(31,7,'Consumo de combustible','El sensor de nivel de combustible brinda informacion precisa, analisis de consumo y alertas antirrobo de combustible','',1,'2024-02-23 15:53:27',1,'RESTAURADO'),(32,7,'Consumo de combustible','El sensor de nivel de combustible brinda informacion precisa, analisis de consumo y alertas antirrobo de combustible','20240223165400.jpg',1,'2024-02-23 15:54:00',1,'MODIFICADO'),(33,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','',1,'2024-02-23 16:03:03',1,'RESTAURADO'),(34,3,'Revision del recorrido','ZTRACK utiliza GNSS para asegurar visibilidad constante de activos.','',1,'2024-02-23 16:03:06',1,'RESTAURADO'),(35,4,'Correos Automaticos','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','',1,'2024-02-23 16:03:08',1,'RESTAURADO'),(36,5,'Reportes','Configurar las recepciones de reportes diarios , semanales o mensuales de tu dispositivo.','',1,'2024-02-23 16:03:11',1,'RESTAURADO'),(37,6,'Compatibilidad','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','',1,'2024-02-23 16:03:12',1,'RESTAURADO'),(38,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','20240223170322.jpg',1,'2024-02-23 16:03:22',1,'MODIFICADO'),(39,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240223170328.jpg',1,'2024-02-23 16:03:28',1,'MODIFICADO'),(40,3,'Revision del recorrido','ZTRACK utiliza GNSS para asegurar visibilidad constante de activos.','20240223170339.jpg',1,'2024-02-23 16:03:39',1,'MODIFICADO'),(41,4,'Correos Automaticos','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','20240223170345.jpg',1,'2024-02-23 16:03:45',1,'MODIFICADO'),(42,5,'Reportes','Configurar las recepciones de reportes diarios , semanales o mensuales de tu dispositivo.','20240223170355.jpg',1,'2024-02-23 16:03:55',1,'MODIFICADO'),(43,6,'Compatibilidad','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','20240223170403.jpg',1,'2024-02-23 16:04:03',1,'MODIFICADO'),(44,7,'Consumo de combustible','El sensor de nivel de combustible brinda informacion precisa, analisis de consumo y alertas antirrobo de combustible','20240223165400.jpg',1,'2024-02-23 16:04:06',1,'MODIFICADO'),(45,7,'Consumo de combustible','El sensor de nivel de combustible brinda informacion precisa, analisis de consumo y alertas antirrobo de combustible','20240223170415.jpg',1,'2024-02-23 16:04:15',1,'MODIFICADO'),(46,7,'Consumo de combustible','El sensor de nivel de combustible brinda informacion precisa, analisis de consumo y alertas antirrobo de combustible','',0,'2024-02-24 13:26:16',1,'ELIMINADO'),(47,6,'Compatibilidad','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','',0,'2024-02-24 13:26:18',1,'ELIMINADO'),(48,5,'Reportes','Configurar las recepciones de reportes diarios , semanales o mensuales de tu dispositivo.','',0,'2024-02-24 13:26:20',1,'ELIMINADO'),(49,4,'Correos Automaticos','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','',0,'2024-02-24 13:26:23',1,'ELIMINADO'),(50,3,'Revision del recorrido','ZTRACK utiliza GNSS para asegurar visibilidad constante de activos.','',0,'2024-02-24 13:26:27',1,'ELIMINADO'),(51,3,'Revision del recorrido','ZTRACK utiliza GNSS para asegurar visibilidad constante de activos.','',1,'2024-02-24 16:33:17',1,'RESTAURADO'),(52,4,'Correos Automaticos','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','',1,'2024-02-24 16:33:20',1,'RESTAURADO'),(53,8,'prueba','hola','20240224173338.jpg',1,'2024-02-24 16:33:38',1,'CREADO'),(54,5,'Reportes','Configurar las recepciones de reportes diarios , semanales o mensuales de tu dispositivo.','',1,'2024-02-26 14:57:52',1,'RESTAURADO'),(55,6,'Compatibilidad','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','',1,'2024-02-26 14:57:54',1,'RESTAURADO'),(56,7,'Consumo de combustible','El sensor de nivel de combustible brinda informacion precisa, analisis de consumo y alertas antirrobo de combustible','',1,'2024-02-26 14:57:57',1,'RESTAURADO'),(57,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','',0,'2024-02-28 15:44:00',1,'ELIMINADO'),(58,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','',0,'2024-02-28 15:44:04',1,'ELIMINADO'),(59,2,'Modo Madurador2','Todos los datos del proceso de maduracion de tus productos en un click','20240223170328.jpg',1,'2024-02-28 16:12:15',1,'MODIFICADO'),(60,2,'Modo Madurador2','Todos los datos del proceso de maduracion de tus productos en un click','20240228181612.jpg',1,'2024-02-28 17:16:12',1,'MODIFICADO'),(61,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','',1,'2024-02-28 17:16:20',1,'RESTAURADO'),(62,2,'Modo Madurador2','Todos los datos del proceso de maduracion de tus productos en un click','20240228181639.jpg',1,'2024-02-28 17:16:39',1,'MODIFICADO'),(63,2,'Modo Madurador233','Todos los datos del proceso de maduracion de tus productos en un click','20240228211017.jpg',1,'2024-02-28 20:10:17',1,'MODIFICADO'),(64,2,'Modo Madurador233','Todos los datos del proceso de maduracion de tus productos en un click','20240228211025.jpg',1,'2024-02-28 20:10:25',1,'MODIFICADO'),(65,2,'Modo Madurador233111','Todos los datos del proceso de maduracion de tus productos en un click','20240228211025.jpg',1,'2024-02-28 20:10:41',1,'MODIFICADO'),(66,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240228211314.jpg',1,'2024-02-28 20:13:14',1,'MODIFICADO'),(67,2,'Modo Madurador22','Todos los datos del proceso de maduracion de tus productos en un click','20240228211314.jpg',1,'2024-02-28 20:14:55',1,'MODIFICADO'),(68,2,'Modo Madurador222','Todos los datos del proceso de maduracion de tus productos en un click','20240228211520.jpg',1,'2024-02-28 20:15:20',1,'MODIFICADO'),(69,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240228211529.jpg',1,'2024-02-28 20:15:30',1,'MODIFICADO'),(70,2,'Modo Madurador2222','Todos los datos del proceso de maduracion de tus productos en un click','20240228211630.jpg',1,'2024-02-28 20:16:30',1,'MODIFICADO'),(71,2,'Modo Madurador2222333','Todos los datos del proceso de maduracion de tus productos en un click','20240228211630.jpg',1,'2024-02-28 20:16:41',1,'MODIFICADO'),(72,2,'Modo Madurador222233344','Todos los datos del proceso de maduracion de tus productos en un click','20240228211818.jpg',1,'2024-02-28 20:18:18',1,'MODIFICADO'),(73,4,'Correos Automaticos2','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','20240223170345.jpg',1,'2024-02-28 20:21:04',1,'MODIFICADO'),(74,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240228211818.jpg',1,'2024-02-28 20:25:09',1,'MODIFICADO'),(75,2,'Modo Maduradorr','Todos los datos del proceso de maduracion de tus productos en un click','20240228212532.jpg',1,'2024-02-28 20:25:33',1,'MODIFICADO'),(76,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240228212532.jpg',1,'2024-02-28 20:25:36',1,'MODIFICADO'),(77,2,'Modo Madura','Todos los datos del proceso de maduracion de tus productos en un click','20240228212821.jpg',1,'2024-02-28 20:28:21',1,'MODIFICADO'),(78,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240228212821.jpg',1,'2024-02-28 20:28:43',1,'MODIFICADO'),(79,2,'Modo Madurador2','Todos los datos del proceso de maduracion de tus productos en un click','20240228212904.jpg',1,'2024-02-28 20:29:04',1,'MODIFICADO'),(80,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240228212939.jpg',1,'2024-02-28 20:29:39',1,'MODIFICADO'),(81,8,'prueba2','hola','20240224173338.jpg',1,'2024-02-28 20:29:56',1,'MODIFICADO'),(82,9,'333','444','20240228213019.jpg',1,'2024-02-28 20:30:19',1,'CREADO'),(83,9,'333333','444','20240228213019.jpg',1,'2024-02-28 20:30:32',1,'MODIFICADO'),(84,9,'33333333','44433','20240228213019.jpg',1,'2024-02-28 20:31:05',1,'MODIFICADO'),(85,9,'capaz','sab','20240228213121.jpg',1,'2024-02-28 20:31:21',1,'MODIFICADO'),(86,6,'Compatibilidad2','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','20240223170403.jpg',1,'2024-02-28 20:49:47',1,'MODIFICADO'),(87,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','20240228215148.jpg',1,'2024-02-28 20:51:48',1,'MODIFICADO'),(88,1,'Graficas Interactivas22','Obten el recorrido historico de tu dispositivo y en tiempo real.','20240228215148.jpg',1,'2024-02-28 20:51:55',1,'MODIFICADO'),(89,4,'Correos Automaticos2','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','20240228215213.jpg',1,'2024-02-28 20:52:13',1,'MODIFICADO'),(90,4,'Correos Automaticos23','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','20240228215213.jpg',1,'2024-02-28 20:52:17',1,'MODIFICADO'),(91,8,'prueba23','hola','20240228215230.jpg',1,'2024-02-28 20:52:30',1,'MODIFICADO'),(92,6,'Compatibilidad','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','20240228215323.jpg',1,'2024-02-28 20:53:23',1,'MODIFICADO'),(93,6,'Compatibilidad4','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','20240228215323.jpg',1,'2024-02-28 20:53:36',1,'MODIFICADO'),(94,2,'Modo Madurador2','Todos los datos del proceso de maduracion de tus productos en un click','20240228212939.jpg',1,'2024-02-28 21:01:14',1,'MODIFICADO'),(95,1,'Graficas Interactivas','Obten el recorrido historico de tu dispositivo y en tiempo real.','20240228215148.jpg',1,'2024-03-25 15:10:56',1,'MODIFICADO'),(96,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240228212939.jpg',1,'2024-03-25 15:11:17',1,'MODIFICADO'),(97,4,'Correos Automaticos','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','20240228215213.jpg',1,'2024-03-25 15:11:40',1,'MODIFICADO'),(98,6,'Compatibilidad','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','20240228215323.jpg',1,'2024-03-25 15:11:53',1,'MODIFICADO'),(99,9,'capaz','sab','',0,'2024-03-25 15:12:02',1,'ELIMINADO'),(100,8,'prueba23','hola','',0,'2024-03-25 15:12:05',1,'ELIMINADO'),(101,4,'Correos Automaticos','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','20240228215213.jpg',1,'2024-03-25 15:12:41',1,'MODIFICADO'),(102,4,'Correos Automaticos','Recibe notificaciones de los eventos que ocurren en tu dispositivo.','20240325161807.jpg',1,'2024-03-25 15:18:07',1,'MODIFICADO'),(103,2,'Modo Madurador','Todos los datos del proceso de maduracion de tus productos en un click','20240325161902.jpg',1,'2024-03-25 15:19:02',1,'MODIFICADO'),(104,6,'Compatibilidad','ZTRACK es compatible con la gran mayoria de dispositivos del mercado, de instalaciones facil y economica.','20240325161933.jpg',1,'2024-03-25 15:19:33',1,'MODIFICADO');
/*!40000 ALTER TABLE `h_beneficios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_caracteristicas`
--

DROP TABLE IF EXISTS `h_caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_caracteristicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caracteristicas_id` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` varchar(350) NOT NULL,
  `foto` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_caracteristicas`
--

LOCK TABLES `h_caracteristicas` WRITE;
/*!40000 ALTER TABLE `h_caracteristicas` DISABLE KEYS */;
INSERT INTO `h_caracteristicas` VALUES (1,0,'Supervision en tiempo real','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240221222113.jpg',1,'2024-02-21 21:21:13',1,'CREADO'),(2,1,'Supervision en tiempo real3444','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240221222113.jpg',1,'2024-02-21 21:23:26',1,'MODIFICADO'),(3,1,'Supervision en tiempo real3444','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','',1,'2024-02-21 21:24:33',1,'RESTAURADO'),(4,1,'Supervision en tiempo real344433','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240221222445.jpg',1,'2024-02-21 21:24:45',1,'MODIFICADO'),(5,1,'Supervision en tiempo real344433','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240221222445.jpg',1,'2024-02-21 21:25:11',1,'MODIFICADO'),(6,1,'Supervision en tiempo real344433','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240221225548.jpg',1,'2024-02-21 21:55:48',1,'MODIFICADO'),(7,1,'Supervision en tiempo real','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240222152559.jpg',1,'2024-02-22 14:25:59',1,'MODIFICADO'),(8,2,'Gestion de alarmas y notificaciones','Configura y recibe alarmas por averias, definiendo parametros como temperatura o mensaje de error.','20240222152621.jpg',1,'2024-02-22 14:26:21',1,'CREADO'),(9,3,'Control de nivel de combustible','Los generadores tienen un sensor capaz de dar informacion precisa del nivel de combustible, esta informacion esta disponible para ti en linea!','20240222152710.jpg',1,'2024-02-22 14:27:10',1,'CREADO'),(10,4,'Toma de decisiones informadas','Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','20240222152738.jpg',1,'2024-02-22 14:27:38',1,'CREADO'),(11,5,'Alertas por robo de combustible','Ante niveles de combustible inusuales, la plataforma emite alertas.','20240222152810.jpg',1,'2024-02-22 14:28:10',1,'CREADO'),(12,6,'Reduccion de Costos','Reduccion de costos El monitoreo constante previene daños costosos a la carga y reduce el indice de reclamaciones con los seguros.','20240222152833.jpg',1,'2024-02-22 14:28:33',1,'CREADO'),(13,7,'Seguimiento y reportes','Seguimiento y reportes Configura la recepcion de reportes diarios, semanales o mensuales de tu dispositivo.','20240222152856.jpg',1,'2024-02-22 14:28:56',1,'CREADO'),(14,8,'Confidencialidad y seguridad de datos','Confidencialidad y seguridad de datos Garantiza la Confidencialidad e integridad de los datos emitidos por tu dispositivo.','20240222152916.jpg',1,'2024-02-22 14:29:16',1,'CREADO'),(15,9,'hola','hola','logo.png',1,'2024-02-22 20:14:23',1,'CREADO'),(16,10,'222','22','20240222212101.jpg',1,'2024-02-22 20:21:01',1,'CREADO'),(17,9,'hola','hola','20240222212732.jpg',1,'2024-02-22 20:27:32',1,'MODIFICADO'),(18,10,'222','22','',0,'2024-02-22 20:32:39',1,'ELIMINADO'),(19,9,'hola','hola','',0,'2024-02-22 20:32:40',1,'ELIMINADO'),(20,8,'Confidencialidad y seguridad de datos','Confidencialidad y seguridad de datos Garantiza la Confidencialidad e integridad de los datos emitidos por tu dispositivo.','',0,'2024-02-22 20:32:42',1,'ELIMINADO'),(21,7,'Seguimiento y reportes','Seguimiento y reportes Configura la recepcion de reportes diarios, semanales o mensuales de tu dispositivo.','',0,'2024-02-22 20:32:44',1,'ELIMINADO'),(22,6,'Reduccion de Costos','Reduccion de costos El monitoreo constante previene daños costosos a la carga y reduce el indice de reclamaciones con los seguros.','',0,'2024-02-22 20:32:46',1,'ELIMINADO'),(23,5,'Alertas por robo de combustible','Ante niveles de combustible inusuales, la plataforma emite alertas.','',0,'2024-02-22 20:32:48',1,'ELIMINADO'),(24,4,'Toma de decisiones informadas','Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','',0,'2024-02-22 20:32:50',1,'ELIMINADO'),(25,3,'Control de nivel de combustible','Los generadores tienen un sensor capaz de dar informacion precisa del nivel de combustible, esta informacion esta disponible para ti en linea!','',0,'2024-02-22 20:32:52',1,'ELIMINADO'),(26,2,'Gestion de alarmas y notificaciones','Configura y recibe alarmas por averias, definiendo parametros como temperatura o mensaje de error.','',0,'2024-02-22 20:32:54',1,'ELIMINADO'),(27,2,'Gestion de alarmas y notificaciones','Configura y recibe alarmas por averias, definiendo parametros como temperatura o mensaje de error.','',1,'2024-02-22 20:36:05',1,'RESTAURADO'),(28,3,'Control de nivel de combustible','Los generadores tienen un sensor capaz de dar informacion precisa del nivel de combustible, esta informacion esta disponible para ti en linea!','',1,'2024-02-22 20:36:16',1,'RESTAURADO'),(29,1,'Supervision en tiempo real','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240223170513.jpg',1,'2024-02-23 16:05:13',1,'MODIFICADO'),(30,1,'Supervision en tiempo real','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240223170526.jpg',1,'2024-02-23 16:05:26',1,'MODIFICADO'),(31,2,'Gestion de alarmas y notificaciones','Configura y recibe alarmas por averias, definiendo parametros como temperatura o mensaje de error.','20240223170532.jpg',1,'2024-02-23 16:05:32',1,'MODIFICADO'),(32,3,'Control de nivel de combustible','Los generadores tienen un sensor capaz de dar informacion precisa del nivel de combustible, esta informacion esta disponible para ti en linea!','20240223170543.jpg',1,'2024-02-23 16:05:43',1,'MODIFICADO'),(33,4,'Toma de decisiones informadas','Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','',1,'2024-02-23 16:05:46',1,'RESTAURADO'),(34,4,'Toma de decisiones informadas','Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','20240223170552.jpg',1,'2024-02-23 16:05:52',1,'MODIFICADO'),(35,5,'Alertas por robo de combustible','Ante niveles de combustible inusuales, la plataforma emite alertas.','',1,'2024-02-23 16:05:55',1,'RESTAURADO'),(36,5,'Alertas por robo de combustible','Ante niveles de combustible inusuales, la plataforma emite alertas.','20240223170601.jpg',1,'2024-02-23 16:06:01',1,'MODIFICADO'),(37,6,'Reduccion de Costos','Reduccion de costos El monitoreo constante previene daños costosos a la carga y reduce el indice de reclamaciones con los seguros.','',1,'2024-02-23 16:06:05',1,'RESTAURADO'),(38,6,'Reduccion de Costos','Reduccion de costos El monitoreo constante previene daños costosos a la carga y reduce el indice de reclamaciones con los seguros.','20240223170610.jpg',1,'2024-02-23 16:06:10',1,'MODIFICADO'),(39,7,'Seguimiento y reportes','Seguimiento y reportes Configura la recepcion de reportes diarios, semanales o mensuales de tu dispositivo.','',1,'2024-02-23 16:06:14',1,'RESTAURADO'),(40,7,'Seguimiento y reportes','Seguimiento y reportes Configura la recepcion de reportes diarios, semanales o mensuales de tu dispositivo.','20240223170619.jpg',1,'2024-02-23 16:06:19',1,'MODIFICADO'),(41,8,'Confidencialidad y seguridad de datos','Confidencialidad y seguridad de datos Garantiza la Confidencialidad e integridad de los datos emitidos por tu dispositivo.','',1,'2024-02-23 16:06:23',1,'RESTAURADO'),(42,8,'Confidencialidad y seguridad de datos','Confidencialidad y seguridad de datos Garantiza la Confidencialidad e integridad de los datos emitidos por tu dispositivo.','20240223170628.jpg',1,'2024-02-23 16:06:28',1,'MODIFICADO'),(43,8,'Confidencialidad y seguridad de datos','Confidencialidad y seguridad de datos Garantiza la Confidencialidad e integridad de los datos emitidos por tu dispositivo.','',0,'2024-02-24 13:26:35',1,'ELIMINADO'),(44,7,'Seguimiento y reportes','Seguimiento y reportes Configura la recepcion de reportes diarios, semanales o mensuales de tu dispositivo.','',0,'2024-02-24 13:26:37',1,'ELIMINADO'),(45,6,'Reduccion de Costos','Reduccion de costos El monitoreo constante previene daños costosos a la carga y reduce el indice de reclamaciones con los seguros.','',0,'2024-02-24 13:26:40',1,'ELIMINADO'),(46,5,'Alertas por robo de combustible','Ante niveles de combustible inusuales, la plataforma emite alertas.','',0,'2024-02-24 13:26:42',1,'ELIMINADO'),(47,4,'Toma de decisiones informadas','Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','',0,'2024-02-24 13:26:45',1,'ELIMINADO'),(48,3,'Control de nivel de combustible','Los generadores tienen un sensor capaz de dar informacion precisa del nivel de combustible, esta informacion esta disponible para ti en linea!','',0,'2024-02-24 13:26:49',1,'ELIMINADO'),(49,3,'Control de nivel de combustible','Los generadores tienen un sensor capaz de dar informacion precisa del nivel de combustible, esta informacion esta disponible para ti en linea!','',1,'2024-02-24 16:34:02',1,'RESTAURADO'),(50,4,'Toma de decisiones informadas','Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','',1,'2024-02-28 17:21:17',1,'RESTAURADO'),(51,4,'Toma de decisiones informadas3','Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','20240223170552.jpg',1,'2024-02-28 17:21:21',1,'MODIFICADO'),(52,4,'Toma de decisiones informadas333','33Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','20240223170552.jpg',1,'2024-02-28 17:21:45',1,'MODIFICADO'),(53,4,'Toma de decisiones informadas333','33Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','',0,'2024-02-28 17:28:29',1,'ELIMINADO'),(54,5,'Alertas por robo de combustible','Ante niveles de combustible inusuales, la plataforma emite alertas.','',1,'2024-02-28 17:28:33',1,'RESTAURADO'),(55,5,'Alertas por robo de combustibles','Ante niveles de combustible inusuales, la plataforma emite alertas.','20240223170601.jpg',1,'2024-02-28 17:28:43',1,'MODIFICADO'),(56,4,'Toma de decisiones informadas333','33Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','',1,'2024-02-28 17:29:19',1,'RESTAURADO'),(57,4,'Toma de decisiones informadas333','33Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','20240228183030.jpg',1,'2024-02-28 17:30:30',1,'MODIFICADO'),(58,5,'Alertas por robo de combustibles','Ante niveles de combustible inusuales, la plataforma emite alertas.','20240228183059.jpg',1,'2024-02-28 17:31:00',1,'MODIFICADO'),(59,11,'1','1','20240228203923.jpg',1,'2024-02-28 19:39:23',1,'CREADO'),(60,11,'1','12','20240228203923.jpg',1,'2024-02-28 19:39:30',1,'MODIFICADO'),(61,11,'1','12','20240228204517.jpg',1,'2024-02-28 19:45:17',1,'MODIFICADO'),(62,11,'12','12','20240228204517.jpg',1,'2024-02-28 19:47:39',1,'MODIFICADO'),(63,11,'12','12','20240228205604.jpg',1,'2024-02-28 19:56:04',1,'MODIFICADO'),(64,11,'1233','12','20240228205604.jpg',1,'2024-02-28 19:56:07',1,'MODIFICADO'),(65,11,'123333','123','20240228205633.jpg',1,'2024-02-28 19:56:33',1,'MODIFICADO'),(66,11,'123333','12333','20240228205633.jpg',1,'2024-02-28 19:56:55',1,'MODIFICADO'),(67,11,'123333','12333','20240228210055.jpg',1,'2024-02-28 20:00:55',1,'MODIFICADO'),(68,11,'123333','1233344','20240228210055.jpg',1,'2024-02-28 20:00:58',1,'MODIFICADO'),(69,11,'123333','1233344','20240228210055.jpg',1,'2024-02-28 20:01:07',1,'MODIFICADO'),(70,11,'123333','12333443','20240228210152.jpg',1,'2024-02-28 20:01:52',1,'MODIFICADO'),(71,11,'1233333','12333443','20240228210152.jpg',1,'2024-02-28 20:01:56',1,'MODIFICADO'),(72,11,'1233333','12333443','20240228210332.jpg',1,'2024-02-28 20:03:32',1,'MODIFICADO'),(73,12,'22','2','20240228210350.jpg',1,'2024-02-28 20:03:50',1,'CREADO'),(74,12,'2222','222','20240228210350.jpg',1,'2024-02-28 20:09:21',1,'MODIFICADO'),(75,12,'222211','22211','20240228210350.jpg',1,'2024-02-28 20:09:26',1,'MODIFICADO'),(76,13,'123','123','20240228210944.jpg',1,'2024-02-28 20:09:44',1,'CREADO'),(77,13,'1233','123','20240228210944.jpg',1,'2024-02-28 20:09:50',1,'MODIFICADO'),(78,12,'22221133','22211','20240228211408.jpg',1,'2024-02-28 20:14:08',1,'MODIFICADO'),(79,13,'1233444','123','20240228211414.jpg',1,'2024-02-28 20:14:14',1,'MODIFICADO'),(80,13,'123344455','123','20240228211414.jpg',1,'2024-02-28 20:14:17',1,'MODIFICADO'),(81,13,'123344455','123','20240228213645.jpg',1,'2024-02-28 20:36:45',1,'MODIFICADO'),(82,13,'123344455','12344','20240228213645.jpg',1,'2024-02-28 20:36:57',1,'MODIFICADO'),(83,13,'123344455','12344','20240228213823.jpg',1,'2024-02-28 20:38:23',1,'MODIFICADO'),(84,13,'1233444554','12344','20240228213823.jpg',1,'2024-02-28 20:48:06',1,'MODIFICADO'),(85,13,'holaa','se pudo','20240228213823.jpg',1,'2024-02-28 20:48:18',1,'MODIFICADO'),(86,11,'prueba2','prueba2','20240228210332.jpg',1,'2024-02-28 20:48:38',1,'MODIFICADO'),(87,12,'prueba1','prueba1','20240228211408.jpg',1,'2024-02-28 20:48:51',1,'MODIFICADO'),(88,13,'holaa','se pudo','20240228214858.jpg',1,'2024-02-28 20:48:58',1,'MODIFICADO'),(89,11,'Test','test','20240228210332.jpg',1,'2024-03-18 15:55:18',1,'MODIFICADO'),(90,11,'1','1','20240228210332.jpg',1,'2024-03-20 20:23:45',1,'MODIFICADO'),(91,12,'2','2','20240228211408.jpg',1,'2024-03-20 20:23:49',1,'MODIFICADO'),(92,11,'1','probando descripcion de caracteristica','20240228210332.jpg',1,'2024-03-21 16:18:30',1,'MODIFICADO'),(93,11,'1','probando descripcion de caracteristica ....................................','20240228210332.jpg',1,'2024-03-21 16:22:09',1,'MODIFICADO'),(94,11,'Supervision en tiempo real','A','20240228210332.jpg',1,'2024-03-25 15:20:26',1,'MODIFICADO'),(95,11,'Supervision en tiempo real','Supervision en tiempo real Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240228210332.jpg',1,'2024-03-25 15:24:06',1,'MODIFICADO'),(96,12,'Gestion de alarmas y notificaciones','Gestion de alarmas y notificaciones Configura y recibe alarmas por averias, definiendo parametros como temperatura o mensaje de error.','20240228211408.jpg',1,'2024-03-25 15:24:36',1,'MODIFICADO'),(97,13,'Control de nivel de combustible','Control de nivel de combustible Los generadores tienen un sensor capaz de dar informacion precisa del nivel de combustible, esta informacion esta disponible para ti en linea!.','20240228214858.jpg',1,'2024-03-25 15:24:56',1,'MODIFICADO'),(98,14,'Toma de decisiones informadas','Toma de decisiones informadas Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','logo.png',1,'2024-03-25 15:25:19',1,'CREADO'),(99,15,'Alertas por robo de combustible','Alertas por robo de combustible Ante niveles de combustible inusuales, la plataforma emite alertas.','logo.png',1,'2024-03-25 15:35:52',1,'CREADO'),(100,16,'Reduccion de Costos','El monitoreo constante previene daños costosos a la carga y reduce el indice de reclamaciones con los seguros.','logo.png',1,'2024-03-25 15:36:25',1,'CREADO'),(101,15,'Alertas por robo de combustible','Ante niveles de combustible inusuales, la plataforma emite alertas.','logo.png',1,'2024-03-25 15:36:32',1,'MODIFICADO'),(102,14,'Toma de decisiones informadas','Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','logo.png',1,'2024-03-25 15:36:38',1,'MODIFICADO'),(103,13,'Control de nivel de combustible','Los generadores tienen un sensor capaz de dar informacion precisa del nivel de combustible, esta informacion esta disponible para ti en linea!.','20240228214858.jpg',1,'2024-03-25 15:36:48',1,'MODIFICADO'),(104,12,'Gestion de alarmas y notificaciones','Configura y recibe alarmas por averias, definiendo parametros como temperatura o mensaje de error.','20240228211408.jpg',1,'2024-03-25 15:36:59',1,'MODIFICADO'),(105,12,'Gestion de alarmas y notificaciones','Configura y recibe alarmas por averias, definiendo parametros como temperatura o mensaje de error.','20240228211408.jpg',1,'2024-03-25 15:37:04',1,'MODIFICADO'),(106,11,'Supervision en tiempo real','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240228210332.jpg',1,'2024-03-25 15:37:14',1,'MODIFICADO'),(107,17,'Seguimiento y reportes','Configura la recepcion de reportes diarios, semanales o mensuales de tu dispositivo.','logo.png',1,'2024-03-25 15:37:41',1,'CREADO'),(108,18,'Confidencialidad y seguridad de datos','Garantiza la Confidencialidad e integridad de los datos emitidos por tu dispositivo.','logo.png',1,'2024-03-25 15:37:59',1,'CREADO'),(109,11,'Supervision en tiempo real','Monitorea continuamente tus dispositivos, lo que facilicita la identificacion de ineficiencias y la optimizacion de tus procesos.','20240325164107.jpg',1,'2024-03-25 15:41:07',1,'MODIFICADO'),(110,12,'Gestion de alarmas y notificaciones','Configura y recibe alarmas por averias, definiendo parametros como temperatura o mensaje de error.','20240325164121.jpg',1,'2024-03-25 15:41:21',1,'MODIFICADO'),(111,13,'Control de nivel de combustible','Los generadores tienen un sensor capaz de dar informacion precisa del nivel de combustible, esta informacion esta disponible para ti en linea!.','20240325164133.jpg',1,'2024-03-25 15:41:33',1,'MODIFICADO'),(112,14,'Toma de decisiones informadas','Ofrece un registro de datos historicos para analisis,patrones y decisiones basadas en datos.','20240325164146.jpg',1,'2024-03-25 15:41:46',1,'MODIFICADO'),(113,15,'Alertas por robo de combustible','Ante niveles de combustible inusuales, la plataforma emite alertas.','20240325164158.jpg',1,'2024-03-25 15:41:59',1,'MODIFICADO'),(114,16,'Reduccion de Costos','El monitoreo constante previene daños costosos a la carga y reduce el indice de reclamaciones con los seguros.','20240325164210.jpg',1,'2024-03-25 15:42:10',1,'MODIFICADO'),(115,17,'Seguimiento y reportes','Configura la recepcion de reportes diarios, semanales o mensuales de tu dispositivo.','logo.png',1,'2024-03-25 15:42:14',1,'MODIFICADO'),(116,17,'Seguimiento y reportes','Configura la recepcion de reportes diarios, semanales o mensuales de tu dispositivo.','20240325164225.jpg',1,'2024-03-25 15:42:25',1,'MODIFICADO'),(117,18,'Confidencialidad y seguridad de datos','Garantiza la Confidencialidad e integridad de los datos emitidos por tu dispositivo.','20240325164236.jpg',1,'2024-03-25 15:42:36',1,'MODIFICADO');
/*!40000 ALTER TABLE `h_caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_formulario`
--

DROP TABLE IF EXISTS `h_formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_formulario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formulario_id` int(11) NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `email_cliente` varchar(250) NOT NULL,
  `telefono_cliente` varchar(12) NOT NULL,
  `asunto_formulario` varchar(150) NOT NULL,
  `mensaje` text NOT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_formulario`
--

LOCK TABLES `h_formulario` WRITE;
/*!40000 ALTER TABLE `h_formulario` DISABLE KEYS */;
INSERT INTO `h_formulario` VALUES (1,1,'kevin','kevin_sss@gmail.com','CREADO','hoa','holasadasd',1,'2024-02-16 21:35:11',1,'CREADO'),(2,1,'hola','hola','CREADO','hola','hola',1,'2024-02-17 14:55:05',1,'CREADO'),(3,1,'kevin huete','kevin@gmail.com','CREADO','prueba total','hola hola hola hola',1,'2024-02-17 16:28:33',1,'CREADO'),(4,1,'asdads','sada@asdasdads','CREADO','sdada','asdasd',1,'2024-02-19 23:00:55',1,'CREADO'),(5,1,'kevin','kevin.anderson.huete@gmail.com','CREADO','hola','hola',1,'2024-02-20 16:23:23',1,'CREADO'),(6,1,'qqq','asd@gmail.com','CREADO','132123','12313',1,'2024-02-20 16:37:10',1,'CREADO'),(7,1,'kevin','zgroupsistemas@gmail.com','CREADO','asdasd','asdad',1,'2024-02-20 16:46:33',1,'CREADO'),(8,1,'kevin','kevin.anderson.huete@gmail.com','CREADO','xdfsf','sssssssssssssssssssssssssss',1,'2024-02-20 17:29:24',1,'CREADO'),(9,1,'kevin','kevin.anderson.huete@gmail.com','CREADO','pedido','sadadasdads',1,'2024-02-20 18:48:44',1,'CREADO'),(10,1,'wwq','asd@gmail.com','CREADO','asdasd','sadsd',1,'2024-02-22 16:25:28',1,'CREADO'),(11,1,'123132','asd@gmaill.com1','CREADO','asdasa','dasd',1,'2024-02-22 18:58:30',1,'CREADO'),(12,1,'eeer','asa@gmail.com','CREADO','123','213',1,'2024-02-22 19:18:57',1,'CREADO'),(13,1,'asasd','asdasd@sadasdasd.com','CREADO','asdasd','asdasd',1,'2024-02-23 15:51:56',1,'CREADO'),(14,1,'asdad','asdda@asdasdasd','CREADO','sdasd','asdads',1,'2024-02-28 21:41:28',1,'CREADO');
/*!40000 ALTER TABLE `h_formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_funciones`
--

DROP TABLE IF EXISTS `h_funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_funciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcion_id` int(11) NOT NULL,
  `funciones` varchar(150) NOT NULL,
  `categoria` varchar(250) NOT NULL,
  `foto` varchar(250) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_funciones`
--

LOCK TABLES `h_funciones` WRITE;
/*!40000 ALTER TABLE `h_funciones` DISABLE KEYS */;
INSERT INTO `h_funciones` VALUES (1,2,'Estado del equipo','Monitoreo','20240221160237.jpg',1,'2024-02-21 15:02:37',1,'CREADO'),(2,5,'1233dd','Control','',1,'2024-02-21 19:39:19',1,'CREADO'),(3,2,'Estado del equipo88899','Monitoreo','',1,'2024-02-21 19:53:41',2147483647,'1'),(4,2,'Estado del equipo88899','Monitoreo','',0,'2024-02-21 20:01:00',1,'ELIMINADO'),(5,2,'Estado del equipo88899','Monitoreo','',1,'2024-02-21 20:02:25',1,'RESTAURADO'),(6,1,'Registro de temperaturas','monitoreo','',1,'2024-02-21 20:02:56',1,'RESTAURADO'),(7,4,'23123155','Monitoreo','20240221203824.jpg',1,'2024-02-21 20:07:17',1,'MODIFICADO'),(8,6,'hola','Monitoreo','20240221210727.jpg',1,'2024-02-21 20:07:27',1,'CREADO'),(9,4,'Registro de temperaturas','Monitoreo','20240222152010.jpg',1,'2024-02-22 14:20:10',1,'MODIFICADO'),(10,5,'Estado del equipo','Monitoreo','20240222152029.jpg',1,'2024-02-22 14:20:29',1,'MODIFICADO'),(11,6,'Ubicacion','Monitoreo','20240222152043.jpg',1,'2024-02-22 14:20:43',1,'MODIFICADO'),(12,7,'Configuracion de alarmas','Control','20240222152101.jpg',1,'2024-02-22 14:21:01',1,'CREADO'),(13,8,'Consumo','Control','20240222152119.jpg',1,'2024-02-22 14:21:19',1,'CREADO'),(14,9,'Cambios de temperatura','Control','20240222152137.jpg',1,'2024-02-22 14:21:37',1,'CREADO'),(15,9,'Cambios de temperatura','Control','',0,'2024-02-22 20:32:07',1,'ELIMINADO'),(16,8,'Consumo','Control','',0,'2024-02-22 20:32:08',1,'ELIMINADO'),(17,7,'Configuracion de alarmas','Control','',0,'2024-02-22 20:32:10',1,'ELIMINADO'),(18,6,'Ubicacion','Monitoreo','',0,'2024-02-22 20:32:12',1,'ELIMINADO'),(19,5,'Estado del equipo','Monitoreo','',0,'2024-02-22 20:32:13',1,'ELIMINADO'),(20,5,'Estado del equipo','Monitoreo','',1,'2024-02-22 22:21:10',1,'RESTAURADO'),(21,6,'Ubicacion','Monitoreo','',1,'2024-02-22 22:21:41',1,'RESTAURADO'),(22,7,'Configuracion de alarmas','Control','',1,'2024-02-23 15:03:26',1,'RESTAURADO'),(23,8,'Consumo','Control','',1,'2024-02-23 15:04:28',1,'RESTAURADO'),(24,8,'Consumo','Control','',0,'2024-02-23 15:06:01',1,'ELIMINADO'),(25,7,'Configuracion de alarmas','Control','',0,'2024-02-23 15:06:05',1,'ELIMINADO'),(26,5,'Estado del equipo','Monitoreo','',0,'2024-02-23 15:06:10',1,'ELIMINADO'),(27,6,'Ubicacion','Monitoreo','',0,'2024-02-23 15:29:36',1,'ELIMINADO'),(28,5,'Estado del equipo','Monitoreo','',1,'2024-02-23 15:29:46',1,'RESTAURADO'),(29,6,'Ubicacion','Monitoreo','',1,'2024-02-23 15:29:49',1,'RESTAURADO'),(30,7,'Configuracion de alarmas','Control','',1,'2024-02-23 15:29:51',1,'RESTAURADO'),(31,6,'Ubicacion','Monitoreo','',0,'2024-02-23 15:34:18',1,'ELIMINADO'),(32,7,'Configuracion de alarmas','Control','',0,'2024-02-23 15:34:20',1,'ELIMINADO'),(33,7,'Configuracion de alarmas','Control','',1,'2024-02-23 15:44:10',1,'RESTAURADO'),(34,4,'Registro de temperaturas','Monitoreo','20240223171112.jpg',1,'2024-02-23 16:11:12',1,'MODIFICADO'),(35,5,'Estado del equipo','Monitoreo','20240223171119.jpg',1,'2024-02-23 16:11:19',1,'MODIFICADO'),(36,6,'Ubicacion','Monitoreo','',1,'2024-02-23 16:11:23',1,'RESTAURADO'),(37,6,'Ubicacion','Monitoreo','20240223171130.jpg',1,'2024-02-23 16:11:30',1,'MODIFICADO'),(38,7,'Configuracion de alarmas','Control','20240223171138.jpg',1,'2024-02-23 16:11:38',1,'MODIFICADO'),(39,8,'Consumo','Control','',1,'2024-02-23 16:11:43',1,'RESTAURADO'),(40,8,'Consumo','Control','20240223171148.jpg',1,'2024-02-23 16:11:48',1,'MODIFICADO'),(41,9,'Cambios de temperatura','Control','',1,'2024-02-23 16:11:50',1,'RESTAURADO'),(42,9,'Cambios de temperatura','Control','20240223171155.jpg',1,'2024-02-23 16:11:55',1,'MODIFICADO'),(43,9,'Cambios de temperatura','Control','',0,'2024-02-24 13:25:56',1,'ELIMINADO'),(44,8,'Consumo','Control','',0,'2024-02-24 13:25:58',1,'ELIMINADO'),(45,7,'Configuracion de alarmas','Control','',0,'2024-02-24 13:26:01',1,'ELIMINADO'),(46,6,'Ubicacion','Monitoreo','',0,'2024-02-24 13:26:04',1,'ELIMINADO'),(47,5,'Estado del equipo','Monitoreo','',0,'2024-02-24 13:26:06',1,'ELIMINADO'),(48,7,'Configuracion de alarmas','Control','',1,'2024-02-24 13:26:12',1,'RESTAURADO'),(49,5,'Estado del equipo','Monitoreo','',1,'2024-02-24 16:33:03',1,'RESTAURADO'),(50,9,'Cambios de temperatura','Control','',1,'2024-02-24 16:33:10',1,'RESTAURADO'),(51,6,'Ubicacion','Monitoreo','',1,'2024-02-28 18:32:06',1,'RESTAURADO'),(52,8,'Consumo','Control','',1,'2024-02-28 18:32:28',1,'RESTAURADO'),(53,9,'Cambios de temperatura2','Control','20240223171155.jpg',1,'2024-02-28 18:49:20',1,'MODIFICADO'),(54,9,'Cambios de temperatura222','Control','20240223171155.jpg',1,'2024-02-28 18:49:49',1,'MODIFICADO'),(55,8,'Consumo22','Control','20240223171148.jpg',1,'2024-02-28 18:50:03',1,'MODIFICADO'),(56,4,'Registro de temperaturas22','Monitoreo','20240223171112.jpg',1,'2024-02-28 18:50:30',1,'MODIFICADO'),(57,5,'Estado del equipo22','Monitoreo','20240223171119.jpg',1,'2024-02-28 18:50:47',1,'MODIFICADO'),(58,6,'Ubicacion33','Monitoreo','20240223171130.jpg',1,'2024-02-28 18:50:57',1,'MODIFICADO'),(59,7,'Configuracion de alarmas22','Control','20240223171138.jpg',1,'2024-02-28 18:51:11',1,'MODIFICADO'),(60,8,'Consumo2211','Control','20240223171148.jpg',1,'2024-02-28 18:51:19',1,'MODIFICADO'),(61,9,'Cambios de temperatura222','Control','20240223171155.jpg',1,'2024-02-28 18:51:29',1,'MODIFICADO'),(62,9,'Cambios de temperatura2223','Control','20240223171155.jpg',1,'2024-02-28 18:51:34',1,'MODIFICADO'),(63,4,'Registro de temperaturas','Monitoreo','20240228215626.jpg',1,'2024-02-28 20:56:26',1,'MODIFICADO'),(64,5,'Estado del equipo','Monitoreo','20240228215633.jpg',1,'2024-02-28 20:56:33',1,'MODIFICADO'),(65,6,'Ubicacion','Monitoreo','20240228215641.jpg',1,'2024-02-28 20:56:41',1,'MODIFICADO'),(66,7,'Configuracion de alarmas22','Control','20240228215648.jpg',1,'2024-02-28 20:56:48',1,'MODIFICADO'),(67,7,'Configuracion de alarmas','Control','20240228215648.jpg',1,'2024-02-28 20:56:52',1,'MODIFICADO'),(68,8,'Consumo2211','Control','20240228215709.jpg',1,'2024-02-28 20:57:09',1,'MODIFICADO'),(69,9,'Cambios de temperatura','Control','20240228215719.jpg',1,'2024-02-28 20:57:19',1,'MODIFICADO'),(70,8,'Consumo','Control','20240228215709.jpg',1,'2024-03-25 15:10:33',1,'MODIFICADO');
/*!40000 ALTER TABLE `h_funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_informacion`
--

DROP TABLE IF EXISTS `h_informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_informacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `informacion_id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_informacion`
--

LOCK TABLES `h_informacion` WRITE;
/*!40000 ALTER TABLE `h_informacion` DISABLE KEYS */;
INSERT INTO `h_informacion` VALUES (1,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia;cambia p',1,'2024-02-20 21:41:42',1,'MODIFICADO'),(2,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia;cambia p',1,'2024-02-20 21:41:50',1,'MODIFICADO'),(3,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia;cambia p',1,'2024-02-20 21:42:06',1,'MODIFICADO'),(4,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia;cambia p',1,'2024-02-20 21:45:37',1,'MODIFICADO'),(5,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia;cambia p',1,'2024-02-20 21:46:19',1,'MODIFICADO'),(6,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados,maduradoresmóviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia;cambia pa',1,'2024-02-20 21:46:27',1,'MODIFICADO'),(7,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores',1,'2024-02-20 21:46:33',1,'MODIFICADO'),(8,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores.',1,'2024-02-20 21:48:22',1,'MODIFICADO'),(9,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados ,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia ; cambi',1,'2024-02-21 13:23:35',1,'MODIFICADO'),(10,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados ,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia ; cambi',1,'2024-02-21 13:26:04',1,'MODIFICADO'),(11,1,'QUE ES ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados ,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia ; cambi',1,'2024-02-22 19:26:10',1,'MODIFICADO'),(12,1,'ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados ,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia ; cambi',1,'2024-02-22 21:49:14',1,'MODIFICADO'),(13,1,'ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados ,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia ; cambi',1,'2024-02-22 21:50:18',1,'MODIFICADO'),(14,1,'ZTRACKsss','Somos una solución tecnológica integral para el monitoreo y control a distancia',1,'2024-02-24 16:32:50',1,'MODIFICADO'),(15,1,'ZTRACKsss','Somos una solución tecnológica integral para el monitoreo y control a distanciafffff',1,'2024-02-24 16:37:35',1,'MODIFICADO'),(16,1,'ZTRACKsss','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados ,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia ; cambi',1,'2024-02-26 14:59:43',1,'MODIFICADO'),(17,1,'ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados ,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia ; cambi',1,'2024-02-26 22:38:36',1,'MODIFICADO'),(18,1,'ZTRACK','Somos 2una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados ,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia ; camb',1,'2024-03-15 20:55:14',1,'MODIFICADO'),(19,1,'ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados ,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia ; cambi',1,'2024-03-19 20:52:11',1,'MODIFICADO');
/*!40000 ALTER TABLE `h_informacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_modal`
--

DROP TABLE IF EXISTS `h_modal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_modal` (
  `id` int(11) NOT NULL,
  `modal_id` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `subtitulo` varchar(50) NOT NULL,
  `descripcion` varchar(350) NOT NULL,
  `foto` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_modal`
--

LOCK TABLES `h_modal` WRITE;
/*!40000 ALTER TABLE `h_modal` DISABLE KEYS */;
INSERT INTO `h_modal` VALUES (0,0,'hola','','123','20240227204833.jpg',1,'2024-02-27 19:48:33',1,'CREADO'),(0,1,'hola','','12344','20240227204833.jpg',1,'2024-02-27 20:09:01',1,'MODIFICADO'),(0,1,'hola','222','12344','20240227212912.jpg',1,'2024-02-27 20:29:12',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTA','50 % OFF','en tu primera Adquisicion Para mayor Informacion , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240227212912.jpg',1,'2024-02-27 20:30:42',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTA','50 % OFF','en tu primera Adquisicion Para mayor Informacion , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240227213154.jpg',1,'2024-02-27 20:31:54',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTA','50 % OFF33','en tu primera Adquisicion Para mayor Informacion , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240227213154.jpg',1,'2024-02-27 21:26:48',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTA11','50 % OFF33','en tu primera Adquisicion Para mayor Informacion , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240227213154.jpg',1,'2024-02-27 21:27:22',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTA11','50 % OFF33','en tu primera Adquisicion Para mayor Informacion , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228161702.jpg',1,'2024-02-28 15:17:02',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTA','50 % OFF','en tu primera Adquisicion Para mayor Informacion , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228161702.jpg',1,'2024-02-28 15:31:29',1,'MODIFICADO'),(0,2,'APROVECHA ESTA GRAN OFERTAS','S','S','20240228164307.jpg',1,'2024-02-28 15:43:07',1,'CREADO'),(0,2,'APROVECHA ESTA GRAN OFERTAS','50 % OFF','S','20240228164307.jpg',1,'2024-02-28 15:43:14',1,'MODIFICADO'),(0,2,'APROVECHA ESTA GRAN OFERTAS','50 % OFF','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228164307.jpg',1,'2024-02-28 15:43:55',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228165019.jpg',1,'2024-02-28 15:50:19',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF333','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228165019.jpg',1,'2024-02-28 15:52:34',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF333','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228165333.jpg',1,'2024-02-28 15:53:33',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF333','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228165406.jpg',1,'2024-02-28 15:54:06',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228165406.jpg',1,'2024-02-28 15:54:26',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228170922.jpg',1,'2024-02-28 16:09:22',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF2','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228170922.jpg',1,'2024-02-28 16:09:27',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF22','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228170922.jpg',1,'2024-02-28 16:09:48',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228170922.jpg',1,'2024-02-28 16:09:52',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228171003.jpg',1,'2024-02-28 16:10:03',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF223','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228171003.jpg',1,'2024-02-28 16:10:07',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF223','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','logo.png',1,'2024-02-28 16:16:41',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF223','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228171648.jpg',1,'2024-02-28 16:16:48',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF223','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228171648.jpg',1,'2024-02-28 16:17:01',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF223','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','',0,'2024-02-28 16:37:15',1,'ELIMINADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF223','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','',1,'2024-02-28 16:37:19',1,'RESTAURADO'),(0,3,'hola22','hol','hola','20240228173734.jpg',1,'2024-02-28 16:40:44',1,'MODIFICADO'),(0,3,'hola22','hol','hola','',0,'2024-02-28 16:40:59',1,'ELIMINADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF223','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228174107.jpg',1,'2024-02-28 16:41:08',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF2234','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228174107.jpg',1,'2024-02-28 16:42:30',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF2234','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228174238.jpg',1,'2024-02-28 16:42:38',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22344','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228174238.jpg',1,'2024-02-28 16:42:48',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22344','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228180249.jpg',1,'2024-02-28 17:02:49',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22344','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228180249.jpg',1,'2024-02-28 17:02:57',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22344','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228180544.jpg',1,'2024-02-28 17:05:44',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22344','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228180545.jpg',1,'2024-02-28 17:05:45',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22344','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228180553.jpg',1,'2024-02-28 17:05:53',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22344','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228180741.jpg',1,'2024-02-28 17:07:41',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF2234443','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228180741.jpg',1,'2024-02-28 17:08:05',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF2234443','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228181438.jpg',1,'2024-02-28 17:14:38',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22344435','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228181438.jpg',1,'2024-02-28 17:15:00',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22344435','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228193024.jpg',1,'2024-02-28 18:30:24',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF22344435','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228193444.jpg',1,'2024-02-28 18:34:44',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228193444.jpg',1,'2024-02-28 18:36:18',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228193641.jpg',1,'2024-02-28 18:36:41',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF3','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228193641.jpg',1,'2024-02-28 18:36:48',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF3','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228194218.jpg',1,'2024-02-28 18:42:18',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF31','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228194218.jpg',1,'2024-02-28 18:42:25',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF31','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228194218.jpg',1,'2024-02-28 18:48:09',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF31','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228194827.jpg',1,'2024-02-28 18:48:27',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS1','50 % OFF312','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228194827.jpg',1,'2024-02-28 18:48:52',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228220036.jpg',1,'2024-02-28 21:00:36',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS2','50 % OFF','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228220036.jpg',1,'2024-02-28 21:00:43',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS2','50 % OFF2','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228220036.jpg',1,'2024-02-28 21:00:57',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228220036.jpg',1,'2024-02-28 21:01:35',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF por tu primera compra','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228220036.jpg',1,'2024-02-28 21:28:03',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 % OFF','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228220036.jpg',1,'2024-02-28 21:28:20',1,'MODIFICADO'),(0,1,'APROVECHA ESTA GRAN OFERTAS','50 %','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228220036.jpg',1,'2024-02-28 21:33:17',1,'MODIFICADO');
/*!40000 ALTER TABLE `h_modal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_nabvar`
--

DROP TABLE IF EXISTS `h_nabvar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_nabvar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nabvar_id` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_nabvar`
--

LOCK TABLES `h_nabvar` WRITE;
/*!40000 ALTER TABLE `h_nabvar` DISABLE KEYS */;
INSERT INTO `h_nabvar` VALUES (1,1,'ini',1,'2024-02-21 22:43:33',1,'CREADO'),(2,2,'ss',1,'2024-02-21 22:44:36',1,'CREADO'),(3,3,'sasada',1,'2024-02-21 22:44:40',1,'CREADO'),(4,4,'555',1,'2024-02-21 22:47:54',1,'CREADO'),(5,1,'ini55',1,'2024-02-21 22:48:26',1,'MODIFICADO'),(6,1,'ini55',0,'2024-02-21 22:52:09',1,'ELIMINADO'),(7,1,'ini55',1,'2024-02-21 22:52:11',1,'RESTAURADO'),(8,1,'Inicio',1,'2024-02-22 14:17:49',1,'MODIFICADO'),(9,2,'Beneficios',1,'2024-02-22 14:18:01',1,'MODIFICADO'),(10,3,'Caracteristicas',1,'2024-02-22 14:18:07',1,'MODIFICADO'),(11,4,'Videos',1,'2024-02-22 14:18:14',1,'MODIFICADO'),(12,5,'Contactenos',1,'2024-02-22 14:18:21',1,'CREADO'),(13,6,'hola',1,'2024-02-22 16:49:52',1,'CREADO'),(14,7,'que tal',1,'2024-02-22 16:50:54',1,'CREADO'),(15,7,'nose',1,'2024-02-22 16:51:06',1,'MODIFICADO'),(16,7,'para',1,'2024-02-22 16:51:30',1,'MODIFICADO'),(17,7,'para',0,'2024-02-22 16:52:28',1,'ELIMINADO'),(18,6,'hola',0,'2024-02-22 16:52:31',1,'ELIMINADO'),(19,6,'hola',1,'2024-02-22 16:52:48',1,'RESTAURADO'),(20,7,'para',1,'2024-02-22 16:52:50',1,'RESTAURADO'),(21,7,'nose borra',1,'2024-02-22 16:52:55',1,'MODIFICADO'),(22,6,'que se puede hacer',1,'2024-02-22 16:53:02',1,'MODIFICADO'),(23,8,'ayuda',1,'2024-02-22 16:53:22',1,'CREADO'),(24,9,'chamare',1,'2024-02-22 16:53:37',1,'CREADO'),(25,9,'buscquemos',1,'2024-02-22 16:53:45',1,'MODIFICADO'),(26,10,'soluciines',1,'2024-02-22 16:53:54',1,'CREADO'),(27,11,'asd',1,'2024-02-22 16:54:01',1,'CREADO'),(28,12,'asasd',1,'2024-02-22 16:54:06',1,'CREADO'),(29,10,'soluciines',0,'2024-02-22 16:54:27',1,'ELIMINADO'),(30,9,'buscquemos',0,'2024-02-22 16:54:29',1,'ELIMINADO'),(31,8,'ayuda',0,'2024-02-22 16:54:33',1,'ELIMINADO'),(32,7,'nose borra',0,'2024-02-22 16:54:35',1,'ELIMINADO'),(33,6,'que se puede hacer',0,'2024-02-22 16:54:38',1,'ELIMINADO'),(34,13,'hola',1,'2024-02-22 17:00:10',1,'CREADO'),(35,13,'hola',0,'2024-02-22 17:06:50',1,'ELIMINADO'),(36,13,'hola',1,'2024-02-22 18:31:03',1,'RESTAURADO'),(37,13,'hola',0,'2024-02-22 18:31:15',1,'ELIMINADO'),(38,13,'hola',1,'2024-02-22 18:31:32',1,'RESTAURADO'),(39,13,'hola',0,'2024-02-22 18:31:42',1,'ELIMINADO'),(40,13,'hola',1,'2024-02-22 18:32:54',1,'RESTAURADO'),(41,13,'hola',0,'2024-02-22 18:34:53',1,'ELIMINADO'),(42,13,'hola',1,'2024-02-22 18:46:33',1,'RESTAURADO'),(43,13,'hola',0,'2024-02-22 19:12:24',1,'ELIMINADO'),(44,13,'hola',1,'2024-02-22 19:14:08',1,'RESTAURADO'),(45,13,'hola',0,'2024-02-22 19:17:59',1,'ELIMINADO'),(46,13,'hola',1,'2024-02-22 19:21:52',1,'RESTAURADO'),(47,13,'prueba1',1,'2024-02-22 19:22:14',1,'MODIFICADO'),(48,13,'hola',1,'2024-02-22 19:22:28',1,'MODIFICADO'),(49,13,'hola',0,'2024-02-22 19:24:21',1,'ELIMINADO'),(50,13,'hola',1,'2024-02-22 19:24:26',1,'RESTAURADO'),(51,14,'123',1,'2024-02-22 19:28:43',1,'CREADO'),(52,15,'44',1,'2024-02-22 19:28:50',1,'CREADO'),(53,16,'55',1,'2024-02-22 19:28:52',1,'CREADO'),(54,16,'55',0,'2024-02-22 20:31:43',1,'ELIMINADO'),(55,15,'44',0,'2024-02-22 20:31:44',1,'ELIMINADO'),(56,14,'123',0,'2024-02-22 20:31:45',1,'ELIMINADO'),(57,13,'hola',0,'2024-02-22 20:31:48',1,'ELIMINADO'),(58,5,'Contactenos',0,'2024-02-22 20:31:50',1,'ELIMINADO'),(59,4,'Videos',0,'2024-02-22 20:31:51',1,'ELIMINADO'),(60,3,'Caracteristicas',0,'2024-02-22 20:31:53',1,'ELIMINADO'),(61,2,'Beneficios',0,'2024-02-22 20:31:55',1,'ELIMINADO'),(62,2,'Beneficios',1,'2024-02-22 21:53:48',1,'RESTAURADO'),(63,5,'Contactenos',1,'2024-02-22 21:55:14',1,'RESTAURADO'),(64,3,'Caracteristicas',1,'2024-02-22 22:00:50',1,'RESTAURADO'),(65,2,'beneficios',1,'2024-02-22 22:05:44',1,'MODIFICADO'),(66,3,'caracteristicas',1,'2024-02-22 22:06:14',1,'MODIFICADO'),(67,4,'Videos',1,'2024-02-22 22:06:24',1,'RESTAURADO'),(68,4,'videos',1,'2024-02-22 22:06:29',1,'MODIFICADO'),(69,5,'contactenos',1,'2024-02-22 22:08:00',1,'MODIFICADO'),(70,1,'inicio',1,'2024-02-22 22:08:16',1,'MODIFICADO'),(71,2,'beneficios',0,'2024-02-23 13:39:34',1,'ELIMINADO'),(72,2,'beneficios',1,'2024-02-23 13:39:41',1,'RESTAURADO'),(73,1,'Inicio',1,'2024-02-23 16:22:43',1,'MODIFICADO'),(74,2,'Beneficios',1,'2024-02-23 16:22:48',1,'MODIFICADO'),(75,3,'Caracteristicas',1,'2024-02-23 16:22:51',1,'MODIFICADO'),(76,4,'Videos',1,'2024-02-23 16:22:56',1,'MODIFICADO'),(77,5,'Contactenos',1,'2024-02-23 16:22:59',1,'MODIFICADO'),(78,3,'Caracteristicas',0,'2024-02-24 13:25:40',1,'ELIMINADO'),(79,4,'Videos',0,'2024-02-24 13:25:42',1,'ELIMINADO'),(80,5,'Contactenos',0,'2024-02-24 13:25:44',1,'ELIMINADO'),(81,2,'Beneficios',0,'2024-02-24 13:25:46',1,'ELIMINADO'),(82,2,'Beneficios',1,'2024-02-24 16:29:34',1,'RESTAURADO'),(83,3,'Caracteristicas',1,'2024-02-24 16:29:36',1,'RESTAURADO'),(84,4,'Videos',1,'2024-02-24 16:29:38',1,'RESTAURADO'),(85,5,'Contactenos',1,'2024-02-24 16:29:40',1,'RESTAURADO'),(86,4,'Videos',0,'2024-02-24 16:32:07',1,'ELIMINADO'),(87,4,'Videos',1,'2024-02-24 16:32:12',1,'RESTAURADO'),(88,4,'Videos',0,'2024-02-24 16:38:34',1,'ELIMINADO'),(89,1,'Inicio',0,'2024-02-26 13:32:36',1,'ELIMINADO'),(90,1,'Inicio',1,'2024-02-26 13:32:48',1,'RESTAURADO'),(91,4,'Videos',1,'2024-02-26 18:51:51',1,'RESTAURADO'),(92,2,'Beneficios',0,'2024-02-26 19:16:38',1,'ELIMINADO'),(93,2,'Beneficios',1,'2024-02-26 20:09:13',1,'RESTAURADO'),(94,2,'Beneficios',0,'2024-02-26 20:09:31',1,'ELIMINADO'),(95,2,'Beneficios',1,'2024-02-26 20:13:54',1,'RESTAURADO'),(96,2,'Beneficios3',1,'2024-02-27 20:04:37',1,'MODIFICADO'),(97,2,'Beneficios',1,'2024-02-28 15:58:54',1,'MODIFICADO'),(98,4,'Videos',0,'2024-03-15 20:57:28',1,'ELIMINADO'),(99,4,'Videos',1,'2024-03-19 16:01:39',1,'RESTAURADO');
/*!40000 ALTER TABLE `h_nabvar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_preguntas`
--

DROP TABLE IF EXISTS `h_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta_id` int(11) NOT NULL,
  `pregunta` varchar(50) NOT NULL,
  `respuesta` varchar(250) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_preguntas`
--

LOCK TABLES `h_preguntas` WRITE;
/*!40000 ALTER TABLE `h_preguntas` DISABLE KEYS */;
INSERT INTO `h_preguntas` VALUES (1,6,'ss','ss',1,'2024-02-21 17:10:52',1,'CREADO'),(2,2,'1233234','123234234',1,'2024-02-21 17:21:55',1,'MODIFICADO'),(3,1,'solo?','no',0,'2024-02-21 17:27:56',1,'ELIMINADO'),(4,1,'solo?','no',1,'2024-02-21 17:27:58',1,'RESTAURADO'),(5,1,'¿Qué es la telemetría ztrack de zgroup?','La telemetría ztrack es un sistema que utiliza tecnología remota para monitorear y controlar contenedores refrigerados. Proporciona información en tiempo real sobre la temperatura, humedad, ubicación y otros parámetros clave para garantizar la integr',1,'2024-02-22 14:29:46',1,'MODIFICADO'),(6,2,'¿Cómo funciona nuestro sistema de telemetría ztrac','Nuestro sistema de telemetría utiliza sensores instalados en los contenedores refrigerados que recopilan datos. Estos datos se transmiten de forma inalámbrica a nuestra plataforma en la nube, donde se procesan y analizan para brindar información en t',1,'2024-02-22 14:30:52',1,'MODIFICADO'),(7,3,'¿Cuáles son las ventajas de utilizar ztrack en nue','La telemetría permite un monitoreo constante de las condiciones del contenedor, lo que garantiza la calidad de la carga, reduce el riesgo de pérdidas y optimiza la eficiencia operativa al proporcionar datos precisos para la toma de decisiones.',1,'2024-02-22 14:31:11',1,'MODIFICADO'),(8,4,'¿Qué tipo de información puedo monitorear y contro','Nuestro servicio permite monitorear la temperatura, humedad, ubicación, consumo de energía, entre otros parámetros relevantes para el buen funcionamiento de su equipo.',1,'2024-02-22 14:32:50',1,'MODIFICADO'),(9,5,'¿Cuál es la precisión de los datos proporcionados ','Nuestro sistema se caracteriza por su alta precisión en la recopilación y presentación de datos, con sensores calibrados y tecnología avanzada que garantizan mediciones confiables.',1,'2024-02-22 14:33:02',1,'MODIFICADO'),(10,6,'¿Cómo se asegura la seguridad de los datos transmi','Implementamos protocolos de seguridad robustos, como encriptación de datos y medidas de autenticación, para garantizar la protección de la información transmitida a través de nuestra plataforma.',1,'2024-02-22 14:33:13',1,'MODIFICADO'),(11,7,'¿Es compatible el sistema con diferentes marcas o ','Sí, nuestro sistema de telemetría está diseñado para ser compatible con una amplia gama de equipos , independientemente de la marca o el modelo.',1,'2024-02-22 14:33:27',1,'CREADO'),(12,8,'¿Qué tipo de alertas o notificaciones ofrece el se','Ofrecemos alertas personalizables que notifican sobre desviaciones de temperatura, cambios bruscos en la humedad, entre otras anomalías, permitiendo una acción inmediata para mitigar riesgos.',1,'2024-02-22 14:33:36',1,'CREADO'),(13,9,'¿Puedo acceder a los datos de telemetría en tiempo','Sí, nuestra plataforma proporciona acceso en tiempo real a los datos recopilados, permitiendo a los usuarios monitorear las condiciones del contenedor en cualquier momento y desde cualquier ubicación.',1,'2024-02-22 14:33:45',1,'CREADO'),(14,10,'¿El servicio ztrack esta incluido con mi equipo ZG','Ztrack es un servicio premiun , y requiere un costo de suscripcion adicional para acceder a todos sus beneficos , consulte con nuestro asesores un plan adecuado para su empresa.',1,'2024-02-22 14:33:54',1,'CREADO'),(15,11,'hola','prueba',1,'2024-02-22 19:48:48',1,'CREADO'),(16,11,'hola','prueba',0,'2024-02-22 19:49:04',1,'ELIMINADO'),(17,10,'¿El servicio ztrack esta incluido con mi equipo ZG','Ztrack es un servicio premiun , y requiere un costo de suscripcion adicional para acceder a todos sus beneficos , consulte con nuestro asesores un plan adecuado para su empresa.',0,'2024-02-22 20:33:01',1,'ELIMINADO'),(18,9,'¿Puedo acceder a los datos de telemetría en tiempo','Sí, nuestra plataforma proporciona acceso en tiempo real a los datos recopilados, permitiendo a los usuarios monitorear las condiciones del contenedor en cualquier momento y desde cualquier ubicación.',0,'2024-02-22 20:33:03',1,'ELIMINADO'),(19,8,'¿Qué tipo de alertas o notificaciones ofrece el se','Ofrecemos alertas personalizables que notifican sobre desviaciones de temperatura, cambios bruscos en la humedad, entre otras anomalías, permitiendo una acción inmediata para mitigar riesgos.',0,'2024-02-22 20:33:05',1,'ELIMINADO'),(20,7,'¿Es compatible el sistema con diferentes marcas o ','Sí, nuestro sistema de telemetría está diseñado para ser compatible con una amplia gama de equipos , independientemente de la marca o el modelo.',0,'2024-02-22 20:33:07',1,'ELIMINADO'),(21,6,'¿Cómo se asegura la seguridad de los datos transmi','Implementamos protocolos de seguridad robustos, como encriptación de datos y medidas de autenticación, para garantizar la protección de la información transmitida a través de nuestra plataforma.',0,'2024-02-22 20:33:09',1,'ELIMINADO'),(22,5,'¿Cuál es la precisión de los datos proporcionados ','Nuestro sistema se caracteriza por su alta precisión en la recopilación y presentación de datos, con sensores calibrados y tecnología avanzada que garantizan mediciones confiables.',0,'2024-02-22 20:33:10',1,'ELIMINADO'),(23,4,'¿Qué tipo de información puedo monitorear y contro','Nuestro servicio permite monitorear la temperatura, humedad, ubicación, consumo de energía, entre otros parámetros relevantes para el buen funcionamiento de su equipo.',0,'2024-02-22 20:33:12',1,'ELIMINADO'),(24,3,'¿Cuáles son las ventajas de utilizar ztrack en nue','La telemetría permite un monitoreo constante de las condiciones del contenedor, lo que garantiza la calidad de la carga, reduce el riesgo de pérdidas y optimiza la eficiencia operativa al proporcionar datos precisos para la toma de decisiones.',0,'2024-02-22 20:33:14',1,'ELIMINADO'),(25,2,'¿Cómo funciona nuestro sistema de telemetría ztrac','Nuestro sistema de telemetría utiliza sensores instalados en los contenedores refrigerados que recopilan datos. Estos datos se transmiten de forma inalámbrica a nuestra plataforma en la nube, donde se procesan y analizan para brindar información en t',0,'2024-02-22 20:33:16',1,'ELIMINADO'),(26,2,'¿Cómo funciona nuestro sistema de telemetría ztrac','Nuestro sistema de telemetría utiliza sensores instalados en los contenedores refrigerados que recopilan datos. Estos datos se transmiten de forma inalámbrica a nuestra plataforma en la nube, donde se procesan y analizan para brindar información en t',1,'2024-02-24 16:34:38',1,'RESTAURADO'),(27,3,'¿Cuáles son las ventajas de utilizar ztrack en nue','La telemetría permite un monitoreo constante de las condiciones del contenedor, lo que garantiza la calidad de la carga, reduce el riesgo de pérdidas y optimiza la eficiencia operativa al proporcionar datos precisos para la toma de decisiones.',1,'2024-02-24 16:34:58',1,'RESTAURADO'),(28,4,'¿Qué tipo de información puedo monitorear y contro','Nuestro servicio permite monitorear la temperatura, humedad, ubicación, consumo de energía, entre otros parámetros relevantes para el buen funcionamiento de su equipo.',1,'2024-02-24 16:35:15',1,'RESTAURADO'),(29,8,'¿Qué tipo de alertas o notificaciones ofrece el se','Ofrecemos alertas personalizables que notifican sobre desviaciones de temperatura, cambios bruscos en la humedad, entre otras anomalías, permitiendo una acción inmediata para mitigar riesgos.',1,'2024-02-26 16:34:29',1,'RESTAURADO');
/*!40000 ALTER TABLE `h_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_receta`
--

DROP TABLE IF EXISTS `h_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_receta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receta_id` int(11) NOT NULL,
  `codigo_receta` varchar(50) DEFAULT NULL,
  `nombre_receta` varchar(50) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_receta`
--

LOCK TABLES `h_receta` WRITE;
/*!40000 ALTER TABLE `h_receta` DISABLE KEYS */;
INSERT INTO `h_receta` VALUES (1,1,'100','luminaria3','Instalacion de luminarias',1,'2024-01-17 20:58:44',3,'MODIFICADO'),(2,1,'100','luminaria1','Instalacion de luminarias',1,'2024-01-17 20:58:52',3,'MODIFICADO'),(3,1,'100','luminard','Instalacion de luminarias',1,'2024-01-17 20:58:58',3,'MODIFICADO'),(4,1,'100','luminairas2','Instalacion de luminarias',1,'2024-01-17 20:59:20',1,'MODIFICADO'),(5,1,'104','luminairas2','Instalacion de luminarias',1,'2024-01-17 20:59:26',1,'MODIFICADO'),(6,1,'100','luminarias','Instalacion de luminarias',1,'2024-01-17 20:59:36',1,'MODIFICADO'),(7,1,'100','luminarias','Instalacion de luminarias',1,'2024-01-17 21:29:11',1,'ELIMINADO'),(8,1,'100','luminarias','Instalacion de luminarias',1,'2024-01-17 21:30:42',1,'ELIMINADO'),(9,1,'100','luminarias','Instalacion de luminarias',0,'2024-01-17 21:33:05',3,'ELIMINADO'),(10,1,'100','luminarias2','Instalacion de luminarias',1,'2024-01-17 21:35:18',3,'MODIFICADO'),(11,1,'100','luminarias222','Instalacion de luminarias',1,'2024-01-17 21:35:24',3,'MODIFICADO'),(12,1,'10022','luminarias222','Instalacion de luminarias',1,'2024-01-17 21:35:27',3,'MODIFICADO'),(13,1,'100','luminarias','Instalacion de luminarias',1,'2024-01-17 21:35:34',3,'MODIFICADO'),(14,1,'100','luminarias22','Instalacion de luminarias',1,'2024-01-17 21:39:10',3,'MODIFICADO'),(15,1,'100','luminarias2','Instalacion de luminarias',1,'2024-01-17 21:40:54',3,'MODIFICADO'),(16,1,'100','luminarias21','Instalacion de luminarias',1,'2024-01-17 21:42:38',3,'MODIFICADO'),(17,1,'100','luminarias2','Instalacion de luminarias',1,'2024-01-17 21:47:50',3,'MODIFICADO'),(18,4,'400','luis','ok',1,'2024-01-17 22:05:22',3,'CREADO'),(19,2,'200','CHELA','se acabo',0,'2024-01-18 00:39:35',1,'ELIMINADO'),(20,5,'220','CHELA','EE',1,'2024-01-18 00:44:30',1,'CREADO'),(21,2,'200','CHELA','se acabo',1,'2024-01-18 00:55:35',1,'RESTAURADO'),(22,5,'220','CHELA','EE',0,'2024-01-18 00:58:25',1,'ELIMINADO'),(23,5,'220','CHELA','EE',1,'2024-01-18 02:23:31',1,'RESTAURADO'),(24,5,'220','CHELA','EE',1,'2024-01-18 02:23:50',1,'RESTAURADO'),(25,5,'220','CHELA','EE',1,'2024-01-18 02:24:23',1,'RESTAURADO'),(26,5,'220','CHELA','EE',1,'2024-01-18 02:25:21',1,'RESTAURADO'),(27,2,'200','CHELA1','se acabo',1,'2024-01-18 02:25:49',1,'MODIFICADO'),(28,5,'220','CHELA','EE',1,'2024-01-18 02:25:53',1,'RESTAURADO'),(29,5,'220','CHELA','EE',1,'2024-01-18 02:26:01',1,'RESTAURADO'),(30,5,'220','CHELA','EE',1,'2024-01-18 02:29:20',1,'RESTAURADO'),(31,5,'220','CHELA','EE',1,'2024-01-18 02:31:21',1,'RESTAURADO'),(32,5,'220','CHELA','EE',0,'2024-01-18 02:35:43',1,'ELIMINADO'),(33,2,'200','CHELA','se acabo',1,'2024-01-18 02:35:49',1,'MODIFICADO'),(34,5,'220','CHELA','EE',1,'2024-01-18 02:35:52',1,'RESTAURADO'),(35,5,'220','CHELA','EE',1,'2024-01-18 02:35:56',1,'RESTAURADO'),(36,2,'200','CHELA1','se acabo',1,'2024-01-18 02:36:01',1,'MODIFICADO'),(37,5,'220','CHELA','EE',1,'2024-01-18 02:36:03',1,'RESTAURADO'),(38,5,'220','CHELA','EE',0,'2024-01-18 02:42:46',1,'ELIMINADO'),(39,6,'','CHELA','A',1,'2024-01-18 02:43:33',3,'CREADO'),(40,4,'400','luis5','ok',1,'2024-01-18 02:44:11',3,'MODIFICADO'),(41,2,'200','CHELA13','se acabo',1,'2024-01-18 02:44:16',3,'MODIFICADO'),(42,6,'','CHELA1','A',1,'2024-01-18 02:44:20',3,'MODIFICADO'),(43,5,'220','CHELA','EE',1,'2024-01-18 02:45:32',1,'RESTAURADO'),(44,5,'220','CHELA','EE',0,'2024-01-18 02:46:51',1,'ELIMINADO'),(45,7,'','CHELA','',1,'2024-01-18 02:46:59',1,'CREADO'),(46,5,'220','CHELA','EE',1,'2024-01-18 02:47:02',1,'RESTAURADO'),(47,7,'','CHEL','',1,'2024-01-18 02:47:09',1,'MODIFICADO'),(48,5,'220','CHELA','EE',1,'2024-01-18 02:47:11',1,'RESTAURADO'),(49,2,'200','CHELA132','se acabo',1,'2024-01-18 03:34:45',1,'MODIFICADO');
/*!40000 ALTER TABLE `h_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_respuesta_formulario`
--

DROP TABLE IF EXISTS `h_respuesta_formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_respuesta_formulario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta_id` int(11) NOT NULL,
  `formulario_id` int(11) NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `email_cliente` varchar(250) NOT NULL,
  `telefono_cliente` varchar(12) NOT NULL,
  `asunto_formulario` varchar(150) NOT NULL,
  `mensaje` text NOT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_respuesta_formulario`
--

LOCK TABLES `h_respuesta_formulario` WRITE;
/*!40000 ALTER TABLE `h_respuesta_formulario` DISABLE KEYS */;
INSERT INTO `h_respuesta_formulario` VALUES (81,145,8,'','zgroupsistemas@gmail.com','','COTIZACION DE LO SOLICITADO','se estará devolviendo la llamada al numero brindado',1,'2024-02-20 18:46:05',1,'RESPONDIDO'),(82,145,9,'','zgroupsistemas@gmail.com','','COTIZACION DE LO SOLICITADO','kasdasdaaskdjsakdad',1,'2024-02-20 18:49:44',6,'RESPONDIDO'),(83,145,8,'','zgroupsistemas@gmail.com','','123','132',1,'2024-02-21 17:03:48',1,'RESPONDIDO'),(84,145,10,'','zgroupsistemas@gmail.com','','COTIZACION','DFSDFDSFSDF',1,'2024-02-24 16:31:34',6,'RESPONDIDO');
/*!40000 ALTER TABLE `h_respuesta_formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_slider`
--

DROP TABLE IF EXISTS `h_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slider_id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `foto` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_slider`
--

LOCK TABLES `h_slider` WRITE;
/*!40000 ALTER TABLE `h_slider` DISABLE KEYS */;
INSERT INTO `h_slider` VALUES (1,0,'','20240221225229.jpg',1,'2024-02-21 21:52:29',1,'CREADO'),(2,0,'','20240221225238.jpg',1,'2024-02-21 21:52:38',1,'CREADO'),(3,4,'','20240221225326.jpg',1,'2024-02-21 21:53:26',1,'CREADO'),(4,1,'','20240221225835.jpg',1,'2024-02-21 21:59:49',1,'MODIFICADO'),(5,1,'','20240221225958.jpg',1,'2024-02-21 21:59:58',1,'MODIFICADO'),(6,1,'','20240221230353.jpg',1,'2024-02-21 22:03:53',1,'MODIFICADO'),(7,1,'','20240221230353.jpg',1,'2024-02-21 22:06:33',1,'RESTAURADO'),(8,1,'','20240222151843.jpg',1,'2024-02-22 14:18:43',1,'MODIFICADO'),(9,2,'','20240222151900.jpg',1,'2024-02-22 14:19:00',1,'MODIFICADO'),(10,3,'','20240222151911.jpg',1,'2024-02-22 14:19:11',1,'MODIFICADO'),(11,4,'','20240222151923.jpg',1,'2024-02-22 14:19:23',1,'MODIFICADO'),(12,2,'','20240222151900.jpg',0,'2024-02-23 17:04:05',1,'ELIMINADO'),(13,3,'','20240222151911.jpg',0,'2024-02-23 17:04:07',1,'ELIMINADO'),(14,4,'','20240222151923.jpg',0,'2024-02-23 17:04:08',1,'ELIMINADO'),(15,2,'','20240222151900.jpg',1,'2024-02-23 17:04:18',1,'RESTAURADO'),(16,3,'','20240222151911.jpg',1,'2024-02-23 17:04:55',1,'RESTAURADO'),(17,4,'','20240222151923.jpg',1,'2024-02-23 17:05:01',1,'RESTAURADO'),(18,2,'','20240222151900.jpg',0,'2024-02-23 17:05:19',1,'ELIMINADO'),(19,3,'','20240222151911.jpg',0,'2024-02-23 17:05:21',1,'ELIMINADO'),(20,4,'','20240222151923.jpg',0,'2024-02-23 17:05:22',1,'ELIMINADO'),(21,1,'','20240223180547.jpg',1,'2024-02-23 17:05:47',1,'MODIFICADO'),(22,2,'','20240222151900.jpg',1,'2024-02-23 17:05:52',1,'RESTAURADO'),(23,2,'','20240223180605.jpg',1,'2024-02-23 17:06:05',1,'MODIFICADO'),(24,3,'','20240222151911.jpg',1,'2024-02-23 17:06:25',1,'RESTAURADO'),(25,3,'','20240223180632.jpg',1,'2024-02-23 17:06:32',1,'MODIFICADO'),(26,4,'','20240222151923.jpg',1,'2024-02-23 17:06:35',1,'RESTAURADO'),(27,4,'','20240223180640.jpg',1,'2024-02-23 17:06:40',1,'MODIFICADO'),(28,3,'','20240223180632.jpg',0,'2024-02-23 17:06:57',1,'ELIMINADO'),(29,3,'','20240223180632.jpg',1,'2024-02-23 17:07:05',1,'RESTAURADO'),(30,2,'','20240223180832.jpg',1,'2024-02-23 17:08:32',1,'MODIFICADO'),(31,1,'','20240223180845.jpg',1,'2024-02-23 17:08:45',1,'MODIFICADO'),(32,3,'','20240223180858.jpg',1,'2024-02-23 17:08:58',1,'MODIFICADO'),(33,4,'','20240223180903.jpg',1,'2024-02-23 17:09:03',1,'MODIFICADO'),(34,1,'','20240223182041.jpg',1,'2024-02-23 17:20:41',1,'MODIFICADO'),(35,1,'','20240223182457.jpg',1,'2024-02-23 17:24:57',1,'MODIFICADO'),(36,2,'','20240223180832.jpg',1,'2024-02-23 17:28:36',1,'MODIFICADO'),(37,2,'','20240223182854.jpg',1,'2024-02-23 17:28:54',1,'MODIFICADO'),(38,1,'','20240223194555.jpg',1,'2024-02-23 18:45:55',1,'MODIFICADO'),(39,2,'','20240223194613.jpg',1,'2024-02-23 18:46:13',1,'MODIFICADO'),(40,3,'','20240223194639.jpg',1,'2024-02-23 18:46:39',1,'MODIFICADO'),(41,4,'','20240223194707.jpg',1,'2024-02-23 18:47:07',1,'MODIFICADO'),(42,3,'','20240223194639.jpg',0,'2024-02-23 18:54:41',1,'ELIMINADO'),(43,3,'','20240223194639.jpg',1,'2024-02-23 18:54:51',1,'RESTAURADO'),(44,1,'','20240223194555.jpg',0,'2024-02-23 18:55:10',1,'ELIMINADO'),(45,2,'','20240223194613.jpg',0,'2024-02-23 18:55:11',1,'ELIMINADO'),(46,3,'','20240223194639.jpg',0,'2024-02-23 18:55:13',1,'ELIMINADO'),(47,4,'','20240223194707.jpg',0,'2024-02-23 18:55:24',1,'ELIMINADO'),(48,1,'','20240223194555.jpg',1,'2024-02-23 18:55:32',1,'RESTAURADO'),(49,2,'','20240223194613.jpg',1,'2024-02-23 18:55:44',1,'RESTAURADO'),(50,3,'','20240223194639.jpg',1,'2024-02-23 18:55:58',1,'RESTAURADO'),(51,4,'','20240223194707.jpg',1,'2024-02-23 18:56:00',1,'RESTAURADO'),(52,1,'','20240223194555.jpg',1,'2024-02-23 18:57:27',1,'MODIFICADO'),(53,1,'','logo.png',1,'2024-02-23 18:57:30',1,'MODIFICADO'),(54,2,'','logo.png',1,'2024-02-23 18:57:45',1,'MODIFICADO'),(55,3,'','logo.png',1,'2024-02-23 18:57:52',1,'MODIFICADO'),(56,4,'','logo.png',1,'2024-02-23 18:58:01',1,'MODIFICADO'),(57,1,'','20240223200541.jpg',1,'2024-02-23 19:05:41',1,'MODIFICADO'),(58,2,'','20240223200835.jpg',1,'2024-02-23 19:08:35',1,'MODIFICADO'),(59,1,'','20240223200859.jpg',1,'2024-02-23 19:08:59',1,'MODIFICADO'),(60,2,'','20240223200907.jpg',1,'2024-02-23 19:09:07',1,'MODIFICADO'),(61,3,'','20240223200916.jpg',1,'2024-02-23 19:09:16',1,'MODIFICADO'),(62,3,'','logo.png',1,'2024-02-23 19:09:19',1,'MODIFICADO'),(63,3,'','20240223200927.jpg',1,'2024-02-23 19:09:27',1,'MODIFICADO'),(64,3,'','20240223200927.jpg',0,'2024-02-23 19:09:52',1,'ELIMINADO'),(65,3,'','20240223200927.jpg',1,'2024-02-23 19:10:08',1,'RESTAURADO'),(66,4,'','20240223201034.jpg',1,'2024-02-23 19:10:34',1,'MODIFICADO'),(67,5,'','20240223222155.jpg',1,'2024-02-23 21:21:55',1,'CREADO'),(68,4,'','20240223201034.jpg',0,'2024-02-24 15:49:13',1,'ELIMINADO'),(69,3,'','20240223200927.jpg',0,'2024-02-24 15:49:20',1,'ELIMINADO'),(70,2,'','20240223200907.jpg',0,'2024-02-24 15:49:32',1,'ELIMINADO'),(71,5,'','20240223222155.jpg',1,'2024-02-24 15:49:41',1,'MODIFICADO'),(72,5,'','20240223222155.jpg',0,'2024-02-24 15:49:43',1,'ELIMINADO'),(73,2,'','20240223200907.jpg',1,'2024-02-24 15:51:00',1,'RESTAURADO'),(74,3,'','20240223200927.jpg',1,'2024-02-24 15:51:09',1,'RESTAURADO'),(75,4,'','20240223201034.jpg',1,'2024-02-24 15:51:22',1,'RESTAURADO'),(76,5,'','20240223222155.jpg',1,'2024-02-24 15:51:49',1,'RESTAURADO'),(77,3,'','20240224165318.jpg',1,'2024-02-24 15:53:18',1,'MODIFICADO'),(78,6,'','20240224165424.jpg',1,'2024-02-24 15:54:24',1,'CREADO'),(79,7,'','20240224165508.jpg',1,'2024-02-24 15:55:08',1,'CREADO'),(80,8,'','20240224165530.jpg',1,'2024-02-24 15:55:30',1,'CREADO'),(81,9,'','20240224170421.jpg',1,'2024-02-24 16:04:21',1,'CREADO'),(82,6,'','20240224165424.jpg',0,'2024-02-24 16:06:48',1,'ELIMINADO'),(83,10,'','20240224170715.jpg',1,'2024-02-24 16:07:15',1,'CREADO'),(84,6,'','20240224165424.jpg',1,'2024-02-24 16:07:31',1,'RESTAURADO'),(85,6,'','20240224165424.jpg',0,'2024-02-24 16:09:19',1,'ELIMINADO'),(86,6,'','20240224165424.jpg',1,'2024-02-24 16:13:21',1,'RESTAURADO'),(87,6,'','20240224165424.jpg',0,'2024-02-24 16:17:43',1,'ELIMINADO'),(88,7,'','20240224165508.jpg',0,'2024-02-24 16:24:46',1,'ELIMINADO'),(89,6,'','20240224165424.jpg',1,'2024-02-24 16:32:23',1,'RESTAURADO'),(90,6,'','20240224165424.jpg',0,'2024-02-26 14:59:30',1,'ELIMINADO'),(91,7,'','20240224165508.jpg',1,'2024-02-26 14:59:33',1,'RESTAURADO'),(92,11,'','20240226214327.jpg',0,'2024-02-26 20:46:24',1,'ELIMINADO'),(93,12,'','20240226214453.jpg',0,'2024-02-26 20:46:27',1,'ELIMINADO'),(94,10,'TOCAR','20240224170715.jpg',1,'2024-02-26 20:53:26',1,'MODIFICADO'),(95,9,'CAPZ','20240224170421.jpg',1,'2024-02-26 20:53:33',1,'MODIFICADO'),(96,8,'RAZON','20240224165530.jpg',1,'2024-02-26 20:53:41',1,'MODIFICADO'),(97,7,'MAQUINA','20240224165508.jpg',1,'2024-02-26 20:53:45',1,'MODIFICADO'),(98,13,'','20240226214739.jpg',0,'2024-02-26 21:03:06',1,'ELIMINADO'),(99,7,'MAQUINA','20240224165508.jpg',1,'2024-02-26 21:05:05',1,'MODIFICADO'),(100,13,'','20240226214739.jpg',1,'2024-02-26 21:13:54',1,'RESTAURADO'),(101,13,'','20240226214739.jpg',1,'2024-02-26 21:14:08',1,'RESTAURADO'),(102,13,'HOLA','20240226221426.jpg',1,'2024-02-26 21:14:26',1,'MODIFICADO'),(103,12,'','20240226214453.jpg',1,'2024-02-26 21:14:45',1,'RESTAURADO'),(104,12,'hola','20240226221500.jpg',1,'2024-02-26 21:15:00',1,'MODIFICADO'),(105,14,'MAQUINA','20240226221549.jpg',1,'2024-02-26 21:15:49',1,'CREADO'),(106,15,'PRUEBA','20240226221557.jpg',1,'2024-02-26 21:15:57',1,'CREADO'),(107,16,'SOPORTE','20240226221605.jpg',1,'2024-02-26 21:16:05',1,'CREADO'),(108,17,'RAZON','20240226221634.jpg',1,'2024-02-26 21:16:34',1,'CREADO'),(109,18,'video1','20240226234333.jpg',1,'2024-02-26 22:43:33',1,'CREADO'),(110,15,'PRUEBAS','20240226221557.jpg',1,'2024-02-26 22:56:47',1,'MODIFICADO'),(111,18,'RRRR','20240226235737.jpg',1,'2024-02-26 22:57:37',1,'MODIFICADO'),(112,15,'PRUEBA','20240226235848.jpg',1,'2024-02-26 22:58:48',1,'MODIFICADO'),(113,15,'PRUEBA','20240226235853.jpg',1,'2024-02-26 22:58:53',1,'MODIFICADO'),(114,15,'PRUEBA','20240226235906.jpg',1,'2024-02-26 22:59:06',1,'MODIFICADO'),(115,14,'¡Siempre contigo...!','20240226221549.jpg',1,'2024-03-18 17:10:32',1,'MODIFICADO'),(116,15,'Monitoreo constante','20240226235906.jpg',1,'2024-03-18 17:13:04',1,'MODIFICADO'),(117,17,'Monitoreo constante','20240226221634.jpg',1,'2024-03-18 17:15:00',1,'MODIFICADO'),(118,16,'Atención en todo momento','20240226221605.jpg',1,'2024-03-18 17:17:10',1,'MODIFICADO'),(119,18,'Líder en la cadena de frío','20240226235737.jpg',1,'2024-03-18 17:24:24',1,'MODIFICADO'),(120,18,'Líder en la Cadena de Frío','20240226235737.jpg',1,'2024-03-18 17:24:39',1,'MODIFICADO'),(121,15,'Medidas de prevención','20240226235906.jpg',1,'2024-03-18 17:26:16',1,'MODIFICADO'),(122,18,'Líder en la Cadena de Frío','20240319165501.jpg',1,'2024-03-19 15:55:01',1,'MODIFICADO'),(123,14,'¡Siempre contigo...!','20240319165654.jpg',1,'2024-03-19 15:56:54',1,'MODIFICADO'),(124,15,'Medidas de prevención','20240319165704.jpg',1,'2024-03-19 15:57:04',1,'MODIFICADO'),(125,16,'Atención en todo momento','logo.png',1,'2024-03-19 15:57:08',1,'MODIFICADO'),(126,16,'Atención en todo momento','20240319165719.jpg',1,'2024-03-19 15:57:19',1,'MODIFICADO'),(127,17,'Monitoreo constante','20240319165729.jpg',1,'2024-03-19 15:57:29',1,'MODIFICADO'),(128,18,'Líder en la Cadena de Frío','20240319165733.jpg',1,'2024-03-19 15:57:33',1,'MODIFICADO'),(129,15,'Medidas de prevención','20240319165822.jpg',1,'2024-03-19 15:58:22',1,'MODIFICADO'),(130,15,'Medidas de prevención','20240319165836.jpg',1,'2024-03-19 15:58:36',1,'MODIFICADO'),(131,17,'Monitoreo constante','20240319165846.jpg',1,'2024-03-19 15:58:46',1,'MODIFICADO'),(132,17,'','20240319165846.jpg',0,'2024-03-25 15:07:03',1,'ELIMINADO'),(133,15,'Control a Distancia','20240319165836.jpg',1,'2024-03-25 15:08:46',1,'MODIFICADO'),(134,15,'Control a distancia','20240319165836.jpg',1,'2024-03-25 15:09:04',1,'MODIFICADO'),(135,14,'Disponible 24/7','20240319165654.jpg',1,'2024-03-25 15:09:31',1,'MODIFICADO'),(136,14,'Disponible 24/7','20240325163051.jpg',1,'2024-03-25 15:30:51',1,'MODIFICADO'),(137,15,'Control a distancia','20240325163102.jpg',1,'2024-03-25 15:31:02',1,'MODIFICADO');
/*!40000 ALTER TABLE `h_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_videos`
--

DROP TABLE IF EXISTS `h_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `videos_id` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `videos` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `user` int(2) DEFAULT 1,
  `evento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_videos`
--

LOCK TABLES `h_videos` WRITE;
/*!40000 ALTER TABLE `h_videos` DISABLE KEYS */;
INSERT INTO `h_videos` VALUES (1,2,'video1','20240222160243.mp4',1,'2024-02-22 15:02:43',1,'CREADO'),(2,3,'video12','20240222165208.mp4',1,'2024-02-22 15:52:08',1,'CREADO'),(3,1,'123','',0,'2024-02-22 15:56:23',1,'ELIMINADO'),(4,2,'video1','',0,'2024-02-22 15:57:35',1,'ELIMINADO'),(5,3,'video12','',0,'2024-02-22 15:57:41',1,'ELIMINADO'),(6,1,'123','',1,'2024-02-22 15:58:10',1,'RESTAURADO'),(7,2,'video1','',1,'2024-02-22 15:58:12',1,'RESTAURADO'),(8,3,'video12','',1,'2024-02-22 15:58:16',1,'RESTAURADO'),(9,1,'123','',0,'2024-02-22 20:00:23',1,'ELIMINADO'),(10,4,'video2','20240222222853.mp4',1,'2024-02-22 21:28:53',1,'CREADO'),(11,2,'video1','',0,'2024-02-22 21:29:12',1,'ELIMINADO'),(12,3,'video12','',0,'2024-02-22 21:29:14',1,'ELIMINADO'),(13,2,'video1','',1,'2024-02-22 22:40:13',1,'RESTAURADO'),(14,4,'video2','',0,'2024-02-23 14:19:51',1,'ELIMINADO'),(15,3,'video12','',1,'2024-02-23 14:19:55',1,'RESTAURADO'),(16,4,'video2','',1,'2024-02-23 14:19:57',1,'RESTAURADO'),(17,5,'video1','20240223170802.mp4',1,'2024-02-23 16:08:02',1,'CREADO'),(18,6,'video3','video.mp4',1,'2024-02-23 16:08:20',1,'CREADO'),(19,4,'video2','',0,'2024-02-23 16:41:23',1,'ELIMINADO'),(20,5,'video1','',0,'2024-02-23 16:41:25',1,'ELIMINADO'),(21,6,'video3','',0,'2024-02-23 16:43:03',1,'ELIMINADO'),(22,5,'video1','',1,'2024-02-23 16:43:11',1,'RESTAURADO'),(23,7,'Video 1','video.mp4',1,'2024-02-23 16:44:11',1,'CREADO'),(24,8,'Video 112','20240223174439.mp4',1,'2024-02-23 16:44:39',1,'CREADO'),(25,9,'video1','20240223174512.mp4',1,'2024-02-23 16:45:12',1,'CREADO'),(26,10,'video1','20240223175144.mp4',1,'2024-02-23 16:51:44',1,'CREADO'),(27,10,'video1','',0,'2024-02-23 19:37:04',1,'ELIMINADO'),(28,10,'video1','',1,'2024-02-23 19:39:59',1,'RESTAURADO'),(29,10,'video1','',0,'2024-02-23 19:57:23',1,'ELIMINADO'),(30,10,'video1','',1,'2024-02-23 19:57:39',1,'RESTAURADO'),(31,11,'video3','20240223210219.mp4',1,'2024-02-23 20:02:19',1,'CREADO'),(32,12,'hola','20240223212557.mp4',1,'2024-02-23 20:25:57',1,'CREADO'),(33,13,'rr','20240223213647.mp4',1,'2024-02-23 20:36:47',1,'CREADO'),(34,13,'rr','',0,'2024-02-23 20:48:34',1,'ELIMINADO'),(35,12,'hola','',0,'2024-02-23 20:55:05',1,'ELIMINADO'),(36,12,'hola','',1,'2024-02-23 20:55:27',1,'RESTAURADO'),(37,12,'hola','',0,'2024-02-24 13:20:29',1,'ELIMINADO'),(38,12,'hola','',1,'2024-02-24 13:38:30',1,'RESTAURADO'),(39,12,'hola','',0,'2024-02-24 13:43:04',1,'ELIMINADO'),(40,12,'hola','',1,'2024-02-24 14:02:40',1,'RESTAURADO'),(41,13,'rr','',1,'2024-02-24 15:09:51',1,'RESTAURADO'),(42,13,'rr','',0,'2024-02-24 15:12:43',1,'ELIMINADO'),(43,12,'hola','',0,'2024-02-24 15:12:45',1,'ELIMINADO'),(44,11,'video3','',0,'2024-02-24 15:12:47',1,'ELIMINADO'),(45,11,'video3','',1,'2024-02-24 15:12:53',1,'RESTAURADO'),(46,12,'hola','',1,'2024-02-24 15:13:01',1,'RESTAURADO'),(47,12,'hola','',0,'2024-02-24 16:34:17',1,'ELIMINADO'),(48,12,'hola','',1,'2024-02-26 20:17:18',1,'RESTAURADO'),(49,13,'rr','',1,'2024-02-26 20:17:20',1,'RESTAURADO'),(50,14,'video13','20240223175144.mp4',1,'2024-02-28 18:52:49',1,'CREADO'),(51,15,'Video1','20240228195416.mp4',1,'2024-02-28 18:54:16',1,'CREADO'),(52,16,'Video12','20240228195947.mp4',1,'2024-02-28 18:59:47',1,'CREADO'),(53,17,'Video1','20240228200310.mp4',1,'2024-02-28 19:03:10',1,'CREADO'),(54,16,NULL,'20240228195947.mp4',0,'2024-02-28 19:16:52',1,'ELIMINADO'),(55,16,NULL,'20240228195947.mp4',1,'2024-02-28 19:16:54',1,'RESTAURADO'),(56,16,NULL,'20240228201853.mp4',1,'2024-02-28 19:18:53',1,'MODIFICADO'),(57,17,NULL,'20240228203808.mp4',1,'2024-02-28 19:38:09',1,'MODIFICADO');
/*!40000 ALTER TABLE `h_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion`
--

DROP TABLE IF EXISTS `informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion`
--

LOCK TABLES `informacion` WRITE;
/*!40000 ALTER TABLE `informacion` DISABLE KEYS */;
INSERT INTO `informacion` VALUES (1,'ZTRACK','Somos una solución tecnológica integral para el monitoreo y control a distancia de contenedores refrigerados ,maduradores móviles ,generadores y túneles de frío . Ten la información detallada y en vivo de tu equipo a solo un clic de distancia ; cambia parámetros y controla el comportamiento de tu equipo desde cualquier parte del mundo .',1,'2024-02-20 20:00:31','2024-03-20 02:52:11',1,1);
/*!40000 ALTER TABLE `informacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modal`
--

DROP TABLE IF EXISTS `modal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `subtitulo` varchar(50) NOT NULL,
  `descripcion` varchar(350) NOT NULL,
  `foto` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modal`
--

LOCK TABLES `modal` WRITE;
/*!40000 ALTER TABLE `modal` DISABLE KEYS */;
INSERT INTO `modal` VALUES (1,'APROVECHA ESTA GRAN OFERTAS','50 %','Por tu primera Compra, para mayor Información , dirigirse a contacto, llenar sus datos y nos estaremos comunicando con usted lo mas antes posible','20240228220036.jpg',1,'2024-02-28 15:43:07','2024-02-29 03:33:17',1,1);
/*!40000 ALTER TABLE `modal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nabvar`
--

DROP TABLE IF EXISTS `nabvar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nabvar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nabvar`
--

LOCK TABLES `nabvar` WRITE;
/*!40000 ALTER TABLE `nabvar` DISABLE KEYS */;
INSERT INTO `nabvar` VALUES (1,'Inicio',1,'2024-02-21 22:43:33','2024-02-26 19:32:48',1,1),(2,'Beneficios',1,'2024-02-21 22:44:36','2024-02-28 21:58:54',1,1),(3,'Caracteristicas',1,'2024-02-21 22:44:40','2024-02-24 22:29:36',1,1),(4,'Videos',1,'2024-02-21 22:47:54','2024-03-19 22:01:39',1,1),(5,'Contactenos',1,'2024-02-22 14:18:21','2024-02-24 22:29:40',1,1);
/*!40000 ALTER TABLE `nabvar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (4,'Usuarios',4),(5,'Configuracion',5),(11,'Historial',11),(13,'Respuesta',13),(14,'Formulario',14),(15,'Informacion',15);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(150) DEFAULT NULL,
  `respuesta` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'¿Qué es la telemetría ztrack de zgroup?','La telemetría ztrack es un sistema que utiliza tecnología remota para monitorear y controlar contenedores refrigerados. Proporciona información en tiempo real sobre la temperatura, humedad, ubicación y otros parámetros clave para garantizar la integridad de la carga.',1,'2024-02-21 16:52:54','2024-02-22 20:29:46',1,1),(2,'¿Cómo funciona nuestro sistema de telemetría ztrack?','Nuestro sistema de telemetría utiliza sensores instalados en los contenedores refrigerados que recopilan datos. Estos datos se transmiten de forma inalámbrica a nuestra plataforma en la nube, donde se procesan y analizan para brindar información en tiempo real a los usuarios.',1,'2024-02-21 17:04:33','2024-02-24 22:34:38',1,1),(3,'¿Cuáles son las ventajas de utilizar ztrack en nuestros dispositivos ?','La telemetría permite un monitoreo constante de las condiciones del contenedor, lo que garantiza la calidad de la carga, reduce el riesgo de pérdidas y optimiza la eficiencia operativa al proporcionar datos precisos para la toma de decisiones.',1,'2024-02-21 17:05:16','2024-02-24 22:34:58',1,1),(4,'¿Qué tipo de información puedo monitorear y controlar a través de vuestro servicio de telemetría?','Nuestro servicio permite monitorear la temperatura, humedad, ubicación, consumo de energía, entre otros parámetros relevantes para el buen funcionamiento de su equipo.',1,'2024-02-21 17:05:29','2024-02-24 22:35:15',1,1),(5,'¿Cuál es la precisión de los datos proporcionados por ztrack?','Nuestro sistema se caracteriza por su alta precisión en la recopilación y presentación de datos, con sensores calibrados y tecnología avanzada que garantizan mediciones confiables.',0,'2024-02-21 17:09:44','2024-02-23 02:33:10',1,1),(6,'¿Cómo se asegura la seguridad de los datos transmitidos por ztrack?','Implementamos protocolos de seguridad robustos, como encriptación de datos y medidas de autenticación, para garantizar la protección de la información transmitida a través de nuestra plataforma.',0,'2024-02-21 17:10:52','2024-02-23 02:33:09',1,1),(7,'¿Es compatible el sistema con diferentes marcas o modelos de contenedores?','Sí, nuestro sistema de telemetría está diseñado para ser compatible con una amplia gama de equipos , independientemente de la marca o el modelo.',0,'2024-02-22 14:33:27','2024-02-23 02:33:07',1,1),(8,'¿Qué tipo de alertas o notificaciones ofrece el servicio ztrack en caso de anomalías?','Ofrecemos alertas personalizables que notifican sobre desviaciones de temperatura, cambios bruscos en la humedad, entre otras anomalías, permitiendo una acción inmediata para mitigar riesgos.',1,'2024-02-22 14:33:36','2024-02-26 22:34:29',1,1),(9,'¿Puedo acceder a los datos de telemetría en tiempo real?','Sí, nuestra plataforma proporciona acceso en tiempo real a los datos recopilados, permitiendo a los usuarios monitorear las condiciones del contenedor en cualquier momento y desde cualquier ubicación.',0,'2024-02-22 14:33:45','2024-02-23 02:33:03',1,1),(10,'¿El servicio ztrack esta incluido con mi equipo ZGROUP ?','Ztrack es un servicio premiun , y requiere un costo de suscripcion adicional para acceder a todos sus beneficos , consulte con nuestro asesores un plan adecuado para su empresa.',0,'2024-02-22 14:33:54','2024-02-23 02:33:01',1,1),(11,'hola','prueba',0,'2024-02-22 19:48:48','2024-02-23 01:49:04',1,1);
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_receta` varchar(50) DEFAULT NULL,
  `nombre_receta` varchar(50) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,'100','luminarias2','Instalacion de luminarias',1,'2024-01-17 19:41:02','2024-01-17 21:47:50',1,3),(2,'200','CHELA132','se acabo',1,'2024-01-17 21:56:39','2024-01-18 03:34:44',3,1),(3,'300','vanesa','jaja',1,'2024-01-17 22:04:24','2024-01-17 22:04:24',3,3),(4,'400','luis5','ok',1,'2024-01-17 22:05:22','2024-01-18 02:44:11',3,3),(5,'220','CHELA','EE',1,'2024-01-18 00:44:30','2024-01-18 02:47:11',1,1),(6,'','CHELA1','A',1,'2024-01-18 02:43:33','2024-01-18 02:44:20',3,3),(7,'','CHEL','',1,'2024-01-18 02:46:59','2024-01-18 02:47:09',1,1);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_formulario`
--

DROP TABLE IF EXISTS `respuesta_formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta_formulario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formulario_id` int(11) NOT NULL,
  `email_comercial` varchar(250) NOT NULL,
  `asunto_respuesta` varchar(150) NOT NULL,
  `mensaje_respuesta` text NOT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_formulario`
--

LOCK TABLES `respuesta_formulario` WRITE;
/*!40000 ALTER TABLE `respuesta_formulario` DISABLE KEYS */;
INSERT INTO `respuesta_formulario` VALUES (145,8,'zgroupsistemas@gmail.com','COTIZACION DE LO SOLICITADO','se estará devolviendo la llamada al numero brindado',1,'2024-02-20 18:46:05','2024-02-20 18:46:05',1,1),(146,9,'zgroupsistemas@gmail.com','COTIZACION DE LO SOLICITADO','kasdasdaaskdjsakdad',1,'2024-02-20 18:49:44','2024-02-20 18:49:44',6,6),(147,8,'zgroupsistemas@gmail.com','123','132',1,'2024-02-21 17:03:48','2024-02-21 17:03:48',1,1),(148,10,'zgroupsistemas@gmail.com','COTIZACION','DFSDFDSFSDF',1,'2024-02-24 16:31:34','2024-02-24 16:31:34',6,6);
/*!40000 ALTER TABLE `respuesta_formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `foto` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (14,'Disponible 24/7','20240325163051.jpg',1,'2024-02-26 21:15:49','2024-03-25 21:30:51',1,1),(15,'Control a distancia','20240325163102.jpg',1,'2024-02-26 21:15:57','2024-03-25 21:31:02',1,1),(16,'Atención en todo momento','20240319165719.jpg',1,'2024-02-26 21:16:05','2024-03-19 21:57:19',1,1),(17,'Monitoreo constante','20240319165846.jpg',0,'2024-02-26 21:16:34','2024-03-25 21:07:03',1,1),(18,'Líder en la Cadena de Frío','20240319165733.jpg',1,'2024-02-26 22:43:33','2024-03-19 21:57:33',1,1);
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `correo_usuario` varchar(250) NOT NULL,
  `clave_correo` varchar(250) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','','','admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',1),(2,'angel','','','terribe','519ba91a5a5b4afb9dc66f8805ce8c442b6576316c19c6896af2fa9bda6aff71',1),(3,'luis','','','Luis Marcelo','8f80f8ab8a1363201fe5592b61ef5fcdb308ab274b23fcdc2fa84323ebf32f0d',1),(4,'jose','','','joseluis','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),(5,'rodrigo','','','rodrigo','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),(6,'123','','','123','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `videos` varchar(350) NOT NULL,
  `estado` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `user_c` int(2) DEFAULT 1,
  `user_m` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (16,'Video12','20240228201853.mp4',1,'2024-02-28 18:59:47','2024-02-29 01:18:53',1,1),(17,'Video1','20240228203808.mp4',1,'2024-02-28 19:03:10','2024-02-29 01:38:09',1,1);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-25 10:53:18

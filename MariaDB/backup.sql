-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: retopicamysql
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `fecha` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'parisian.precious@example.org','Erik','Stamm','2014-10-20','2023-10-01 21:59:55','2023-10-01 21:59:55'),(2,'koch.zander@example.com','Cassidy','Auer','1976-08-11','2023-10-01 21:59:55','2023-10-01 21:59:55'),(3,'qnolan@example.net','Erich','Towne','1988-04-24','2023-10-01 21:59:55','2023-10-01 21:59:55'),(4,'zgislason@example.org','Waldo','Murphy','2008-05-25','2023-10-01 21:59:56','2023-10-01 21:59:56'),(5,'jett53@example.com','Tyrell','Brekke','1984-08-04','2023-10-01 21:59:56','2023-10-01 21:59:56'),(6,'ecasper@example.com','Lewis','Schmeler','1974-08-29','2023-10-01 21:59:56','2023-10-01 21:59:56'),(7,'cole.luettgen@example.net','Constantin','Dibbert','1974-12-28','2023-10-01 21:59:56','2023-10-01 21:59:56'),(8,'hgoldner@example.org','Jordy','Hyatt','1992-09-25','2023-10-01 21:59:56','2023-10-01 21:59:56'),(9,'huels.roy@example.net','Porter','Nitzsche','2002-04-16','2023-10-01 21:59:56','2023-10-01 21:59:56'),(10,'verner04@example.org','Candace','Huel','2003-10-10','2023-10-01 21:59:56','2023-10-01 21:59:56'),(11,'cronin.ara@example.net','Tiara','Jakubowski','1979-08-31','2023-10-01 21:59:56','2023-10-01 21:59:56'),(12,'lee20@example.org','Brandon','Fadel','1972-04-23','2023-10-01 21:59:56','2023-10-01 21:59:56'),(13,'karson28@example.com','Kacie','Braun','1988-04-29','2023-10-01 21:59:56','2023-10-01 21:59:56'),(14,'harley.legros@example.com','Elissa','Tremblay','1989-06-07','2023-10-01 21:59:56','2023-10-01 21:59:56'),(15,'karli10@example.net','Saul','Wisozk','2016-01-29','2023-10-01 21:59:56','2023-10-01 21:59:56'),(16,'zelda27@example.com','Phoebe','Shields','1997-08-29','2023-10-01 21:59:56','2023-10-01 21:59:56'),(17,'ruby.goyette@example.com','Evelyn','Kling','1979-07-24','2023-10-01 21:59:56','2023-10-01 21:59:56'),(18,'jkoepp@example.org','Mia','Maggio','1985-08-05','2023-10-01 21:59:56','2023-10-01 21:59:56'),(19,'cristal.gottlieb@example.com','Lily','Harvey','1970-09-25','2023-10-01 21:59:56','2023-10-01 21:59:56'),(20,'byost@example.org','Randal','Hirthe','1982-08-30','2023-10-01 21:59:56','2023-10-01 21:59:56'),(21,'chill@example.org','Beth','Lebsack','2010-02-17','2023-10-01 21:59:56','2023-10-01 21:59:56'),(22,'stuart.legros@example.com','Madge','Kunde','2017-05-02','2023-10-01 21:59:56','2023-10-01 21:59:56'),(23,'isabell.nolan@example.org','May','Huels','1976-12-17','2023-10-01 21:59:56','2023-10-01 21:59:56'),(24,'qcormier@example.com','Gerry','Orn','1980-01-08','2023-10-01 21:59:56','2023-10-01 21:59:56'),(25,'otho.schmidt@example.net','Trycia','Marvin','2006-07-10','2023-10-01 21:59:56','2023-10-01 21:59:56'),(26,'misty65@example.net','Demetris','Frami','2009-02-26','2023-10-01 21:59:56','2023-10-01 21:59:56'),(27,'gavin.lang@example.net','Kayla','Lemke','1977-07-31','2023-10-01 21:59:56','2023-10-01 21:59:56'),(28,'merl99@example.org','Baby','Oberbrunner','1987-07-18','2023-10-01 21:59:56','2023-10-01 21:59:56'),(29,'gaylord.jarrell@example.net','Waylon','Jerde','1990-09-30','2023-10-01 21:59:56','2023-10-01 21:59:56'),(30,'akunze@example.net','Mike','Koepp','2005-04-22','2023-10-01 21:59:56','2023-10-01 21:59:56'),(31,'russel.rowe@example.org','Thomas','Schumm','1991-07-06','2023-10-01 21:59:56','2023-10-01 21:59:56'),(32,'bcorwin@example.org','Jaclyn','Nitzsche','1976-06-16','2023-10-01 21:59:56','2023-10-01 21:59:56'),(33,'alvah.wunsch@example.com','Leonora','Kuhlman','2011-11-19','2023-10-01 21:59:56','2023-10-01 21:59:56'),(34,'johnnie.conn@example.com','Wilhelmine','Lockman','2013-07-30','2023-10-01 21:59:56','2023-10-01 21:59:56'),(35,'reynold.heidenreich@example.net','Pedro','Collins','1983-08-28','2023-10-01 21:59:56','2023-10-01 21:59:56'),(36,'fquigley@example.net','Reagan','Beier','1997-05-26','2023-10-01 21:59:56','2023-10-01 21:59:56'),(37,'sedrick60@example.com','Harvey','Hammes','1992-04-21','2023-10-01 21:59:56','2023-10-01 21:59:56'),(38,'ernest.aufderhar@example.com','Alex','Mraz','2014-05-15','2023-10-01 21:59:56','2023-10-01 21:59:56'),(39,'metz.newell@example.org','Talia','Strosin','1971-07-29','2023-10-01 21:59:56','2023-10-01 21:59:56'),(40,'jaren46@example.net','Gabe','Stark','2004-09-15','2023-10-01 21:59:56','2023-10-01 21:59:56'),(41,'ischneider@example.org','Ebony','Schoen','1978-12-03','2023-10-01 21:59:56','2023-10-01 21:59:56'),(42,'labadie.cullen@example.net','Leslie','Aufderhar','2007-10-24','2023-10-01 21:59:56','2023-10-01 21:59:56'),(43,'kuhlman.xander@example.com','Brandy','Lang','1973-07-01','2023-10-01 21:59:56','2023-10-01 21:59:56'),(44,'creola.mraz@example.com','Devyn','Marquardt','1983-05-12','2023-10-01 21:59:56','2023-10-01 21:59:56'),(45,'schmitt.kaleb@example.net','Emely','Ruecker','1993-04-10','2023-10-01 21:59:56','2023-10-01 21:59:56'),(46,'quitzon.tristian@example.org','Diego','Abbott','1983-03-27','2023-10-01 21:59:56','2023-10-01 21:59:56'),(47,'kamron.schoen@example.org','Estella','Herzog','2019-02-15','2023-10-01 21:59:56','2023-10-01 21:59:56'),(48,'ray.ritchie@example.com','Saige','Gusikowski','1980-06-05','2023-10-01 21:59:56','2023-10-01 21:59:56'),(49,'larkin.davon@example.com','Melvin','Kilback','2018-05-16','2023-10-01 21:59:56','2023-10-01 21:59:56'),(50,'ena34@example.com','Carlee','Hansen','1975-04-07','2023-10-01 21:59:56','2023-10-01 21:59:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-01 12:08:21

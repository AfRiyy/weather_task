-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: weather
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_04_22_175514_create_permissions_table',1),(6,'2022_04_22_180505_create_userpermissions_table',1),(7,'2022_04_22_184047_create_posts_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'set_permission'),(2,'create_post'),(3,'update_post'),(4,'delete_post');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (7,1,'{\"coord\":{\"lon\":19.0402,\"lat\":47.4979},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"base\":\"stations\",\"main\":{\"temp\":291.6,\"feels_like\":290.78,\"temp_min\":290.32,\"temp_max\":292.38,\"pressure\":1020,\"humidity\":49},\"visibility\":10000,\"wind\":{\"speed\":1.03,\"deg\":0},\"clouds\":{\"all\":75},\"dt\":1651391674,\"sys\":{\"type\":2,\"id\":2009661,\"country\":\"HU\",\"sunrise\":1651375637,\"sunset\":1651427666},\"timezone\":7200,\"id\":3054643,\"name\":\"Budapest\",\"cod\":200}','2022-05-01 05:54:35','2022-05-01 05:54:35'),(13,2,'{\"coord\":{\"lon\":19.0402,\"lat\":47.4979},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"tiszta égbolt\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":295.69,\"feels_like\":294.89,\"temp_min\":293.32,\"temp_max\":295.71,\"pressure\":1018,\"humidity\":34},\"visibility\":10000,\"wind\":{\"speed\":3.6,\"deg\":100},\"clouds\":{\"all\":0},\"dt\":1651402773,\"sys\":{\"type\":2,\"id\":2009566,\"country\":\"HU\",\"sunrise\":1651375637,\"sunset\":1651427666},\"timezone\":7200,\"id\":3054643,\"name\":\"Budapest\",\"cod\":200}','2022-05-01 08:59:34','2022-05-01 08:59:34'),(14,2,'{\"coord\":{\"lon\":18.7364,\"lat\":47.721},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"erős felhőzet\",\"icon\":\"04d\"}],\"base\":\"stations\",\"main\":{\"temp\":294.62,\"feels_like\":293.95,\"temp_min\":293.74,\"temp_max\":295.64,\"pressure\":1019,\"humidity\":43,\"sea_level\":1019,\"grnd_level\":1003},\"visibility\":10000,\"wind\":{\"speed\":2.48,\"deg\":127,\"gust\":2.9},\"clouds\":{\"all\":75},\"dt\":1651402845,\"sys\":{\"type\":2,\"id\":18978,\"country\":\"HU\",\"sunrise\":1651375675,\"sunset\":1651427774},\"timezone\":7200,\"id\":3053562,\"name\":\"Dorog\",\"cod\":200}','2022-05-01 09:00:46','2022-05-01 09:00:46'),(15,2,'{\"coord\":{\"lon\":19.0402,\"lat\":47.4979},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":294.75,\"feels_like\":293.83,\"temp_min\":293.32,\"temp_max\":294.95,\"pressure\":1018,\"humidity\":33},\"visibility\":10000,\"wind\":{\"speed\":2.57,\"deg\":100},\"clouds\":{\"all\":0},\"dt\":1651408022,\"sys\":{\"type\":2,\"id\":2009661,\"country\":\"HU\",\"sunrise\":1651375637,\"sunset\":1651427666},\"timezone\":7200,\"id\":3054643,\"name\":\"Budapest\",\"cod\":200}','2022-05-01 10:27:03','2022-05-01 10:27:03'),(16,1,'{\"coord\":{\"lon\":19.0402,\"lat\":47.4979},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":294.95,\"feels_like\":294.07,\"temp_min\":293.32,\"temp_max\":295.29,\"pressure\":1017,\"humidity\":34},\"visibility\":10000,\"wind\":{\"speed\":3.6,\"deg\":110},\"clouds\":{\"all\":0},\"dt\":1651413496,\"sys\":{\"type\":2,\"id\":2009661,\"country\":\"HU\",\"sunrise\":1651375637,\"sunset\":1651427666},\"timezone\":7200,\"id\":3054643,\"name\":\"Budapest\",\"cod\":200}','2022-05-01 11:58:17','2022-05-01 11:58:17'),(17,1,'{\"coord\":{\"lon\":19.0402,\"lat\":47.4979},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":294.74,\"feels_like\":293.87,\"temp_min\":294.32,\"temp_max\":294.74,\"pressure\":1017,\"humidity\":35},\"visibility\":10000,\"wind\":{\"speed\":3.6,\"deg\":110},\"clouds\":{\"all\":0},\"dt\":1651419017,\"sys\":{\"type\":2,\"id\":2009661,\"country\":\"HU\",\"sunrise\":1651375637,\"sunset\":1651427666},\"timezone\":7200,\"id\":3054643,\"name\":\"Budapest\",\"cod\":200}','2022-05-01 13:30:18','2022-05-01 13:30:18'),(18,1,'{\"coord\":{\"lon\":19.0402,\"lat\":47.4979},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":292.51,\"feels_like\":291.52,\"temp_min\":292.32,\"temp_max\":292.51,\"pressure\":1016,\"humidity\":39},\"visibility\":10000,\"wind\":{\"speed\":3.09,\"deg\":120},\"clouds\":{\"all\":0},\"dt\":1651423674,\"sys\":{\"type\":2,\"id\":2009661,\"country\":\"HU\",\"sunrise\":1651375637,\"sunset\":1651427666},\"timezone\":7200,\"id\":3054643,\"name\":\"Budapest\",\"cod\":200}','2022-05-01 14:49:12','2022-05-01 14:49:12'),(19,1,'{\"coord\":{\"lon\":19.0402,\"lat\":47.4979},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"base\":\"stations\",\"main\":{\"temp\":289.07,\"feels_like\":288,\"temp_min\":287.51,\"temp_max\":291.32,\"pressure\":1016,\"humidity\":49},\"visibility\":10000,\"wind\":{\"speed\":1.54,\"deg\":50},\"clouds\":{\"all\":0},\"dt\":1651428872,\"sys\":{\"type\":2,\"id\":2009661,\"country\":\"HU\",\"sunrise\":1651375637,\"sunset\":1651427666},\"timezone\":7200,\"id\":3054643,\"name\":\"Budapest\",\"cod\":200}','2022-05-01 15:14:04','2022-05-01 16:17:31'),(20,1,'{\"coord\":{\"lon\":19.0402,\"lat\":47.4979},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"base\":\"stations\",\"main\":{\"temp\":289.07,\"feels_like\":288,\"temp_min\":287.51,\"temp_max\":291.32,\"pressure\":1016,\"humidity\":49},\"visibility\":10000,\"wind\":{\"speed\":1.54,\"deg\":50},\"clouds\":{\"all\":0},\"dt\":1651428960,\"sys\":{\"type\":2,\"id\":2009661,\"country\":\"HU\",\"sunrise\":1651375637,\"sunset\":1651427666},\"timezone\":7200,\"id\":3054643,\"name\":\"Budapest\",\"cod\":200}','2022-05-01 16:17:41','2022-05-01 16:17:41');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `user_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
INSERT INTO `userpermissions` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4);
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@example.lan',NULL,'$2y$10$jc4YVFyFdvRqlSP/rlAbFOdEXl.Y1RzXGo9D9Im58VWsdMZXPN7Bm','UcNyyaC7SHkeVjw2fj9Ku03svd9JR0obyjnj40jNv9O1ZoWFRnNcX0oofrYS','2022-04-26 07:33:51','2022-04-26 07:33:51'),(2,'admin2','admin2@example.lan',NULL,'$2y$10$eRZs/sENH1aFciKac5oa7.Tiej.sX3L1.rPb6KY93GeChWRp83SMu',NULL,'2022-05-01 08:41:07','2022-05-01 08:41:07');
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

-- Dump completed on 2022-05-01 20:35:24

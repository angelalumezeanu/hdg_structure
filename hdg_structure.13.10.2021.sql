-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: hdg
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.2

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elinkages`
--

DROP TABLE IF EXISTS `elinkages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elinkages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_id` bigint(20) DEFAULT NULL,
  `sentity_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sentity` (`entity_id`),
  CONSTRAINT `fk_entity` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`id`),
  CONSTRAINT `fk_sentity` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name1` varchar(255) DEFAULT NULL,
  `name2` varchar(255) DEFAULT NULL,
  `name3` varchar(255) DEFAULT NULL,
  `name4` varchar(255) DEFAULT NULL,
  `entity_type_id` bigint(20) DEFAULT NULL,
  `remark` text,
  `author` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_entities_on_entity_type_id` (`entity_type_id`),
  CONSTRAINT `fk_rails_f8a44fe9bf` FOREIGN KEY (`entity_type_id`) REFERENCES `entity_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6970 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_types`
--

DROP TABLE IF EXISTS `entity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `remark` text,
  `author` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `remark` text,
  `author` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mattributes`
--

DROP TABLE IF EXISTS `mattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mattributes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_original` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `remark` text,
  `author` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mrelations`
--

DROP TABLE IF EXISTS `mrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mrelations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_id` bigint(20) DEFAULT NULL,
  `sentity_id` bigint(20) DEFAULT NULL,
  `mattribute_id` bigint(20) DEFAULT NULL,
  `mvalue_id` bigint(20) DEFAULT NULL,
  `obs_start_year` int(11) DEFAULT NULL,
  `obs_start_month` int(11) DEFAULT NULL,
  `obs_start_day` int(11) DEFAULT NULL,
  `obs_end_year` int(11) DEFAULT NULL,
  `obs_end_month` int(11) DEFAULT NULL,
  `obs_end_day` int(11) DEFAULT NULL,
  `julian` tinyint(1) DEFAULT NULL,
  `source_id` bigint(20) DEFAULT NULL,
  `source_page` varchar(255) DEFAULT NULL,
  `remark` text,
  `author` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mrelations_on_mattribute_id` (`mattribute_id`),
  KEY `index_mrelations_on_mvalue_id` (`mvalue_id`),
  KEY `index_mrelations_on_source_id` (`source_id`),
  KEY `fk_entity_id` (`entity_id`),
  KEY `fk_sentity_id` (`sentity_id`),
  CONSTRAINT `fk_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`id`),
  CONSTRAINT `fk_rails_8cdb5fc80c` FOREIGN KEY (`mattribute_id`) REFERENCES `mattributes` (`id`),
  CONSTRAINT `fk_rails_e1519b454d` FOREIGN KEY (`mvalue_id`) REFERENCES `mvalues` (`id`),
  CONSTRAINT `fk_rails_f116a0762e` FOREIGN KEY (`source_id`) REFERENCES `sources` (`id`),
  CONSTRAINT `fk_sentity_id` FOREIGN KEY (`sentity_id`) REFERENCES `entities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9927 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mvalues`
--

DROP TABLE IF EXISTS `mvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mvalues` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `original` varchar(255) DEFAULT NULL,
  `name_standard` varchar(255) DEFAULT NULL,
  `name_en` varchar(256) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `remark` text,
  `author` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `short_ref` varchar(255) DEFAULT NULL,
  `vol_author` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `volume_title` varchar(255) DEFAULT NULL,
  `volume_editors` varchar(255) DEFAULT NULL,
  `journal_id` bigint(20) DEFAULT NULL,
  `journal_volume` varchar(255) DEFAULT NULL,
  `journal_no` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `archive` varchar(255) DEFAULT NULL,
  `ext_link` varchar(255) DEFAULT NULL,
  `remark` text,
  `author` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sources_on_journal_id` (`journal_id`),
  CONSTRAINT `fk_rails_1a6b5a2bf0` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `role` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13 17:17:55

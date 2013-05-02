CREATE DATABASE  IF NOT EXISTS `agency` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `agency`;
-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: agency
-- ------------------------------------------------------
-- Server version	5.1.66-0ubuntu0.11.10.3

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
-- Table structure for table `employee_evaluations`
--

DROP TABLE IF EXISTS `employee_evaluations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_evaluations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `mark` float NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_evaluations_1` (`question_id`),
  KEY `fk_employee_evaluations_2` (`employee_id`),
  CONSTRAINT `fk_employee_evaluations_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_evaluations_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_evaluations`
--

LOCK TABLES `employee_evaluations` WRITE;
/*!40000 ALTER TABLE `employee_evaluations` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_evaluations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_type_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `order_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activities_1` (`entity_id`),
  KEY `fk_activities_2` (`activity_type_id`),
  KEY `fk_activities_3` (`employee_id`),
  CONSTRAINT `fk_activities_1` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_activities_2` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_activities_3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,1,1,101,'2012-01-01 00:00:00');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT 'noname',
  `type` varchar(10) NOT NULL,
  `measure_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tests_1` (`id`),
  CONSTRAINT `fk_tests_1` FOREIGN KEY (`id`) REFERENCES `measures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'test_1','type_1',1),(2,'test_2','type_2',2),(3,'test_3','type_3',3),(4,'test_4','type_4',4),(5,'test_5','type_5',5);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_prices`
--

DROP TABLE IF EXISTS `entity_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_prices` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`,`created`),
  KEY `fk_entity_prices_1` (`id`),
  CONSTRAINT `fk_entity_prices_1` FOREIGN KEY (`id`) REFERENCES `entities` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_prices`
--

LOCK TABLES `entity_prices` WRITE;
/*!40000 ALTER TABLE `entity_prices` DISABLE KEYS */;
INSERT INTO `entity_prices` VALUES (1,'2012-02-01 00:00:00',1000),(1,'2012-02-02 00:00:00',900),(1,'2013-02-01 00:00:00',1100),(1,'2013-05-02 20:38:14',1200),(2,'2012-02-01 00:00:00',1000),(2,'2013-01-01 00:00:00',1010),(2,'2013-05-02 22:20:54',1011),(7,'2013-05-02 18:04:56',100),(8,'2013-05-02 18:08:36',110),(11,'2013-05-02 18:16:19',2400),(12,'2013-05-02 18:20:10',2000),(13,'2013-05-02 18:21:29',20001),(14,'2013-05-02 18:24:43',1100),(15,'2013-05-02 18:25:21',1111),(16,'2013-05-02 18:25:31',1111),(18,'2013-05-02 21:44:46',1);
/*!40000 ALTER TABLE `entity_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measures`
--

DROP TABLE IF EXISTS `measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `measure_type_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_measures_1` (`measure_type_id`),
  CONSTRAINT `fk_measures_1` FOREIGN KEY (`measure_type_id`) REFERENCES `measure_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measures`
--

LOCK TABLES `measures` WRITE;
/*!40000 ALTER TABLE `measures` DISABLE KEYS */;
INSERT INTO `measures` VALUES (1,2,'sociability'),(2,2,'intelligence'),(3,1,'earnings'),(4,2,'activity'),(5,2,'humor sense');
/*!40000 ALTER TABLE `measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_results`
--

DROP TABLE IF EXISTS `test_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_results` (
  `test_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `result` float NOT NULL DEFAULT '0',
  `passed` date NOT NULL,
  PRIMARY KEY (`test_id`,`employee_id`,`passed`),
  KEY `fk_test_results_1` (`employee_id`),
  KEY `fk_test_results_2` (`test_id`),
  CONSTRAINT `fk_test_results_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_results_2` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_results`
--

LOCK TABLES `test_results` WRITE;
/*!40000 ALTER TABLE `test_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(1000) NOT NULL,
  `measure_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_questions_1` (`measure_id`),
  CONSTRAINT `fk_questions_1` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'question',1),(2,'question',2),(3,'question',3),(4,'question',4),(5,'question',5);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `norms`
--

DROP TABLE IF EXISTS `norms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `norms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_type_id` int(11) NOT NULL,
  `changed` date NOT NULL,
  `month_norm` float NOT NULL,
  PRIMARY KEY (`id`,`activity_type_id`),
  KEY `fk_norms_1` (`activity_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `norms`
--

LOCK TABLES `norms` WRITE;
/*!40000 ALTER TABLE `norms` DISABLE KEYS */;
INSERT INTO `norms` VALUES (1,1,'0000-00-00',20000),(2,2,'0000-00-00',20000);
/*!40000 ALTER TABLE `norms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_types`
--

DROP TABLE IF EXISTS `measure_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_types`
--

LOCK TABLES `measure_types` WRITE;
/*!40000 ALTER TABLE `measure_types` DISABLE KEYS */;
INSERT INTO `measure_types` VALUES (1,'quantitative'),(2,'qualitative');
/*!40000 ALTER TABLE `measure_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_class`
--

DROP TABLE IF EXISTS `entity_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `min_val` float NOT NULL DEFAULT '0',
  `max_val` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_class`
--

LOCK TABLES `entity_class` WRITE;
/*!40000 ALTER TABLE `entity_class` DISABLE KEYS */;
INSERT INTO `entity_class` VALUES (1,'low',900,1000),(2,'medium',1100,2000),(3,'high',2100,3000),(4,'VIP',3100,-1);
/*!40000 ALTER TABLE `entity_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_importances`
--

DROP TABLE IF EXISTS `measure_importances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_importances` (
  `measure_1_id` int(11) NOT NULL,
  `measure_2_id` int(11) NOT NULL,
  `importance` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`measure_1_id`,`measure_2_id`),
  KEY `fk_measure_importances_1` (`measure_1_id`),
  KEY `fk_measure_importances_2` (`measure_2_id`),
  CONSTRAINT `fk_measure_importances_1` FOREIGN KEY (`measure_1_id`) REFERENCES `measures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_measure_importances_2` FOREIGN KEY (`measure_2_id`) REFERENCES `measures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_importances`
--

LOCK TABLES `measure_importances` WRITE;
/*!40000 ALTER TABLE `measure_importances` DISABLE KEYS */;
/*!40000 ALTER TABLE `measure_importances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depts`
--

DROP TABLE IF EXISTS `depts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depts`
--

LOCK TABLES `depts` WRITE;
/*!40000 ALTER TABLE `depts` DISABLE KEYS */;
INSERT INTO `depts` VALUES (1,'analytics'),(2,'sales & rent'),(3,'administration'),(4,'management');
/*!40000 ALTER TABLE `depts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT 'noname',
  `position_id` int(11) NOT NULL,
  `mah_result` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_employees_1` (`position_id`),
  CONSTRAINT `fk_employees_1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (101,'5555',2,0),(106,'ww',5,0),(107,'rrrr',1,0),(108,'1111',5,0),(109,'tt',1,0),(111,'uu',1,0),(112,'ii1',1,0),(113,'oo',1,0),(114,'pp',1,0),(115,'zz',3,0),(116,'xx',1,0),(117,'ccc',1,0),(118,'vv',1,0),(120,'nn',1,0),(121,'tests',4,0),(122,'tr',1,0);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_types`
--

DROP TABLE IF EXISTS `activity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_types`
--

LOCK TABLES `activity_types` WRITE;
/*!40000 ALTER TABLE `activity_types` DISABLE KEYS */;
INSERT INTO `activity_types` VALUES (1,'sale'),(2,'rent');
/*!40000 ALTER TABLE `activity_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_class_id` int(11) NOT NULL,
  `entity_type_id` int(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_UNIQUE` (`address`),
  KEY `fk_entities_1` (`entity_class_id`),
  KEY `fk_entities_2` (`entity_type_id`),
  CONSTRAINT `fk_entities_1` FOREIGN KEY (`entity_class_id`) REFERENCES `entity_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entities_2` FOREIGN KEY (`entity_type_id`) REFERENCES `entity_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (1,4,5,'Kharkiv','\0'),(2,1,1,'Kharkivska obl.',''),(3,2,1,'Kyiv',''),(4,1,1,'lviv',''),(5,1,1,'kharkiv 2',''),(6,1,1,'kharkiv 3',''),(7,1,1,'Kharkiv 4',''),(8,2,3,'Kharkiv 5',''),(11,2,2,'Kharkiv 8',''),(12,2,4,'Kharkiv 9',''),(13,3,3,'Kharkiv 10',''),(14,2,3,'Kharkiv 11',''),(15,3,5,'Kharkiv 12',''),(16,3,5,'Kharkiv 14',''),(18,2,4,'Kharkiv 15','');
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rates` (
  `measure_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `value` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`measure_id`,`employee_id`,`created`),
  KEY `fk_rates_1` (`measure_id`),
  KEY `fk_rates_2` (`employee_id`),
  CONSTRAINT `fk_rates_1` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rates_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT 'noname',
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poisitons_1` (`dept_id`),
  CONSTRAINT `fk_poisitons_1` FOREIGN KEY (`dept_id`) REFERENCES `depts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'analytic',1),(2,'salesman',2),(3,'sys admin',3),(4,'admin',4),(5,'renter',2);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_types`
--

DROP TABLE IF EXISTS `entity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_types`
--

LOCK TABLES `entity_types` WRITE;
/*!40000 ALTER TABLE `entity_types` DISABLE KEYS */;
INSERT INTO `entity_types` VALUES (1,'house'),(2,'1r-appartment'),(3,'2r-appartment'),(4,'3r-appartment'),(5,'4r-appartment'),(6,'office');
/*!40000 ALTER TABLE `entity_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-02 22:36:45

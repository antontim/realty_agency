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
  CONSTRAINT `fk_employee_evaluations_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_evaluations`
--

LOCK TABLES `employee_evaluations` WRITE;
/*!40000 ALTER TABLE `employee_evaluations` DISABLE KEYS */;
INSERT INTO `employee_evaluations` VALUES (1,1,101,59,'2013-01-01 00:00:00'),(2,1,101,70,'2013-04-04 00:00:00'),(3,3,101,90,'2013-04-05 00:00:00'),(4,3,101,50,'2013-05-01 00:00:00'),(9,16,101,11,'2013-05-05 19:10:02'),(10,3,101,20,'2013-05-10 00:00:00'),(11,1,101,23,'2013-05-15 00:00:00'),(12,9,101,25,'2013-05-20 00:00:00'),(15,10,123,11,'2013-05-12 00:23:27'),(16,6,123,12.1,'2013-05-12 00:24:35'),(17,14,123,14.1,'2013-05-12 00:25:11'),(18,1,126,1,'2013-05-12 23:15:58'),(19,3,126,1,'2013-05-12 23:16:08'),(20,18,123,10,'2013-05-13 03:06:09'),(21,16,123,20,'2013-05-13 03:06:18'),(23,1,123,11,'2013-06-11 02:45:04'),(24,3,123,11,'2013-06-11 02:45:09'),(25,10,123,11,'2013-06-11 02:45:14'),(26,14,123,11,'2013-06-11 02:45:19'),(27,1,101,1000,'2013-06-12 05:01:55'),(28,6,101,100,'2013-06-12 05:02:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,1,1,101,'2012-01-01 00:00:00'),(3,2,11,101,'2013-05-05 22:24:18'),(4,1,8,101,'2013-05-05 22:27:46'),(5,2,12,101,'2013-05-05 22:28:03'),(6,2,7,101,'2013-05-05 22:30:26'),(7,2,2,101,'2013-05-05 22:30:30'),(8,1,14,101,'2013-05-05 22:30:33'),(16,1,18,128,'2013-05-09 22:43:48'),(17,1,13,128,'2013-05-09 22:43:50'),(18,1,15,129,'2013-05-09 22:45:01'),(19,1,16,129,'2013-05-09 22:45:03'),(20,2,21,136,'2013-05-12 03:30:57'),(21,1,19,101,'2013-05-12 23:55:05'),(22,1,20,101,'2013-05-12 23:58:50'),(23,1,22,101,'2013-05-12 23:59:31'),(24,1,23,101,'2013-05-13 00:01:06'),(25,1,24,101,'2013-05-13 00:01:30'),(26,1,27,101,'2013-05-13 03:10:52'),(27,1,31,101,'2013-05-13 03:11:39'),(28,1,28,141,'2013-05-13 03:20:40'),(29,2,32,142,'2013-05-13 03:22:16');
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
  KEY `fk_tests_2` (`measure_id`),
  CONSTRAINT `fk_tests_2` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'test_111','type_111',1),(2,'test_2','type_2',5),(3,'test_3','type_3',5),(4,'test_4','type_4',5),(5,'test_5','type_5',4),(6,'test7','tss',4),(8,'tst92','9t1',4);
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
INSERT INTO `entity_prices` VALUES (1,'2012-02-01 00:00:00',1000),(1,'2012-02-02 00:00:00',900),(1,'2013-02-01 00:00:00',1100),(1,'2013-05-02 20:38:14',1200),(2,'2012-02-01 00:00:00',1000),(2,'2013-01-01 00:00:00',1010),(2,'2013-05-02 22:20:54',1011),(7,'2013-05-02 18:04:56',100),(8,'2013-05-02 18:08:36',110),(11,'2013-05-02 18:16:19',2400),(12,'2013-05-02 18:20:10',2000),(13,'2013-05-02 18:21:29',20001),(14,'2013-05-02 18:24:43',1100),(15,'2013-05-02 18:25:21',1111),(16,'2013-05-02 18:25:31',1111),(18,'2013-05-02 21:44:46',1),(19,'2013-05-12 00:02:19',100),(20,'2013-05-12 00:02:57',100),(20,'2013-05-12 00:03:28',100.1),(21,'2013-05-12 00:03:07',1000),(22,'2013-05-12 23:59:25',1000),(23,'2013-05-13 00:01:03',1200),(24,'2013-05-13 00:01:22',3000),(25,'2013-05-13 00:02:32',3500),(27,'2013-05-13 00:02:54',3000),(28,'2013-05-13 00:03:06',900),(31,'2013-05-13 03:11:36',111),(32,'2013-05-13 03:21:47',10000),(33,'2013-05-13 03:22:33',4000),(34,'2013-06-10 01:26:13',1000),(35,'2013-06-10 01:31:46',100),(36,'2013-06-10 01:36:04',100),(38,'2013-06-10 01:41:16',10),(39,'2013-06-10 01:42:49',10),(40,'2013-06-10 02:18:26',1111),(41,'2013-06-10 02:18:58',11),(41,'2013-06-10 02:19:20',111),(42,'2013-06-12 05:00:48',10000);
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
  `measure_target_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_measures_1` (`measure_type_id`),
  KEY `fk_measures_2` (`measure_target_id`),
  CONSTRAINT `fk_measures_1` FOREIGN KEY (`measure_type_id`) REFERENCES `measure_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_measures_2` FOREIGN KEY (`measure_target_id`) REFERENCES `measure_target` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measures`
--

LOCK TABLES `measures` WRITE;
/*!40000 ALTER TABLE `measures` DISABLE KEYS */;
INSERT INTO `measures` VALUES (1,2,'sociability',0),(2,2,'intelligence',0),(3,1,'earnings',0),(4,2,'activity',0),(5,2,'humor sense',0),(6,1,'earnings',1),(7,1,'orders amount',1),(8,1,'emp amount',1),(9,1,'avg efficiency',1),(10,1,'depts efficiency',2),(11,1,'new entities amount',2),(12,1,'earnings',2);
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
  CONSTRAINT `fk_test_results_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_results_2` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_results`
--

LOCK TABLES `test_results` WRITE;
/*!40000 ALTER TABLE `test_results` DISABLE KEYS */;
INSERT INTO `test_results` VALUES (1,101,10,'2013-01-01'),(1,101,12,'2013-05-02'),(1,101,11,'2013-05-05'),(1,101,100,'2013-06-12'),(1,123,1.2,'2013-05-11'),(1,123,11,'2013-06-11'),(1,130,11,'2013-05-13'),(2,123,10.1,'2013-05-11'),(2,123,11,'2013-06-11'),(3,123,222.1,'2013-05-12'),(3,123,11,'2013-06-11'),(4,123,10.2,'2013-05-11'),(4,123,11,'2013-06-11'),(5,101,5,'2013-05-03'),(6,123,23,'2013-05-13');
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
  `label` varchar(45) NOT NULL DEFAULT 'undefined',
  PRIMARY KEY (`id`),
  KEY `fk_questions_1` (`measure_id`),
  CONSTRAINT `fk_questions_1` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'question 1??',2,'label11112'),(3,'question 2?',1,'test label'),(6,'quest 1111',2,'label 111'),(9,'test 2',3,'ll'),(10,'test3',1,'label 3'),(14,'text ',2,'lab'),(15,'text1',2,'lab11'),(16,'tst',4,'lab111'),(18,'qwe',2,'q'),(20,'ert',3,'q');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `norms`
--

DROP TABLE IF EXISTS `norms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `norms` (
  `activity_type_id` int(11) NOT NULL,
  `changed` date NOT NULL,
  `month_norm` float NOT NULL,
  PRIMARY KEY (`activity_type_id`),
  KEY `fk_norms_1` (`activity_type_id`),
  CONSTRAINT `fk_norms_1` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `norms`
--

LOCK TABLES `norms` WRITE;
/*!40000 ALTER TABLE `norms` DISABLE KEYS */;
INSERT INTO `norms` VALUES (1,'2013-05-13',200000),(2,'2013-05-13',20001.5);
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
-- Table structure for table `measure_target`
--

DROP TABLE IF EXISTS `measure_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_target` (
  `id` int(11) NOT NULL,
  `target` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_target`
--

LOCK TABLES `measure_target` WRITE;
/*!40000 ALTER TABLE `measure_target` DISABLE KEYS */;
INSERT INTO `measure_target` VALUES (0,'employee'),(1,'dept'),(2,'company');
/*!40000 ALTER TABLE `measure_target` ENABLE KEYS */;
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
INSERT INTO `measure_importances` VALUES (1,1,1),(1,2,2),(1,3,2),(1,4,3),(1,5,0.2),(2,1,0.5),(2,2,1),(2,3,0.5),(2,4,5),(2,5,1),(3,1,0.5),(3,2,2),(3,3,1),(3,4,1.5),(3,5,1),(4,1,0.333333),(4,2,0.2),(4,3,0.666667),(4,4,1),(4,5,1),(5,1,5),(5,2,1),(5,3,1),(5,4,1),(5,5,1),(6,6,1),(6,7,2),(6,8,1),(6,9,2),(7,6,0.5),(7,7,1),(7,8,5),(7,9,6),(8,6,1),(8,7,0.2),(8,8,1),(8,9,0.5),(9,6,0.5),(9,7,0.166667),(9,8,2),(9,9,1),(10,10,1),(10,11,2),(10,12,0.15),(11,10,0.5),(11,11,1),(11,12,0.25),(12,10,6.66667),(12,11,4),(12,12,1);
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
  `mah_result` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depts`
--

LOCK TABLES `depts` WRITE;
/*!40000 ALTER TABLE `depts` DISABLE KEYS */;
INSERT INTO `depts` VALUES (1,'analytics',0.226082),(2,'sales',0.251043),(3,'administration',0.165235),(4,'management',0.16533),(5,'rent',0.19231);
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
  `username` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_employees_1` (`position_id`),
  KEY `fk_employees_2` (`username`),
  CONSTRAINT `fk_employees_1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_2` FOREIGN KEY (`username`) REFERENCES `users`.`users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (101,'5555',2,0.416944,'test'),(123,'TEst Test1',1,0.290211,'TTest1'),(126,'Test Test2',1,0.0225422,'TTest2'),(127,'Test test3',1,0.0225422,'Ttest3'),(128,'Test Test4',2,0.0225422,'TTest4'),(129,'Test test5',5,0.0225422,'Ttest5'),(130,'Test Test6',3,0.0223384,'TTest6'),(131,'Test test7',2,0.0225422,'Ttest7'),(132,'Test test8',2,0.0225422,'Ttest8'),(136,'Test test20',5,0.0225422,'Testtest20'),(137,'Tst1',1,0.0225422,'Tst1'),(140,'Analytic',1,0.0225422,'Analytic'),(141,'Salesman',2,0.0225422,'Salesman'),(142,'Renter',5,0.0225422,'Renter'),(143,'Manager',4,0.0225422,'Manager');
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
  `addr_street` varchar(25) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `addr_house` varchar(10) NOT NULL,
  `addr_appartment` varchar(10) NOT NULL,
  `addr_city` varchar(20) NOT NULL,
  `created` date NOT NULL DEFAULT '2000-10-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addr_uniq` (`addr_street`,`addr_house`,`addr_appartment`,`addr_city`),
  KEY `fk_entities_1` (`entity_class_id`),
  KEY `fk_entities_2` (`entity_type_id`),
  CONSTRAINT `fk_entities_1` FOREIGN KEY (`entity_class_id`) REFERENCES `entity_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entities_2` FOREIGN KEY (`entity_type_id`) REFERENCES `entity_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (1,4,5,'Kharkiv','','','','','2000-10-00'),(2,1,1,'Klochck','','1','1','Kharkiv','2000-10-00'),(3,2,1,'Kyiv','','','','','2000-10-00'),(4,1,1,'lviv','','','','','2000-10-00'),(5,1,1,'kharkiv 2','','','','','2000-10-00'),(6,1,1,'kharkiv 3','','','','','2000-10-00'),(7,1,1,'Kharkiv 4','\0','','','','2000-10-00'),(8,2,3,'','','','','Kharkiv 5','2000-10-00'),(11,2,2,'Kharkiv 8','','','','','2000-10-00'),(12,2,4,'','','','','Kharkiv 9','2000-10-00'),(13,3,2,'Kharkiv 10','','','','','2000-10-00'),(14,2,3,'','','','','Kharkiv 11','2000-10-00'),(15,3,5,'Kharkiv 12','\0','','','','2000-10-00'),(16,3,5,'Kharkiv 14','\0','','','','2000-10-00'),(18,2,4,'Kharkiv 15','','','','','2000-10-00'),(19,2,3,'','','','','Kh1','2000-10-00'),(20,4,1,'Kh21','\0','','','','2000-10-00'),(21,1,4,'Kh3','','','','','2000-10-00'),(22,1,1,'Kh30','','2','1','Khar','2000-10-00'),(23,1,1,'Kh31','','','','','2000-10-00'),(24,3,2,'Kh32','','','','','2000-10-00'),(25,3,3,'Kh34','','','','','2000-10-00'),(27,2,1,'Kh36','','','','','2000-10-00'),(28,3,6,'Kh37','','','','','2000-10-00'),(31,1,3,'Kh35','','','','','2000-10-00'),(32,4,3,'Kh40','','','','','2000-10-00'),(33,3,2,'Kh41','','','','','2000-10-00'),(34,3,4,'Klochk','','1','1','Kh','2000-10-00'),(35,2,4,'k','','1','1','k','2000-10-00'),(36,2,2,'k2w','','11','21','k1e','2000-10-00'),(38,1,1,'k4','','1','2','k3','2000-10-00'),(39,1,1,'k5','','1','2','k3','2000-10-00'),(40,3,4,'Klochk','','10','11','Kharkiv 2','2000-10-00'),(41,3,3,'Kh32','','11','22','Kh21','2000-10-00'),(42,3,3,'one ','','1','1','new','2013-06-12');
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
  CONSTRAINT `fk_rates_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
INSERT INTO `rates` VALUES (1,101,'2013-05-09 22:13:32',3.2),(1,101,'2013-05-09 22:13:58',3.2),(1,101,'2013-05-09 22:27:54',14.1),(1,101,'2013-05-09 22:45:22',14.1),(1,101,'2013-05-12 00:09:49',14.1),(1,101,'2013-05-12 03:56:24',8.65),(1,101,'2013-05-13 01:28:14',8.65),(1,101,'2013-05-13 03:14:53',14.5),(1,101,'2013-06-12 05:02:16',100),(1,123,'2013-05-09 22:13:32',0.1),(1,123,'2013-05-09 22:13:58',0.1),(1,123,'2013-05-09 22:27:54',0.1),(1,123,'2013-05-09 22:45:22',0.1),(1,123,'2013-05-12 00:09:49',1.2),(1,123,'2013-05-12 03:56:24',1.75),(1,123,'2013-05-13 01:28:14',1.75),(1,123,'2013-05-13 03:14:53',2.3),(1,123,'2013-06-11 02:45:48',12.1),(1,123,'2013-06-12 03:03:31',12.1),(1,123,'2013-06-12 04:11:51',12.1),(1,123,'2013-06-12 04:13:27',12.1),(1,123,'2013-06-12 04:17:17',12.1),(1,123,'2013-06-12 04:18:09',12.1),(1,123,'2013-06-12 04:24:07',12.1),(1,123,'2013-06-12 04:45:24',12.1),(1,123,'2013-06-12 05:01:35',12.1),(1,123,'2013-06-12 05:02:16',12.1),(1,126,'2013-05-09 22:13:32',0.1),(1,126,'2013-05-09 22:13:58',0.1),(1,126,'2013-05-09 22:27:54',0.1),(1,126,'2013-05-09 22:45:22',0.1),(1,126,'2013-05-12 00:09:49',0.1),(1,126,'2013-05-12 03:56:24',0.1),(1,126,'2013-05-13 01:28:14',0.2),(1,126,'2013-05-13 03:14:53',0.2),(1,126,'2013-06-11 02:01:40',0.1),(1,126,'2013-06-11 02:29:51',0.1),(1,126,'2013-06-11 02:31:34',0.1),(1,126,'2013-06-11 02:41:41',0.1),(1,126,'2013-06-11 02:45:48',0.1),(1,126,'2013-06-12 03:03:31',0.1),(1,126,'2013-06-12 04:11:51',0.1),(1,126,'2013-06-12 04:13:27',0.1),(1,126,'2013-06-12 04:17:17',0.1),(1,126,'2013-06-12 04:18:09',0.1),(1,126,'2013-06-12 04:24:07',0.1),(1,126,'2013-06-12 04:45:24',0.1),(1,126,'2013-06-12 05:01:35',0.1),(1,126,'2013-06-12 05:02:16',0.1),(1,127,'2013-05-09 22:13:32',0.1),(1,127,'2013-05-09 22:13:58',0.1),(1,127,'2013-05-09 22:27:54',0.1),(1,127,'2013-05-09 22:45:22',0.1),(1,127,'2013-05-12 00:09:49',0.1),(1,127,'2013-05-12 03:56:24',0.1),(1,127,'2013-05-13 01:28:14',0.1),(1,127,'2013-05-13 03:14:53',0.1),(1,127,'2013-06-11 02:01:40',0.1),(1,127,'2013-06-11 02:29:51',0.1),(1,127,'2013-06-11 02:31:34',0.1),(1,127,'2013-06-11 02:41:41',0.1),(1,127,'2013-06-11 02:45:48',0.1),(1,127,'2013-06-12 03:03:31',0.1),(1,127,'2013-06-12 04:11:51',0.1),(1,127,'2013-06-12 04:13:27',0.1),(1,127,'2013-06-12 04:17:17',0.1),(1,127,'2013-06-12 04:18:09',0.1),(1,127,'2013-06-12 04:24:07',0.1),(1,127,'2013-06-12 04:45:24',0.1),(1,127,'2013-06-12 05:01:35',0.1),(1,127,'2013-06-12 05:02:16',0.1),(1,128,'2013-05-09 22:27:54',0.1),(1,128,'2013-05-09 22:45:22',0.1),(1,128,'2013-05-12 00:09:49',0.1),(1,128,'2013-05-12 03:56:24',0.1),(1,128,'2013-05-13 01:28:14',0.1),(1,128,'2013-05-13 03:14:53',0.1),(1,128,'2013-06-11 02:01:40',0.1),(1,128,'2013-06-11 02:29:51',0.1),(1,128,'2013-06-11 02:31:34',0.1),(1,128,'2013-06-11 02:41:41',0.1),(1,128,'2013-06-11 02:45:48',0.1),(1,128,'2013-06-12 03:03:31',0.1),(1,128,'2013-06-12 04:11:51',0.1),(1,128,'2013-06-12 04:13:27',0.1),(1,128,'2013-06-12 04:17:17',0.1),(1,128,'2013-06-12 04:18:09',0.1),(1,128,'2013-06-12 04:24:07',0.1),(1,128,'2013-06-12 04:45:24',0.1),(1,128,'2013-06-12 05:01:35',0.1),(1,128,'2013-06-12 05:02:16',0.1),(1,129,'2013-05-09 22:45:22',0.1),(1,129,'2013-05-12 00:09:49',0.1),(1,129,'2013-05-12 03:56:24',0.1),(1,129,'2013-05-13 01:28:14',0.1),(1,129,'2013-05-13 03:14:53',0.1),(1,129,'2013-06-11 02:01:40',0.1),(1,129,'2013-06-11 02:29:51',0.1),(1,129,'2013-06-11 02:31:34',0.1),(1,129,'2013-06-11 02:41:41',0.1),(1,129,'2013-06-11 02:45:48',0.1),(1,129,'2013-06-12 03:03:31',0.1),(1,129,'2013-06-12 04:11:51',0.1),(1,129,'2013-06-12 04:13:27',0.1),(1,129,'2013-06-12 04:17:17',0.1),(1,129,'2013-06-12 04:18:09',0.1),(1,129,'2013-06-12 04:24:07',0.1),(1,129,'2013-06-12 04:45:24',0.1),(1,129,'2013-06-12 05:01:35',0.1),(1,129,'2013-06-12 05:02:16',0.1),(1,130,'2013-05-12 00:09:49',0.1),(1,130,'2013-05-12 03:56:24',0.1),(1,130,'2013-05-13 01:28:14',5.55),(1,130,'2013-05-13 03:14:53',11),(1,131,'2013-05-12 00:09:49',0.1),(1,131,'2013-05-12 03:56:24',0.1),(1,131,'2013-05-13 01:28:14',0.1),(1,131,'2013-05-13 03:14:53',0.1),(1,131,'2013-06-11 02:01:40',0.1),(1,131,'2013-06-11 02:29:51',0.1),(1,131,'2013-06-11 02:31:34',0.1),(1,131,'2013-06-11 02:41:41',0.1),(1,131,'2013-06-11 02:45:48',0.1),(1,131,'2013-06-12 03:03:31',0.1),(1,131,'2013-06-12 04:11:51',0.1),(1,131,'2013-06-12 04:13:27',0.1),(1,131,'2013-06-12 04:17:17',0.1),(1,131,'2013-06-12 04:18:09',0.1),(1,131,'2013-06-12 04:24:07',0.1),(1,131,'2013-06-12 04:45:24',0.1),(1,131,'2013-06-12 05:01:35',0.1),(1,131,'2013-06-12 05:02:16',0.1),(1,132,'2013-05-12 00:09:49',0.1),(1,132,'2013-05-12 03:56:24',0.1),(1,132,'2013-05-13 01:28:14',0.1),(1,132,'2013-05-13 03:14:53',0.1),(1,132,'2013-06-11 02:01:40',0.1),(1,132,'2013-06-11 02:29:51',0.1),(1,132,'2013-06-11 02:31:34',0.1),(1,132,'2013-06-11 02:41:41',0.1),(1,132,'2013-06-11 02:45:48',0.1),(1,132,'2013-06-12 03:03:31',0.1),(1,132,'2013-06-12 04:11:51',0.1),(1,132,'2013-06-12 04:13:27',0.1),(1,132,'2013-06-12 04:17:17',0.1),(1,132,'2013-06-12 04:18:09',0.1),(1,132,'2013-06-12 04:24:07',0.1),(1,132,'2013-06-12 04:45:24',0.1),(1,132,'2013-06-12 05:01:35',0.1),(1,132,'2013-06-12 05:02:16',0.1),(1,136,'2013-05-12 03:56:24',0.1),(1,136,'2013-05-13 01:28:14',0.1),(1,136,'2013-05-13 03:14:53',0.1),(1,136,'2013-06-11 02:01:40',0.1),(1,136,'2013-06-11 02:29:51',0.1),(1,136,'2013-06-11 02:31:34',0.1),(1,136,'2013-06-11 02:41:41',0.1),(1,136,'2013-06-11 02:45:48',0.1),(1,136,'2013-06-12 03:03:31',0.1),(1,136,'2013-06-12 04:11:51',0.1),(1,136,'2013-06-12 04:13:27',0.1),(1,136,'2013-06-12 04:17:17',0.1),(1,136,'2013-06-12 04:18:09',0.1),(1,136,'2013-06-12 04:24:07',0.1),(1,136,'2013-06-12 04:45:24',0.1),(1,136,'2013-06-12 05:01:35',0.1),(1,136,'2013-06-12 05:02:16',0.1),(1,137,'2013-05-13 03:14:53',0.1),(1,137,'2013-06-11 02:01:40',0.1),(1,137,'2013-06-11 02:29:51',0.1),(1,137,'2013-06-11 02:31:34',0.1),(1,137,'2013-06-11 02:41:41',0.1),(1,137,'2013-06-11 02:45:48',0.1),(1,137,'2013-06-12 03:03:31',0.1),(1,137,'2013-06-12 04:11:51',0.1),(1,137,'2013-06-12 04:13:27',0.1),(1,137,'2013-06-12 04:17:17',0.1),(1,137,'2013-06-12 04:18:09',0.1),(1,137,'2013-06-12 04:24:07',0.1),(1,137,'2013-06-12 04:45:24',0.1),(1,137,'2013-06-12 05:01:35',0.1),(1,137,'2013-06-12 05:02:16',0.1),(1,140,'2013-05-13 03:14:53',0.1),(1,140,'2013-06-11 02:01:40',0.1),(1,140,'2013-06-11 02:29:51',0.1),(1,140,'2013-06-11 02:31:34',0.1),(1,140,'2013-06-11 02:41:41',0.1),(1,140,'2013-06-11 02:45:48',0.1),(1,140,'2013-06-12 03:03:31',0.1),(1,140,'2013-06-12 04:11:51',0.1),(1,140,'2013-06-12 04:13:27',0.1),(1,140,'2013-06-12 04:17:17',0.1),(1,140,'2013-06-12 04:18:09',0.1),(1,140,'2013-06-12 04:24:07',0.1),(1,140,'2013-06-12 04:45:24',0.1),(1,140,'2013-06-12 05:01:35',0.1),(1,140,'2013-06-12 05:02:16',0.1),(1,141,'2013-05-13 03:14:53',0.1),(1,141,'2013-06-11 02:01:40',0.1),(1,141,'2013-06-11 02:29:51',0.1),(1,141,'2013-06-11 02:31:34',0.1),(1,141,'2013-06-11 02:41:41',0.1),(1,141,'2013-06-11 02:45:48',0.1),(1,141,'2013-06-12 03:03:31',0.1),(1,141,'2013-06-12 04:11:51',0.1),(1,141,'2013-06-12 04:13:27',0.1),(1,141,'2013-06-12 04:17:17',0.1),(1,141,'2013-06-12 04:18:09',0.1),(1,141,'2013-06-12 04:24:07',0.1),(1,141,'2013-06-12 04:45:24',0.1),(1,141,'2013-06-12 05:01:35',0.1),(1,141,'2013-06-12 05:02:16',0.1),(1,142,'2013-05-13 03:14:53',0.1),(1,142,'2013-06-11 02:01:40',0.1),(1,142,'2013-06-11 02:29:51',0.1),(1,142,'2013-06-11 02:31:34',0.1),(1,142,'2013-06-11 02:41:41',0.1),(1,142,'2013-06-11 02:45:48',0.1),(1,142,'2013-06-12 03:03:31',0.1),(1,142,'2013-06-12 04:11:51',0.1),(1,142,'2013-06-12 04:13:27',0.1),(1,142,'2013-06-12 04:17:17',0.1),(1,142,'2013-06-12 04:18:09',0.1),(1,142,'2013-06-12 04:24:07',0.1),(1,142,'2013-06-12 04:45:24',0.1),(1,142,'2013-06-12 05:01:35',0.1),(1,142,'2013-06-12 05:02:16',0.1),(1,143,'2013-05-13 03:14:53',0.1),(1,143,'2013-06-11 02:01:40',0.1),(1,143,'2013-06-11 02:29:51',0.1),(1,143,'2013-06-11 02:31:34',0.1),(1,143,'2013-06-11 02:41:41',0.1),(1,143,'2013-06-11 02:45:48',0.1),(1,143,'2013-06-12 03:03:31',0.1),(1,143,'2013-06-12 04:11:51',0.1),(1,143,'2013-06-12 04:13:27',0.1),(1,143,'2013-06-12 04:17:17',0.1),(1,143,'2013-06-12 04:18:09',0.1),(1,143,'2013-06-12 04:24:07',0.1),(1,143,'2013-06-12 04:45:24',0.1),(1,143,'2013-06-12 05:01:35',0.1),(1,143,'2013-06-12 05:02:16',0.1),(2,101,'2013-05-09 22:13:32',0.1),(2,101,'2013-05-09 22:13:58',0.1),(2,101,'2013-05-09 22:27:54',0.1),(2,101,'2013-05-09 22:45:22',0.1),(2,101,'2013-05-12 00:09:49',0.1),(2,101,'2013-05-12 03:56:24',0.1),(2,101,'2013-05-13 01:28:14',0.1),(2,101,'2013-05-13 03:14:53',2.4),(2,101,'2013-06-11 02:01:40',0.1),(2,101,'2013-06-11 02:29:51',0.1),(2,101,'2013-06-11 02:31:34',0.1),(2,101,'2013-06-11 02:41:41',0.1),(2,101,'2013-06-11 02:45:48',0.1),(2,101,'2013-06-12 03:03:31',0.1),(2,101,'2013-06-12 04:11:51',0.1),(2,101,'2013-06-12 04:13:27',0.1),(2,101,'2013-06-12 04:17:17',0.1),(2,101,'2013-06-12 04:18:09',0.1),(2,101,'2013-06-12 04:24:07',0.1),(2,101,'2013-06-12 04:45:24',0.1),(2,101,'2013-06-12 05:01:35',0.1),(2,101,'2013-06-12 05:02:16',55.1),(2,123,'2013-05-09 22:13:32',0.1),(2,123,'2013-05-09 22:13:58',0.1),(2,123,'2013-05-09 22:27:54',0.1),(2,123,'2013-05-09 22:45:22',0.1),(2,123,'2013-05-12 00:09:49',0.1),(2,123,'2013-05-12 03:56:24',1.41),(2,123,'2013-05-13 01:28:14',1.41),(2,123,'2013-05-13 03:14:53',1.30667),(2,123,'2013-06-11 02:01:40',0.1),(2,123,'2013-06-11 02:29:51',0.1),(2,123,'2013-06-11 02:31:34',0.1),(2,123,'2013-06-11 02:41:41',0.1),(2,123,'2013-06-11 02:45:48',1.2),(2,123,'2013-06-12 03:03:31',1.2),(2,123,'2013-06-12 04:11:51',1.2),(2,123,'2013-06-12 04:13:27',1.2),(2,123,'2013-06-12 04:17:17',1.2),(2,123,'2013-06-12 04:18:09',1.2),(2,123,'2013-06-12 04:24:07',1.2),(2,123,'2013-06-12 04:45:24',1.2),(2,123,'2013-06-12 05:01:35',1.2),(2,123,'2013-06-12 05:02:16',1.2),(2,126,'2013-05-09 22:13:32',0.1),(2,126,'2013-05-09 22:13:58',0.1),(2,126,'2013-05-09 22:27:54',0.1),(2,126,'2013-05-09 22:45:22',0.1),(2,126,'2013-05-12 00:09:49',0.1),(2,126,'2013-05-12 03:56:24',0.1),(2,126,'2013-05-13 01:28:14',0.1),(2,126,'2013-05-13 03:14:53',0.2),(2,126,'2013-06-11 02:01:40',0.1),(2,126,'2013-06-11 02:29:51',0.1),(2,126,'2013-06-11 02:31:34',0.1),(2,126,'2013-06-11 02:41:41',0.1),(2,126,'2013-06-11 02:45:48',0.1),(2,126,'2013-06-12 03:03:31',0.1),(2,126,'2013-06-12 04:11:51',0.1),(2,126,'2013-06-12 04:13:27',0.1),(2,126,'2013-06-12 04:17:17',0.1),(2,126,'2013-06-12 04:18:09',0.1),(2,126,'2013-06-12 04:24:07',0.1),(2,126,'2013-06-12 04:45:24',0.1),(2,126,'2013-06-12 05:01:35',0.1),(2,126,'2013-06-12 05:02:16',0.1),(2,127,'2013-05-09 22:13:32',0.1),(2,127,'2013-05-09 22:13:58',0.1),(2,127,'2013-05-09 22:27:54',0.1),(2,127,'2013-05-09 22:45:22',0.1),(2,127,'2013-05-12 00:09:49',0.1),(2,127,'2013-05-12 03:56:24',0.1),(2,127,'2013-05-13 01:28:14',0.1),(2,127,'2013-05-13 03:14:53',0.1),(2,127,'2013-06-11 02:01:40',0.1),(2,127,'2013-06-11 02:29:51',0.1),(2,127,'2013-06-11 02:31:34',0.1),(2,127,'2013-06-11 02:41:41',0.1),(2,127,'2013-06-11 02:45:48',0.1),(2,127,'2013-06-12 03:03:31',0.1),(2,127,'2013-06-12 04:11:51',0.1),(2,127,'2013-06-12 04:13:27',0.1),(2,127,'2013-06-12 04:17:17',0.1),(2,127,'2013-06-12 04:18:09',0.1),(2,127,'2013-06-12 04:24:07',0.1),(2,127,'2013-06-12 04:45:24',0.1),(2,127,'2013-06-12 05:01:35',0.1),(2,127,'2013-06-12 05:02:16',0.1),(2,128,'2013-05-09 22:27:54',0.1),(2,128,'2013-05-09 22:45:22',0.1),(2,128,'2013-05-12 00:09:49',0.1),(2,128,'2013-05-12 03:56:24',0.1),(2,128,'2013-05-13 01:28:14',0.1),(2,128,'2013-05-13 03:14:53',0.1),(2,128,'2013-06-11 02:01:40',0.1),(2,128,'2013-06-11 02:29:51',0.1),(2,128,'2013-06-11 02:31:34',0.1),(2,128,'2013-06-11 02:41:41',0.1),(2,128,'2013-06-11 02:45:48',0.1),(2,128,'2013-06-12 03:03:31',0.1),(2,128,'2013-06-12 04:11:51',0.1),(2,128,'2013-06-12 04:13:27',0.1),(2,128,'2013-06-12 04:17:17',0.1),(2,128,'2013-06-12 04:18:09',0.1),(2,128,'2013-06-12 04:24:07',0.1),(2,128,'2013-06-12 04:45:24',0.1),(2,128,'2013-06-12 05:01:35',0.1),(2,128,'2013-06-12 05:02:16',0.1),(2,129,'2013-05-09 22:45:22',0.1),(2,129,'2013-05-12 00:09:49',0.1),(2,129,'2013-05-12 03:56:24',0.1),(2,129,'2013-05-13 01:28:14',0.1),(2,129,'2013-05-13 03:14:53',0.1),(2,129,'2013-06-11 02:01:40',0.1),(2,129,'2013-06-11 02:29:51',0.1),(2,129,'2013-06-11 02:31:34',0.1),(2,129,'2013-06-11 02:41:41',0.1),(2,129,'2013-06-11 02:45:48',0.1),(2,129,'2013-06-12 03:03:31',0.1),(2,129,'2013-06-12 04:11:51',0.1),(2,129,'2013-06-12 04:13:27',0.1),(2,129,'2013-06-12 04:17:17',0.1),(2,129,'2013-06-12 04:18:09',0.1),(2,129,'2013-06-12 04:24:07',0.1),(2,129,'2013-06-12 04:45:24',0.1),(2,129,'2013-06-12 05:01:35',0.1),(2,129,'2013-06-12 05:02:16',0.1),(2,130,'2013-05-12 00:09:49',0.1),(2,130,'2013-05-12 03:56:24',0.1),(2,130,'2013-05-13 01:28:14',0.1),(2,130,'2013-05-13 03:14:53',0.1),(2,130,'2013-06-11 02:01:40',0.1),(2,130,'2013-06-11 02:29:51',0.1),(2,130,'2013-06-11 02:31:34',0.1),(2,130,'2013-06-11 02:41:41',0.1),(2,130,'2013-06-11 02:45:48',0.1),(2,130,'2013-06-12 03:03:31',0.1),(2,130,'2013-06-12 04:11:51',0.1),(2,130,'2013-06-12 04:13:27',0.1),(2,130,'2013-06-12 04:17:17',0.1),(2,130,'2013-06-12 04:18:09',0.1),(2,130,'2013-06-12 04:24:07',0.1),(2,130,'2013-06-12 04:45:24',0.1),(2,130,'2013-06-12 05:01:35',0.1),(2,130,'2013-06-12 05:02:16',0.1),(2,131,'2013-05-12 00:09:49',0.1),(2,131,'2013-05-12 03:56:24',0.1),(2,131,'2013-05-13 01:28:14',0.1),(2,131,'2013-05-13 03:14:53',0.1),(2,131,'2013-06-11 02:01:40',0.1),(2,131,'2013-06-11 02:29:51',0.1),(2,131,'2013-06-11 02:31:34',0.1),(2,131,'2013-06-11 02:41:41',0.1),(2,131,'2013-06-11 02:45:48',0.1),(2,131,'2013-06-12 03:03:31',0.1),(2,131,'2013-06-12 04:11:51',0.1),(2,131,'2013-06-12 04:13:27',0.1),(2,131,'2013-06-12 04:17:17',0.1),(2,131,'2013-06-12 04:18:09',0.1),(2,131,'2013-06-12 04:24:07',0.1),(2,131,'2013-06-12 04:45:24',0.1),(2,131,'2013-06-12 05:01:35',0.1),(2,131,'2013-06-12 05:02:16',0.1),(2,132,'2013-05-12 00:09:49',0.1),(2,132,'2013-05-12 03:56:24',0.1),(2,132,'2013-05-13 01:28:14',0.1),(2,132,'2013-05-13 03:14:53',0.1),(2,132,'2013-06-11 02:01:40',0.1),(2,132,'2013-06-11 02:29:51',0.1),(2,132,'2013-06-11 02:31:34',0.1),(2,132,'2013-06-11 02:41:41',0.1),(2,132,'2013-06-11 02:45:48',0.1),(2,132,'2013-06-12 03:03:31',0.1),(2,132,'2013-06-12 04:11:51',0.1),(2,132,'2013-06-12 04:13:27',0.1),(2,132,'2013-06-12 04:17:17',0.1),(2,132,'2013-06-12 04:18:09',0.1),(2,132,'2013-06-12 04:24:07',0.1),(2,132,'2013-06-12 04:45:24',0.1),(2,132,'2013-06-12 05:01:35',0.1),(2,132,'2013-06-12 05:02:16',0.1),(2,136,'2013-05-12 03:56:24',0.1),(2,136,'2013-05-13 01:28:14',0.1),(2,136,'2013-05-13 03:14:53',0.1),(2,136,'2013-06-11 02:01:40',0.1),(2,136,'2013-06-11 02:29:51',0.1),(2,136,'2013-06-11 02:31:34',0.1),(2,136,'2013-06-11 02:41:41',0.1),(2,136,'2013-06-11 02:45:48',0.1),(2,136,'2013-06-12 03:03:31',0.1),(2,136,'2013-06-12 04:11:51',0.1),(2,136,'2013-06-12 04:13:27',0.1),(2,136,'2013-06-12 04:17:17',0.1),(2,136,'2013-06-12 04:18:09',0.1),(2,136,'2013-06-12 04:24:07',0.1),(2,136,'2013-06-12 04:45:24',0.1),(2,136,'2013-06-12 05:01:35',0.1),(2,136,'2013-06-12 05:02:16',0.1),(2,137,'2013-05-13 03:14:53',0.1),(2,137,'2013-06-11 02:01:40',0.1),(2,137,'2013-06-11 02:29:51',0.1),(2,137,'2013-06-11 02:31:34',0.1),(2,137,'2013-06-11 02:41:41',0.1),(2,137,'2013-06-11 02:45:48',0.1),(2,137,'2013-06-12 03:03:31',0.1),(2,137,'2013-06-12 04:11:51',0.1),(2,137,'2013-06-12 04:13:27',0.1),(2,137,'2013-06-12 04:17:17',0.1),(2,137,'2013-06-12 04:18:09',0.1),(2,137,'2013-06-12 04:24:07',0.1),(2,137,'2013-06-12 04:45:24',0.1),(2,137,'2013-06-12 05:01:35',0.1),(2,137,'2013-06-12 05:02:16',0.1),(2,140,'2013-05-13 03:14:53',0.1),(2,140,'2013-06-11 02:01:40',0.1),(2,140,'2013-06-11 02:29:51',0.1),(2,140,'2013-06-11 02:31:34',0.1),(2,140,'2013-06-11 02:41:41',0.1),(2,140,'2013-06-11 02:45:48',0.1),(2,140,'2013-06-12 03:03:31',0.1),(2,140,'2013-06-12 04:11:51',0.1),(2,140,'2013-06-12 04:13:27',0.1),(2,140,'2013-06-12 04:17:17',0.1),(2,140,'2013-06-12 04:18:09',0.1),(2,140,'2013-06-12 04:24:07',0.1),(2,140,'2013-06-12 04:45:24',0.1),(2,140,'2013-06-12 05:01:35',0.1),(2,140,'2013-06-12 05:02:16',0.1),(2,141,'2013-05-13 03:14:53',0.1),(2,141,'2013-06-11 02:01:40',0.1),(2,141,'2013-06-11 02:29:51',0.1),(2,141,'2013-06-11 02:31:34',0.1),(2,141,'2013-06-11 02:41:41',0.1),(2,141,'2013-06-11 02:45:48',0.1),(2,141,'2013-06-12 03:03:31',0.1),(2,141,'2013-06-12 04:11:51',0.1),(2,141,'2013-06-12 04:13:27',0.1),(2,141,'2013-06-12 04:17:17',0.1),(2,141,'2013-06-12 04:18:09',0.1),(2,141,'2013-06-12 04:24:07',0.1),(2,141,'2013-06-12 04:45:24',0.1),(2,141,'2013-06-12 05:01:35',0.1),(2,141,'2013-06-12 05:02:16',0.1),(2,142,'2013-05-13 03:14:53',0.1),(2,142,'2013-06-11 02:01:40',0.1),(2,142,'2013-06-11 02:29:51',0.1),(2,142,'2013-06-11 02:31:34',0.1),(2,142,'2013-06-11 02:41:41',0.1),(2,142,'2013-06-11 02:45:48',0.1),(2,142,'2013-06-12 03:03:31',0.1),(2,142,'2013-06-12 04:11:51',0.1),(2,142,'2013-06-12 04:13:27',0.1),(2,142,'2013-06-12 04:17:17',0.1),(2,142,'2013-06-12 04:18:09',0.1),(2,142,'2013-06-12 04:24:07',0.1),(2,142,'2013-06-12 04:45:24',0.1),(2,142,'2013-06-12 05:01:35',0.1),(2,142,'2013-06-12 05:02:16',0.1),(2,143,'2013-05-13 03:14:53',0.1),(2,143,'2013-06-11 02:01:40',0.1),(2,143,'2013-06-11 02:29:51',0.1),(2,143,'2013-06-11 02:31:34',0.1),(2,143,'2013-06-11 02:41:41',0.1),(2,143,'2013-06-11 02:45:48',0.1),(2,143,'2013-06-12 03:03:31',0.1),(2,143,'2013-06-12 04:11:51',0.1),(2,143,'2013-06-12 04:13:27',0.1),(2,143,'2013-06-12 04:17:17',0.1),(2,143,'2013-06-12 04:18:09',0.1),(2,143,'2013-06-12 04:24:07',0.1),(2,143,'2013-06-12 04:45:24',0.1),(2,143,'2013-06-12 05:01:35',0.1),(2,143,'2013-06-12 05:02:16',0.1),(3,101,'2013-05-09 22:13:32',1.68025),(3,101,'2013-05-09 22:13:58',6.68075),(3,101,'2013-05-09 22:27:54',8.7085),(3,101,'2013-05-09 22:45:22',1.68025),(3,101,'2013-05-12 00:09:49',1.68025),(3,101,'2013-05-12 03:56:24',1.68025),(3,101,'2013-05-13 01:28:14',3.01289),(3,101,'2013-05-13 03:14:53',1.62067),(3,101,'2013-06-11 02:01:40',0.1),(3,101,'2013-06-11 02:29:51',0.1),(3,101,'2013-06-11 02:31:34',0.1),(3,101,'2013-06-11 02:41:41',0.1),(3,101,'2013-06-11 02:45:48',0.1),(3,101,'2013-06-12 03:03:31',0.1),(3,101,'2013-06-12 04:11:51',0.1),(3,101,'2013-06-12 04:13:27',0.1),(3,101,'2013-06-12 04:17:17',0.1),(3,101,'2013-06-12 04:18:09',0.1),(3,101,'2013-06-12 04:24:07',0.1),(3,101,'2013-06-12 04:45:24',0.1),(3,101,'2013-06-12 05:01:35',0.1),(3,101,'2013-06-12 05:02:16',0.1),(3,123,'2013-05-09 22:13:32',0.1),(3,123,'2013-05-09 22:13:58',0.1),(3,123,'2013-05-09 22:27:54',0.1),(3,123,'2013-05-09 22:45:22',0.1),(3,123,'2013-05-12 00:09:49',0.1),(3,123,'2013-05-12 03:56:24',0.1),(3,123,'2013-05-13 01:28:14',0.1),(3,123,'2013-05-13 03:14:53',0.1),(3,123,'2013-06-11 02:01:40',0.1),(3,123,'2013-06-11 02:29:51',0.1),(3,123,'2013-06-11 02:31:34',0.1),(3,123,'2013-06-11 02:41:41',0.1),(3,123,'2013-06-11 02:45:48',0.1),(3,123,'2013-06-12 03:03:31',0.1),(3,123,'2013-06-12 04:11:51',0.1),(3,123,'2013-06-12 04:13:27',0.1),(3,123,'2013-06-12 04:17:17',0.1),(3,123,'2013-06-12 04:18:09',0.1),(3,123,'2013-06-12 04:24:07',0.1),(3,123,'2013-06-12 04:45:24',0.1),(3,123,'2013-06-12 05:01:35',0.1),(3,123,'2013-06-12 05:02:16',0.1),(3,126,'2013-05-09 22:13:32',0.1),(3,126,'2013-05-09 22:13:58',0.1),(3,126,'2013-05-09 22:27:54',0.1),(3,126,'2013-05-09 22:45:22',0.1),(3,126,'2013-05-12 00:09:49',0.1),(3,126,'2013-05-12 03:56:24',0.1),(3,126,'2013-05-13 01:28:14',0.1),(3,126,'2013-05-13 03:14:53',0.1),(3,126,'2013-06-11 02:01:40',0.1),(3,126,'2013-06-11 02:29:51',0.1),(3,126,'2013-06-11 02:31:34',0.1),(3,126,'2013-06-11 02:41:41',0.1),(3,126,'2013-06-11 02:45:48',0.1),(3,126,'2013-06-12 03:03:31',0.1),(3,126,'2013-06-12 04:11:51',0.1),(3,126,'2013-06-12 04:13:27',0.1),(3,126,'2013-06-12 04:17:17',0.1),(3,126,'2013-06-12 04:18:09',0.1),(3,126,'2013-06-12 04:24:07',0.1),(3,126,'2013-06-12 04:45:24',0.1),(3,126,'2013-06-12 05:01:35',0.1),(3,126,'2013-06-12 05:02:16',0.1),(3,127,'2013-05-09 22:13:32',0.1),(3,127,'2013-05-09 22:13:58',0.1),(3,127,'2013-05-09 22:27:54',0.1),(3,127,'2013-05-09 22:45:22',0.1),(3,127,'2013-05-12 00:09:49',0.1),(3,127,'2013-05-12 03:56:24',0.1),(3,127,'2013-05-13 01:28:14',0.1),(3,127,'2013-05-13 03:14:53',0.1),(3,127,'2013-06-11 02:01:40',0.1),(3,127,'2013-06-11 02:29:51',0.1),(3,127,'2013-06-11 02:31:34',0.1),(3,127,'2013-06-11 02:41:41',0.1),(3,127,'2013-06-11 02:45:48',0.1),(3,127,'2013-06-12 03:03:31',0.1),(3,127,'2013-06-12 04:11:51',0.1),(3,127,'2013-06-12 04:13:27',0.1),(3,127,'2013-06-12 04:17:17',0.1),(3,127,'2013-06-12 04:18:09',0.1),(3,127,'2013-06-12 04:24:07',0.1),(3,127,'2013-06-12 04:45:24',0.1),(3,127,'2013-06-12 05:01:35',0.1),(3,127,'2013-06-12 05:02:16',0.1),(3,128,'2013-05-09 22:27:54',0.1),(3,128,'2013-05-09 22:45:22',10.001),(3,128,'2013-05-12 00:09:49',10.001),(3,128,'2013-05-12 03:56:24',10.001),(3,128,'2013-05-13 01:28:14',9.89639),(3,128,'2013-05-13 03:14:53',1.0001),(3,128,'2013-06-11 02:01:40',0.1),(3,128,'2013-06-11 02:29:51',0.1),(3,128,'2013-06-11 02:31:34',0.1),(3,128,'2013-06-11 02:41:41',0.1),(3,128,'2013-06-11 02:45:48',0.1),(3,128,'2013-06-12 03:03:31',0.1),(3,128,'2013-06-12 04:11:51',0.1),(3,128,'2013-06-12 04:13:27',0.1),(3,128,'2013-06-12 04:17:17',0.1),(3,128,'2013-06-12 04:18:09',0.1),(3,128,'2013-06-12 04:24:07',0.1),(3,128,'2013-06-12 04:45:24',0.1),(3,128,'2013-06-12 05:01:35',0.1),(3,128,'2013-06-12 05:02:16',0.1),(3,129,'2013-05-09 22:45:22',1.111),(3,129,'2013-05-12 00:09:49',1.111),(3,129,'2013-05-12 03:56:24',1.111),(3,129,'2013-05-13 01:28:14',1.09938),(3,129,'2013-05-13 03:14:53',0.1111),(3,129,'2013-06-11 02:01:40',0.1),(3,129,'2013-06-11 02:29:51',0.1),(3,129,'2013-06-11 02:31:34',0.1),(3,129,'2013-06-11 02:41:41',0.1),(3,129,'2013-06-11 02:45:48',0.1),(3,129,'2013-06-12 03:03:31',0.1),(3,129,'2013-06-12 04:11:51',0.1),(3,129,'2013-06-12 04:13:27',0.1),(3,129,'2013-06-12 04:17:17',0.1),(3,129,'2013-06-12 04:18:09',0.1),(3,129,'2013-06-12 04:24:07',0.1),(3,129,'2013-06-12 04:45:24',0.1),(3,129,'2013-06-12 05:01:35',0.1),(3,129,'2013-06-12 05:02:16',0.1),(3,130,'2013-05-12 00:09:49',0.1),(3,130,'2013-05-12 03:56:24',0.1),(3,130,'2013-05-13 01:28:14',0.1),(3,130,'2013-05-13 03:14:53',0.1),(3,130,'2013-06-11 02:01:40',0.1),(3,130,'2013-06-11 02:29:51',0.1),(3,130,'2013-06-11 02:31:34',0.1),(3,130,'2013-06-11 02:41:41',0.1),(3,130,'2013-06-11 02:45:48',0.1),(3,130,'2013-06-12 03:03:31',0.1),(3,130,'2013-06-12 04:11:51',0.1),(3,130,'2013-06-12 04:13:27',0.1),(3,130,'2013-06-12 04:17:17',0.1),(3,130,'2013-06-12 04:18:09',0.1),(3,130,'2013-06-12 04:24:07',0.1),(3,130,'2013-06-12 04:45:24',0.1),(3,130,'2013-06-12 05:01:35',0.1),(3,130,'2013-06-12 05:02:16',0.1),(3,131,'2013-05-12 00:09:49',0.1),(3,131,'2013-05-12 03:56:24',0.1),(3,131,'2013-05-13 01:28:14',0.1),(3,131,'2013-05-13 03:14:53',0.1),(3,131,'2013-06-11 02:01:40',0.1),(3,131,'2013-06-11 02:29:51',0.1),(3,131,'2013-06-11 02:31:34',0.1),(3,131,'2013-06-11 02:41:41',0.1),(3,131,'2013-06-11 02:45:48',0.1),(3,131,'2013-06-12 03:03:31',0.1),(3,131,'2013-06-12 04:11:51',0.1),(3,131,'2013-06-12 04:13:27',0.1),(3,131,'2013-06-12 04:17:17',0.1),(3,131,'2013-06-12 04:18:09',0.1),(3,131,'2013-06-12 04:24:07',0.1),(3,131,'2013-06-12 04:45:24',0.1),(3,131,'2013-06-12 05:01:35',0.1),(3,131,'2013-06-12 05:02:16',0.1),(3,132,'2013-05-12 00:09:49',0.1),(3,132,'2013-05-12 03:56:24',0.1),(3,132,'2013-05-13 01:28:14',0.1),(3,132,'2013-05-13 03:14:53',0.1),(3,132,'2013-06-11 02:01:40',0.1),(3,132,'2013-06-11 02:29:51',0.1),(3,132,'2013-06-11 02:31:34',0.1),(3,132,'2013-06-11 02:41:41',0.1),(3,132,'2013-06-11 02:45:48',0.1),(3,132,'2013-06-12 03:03:31',0.1),(3,132,'2013-06-12 04:11:51',0.1),(3,132,'2013-06-12 04:13:27',0.1),(3,132,'2013-06-12 04:17:17',0.1),(3,132,'2013-06-12 04:18:09',0.1),(3,132,'2013-06-12 04:24:07',0.1),(3,132,'2013-06-12 04:45:24',0.1),(3,132,'2013-06-12 05:01:35',0.1),(3,132,'2013-06-12 05:02:16',0.1),(3,136,'2013-05-12 03:56:24',0.5),(3,136,'2013-05-13 01:28:14',0.499963),(3,136,'2013-05-13 03:14:53',0.499963),(3,136,'2013-06-11 02:01:40',0.1),(3,136,'2013-06-11 02:29:51',0.1),(3,136,'2013-06-11 02:31:34',0.1),(3,136,'2013-06-11 02:41:41',0.1),(3,136,'2013-06-11 02:45:48',0.1),(3,136,'2013-06-12 03:03:31',0.1),(3,136,'2013-06-12 04:11:51',0.1),(3,136,'2013-06-12 04:13:27',0.1),(3,136,'2013-06-12 04:17:17',0.1),(3,136,'2013-06-12 04:18:09',0.1),(3,136,'2013-06-12 04:24:07',0.1),(3,136,'2013-06-12 04:45:24',0.1),(3,136,'2013-06-12 05:01:35',0.1),(3,136,'2013-06-12 05:02:16',0.1),(3,137,'2013-05-13 03:14:53',0.1),(3,137,'2013-06-11 02:01:40',0.1),(3,137,'2013-06-11 02:29:51',0.1),(3,137,'2013-06-11 02:31:34',0.1),(3,137,'2013-06-11 02:41:41',0.1),(3,137,'2013-06-11 02:45:48',0.1),(3,137,'2013-06-12 03:03:31',0.1),(3,137,'2013-06-12 04:11:51',0.1),(3,137,'2013-06-12 04:13:27',0.1),(3,137,'2013-06-12 04:17:17',0.1),(3,137,'2013-06-12 04:18:09',0.1),(3,137,'2013-06-12 04:24:07',0.1),(3,137,'2013-06-12 04:45:24',0.1),(3,137,'2013-06-12 05:01:35',0.1),(3,137,'2013-06-12 05:02:16',0.1),(3,140,'2013-05-13 03:14:53',0.1),(3,140,'2013-06-11 02:01:40',0.1),(3,140,'2013-06-11 02:29:51',0.1),(3,140,'2013-06-11 02:31:34',0.1),(3,140,'2013-06-11 02:41:41',0.1),(3,140,'2013-06-11 02:45:48',0.1),(3,140,'2013-06-12 03:03:31',0.1),(3,140,'2013-06-12 04:11:51',0.1),(3,140,'2013-06-12 04:13:27',0.1),(3,140,'2013-06-12 04:17:17',0.1),(3,140,'2013-06-12 04:18:09',0.1),(3,140,'2013-06-12 04:24:07',0.1),(3,140,'2013-06-12 04:45:24',0.1),(3,140,'2013-06-12 05:01:35',0.1),(3,140,'2013-06-12 05:02:16',0.1),(3,141,'2013-05-13 03:14:53',0.1),(3,141,'2013-06-11 02:01:40',0.1),(3,141,'2013-06-11 02:29:51',0.1),(3,141,'2013-06-11 02:31:34',0.1),(3,141,'2013-06-11 02:41:41',0.1),(3,141,'2013-06-11 02:45:48',0.1),(3,141,'2013-06-12 03:03:31',0.1),(3,141,'2013-06-12 04:11:51',0.1),(3,141,'2013-06-12 04:13:27',0.1),(3,141,'2013-06-12 04:17:17',0.1),(3,141,'2013-06-12 04:18:09',0.1),(3,141,'2013-06-12 04:24:07',0.1),(3,141,'2013-06-12 04:45:24',0.1),(3,141,'2013-06-12 05:01:35',0.1),(3,141,'2013-06-12 05:02:16',0.1),(3,142,'2013-05-13 03:14:53',0.1),(3,142,'2013-06-11 02:01:40',0.1),(3,142,'2013-06-11 02:29:51',0.1),(3,142,'2013-06-11 02:31:34',0.1),(3,142,'2013-06-11 02:41:41',0.1),(3,142,'2013-06-11 02:45:48',0.1),(3,142,'2013-06-12 03:03:31',0.1),(3,142,'2013-06-12 04:11:51',0.1),(3,142,'2013-06-12 04:13:27',0.1),(3,142,'2013-06-12 04:17:17',0.1),(3,142,'2013-06-12 04:18:09',0.1),(3,142,'2013-06-12 04:24:07',0.1),(3,142,'2013-06-12 04:45:24',0.1),(3,142,'2013-06-12 05:01:35',0.1),(3,142,'2013-06-12 05:02:16',0.1),(3,143,'2013-05-13 03:14:53',0.1),(3,143,'2013-06-11 02:01:40',0.1),(3,143,'2013-06-11 02:29:51',0.1),(3,143,'2013-06-11 02:31:34',0.1),(3,143,'2013-06-11 02:41:41',0.1),(3,143,'2013-06-11 02:45:48',0.1),(3,143,'2013-06-12 03:03:31',0.1),(3,143,'2013-06-12 04:11:51',0.1),(3,143,'2013-06-12 04:13:27',0.1),(3,143,'2013-06-12 04:17:17',0.1),(3,143,'2013-06-12 04:18:09',0.1),(3,143,'2013-06-12 04:24:07',0.1),(3,143,'2013-06-12 04:45:24',0.1),(3,143,'2013-06-12 05:01:35',0.1),(3,143,'2013-06-12 05:02:16',0.1),(4,101,'2013-05-09 22:13:32',1.2),(4,101,'2013-05-09 22:13:58',1.2),(4,101,'2013-05-09 22:27:54',6.1),(4,101,'2013-05-09 22:45:22',6.1),(4,101,'2013-05-12 00:09:49',6.1),(4,101,'2013-05-12 03:56:24',2.83333),(4,101,'2013-05-13 01:28:14',2.83333),(4,101,'2013-05-13 03:14:53',2.83333),(4,101,'2013-06-11 02:01:40',0.1),(4,101,'2013-06-11 02:29:51',0.1),(4,101,'2013-06-11 02:31:34',0.1),(4,101,'2013-06-11 02:41:41',0.1),(4,101,'2013-06-11 02:45:48',0.1),(4,101,'2013-06-12 03:03:31',0.1),(4,101,'2013-06-12 04:11:51',0.1),(4,101,'2013-06-12 04:13:27',0.1),(4,101,'2013-06-12 04:17:17',0.1),(4,101,'2013-06-12 04:18:09',0.1),(4,101,'2013-06-12 04:24:07',0.1),(4,101,'2013-06-12 04:45:24',0.1),(4,101,'2013-06-12 05:01:35',0.1),(4,101,'2013-06-12 05:02:16',0.1),(4,123,'2013-05-09 22:13:32',0.1),(4,123,'2013-05-09 22:13:58',0.1),(4,123,'2013-05-09 22:27:54',0.1),(4,123,'2013-05-09 22:45:22',0.1),(4,123,'2013-05-12 00:09:49',11),(4,123,'2013-05-12 03:56:24',3.73333),(4,123,'2013-05-13 01:28:14',3.73333),(4,123,'2013-05-13 03:14:53',9.73333),(4,123,'2013-06-11 02:01:40',0.1),(4,123,'2013-06-11 02:29:51',0.1),(4,123,'2013-06-11 02:31:34',0.1),(4,123,'2013-06-11 02:41:41',0.1),(4,123,'2013-06-11 02:45:48',0.1),(4,123,'2013-06-12 03:03:31',0.1),(4,123,'2013-06-12 04:11:51',0.1),(4,123,'2013-06-12 04:13:27',0.1),(4,123,'2013-06-12 04:17:17',0.1),(4,123,'2013-06-12 04:18:09',0.1),(4,123,'2013-06-12 04:24:07',0.1),(4,123,'2013-06-12 04:45:24',0.1),(4,123,'2013-06-12 05:01:35',0.1),(4,123,'2013-06-12 05:02:16',0.1),(4,126,'2013-05-09 22:13:32',0.1),(4,126,'2013-05-09 22:13:58',0.1),(4,126,'2013-05-09 22:27:54',0.1),(4,126,'2013-05-09 22:45:22',0.1),(4,126,'2013-05-12 00:09:49',0.1),(4,126,'2013-05-12 03:56:24',0.1),(4,126,'2013-05-13 01:28:14',0.1),(4,126,'2013-05-13 03:14:53',0.1),(4,126,'2013-06-11 02:01:40',0.1),(4,126,'2013-06-11 02:29:51',0.1),(4,126,'2013-06-11 02:31:34',0.1),(4,126,'2013-06-11 02:41:41',0.1),(4,126,'2013-06-11 02:45:48',0.1),(4,126,'2013-06-12 03:03:31',0.1),(4,126,'2013-06-12 04:11:51',0.1),(4,126,'2013-06-12 04:13:27',0.1),(4,126,'2013-06-12 04:17:17',0.1),(4,126,'2013-06-12 04:18:09',0.1),(4,126,'2013-06-12 04:24:07',0.1),(4,126,'2013-06-12 04:45:24',0.1),(4,126,'2013-06-12 05:01:35',0.1),(4,126,'2013-06-12 05:02:16',0.1),(4,127,'2013-05-09 22:13:32',0.1),(4,127,'2013-05-09 22:13:58',0.1),(4,127,'2013-05-09 22:27:54',0.1),(4,127,'2013-05-09 22:45:22',0.1),(4,127,'2013-05-12 00:09:49',0.1),(4,127,'2013-05-12 03:56:24',0.1),(4,127,'2013-05-13 01:28:14',0.1),(4,127,'2013-05-13 03:14:53',0.1),(4,127,'2013-06-11 02:01:40',0.1),(4,127,'2013-06-11 02:29:51',0.1),(4,127,'2013-06-11 02:31:34',0.1),(4,127,'2013-06-11 02:41:41',0.1),(4,127,'2013-06-11 02:45:48',0.1),(4,127,'2013-06-12 03:03:31',0.1),(4,127,'2013-06-12 04:11:51',0.1),(4,127,'2013-06-12 04:13:27',0.1),(4,127,'2013-06-12 04:17:17',0.1),(4,127,'2013-06-12 04:18:09',0.1),(4,127,'2013-06-12 04:24:07',0.1),(4,127,'2013-06-12 04:45:24',0.1),(4,127,'2013-06-12 05:01:35',0.1),(4,127,'2013-06-12 05:02:16',0.1),(4,128,'2013-05-09 22:27:54',0.1),(4,128,'2013-05-09 22:45:22',0.1),(4,128,'2013-05-12 00:09:49',0.1),(4,128,'2013-05-12 03:56:24',0.1),(4,128,'2013-05-13 01:28:14',0.1),(4,128,'2013-05-13 03:14:53',0.1),(4,128,'2013-06-11 02:01:40',0.1),(4,128,'2013-06-11 02:29:51',0.1),(4,128,'2013-06-11 02:31:34',0.1),(4,128,'2013-06-11 02:41:41',0.1),(4,128,'2013-06-11 02:45:48',0.1),(4,128,'2013-06-12 03:03:31',0.1),(4,128,'2013-06-12 04:11:51',0.1),(4,128,'2013-06-12 04:13:27',0.1),(4,128,'2013-06-12 04:17:17',0.1),(4,128,'2013-06-12 04:18:09',0.1),(4,128,'2013-06-12 04:24:07',0.1),(4,128,'2013-06-12 04:45:24',0.1),(4,128,'2013-06-12 05:01:35',0.1),(4,128,'2013-06-12 05:02:16',0.1),(4,129,'2013-05-09 22:45:22',0.1),(4,129,'2013-05-12 00:09:49',0.1),(4,129,'2013-05-12 03:56:24',0.1),(4,129,'2013-05-13 01:28:14',0.1),(4,129,'2013-05-13 03:14:53',0.1),(4,129,'2013-06-11 02:01:40',0.1),(4,129,'2013-06-11 02:29:51',0.1),(4,129,'2013-06-11 02:31:34',0.1),(4,129,'2013-06-11 02:41:41',0.1),(4,129,'2013-06-11 02:45:48',0.1),(4,129,'2013-06-12 03:03:31',0.1),(4,129,'2013-06-12 04:11:51',0.1),(4,129,'2013-06-12 04:13:27',0.1),(4,129,'2013-06-12 04:17:17',0.1),(4,129,'2013-06-12 04:18:09',0.1),(4,129,'2013-06-12 04:24:07',0.1),(4,129,'2013-06-12 04:45:24',0.1),(4,129,'2013-06-12 05:01:35',0.1),(4,129,'2013-06-12 05:02:16',0.1),(4,130,'2013-05-12 00:09:49',0.1),(4,130,'2013-05-12 03:56:24',0.1),(4,130,'2013-05-13 01:28:14',0.1),(4,130,'2013-05-13 03:14:53',0.1),(4,130,'2013-06-11 02:01:40',0.1),(4,130,'2013-06-11 02:29:51',0.1),(4,130,'2013-06-11 02:31:34',0.1),(4,130,'2013-06-11 02:41:41',0.1),(4,130,'2013-06-11 02:45:48',0.1),(4,130,'2013-06-12 03:03:31',0.1),(4,130,'2013-06-12 04:11:51',0.1),(4,130,'2013-06-12 04:13:27',0.1),(4,130,'2013-06-12 04:17:17',0.1),(4,130,'2013-06-12 04:18:09',0.1),(4,130,'2013-06-12 04:24:07',0.1),(4,130,'2013-06-12 04:45:24',0.1),(4,130,'2013-06-12 05:01:35',0.1),(4,130,'2013-06-12 05:02:16',0.1),(4,131,'2013-05-12 00:09:49',0.1),(4,131,'2013-05-12 03:56:24',0.1),(4,131,'2013-05-13 01:28:14',0.1),(4,131,'2013-05-13 03:14:53',0.1),(4,131,'2013-06-11 02:01:40',0.1),(4,131,'2013-06-11 02:29:51',0.1),(4,131,'2013-06-11 02:31:34',0.1),(4,131,'2013-06-11 02:41:41',0.1),(4,131,'2013-06-11 02:45:48',0.1),(4,131,'2013-06-12 03:03:31',0.1),(4,131,'2013-06-12 04:11:51',0.1),(4,131,'2013-06-12 04:13:27',0.1),(4,131,'2013-06-12 04:17:17',0.1),(4,131,'2013-06-12 04:18:09',0.1),(4,131,'2013-06-12 04:24:07',0.1),(4,131,'2013-06-12 04:45:24',0.1),(4,131,'2013-06-12 05:01:35',0.1),(4,131,'2013-06-12 05:02:16',0.1),(4,132,'2013-05-12 00:09:49',0.1),(4,132,'2013-05-12 03:56:24',0.1),(4,132,'2013-05-13 01:28:14',0.1),(4,132,'2013-05-13 03:14:53',0.1),(4,132,'2013-06-11 02:01:40',0.1),(4,132,'2013-06-11 02:29:51',0.1),(4,132,'2013-06-11 02:31:34',0.1),(4,132,'2013-06-11 02:41:41',0.1),(4,132,'2013-06-11 02:45:48',0.1),(4,132,'2013-06-12 03:03:31',0.1),(4,132,'2013-06-12 04:11:51',0.1),(4,132,'2013-06-12 04:13:27',0.1),(4,132,'2013-06-12 04:17:17',0.1),(4,132,'2013-06-12 04:18:09',0.1),(4,132,'2013-06-12 04:24:07',0.1),(4,132,'2013-06-12 04:45:24',0.1),(4,132,'2013-06-12 05:01:35',0.1),(4,132,'2013-06-12 05:02:16',0.1),(4,136,'2013-05-12 03:56:24',0.1),(4,136,'2013-05-13 01:28:14',0.1),(4,136,'2013-05-13 03:14:53',0.1),(4,136,'2013-06-11 02:01:40',0.1),(4,136,'2013-06-11 02:29:51',0.1),(4,136,'2013-06-11 02:31:34',0.1),(4,136,'2013-06-11 02:41:41',0.1),(4,136,'2013-06-11 02:45:48',0.1),(4,136,'2013-06-12 03:03:31',0.1),(4,136,'2013-06-12 04:11:51',0.1),(4,136,'2013-06-12 04:13:27',0.1),(4,136,'2013-06-12 04:17:17',0.1),(4,136,'2013-06-12 04:18:09',0.1),(4,136,'2013-06-12 04:24:07',0.1),(4,136,'2013-06-12 04:45:24',0.1),(4,136,'2013-06-12 05:01:35',0.1),(4,136,'2013-06-12 05:02:16',0.1),(4,137,'2013-05-13 03:14:53',0.1),(4,137,'2013-06-11 02:01:40',0.1),(4,137,'2013-06-11 02:29:51',0.1),(4,137,'2013-06-11 02:31:34',0.1),(4,137,'2013-06-11 02:41:41',0.1),(4,137,'2013-06-11 02:45:48',0.1),(4,137,'2013-06-12 03:03:31',0.1),(4,137,'2013-06-12 04:11:51',0.1),(4,137,'2013-06-12 04:13:27',0.1),(4,137,'2013-06-12 04:17:17',0.1),(4,137,'2013-06-12 04:18:09',0.1),(4,137,'2013-06-12 04:24:07',0.1),(4,137,'2013-06-12 04:45:24',0.1),(4,137,'2013-06-12 05:01:35',0.1),(4,137,'2013-06-12 05:02:16',0.1),(4,140,'2013-05-13 03:14:53',0.1),(4,140,'2013-06-11 02:01:40',0.1),(4,140,'2013-06-11 02:29:51',0.1),(4,140,'2013-06-11 02:31:34',0.1),(4,140,'2013-06-11 02:41:41',0.1),(4,140,'2013-06-11 02:45:48',0.1),(4,140,'2013-06-12 03:03:31',0.1),(4,140,'2013-06-12 04:11:51',0.1),(4,140,'2013-06-12 04:13:27',0.1),(4,140,'2013-06-12 04:17:17',0.1),(4,140,'2013-06-12 04:18:09',0.1),(4,140,'2013-06-12 04:24:07',0.1),(4,140,'2013-06-12 04:45:24',0.1),(4,140,'2013-06-12 05:01:35',0.1),(4,140,'2013-06-12 05:02:16',0.1),(4,141,'2013-05-13 03:14:53',0.1),(4,141,'2013-06-11 02:01:40',0.1),(4,141,'2013-06-11 02:29:51',0.1),(4,141,'2013-06-11 02:31:34',0.1),(4,141,'2013-06-11 02:41:41',0.1),(4,141,'2013-06-11 02:45:48',0.1),(4,141,'2013-06-12 03:03:31',0.1),(4,141,'2013-06-12 04:11:51',0.1),(4,141,'2013-06-12 04:13:27',0.1),(4,141,'2013-06-12 04:17:17',0.1),(4,141,'2013-06-12 04:18:09',0.1),(4,141,'2013-06-12 04:24:07',0.1),(4,141,'2013-06-12 04:45:24',0.1),(4,141,'2013-06-12 05:01:35',0.1),(4,141,'2013-06-12 05:02:16',0.1),(4,142,'2013-05-13 03:14:53',0.1),(4,142,'2013-06-11 02:01:40',0.1),(4,142,'2013-06-11 02:29:51',0.1),(4,142,'2013-06-11 02:31:34',0.1),(4,142,'2013-06-11 02:41:41',0.1),(4,142,'2013-06-11 02:45:48',0.1),(4,142,'2013-06-12 03:03:31',0.1),(4,142,'2013-06-12 04:11:51',0.1),(4,142,'2013-06-12 04:13:27',0.1),(4,142,'2013-06-12 04:17:17',0.1),(4,142,'2013-06-12 04:18:09',0.1),(4,142,'2013-06-12 04:24:07',0.1),(4,142,'2013-06-12 04:45:24',0.1),(4,142,'2013-06-12 05:01:35',0.1),(4,142,'2013-06-12 05:02:16',0.1),(4,143,'2013-05-13 03:14:53',0.1),(4,143,'2013-06-11 02:01:40',0.1),(4,143,'2013-06-11 02:29:51',0.1),(4,143,'2013-06-11 02:31:34',0.1),(4,143,'2013-06-11 02:41:41',0.1),(4,143,'2013-06-11 02:45:48',0.1),(4,143,'2013-06-12 03:03:31',0.1),(4,143,'2013-06-12 04:11:51',0.1),(4,143,'2013-06-12 04:13:27',0.1),(4,143,'2013-06-12 04:17:17',0.1),(4,143,'2013-06-12 04:18:09',0.1),(4,143,'2013-06-12 04:24:07',0.1),(4,143,'2013-06-12 04:45:24',0.1),(4,143,'2013-06-12 05:01:35',0.1),(4,143,'2013-06-12 05:02:16',0.1),(5,101,'2013-05-09 22:13:32',0.1),(5,101,'2013-05-09 22:13:58',0.1),(5,101,'2013-05-09 22:27:54',0.1),(5,101,'2013-05-09 22:45:22',0.1),(5,101,'2013-05-12 00:09:49',0.1),(5,101,'2013-05-12 03:56:24',0.1),(5,101,'2013-05-13 01:28:14',0.1),(5,101,'2013-05-13 03:14:53',0.1),(5,101,'2013-06-11 02:01:40',0.1),(5,101,'2013-06-11 02:29:51',0.1),(5,101,'2013-06-11 02:31:34',0.1),(5,101,'2013-06-11 02:41:41',0.1),(5,101,'2013-06-11 02:45:48',0.1),(5,101,'2013-06-12 03:03:31',0.1),(5,101,'2013-06-12 04:11:51',0.1),(5,101,'2013-06-12 04:13:27',0.1),(5,101,'2013-06-12 04:17:17',0.1),(5,101,'2013-06-12 04:18:09',0.1),(5,101,'2013-06-12 04:24:07',0.1),(5,101,'2013-06-12 04:45:24',0.1),(5,101,'2013-06-12 05:01:35',0.1),(5,101,'2013-06-12 05:02:16',0.1),(5,123,'2013-05-09 22:13:32',0.1),(5,123,'2013-05-09 22:13:58',0.1),(5,123,'2013-05-09 22:27:54',0.1),(5,123,'2013-05-09 22:45:22',0.1),(5,123,'2013-05-12 00:09:49',80.8),(5,123,'2013-05-12 03:56:24',80.8),(5,123,'2013-05-13 01:28:14',80.8),(5,123,'2013-05-13 03:14:53',80.8),(5,123,'2013-06-11 02:45:48',11),(5,123,'2013-06-12 03:03:31',11),(5,123,'2013-06-12 04:11:51',11),(5,123,'2013-06-12 04:13:27',11),(5,123,'2013-06-12 04:17:17',11),(5,123,'2013-06-12 04:18:09',11),(5,123,'2013-06-12 04:24:07',11),(5,123,'2013-06-12 04:45:24',11),(5,123,'2013-06-12 05:01:35',11),(5,123,'2013-06-12 05:02:16',11),(5,126,'2013-05-09 22:13:32',0.1),(5,126,'2013-05-09 22:13:58',0.1),(5,126,'2013-05-09 22:27:54',0.1),(5,126,'2013-05-09 22:45:22',0.1),(5,126,'2013-05-12 00:09:49',0.1),(5,126,'2013-05-12 03:56:24',0.1),(5,126,'2013-05-13 01:28:14',0.1),(5,126,'2013-05-13 03:14:53',0.1),(5,126,'2013-06-11 02:01:40',0.1),(5,126,'2013-06-11 02:29:51',0.1),(5,126,'2013-06-11 02:31:34',0.1),(5,126,'2013-06-11 02:41:41',0.1),(5,126,'2013-06-11 02:45:48',0.1),(5,126,'2013-06-12 03:03:31',0.1),(5,126,'2013-06-12 04:11:51',0.1),(5,126,'2013-06-12 04:13:27',0.1),(5,126,'2013-06-12 04:17:17',0.1),(5,126,'2013-06-12 04:18:09',0.1),(5,126,'2013-06-12 04:24:07',0.1),(5,126,'2013-06-12 04:45:24',0.1),(5,126,'2013-06-12 05:01:35',0.1),(5,126,'2013-06-12 05:02:16',0.1),(5,127,'2013-05-09 22:13:32',0.1),(5,127,'2013-05-09 22:13:58',0.1),(5,127,'2013-05-09 22:27:54',0.1),(5,127,'2013-05-09 22:45:22',0.1),(5,127,'2013-05-12 00:09:49',0.1),(5,127,'2013-05-12 03:56:24',0.1),(5,127,'2013-05-13 01:28:14',0.1),(5,127,'2013-05-13 03:14:53',0.1),(5,127,'2013-06-11 02:01:40',0.1),(5,127,'2013-06-11 02:29:51',0.1),(5,127,'2013-06-11 02:31:34',0.1),(5,127,'2013-06-11 02:41:41',0.1),(5,127,'2013-06-11 02:45:48',0.1),(5,127,'2013-06-12 03:03:31',0.1),(5,127,'2013-06-12 04:11:51',0.1),(5,127,'2013-06-12 04:13:27',0.1),(5,127,'2013-06-12 04:17:17',0.1),(5,127,'2013-06-12 04:18:09',0.1),(5,127,'2013-06-12 04:24:07',0.1),(5,127,'2013-06-12 04:45:24',0.1),(5,127,'2013-06-12 05:01:35',0.1),(5,127,'2013-06-12 05:02:16',0.1),(5,128,'2013-05-09 22:27:54',0.1),(5,128,'2013-05-09 22:45:22',0.1),(5,128,'2013-05-12 00:09:49',0.1),(5,128,'2013-05-12 03:56:24',0.1),(5,128,'2013-05-13 01:28:14',0.1),(5,128,'2013-05-13 03:14:53',0.1),(5,128,'2013-06-11 02:01:40',0.1),(5,128,'2013-06-11 02:29:51',0.1),(5,128,'2013-06-11 02:31:34',0.1),(5,128,'2013-06-11 02:41:41',0.1),(5,128,'2013-06-11 02:45:48',0.1),(5,128,'2013-06-12 03:03:31',0.1),(5,128,'2013-06-12 04:11:51',0.1),(5,128,'2013-06-12 04:13:27',0.1),(5,128,'2013-06-12 04:17:17',0.1),(5,128,'2013-06-12 04:18:09',0.1),(5,128,'2013-06-12 04:24:07',0.1),(5,128,'2013-06-12 04:45:24',0.1),(5,128,'2013-06-12 05:01:35',0.1),(5,128,'2013-06-12 05:02:16',0.1),(5,129,'2013-05-09 22:45:22',0.1),(5,129,'2013-05-12 00:09:49',0.1),(5,129,'2013-05-12 03:56:24',0.1),(5,129,'2013-05-13 01:28:14',0.1),(5,129,'2013-05-13 03:14:53',0.1),(5,129,'2013-06-11 02:01:40',0.1),(5,129,'2013-06-11 02:29:51',0.1),(5,129,'2013-06-11 02:31:34',0.1),(5,129,'2013-06-11 02:41:41',0.1),(5,129,'2013-06-11 02:45:48',0.1),(5,129,'2013-06-12 03:03:31',0.1),(5,129,'2013-06-12 04:11:51',0.1),(5,129,'2013-06-12 04:13:27',0.1),(5,129,'2013-06-12 04:17:17',0.1),(5,129,'2013-06-12 04:18:09',0.1),(5,129,'2013-06-12 04:24:07',0.1),(5,129,'2013-06-12 04:45:24',0.1),(5,129,'2013-06-12 05:01:35',0.1),(5,129,'2013-06-12 05:02:16',0.1),(5,130,'2013-05-12 00:09:49',0.1),(5,130,'2013-05-12 03:56:24',0.1),(5,130,'2013-05-13 01:28:14',0.1),(5,130,'2013-05-13 03:14:53',0.1),(5,130,'2013-06-11 02:01:40',0.1),(5,130,'2013-06-11 02:29:51',0.1),(5,130,'2013-06-11 02:31:34',0.1),(5,130,'2013-06-11 02:41:41',0.1),(5,130,'2013-06-11 02:45:48',0.1),(5,130,'2013-06-12 03:03:31',0.1),(5,130,'2013-06-12 04:11:51',0.1),(5,130,'2013-06-12 04:13:27',0.1),(5,130,'2013-06-12 04:17:17',0.1),(5,130,'2013-06-12 04:18:09',0.1),(5,130,'2013-06-12 04:24:07',0.1),(5,130,'2013-06-12 04:45:24',0.1),(5,130,'2013-06-12 05:01:35',0.1),(5,130,'2013-06-12 05:02:16',0.1),(5,131,'2013-05-12 00:09:49',0.1),(5,131,'2013-05-12 03:56:24',0.1),(5,131,'2013-05-13 01:28:14',0.1),(5,131,'2013-05-13 03:14:53',0.1),(5,131,'2013-06-11 02:01:40',0.1),(5,131,'2013-06-11 02:29:51',0.1),(5,131,'2013-06-11 02:31:34',0.1),(5,131,'2013-06-11 02:41:41',0.1),(5,131,'2013-06-11 02:45:48',0.1),(5,131,'2013-06-12 03:03:31',0.1),(5,131,'2013-06-12 04:11:51',0.1),(5,131,'2013-06-12 04:13:27',0.1),(5,131,'2013-06-12 04:17:17',0.1),(5,131,'2013-06-12 04:18:09',0.1),(5,131,'2013-06-12 04:24:07',0.1),(5,131,'2013-06-12 04:45:24',0.1),(5,131,'2013-06-12 05:01:35',0.1),(5,131,'2013-06-12 05:02:16',0.1),(5,132,'2013-05-12 00:09:49',0.1),(5,132,'2013-05-12 03:56:24',0.1),(5,132,'2013-05-13 01:28:14',0.1),(5,132,'2013-05-13 03:14:53',0.1),(5,132,'2013-06-11 02:01:40',0.1),(5,132,'2013-06-11 02:29:51',0.1),(5,132,'2013-06-11 02:31:34',0.1),(5,132,'2013-06-11 02:41:41',0.1),(5,132,'2013-06-11 02:45:48',0.1),(5,132,'2013-06-12 03:03:31',0.1),(5,132,'2013-06-12 04:11:51',0.1),(5,132,'2013-06-12 04:13:27',0.1),(5,132,'2013-06-12 04:17:17',0.1),(5,132,'2013-06-12 04:18:09',0.1),(5,132,'2013-06-12 04:24:07',0.1),(5,132,'2013-06-12 04:45:24',0.1),(5,132,'2013-06-12 05:01:35',0.1),(5,132,'2013-06-12 05:02:16',0.1),(5,136,'2013-05-12 03:56:24',0.1),(5,136,'2013-05-13 01:28:14',0.1),(5,136,'2013-05-13 03:14:53',0.1),(5,136,'2013-06-11 02:01:40',0.1),(5,136,'2013-06-11 02:29:51',0.1),(5,136,'2013-06-11 02:31:34',0.1),(5,136,'2013-06-11 02:41:41',0.1),(5,136,'2013-06-11 02:45:48',0.1),(5,136,'2013-06-12 03:03:31',0.1),(5,136,'2013-06-12 04:11:51',0.1),(5,136,'2013-06-12 04:13:27',0.1),(5,136,'2013-06-12 04:17:17',0.1),(5,136,'2013-06-12 04:18:09',0.1),(5,136,'2013-06-12 04:24:07',0.1),(5,136,'2013-06-12 04:45:24',0.1),(5,136,'2013-06-12 05:01:35',0.1),(5,136,'2013-06-12 05:02:16',0.1),(5,137,'2013-05-13 03:14:53',0.1),(5,137,'2013-06-11 02:01:40',0.1),(5,137,'2013-06-11 02:29:51',0.1),(5,137,'2013-06-11 02:31:34',0.1),(5,137,'2013-06-11 02:41:41',0.1),(5,137,'2013-06-11 02:45:48',0.1),(5,137,'2013-06-12 03:03:31',0.1),(5,137,'2013-06-12 04:11:51',0.1),(5,137,'2013-06-12 04:13:27',0.1),(5,137,'2013-06-12 04:17:17',0.1),(5,137,'2013-06-12 04:18:09',0.1),(5,137,'2013-06-12 04:24:07',0.1),(5,137,'2013-06-12 04:45:24',0.1),(5,137,'2013-06-12 05:01:35',0.1),(5,137,'2013-06-12 05:02:16',0.1),(5,140,'2013-05-13 03:14:53',0.1),(5,140,'2013-06-11 02:01:40',0.1),(5,140,'2013-06-11 02:29:51',0.1),(5,140,'2013-06-11 02:31:34',0.1),(5,140,'2013-06-11 02:41:41',0.1),(5,140,'2013-06-11 02:45:48',0.1),(5,140,'2013-06-12 03:03:31',0.1),(5,140,'2013-06-12 04:11:51',0.1),(5,140,'2013-06-12 04:13:27',0.1),(5,140,'2013-06-12 04:17:17',0.1),(5,140,'2013-06-12 04:18:09',0.1),(5,140,'2013-06-12 04:24:07',0.1),(5,140,'2013-06-12 04:45:24',0.1),(5,140,'2013-06-12 05:01:35',0.1),(5,140,'2013-06-12 05:02:16',0.1),(5,141,'2013-05-13 03:14:53',0.1),(5,141,'2013-06-11 02:01:40',0.1),(5,141,'2013-06-11 02:29:51',0.1),(5,141,'2013-06-11 02:31:34',0.1),(5,141,'2013-06-11 02:41:41',0.1),(5,141,'2013-06-11 02:45:48',0.1),(5,141,'2013-06-12 03:03:31',0.1),(5,141,'2013-06-12 04:11:51',0.1),(5,141,'2013-06-12 04:13:27',0.1),(5,141,'2013-06-12 04:17:17',0.1),(5,141,'2013-06-12 04:18:09',0.1),(5,141,'2013-06-12 04:24:07',0.1),(5,141,'2013-06-12 04:45:24',0.1),(5,141,'2013-06-12 05:01:35',0.1),(5,141,'2013-06-12 05:02:16',0.1),(5,142,'2013-05-13 03:14:53',0.1),(5,142,'2013-06-11 02:01:40',0.1),(5,142,'2013-06-11 02:29:51',0.1),(5,142,'2013-06-11 02:31:34',0.1),(5,142,'2013-06-11 02:41:41',0.1),(5,142,'2013-06-11 02:45:48',0.1),(5,142,'2013-06-12 03:03:31',0.1),(5,142,'2013-06-12 04:11:51',0.1),(5,142,'2013-06-12 04:13:27',0.1),(5,142,'2013-06-12 04:17:17',0.1),(5,142,'2013-06-12 04:18:09',0.1),(5,142,'2013-06-12 04:24:07',0.1),(5,142,'2013-06-12 04:45:24',0.1),(5,142,'2013-06-12 05:01:35',0.1),(5,142,'2013-06-12 05:02:16',0.1),(5,143,'2013-05-13 03:14:53',0.1),(5,143,'2013-06-11 02:01:40',0.1),(5,143,'2013-06-11 02:29:51',0.1),(5,143,'2013-06-11 02:31:34',0.1),(5,143,'2013-06-11 02:41:41',0.1),(5,143,'2013-06-11 02:45:48',0.1),(5,143,'2013-06-12 03:03:31',0.1),(5,143,'2013-06-12 04:11:51',0.1),(5,143,'2013-06-12 04:13:27',0.1),(5,143,'2013-06-12 04:17:17',0.1),(5,143,'2013-06-12 04:18:09',0.1),(5,143,'2013-06-12 04:24:07',0.1),(5,143,'2013-06-12 04:45:24',0.1),(5,143,'2013-06-12 05:01:35',0.1),(5,143,'2013-06-12 05:02:16',0.1);
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
INSERT INTO `positions` VALUES (1,'analytic',1),(2,'salesman',2),(3,'sysadmin',3),(4,'manager',4),(5,'renter',2);
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

-- Dump completed on 2013-06-12  5:15:21
CREATE DATABASE  IF NOT EXISTS `users` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `users`;
-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: users
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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `ix_auth_username` (`username`,`authority`),
  CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('Analytic','EMPLOYEE'),('Manager','EMPLOYEE'),('Renter','EMPLOYEE'),('Salesman','EMPLOYEE'),('test','EMPLOYEE'),('test','TEST'),('Testtest20','EMPLOYEE'),('Tst1','EMPLOYEE'),('TTest1','EMPLOYEE'),('TTest2','EMPLOYEE'),('Ttest3','EMPLOYEE'),('Ttest4','EMPLOYEE'),('Ttest5','EMPLOYEE'),('TTest6','EMPLOYEE'),('Ttest7','EMPLOYEE'),('Ttest8','EMPLOYEE');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT 'pass',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Analytic','pass',1),('Manager','pass',1),('Renter','pass',1),('Salesman','pass',1),('test','test',1),('Testtest20','pass',1),('Tst1','pass',1),('TTest1','pass',1),('TTest2','pass',1),('Ttest3','pass',1),('Ttest4','pass',1),('Ttest5','pass',1),('TTest6','pass',1),('Ttest7','pass',1),('Ttest8','pass',1);
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

-- Dump completed on 2013-06-12  5:15:21

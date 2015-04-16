-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: lovesports
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `username` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `admin` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('steven05jiang@gmail.com','Admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `groupName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_idx` (`username`,`groupName`),
  KEY `blog2group_idx` (`groupName`),
  CONSTRAINT `blog2group` FOREIGN KEY (`groupName`) REFERENCES `group` (`name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `blog2user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'blog1','steven05jiang@gmail.com','Forum'),(2,'blog2','steven05jiang@gmail.com','Forum'),(3,'blog3','steven05jiang@gmail.com','Forum');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogreference`
--

DROP TABLE IF EXISTS `blogreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogreference` (
  `blogId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`blogId`,`categoryId`),
  KEY `reference2_idx` (`categoryId`),
  CONSTRAINT `reference2blog` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reference2category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogreference`
--

LOCK TABLES `blogreference` WRITE;
/*!40000 ALTER TABLE `blogreference` DISABLE KEYS */;
INSERT INTO `blogreference` VALUES (1,1);
/*!40000 ALTER TABLE `blogreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `homepage` int(11) DEFAULT NULL,
  `editor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_idx` (`homepage`),
  KEY `category2_idx` (`editor`),
  CONSTRAINT `category1` FOREIGN KEY (`homepage`) REFERENCES `homepage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `category2` FOREIGN KEY (`editor`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Basketball','Popular sport',1,'steven05jiang@gmail.com'),(2,'Football','Let\'s rock',1,'zgjxxzn@gmail.com'),(3,'NBA',NULL,NULL,NULL),(4,'CBA',NULL,NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `blogId` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `collection2_idx` (`blogId`),
  KEY `collection1` (`username`),
  CONSTRAINT `collection1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection2` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,'zgjxxzn@gmail.com',1,'Mark!');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `blogId` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commend1_idx` (`username`),
  KEY `commend2_idx` (`blogId`),
  CONSTRAINT `commend1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `commend2` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `following`
--

DROP TABLE IF EXISTS `following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `following` (
  `follower` varchar(45) NOT NULL,
  `followee` varchar(45) NOT NULL,
  PRIMARY KEY (`follower`,`followee`),
  KEY `followee2user_idx` (`followee`),
  CONSTRAINT `followee2user` FOREIGN KEY (`followee`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `follower2user` FOREIGN KEY (`follower`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `following`
--

LOCK TABLES `following` WRITE;
/*!40000 ALTER TABLE `following` DISABLE KEYS */;
/*!40000 ALTER TABLE `following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `group2user_idx` (`username`),
  CONSTRAINT `group2user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('Basketball','We love basketball','steven05jiang@gmail.com'),('Football','Here we go','steven05jiang@gmail.com'),('Forum','Sports forum for all users','steven05jiang@gmail.com');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage`
--

DROP TABLE IF EXISTS `homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homepage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage`
--

LOCK TABLES `homepage` WRITE;
/*!40000 ALTER TABLE `homepage` DISABLE KEYS */;
INSERT INTO `homepage` VALUES (1,'Lovesports',NULL,NULL);
/*!40000 ALTER TABLE `homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img`
--

DROP TABLE IF EXISTS `img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `blogId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `img1_idx` (`blogId`),
  KEY `img2_idx` (`categoryId`),
  CONSTRAINT `img1` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `img2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img`
--

LOCK TABLES `img` WRITE;
/*!40000 ALTER TABLE `img` DISABLE KEYS */;
INSERT INTO `img` VALUES (1,'img1',NULL,1,1);
/*!40000 ALTER TABLE `img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `including`
--

DROP TABLE IF EXISTS `including`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `including` (
  `hostId` int(11) NOT NULL,
  `subId` int(11) NOT NULL,
  PRIMARY KEY (`hostId`,`subId`),
  KEY `including2_idx` (`subId`),
  CONSTRAINT `including1` FOREIGN KEY (`hostId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `including2` FOREIGN KEY (`subId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `including`
--

LOCK TABLES `including` WRITE;
/*!40000 ALTER TABLE `including` DISABLE KEYS */;
INSERT INTO `including` VALUES (1,3),(1,4);
/*!40000 ALTER TABLE `including` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stamp`
--

DROP TABLE IF EXISTS `stamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stamp` (
  `blogId` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`blogId`,`username`),
  KEY `stamp2user_idx` (`username`),
  CONSTRAINT `stamp2blog` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stamp2user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stamp`
--

LOCK TABLES `stamp` WRITE;
/*!40000 ALTER TABLE `stamp` DISABLE KEYS */;
/*!40000 ALTER TABLE `stamp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `username` varchar(45) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`username`,`categoryId`),
  KEY `subscription1_idx` (`username`),
  KEY `subscription2_idx` (`categoryId`),
  CONSTRAINT `subscription1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscription2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(1024) DEFAULT NULL,
  `blogId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `text_idx` (`blogId`),
  CONSTRAINT `text` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'I love basketball!',1),(2,'Let\'s go Skiing',2),(3,'I hate homework',3);
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Alice@gmail.com','alice','Alice','Alice','Wonderland','Alice@gmail.com'),('Bob@gmail.com','bob','Bob',NULL,NULL,NULL),('Clare@gmail.com','clare','Clare',NULL,NULL,NULL),('David@qq.com','david','David',NULL,NULL,NULL),('Ella@163.com','ella','Ella',NULL,NULL,NULL),('Frank@hotmail.com','frank','Frank',NULL,NULL,NULL),('Grace@gmail.com','grace','Grace','Grace','Cao','Grace@gmail.com'),('Hera@gmail.com','hera','Hera','Hera','Dove','Hera@gmail.com'),('shen.hu@husky.neu.edu','shenhualong','Hu','Hualong','Shen','shen.hu@husky.neu.edu'),('steven05jiang@gmail.com','jiangwei','Jiang','Wei','Jiang','steven05jiang@gmail.com'),('zgjxxzn@gmail.com','xiongzinan','Xiong','Zinan','Xiong','zgjxxzn@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-16 13:29:58

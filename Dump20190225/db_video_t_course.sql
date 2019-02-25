-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db_video
-- ------------------------------------------------------
-- Server version	5.7.21-1

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
-- Table structure for table `t_course`
--

DROP TABLE IF EXISTS `t_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(45) NOT NULL,
  `v_describe` varchar(45) DEFAULT NULL,
  `v_url` varchar(100) NOT NULL,
  `base_advance` int(11) NOT NULL,
  `uploadtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_course`
--

LOCK TABLES `t_course` WRITE;
/*!40000 ALTER TABLE `t_course` DISABLE KEYS */;
INSERT INTO `t_course` VALUES (25,'javamessd','java第一','/uploads/video/1.mp4',2,'2018-12-26 12:51:10',33),(28,'打算大多','c语言','/uploads/video/1.mp4',0,'2018-12-26 12:51:11',35),(29,'大叔大婶','java基础部分','/uploads/video/1.mp4',0,'2018-12-26 12:51:12',22),(32,'javasesss','java第一','/uploads/video/1.mp4',0,'2018-12-26 12:51:13',22),(33,'啊啊下','jcaaas','/uploads/video/1.mp4',1,'2018-12-26 12:51:14',22),(34,'php深入教学','jcaaas','/uploads/video/1.mp4',1,'2018-12-26 12:51:15',38),(35,'java','jcaaas','/uploads/video/xiaoli.mp4',2,'2018-12-26 12:51:16',22),(36,'在线视频学习平台的设计与实现','java企业级开发的专用的框架','/uploads/video/1.mp4',2,'2018-12-26 12:51:17',33),(37,'c语言程序设计','专业做底层的编程语言','/uploads/video/1.mp4',1,'2018-12-26 12:51:18',35),(48,'javaee视频','java第一','/uploads/video/xiaoli.mp4',1,'2018-12-26 12:51:14',33);
/*!40000 ALTER TABLE `t_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-25 17:45:11

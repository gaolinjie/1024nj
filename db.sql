-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: 1024nj
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.12.04.2

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
-- Current Database: `1024nj`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `1024nj` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `1024nj`;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_type` int(11) DEFAULT NULL,
  `show` int(11) DEFAULT NULL,
  `title` text,
  `img` text,
  `link` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatar`
--

DROP TABLE IF EXISTS `avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` text,
  `gender` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
INSERT INTO `avatar` VALUES (1,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1co4egzj30wt0wtq5b.jpg','男'),(2,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cozuyhj30wt0wtgny.jpg','男'),(3,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cpp9e8j30wt0wtdhz.jpg','男'),(4,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cqqws2j30wt0wt40r.jpg','男'),(5,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1crpp62j30wt0wtdi2.jpg','男'),(6,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cs8hxcj30wt0wtjto.jpg','男'),(7,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1ctddfnj30wt0wtwgl.jpg','男'),(8,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cu8cm4j30wt0wtabq.jpg','男'),(9,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cvbmakj30wt0wtjtx.jpg','男'),(10,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1co4egzj30wt0wtq5b.jpg','女'),(11,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cozuyhj30wt0wtgny.jpg','女'),(12,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cpp9e8j30wt0wtdhz.jpg','女'),(13,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cqqws2j30wt0wt40r.jpg','女'),(14,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1crpp62j30wt0wtdi2.jpg','女'),(15,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cs8hxcj30wt0wtjto.jpg','女'),(16,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1ctddfnj30wt0wtwgl.jpg','女'),(17,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cu8cm4j30wt0wtabq.jpg','女'),(18,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cvbmakj30wt0wtjtx.jpg','女');
/*!40000 ALTER TABLE `avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `balance_type` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT '0',
  `balance` int(11) DEFAULT '0',
  `post_id` int(11) DEFAULT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance`
--

LOCK TABLES `balance` WRITE;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
INSERT INTO `balance` VALUES (1,1,2,-20,1980,1,NULL,NULL,'2015-12-25 00:21:07'),(2,2,2,-20,1980,2,NULL,NULL,'2016-02-01 22:09:18'),(3,3,2,-20,1980,3,NULL,NULL,'2016-02-01 22:41:18'),(4,2,3,-5,1975,3,2,NULL,'2016-02-01 23:23:08'),(5,3,4,5,1985,3,2,2,'2016-02-01 23:23:08'),(6,4,3,-5,1995,3,3,NULL,'2016-02-02 01:11:38'),(7,3,4,5,1990,3,3,4,'2016-02-02 01:11:38'),(8,4,2,-20,1975,4,NULL,NULL,'2016-02-02 01:18:41'),(9,3,2,-20,1970,5,NULL,NULL,'2016-02-03 23:02:45'),(10,2,2,-20,1955,6,NULL,NULL,'2016-02-04 14:06:00'),(11,2,3,-5,1950,4,7,NULL,'2016-02-04 14:17:30'),(12,4,4,5,1980,4,7,2,'2016-02-04 14:17:30'),(13,3,3,-5,1965,6,8,NULL,'2016-02-04 16:36:00'),(14,2,4,5,1955,6,8,3,'2016-02-04 16:36:00');
/*!40000 ALTER TABLE `balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance_type`
--

DROP TABLE IF EXISTS `balance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` text,
  `balance_text1` text,
  `balance_text2` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance_type`
--

LOCK TABLES `balance_type` WRITE;
/*!40000 ALTER TABLE `balance_type` DISABLE KEYS */;
INSERT INTO `balance_type` VALUES (1,'初始资本','获得初始资本','2000 铜币'),(2,'创建主题','创建了','主题'),(3,'创建回复','创建了','回复'),(4,'主题回复收益 ','收到 ','的回复'),(5,'赞同别人','发送对','的赞同'),(6,'收到赞同','收到','的赞同'),(7,'撤销赞同','撤销对','的赞同'),(8,'赞同被撤销','赞同被','撤销'),(9,'发送谢意','发送对','的谢意'),(10,'收到谢意','收到','的谢意'),(11,'发送邀请','发送','邀请'),(12,'邀请成功','邀请','成功');
/*!40000 ALTER TABLE `balance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `order_num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'足球',0),(2,'NBA',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed`
--

DROP TABLE IF EXISTS `feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_title` text,
  `feed_type` text,
  `post_type` text,
  `feed_uuid` text,
  `post_id` int(11) DEFAULT NULL,
  `post_id2` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed`
--

LOCK TABLES `feed` WRITE;
/*!40000 ALTER TABLE `feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `obj_type` text,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (1,1,1,'u','2015-12-25 00:19:02'),(2,2,2,'u','2016-02-01 21:45:52'),(3,3,3,'u','2016-02-01 22:09:32'),(4,4,4,'u','2016-02-02 01:08:48'),(5,5,5,'u','2016-02-03 10:54:14');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icode`
--

DROP TABLE IF EXISTS `icode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` text,
  `used` int(11) DEFAULT '0',
  `user_created` int(11) DEFAULT NULL,
  `user_used` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icode`
--

LOCK TABLES `icode` WRITE;
/*!40000 ALTER TABLE `icode` DISABLE KEYS */;
/*!40000 ALTER TABLE `icode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite`
--

DROP TABLE IF EXISTS `invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `readed` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite`
--

LOCK TABLES `invite` WRITE;
/*!40000 ALTER TABLE `invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live`
--

DROP TABLE IF EXISTS `live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sport` text,
  `game` text,
  `team` text,
  `signal_text` text,
  `hot` int(11) DEFAULT '0',
  `post_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live`
--

LOCK TABLES `live` WRITE;
/*!40000 ALTER TABLE `live` DISABLE KEYS */;
/*!40000 ALTER TABLE `live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nav`
--

DROP TABLE IF EXISTS `nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_name` text,
  `tag_id` int(11) DEFAULT NULL,
  `nav_type` text,
  `order_num` int(11) DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `is_sub` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nav`
--

LOCK TABLES `nav` WRITE;
/*!40000 ALTER TABLE `nav` DISABLE KEYS */;
INSERT INTO `nav` VALUES (1,'南京IT圈',NULL,'itbbs',1,NULL,0),(2,'灌水',1,'itbbs',2,NULL,0),(3,'软件外包',1,'itbbs',3,NULL,0),(4,'求职招聘',1,'itbbs',3,NULL,0);
/*!40000 ALTER TABLE `nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `thumb` text,
  `intro` text,
  `category` int(11) DEFAULT NULL,
  `post_num` int(11) DEFAULT '0',
  `follow_num` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'南京IT圈','','',1,0,0,'2015-08-27 00:00:00'),(2,'灌水','','',1,0,0,'2015-08-27 00:00:00'),(3,'软件外包','','',1,0,0,'2015-08-27 00:00:00'),(4,'求职招聘','','',2,0,0,'2015-08-27 00:00:00');
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `notice_type` int(11) DEFAULT NULL,
  `readed` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,3,2,3,2,1,1,'2016-02-01 23:23:08'),(2,3,4,3,3,1,1,'2016-02-02 01:11:38'),(3,4,2,4,7,1,1,'2016-02-04 14:17:30'),(4,2,3,6,8,1,0,'2016-02-04 16:36:00');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_type`
--

DROP TABLE IF EXISTS `notice_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_type`
--

LOCK TABLES `notice_type` WRITE;
/*!40000 ALTER TABLE `notice_type` DISABLE KEYS */;
INSERT INTO `notice_type` VALUES (1,'回复了你的主题'),(2,'收藏了你的主题'),(3,'感谢了你的主题'),(4,'赞同了你的回复'),(5,'感谢了你的回复'),(6,'在主题中提到了你'),(7,'在回复中提到了你'),(15,'关注了你'),(16,'赞了你的主题');
/*!40000 ALTER TABLE `notice_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_video`
--

DROP TABLE IF EXISTS `object_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `obj_type` text,
  `order_num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_video`
--

LOCK TABLES `object_video` WRITE;
/*!40000 ALTER TABLE `object_video` DISABLE KEYS */;
INSERT INTO `object_video` VALUES (1,1,1,'post',0),(2,2,1,'post',0),(3,3,1,'post',0),(4,4,1,'post',0),(5,5,1,'post',0);
/*!40000 ALTER TABLE `object_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `role` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,0,'普通用户'),(2,1,'高级用户'),(3,2,'超级用户'),(4,11,'普通管理员'),(5,22,'高级管理员'),(6,13,'超级管理员'),(7,-1,'禁止提问'),(8,-2,'禁止回答');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `content` text,
  `post_type` text,
  `feed_type` text,
  `open_type` text,
  `post_link` text,
  `thumb` text,
  `up_num` int(11) DEFAULT '0',
  `down_num` int(11) DEFAULT '0',
  `reply_num` int(11) DEFAULT '0',
  `view_num` int(11) DEFAULT '0',
  `follow_num` int(11) DEFAULT '0',
  `author_id` int(11) DEFAULT NULL,
  `last_reply` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'hello world!','<p>hello world!<br></p>','bbs','bbs',NULL,NULL,NULL,0,0,0,74,1,1,NULL,'2015-12-25 00:21:07','2015-12-25 00:21:07'),(2,'ffdsf','<p>sf ffdsf</p>','bbs','bbs',NULL,NULL,NULL,0,0,0,61,1,2,NULL,'2016-02-01 22:09:18','2016-02-01 22:09:18'),(3,'奔三之际，任性一把 ——从华为南研所裸辞后的一些体会和感想','<p><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">“国际惯例”有一阵子了，最近尚算清闲，写写裸辞后的一些体会和感想。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">关于离开</strong><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">知乎上“你为什么从腾讯离职”、“你为什么从百度离职”这类话题长盛不衰，华为的话题下，也有这样的讨论。不同公司、不同部门乃至不同的人，从某种程度上来说，无论是来是去都有相似的缘由，参与的人多了，免不了抱怨、吐槽，于事无补，于人无益。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">我的离开，有长期出差几乎只有法定节假日才能回家这样的因素在，但最关键的一点还是工作本身。2011年社招进来，从Java+Flex开发到MDE，再后来转SE，在华为来说，这个节奏不算多快但也不算慢，走得挺稳当，与领导、同事相处也很融洽。也许，就这么一直走下去，人生也不会太差。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">只是，渐渐会有一些不安，得空反思，发觉自己在做的这些事于个人成长而言价值不大。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">人太浮于事，如同浮萍，随波逐荡。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">今年年初，决心离开南研所，并离开南京这座城市。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">正如离开南研所去了Amazon的一个兄弟说的那样，南京太小，圈子太小，视野太小。华为南研所只是南京雨花区软件大道上的那么一块园区，但对于一部分人而言，南京所能给你的，比南研所还要少。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">这番话说出来有些沉痛，我2004年到南京，读书、恋爱、工作、生活，已十年有余，说南京是第二故乡也不为过，因此这一次离开，是经过了深思熟虑的决定，虽有依恋，但走得义无反顾。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">走出华为才知道的一些坑</strong><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">真正关心你为什么从华为离职的人，往往都是那些打算进华为的人；</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">打算离开华为的人，更关心离开华为后你去了哪里，去的路上有什么坑。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">我来说说这些坑。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">第一个坑，其实是在华为挖下的，而且很大。就是上文提到的，个人修为不够精深。不过这个问题不能全赖华为，你选了大平台就要相应地承担它带给你的副作用。BAT的一些同学也有相似的烦恼，还有360，接触过360出来的混子，我想他们进360的时候绝不是立志要做个混子吧。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">第二个坑是部分企业“拿来即用”的用人理念。华为的系统工程师与互联网公司所定义的架构师区别很大，因此很难沿着架构师这个Title继续走，我尝试着投过阿里的相关岗位，面试时发现能力差距还是比较明显的。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">但从需求分析、产品设计、敏捷项目管理等方面来说，与大部分互联网公司产品岗的定位相符。然而由于以往做的不是纯互联网产品，有的公司不愿意承担这样的用人风险，简单来说，就是华为出身，跨领域找工作并不见得那么好找。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">在脉脉上我曾发过一条实名动态，引起了不少求职者的共鸣：“</span><span style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; color: rgb(0, 128, 128); background-color: rgb(245, 245, 245);\">太多的招聘方过多地关注求职者曾经是什么，而忽略了未来能成为什么</span><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">”。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">其实一个人如果在某个领域做得可圈可点，在相近意义的事情上，通常都会做得不错，甚至更大范围的事情上，也值得托付。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">还有一个说大不大说小不小的坑，之前在心声有写过：华为的信息安全很牛X，但是导致开发氛围比较沉寂，与外部隔绝。很多互联网公司要求看你的技术文章，Github代码、Stackoverflow/邮件组/Quora/SegmentFault等网站的活跃度及回答，我除了个人博客（说得好像经常更似的），其它平台都没有深入过，大家引以为戒。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">正确求职的姿势</strong><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">传统招聘网站（51job、智联）：招聘信息相对齐全，全行业、大小公司都有，没有针对性，对于求职者信息筛选的成本比较高。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; color: rgb(102, 102, 153); background-color: rgb(245, 245, 245);\">我一般是用来检验简历修改的效果，刷新后看有没有用人单位主动联系，时间宽裕时也会给中意的企业投递简历试试。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">猎头网站（猎聘网）：主要有猎头岗位、企业岗位，也在做高端职位的招聘，猎头水平参差不齐，而且发布的岗位有重复、待遇虚报。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; color: rgb(102, 102, 153); background-color: rgb(245, 245, 245);\">我一般只看企业发布的岗位，没有精力为猎头们提供陪聊服务。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">互联网招聘（拉勾、内推）：垂直招聘，信息获取便捷，但企业覆盖不够全面，有些岗位搜索不到。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; color: rgb(102, 102, 153); background-color: rgb(245, 245, 245);\">个人建议还是直接找目标公司的内部人员推荐，直达用人部门，靠谱系数最高，可以避免被HR误下杀手。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">人才竞拍</strong><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">（100offer）：角色反转，求职者发布简历，企业向求职者发起面试邀请。主导权握在自己手里的感觉，挺好！</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; color: rgb(102, 102, 153); background-color: rgb(245, 245, 245);\">虽然主要服务对象是中高端程序员，我也还是去体验了一把，一周内接到6个企业邀请，待遇相对比较好，企业实力也都不错。<br style=\"box-sizing: content-box;\"><br style=\"box-sizing: content-box;\">此外，100offer提供面试接送（Uber——接我的是Passat）、入职奖金（3K——据说成功入职就有，可惜我没拿到），壕气侧漏！建议体验下～<br style=\"box-sizing: content-box;\"></span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">最后，扯点闲话</strong><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">08年大学毕业，迄今七年，共有两份工作经历，都在大公司。从一般意义上来说，步伐稳健，但两次辞职，都是裸辞，并且空窗期都留得相对较长，用来旅行和学习。工作上的很多事情往往没有时间和能量去做到精益求精，譬如我会用jQuery，它简洁、高效，但我并不知道为何可以这样；再如HashMap、HashTable主要区别在于线程安全与否，但原理是什么我还不清楚……因为这些，感觉自己像个破筛子一样，有许多窟窿，正好趁此机会补补。不过裸辞并不是一件值得学习的事，一方面，外面的机会不像想象中的那么多那么好；另一方面，人一旦舒舒服服窝在家里，勤奋程度与学习效率都有所折减，这是天性。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">最后的最后，说句题外话，有人说，在华为加班的人分两种，一种是真傻，一种是狡猾。无论在哪里，不管是事的原因还是体制的原因，如果不得不加班，真傻好过狡猾，于人于己都是如此。</span><br></p>','bbs','bbs',NULL,NULL,NULL,0,0,3,78,1,3,NULL,'2016-02-02 01:11:38','2016-02-01 22:41:18'),(4,'自本人拥有此手机以来...','<p>自本人拥有此手机以来，由于短信一直没删，昨日得出不完全统计：累计中奖137次，资金共计7260万元（人民币），另有各种iphone68部，电脑36台，轿车27辆，中过芒果卫视2等奖56次，被大学录取15次，儿子被拐卖23次，银行卡有异常31次，请大声告诉我，我这一生是否是传奇！</p><p><br></p><p><br></p><p><br></p><p>一辆面包车塞了14个人。车里面一乘客说：你这是超载，被逮着要扣不少分呢！<br>司机回头淡定冷笑：扣分，那得有驾照！顿时，无数倒吸凉气的声音弥漫在车厢。。。<br>又一乘客问：没有驾照你也敢开啊？<br>司机说：没事，酒壮人胆，中午喝了一斤二锅头，老子怕啥！顿时，只听得见乘客的呼吸声。<br>然后又有一乘客说：为啥不考驾照呢？<br>司机：我两千多度的近视眼，右腿还是假肢，怎么考！<br>全车人鸦雀无声。此时，一乘客厉声喊道：停车！我要下去！<br>司机：停个毛啊，刹车早坏了！赶紧抓好扶手，下大坡了哈</p>','bbs','bbs',NULL,NULL,NULL,0,0,2,87,1,4,NULL,'2016-02-16 18:06:43','2016-02-02 01:18:41'),(5,'联想成立南京研发中心','<p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\"><strong style=\"font-family: 宋体;\">经济观察网 记者 张昊</strong>&nbsp;联想MIDH（移动互联和数字家庭业务集团）在南京的研发中心已经开始启用，这是继北京、上海和厦门之后的第四个基地。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">联想原本的选择是在武汉，因为这将是MIDH的“大本营”。今年5月，联想宣布未来五年在武汉基地的投资额将超过50亿元。与此同时，联想将配套建成一个规模达数千人的研发和管理团队，专注在移动互联设备和应用领域的研发。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">而摩托罗拉南京研发中心的意外裁员让联想迅速做出决定：在南京先成立一个研发中心。据MIDH移动终端事业部研发总经理陈文晖介绍，在被裁的500多名员工中，联想抢到40人，这几乎就是联想南京研发中心的框架。而在年底，这个数字会增加至100人，他们大部分都来自于摩托罗拉。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">在联想的规划中，“挖过来”的这个团队将对接海外市场。目前的工作分为两块，一块是平板电脑，这个品类从去年开始已经是全球开发；而第二块就是智能手机，从明年开始，联想将开始进军国外市场。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">据IDC的报告显示， 截至6月30日止的第二季度，联想智能手机已经从上一季度的第7名跃升至第二名，在大陆智能手机领域的市场份额达到11%。在最新公布的数据中，联想依然位居第二名。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">这一定程度地证明了联想MIDH扩张计划的合理性：先占据国内市场，然后依靠国内市场，进军国外市场。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">据介绍，联想从今年起已经选择进入了五个海外市场，包括印度、印度尼西亚、菲律宾、越南和俄罗斯。之所以选择这五个国家，正是因为除了俄罗斯之外的四个国家跟中国市场比较类似。而且这也是联想PC国际化布局比较完善的市场，智能手机可以有效地“消费”联想PC的品牌影响力，以及各种本地资源。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">但毫无疑问，达到现在的这个量级，联想会有更大的野心，也就是进军欧美市场。因此，研制有竞争力的软件体系和多语言环境能力的团队将是研发的主要要求，而收编的摩托罗拉团队对于这些业务都有充分的经验。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">最新的好消息是联想乐商店的应用下载链已经超过了2亿次，这在OEM厂商自建的应用商店里是一个不错的成绩。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">“明年我们不仅仅会在应用商店上有更好的突破，最重要的是，我们会有更多的好产品推出。”陈文晖称。</p>','bbs','bbs',NULL,NULL,NULL,0,0,2,47,1,3,NULL,'2016-02-03 23:12:24','2016-02-03 23:02:45'),(6,'身在南京IT圈子，你绝对要知道的十个程序员向往工作的公司','<p>1.以前的摩托罗拉，现在基本大多数人去了联想南京研发中心；</p><p>2.趋势科技，听说不错，应届生很难进，要求比较高，但是年终奖比较少；</p><p>3.Marvell南京，应届生待遇都很高，但是可惜裁员了一部分。。。</p><p>4.京东商城南京研发分部，京东金融南京研发分部</p><p>5.爱立信</p><p>6.西门子</p><p>7.中国移动</p><p>8.中电14所、28所</p><p>9.南京思杰软件</p><p>10.华为南研所，让南京软件大道成为南京最大的程序员集散中心，以加班多，没人性，但是收入高著称，码农们，自己考虑清楚吧。</p><p><br></p><p>像苏宁易购、途牛。。。也有人说不错的。仁智见仁，智者见智吧。</p>','bbs','bbs',NULL,NULL,NULL,0,0,2,82,1,2,NULL,'2016-02-04 16:36:00','2016-02-04 14:06:00');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_node`
--

DROP TABLE IF EXISTS `post_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_node`
--

LOCK TABLES `post_node` WRITE;
/*!40000 ALTER TABLE `post_node` DISABLE KEYS */;
INSERT INTO `post_node` VALUES (1,1,1),(2,1,6),(3,2,3),(4,3,1),(5,4,2),(6,5,1),(7,6,1);
/*!40000 ALTER TABLE `post_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `content` text,
  `up_num` int(11) DEFAULT '0',
  `down_num` int(11) DEFAULT '0',
  `anon` int(11) DEFAULT '0',
  `author_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,3,'<p>自己顶</p>',0,0,1,3,'2016-02-01 22:56:00'),(2,3,'<p>顶顶顶</p>',0,0,1,2,'2016-02-01 23:23:07'),(3,3,'<p>在世奇文啊！！</p><p><br></p><p>--</p><p>今天去华联超市，下公车上人行道要经过自行车道，<br>有一个和我一起下车的老太太在过自行车道的时候，为了躲避一个骑自行车的，不小心失去平衡摔倒了。是后仰这摔的，噗通一声，估计摔得不轻，老太太当时就躺地上哼哼起来了那个骑自行车的回头看了一眼，飞速骑走了（他的车没有碰到老太太，准确说是，差一点碰到老太太）<br>周围迅速围了几个路人，有人问老太太怎么样了，要不要紧，<br>旁边有一个十三、四岁的中学生样子的小男孩马上跑过去就要掺起来老太太，<br>我见到这么紧急的情况赶快大喊一声：“别碰她”，<br>周围的人都愣住了，那个中学生也愣住了。<br>大家满眼疑惑地看着我。<br>我把中学生拉到一边轻声问道：“小同学，老太太是你撞倒的么？”，<br>他飞快地摆摆手忙说：“不是不是，我只是看到想把她扶起来”。<br>“你家里很有钱么？”我又问道，<br>“没有，爸爸下岗在家，妈妈是工厂的工人”，<br>“那你知不知道，如果不是你撞的，你却去把她扶起来，万一她说是你撞的，你家就要支付她的全部医疗费、家人的误工费、营养费等等一系列费用呢”<br>中学生顿时脸色惨白“啊？不会吧，明明是去帮她，人家不会怪我的。”<br>我冷笑一声：“小同学，你太天真了，你扶她起来也成不了十佳中学生，最多也就是一封表扬信，却要冒着几万到几十万医疗费的风险呢，想想你的爸爸妈妈赚钱多不容易，就这样都要给这个老太太了”<br>“叔叔，那我以后再也不管这种事情了，谢谢您教导我”说完，他向我深深鞠了一躬。头也不回地消失在人群之中。周围响起了热烈的掌声。<br>今天我又成功挽救了一个险些一失足成千古恨的少年，心里暖洋洋的。在大家热烈的掌声和钦佩的目光中，我头也不回地走了，留下高大的背影，深藏功与名。<br></p>',0,0,1,4,'2016-02-02 01:11:38'),(4,5,'<p>测试回复</p>',0,0,1,3,'2016-02-03 23:03:03'),(5,5,'test',0,0,1,3,'2016-02-03 23:12:24'),(6,6,'<p>谁说不是呢</p>',0,0,1,2,'2016-02-04 14:09:23'),(7,4,'<p>hahahhaha</p>',0,0,1,2,'2016-02-04 14:17:30'),(8,6,'如果想要钱多，那就去华为，只要坚持的住。',0,0,1,3,'2016-02-04 16:36:00'),(9,4,'我对楼上的崇拜犹如滔滔江水、连绵不绝！！！',0,0,1,4,'2016-02-16 18:06:43');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `obj_type` text,
  `report_type` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` text,
  `section_order` int(11) DEFAULT '0',
  `section_type` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'全场集锦',0,'football'),(2,'个人集锦',0,'football'),(3,'进球视频',0,'football'),(4,'精彩花絮',0,'football'),(5,'全场集锦',0,'basketball'),(6,'个人集锦',0,'basketball'),(7,'精彩花絮',0,'basketball'),(8,'乐视视频',0,'football'),(9,'QQ视频',0,'football'),(10,'CNTV视频',0,'football'),(11,'新浪视频',0,'football'),(12,'乐视视频',0,'basketball'),(13,'QQ视频',0,'basketball'),(14,'CNTV视频',0,'basketball'),(15,'新浪视频',0,'basketball');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_video`
--

DROP TABLE IF EXISTS `section_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_video`
--

LOCK TABLES `section_video` WRITE;
/*!40000 ALTER TABLE `section_video` DISABLE KEYS */;
INSERT INTO `section_video` VALUES (1,1,3,1),(2,2,3,1),(3,3,2,1),(4,4,1,1),(5,5,1,1);
/*!40000 ALTER TABLE `section_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `thumb` text,
  `intro` text,
  `tag_type` int(11) DEFAULT '1',
  `category` int(11) DEFAULT '1',
  `post_num` int(11) DEFAULT '0',
  `follow_num` int(11) DEFAULT '0',
  `is_new` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'广州恒大','','',1,1,0,0,0,'2015-08-27 00:00:00'),(2,'亚冠','','',1,1,0,0,0,'2015-08-27 00:00:00'),(3,'高拉特','','',1,1,0,0,0,'2015-08-27 00:00:00');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_parent`
--

DROP TABLE IF EXISTS `tag_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_parent`
--

LOCK TABLES `tag_parent` WRITE;
/*!40000 ALTER TABLE `tag_parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_type`
--

DROP TABLE IF EXISTS `tag_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `label` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_type`
--

LOCK TABLES `tag_type` WRITE;
/*!40000 ALTER TABLE `tag_type` DISABLE KEYS */;
INSERT INTO `tag_type` VALUES (1,'默认','其它'),(2,'文章类型','关注的文章'),(3,'问题类型','感兴趣的问题'),(4,'类目','关注的类目'),(5,'品牌','喜欢的品牌'),(6,'商品','想买的东西');
/*!40000 ALTER TABLE `tag_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thank`
--

DROP TABLE IF EXISTS `thank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `obj_type` text,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thank`
--

LOCK TABLES `thank` WRITE;
/*!40000 ALTER TABLE `thank` DISABLE KEYS */;
/*!40000 ALTER TABLE `thank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` text,
  `password` text,
  `username` text,
  `sign` text,
  `gender` text,
  `location` text,
  `business` text,
  `edu` text,
  `company` text,
  `website` text,
  `intro` text,
  `avatar` text,
  `cover` text,
  `weibo` text,
  `qzone` text,
  `douban` text,
  `renren` text,
  `followees` int(11) DEFAULT '0',
  `followers` int(11) DEFAULT '0',
  `posts` int(11) DEFAULT '0',
  `comments` int(11) DEFAULT '0',
  `up_num` int(11) DEFAULT '0',
  `down_num` int(11) DEFAULT '0',
  `thank_num` int(11) DEFAULT '0',
  `report_num` int(11) DEFAULT '0',
  `reputation` int(11) DEFAULT '0',
  `income` int(11) DEFAULT '2000',
  `expend` int(11) DEFAULT '0',
  `permission` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `view_follow` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'gaolinjie@gmail.com','d358ea6c3b7eddbea1acc769a541cfcc96bbf9e0','gaolinjie',NULL,'男',NULL,NULL,NULL,NULL,NULL,'','http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cs8hxcj30wt0wtjto.jpg',NULL,NULL,NULL,NULL,NULL,0,0,1,0,0,0,0,0,0,2000,20,0,'2015-12-25 00:19:02',NULL,'2016-02-03 11:47:25',NULL),(2,'zhudewei88@126.com','601f1889667efaebb33b8c12572835da3f027f78','nanpian',NULL,'男',NULL,NULL,NULL,NULL,NULL,'','http://mmm-avatar.qiniudn.com/m_874917e2-cb05-11e5-a1a3-00163e005f58.png',NULL,NULL,NULL,NULL,NULL,0,0,2,3,0,0,0,0,0,2005,50,0,'2016-02-01 21:45:52','2016-02-04 14:07:11',NULL,NULL),(3,'callmelaoxu@126.com','1b5a1b16132e0318831d1fa606a86f864b1b8430','laoxu',NULL,'男',NULL,NULL,NULL,NULL,NULL,'','http://mmm-avatar.qiniudn.com/m_2efc7f62-c8f2-11e5-a1a3-00163e005f58.png',NULL,NULL,NULL,NULL,NULL,0,0,2,4,0,0,0,0,0,2010,45,0,'2016-02-01 22:09:32','2016-02-01 22:43:42','2016-02-15 11:45:51',NULL),(4,'baiwenke625@163.com','b1b3773a05c0ed0176787a4f1574ff0075f7521e','android',NULL,'男',NULL,NULL,NULL,NULL,NULL,'','http://mmm-avatar.qiniudn.com/m_500025b4-c907-11e5-a1a3-00163e005f58.png',NULL,NULL,NULL,NULL,NULL,0,0,1,2,0,0,0,0,0,2005,25,0,'2016-02-02 01:08:48','2016-02-02 01:14:55','2016-02-16 18:05:31',NULL),(5,'testnj@gmail.com','d358ea6c3b7eddbea1acc769a541cfcc96bbf9e0','testnj',NULL,'男',NULL,NULL,NULL,NULL,NULL,'','http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1crpp62j30wt0wtdi2.jpg',NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,2000,0,0,'2016-02-03 10:54:14',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `head_name` text,
  `img` text,
  `orginal_link` text,
  `link` text,
  `vendor` text,
  `vid` text,
  `view_num` int(11) DEFAULT '0',
  `up_num` int(11) DEFAULT '0',
  `down_num` int(11) DEFAULT '0',
  `open_type` text,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'里皮看台观战恒大生死战 球迷翘首睹真容','','','','http://p.you.video.sina.com.cn/swf/quotePlayer20130723_V4_4_42_4.swf?vid=138126657&as=0','sina','',0,0,0,'video',NULL,'2015-06-11 00:50:24'),(2,'恒大开场收噩耗 张琳芃膝盖受伤无奈离场','','','','http://p.you.video.sina.com.cn/swf/quotePlayer20130723_V4_4_42_4.swf?vid=138126983&as=0','sina','',0,0,0,'video',NULL,'2015-06-11 00:50:24'),(3,'高拉特角球甩头破门 詹俊：犀牛望月','','','','http://p.you.video.sina.com.cn/swf/quotePlayer20130723_V4_4_42_4.swf?vid=138127179&as=0','sina','',0,0,0,'video',NULL,'2015-06-11 00:50:24'),(4,'亚冠-高拉特双响张琳芃伤退 恒大2-0城南进8强','','','','http://img1.c0.letv.com/ptv/player/swfPlayer.swf?autoPlay=1&isPlayerAd=0&id=22845366','letv','',0,0,0,'video',NULL,'2015-06-11 00:50:24'),(5,'亚冠-高拉特双响张琳芃伤退 恒大2-0城南进8强','','','','http://player.cntv.cn/flashplayer/players/htmls/smallwindow.html?pid=654b7d1ed3e6433fa3e626e072c0c696','cntv','',0,0,0,'video',NULL,'2015-06-11 00:50:24');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) DEFAULT NULL,
  `obj_type` text,
  `up_down` text,
  `author_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbb`
--

DROP TABLE IF EXISTS `zbb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zbb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `url` text,
  `post_type` text,
  `feed_type` text,
  `feed_uuid` text,
  `content` text,
  `replys` text,
  `post_id` int(11) DEFAULT NULL,
  `video_num` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbb`
--

LOCK TABLES `zbb` WRITE;
/*!40000 ALTER TABLE `zbb` DISABLE KEYS */;
/*!40000 ALTER TABLE `zbb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database '1024nj'
--

--
-- Current Database: `1024nj`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `1024nj` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `1024nj`;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_type` int(11) DEFAULT NULL,
  `show` int(11) DEFAULT NULL,
  `title` text,
  `img` text,
  `link` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatar`
--

DROP TABLE IF EXISTS `avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` text,
  `gender` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
INSERT INTO `avatar` VALUES (1,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1co4egzj30wt0wtq5b.jpg','男'),(2,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cozuyhj30wt0wtgny.jpg','男'),(3,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cpp9e8j30wt0wtdhz.jpg','男'),(4,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cqqws2j30wt0wt40r.jpg','男'),(5,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1crpp62j30wt0wtdi2.jpg','男'),(6,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cs8hxcj30wt0wtjto.jpg','男'),(7,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1ctddfnj30wt0wtwgl.jpg','男'),(8,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cu8cm4j30wt0wtabq.jpg','男'),(9,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cvbmakj30wt0wtjtx.jpg','男'),(10,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1co4egzj30wt0wtq5b.jpg','女'),(11,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cozuyhj30wt0wtgny.jpg','女'),(12,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cpp9e8j30wt0wtdhz.jpg','女'),(13,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cqqws2j30wt0wt40r.jpg','女'),(14,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1crpp62j30wt0wtdi2.jpg','女'),(15,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cs8hxcj30wt0wtjto.jpg','女'),(16,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1ctddfnj30wt0wtwgl.jpg','女'),(17,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cu8cm4j30wt0wtabq.jpg','女'),(18,'http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cvbmakj30wt0wtjtx.jpg','女');
/*!40000 ALTER TABLE `avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `balance_type` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT '0',
  `balance` int(11) DEFAULT '0',
  `post_id` int(11) DEFAULT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance`
--

LOCK TABLES `balance` WRITE;
/*!40000 ALTER TABLE `balance` DISABLE KEYS */;
INSERT INTO `balance` VALUES (1,1,2,-20,1980,1,NULL,NULL,'2015-12-25 00:21:07'),(2,2,2,-20,1980,2,NULL,NULL,'2016-02-01 22:09:18'),(3,3,2,-20,1980,3,NULL,NULL,'2016-02-01 22:41:18'),(4,2,3,-5,1975,3,2,NULL,'2016-02-01 23:23:08'),(5,3,4,5,1985,3,2,2,'2016-02-01 23:23:08'),(6,4,3,-5,1995,3,3,NULL,'2016-02-02 01:11:38'),(7,3,4,5,1990,3,3,4,'2016-02-02 01:11:38'),(8,4,2,-20,1975,4,NULL,NULL,'2016-02-02 01:18:41'),(9,3,2,-20,1970,5,NULL,NULL,'2016-02-03 23:02:45'),(10,2,2,-20,1955,6,NULL,NULL,'2016-02-04 14:06:00'),(11,2,3,-5,1950,4,7,NULL,'2016-02-04 14:17:30'),(12,4,4,5,1980,4,7,2,'2016-02-04 14:17:30'),(13,3,3,-5,1965,6,8,NULL,'2016-02-04 16:36:00'),(14,2,4,5,1955,6,8,3,'2016-02-04 16:36:00');
/*!40000 ALTER TABLE `balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balance_type`
--

DROP TABLE IF EXISTS `balance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` text,
  `balance_text1` text,
  `balance_text2` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance_type`
--

LOCK TABLES `balance_type` WRITE;
/*!40000 ALTER TABLE `balance_type` DISABLE KEYS */;
INSERT INTO `balance_type` VALUES (1,'初始资本','获得初始资本','2000 铜币'),(2,'创建主题','创建了','主题'),(3,'创建回复','创建了','回复'),(4,'主题回复收益 ','收到 ','的回复'),(5,'赞同别人','发送对','的赞同'),(6,'收到赞同','收到','的赞同'),(7,'撤销赞同','撤销对','的赞同'),(8,'赞同被撤销','赞同被','撤销'),(9,'发送谢意','发送对','的谢意'),(10,'收到谢意','收到','的谢意'),(11,'发送邀请','发送','邀请'),(12,'邀请成功','邀请','成功');
/*!40000 ALTER TABLE `balance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `order_num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'足球',0),(2,'NBA',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed`
--

DROP TABLE IF EXISTS `feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_title` text,
  `feed_type` text,
  `post_type` text,
  `feed_uuid` text,
  `post_id` int(11) DEFAULT NULL,
  `post_id2` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed`
--

LOCK TABLES `feed` WRITE;
/*!40000 ALTER TABLE `feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `obj_type` text,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (1,1,1,'u','2015-12-25 00:19:02'),(2,2,2,'u','2016-02-01 21:45:52'),(3,3,3,'u','2016-02-01 22:09:32'),(4,4,4,'u','2016-02-02 01:08:48'),(5,5,5,'u','2016-02-03 10:54:14');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icode`
--

DROP TABLE IF EXISTS `icode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` text,
  `used` int(11) DEFAULT '0',
  `user_created` int(11) DEFAULT NULL,
  `user_used` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icode`
--

LOCK TABLES `icode` WRITE;
/*!40000 ALTER TABLE `icode` DISABLE KEYS */;
/*!40000 ALTER TABLE `icode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite`
--

DROP TABLE IF EXISTS `invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `readed` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite`
--

LOCK TABLES `invite` WRITE;
/*!40000 ALTER TABLE `invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live`
--

DROP TABLE IF EXISTS `live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sport` text,
  `game` text,
  `team` text,
  `signal_text` text,
  `hot` int(11) DEFAULT '0',
  `post_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live`
--

LOCK TABLES `live` WRITE;
/*!40000 ALTER TABLE `live` DISABLE KEYS */;
/*!40000 ALTER TABLE `live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nav`
--

DROP TABLE IF EXISTS `nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_name` text,
  `tag_id` int(11) DEFAULT NULL,
  `nav_type` text,
  `order_num` int(11) DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `is_sub` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nav`
--

LOCK TABLES `nav` WRITE;
/*!40000 ALTER TABLE `nav` DISABLE KEYS */;
INSERT INTO `nav` VALUES (1,'南京IT圈',NULL,'itbbs',1,NULL,0),(2,'灌水',1,'itbbs',2,NULL,0),(3,'软件外包',1,'itbbs',3,NULL,0),(4,'求职招聘',1,'itbbs',3,NULL,0);
/*!40000 ALTER TABLE `nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `thumb` text,
  `intro` text,
  `category` int(11) DEFAULT NULL,
  `post_num` int(11) DEFAULT '0',
  `follow_num` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,'南京IT圈','','',1,0,0,'2015-08-27 00:00:00'),(2,'灌水','','',1,0,0,'2015-08-27 00:00:00'),(3,'软件外包','','',1,0,0,'2015-08-27 00:00:00'),(4,'求职招聘','','',2,0,0,'2015-08-27 00:00:00');
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `notice_type` int(11) DEFAULT NULL,
  `readed` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,3,2,3,2,1,1,'2016-02-01 23:23:08'),(2,3,4,3,3,1,1,'2016-02-02 01:11:38'),(3,4,2,4,7,1,1,'2016-02-04 14:17:30'),(4,2,3,6,8,1,0,'2016-02-04 16:36:00');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_type`
--

DROP TABLE IF EXISTS `notice_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_type`
--

LOCK TABLES `notice_type` WRITE;
/*!40000 ALTER TABLE `notice_type` DISABLE KEYS */;
INSERT INTO `notice_type` VALUES (1,'回复了你的主题'),(2,'收藏了你的主题'),(3,'感谢了你的主题'),(4,'赞同了你的回复'),(5,'感谢了你的回复'),(6,'在主题中提到了你'),(7,'在回复中提到了你'),(15,'关注了你'),(16,'赞了你的主题');
/*!40000 ALTER TABLE `notice_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_video`
--

DROP TABLE IF EXISTS `object_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `obj_type` text,
  `order_num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_video`
--

LOCK TABLES `object_video` WRITE;
/*!40000 ALTER TABLE `object_video` DISABLE KEYS */;
INSERT INTO `object_video` VALUES (1,1,1,'post',0),(2,2,1,'post',0),(3,3,1,'post',0),(4,4,1,'post',0),(5,5,1,'post',0);
/*!40000 ALTER TABLE `object_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `role` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,0,'普通用户'),(2,1,'高级用户'),(3,2,'超级用户'),(4,11,'普通管理员'),(5,22,'高级管理员'),(6,13,'超级管理员'),(7,-1,'禁止提问'),(8,-2,'禁止回答');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `content` text,
  `post_type` text,
  `feed_type` text,
  `open_type` text,
  `post_link` text,
  `thumb` text,
  `up_num` int(11) DEFAULT '0',
  `down_num` int(11) DEFAULT '0',
  `reply_num` int(11) DEFAULT '0',
  `view_num` int(11) DEFAULT '0',
  `follow_num` int(11) DEFAULT '0',
  `author_id` int(11) DEFAULT NULL,
  `last_reply` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'hello world!','<p>hello world!<br></p>','bbs','bbs',NULL,NULL,NULL,0,0,0,74,1,1,NULL,'2015-12-25 00:21:07','2015-12-25 00:21:07'),(2,'ffdsf','<p>sf ffdsf</p>','bbs','bbs',NULL,NULL,NULL,0,0,0,61,1,2,NULL,'2016-02-01 22:09:18','2016-02-01 22:09:18'),(3,'奔三之际，任性一把 ——从华为南研所裸辞后的一些体会和感想','<p><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">“国际惯例”有一阵子了，最近尚算清闲，写写裸辞后的一些体会和感想。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">关于离开</strong><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">知乎上“你为什么从腾讯离职”、“你为什么从百度离职”这类话题长盛不衰，华为的话题下，也有这样的讨论。不同公司、不同部门乃至不同的人，从某种程度上来说，无论是来是去都有相似的缘由，参与的人多了，免不了抱怨、吐槽，于事无补，于人无益。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">我的离开，有长期出差几乎只有法定节假日才能回家这样的因素在，但最关键的一点还是工作本身。2011年社招进来，从Java+Flex开发到MDE，再后来转SE，在华为来说，这个节奏不算多快但也不算慢，走得挺稳当，与领导、同事相处也很融洽。也许，就这么一直走下去，人生也不会太差。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">只是，渐渐会有一些不安，得空反思，发觉自己在做的这些事于个人成长而言价值不大。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">人太浮于事，如同浮萍，随波逐荡。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">今年年初，决心离开南研所，并离开南京这座城市。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">正如离开南研所去了Amazon的一个兄弟说的那样，南京太小，圈子太小，视野太小。华为南研所只是南京雨花区软件大道上的那么一块园区，但对于一部分人而言，南京所能给你的，比南研所还要少。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">这番话说出来有些沉痛，我2004年到南京，读书、恋爱、工作、生活，已十年有余，说南京是第二故乡也不为过，因此这一次离开，是经过了深思熟虑的决定，虽有依恋，但走得义无反顾。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">走出华为才知道的一些坑</strong><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">真正关心你为什么从华为离职的人，往往都是那些打算进华为的人；</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">打算离开华为的人，更关心离开华为后你去了哪里，去的路上有什么坑。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">我来说说这些坑。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">第一个坑，其实是在华为挖下的，而且很大。就是上文提到的，个人修为不够精深。不过这个问题不能全赖华为，你选了大平台就要相应地承担它带给你的副作用。BAT的一些同学也有相似的烦恼，还有360，接触过360出来的混子，我想他们进360的时候绝不是立志要做个混子吧。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">第二个坑是部分企业“拿来即用”的用人理念。华为的系统工程师与互联网公司所定义的架构师区别很大，因此很难沿着架构师这个Title继续走，我尝试着投过阿里的相关岗位，面试时发现能力差距还是比较明显的。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">但从需求分析、产品设计、敏捷项目管理等方面来说，与大部分互联网公司产品岗的定位相符。然而由于以往做的不是纯互联网产品，有的公司不愿意承担这样的用人风险，简单来说，就是华为出身，跨领域找工作并不见得那么好找。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">在脉脉上我曾发过一条实名动态，引起了不少求职者的共鸣：“</span><span style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; color: rgb(0, 128, 128); background-color: rgb(245, 245, 245);\">太多的招聘方过多地关注求职者曾经是什么，而忽略了未来能成为什么</span><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">”。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">其实一个人如果在某个领域做得可圈可点，在相近意义的事情上，通常都会做得不错，甚至更大范围的事情上，也值得托付。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">还有一个说大不大说小不小的坑，之前在心声有写过：华为的信息安全很牛X，但是导致开发氛围比较沉寂，与外部隔绝。很多互联网公司要求看你的技术文章，Github代码、Stackoverflow/邮件组/Quora/SegmentFault等网站的活跃度及回答，我除了个人博客（说得好像经常更似的），其它平台都没有深入过，大家引以为戒。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">正确求职的姿势</strong><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">传统招聘网站（51job、智联）：招聘信息相对齐全，全行业、大小公司都有，没有针对性，对于求职者信息筛选的成本比较高。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; color: rgb(102, 102, 153); background-color: rgb(245, 245, 245);\">我一般是用来检验简历修改的效果，刷新后看有没有用人单位主动联系，时间宽裕时也会给中意的企业投递简历试试。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">猎头网站（猎聘网）：主要有猎头岗位、企业岗位，也在做高端职位的招聘，猎头水平参差不齐，而且发布的岗位有重复、待遇虚报。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; color: rgb(102, 102, 153); background-color: rgb(245, 245, 245);\">我一般只看企业发布的岗位，没有精力为猎头们提供陪聊服务。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">互联网招聘（拉勾、内推）：垂直招聘，信息获取便捷，但企业覆盖不够全面，有些岗位搜索不到。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; color: rgb(102, 102, 153); background-color: rgb(245, 245, 245);\">个人建议还是直接找目标公司的内部人员推荐，直达用人部门，靠谱系数最高，可以避免被HR误下杀手。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">人才竞拍</strong><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">（100offer）：角色反转，求职者发布简历，企业向求职者发起面试邀请。主导权握在自己手里的感觉，挺好！</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; color: rgb(102, 102, 153); background-color: rgb(245, 245, 245);\">虽然主要服务对象是中高端程序员，我也还是去体验了一把，一周内接到6个企业邀请，待遇相对比较好，企业实力也都不错。<br style=\"box-sizing: content-box;\"><br style=\"box-sizing: content-box;\">此外，100offer提供面试接送（Uber——接我的是Passat）、入职奖金（3K——据说成功入职就有，可惜我没拿到），壕气侧漏！建议体验下～<br style=\"box-sizing: content-box;\"></span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">最后，扯点闲话</strong><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">&nbsp;</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">08年大学毕业，迄今七年，共有两份工作经历，都在大公司。从一般意义上来说，步伐稳健，但两次辞职，都是裸辞，并且空窗期都留得相对较长，用来旅行和学习。工作上的很多事情往往没有时间和能量去做到精益求精，譬如我会用jQuery，它简洁、高效，但我并不知道为何可以这样；再如HashMap、HashTable主要区别在于线程安全与否，但原理是什么我还不清楚……因为这些，感觉自己像个破筛子一样，有许多窟窿，正好趁此机会补补。不过裸辞并不是一件值得学习的事，一方面，外面的机会不像想象中的那么多那么好；另一方面，人一旦舒舒服服窝在家里，勤奋程度与学习效率都有所折减，这是天性。</span><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><br style=\"box-sizing: content-box; font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\"><span style=\"font-family: Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 24px; background-color: rgb(245, 245, 245);\">最后的最后，说句题外话，有人说，在华为加班的人分两种，一种是真傻，一种是狡猾。无论在哪里，不管是事的原因还是体制的原因，如果不得不加班，真傻好过狡猾，于人于己都是如此。</span><br></p>','bbs','bbs',NULL,NULL,NULL,0,0,3,78,1,3,NULL,'2016-02-02 01:11:38','2016-02-01 22:41:18'),(4,'自本人拥有此手机以来...','<p>自本人拥有此手机以来，由于短信一直没删，昨日得出不完全统计：累计中奖137次，资金共计7260万元（人民币），另有各种iphone68部，电脑36台，轿车27辆，中过芒果卫视2等奖56次，被大学录取15次，儿子被拐卖23次，银行卡有异常31次，请大声告诉我，我这一生是否是传奇！</p><p><br></p><p><br></p><p><br></p><p>一辆面包车塞了14个人。车里面一乘客说：你这是超载，被逮着要扣不少分呢！<br>司机回头淡定冷笑：扣分，那得有驾照！顿时，无数倒吸凉气的声音弥漫在车厢。。。<br>又一乘客问：没有驾照你也敢开啊？<br>司机说：没事，酒壮人胆，中午喝了一斤二锅头，老子怕啥！顿时，只听得见乘客的呼吸声。<br>然后又有一乘客说：为啥不考驾照呢？<br>司机：我两千多度的近视眼，右腿还是假肢，怎么考！<br>全车人鸦雀无声。此时，一乘客厉声喊道：停车！我要下去！<br>司机：停个毛啊，刹车早坏了！赶紧抓好扶手，下大坡了哈</p>','bbs','bbs',NULL,NULL,NULL,0,0,2,87,1,4,NULL,'2016-02-16 18:06:43','2016-02-02 01:18:41'),(5,'联想成立南京研发中心','<p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\"><strong style=\"font-family: 宋体;\">经济观察网 记者 张昊</strong>&nbsp;联想MIDH（移动互联和数字家庭业务集团）在南京的研发中心已经开始启用，这是继北京、上海和厦门之后的第四个基地。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">联想原本的选择是在武汉，因为这将是MIDH的“大本营”。今年5月，联想宣布未来五年在武汉基地的投资额将超过50亿元。与此同时，联想将配套建成一个规模达数千人的研发和管理团队，专注在移动互联设备和应用领域的研发。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">而摩托罗拉南京研发中心的意外裁员让联想迅速做出决定：在南京先成立一个研发中心。据MIDH移动终端事业部研发总经理陈文晖介绍，在被裁的500多名员工中，联想抢到40人，这几乎就是联想南京研发中心的框架。而在年底，这个数字会增加至100人，他们大部分都来自于摩托罗拉。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">在联想的规划中，“挖过来”的这个团队将对接海外市场。目前的工作分为两块，一块是平板电脑，这个品类从去年开始已经是全球开发；而第二块就是智能手机，从明年开始，联想将开始进军国外市场。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">据IDC的报告显示， 截至6月30日止的第二季度，联想智能手机已经从上一季度的第7名跃升至第二名，在大陆智能手机领域的市场份额达到11%。在最新公布的数据中，联想依然位居第二名。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">这一定程度地证明了联想MIDH扩张计划的合理性：先占据国内市场，然后依靠国内市场，进军国外市场。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">据介绍，联想从今年起已经选择进入了五个海外市场，包括印度、印度尼西亚、菲律宾、越南和俄罗斯。之所以选择这五个国家，正是因为除了俄罗斯之外的四个国家跟中国市场比较类似。而且这也是联想PC国际化布局比较完善的市场，智能手机可以有效地“消费”联想PC的品牌影响力，以及各种本地资源。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">但毫无疑问，达到现在的这个量级，联想会有更大的野心，也就是进军欧美市场。因此，研制有竞争力的软件体系和多语言环境能力的团队将是研发的主要要求，而收编的摩托罗拉团队对于这些业务都有充分的经验。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">最新的好消息是联想乐商店的应用下载链已经超过了2亿次，这在OEM厂商自建的应用商店里是一个不错的成绩。</p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; border: 0px; text-indent: 2em; font-family: \'Microsoft YaHei\', Tahoma, Arial, 宋体; font-size: 14px; line-height: 26px;\">“明年我们不仅仅会在应用商店上有更好的突破，最重要的是，我们会有更多的好产品推出。”陈文晖称。</p>','bbs','bbs',NULL,NULL,NULL,0,0,2,47,1,3,NULL,'2016-02-03 23:12:24','2016-02-03 23:02:45'),(6,'身在南京IT圈子，你绝对要知道的十个程序员向往工作的公司','<p>1.以前的摩托罗拉，现在基本大多数人去了联想南京研发中心；</p><p>2.趋势科技，听说不错，应届生很难进，要求比较高，但是年终奖比较少；</p><p>3.Marvell南京，应届生待遇都很高，但是可惜裁员了一部分。。。</p><p>4.京东商城南京研发分部，京东金融南京研发分部</p><p>5.爱立信</p><p>6.西门子</p><p>7.中国移动</p><p>8.中电14所、28所</p><p>9.南京思杰软件</p><p>10.华为南研所，让南京软件大道成为南京最大的程序员集散中心，以加班多，没人性，但是收入高著称，码农们，自己考虑清楚吧。</p><p><br></p><p>像苏宁易购、途牛。。。也有人说不错的。仁智见仁，智者见智吧。</p>','bbs','bbs',NULL,NULL,NULL,0,0,2,82,1,2,NULL,'2016-02-04 16:36:00','2016-02-04 14:06:00');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_node`
--

DROP TABLE IF EXISTS `post_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_node`
--

LOCK TABLES `post_node` WRITE;
/*!40000 ALTER TABLE `post_node` DISABLE KEYS */;
INSERT INTO `post_node` VALUES (1,1,1),(2,1,6),(3,2,3),(4,3,1),(5,4,2),(6,5,1),(7,6,1);
/*!40000 ALTER TABLE `post_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `content` text,
  `up_num` int(11) DEFAULT '0',
  `down_num` int(11) DEFAULT '0',
  `anon` int(11) DEFAULT '0',
  `author_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,3,'<p>自己顶</p>',0,0,1,3,'2016-02-01 22:56:00'),(2,3,'<p>顶顶顶</p>',0,0,1,2,'2016-02-01 23:23:07'),(3,3,'<p>在世奇文啊！！</p><p><br></p><p>--</p><p>今天去华联超市，下公车上人行道要经过自行车道，<br>有一个和我一起下车的老太太在过自行车道的时候，为了躲避一个骑自行车的，不小心失去平衡摔倒了。是后仰这摔的，噗通一声，估计摔得不轻，老太太当时就躺地上哼哼起来了那个骑自行车的回头看了一眼，飞速骑走了（他的车没有碰到老太太，准确说是，差一点碰到老太太）<br>周围迅速围了几个路人，有人问老太太怎么样了，要不要紧，<br>旁边有一个十三、四岁的中学生样子的小男孩马上跑过去就要掺起来老太太，<br>我见到这么紧急的情况赶快大喊一声：“别碰她”，<br>周围的人都愣住了，那个中学生也愣住了。<br>大家满眼疑惑地看着我。<br>我把中学生拉到一边轻声问道：“小同学，老太太是你撞倒的么？”，<br>他飞快地摆摆手忙说：“不是不是，我只是看到想把她扶起来”。<br>“你家里很有钱么？”我又问道，<br>“没有，爸爸下岗在家，妈妈是工厂的工人”，<br>“那你知不知道，如果不是你撞的，你却去把她扶起来，万一她说是你撞的，你家就要支付她的全部医疗费、家人的误工费、营养费等等一系列费用呢”<br>中学生顿时脸色惨白“啊？不会吧，明明是去帮她，人家不会怪我的。”<br>我冷笑一声：“小同学，你太天真了，你扶她起来也成不了十佳中学生，最多也就是一封表扬信，却要冒着几万到几十万医疗费的风险呢，想想你的爸爸妈妈赚钱多不容易，就这样都要给这个老太太了”<br>“叔叔，那我以后再也不管这种事情了，谢谢您教导我”说完，他向我深深鞠了一躬。头也不回地消失在人群之中。周围响起了热烈的掌声。<br>今天我又成功挽救了一个险些一失足成千古恨的少年，心里暖洋洋的。在大家热烈的掌声和钦佩的目光中，我头也不回地走了，留下高大的背影，深藏功与名。<br></p>',0,0,1,4,'2016-02-02 01:11:38'),(4,5,'<p>测试回复</p>',0,0,1,3,'2016-02-03 23:03:03'),(5,5,'test',0,0,1,3,'2016-02-03 23:12:24'),(6,6,'<p>谁说不是呢</p>',0,0,1,2,'2016-02-04 14:09:23'),(7,4,'<p>hahahhaha</p>',0,0,1,2,'2016-02-04 14:17:30'),(8,6,'如果想要钱多，那就去华为，只要坚持的住。',0,0,1,3,'2016-02-04 16:36:00'),(9,4,'我对楼上的崇拜犹如滔滔江水、连绵不绝！！！',0,0,1,4,'2016-02-16 18:06:43');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `obj_type` text,
  `report_type` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` text,
  `section_order` int(11) DEFAULT '0',
  `section_type` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'全场集锦',0,'football'),(2,'个人集锦',0,'football'),(3,'进球视频',0,'football'),(4,'精彩花絮',0,'football'),(5,'全场集锦',0,'basketball'),(6,'个人集锦',0,'basketball'),(7,'精彩花絮',0,'basketball'),(8,'乐视视频',0,'football'),(9,'QQ视频',0,'football'),(10,'CNTV视频',0,'football'),(11,'新浪视频',0,'football'),(12,'乐视视频',0,'basketball'),(13,'QQ视频',0,'basketball'),(14,'CNTV视频',0,'basketball'),(15,'新浪视频',0,'basketball');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_video`
--

DROP TABLE IF EXISTS `section_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_video`
--

LOCK TABLES `section_video` WRITE;
/*!40000 ALTER TABLE `section_video` DISABLE KEYS */;
INSERT INTO `section_video` VALUES (1,1,3,1),(2,2,3,1),(3,3,2,1),(4,4,1,1),(5,5,1,1);
/*!40000 ALTER TABLE `section_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `thumb` text,
  `intro` text,
  `tag_type` int(11) DEFAULT '1',
  `category` int(11) DEFAULT '1',
  `post_num` int(11) DEFAULT '0',
  `follow_num` int(11) DEFAULT '0',
  `is_new` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'广州恒大','','',1,1,0,0,0,'2015-08-27 00:00:00'),(2,'亚冠','','',1,1,0,0,0,'2015-08-27 00:00:00'),(3,'高拉特','','',1,1,0,0,0,'2015-08-27 00:00:00');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_parent`
--

DROP TABLE IF EXISTS `tag_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_parent`
--

LOCK TABLES `tag_parent` WRITE;
/*!40000 ALTER TABLE `tag_parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_type`
--

DROP TABLE IF EXISTS `tag_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `label` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_type`
--

LOCK TABLES `tag_type` WRITE;
/*!40000 ALTER TABLE `tag_type` DISABLE KEYS */;
INSERT INTO `tag_type` VALUES (1,'默认','其它'),(2,'文章类型','关注的文章'),(3,'问题类型','感兴趣的问题'),(4,'类目','关注的类目'),(5,'品牌','喜欢的品牌'),(6,'商品','想买的东西');
/*!40000 ALTER TABLE `tag_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thank`
--

DROP TABLE IF EXISTS `thank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `obj_type` text,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thank`
--

LOCK TABLES `thank` WRITE;
/*!40000 ALTER TABLE `thank` DISABLE KEYS */;
/*!40000 ALTER TABLE `thank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` text,
  `password` text,
  `username` text,
  `sign` text,
  `gender` text,
  `location` text,
  `business` text,
  `edu` text,
  `company` text,
  `website` text,
  `intro` text,
  `avatar` text,
  `cover` text,
  `weibo` text,
  `qzone` text,
  `douban` text,
  `renren` text,
  `followees` int(11) DEFAULT '0',
  `followers` int(11) DEFAULT '0',
  `posts` int(11) DEFAULT '0',
  `comments` int(11) DEFAULT '0',
  `up_num` int(11) DEFAULT '0',
  `down_num` int(11) DEFAULT '0',
  `thank_num` int(11) DEFAULT '0',
  `report_num` int(11) DEFAULT '0',
  `reputation` int(11) DEFAULT '0',
  `income` int(11) DEFAULT '2000',
  `expend` int(11) DEFAULT '0',
  `permission` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `view_follow` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'gaolinjie@gmail.com','d358ea6c3b7eddbea1acc769a541cfcc96bbf9e0','gaolinjie',NULL,'男',NULL,NULL,NULL,NULL,NULL,'','http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1cs8hxcj30wt0wtjto.jpg',NULL,NULL,NULL,NULL,NULL,0,0,1,0,0,0,0,0,0,2000,20,0,'2015-12-25 00:19:02',NULL,'2016-02-03 11:47:25',NULL),(2,'zhudewei88@126.com','601f1889667efaebb33b8c12572835da3f027f78','nanpian',NULL,'男',NULL,NULL,NULL,NULL,NULL,'','http://mmm-avatar.qiniudn.com/m_874917e2-cb05-11e5-a1a3-00163e005f58.png',NULL,NULL,NULL,NULL,NULL,0,0,2,3,0,0,0,0,0,2005,50,0,'2016-02-01 21:45:52','2016-02-04 14:07:11',NULL,NULL),(3,'callmelaoxu@126.com','1b5a1b16132e0318831d1fa606a86f864b1b8430','laoxu',NULL,'男',NULL,NULL,NULL,NULL,NULL,'','http://mmm-avatar.qiniudn.com/m_2efc7f62-c8f2-11e5-a1a3-00163e005f58.png',NULL,NULL,NULL,NULL,NULL,0,0,2,4,0,0,0,0,0,2010,45,0,'2016-02-01 22:09:32','2016-02-01 22:43:42','2016-02-15 11:45:51',NULL),(4,'baiwenke625@163.com','b1b3773a05c0ed0176787a4f1574ff0075f7521e','android',NULL,'男',NULL,NULL,NULL,NULL,NULL,'','http://mmm-avatar.qiniudn.com/m_500025b4-c907-11e5-a1a3-00163e005f58.png',NULL,NULL,NULL,NULL,NULL,0,0,1,2,0,0,0,0,0,2005,25,0,'2016-02-02 01:08:48','2016-02-02 01:14:55','2016-02-16 18:05:31',NULL),(5,'testnj@gmail.com','d358ea6c3b7eddbea1acc769a541cfcc96bbf9e0','testnj',NULL,'男',NULL,NULL,NULL,NULL,NULL,'','http://mmm-static.qiniudn.com/005z2Z7Jtw1ejp1crpp62j30wt0wtdi2.jpg',NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,2000,0,0,'2016-02-03 10:54:14',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `head_name` text,
  `img` text,
  `orginal_link` text,
  `link` text,
  `vendor` text,
  `vid` text,
  `view_num` int(11) DEFAULT '0',
  `up_num` int(11) DEFAULT '0',
  `down_num` int(11) DEFAULT '0',
  `open_type` text,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'里皮看台观战恒大生死战 球迷翘首睹真容','','','','http://p.you.video.sina.com.cn/swf/quotePlayer20130723_V4_4_42_4.swf?vid=138126657&as=0','sina','',0,0,0,'video',NULL,'2015-06-11 00:50:24'),(2,'恒大开场收噩耗 张琳芃膝盖受伤无奈离场','','','','http://p.you.video.sina.com.cn/swf/quotePlayer20130723_V4_4_42_4.swf?vid=138126983&as=0','sina','',0,0,0,'video',NULL,'2015-06-11 00:50:24'),(3,'高拉特角球甩头破门 詹俊：犀牛望月','','','','http://p.you.video.sina.com.cn/swf/quotePlayer20130723_V4_4_42_4.swf?vid=138127179&as=0','sina','',0,0,0,'video',NULL,'2015-06-11 00:50:24'),(4,'亚冠-高拉特双响张琳芃伤退 恒大2-0城南进8强','','','','http://img1.c0.letv.com/ptv/player/swfPlayer.swf?autoPlay=1&isPlayerAd=0&id=22845366','letv','',0,0,0,'video',NULL,'2015-06-11 00:50:24'),(5,'亚冠-高拉特双响张琳芃伤退 恒大2-0城南进8强','','','','http://player.cntv.cn/flashplayer/players/htmls/smallwindow.html?pid=654b7d1ed3e6433fa3e626e072c0c696','cntv','',0,0,0,'video',NULL,'2015-06-11 00:50:24');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) DEFAULT NULL,
  `obj_type` text,
  `up_down` text,
  `author_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zbb`
--

DROP TABLE IF EXISTS `zbb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zbb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `url` text,
  `post_type` text,
  `feed_type` text,
  `feed_uuid` text,
  `content` text,
  `replys` text,
  `post_id` int(11) DEFAULT NULL,
  `video_num` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zbb`
--

LOCK TABLES `zbb` WRITE;
/*!40000 ALTER TABLE `zbb` DISABLE KEYS */;
/*!40000 ALTER TABLE `zbb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database '1024nj'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-16 18:11:00

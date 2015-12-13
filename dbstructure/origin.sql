/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost
 Source Database       : jtm.im

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : utf-8

 Date: 01/02/2014 18:26:36 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `duoshuo_id` int(11),
  `email` text,
  `password` text,
  `username` text,
  `intro` text,
  `avatar` text,
  `permission` int(11) DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `thumb` text,
  `intro` text,
  `content` text,
  `via` text,
  `type` text,
  `author_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT 0,
  `visible` int(11) DEFAULT 0,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
delimiter ;;
CREATE TRIGGER `post_delete_trigger` BEFORE DELETE ON `post` FOR EACH ROW BEGIN
        DELETE FROM comment WHERE comment.post_id = OLD.id;
    END;
 ;;
delimiter ;




-- ----------------------------
--  Table structure for `std`
-- ----------------------------
DROP TABLE IF EXISTS `std`;
CREATE TABLE `std` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




-- ----------------------------
--  Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `price` float(4,2) DEFAULT 0,
  `label` text,
  `link` text,
  `like` int(11) DEFAULT 0,
  `have` int(11) DEFAULT 0,
  `show` int(11) DEFAULT 0,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `hot`
-- ----------------------------
DROP TABLE IF EXISTS `hot`;
CREATE TABLE `hot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `nav`
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `title` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `channel`
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11),
  `name` text,
  `title` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `post_tag`
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11),
  `tag_id` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `post_num` int(11),
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `vote`
-- ----------------------------
DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `love` int(11) DEFAULT 0,
  `omg` int(11) DEFAULT 0,
  `gds` int(11) DEFAULT 0,
  `geili` int(11) DEFAULT 0,
  `lol` int(11) DEFAULT 0,
  `cute` int(11) DEFAULT 0,
  `zzs` int(11) DEFAULT 0,
  `hehe` int(11) DEFAULT 0,
  `jiong` int(11) DEFAULT 0,
  `kengdie` int(11) DEFAULT 0,
  `beiju` int(11) DEFAULT 0,
  `hate` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
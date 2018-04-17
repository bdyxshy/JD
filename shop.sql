/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-04-02 15:45:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bigclass`
-- ----------------------------
DROP TABLE IF EXISTS `bigclass`;
CREATE TABLE `bigclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bigclass
-- ----------------------------
INSERT INTO `bigclass` VALUES ('1', '计算机');
INSERT INTO `bigclass` VALUES ('2', '文学');
INSERT INTO `bigclass` VALUES ('3', '古籍');
INSERT INTO `bigclass` VALUES ('4', '经济');
INSERT INTO `bigclass` VALUES ('5', '管理');
INSERT INTO `bigclass` VALUES ('6', '人文社科');
INSERT INTO `bigclass` VALUES ('7', '哲学');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(200) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('24', '201804020353215980001', '4', '5', '125', '1');
INSERT INTO `orders` VALUES ('25', '201804021437266590001', '1', '5', '402.5', '1');
INSERT INTO `orders` VALUES ('26', '201804021437266590001', '2', '2', '200', '1');
INSERT INTO `orders` VALUES ('27', '201804021437266590001', '3', '1', '30', '1');
INSERT INTO `orders` VALUES ('28', '201804021437266590001', '4', '8', '200', '1');
INSERT INTO `orders` VALUES ('29', '201804021437266590001', '5', '3', '90', '1');
INSERT INTO `orders` VALUES ('30', '201804021515101540001', '2', '4', '400', '1');
INSERT INTO `orders` VALUES ('31', '201804021523418940001', '1', '5', '402.5', '1');
INSERT INTO `orders` VALUES ('32', '201804021528173390001', '2', '3', '300', '1');
INSERT INTO `orders` VALUES ('34', '201804021530181440001', '3', '3', '90', '1');
INSERT INTO `orders` VALUES ('35', '201804021530181440001', '4', '3', '75', '1');
INSERT INTO `orders` VALUES ('36', '201804021537268630001', '2', '2', '200', '1');
INSERT INTO `orders` VALUES ('37', '201804021537268630001', '4', '1', '25', '1');

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', '1.jpg', '1');
INSERT INTO `picture` VALUES ('2', '2.jpg', '1');
INSERT INTO `picture` VALUES ('3', '3.jpg', '2');
INSERT INTO `picture` VALUES ('4', '4.jpg', '3');
INSERT INTO `picture` VALUES ('5', '5.jpg', '4');
INSERT INTO `picture` VALUES ('6', '6.jpg', '5');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `pub_id` int(11) DEFAULT NULL,
  `sc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'java编程思想', '80.5', '一本著名的java书籍', '小明', '1', '1');
INSERT INTO `product` VALUES ('2', 'java核心技术', '100', 'Java手册', '小红', '2', '1');
INSERT INTO `product` VALUES ('3', '诗经', '30', '中国最老的诗歌', '小强', '5', '2');
INSERT INTO `product` VALUES ('4', '孟子译注', '25', '解释孟子的', '孟子', '5', '3');
INSERT INTO `product` VALUES ('5', '唐诗三百首', '30', '唐诗', '蘅塘退士', '5', '2');

-- ----------------------------
-- Table structure for `publish`
-- ----------------------------
DROP TABLE IF EXISTS `publish`;
CREATE TABLE `publish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publish
-- ----------------------------
INSERT INTO `publish` VALUES ('1', '机械工业出版社');
INSERT INTO `publish` VALUES ('2', '人民邮电出版社');
INSERT INTO `publish` VALUES ('3', '电子工业出版社');
INSERT INTO `publish` VALUES ('4', '清华大学出版社');
INSERT INTO `publish` VALUES ('5', '中华书局');
INSERT INTO `publish` VALUES ('6', '上海古籍出版社');
INSERT INTO `publish` VALUES ('7', '上海译文出版社');
INSERT INTO `publish` VALUES ('8', '译林出版社');
INSERT INTO `publish` VALUES ('9', '商务印书馆');
INSERT INTO `publish` VALUES ('10', '三联出版社');

-- ----------------------------
-- Table structure for `smallclass`
-- ----------------------------
DROP TABLE IF EXISTS `smallclass`;
CREATE TABLE `smallclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `big_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of smallclass
-- ----------------------------
INSERT INTO `smallclass` VALUES ('1', '编程语言', '1');
INSERT INTO `smallclass` VALUES ('2', '互联网', '1');
INSERT INTO `smallclass` VALUES ('3', '计算机科学', '1');
INSERT INTO `smallclass` VALUES ('4', '操作系统', '1');
INSERT INTO `smallclass` VALUES ('5', '数据库', '1');
INSERT INTO `smallclass` VALUES ('6', '小说', '2');
INSERT INTO `smallclass` VALUES ('7', '散文', '2');
INSERT INTO `smallclass` VALUES ('8', '诗歌', '2');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'tom1', '9173d1ccd966d100fd81925d5b62fd91');
INSERT INTO `users` VALUES ('5', 'jonny', '9173d1ccd966d100fd81925d5b62fd91');

/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21-log : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test`;

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) DEFAULT NULL,
  `pname` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`pname`) values (1,'葡萄'),(2,'香蕉'),(3,'锅巴'),(4,'锅巴'),(5,'锅巴'),(10,'夏威夷果'),(11,'猪肉脯'),(11,'猪肉脯'),(15,'猪肉脯'),(16,'牛肉'),(20,'李敏明'),(20,'李敏明'),(30,'张涛'),(31,'刘翔'),(33,'李明'),(40,'李楠'),(41,'周期'),(42,'周骑'),(43,'狄仁杰'),(44,'李白'),(45,'蔡文姬'),(46,'刘邦'),(47,'张飞'),(47,'张飞'),(47,'张飞'),(47,'张飞'),(50,'盖伦');

/*Table structure for table `tb_content` */

DROP TABLE IF EXISTS `tb_content`;

CREATE TABLE `tb_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `sub_title` varchar(100) DEFAULT NULL,
  `title_desc` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `pic` varchar(300) DEFAULT NULL,
  `pic2` varchar(300) DEFAULT NULL,
  `content` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_content` (`category_id`),
  CONSTRAINT `tb_content_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tb_content_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `tb_content` */

insert  into `tb_content`(`id`,`category_id`,`title`,`sub_title`,`title_desc`,`url`,`pic`,`pic2`,`content`,`created`,`updated`) values (19,86,'ad1','ad1','ad1','https://m.360buyimg.com/babel/jfs/t1/98711/18/13219/456510/5e57b509E4ba9e39a/c9437c64502c3d61.jpg.webp','https://m.360buyimg.com/babel/jfs/t1/98711/18/13219/456510/5e57b509E4ba9e39a/c9437c64502c3d61.jpg.webp',NULL,NULL,NULL,NULL),(20,86,'ad2','ad2','ad2','https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1583225450&di=b4c6f0284b000588329bdc9b9206518a&src=http://a3.att.hudong.com/68/61/300000839764127060614318218_950.jpg','https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1583225450&di=b4c6f0284b000588329bdc9b9206518a&src=http://a3.att.hudong.com/68/61/300000839764127060614318218_950.jpg',NULL,NULL,NULL,NULL);

/*Table structure for table `tb_content_category` */

DROP TABLE IF EXISTS `tb_content_category`;

CREATE TABLE `tb_content_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `sort_order` int(4) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

/*Data for the table `tb_content_category` */

insert  into `tb_content_category`(`id`,`parent_id`,`name`,`status`,`sort_order`,`is_parent`,`createtime`,`updatetime`) values (30,0,'LeeShop',1,1,1,'2020-02-23 20:05:08','2020-02-23 20:05:13'),(86,30,'首页',1,1,1,'2020-02-23 20:06:30','2020-02-23 23:06:35'),(87,30,'列表首页',1,1,1,'2020-02-24 19:50:10','2020-02-24 19:50:14'),(90,86,'小广告',1,1,0,'2020-02-24 19:51:42','2020-02-24 19:51:45'),(92,30,'测试',2,5,1,'2020-03-05 08:39:42','2020-03-05 08:39:42'),(94,30,'测试',2,5,6,'2020-03-05 09:14:12','2020-03-05 09:26:44');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`) values (4,'刘备','658475','78574@qq.com'),(5,'关羽','e10adc3949ba59abbe56e057f20f883e','589485@qq.com'),(6,'刘婵','e10adc3949ba59abbe56e057f20f883e','58673876@qq.com'),(9,'貂蝉','e10adc3949ba59abbe56e057f20f883e','8888@qq.com'),(10,'貂蝉','827ccb0eea8a706c4c34a16891f84e7b','8888@qq.com'),(11,'貂蝉','e10adc3949ba59abbe56e057f20f883e','8888@qq.com'),(12,'貂蝉','827ccb0eea8a706c4c34a16891f84e7b','8888@qq.com'),(13,'貂蝉','202cb962ac59075b964b07152d234b70','8888@qq.com'),(14,'关羽','c20ad4d76fe97759aa27a0c99bff6710','8888@qq.com'),(37,'test','26588e932c7ccfa1df309280702fe1b5','227427@qq.com'),(38,'test','f1e6c66602e96718a7590353f9afc801','8888@qq.com'),(43,'test','ae072aeae2c6c0085ca9833c15945a70','78585424@qq.com'),(44,'test','141effa0635e070f437b1e22716d09cf','258254@qq.com'),(45,'test','a35f4223bb8f6c8638dc91d94e9b16f5','8888@qq.com'),(46,'貂蝉','50438d8fca45a9bf20d72774430047f0','8888@qq.com'),(47,'test','ebf5097a98eeaae991847ed243000e09','8888@qq.com'),(48,'貂蝉','ebf5097a98eeaae991847ed243000e09','8888@qq.com'),(49,'貂蝉','42ca1ba15bae7620ceb34855370ff6d4','8888@qq.com'),(50,'貂蝉','50438d8fca45a9bf20d72774430047f0','576@qq.com'),(52,'貂蝉','23fc4cba066f390a8cc729c7592b6ee8','8817488@qq.com'),(54,'貂蝉','090afe0d4abb5dfdccb84641fe115680','8888@qq.com'),(55,'貂蝉','a5ff034660bff8ce89637ece84e0cff1','888wfwf8@qq.com');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `img` varchar(30) DEFAULT NULL,
  `real_name` varchar(10) DEFAULT NULL,
  `number` varchar(15) DEFAULT NULL,
  `college` varchar(10) DEFAULT NULL,
  `major` varchar(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

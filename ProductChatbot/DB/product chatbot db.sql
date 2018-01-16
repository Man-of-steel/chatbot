/*
SQLyog Ultimate v8.55 
MySQL - 5.0.22-community-nt : Database - product_chatbot
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`product_chatbot` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `product_chatbot`;

/*Table structure for table `admin_tbl` */

DROP TABLE IF EXISTS `admin_tbl`;

CREATE TABLE `admin_tbl` (
  `admin_name` varchar(500) NOT NULL,
  `admin_password` varchar(500) default NULL,
  PRIMARY KEY  (`admin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin_tbl` */

/*Table structure for table `information_tbl` */

DROP TABLE IF EXISTS `information_tbl`;

CREATE TABLE `information_tbl` (
  `information_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) default NULL,
  `question` varchar(2000) default NULL,
  `answer` varchar(2000) default NULL,
  `keywords_csv` varchar(2000) default NULL,
  PRIMARY KEY  (`information_id`),
  KEY `FK_information_tbl_product_id` (`product_id`),
  CONSTRAINT `FK_information_tbl_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `information_tbl` */

/*Table structure for table `product_incharge_tbl` */

DROP TABLE IF EXISTS `product_incharge_tbl`;

CREATE TABLE `product_incharge_tbl` (
  `product_incharge_id` int(11) NOT NULL auto_increment,
  `product_incharge_name` varchar(500) default NULL,
  `product_incharge_email` varchar(500) default NULL,
  `product_incharge_number` varchar(15) default NULL,
  `product_incharge_password` varchar(500) default NULL,
  PRIMARY KEY  (`product_incharge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product_incharge_tbl` */

/*Table structure for table `product_tbl` */

DROP TABLE IF EXISTS `product_tbl`;

CREATE TABLE `product_tbl` (
  `product_id` int(11) NOT NULL auto_increment,
  `product_incharge_id` int(11) default NULL,
  `product_name` varchar(500) default NULL,
  `product_description` varchar(1000) default NULL,
  PRIMARY KEY  (`product_id`),
  KEY `FK_product_tbl_incharge_id` (`product_incharge_id`),
  CONSTRAINT `FK_product_tbl_incharge_id` FOREIGN KEY (`product_incharge_id`) REFERENCES `product_incharge_tbl` (`product_incharge_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product_tbl` */

/*Table structure for table `user_tbl` */

DROP TABLE IF EXISTS `user_tbl`;

CREATE TABLE `user_tbl` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(500) default NULL,
  `user_email` varchar(500) default NULL,
  `user_number` varchar(15) default NULL,
  `user_fcm_token` varchar(500) default NULL,
  `registration_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_tbl` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

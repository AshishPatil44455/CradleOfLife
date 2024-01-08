-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema crowdfunding
--

CREATE DATABASE IF NOT EXISTS crowdfunding;
USE crowdfunding;

--
-- Definition of table `ngodata`
--

DROP TABLE IF EXISTS `ngodata`;
CREATE TABLE `ngodata` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngoid` varchar(45) NOT NULL,
  `ngoname` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `lat` varchar(45) NOT NULL,
  `longt` varchar(45) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ngodata`
--

/*!40000 ALTER TABLE `ngodata` DISABLE KEYS */;
INSERT INTO `ngodata` (`nid`,`ngoid`,`ngoname`,`location`,`lat`,`longt`) VALUES 
 (1,'1','Yashwantrao Chavan Memorial','Pimpri','18.619400','73.729970'),
 (2,'2','Sasoon Hospital','Pune','18.445089','73.868980'),
 (3,'3','Talera Hospital','Akurdi','18.651911','73.797173'),
 (4,'4','Civil Hospital','Belgaum','',''),
 (5,'5','Sardar Vallabh Bhai Patel Hospital','Chhattishgarh','',''),
 (6,'6','Jawahar Lal Nehru Hospital','Kashmir','',''),
 (7,'7','Goverment Hospital Kurnool','Vishakapatnam','',''),
 (8,'8','Maharao Bhimsingh Hospital','Kota,Rajastan','',''),
 (9,'9','Digaru Government Hospital','Assam','',''),
 (10,'10','Parsuram Government Hospital','Haryana','','');
/*!40000 ALTER TABLE `ngodata` ENABLE KEYS */;


--
-- Definition of table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tuserid` varchar(45) NOT NULL,
  `ttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tbal` varchar(45) NOT NULL DEFAULT '0.0',
  `tamt` varchar(45) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` (`tid`,`tuserid`,`ttime`,`tbal`,`tamt`) VALUES 
 (1,'12','2023-08-27 23:50:52','2000.0','2000'),
 (2,'16','2023-08-27 23:52:30','1500.0','1500'),
 (3,'14','2023-08-27 23:53:59','3500.0','3500'),
 (4,'15','2023-08-27 23:55:08','6000.0','6000'),
 (5,'13','2023-08-27 23:58:23','7500.0','7500'),
 (6,'18','2023-08-27 23:59:57','5500.0','5500'),
 (7,'17','2023-08-28 00:01:56','10000.0','10000'),
 (8,'19','2023-08-28 00:03:08','5000.0','5000'),
 (9,'19','2023-08-28 00:04:22','7500.0','7500'),
 (10,'20','2023-08-28 00:05:35','6500.0','6500'),
 (11,'21','2023-08-28 00:06:45','5000.0','5000'),
 (12,'21','2023-08-28 00:07:17','15000.0','15000');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;


--
-- Definition of table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
CREATE TABLE `userdata` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ngo` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phoneno` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` longtext NOT NULL,
  `pancardno` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `roleid` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdata`
--

/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
INSERT INTO `userdata` (`userid`,`ngo`,`name`,`phoneno`,`email`,`address`,`pancardno`,`username`,`password`,`roleid`) VALUES 
 (1,NULL,' ','7276507759','rsshinde1234@gmail.com','ravet pune',NULL,'rohit','rohit','3'),
 (2,'Butterfly',NULL,'9876543210','butterfly@gmail.com','katraj','','butterfly123','butterfly','1'),
 (3,NULL,'Ashish patil','9035344455','ashishkumarpatil44455@gmail.com','belgaum','FTRPP2703L','ashish123','ASHISH','2'),
 (4,'CRY',NULL,'9033456712','childrightsandyou123@gmail.com','Assam','','cry123','cry','1'),
 (5,'Child help Foundation',NULL,'9977886002','chf123@gmail.com','Rajasthan','','chf123','chf','1'),
 (6,'Smile foundation',NULL,'9988678809','smile123@gmail.com','Kashmir','','smile123','smile','1'),
 (7,'Snehalaya',NULL,'9223467021','homeoflove@gmail.com','Pune','','snehalaya123','snehalaya','1'),
 (8,'Genesis Foundation',NULL,'9977889600','savelittlehearts@gmail.com','Pimpri','','genesis123','genesis','1'),
 (9,'Narayan Seva Sansthan',NULL,'9223344560','narayanseva@gmail.com','Belgaum','','narayan123','narayan123','1'),
 (10,'Snehwan',NULL,'9896677525','snehwan@gmail.com','Chhattisgarh','','snehwan123','snehwan','1'),
 (11,'Sparsh foundation',NULL,'9096623461','sparsh@gmail.com','Vishakapatnam','','sparsh123','sparsh','1'),
 (12,NULL,'khyati Raghuwanshi','6266467210','khyati123@gmail.com','Delhi','FTRPP6789A','khyati123','khyati','2'),
 (13,NULL,'Garima Pradhan','9977886260','garimapradhan@gmail.com','Nagpur','ABCDY1234D','garima123','garima','2'),
 (14,NULL,'Shubham Singh','6266321009','shubhamsingh@gmail.com','Mumbai','THUIY6578F','shubham123','shubham','2'),
 (15,NULL,'Mayank Verma','9977889121','mayankverma@gmail.com','Mumbai','PRQTE3451O','mayank123','mayank','2'),
 (16,NULL,'Nidhi Sahu','9893365213','nidhisahu@gmail.com','Bangalore','GHABC5432Y','nidhi123','nidhi','2'),
 (17,NULL,'Rekha Shinde','9666780045','rekhashinde@gmail','Pune','TUYHI4321U','rekha123','rekha','2'),
 (18,NULL,'Tushar Patil','7788906732','tusharpatil@gmail.com','Hyderabad','GHERT7890A','tushar123','tushar','2'),
 (19,NULL,'Saleel Bagde','9972347860','saleelbagde@gmail.com','Pune','RTEUI7658R','saleel123','saleel','2'),
 (20,NULL,'Manoj Deshmukh','9988760342','manojdeshmukh@gmail.com','Pune','MPPNU4532Y','manoj123','manoj','2'),
 (21,NULL,'Savita Vaidya','9778546789','savitavaidya@gmail.com','Pune','PRTTS6789L','savita123','savita','2'),
 (22,'Eternal Bliss',NULL,'9035333455','eternalbliss456@gmail.com','Haryana','','eternalbliss123','eternalbliss','1');
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

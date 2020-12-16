-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: campus_eats_fall2020
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `customer_view`
--

DROP TABLE IF EXISTS `customer_view`;
/*!50001 DROP VIEW IF EXISTS `customer_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_view` AS SELECT 
 1 AS `location`,
 1 AS `restaurant_name`,
 1 AS `schedule`,
 1 AS `website`,
 1 AS `rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `vehicle_id` varchar(75) NOT NULL,
  `license_number` varchar(75) DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`driver_id`),
  KEY `fk_D_student_id` (`student_id`),
  KEY `fk_driver_vehicle1_idx` (`vehicle_id`),
  CONSTRAINT `fk_D_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `fk_driver_vehicle1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94582594 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1057062,169382,'WBA6B4C57FD331188','451947442124','2018-03-21',4.8),(9558242,482578,'WBSDE93452B515694','522270872580','2016-01-09',5),(12050578,86279,'WDCYC3HF7EX904344','303327464890','2019-10-19',2.3),(14597043,714683,'1HGCP2F39AA931969','301877100154','2017-10-14',4.3),(43759944,40968,'1FTFW1E85AF989034','601875750355','2019-11-04',4.2),(44641030,623907,'JTHDU1EF9C5406339','865500622535','2019-11-16',1),(78749024,577555,'5FNYF3H24DB133358','094703262068','2018-04-09',3.9),(94582593,86661,'WA1VKAFP8AA611877','712908095727','2017-06-12',5);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `title` varchar(75) DEFAULT NULL,
  `degree_college` varchar(75) DEFAULT NULL,
  `highest_degree` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`),
  KEY `fk_F_person_id` (`person_id`),
  CONSTRAINT `fk_F_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=999797 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (213675,541568502,'Lecturer','Computer Science','Doctoral'),(315547,208915777,'Associate Professor','Mathematics','Doctoral'),(353818,415234654,'Assistant Professor','Computer Science','Doctoral'),(478735,215278004,'Associate Professor','Computer Science','Doctoral'),(531195,36776461,'Lecturer','Mathematics','Doctoral'),(541802,533004247,'Lecturer','Physics','Doctoral'),(550109,203554511,'Lecturer','Mathematics','Doctoral'),(647475,751956459,'Associate Professor','Computer Science','Doctoral'),(787856,433028227,'Assistant Professor','Physics','Doctoral'),(999796,914792982,'Professor','Physics','Doctoral');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(75) DEFAULT NULL,
  `location_address` varchar(75) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `drop_off_point` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_index_desc` (`location_id` DESC),
  KEY `idx_location_location_name` (`location_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9619072 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (323513,'Hunt Hall','8877 Johnson Alumni Way',35.3016,-80.7365,'Lobby'),(1630682,'Sanford Hall','9029 Johnson Alumni Way',35.303,-80.7335,'Front entrance'),(2206298,'Laurel Hall','8731 Hunt Hall Ln',35.3026,-80.7359,'Front entrance'),(5488949,'Scott Hall','8881 High Rise Rd',35.3018,-80.7353,'Lobby'),(5777198,'Holshouser Hall','8881 Johnson Alumni Way',35.3023,-80.7361,'Back Entrance'),(6137679,'Martin Hall','9240 Cameron Blvd',35.3102,-80.7274,'Lobby'),(8343877,'Oak Hall','9321 Poplar Terrace Dr',35.3091,-80.7442,'Lobby'),(9619071,'Levine Hall','9057 Johnson Alumni Way',35.3027,-80.733,'Under the arch');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `location_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `total_price` float NOT NULL,
  `delivery_charge` float DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `restaurant_rating` int NOT NULL,
  `driver_rating` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_O_person_id` (`person_id`),
  KEY `fk_O_location_id` (`location_id`),
  KEY `fk_O_driver_id` (`driver_id`),
  KEY `fk_O_restaurant_id` (`restaurant_id`),
  CONSTRAINT `fk_O_driver_id` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  CONSTRAINT `fk_O_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_O_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `fk_O_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9442019 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (187187,131749870,9619071,78749024,2973548,31.54,91.71,'2020-12-07 02:21:35',2,5),(319010,811299842,5488949,78749024,1628540,44.72,43.24,'2020-10-17 02:21:35',1,2),(924699,811299842,323513,44641030,832493,19.34,39,'2020-01-27 03:21:35',3,4),(1228137,289697762,1630682,12050578,3220768,28.6,84.31,'2020-01-27 02:21:35',3,4),(1312983,352916909,8343877,14597043,395040,16.17,43.71,'2020-05-27 06:21:35',2,4),(1575030,570447420,323513,1057062,8480219,6.56,83.24,'2020-12-27 16:21:35',4,4),(1783411,463248379,9619071,9558242,1628540,22.81,1,'2020-06-23 02:21:35',3,4),(2447666,745285878,323513,1057062,2973548,19.75,88.24,'2020-02-27 04:21:35',5,2),(3023020,494695073,9619071,44641030,1821563,18.13,26.24,'2020-03-27 03:21:35',4,3),(3183174,115384265,2206298,9558242,395040,15.91,43.12,'2020-06-27 02:21:35',4,2),(3500987,471722937,8343877,1057062,4477059,40.11,51.71,'2020-11-27 21:21:35',4,4),(3652259,678920279,2206298,43759944,832493,20.71,69.24,'2020-10-15 12:21:35',4,2),(3706592,990829336,8343877,1057062,832493,43.01,56.31,'2020-06-23 12:21:35',4,3),(3769161,387630629,6137679,94582593,395040,49.98,83.24,'2020-03-28 02:21:35',2,3),(4107358,213497746,1630682,14597043,832493,6.5,88.71,'2020-06-17 02:21:35',4,2),(4183881,939947527,5777198,44641030,4477059,45.81,51.04,'2020-11-07 22:21:35',3,3),(4239501,378534493,6137679,78749024,8098492,44.49,23.14,'2020-03-25 14:21:35',4,2),(4343652,289697762,2206298,14597043,2112348,28.3,88.24,'2020-06-25 22:21:35',3,1),(4777939,96442070,1630682,1057062,8480219,12.4,92.24,'2020-06-21 14:21:35',4,3),(4863612,404644109,323513,14597043,8480219,34.66,76.71,'2020-09-27 13:21:35',4,5),(6042289,229241954,8343877,94582593,3220768,12.04,46.21,'2020-06-27 02:21:35',3,4),(6104849,324747907,2206298,43759944,8480219,37.85,59.71,'2020-11-27 22:21:35',3,3),(6110875,113380940,5777198,14597043,2112348,10.81,56.23,'2020-05-27 02:21:35',5,2),(6899013,570447420,2206298,94582593,2112348,19.92,3,'2020-02-27 02:21:35',2,2),(7442712,384568217,5488949,1057062,8098492,18.98,17.71,'2020-01-27 15:21:35',4,2),(7792745,811299842,2206298,44641030,1821563,46.51,53.71,'2020-06-22 21:21:35',2,4),(8128604,570447420,323513,12050578,1821563,17.9,82.05,'2020-01-27 02:21:35',3,2),(9041949,96442070,1630682,78749024,8098492,21.96,5.71,'2020-03-17 15:21:35',4,2),(9316071,218412748,5488949,43759944,2973548,31.11,59.71,'2020-03-27 02:21:35',5,2),(9442018,180459633,6137679,9558242,1628540,21.52,82.71,'2020-05-07 16:21:35',5,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `person_name` varchar(300) DEFAULT NULL,
  `person_email` varchar(150) DEFAULT NULL,
  `cell` bigint DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `person_index` (`person_name`)
) ENGINE=InnoDB AUTO_INCREMENT=990829337 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (36776461,'Amandie Skitt','askitt5@instagram.com',7408233163),(37532649,'Burnard Doumerc','bdoumercz@gnu.org',1100698634),(65012936,'Casandra Beetlestone','cbeetlestone1r@ycombinator.com',6627506279),(67679362,'Roi Pagen','rpagen1q@newsvine.com',2840699002),(88874116,'Rollo Oakland','roakland16@hostgator.com',9163103984),(96442070,'Emile Piotrkowski','epiotrkowskin@zimbio.com',1474264170),(113380940,'Alyce Ruse','aruse7@aol.com',9977809484),(115212202,'Chelsea Spenley','cspenley2h@shareasale.com',9604371974),(115384265,'Merwin Payler','mpayler1j@state.tx.us',8461889739),(116131316,'Ludovika McDougall','lmcdougall1e@va.gov',6987856661),(123810736,'Bibbie Hallard','bhallards@booking.com',1762763756),(124501901,'Jennilee Reiners','jreiners2e@addtoany.com',7565188529),(131749870,'Beryle Bason','bbason2d@netlog.com',3458460792),(135904105,'Weber Orgel','worgel29@ox.ac.uk',5836776448),(142353959,'Kane Alessandone','kalessandonet@baidu.com',3101529265),(144389125,'Blondell Gilder','bgilder1o@chron.com',3556041869),(163629780,'Rorie Huggens','rhuggens6@opensource.org',7439886877),(175711488,'Mitch Ciccottini','mciccottinik@buzzfeed.com',7734080882),(180459633,'Glory Buxsey','gbuxseym@bbb.org',7680894366),(191374829,'Henrietta Iacovone','hiacovone2@devhub.com',1673946375),(203554511,'Lonni Glowacha','lglowacha7@ovh.net',241784709),(205268413,'Eada Luchelli','eluchelli14@nymag.com',1887388043),(208915777,'Aryn Rickson','arickson6@google.de',5296054565),(213497746,'Wade Janout','wjanout1a@ucla.edu',5210747649),(215278004,'Glennie Quilligan','gquilligan4@goo.gl',3335615764),(218412748,'Michelle Nern','mnernf@ocn.ne.jp',199594611),(229241954,'Terri Slyman','tslyman24@aol.com',5754183885),(262961749,'Flora McTerrelly','fmcterrellyr@businessinsider.com',6310231695),(288959979,'Devinne Fegan','dfegan1x@bluehost.com',3641111890),(289145585,'Antony Swane','aswane0@zimbio.com',325171160),(289697762,'Stevy Marquese','smarquese1l@geocities.com',2010594006),(307595814,'Elvina Nana','enanax@google.com',4409829122),(310890323,'Querida Lympenie','qlympenie1f@reverbnation.com',4713063356),(324747907,'Taylor Custy','tcustyh@yale.edu',6093650415),(344781022,'Derby McClancy','dmcclancyj@jiathis.com',7818516006),(352916909,'Manny Paffot','mpaffot2g@studiopress.com',5303147524),(354596389,'Toby Aarons','taarons15@reference.com',7080533759),(378534493,'Bertie Blitz','bblitz2b@salon.com',4118369607),(384568217,'Randi Leidl','rleidlc@va.gov',119349386),(387630629,'Ralf Stibbs','rstibbs9@state.tx.us',5682146325),(389452264,'Marsiella Yancey','myancey8@uiuc.edu',2532935930),(392401292,'Valerye Balnave','vbalnavev@wufoo.com',2310569569),(395174232,'Emilio Kadd','ekadd1z@uiuc.edu',3801882434),(404644109,'Lynde Doring','ldoringp@godaddy.com',5989330790),(409216655,'Nari Farebrother','nfarebrother12@mashable.com',3582519439),(415234654,'Jack Coolbear','jcoolbear3@noaa.gov',7741369850),(429153484,'Paten McCaster','pmccaster1n@salon.com',4675796053),(432326260,'Amber Lorkins','alorkinsl@amazonaws.com',8374524651),(433028227,'Blondelle Leadbetter','bleadbetter8@home.pl',2446191376),(439301979,'Milly McNea','mmcnea1k@ifeng.com',8174225734),(442170767,'Cathee Gyrgorcewicx','cgyrgorcewicxo@geocities.com',8513056611),(450955274,'Waylin Ambrogi','wambrogi5@bloglovin.com',9586828048),(456421379,'Holly Coult','hcoult1p@latimes.com',5033917440),(462956359,'Shelley Bambrick','sbambricku@com.com',3985642760),(463248379,'Porter Betteney','pbetteneyg@constantcontact.com',2530951957),(471722937,'Huey Askell','haskell25@pcworld.com',5465899497),(494695073,'Bay Drayton','bdrayton1c@wiley.com',1320384440),(508257577,'Ashlin Steanyng','asteanyng3@parallels.com',4701138478),(518410782,'Aimil Ianson','aianson21@cyberchimps.com',9134772880),(525176258,'Roxana Maestro','rmaestroi@clickbank.net',3107272101),(533004247,'Bernadene Sivewright','bsivewright0@baidu.com',4391204339),(535056575,'Latia Janas','ljanas23@ftc.gov',2055185447),(541568502,'Shawn Kirgan','skirgan1@irs.gov',4992670730),(570447420,'Anny Milham','amilham28@miitbeian.gov.cn',4331674385),(588980357,'Elspeth Fidler','efidler2c@nasa.gov',4922464422),(600148417,'Rosabelle Preece','rpreece11@issuu.com',1407201599),(603145111,'Rockwell Dobsons','rdobsons1d@gnu.org',3036085149),(607380521,'Ailyn Allawy','aallawy19@hostgator.com',1572771496),(615499272,'Emmet Dust','edustb@github.com',2129718778),(641843623,'Sarine Hawk','shawka@eventbrite.com',6605959809),(660060434,'Nathanael Stean','nsteanq@pagesperso-orange.fr',1449821102),(668866984,'Lenna Gwyllt','lgwyllt1w@sbwire.com',1511023476),(670579262,'Myron Yvon','myvon1i@nps.gov',771751176),(678920279,'Sandye Widocks','swidocks4@edublogs.org',6028808553),(694951797,'Lin Pasmore','lpasmore1y@netlog.com',1982827883),(709312219,'Marietta Ernke','mernke2a@icio.us',8370404821),(745285878,'Wallie Atkirk','watkirk17@reverbnation.com',9416071912),(751956459,'Rufus Briddle','rbriddle2@whitehouse.gov',8022871596),(752063957,'Ami Greenig','agreenig22@wordpress.com',5484460967),(754431000,'Cross Hutley','chutley27@dailymail.co.uk',4187377509),(765224564,'Frank Nortcliffe','fnortcliffe26@slashdot.org',9034202308),(768867799,'Dayna Batalini','dbatalini1v@privacy.gov.au',7503005442),(780254086,'Steffen Healings','shealings1s@cornell.edu',5276029728),(806144332,'Madelon Bonniface','mbonniface1g@i2i.jp',1540280551),(811299842,'Emmerich Arzu','earzuw@t-online.de',2466774279),(822234727,'Ulrich Mc Combe','umc18@youku.com',4006483657),(824324885,'Brietta Southwell','bsouthwell1h@cmu.edu',6845334740),(841963635,'Enrika Telega','etelega10@usa.gov',7067735873),(854820807,'Carmine Wallwork','cwallwork2f@qq.com',8080178305),(883812800,'Astrid Soppit','asoppity@nationalgeographic.com',4909313856),(890858326,'Van Aldred','valdred1m@gravatar.com',9161576200),(891301945,'Linea Perring','lperring1t@imgur.com',3095867310),(901779825,'Shalom De Morena','sded@soup.io',7551073133),(914792982,'Honey Roylance','hroylance9@addthis.com',9019492497),(939947527,'Elihu Yurshev','eyursheve@aol.com',2742977937),(944474657,'Leonid Worboys','lworboys13@live.com',9014261514),(967082013,'Abeu Astie','aastie1b@alibaba.com',9739087621),(969223224,'Maighdiln Kilby','mkilby1u@irs.gov',8529403381),(980463203,'Francis Lernihan','flernihan1@reference.com',8701420859),(990829336,'Vanna Miskimmon','vmiskimmon20@amazon.de',3362065801);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `person_join`
--

DROP TABLE IF EXISTS `person_join`;
/*!50001 DROP VIEW IF EXISTS `person_join`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `person_join` AS SELECT 
 1 AS `person_id`,
 1 AS `person_name`,
 1 AS `person_email`,
 1 AS `student_id`,
 1 AS `graduation_year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `person_student`
--

DROP TABLE IF EXISTS `person_student`;
/*!50001 DROP VIEW IF EXISTS `person_student`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `person_student` AS SELECT 
 1 AS `person_id`,
 1 AS `person_name`,
 1 AS `person_email`,
 1 AS `cell`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(75) DEFAULT NULL,
  `restaurant_name` varchar(75) DEFAULT NULL,
  `schedule` varchar(75) DEFAULT NULL,
  `website` varchar(75) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8480220 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (395040,'3685 Bowman Court','Panda Express','10:30 AM - 9:30 PM','PandaExpress.com',4.1),(832493,'4376 Texas Road','Einstein Bagels','9:00 AM - 10:00 PM','EinsteinBagels.com',4.1),(1628540,'8487 Becker Street','Amelie’s','7:00 AM - 10:00 PM','Amelies.com',3.1),(1821563,'9 Melby Way','Bojangles','10:00 AM - 9:00 PM','Bojangles.com',4.5),(2112348,'04885 Mitchell Lane','Domino\'s','9:30 AM - 1:00 AM','Dominos.com',4.2),(2973548,'6208 La Follette Center','Mocha Joe\'s','6:00 AM - 7:00 PM','MochaJoes.com',3.2),(3220768,'6 Calypso Crossing','Subway','9:30 AM - 1:00 AM','Subway.com',2.1),(4477059,'46887 Oak Trail','Starbucks','7:00 AM - 7:00 PM','Starbucks.com',4),(8098492,'69 Pleasure Parkway','Chick-Fil-A','9:00 AM - 10:00 PM','ChickFilA.com',3.1),(8480219,'86 Algoma Way','Wendy\'s','7:30 AM - 11:30 PM','Wendys.com',1.1);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int DEFAULT NULL,
  `position` varchar(75) DEFAULT NULL,
  `is_admin` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`staff_id`),
  KEY `fk_S_person_id` (`person_id`),
  KEY `staff_position` (`position`),
  CONSTRAINT `fk_S_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=984580 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (24693,678920279,'Director of Information Technology','0'),(79737,450955274,'Associate Director of Information Technology','0'),(88292,389452264,'Catering Manager','1'),(431579,980463203,'Director of Operations','1'),(433635,387630629,'Director of Logistics','0'),(617267,191374829,'Director of Dining','0'),(759092,508257577,'Associate Operations Controller ','0'),(912707,113380940,'Student Outreach President','1'),(924236,289145585,'Resident District Manager ','1'),(984579,163629780,'Executive Chef','0');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `graduation_year` int DEFAULT NULL,
  `major` varchar(75) DEFAULT NULL,
  `type` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `fk_St_person_id` (`person_id`),
  CONSTRAINT `fk_St_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=994540 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (5001,660060434,2023,'History','Graduate'),(27971,694951797,2023,'Business','Graduate'),(40968,37532649,2020,'Criminal Justice','Graduate'),(45293,144389125,2020,'Physics','Graduate'),(48771,65012936,2022,'Mechanical Engineering','Undergraduate'),(70396,463248379,2021,'Nursing','Graduate'),(71089,218412748,2021,'Finance','Graduate'),(84214,115212202,2021,'Physics','Undergraduate'),(86279,841963635,2022,'Mathematics','Undergraduate'),(86661,354596389,2021,'Economics','Undergraduate'),(87348,96442070,2020,'Education','Undergraduate'),(92720,344781022,2022,'Communications','Graduate'),(129788,745285878,2021,'Communications','Graduate'),(143366,967082013,2021,'Nursing','Graduate'),(158183,229241954,2021,'Education','Graduate'),(159575,378534493,2022,'English','Graduate'),(163648,806144332,2020,'Computer Science','Undergraduate'),(167258,180459633,2020,'Business','Graduate'),(169382,205268413,2023,'Computer Science','Undergraduate'),(226596,670579262,2020,'Mathematics','Undergraduate'),(236620,588980357,2024,'Sociology','Graduate'),(263010,890858326,2023,'Business','Graduate'),(265458,142353959,2023,'Psychology','Undergraduate'),(297160,462956359,2024,'Communications','Undergraduate'),(318194,67679362,2020,'Mathematics','Undergraduate'),(332365,709312219,2022,'Physics','Graduate'),(347267,969223224,2020,'Business','Undergraduate'),(390951,439301979,2021,'Criminal Justice','Undergraduate'),(393438,668866984,2021,'Sociology','Graduate'),(439660,811299842,2020,'Computer Science','Undergraduate'),(453343,891301945,2024,'Education','Undergraduate'),(456888,429153484,2021,'Criminal Justice','Undergraduate'),(468655,307595814,2024,'Sociology','Undergraduate'),(481734,768867799,2021,'Physics','Graduate'),(482578,409216655,2024,'Criminal Justice','Undergraduate'),(486764,525176258,2021,'Political Science','Graduate'),(491537,175711488,2020,'Computer Science','Graduate'),(520226,754431000,2022,'Economics','Graduate'),(544806,603145111,2020,'Business','Undergraduate'),(546334,131749870,2021,'Mathematics','Undergraduate'),(546762,607380521,2023,'Finance','Undergraduate'),(549848,535056575,2024,'Electrical Engineering','Undergraduate'),(552330,116131316,2022,'Nursing','Undergraduate'),(575458,456421379,2024,'Business','Undergraduate'),(577555,883812800,2024,'Computer Science','Graduate'),(578959,123810736,2023,'Nursing','Undergraduate'),(586662,824324885,2021,'Business','Undergraduate'),(621265,518410782,2022,'Nursing','Graduate'),(623907,944474657,2023,'Finance','Graduate'),(630318,442170767,2022,'Communications','Graduate'),(632375,395174232,2020,'Nursing','Graduate'),(633323,384568217,2020,'Mathematics','Undergraduate'),(656292,765224564,2022,'Communications','Graduate'),(661859,310890323,2021,'History','Graduate'),(668984,570447420,2020,'Nursing','Graduate'),(708614,213497746,2021,'Physics','Undergraduate'),(714683,600148417,2022,'Physics','Undergraduate'),(720169,432326260,2022,'Physics','Graduate'),(746145,404644109,2022,'Nursing','Undergraduate'),(751258,289697762,2021,'Nursing','Graduate'),(775309,854820807,2021,'Sociology','Graduate'),(781354,780254086,2024,'Psychology','Graduate'),(802126,990829336,2020,'Mathematics','Graduate'),(810921,124501901,2020,'Mechanical Engineering','Undergraduate'),(835428,641843623,2023,'Business','Undergraduate'),(842820,115384265,2022,'Mathematics','Graduate'),(850431,135904105,2020,'Psychology','Graduate'),(853926,752063957,2023,'Economics','Graduate'),(864640,288959979,2024,'Physics','Undergraduate'),(865309,615499272,2022,'Economics','Graduate'),(872010,901779825,2024,'Finance','Graduate'),(876211,324747907,2024,'Nursing','Graduate'),(882770,939947527,2021,'Communications','Undergraduate'),(890964,352916909,2023,'Political Science','Graduate'),(911549,494695073,2021,'Psychology','Undergraduate'),(928882,262961749,2024,'Mathematics','Graduate'),(938944,392401292,2024,'Finance','Graduate'),(943364,88874116,2024,'Nursing','Graduate'),(967618,822234727,2024,'Physics','Undergraduate'),(994539,471722937,2024,'History','Graduate');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_customer_view`
--

DROP TABLE IF EXISTS `top_customer_view`;
/*!50001 DROP VIEW IF EXISTS `top_customer_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_customer_view` AS SELECT 
 1 AS `person_name`,
 1 AS `person_email`,
 1 AS `orders_placed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_driver_earnings_view`
--

DROP TABLE IF EXISTS `total_driver_earnings_view`;
/*!50001 DROP VIEW IF EXISTS `total_driver_earnings_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_driver_earnings_view` AS SELECT 
 1 AS `driver_name`,
 1 AS `total_delivery_earnings`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vehicle_id` varchar(75) NOT NULL,
  `vehicle_plate` varchar(75) DEFAULT NULL,
  `model` varchar(75) DEFAULT NULL,
  `make` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('1FTFW1E85AF989034','HDK8852','Camry','Toyota'),('1HGCP2F39AA931969','INA1902','Corolla','Toyota'),('5FNYF3H24DB133358','SWF1410','Camry','Toyota'),('JTHDU1EF9C5406339','YMV1645','Accord','Honda'),('WA1VKAFP8AA611877','PGK7205','Civic','Honda'),('WBA6B4C57FD331188','NQR9782','Civic','Honda'),('WBSDE93452B515694','XAM5712','Yaris','Toyota'),('WDCYC3HF7EX904344','VQD0758','Prius','Toyota');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_view` AS select `restaurant`.`location` AS `location`,`restaurant`.`restaurant_name` AS `restaurant_name`,`restaurant`.`schedule` AS `schedule`,`restaurant`.`website` AS `website`,`restaurant`.`rating` AS `rating` from `restaurant` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_join`
--

/*!50001 DROP VIEW IF EXISTS `person_join`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_join` AS select `person`.`person_id` AS `person_id`,`person`.`person_name` AS `person_name`,`person`.`person_email` AS `person_email`,`student`.`student_id` AS `student_id`,`student`.`graduation_year` AS `graduation_year` from (`person` join `student` on((`student`.`person_id` = `person`.`person_id`))) where (`student`.`major` = 'Computer Science') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_student`
--

/*!50001 DROP VIEW IF EXISTS `person_student`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_student` AS select `a`.`person_id` AS `person_id`,`a`.`person_name` AS `person_name`,`a`.`person_email` AS `person_email`,`a`.`cell` AS `cell` from `person` `a` where `a`.`person_id` in (select `student`.`person_id` from `student` where (`student`.`graduation_year` = 2019)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_customer_view`
--

/*!50001 DROP VIEW IF EXISTS `top_customer_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_customer_view` AS select `person`.`person_name` AS `person_name`,`person`.`person_email` AS `person_email`,count(0) AS `orders_placed` from (`person` join `order` on((`person`.`person_id` = `order`.`person_id`))) group by `order`.`person_id` order by `orders_placed` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_driver_earnings_view`
--

/*!50001 DROP VIEW IF EXISTS `total_driver_earnings_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_driver_earnings_view` AS select `person`.`person_name` AS `driver_name`,sum(`order`.`delivery_charge`) AS `total_delivery_earnings` from (((`driver` join `order` on((`order`.`driver_id` = `driver`.`driver_id`))) join `student` on((`driver`.`student_id` = `student`.`student_id`))) join `person` on((`student`.`person_id` = `person`.`person_id`))) group by `driver_name` order by `total_delivery_earnings` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-15 23:35:56

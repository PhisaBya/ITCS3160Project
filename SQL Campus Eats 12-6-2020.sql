-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema campus_eats_fall2020
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema campus_eats_fall2020
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `campus_eats_fall2020` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `campus_eats_fall2020` ;

-- -----------------------------------------------------
-- Table `campus_eats_fall2020`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`person` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `person_name` VARCHAR(300) NULL DEFAULT NULL,
  `person_email` VARCHAR(150) NULL DEFAULT NULL,
  `cell` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`person_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 206
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `campus_eats_fall2020`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `graduation_year` INT NULL DEFAULT NULL,
  `major` VARCHAR(75) NULL DEFAULT NULL,
  `type` VARCHAR(75) NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_St_person_id` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_St_person_id`
    FOREIGN KEY (`person_id`)
    REFERENCES `campus_eats_fall2020`.`person` (`person_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 152
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `campus_eats_fall2020`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`vehicle` (
  `vehicle_id` VARCHAR(75) NOT NULL,
  `vehicle_plate` VARCHAR(75) NULL DEFAULT NULL,
  `model` VARCHAR(75) NULL DEFAULT NULL,
  `make` VARCHAR(75) NULL DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `campus_eats_fall2020`.`driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`driver` (
  `driver_id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `vehicle_id` VARCHAR(75) NOT NULL,
  `license_number` VARCHAR(75) NULL DEFAULT NULL,
  `date_hired` DATE NULL DEFAULT NULL,
  `rating` FLOAT NULL,
  PRIMARY KEY (`driver_id`),
  INDEX `fk_D_student_id` (`student_id` ASC) VISIBLE,
  INDEX `fk_driver_vehicle1_idx` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `fk_D_student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `campus_eats_fall2020`.`student` (`student_id`),
  CONSTRAINT `fk_driver_vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `campus_eats_fall2020`.`vehicle` (`vehicle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `campus_eats_fall2020`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`faculty` (
  `faculty_id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `title` VARCHAR(75) NULL DEFAULT NULL,
  `degree_college` VARCHAR(75) NULL DEFAULT NULL,
  `highest_degree` VARCHAR(75) NULL DEFAULT NULL,
  PRIMARY KEY (`faculty_id`),
  INDEX `fk_F_person_id` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_F_person_id`
    FOREIGN KEY (`person_id`)
    REFERENCES `campus_eats_fall2020`.`person` (`person_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `campus_eats_fall2020`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(75) NULL DEFAULT NULL,
  `location_address` VARCHAR(75) NULL DEFAULT NULL,
  `latitude` FLOAT NULL DEFAULT NULL,
  `longitude` FLOAT NULL DEFAULT NULL,
  `drop_off_point` VARCHAR(75) NULL DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE INDEX `location_index_desc` (`location_id` DESC) VISIBLE,
  INDEX `idx_location_location_name` (`location_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `campus_eats_fall2020`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`restaurant` (
  `restaurant_id` INT NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(75) NULL DEFAULT NULL,
  `restaurant_name` VARCHAR(75) NULL DEFAULT NULL,
  `schedule` VARCHAR(75) NULL DEFAULT NULL,
  `website` VARCHAR(75) NULL DEFAULT NULL,
  `rating` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `campus_eats_fall2020`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `driver_id` INT NOT NULL,
  `restaurant_id` INT NOT NULL,
  `total_price` FLOAT NOT NULL,
  `delivery_charge` FLOAT NULL,
  `delivery_time` DATETIME NULL,
  `restaurant_rating` INT NOT NULL,
  `driver_rating` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_O_person_id` (`person_id` ASC) VISIBLE,
  INDEX `fk_O_location_id` (`location_id` ASC) VISIBLE,
  INDEX `fk_O_driver_id` (`driver_id` ASC) VISIBLE,
  INDEX `fk_O_restaurant_id` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_O_driver_id`
    FOREIGN KEY (`driver_id`)
    REFERENCES `campus_eats_fall2020`.`driver` (`driver_id`),
  CONSTRAINT `fk_O_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `campus_eats_fall2020`.`location` (`location_id`),
  CONSTRAINT `fk_O_person_id`
    FOREIGN KEY (`person_id`)
    REFERENCES `campus_eats_fall2020`.`person` (`person_id`),
  CONSTRAINT `fk_O_restaurant_id`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `campus_eats_fall2020`.`restaurant` (`restaurant_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 102
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `campus_eats_fall2020`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NULL DEFAULT NULL,
  `position` VARCHAR(75) NULL DEFAULT NULL,
  `is_admin` VARCHAR(1) NULL DEFAULT 'N',
  PRIMARY KEY (`staff_id`),
  INDEX `fk_S_person_id` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_S_person_id`
    FOREIGN KEY (`person_id`)
    REFERENCES `campus_eats_fall2020`.`person` (`person_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = latin1;

USE `campus_eats_fall2020` ;

-- -----------------------------------------------------
-- Placeholder table for view `campus_eats_fall2020`.`person_join`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`person_join` (`person_id` INT, `person_name` INT, `person_email` INT, `student_id` INT, `graduation_year` INT);

-- -----------------------------------------------------
-- Placeholder table for view `campus_eats_fall2020`.`person_student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`person_student` (`person_id` INT, `person_name` INT, `person_email` INT, `cell` INT);


-- -----------------------------------------------------
-- procedure RestaurantAverage 
-- -----------------------------------------------------
DELIMITER $$
USE `campus_eats_fall2020`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `RestaurantAverage` (IN r_id INT, OUT average FLOAT)
BEGIN
	SELECT AVG(Cast(restaurant_rating as FLOAT)) 
	INTO average
	FROM `order`
	WHERE restaurant_id = r_id;

END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateRestaurantAverage
-- -----------------------------------------------------
DELIMITER $$
USE `campus_eats_fall2020`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateRestaurantAverage` (IN restaurant_avg FLOAT, IN r_id INT)
BEGIN
	UPDATE restaurant
    SET rating = restaurant_avg
    WHERE restaurant_id = r_id;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure DriverAverage 
-- -----------------------------------------------------
DELIMITER $$
USE `campus_eats_fall2020`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DriverAverage` (IN d_id INT, OUT average FLOAT)
BEGIN
	SELECT AVG(Cast(driver_rating as FLOAT)) 
	INTO average
	FROM `order`
	WHERE driver_id = d_id;

END$$
DELIMITER ;



-- -----------------------------------------------------
-- procedure UpdateDriverAverage
-- -----------------------------------------------------
DELIMITER $$
USE `campus_eats_fall2020`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDriverAverage` (IN driver_avg FLOAT, IN d_id INT)
BEGIN
	UPDATE driver
    SET rating = driver_avg
    WHERE driver_id = d_id;
END$$
DELIMITER ;


-- -----------------------------------------------------
-- View `campus_eats_fall2020`.`person_join`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `campus_eats_fall2020`.`person_join`;
USE `campus_eats_fall2020`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `campus_eats_fall2020`.`person_join` AS select `campus_eats_fall2020`.`person`.`person_id` AS `person_id`,`campus_eats_fall2020`.`person`.`person_name` AS `person_name`,`campus_eats_fall2020`.`person`.`person_email` AS `person_email`,`campus_eats_fall2020`.`student`.`student_id` AS `student_id`,`campus_eats_fall2020`.`student`.`graduation_year` AS `graduation_year` from (`campus_eats_fall2020`.`person` join `campus_eats_fall2020`.`student` on((`campus_eats_fall2020`.`student`.`person_id` = `campus_eats_fall2020`.`person`.`person_id`))) where (`campus_eats_fall2020`.`student`.`major` = 'Computer Science');

-- -----------------------------------------------------
-- View `campus_eats_fall2020`.`person_student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `campus_eats_fall2020`.`person_student`;
USE `campus_eats_fall2020`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `campus_eats_fall2020`.`person_student` AS select `a`.`person_id` AS `person_id`,`a`.`person_name` AS `person_name`,`a`.`person_email` AS `person_email`,`a`.`cell` AS `cell` from `campus_eats_fall2020`.`person` `a` where `a`.`person_id` in (select `campus_eats_fall2020`.`student`.`person_id` from `campus_eats_fall2020`.`student` where (`campus_eats_fall2020`.`student`.`graduation_year` = 2019));
USE `campus_eats_fall2020`;

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

#Insert persons (100)
insert into person (person_id, person_name, person_email, cell) values ('289145585', 'Antony Swane', 'aswane0@zimbio.com', '0325171160');
insert into person (person_id, person_name, person_email, cell) values ('980463203', 'Francis Lernihan', 'flernihan1@reference.com', '8701420859');
insert into person (person_id, person_name, person_email, cell) values ('191374829', 'Henrietta Iacovone', 'hiacovone2@devhub.com', '1673946375');
insert into person (person_id, person_name, person_email, cell) values ('508257577', 'Ashlin Steanyng', 'asteanyng3@parallels.com', '4701138478');
insert into person (person_id, person_name, person_email, cell) values ('678920279', 'Sandye Widocks', 'swidocks4@edublogs.org', '6028808553');
insert into person (person_id, person_name, person_email, cell) values ('450955274', 'Waylin Ambrogi', 'wambrogi5@bloglovin.com', '9586828048');
insert into person (person_id, person_name, person_email, cell) values ('163629780', 'Rorie Huggens', 'rhuggens6@opensource.org', '7439886877');
insert into person (person_id, person_name, person_email, cell) values ('113380940', 'Alyce Ruse', 'aruse7@aol.com', '9977809484');
insert into person (person_id, person_name, person_email, cell) values ('389452264', 'Marsiella Yancey', 'myancey8@uiuc.edu', '2532935930');
insert into person (person_id, person_name, person_email, cell) values ('387630629', 'Ralf Stibbs', 'rstibbs9@state.tx.us', '5682146325');
insert into person (person_id, person_name, person_email, cell) values ('533004247', 'Bernadene Sivewright', 'bsivewright0@baidu.com', '4391204339');
insert into person (person_id, person_name, person_email, cell) values ('541568502', 'Shawn Kirgan', 'skirgan1@irs.gov', '4992670730');
insert into person (person_id, person_name, person_email, cell) values ('751956459', 'Rufus Briddle', 'rbriddle2@whitehouse.gov', '8022871596');
insert into person (person_id, person_name, person_email, cell) values ('415234654', 'Jack Coolbear', 'jcoolbear3@noaa.gov', '7741369850');
insert into person (person_id, person_name, person_email, cell) values ('215278004', 'Glennie Quilligan', 'gquilligan4@goo.gl', '3335615764');
insert into person (person_id, person_name, person_email, cell) values ('036776461', 'Amandie Skitt', 'askitt5@instagram.com', '7408233163');
insert into person (person_id, person_name, person_email, cell) values ('208915777', 'Aryn Rickson', 'arickson6@google.de', '5296054565');
insert into person (person_id, person_name, person_email, cell) values ('203554511', 'Lonni Glowacha', 'lglowacha7@ovh.net', '0241784709');
insert into person (person_id, person_name, person_email, cell) values ('433028227', 'Blondelle Leadbetter', 'bleadbetter8@home.pl', '2446191376');
insert into person (person_id, person_name, person_email, cell) values ('914792982', 'Honey Roylance', 'hroylance9@addthis.com', '9019492497');
insert into person (person_id, person_name, person_email, cell) values ('641843623', 'Sarine Hawk', 'shawka@eventbrite.com', '6605959809');
insert into person (person_id, person_name, person_email, cell) values ('615499272', 'Emmet Dust', 'edustb@github.com', '2129718778');
insert into person (person_id, person_name, person_email, cell) values ('384568217', 'Randi Leidl', 'rleidlc@va.gov', '0119349386');
insert into person (person_id, person_name, person_email, cell) values ('901779825', 'Shalom De Morena', 'sded@soup.io', '7551073133');
insert into person (person_id, person_name, person_email, cell) values ('939947527', 'Elihu Yurshev', 'eyursheve@aol.com', '2742977937');
insert into person (person_id, person_name, person_email, cell) values ('218412748', 'Michelle Nern', 'mnernf@ocn.ne.jp', '0199594611');
insert into person (person_id, person_name, person_email, cell) values ('463248379', 'Porter Betteney', 'pbetteneyg@constantcontact.com', '2530951957');
insert into person (person_id, person_name, person_email, cell) values ('324747907', 'Taylor Custy', 'tcustyh@yale.edu', '6093650415');
insert into person (person_id, person_name, person_email, cell) values ('525176258', 'Roxana Maestro', 'rmaestroi@clickbank.net', '3107272101');
insert into person (person_id, person_name, person_email, cell) values ('344781022', 'Derby McClancy', 'dmcclancyj@jiathis.com', '7818516006');
insert into person (person_id, person_name, person_email, cell) values ('175711488', 'Mitch Ciccottini', 'mciccottinik@buzzfeed.com', '7734080882');
insert into person (person_id, person_name, person_email, cell) values ('432326260', 'Amber Lorkins', 'alorkinsl@amazonaws.com', '8374524651');
insert into person (person_id, person_name, person_email, cell) values ('180459633', 'Glory Buxsey', 'gbuxseym@bbb.org', '7680894366');
insert into person (person_id, person_name, person_email, cell) values ('096442070', 'Emile Piotrkowski', 'epiotrkowskin@zimbio.com', '1474264170');
insert into person (person_id, person_name, person_email, cell) values ('442170767', 'Cathee Gyrgorcewicx', 'cgyrgorcewicxo@geocities.com', '8513056611');
insert into person (person_id, person_name, person_email, cell) values ('404644109', 'Lynde Doring', 'ldoringp@godaddy.com', '5989330790');
insert into person (person_id, person_name, person_email, cell) values ('660060434', 'Nathanael Stean', 'nsteanq@pagesperso-orange.fr', '1449821102');
insert into person (person_id, person_name, person_email, cell) values ('262961749', 'Flora McTerrelly', 'fmcterrellyr@businessinsider.com', '6310231695');
insert into person (person_id, person_name, person_email, cell) values ('123810736', 'Bibbie Hallard', 'bhallards@booking.com', '1762763756');
insert into person (person_id, person_name, person_email, cell) values ('142353959', 'Kane Alessandone', 'kalessandonet@baidu.com', '3101529265');
insert into person (person_id, person_name, person_email, cell) values ('462956359', 'Shelley Bambrick', 'sbambricku@com.com', '3985642760');
insert into person (person_id, person_name, person_email, cell) values ('392401292', 'Valerye Balnave', 'vbalnavev@wufoo.com', '2310569569');
insert into person (person_id, person_name, person_email, cell) values ('811299842', 'Emmerich Arzu', 'earzuw@t-online.de', '2466774279');
insert into person (person_id, person_name, person_email, cell) values ('307595814', 'Elvina Nana', 'enanax@google.com', '4409829122');
insert into person (person_id, person_name, person_email, cell) values ('883812800', 'Astrid Soppit', 'asoppity@nationalgeographic.com', '4909313856');
insert into person (person_id, person_name, person_email, cell) values ('037532649', 'Burnard Doumerc', 'bdoumercz@gnu.org', '1100698634');
insert into person (person_id, person_name, person_email, cell) values ('841963635', 'Enrika Telega', 'etelega10@usa.gov', '7067735873');
insert into person (person_id, person_name, person_email, cell) values ('600148417', 'Rosabelle Preece', 'rpreece11@issuu.com', '1407201599');
insert into person (person_id, person_name, person_email, cell) values ('409216655', 'Nari Farebrother', 'nfarebrother12@mashable.com', '3582519439');
insert into person (person_id, person_name, person_email, cell) values ('944474657', 'Leonid Worboys', 'lworboys13@live.com', '9014261514');
insert into person (person_id, person_name, person_email, cell) values ('205268413', 'Eada Luchelli', 'eluchelli14@nymag.com', '1887388043');
insert into person (person_id, person_name, person_email, cell) values ('354596389', 'Toby Aarons', 'taarons15@reference.com', '7080533759');
insert into person (person_id, person_name, person_email, cell) values ('088874116', 'Rollo Oakland', 'roakland16@hostgator.com', '9163103984');
insert into person (person_id, person_name, person_email, cell) values ('745285878', 'Wallie Atkirk', 'watkirk17@reverbnation.com', '9416071912');
insert into person (person_id, person_name, person_email, cell) values ('822234727', 'Ulrich Mc Combe', 'umc18@youku.com', '4006483657');
insert into person (person_id, person_name, person_email, cell) values ('607380521', 'Ailyn Allawy', 'aallawy19@hostgator.com', '1572771496');
insert into person (person_id, person_name, person_email, cell) values ('213497746', 'Wade Janout', 'wjanout1a@ucla.edu', '5210747649');
insert into person (person_id, person_name, person_email, cell) values ('967082013', 'Abeu Astie', 'aastie1b@alibaba.com', '9739087621');
insert into person (person_id, person_name, person_email, cell) values ('494695073', 'Bay Drayton', 'bdrayton1c@wiley.com', '1320384440');
insert into person (person_id, person_name, person_email, cell) values ('603145111', 'Rockwell Dobsons', 'rdobsons1d@gnu.org', '3036085149');
insert into person (person_id, person_name, person_email, cell) values ('116131316', 'Ludovika McDougall', 'lmcdougall1e@va.gov', '6987856661');
insert into person (person_id, person_name, person_email, cell) values ('310890323', 'Querida Lympenie', 'qlympenie1f@reverbnation.com', '4713063356');
insert into person (person_id, person_name, person_email, cell) values ('806144332', 'Madelon Bonniface', 'mbonniface1g@i2i.jp', '1540280551');
insert into person (person_id, person_name, person_email, cell) values ('824324885', 'Brietta Southwell', 'bsouthwell1h@cmu.edu', '6845334740');
insert into person (person_id, person_name, person_email, cell) values ('670579262', 'Myron Yvon', 'myvon1i@nps.gov', '0771751176');
insert into person (person_id, person_name, person_email, cell) values ('115384265', 'Merwin Payler', 'mpayler1j@state.tx.us', '8461889739');
insert into person (person_id, person_name, person_email, cell) values ('439301979', 'Milly McNea', 'mmcnea1k@ifeng.com', '8174225734');
insert into person (person_id, person_name, person_email, cell) values ('289697762', 'Stevy Marquese', 'smarquese1l@geocities.com', '2010594006');
insert into person (person_id, person_name, person_email, cell) values ('890858326', 'Van Aldred', 'valdred1m@gravatar.com', '9161576200');
insert into person (person_id, person_name, person_email, cell) values ('429153484', 'Paten McCaster', 'pmccaster1n@salon.com', '4675796053');
insert into person (person_id, person_name, person_email, cell) values ('144389125', 'Blondell Gilder', 'bgilder1o@chron.com', '3556041869');
insert into person (person_id, person_name, person_email, cell) values ('456421379', 'Holly Coult', 'hcoult1p@latimes.com', '5033917440');
insert into person (person_id, person_name, person_email, cell) values ('067679362', 'Roi Pagen', 'rpagen1q@newsvine.com', '2840699002');
insert into person (person_id, person_name, person_email, cell) values ('065012936', 'Casandra Beetlestone', 'cbeetlestone1r@ycombinator.com', '6627506279');
insert into person (person_id, person_name, person_email, cell) values ('780254086', 'Steffen Healings', 'shealings1s@cornell.edu', '5276029728');
insert into person (person_id, person_name, person_email, cell) values ('891301945', 'Linea Perring', 'lperring1t@imgur.com', '3095867310');
insert into person (person_id, person_name, person_email, cell) values ('969223224', 'Maighdiln Kilby', 'mkilby1u@irs.gov', '8529403381');
insert into person (person_id, person_name, person_email, cell) values ('768867799', 'Dayna Batalini', 'dbatalini1v@privacy.gov.au', '7503005442');
insert into person (person_id, person_name, person_email, cell) values ('668866984', 'Lenna Gwyllt', 'lgwyllt1w@sbwire.com', '1511023476');
insert into person (person_id, person_name, person_email, cell) values ('288959979', 'Devinne Fegan', 'dfegan1x@bluehost.com', '3641111890');
insert into person (person_id, person_name, person_email, cell) values ('694951797', 'Lin Pasmore', 'lpasmore1y@netlog.com', '1982827883');
insert into person (person_id, person_name, person_email, cell) values ('395174232', 'Emilio Kadd', 'ekadd1z@uiuc.edu', '3801882434');
insert into person (person_id, person_name, person_email, cell) values ('990829336', 'Vanna Miskimmon', 'vmiskimmon20@amazon.de', '3362065801');
insert into person (person_id, person_name, person_email, cell) values ('518410782', 'Aimil Ianson', 'aianson21@cyberchimps.com', '9134772880');
insert into person (person_id, person_name, person_email, cell) values ('752063957', 'Ami Greenig', 'agreenig22@wordpress.com', '5484460967');
insert into person (person_id, person_name, person_email, cell) values ('535056575', 'Latia Janas', 'ljanas23@ftc.gov', '2055185447');
insert into person (person_id, person_name, person_email, cell) values ('229241954', 'Terri Slyman', 'tslyman24@aol.com', '5754183885');
insert into person (person_id, person_name, person_email, cell) values ('471722937', 'Huey Askell', 'haskell25@pcworld.com', '5465899497');
insert into person (person_id, person_name, person_email, cell) values ('765224564', 'Frank Nortcliffe', 'fnortcliffe26@slashdot.org', '9034202308');
insert into person (person_id, person_name, person_email, cell) values ('754431000', 'Cross Hutley', 'chutley27@dailymail.co.uk', '4187377509');
insert into person (person_id, person_name, person_email, cell) values ('570447420', 'Anny Milham', 'amilham28@miitbeian.gov.cn', '4331674385');
insert into person (person_id, person_name, person_email, cell) values ('135904105', 'Weber Orgel', 'worgel29@ox.ac.uk', '5836776448');
insert into person (person_id, person_name, person_email, cell) values ('709312219', 'Marietta Ernke', 'mernke2a@icio.us', '8370404821');
insert into person (person_id, person_name, person_email, cell) values ('378534493', 'Bertie Blitz', 'bblitz2b@salon.com', '4118369607');
insert into person (person_id, person_name, person_email, cell) values ('588980357', 'Elspeth Fidler', 'efidler2c@nasa.gov', '4922464422');
insert into person (person_id, person_name, person_email, cell) values ('131749870', 'Beryle Bason', 'bbason2d@netlog.com', '3458460792');
insert into person (person_id, person_name, person_email, cell) values ('124501901', 'Jennilee Reiners', 'jreiners2e@addtoany.com', '7565188529');
insert into person (person_id, person_name, person_email, cell) values ('854820807', 'Carmine Wallwork', 'cwallwork2f@qq.com', '8080178305');
insert into person (person_id, person_name, person_email, cell) values ('352916909', 'Manny Paffot', 'mpaffot2g@studiopress.com', '5303147524');
insert into person (person_id, person_name, person_email, cell) values ('115212202', 'Chelsea Spenley', 'cspenley2h@shareasale.com', '9604371974');

#Insert staff (10)
insert into staff (staff_id, person_id, position, is_admin) values ('924236', '289145585', 'Resident District Manager ', 1);
insert into staff (staff_id, person_id, position, is_admin) values ('431579', '980463203', 'Director of Operations', 1);
insert into staff (staff_id, person_id, position, is_admin) values ('617267', '191374829', 'Director of Dining', 0);
insert into staff (staff_id, person_id, position, is_admin) values ('759092', '508257577', 'Associate Operations Controller ', 0);
insert into staff (staff_id, person_id, position, is_admin) values ('024693', '678920279', 'Director of Information Technology', 0);
insert into staff (staff_id, person_id, position, is_admin) values ('079737', '450955274', 'Associate Director of Information Technology', 0);
insert into staff (staff_id, person_id, position, is_admin) values ('984579', '163629780', 'Executive Chef', 0);
insert into staff (staff_id, person_id, position, is_admin) values ('912707', '113380940', 'Student Outreach President', 1);
insert into staff (staff_id, person_id, position, is_admin) values ('088292', '389452264', 'Catering Manager', 1);
insert into staff (staff_id, person_id, position, is_admin) values ('433635', '387630629', 'Director of Logistics', 0);

#Insert faculty (10)
insert into faculty (faculty_id,  person_id,  title,  degree_college,  highest_degree) values ('541802', '533004247', 'Lecturer', 'Physics', 'Doctoral');
insert into faculty (faculty_id,  person_id,  title,  degree_college,  highest_degree) values ('213675', '541568502', 'Lecturer', 'Computer Science', 'Doctoral');
insert into faculty (faculty_id,  person_id,  title,  degree_college,  highest_degree) values ('647475', '751956459', 'Associate Professor', 'Computer Science', 'Doctoral');
insert into faculty (faculty_id,  person_id,  title,  degree_college,  highest_degree) values ('353818', '415234654', 'Assistant Professor', 'Computer Science', 'Doctoral');
insert into faculty (faculty_id,  person_id,  title,  degree_college,  highest_degree) values ('478735', '215278004', 'Associate Professor', 'Computer Science', 'Doctoral');
insert into faculty (faculty_id,  person_id,  title,  degree_college,  highest_degree) values ('531195', '036776461', 'Lecturer', 'Mathematics', 'Doctoral');
insert into faculty (faculty_id,  person_id,  title,  degree_college,  highest_degree) values ('315547', '208915777', 'Associate Professor', 'Mathematics', 'Doctoral');
insert into faculty (faculty_id,  person_id,  title,  degree_college,  highest_degree) values ('550109', '203554511', 'Lecturer', 'Mathematics', 'Doctoral');
insert into faculty (faculty_id,  person_id,  title,  degree_college,  highest_degree) values ('787856', '433028227', 'Assistant Professor', 'Physics', 'Doctoral');
insert into faculty (faculty_id,  person_id,  title,  degree_college,  highest_degree) values ('999796', '914792982', 'Professor', 'Physics', 'Doctoral');

#Insert students (80)
insert into student (student_id,  person_id, graduation_year, major, type) values ('835428', '641843623', 2023, 'Business', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('865309', '615499272', 2022, 'Economics', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('633323', '384568217', 2020, 'Mathematics', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('872010', '901779825', 2024, 'Finance', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('882770', '939947527', 2021, 'Communications', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('071089', '218412748', 2021, 'Finance', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('070396', '463248379', 2021, 'Nursing', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('876211', '324747907', 2024, 'Nursing', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('486764', '525176258', 2021, 'Political Science', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('092720', '344781022', 2022, 'Communications', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('491537', '175711488', 2020, 'Computer Science', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('720169', '432326260', 2022, 'Physics', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('167258', '180459633', 2020, 'Business', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('087348', '096442070', 2020, 'Education', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('630318', '442170767', 2022, 'Communications', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('746145', '404644109', 2022, 'Nursing', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('005001', '660060434', 2023, 'History', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('928882', '262961749', 2024, 'Mathematics', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('578959', '123810736', 2023, 'Nursing', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('265458', '142353959', 2023, 'Psychology', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('297160', '462956359', 2024, 'Communications', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('938944', '392401292', 2024, 'Finance', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('439660', '811299842', 2020, 'Computer Science', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('468655', '307595814', 2024, 'Sociology', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('577555', '883812800', 2024, 'Computer Science', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('040968', '037532649', 2020, 'Criminal Justice', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('086279', '841963635', 2022, 'Mathematics', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('714683', '600148417', 2022, 'Physics', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('482578', '409216655', 2024, 'Criminal Justice', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('623907', '944474657', 2023, 'Finance', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('169382', '205268413', 2023, 'Computer Science', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('086661', '354596389', 2021, 'Economics', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('943364', '088874116', 2024, 'Nursing', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('129788', '745285878', 2021, 'Communications', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('967618', '822234727', 2024, 'Physics', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('546762', '607380521', 2023, 'Finance', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('708614', '213497746', 2021, 'Physics', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('143366', '967082013', 2021, 'Nursing', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('911549', '494695073', 2021, 'Psychology', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('544806', '603145111', 2020, 'Business', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('552330', '116131316', 2022, 'Nursing', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('661859', '310890323', 2021, 'History', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('163648', '806144332', 2020, 'Computer Science', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('586662', '824324885', 2021, 'Business', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('226596', '670579262', 2020, 'Mathematics', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('842820', '115384265', 2022, 'Mathematics', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('390951', '439301979', 2021, 'Criminal Justice', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('751258', '289697762', 2021, 'Nursing', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('263010', '890858326', 2023, 'Business', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('456888', '429153484', 2021, 'Criminal Justice', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('045293', '144389125', 2020, 'Physics', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('575458', '456421379', 2024, 'Business', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('318194', '067679362', 2020, 'Mathematics', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('048771', '065012936', 2022, 'Mechanical Engineering', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('781354', '780254086', 2024, 'Psychology', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('453343', '891301945', 2024, 'Education', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('347267', '969223224', 2020, 'Business', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('481734', '768867799', 2021, 'Physics', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('393438', '668866984', 2021, 'Sociology', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('864640', '288959979', 2024, 'Physics', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('027971', '694951797', 2023, 'Business', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('632375', '395174232', 2020, 'Nursing', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('802126', '990829336', 2020, 'Mathematics', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('621265', '518410782', 2022, 'Nursing', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('853926', '752063957', 2023, 'Economics', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('549848', '535056575', 2024, 'Electrical Engineering', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('158183', '229241954', 2021, 'Education', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('994539', '471722937', 2024, 'History', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('656292', '765224564', 2022, 'Communications', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('520226', '754431000', 2022, 'Economics', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('668984', '570447420', 2020, 'Nursing', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('850431', '135904105', 2020, 'Psychology', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('332365', '709312219', 2022, 'Physics', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('159575', '378534493', 2022, 'English', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('236620', '588980357', 2024, 'Sociology', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('546334', '131749870', 2021, 'Mathematics', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('810921', '124501901', 2020, 'Mechanical Engineering', 'Undergraduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('775309', '854820807', 2021, 'Sociology', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('890964', '352916909', 2023, 'Political Science', 'Graduate');
insert into student (student_id,  person_id, graduation_year, major, type) values ('084214', '115212202', 2021, 'Physics', 'Undergraduate');

#Insert restaurants (10)
insert into restaurant (restaurant_id, location, restaurant_name, schedule, website, rating) values ('1821563', '9 Melby Way', 'Bojangles', '10:00 AM - 9:00 PM', 'Bojangles.com', 4.5);
insert into restaurant (restaurant_id, location, restaurant_name, schedule, website, rating) values ('8098492', '69 Pleasure Parkway', 'Chick-Fil-A', '9:00 AM - 10:00 PM', 'ChickFilA.com', 3.1);
insert into restaurant (restaurant_id, location, restaurant_name, schedule, website, rating) values ('2112348', '04885 Mitchell Lane', 'Domino''s', '9:30 AM - 1:00 AM', 'Dominos.com', 4.2);
insert into restaurant (restaurant_id, location, restaurant_name, schedule, website, rating) values ('0832493', '4376 Texas Road', 'Einstein Bagels', '9:00 AM - 10:00 PM', 'EinsteinBagels.com', 4.1);
insert into restaurant (restaurant_id, location, restaurant_name, schedule, website, rating) values ('0395040', '3685 Bowman Court', 'Panda Express', '10:30 AM - 9:30 PM', 'PandaExpress.com', 4.1);
insert into restaurant (restaurant_id, location, restaurant_name, schedule, website, rating) values ('3220768', '6 Calypso Crossing', 'Subway', '9:30 AM - 1:00 AM', 'Subway.com', 2.1);
insert into restaurant (restaurant_id, location, restaurant_name, schedule, website, rating) values ('8480219', '86 Algoma Way', 'Wendy''s', '7:30 AM - 11:30 PM', 'Wendys.com', 1.1);
insert into restaurant (restaurant_id, location, restaurant_name, schedule, website, rating) values ('4477059', '46887 Oak Trail', 'Starbucks', '7:00 AM - 7:00 PM', 'Starbucks.com', 4.0);
insert into restaurant (restaurant_id, location, restaurant_name, schedule, website, rating) values ('2973548', '6208 La Follette Center', 'Mocha Joe''s', '6:00 AM - 7:00 PM', 'MochaJoes.com', 3.2);
insert into restaurant (restaurant_id, location, restaurant_name, schedule, website, rating) values ('1628540', '8487 Becker Street', 'Amelie’s', '7:00 AM - 10:00 PM', 'Amelies.com', 3.1);

#Insert locations (8)
insert into location (location_id, location_name, location_address, latitude, longitude, drop_off_point) values ('9619071', 'Levine Hall', '9057 Johnson Alumni Way', 35.30269, -80.73301, 'Under the arch');
insert into location (location_id, location_name, location_address, latitude, longitude, drop_off_point) values ('1630682', 'Sanford Hall', '9029 Johnson Alumni Way', 35.30304, -80.73348, 'Front entrance');
insert into location (location_id, location_name, location_address, latitude, longitude, drop_off_point) values ('2206298', 'Laurel Hall', '8731 Hunt Hall Ln', 35.30255, -80.7359, 'Front entrance');
insert into location (location_id, location_name, location_address, latitude, longitude, drop_off_point) values ('5777198', 'Holshouser Hall', '8881 Johnson Alumni Way', 35.30229, -80.73609, 'Back Entrance');
insert into location (location_id, location_name, location_address, latitude, longitude, drop_off_point) values ('5488949', 'Scott Hall', '8881 High Rise Rd', 35.30179, -80.73534, 'Lobby');
insert into location (location_id, location_name, location_address, latitude, longitude, drop_off_point) values ('6137679', 'Martin Hall', '9240 Cameron Blvd', 35.31021, -80.72743, 'Lobby');
insert into location (location_id, location_name, location_address, latitude, longitude, drop_off_point) values ('8343877', 'Oak Hall', '9321 Poplar Terrace Dr', 35.30911, -80.74424, 'Lobby');
insert into location (location_id, location_name, location_address, latitude, longitude, drop_off_point) values ('0323513', 'Hunt Hall', '8877 Johnson Alumni Way', 35.30157, -80.7365, 'Lobby');

#Insert vehicles (8)
insert into vehicle (vehicle_id, vehicle_plate, model, make) values ('5FNYF3H24DB133358', 'SWF1410', 'Camry', 'Toyota');
insert into vehicle (vehicle_id, vehicle_plate, model, make) values ('1FTFW1E85AF989034', 'HDK8852', 'Camry', 'Toyota');
insert into vehicle (vehicle_id, vehicle_plate, model, make) values ('WDCYC3HF7EX904344', 'VQD0758', 'Prius', 'Toyota');
insert into vehicle (vehicle_id, vehicle_plate, model, make) values ('1HGCP2F39AA931969', 'INA1902', 'Corolla', 'Toyota');
insert into vehicle (vehicle_id, vehicle_plate, model, make) values ('WBSDE93452B515694', 'XAM5712', 'Yaris', 'Toyota');
insert into vehicle (vehicle_id, vehicle_plate, model, make) values ('JTHDU1EF9C5406339', 'YMV1645', 'Accord', 'Honda');
insert into vehicle (vehicle_id, vehicle_plate, model, make) values ('WBA6B4C57FD331188', 'NQR9782', 'Civic', 'Honda');
insert into vehicle (vehicle_id, vehicle_plate, model, make) values ('WA1VKAFP8AA611877', 'PGK7205', 'Civic', 'Honda');

#Insert drivers (8)
insert into driver (driver_id, student_id, vehicle_id, license_number, date_hired, rating) values ('78749024', '577555', '5FNYF3H24DB133358', '094703262068', '2018-04-09', 3.9);
insert into driver (driver_id, student_id, vehicle_id, license_number, date_hired, rating) values ('43759944', '040968', '1FTFW1E85AF989034', '601875750355', '2019-11-04', 4.2);
insert into driver (driver_id, student_id, vehicle_id, license_number, date_hired, rating) values ('12050578', '086279', 'WDCYC3HF7EX904344', '303327464890', '2019-10-19', 2.3);
insert into driver (driver_id, student_id, vehicle_id, license_number, date_hired, rating) values ('14597043', '714683', '1HGCP2F39AA931969', '301877100154', '2017-10-14', 4.3);
insert into driver (driver_id, student_id, vehicle_id, license_number, date_hired, rating) values ('09558242', '482578', 'WBSDE93452B515694', '522270872580', '2016-01-09', 5);
insert into driver (driver_id, student_id, vehicle_id, license_number, date_hired, rating) values ('44641030', '623907', 'JTHDU1EF9C5406339', '865500622535', '2019-11-16', 1);
insert into driver (driver_id, student_id, vehicle_id, license_number, date_hired, rating) values ('01057062', '169382', 'WBA6B4C57FD331188', '451947442124', '2018-03-21', 4.8);
insert into driver (driver_id, student_id, vehicle_id, license_number, date_hired, rating) values ('94582593', '086661', 'WA1VKAFP8AA611877', '712908095727', '2017-06-12', 5);

insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('6042289', 229241954, 8343877, 94582593, 3220768, 12.04, 46, '2020-06-27 02:21:35', 3, 4);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('3769161', 387630629, 6137679, 94582593, 395040, 49.98, 83, '2020-06-27 02:21:35', 2, 3);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('0319010', 811299842, 5488949, 78749024, 1628540, 44.72, 43, '2020-06-27 02:21:35', 1, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('0187187', 131749870, 9619071, 78749024, 2973548, 31.54, 91, '2020-06-27 02:21:35', 2, 5);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('4183881', 939947527, 5777198, 44641030, 4477059, 45.81, 51, '2020-06-27 02:21:35', 3, 3);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('3706592', 990829336, 8343877, 1057062, 832493, 43.01, 56, '2020-06-27 02:21:35', 4, 3);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('3652259', 678920279, 2206298, 43759944, 832493, 20.71, 69, '2020-06-27 02:21:35', 4, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('4863612', 404644109, 323513, 14597043, 8480219, 34.66, 76, '2020-06-27 02:21:35', 4, 5);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('4777939', 96442070, 1630682, 1057062, 8480219, 12.4, 92, '2020-06-27 02:21:35', 4, 3);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('9316071', 218412748, 5488949, 43759944, 2973548, 31.11, 59, '2020-06-27 02:21:35', 5, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('0924699', 811299842, 323513, 44641030, 832493, 19.34, 39, '2020-06-27 02:21:35', 3, 4);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('2447666', 745285878, 323513, 1057062, 2973548, 19.75, 88, '2020-06-27 02:21:35', 5, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('1312983', 352916909, 8343877, 14597043, 395040, 16.17, 43, '2020-06-27 02:21:35', 2, 4);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('3023020', 494695073, 9619071, 44641030, 1821563, 18.13, 26, '2020-06-27 02:21:35', 4, 3);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('1575030', 570447420, 323513, 1057062, 8480219, 6.56, 83, '2020-06-27 02:21:35', 4, 4);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('4343652', 289697762, 2206298, 14597043, 2112348, 28.3, 88, '2020-06-27 02:21:35', 3, 1);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('4107358', 213497746, 1630682, 14597043, 832493, 6.5, 88, '2020-06-27 02:21:35', 4, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('7792745', 811299842, 2206298, 44641030, 1821563, 46.51, 53, '2020-06-27 02:21:35', 2, 4);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('4239501', 378534493, 6137679, 78749024, 8098492, 44.49, 23, '2020-06-27 02:21:35', 4, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('1228137', 289697762, 1630682, 12050578, 3220768, 28.6, 84, '2020-06-27 02:21:35', 3, 4);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('3183174', 115384265, 2206298, 9558242, 395040, 15.91, 43, '2020-06-27 02:21:35', 4, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('6110875', 113380940, 5777198, 14597043, 2112348, 10.81, 56, '2020-06-27 02:21:35', 5, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('8128604', 570447420, 323513, 12050578, 1821563, 17.9, 82, '2020-06-27 02:21:35', 3, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('6899013', 570447420, 2206298, 94582593, 2112348, 19.92, 3, '2020-06-27 02:21:35', 2, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('1783411', 463248379, 9619071, 9558242, 1628540, 22.81, 1, '2020-06-27 02:21:35', 3, 4);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('9041949', 96442070, 1630682, 78749024, 8098492, 21.96, 5, '2020-06-27 02:21:35', 4, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('7442712', 384568217, 5488949, 1057062, 8098492, 18.98, 17, '2020-06-27 02:21:35', 4, 2);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('9442018', 180459633, 6137679, 9558242, 1628540, 21.52, 82, '2020-06-27 02:21:35', 5, 1);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('3500987', 471722937, 8343877, 1057062, 4477059, 40.11, 51, '2020-06-27 02:21:35', 4, 4);
insert into `order` (order_id, person_id, location_id, driver_id, restaurant_id, total_price, delivery_charge, delivery_time, restaurant_rating, driver_rating) values ('6104849', 324747907, 2206298, 43759944, 8480219, 37.85, 59, '2020-06-27 02:21:35', 3, 3);




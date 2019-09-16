-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema carmadb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `carmadb` ;

-- -----------------------------------------------------
-- Schema carmadb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carmadb` DEFAULT CHARACTER SET utf8 ;
USE `carmadb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL DEFAULT 1,
  `role` VARCHAR(45) NOT NULL DEFAULT 'user',
  `email` VARCHAR(200) NULL,
  `date_user_account_created` VARCHAR(30) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car` ;

CREATE TABLE IF NOT EXISTS `car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `license_plate` VARCHAR(10) NOT NULL,
  `make` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  `color` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  `alias` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `license_plate_UNIQUE` (`license_plate` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `street` VARCHAR(200) NOT NULL,
  `city` VARCHAR(200) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zip` CHAR(5) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_fail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parking_fail` ;

CREATE TABLE IF NOT EXISTS `parking_fail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `car_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `fail_time` VARCHAR(30) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_parking_fail_car1_idx` (`car_id` ASC),
  INDEX `fk_parking_fail_user1_idx` (`user_id` ASC),
  INDEX `fk_parking_fail_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_parking_fail_car1`
    FOREIGN KEY (`car_id`)
    REFERENCES `car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parking_fail_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parking_fail_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `picture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `picture` ;

CREATE TABLE IF NOT EXISTS `picture` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(2000) NOT NULL,
  `parking_fail_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_picture_parking_fail1_idx` (`parking_fail_id` ASC),
  CONSTRAINT `fk_picture_parking_fail1`
    FOREIGN KEY (`parking_fail_id`)
    REFERENCES `parking_fail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carma` ;

CREATE TABLE IF NOT EXISTS `carma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `parking_fail_id` INT NOT NULL,
  `vote` INT NOT NULL,
  `comment` TEXT NULL,
  `date_voted` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vote_user_idx` (`user_id` ASC),
  INDEX `fk_vote_parking_fail_idx` (`parking_fail_id` ASC),
  CONSTRAINT `fk_vote_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vote_parking_fail`
    FOREIGN KEY (`parking_fail_id`)
    REFERENCES `parking_fail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS carmauser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'carmauser'@'localhost' IDENTIFIED BY 'carmauser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'carmauser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (id, 'Jim Jeffries', 'carmauser', 1, 'user', 'jimjeffries@gmail.com', '20190911');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (2, 'Dave Chappelle', 'carmauser', 1, 'user', 'whocares@yahoo.com', '20190912');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (3, 'George Carlin', 'carmauser', 1, 'user', 'georgecarlin@deadguy.com', '20190913');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (4, 'Eddy Murphy', 'carmauser', 1, 'user', 'eddiemurphy@gmail.com', '20190916');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (5, 'John Doe', 'carmauser', 1, 'user', 'JohnDoe@gmail.com', '20190913');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (6, 'Jane Joe', 'carmauser', 1, 'user', 'janedoe@gmail.com', '20190917');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (7, 'Lisa Simpson', 'carmauser', 1, 'user', 'lisasimpson@gmail.com', '20190913');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (8, 'Peter Griffin', 'carmauser', 1, 'user', 'petergriffin@gmail.com', '20190916');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (9, 'Morty Sanchez', 'carmauser', 1, 'user', 'mortysanchez@gmail.com', '20190913');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (10, 'Rick Grimes', 'carmauser', 1, 'user', 'rickgrimes@gmail.com', '20190912');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (11, 'Scruff McGruff', 'carmauser', 1, 'user', 'scruffmcgruff@gmail.com', '20190914');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (12, 'Lauren Natalia', 'carmauser', 1, 'user', 'laurennatalia@gmail.com', '20190913');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (13, 'Louis Lane', 'carmauser', 1, 'user', 'louislane@gmail.com', '20190917');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (14, 'Bruce Wayne', 'carmauser', 1, 'user', 'brucewayne@gmail.com', '20190916');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (15, 'Natalie Portman', 'carmauser', 1, 'user', 'natalieportman@gmail.com', '20190913');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (16, 'Morgan Freeman', 'carmauser', 1, 'user', 'morganfreeman@gmail.com', '20190912');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (17, 'Mr. Pink', 'carmauser', 1, 'user', 'mrpink@gmail.com', '20190914');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (18, 'John Wayne', 'carmauser', 1, 'user', 'johnwayne@gmail.com', '20190916');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (19, 'John Wick', 'carmauser', 1, 'user', 'johnwick@gmail.com', '20190915');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (20, 'David Hasselhoff', 'carmauser', 1, 'user', 'davidhasselhoff@gmail.com', '20190911');

COMMIT;


-- -----------------------------------------------------
-- Data for table `car`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (1, 'BIGDUC2', 'Toyota', 'Camry', 'Black', 'Black Toyota Camry', 'Crapyota');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (2, 'LIL2DUC', 'Honda', 'Civic', 'White', 'White Honda Civic', 'HondaShitic');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (3, 'Y2U3UKC', 'BMW', 'SUV', 'Green', 'A standard green Beamer SUV.', 'Green Sprawler');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (4, 'F1HUYDH', 'Honda', 'Odyssey', 'Beige', 'Beige Honda Odyssey 2004', 'Doubleparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (5, 'FHRSL6Q', 'Audi', 'A5', 'Black', 'Black Audi A5', 'Pullerouter');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (6, 'HRTYO2U', 'Ford', 'F250', 'Black', 'Black Ford F-250 Truck', 'Handiparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (7, 'S8CEHER', 'Ford', 'Crown Victoria', 'White', 'White Ford Crown Victoria Labeled Parking Enforcement', 'Lacklusterenforcer');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (8, 'TOD9ANI', 'Nissan', 'NV200', 'Silver', 'Silver Nissan Van', 'Sidewalkparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (9, 'WFMTW2', 'Nissan', 'Sentra', 'Maroon', 'Maroon Nissan Sentra', 'Straightparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (10, 'C6ALRUH', 'Toyota', 'Camry', 'White', 'White Toyota Camry 2011', 'Breakthroughparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (11, 'RA9DABE', 'Chrysler', '300', 'Black', 'Black Chrysler 300 ', 'Rooftopparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (12, 'CEL3FOR', 'Honda', 'Civic', 'Blue', 'Blue Honda Civic', 'Parkleaner');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (13, 'BIN2DUM', 'Ford', 'Explorer', 'Red', 'Red Ford Explorer 1999', 'SUmotorcycle');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (14, 'SYSTU4M', 'Unk', 'Unk', 'Lime Green', 'Unk Lim Green Car', 'Underwaterparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (15, 'PG2HOQ', 'Honda', 'SUV', 'White', 'White Honda Jeep', 'Sidewaysparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (16, 'QI6PVMJ', 'Mercedes', '600', 'Gunmetal Grey', 'Grey Mercedes', 'Twospothog');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (17, 'EDNV7HL', 'Honda', 'SUV', 'White', 'White Honda SUV', 'Toocloseparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (18, 'VME7THK', 'Dodge', 'Charger', 'Gold metallic', 'Gold Dodge Charger', 'Headfirstparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (19, '3SFGUIO', 'Mitsubishi', 'Mirage', 'Lime Green', 'Lime Green Mitsubishi Mirage', 'TwoGreedyparker');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (20, 'WHYRB4N', 'Honda', 'Civic', 'Black', 'Black Honda Civic', 'Tractortrailerparker');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (1, 'Trade Joes Parking Lot', 'Parklikecrap st', 'Somecity City', 'CO', '80011');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (2, 'School Library Parking', 'Runovademdeaddogs Blvd', 'Deaddog City', 'CA', '92886');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (3, 'Sidestreet Parking', 'Isprawlpark St', 'Takemoroom City', 'NV', '80745');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (4, 'Parking Garage', 'Blahblah Rd', 'Doesitreallymatter City', 'NY', '67345');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (5, 'Convenient Store Parking', 'fakestreet St', 'HeyHeyHey City', 'AZ', '20095');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (6, 'Handicapped Parking', 'itakeupspace Rd', 'Racoon City', 'MN', '56678');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (7, 'Enforcement Parking Lot', 'donotenforceenforcement ln', 'Sanctuary City', 'OR', '12678');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (8, 'Sidewalk Parking Lot', 'parkwherever Ln', 'Leeway City', 'WA', '85432');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (9, 'University Parking Lot', 'university st', 'Someplacelikehome City', 'FL', '79056');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (10, 'Parkinggarage Lot', 'Government rd', 'incompetentparker city', 'TN', '67538');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (11, 'Onhouse Lot', 'Winchestertonvilleville City', 'Rufpark City', 'LA', '86743');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (12, 'Apartment Complex Parking Lot', 'Amherzon City', 'Superserial City', 'CA', '12890');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (13, 'Home Depot Parking Lot', 'Motorcyclesonly St', 'Motorcycle City', 'ID', '87654');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (14, 'Somestupid Parking Lot', 'Submerged Rd', 'Watercity City', 'OK', '56743');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (15, 'Street Parking', 'Powerline St', 'Parkhoweveruwant City', 'CO', '78853');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (16, 'Safeway Parking Lot', 'Greedy St', 'Dowhateveryouwant City', 'TX', '34455');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (17, 'Sushi Restaurant Parking Lot', 'Toocloseforcomfort Rd', 'Drivelikeeasterneurope City', 'FL', '65523');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (18, 'Gamestop Parking Lot', 'Needvideogamesnow Blvd', 'Crashlikeyoulike City', 'OR', '89066');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (19, 'School Parking Lot', 'Greedybastard Blvd', 'Whataboutthechildren City', 'CA', '92591');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (20, 'John Deer Parking Lot', 'Parklikemeani St', 'Whateverparkanywhere City', 'NV', '12234');

COMMIT;


-- -----------------------------------------------------
-- Data for table `parking_fail`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (1, 'Parking In Two Places', 1, 1, 1, '0834', 'A silver BMW Does parks his stupid car in two spaces');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (2, 'Wedged', 2, 2, 2, '0955', 'Stupid driver wedges his car between two others');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (3, 'Sprawled Parking', 3, 3, 3, '0934', 'A greedy driver wants more than one space for his vehicle');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (4, 'Perpendicular Parking', 4, 4, 4, '1245', 'This driver decided to park his van and block others in');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (5, 'Too Far Forward', 5, 5, 5, '1333', 'This driver doesn\'t care how far he parks forward');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (6, 'Careless Truck Driver', 6, 6, 6, '1422', 'Truck driver takes up two handicapped spots');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (7, 'Lackluster Enforcement Officer', 7, 7, 7, '1555', 'Enforcement Officer doesn\'t enforce his own bad parking');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (8, 'Sidewalk Parking', 8, 8, 8, '1646', 'Driver decides to park his van on sidewalk');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (9, 'Parking Straight', 9, 9, 9, '1734', 'Driver is gonna park straight in an angled parking spot');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (10, 'Making A Breakthrough', 10, 10, 10, '0956', 'This guy wanted his car to get some sun in an inside parking lot');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (11, 'Rooftop Parking', 11, 11, 11, '1245', 'This driver couldn\'t find a spot so he decided to park on the roof');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (12, 'Lean On Me', 12, 12, 12, '1623', 'Guess this guy\'s car was feeling lonely and needed another to lean on');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (13, 'SUV in Motorcycle Spot', 13, 13, 13, '1521', 'This guy thinks his SUV is a motorcycle');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (14, 'Underwater Parking', 14, 14, 14, '1745', 'Guess this guy didn\'t realize that spot wasn\'t just a puddle');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (15, 'Sideways Parking', 15, 15, 15, '1823', 'This guy thinks his small Mercedes needs two spots');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (16, 'Sprawling Out Mercedes', 16, 16, 16, '1011', 'This guy just wanted to sprawl his Mercedes out on the parking lot');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (17, 'Too Close For Parking', 17, 17, 17, '1221', 'This guy like to park way to close');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (18, 'Head First Parking', 18, 18, 18, '1310', 'This guy couldn\'t wait to get A-Head in life');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (19, 'Who Care About Children Anyway', 19, 19, 19, '1320', 'This guy like to take up multiple spots in the school parking lot');
INSERT INTO `parking_fail` (`id`, `title`, `car_id`, `user_id`, `location_id`, `fail_time`, `description`) VALUES (20, 'Tractor Trailer Parking', 20, 20, 20, '1510', 'Pretty riskey but genious or just lazy?');

COMMIT;


-- -----------------------------------------------------
-- Data for table `picture`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (1, 'https://drive.google.com/open?id=115sgRmxqG5k9Z4hK6toO0oCr5VDod8rD', 1);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (2, 'https://drive.google.com/open?id=1MI0-qH6awlyM9ggb5HfnJvnqZW83F4mE', 2);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (3, 'https://drive.google.com/open?id=1lFzD4El2DVoUWoi6jDL1L7tqGwgne-5z', 3);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (4, 'https://drive.google.com/open?id=1UK-vWi1P2jquXfb2zoVidipIneQygG6k', 4);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (5, 'https://drive.google.com/open?id=1CwwBA76Hjkoa_U1bweX4ZeGkMBN6gGcZ', 5);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (6, 'https://drive.google.com/open?id=1C-WYFMo8-NJIo74jmvBBlEc1szoUirsb', 6);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (7, 'https://drive.google.com/open?id=1P_fG1uzOpCiwaEnd1E6gZ0TB9Ut75Vhi', 7);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (8, 'https://drive.google.com/open?id=149R6ljiChmuwwt7kBPevlJ_jlw7XMtK8', 8);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (9, 'https://drive.google.com/open?id=1vHb3dt-rRMoZOp26O3pRIbZqP3p7I_dI', 9);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (10, 'https://drive.google.com/open?id=1y4Ts_1xf_wnpFDoAakq2v0o0vBgPu2dl', 10);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (11, 'https://drive.google.com/open?id=1oGy3HbumQiHFu6IL7FiWTuQ_RE3fBvGi', 11);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (12, 'https://drive.google.com/open?id=119cIQKqr1j3fVLtf0vho_yFsneBvOnz_', 12);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (13, 'https://drive.google.com/open?id=1mkbkB30xYiQhKRu2CuiNB0l1ikEtv92n', 13);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (14, 'https://drive.google.com/open?id=1zbM4kvSFBj4vLdoAkpnz230xmqEHNHrV', 14);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (15, 'https://drive.google.com/open?id=16uGUF7uUBIpx9lp-fshb-XAReZzmzH1w', 15);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (16, 'https://drive.google.com/open?id=1BXD_j0y1g7dKso-njuSRBxBdfkijAbcD', 16);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (17, 'https://drive.google.com/open?id=1C2qiAg5qPUus7wGZNkoQoZavmzijZgYm', 17);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (18, 'https://drive.google.com/open?id=1kKn-DXtw44IFKep0fdwRu3wl-RpnxGdz', 18);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (19, 'https://drive.google.com/open?id=1PFhDwFwaX_c9OurhRBSL_40djhhMlFOs', 19);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (20, 'https://drive.google.com/open?id=1Ue2UAhAt8FCjU_8eTiIOy8WFYHshxLS9', 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `carma`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (1, 1, 1, 1, 'Greedy BMW Driver takes up two spots', '20190911');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (2, 2, 2, 1, 'Driver parks his car on top of and between two parked cars', '20190912');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (3, 3, 3, 1, 'Darn BMW driver sprawling his vehicle out in parking lot.', '20190913');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (4, 4, 4, 1, 'This beige van decides to block everyone in by double parking behind them', '20190913');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (5, 5, 5, 1, 'Driver decides to park his Audi out in front of the parking spot', '20190913');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (6, 6, 6, 1, 'Truck driver puts his needs ahead of handicapable people', '20190913');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (7, 7, 7, 1, 'Parking Enforcement officer not enforcing his own parking', '20190913');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (8, 8, 8, 1, 'Driver decides to park his grey van right on the sidewalk', '20190913');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (9, 9, 9, 1, 'This guys gonna park straight no matter how angled that parking spot is', '20190914');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (10, 10, 10, 1, 'This driver wanted his car to get some sun, in an indoor parking lot', '20190914');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (11, 11, 11, 1, 'Couldn\'t find a parking space, no problem, park on a house roof', '20190914');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (12, 12, 12, 1, 'This driver just needed someone to lean on', '20190914');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (13, 13, 13, 1, 'I guess this guy\'s SUV thought it was a motorcycle today', '20190914');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (14, 14, 14, 1, 'This was just a tragedy...', '20190914');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (15, 15, 15, 1, 'Sideways parking saves space', '20190915');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (16, 16, 16, 1, 'How does someone feel this entitled to take up multiple parking spots?', '20190915');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (17, 17, 17, 1, 'This person can really park close!', '20190915');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (18, 18, 18, 1, 'Talk about headfirst parking! Holy crap!', '20190915');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (19, 19, 19, 1, 'Look at this guy take up multiple parking spots in a school parking lot! Think of the children!', '20190915');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (20, 20, 20, 1, 'Parking nuissance or genious!?', '20190916');

COMMIT;


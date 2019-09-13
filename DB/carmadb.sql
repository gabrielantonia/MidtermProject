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
  `date_user_account_created` DATETIME NULL,
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
-- Table `picture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `picture` ;

CREATE TABLE IF NOT EXISTS `picture` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(2000) NOT NULL,
  `parking_fail_id` INT NOT NULL,
  PRIMARY KEY (`id`))
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
  CONSTRAINT `fk_vote_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (1, 'jimjeffries', 'carmauser', true, 'user', 'jimjeffries@beerlover.com', '20190911');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (DEFAULT, 'louisck', 'carmauser', true, 'user', 'louisck@madeupshit.com', '20190912');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (DEFAULT, 'davechappelle', 'carmauser', true, 'user', 'davechappelle@holyhell.com', '20190913');

COMMIT;


-- -----------------------------------------------------
-- Data for table `car`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (1, 'JDO D9R', 'toyota', 'camre', 'black', 'shitty ass toyota', 'big dick');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (2, 'ERC 8ER', 'honda', 'civic', 'red', 'a beat up old honda civic piece of shit', 'small dick');
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (3, 'KIO NDH', 'Ford', 'explorer', 'white', 'a beautiful for explorer covered in children\'s blood', 'kid killer');

COMMIT;


-- -----------------------------------------------------
-- Data for table `picture`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (DEFAULT, 'https://images.yourdailydish.com/wp-content/uploads/2015/01/o-PARKING-FAIL-facebook.jpg', 1);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (DEFAULT, 'http://www.philapark.org/wp-content/uploads/Parking-Fail-20.png', 2);
INSERT INTO `picture` (`id`, `url`, `parking_fail_id`) VALUES (DEFAULT, 'https://komonews.com/resources/media/49b41b88-f3e5-4756-98de-540165cd4943-large16x9_CrashatHearthstoneSeniorLivingPhotofromBeavertonPolice4.jpg', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (DEFAULT, 'Parklikeshitarea', 'Assholdriver Way', 'Somecity', 'CO', '80011');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (DEFAULT, 'Rundogsoversquare', 'Harleydriver St', 'Landofpoorwhitepeople', 'OH', '72387');
INSERT INTO `location` (`id`, `name`, `street`, `city`, `state`, `zip`) VALUES (DEFAULT, 'Drivelikegrandmaplace', 'Kidkiller Blvd', 'Assholia', 'NY', '25934');

COMMIT;


-- -----------------------------------------------------
-- Data for table `carma`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (DEFAULT, 1, 1, 1, 'hah this idiot parked sideways in a mcdonald\'s drivethrough', '20190911');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (DEFAULT, 2, 2, 1, 'this moron flipped his car onto a 90 year old woman', '20190912');
INSERT INTO `carma` (`id`, `user_id`, `parking_fail_id`, `vote`, `comment`, `date_voted`) VALUES (DEFAULT, 3, 3, 1, 'this guy rammed his truck through a wallmart where it exploded burning everyone inside alive', '20190913');

COMMIT;


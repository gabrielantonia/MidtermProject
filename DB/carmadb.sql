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
  `fail_time` DATETIME NOT NULL,
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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `date_user_account_created`) VALUES (1, 'jim', 'carmauser', true, 'user', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `car`
-- -----------------------------------------------------
START TRANSACTION;
USE `carmadb`;
INSERT INTO `car` (`id`, `license_plate`, `make`, `model`, `color`, `description`, `alias`) VALUES (DEFAULT, 'big coc', 'toyota', 'camre', 'black', 'freaking car cut me off', NULL);

COMMIT;


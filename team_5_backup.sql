-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema electric_vehicle
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `electric_vehicle` ;

-- -----------------------------------------------------
-- Schema electric_vehicle
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `electric_vehicle` DEFAULT CHARACTER SET utf8 ;
USE `electric_vehicle` ;


-- -----------------------------------------------------
-- Table `electric_vehicle`.`model`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_vehicle`.`model`;

CREATE TABLE IF NOT EXISTS `electric_vehicle`.`model` (
    `model_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `make_id` INT UNSIGNED NOT NULL,
    `type_id` INT UNSIGNED NOT NULL,
    `model` VARCHAR(45) NOT NULL DEFAULT '',
    `year` INT NOT NULL DEFAULT 0,
    `electric_range` INT NOT NULL DEFAULT 0,
    `base_msrp` INT NOT NULL DEFAULT 0,
    `eligibility_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`model_id`, `make_id`),
    FOREIGN KEY (`make_id`) REFERENCES `electric_vehicle`.`make`(`make_id`), 
    FOREIGN KEY (`type_id`) REFERENCES `electric_vehicle`.`electric_vehicle_type`(`type_id`), 
    FOREIGN KEY (`eligibility_id`) REFERENCES `electric_vehicle`.`clean_eligibility`(`eligibility_id`) 
) 
ENGINE = InnoDB 
DEFAULT CHARACTER SET = latin1;

INSERT INTO `electric_vehicle`.`model` 
    (`model_id`, `make_id`, `type_id`, `model`, `year`, `electric_range`, `base_msrp`, `eligibility_id`)
VALUES
    (1, 1, 1, '330E', 2016, 14, 43700, 1),
    (2, 2, 2, 'CROSSTREK', 2019, 17, 34995, 1),
    (3, 3, 2, 'SOUL', 2016, 93, 31950, 2),
    (4, 4, 2, 'MODEL S', 2013, 208, 69900, 2),
    (5, 5, 1, 'COUNTRYMAN', 2019, 12, 36900, 1),
    (6, 6, 1, 'KARMA', 2012, 33, 102000, 2),
    (7, 7, 2, 'MODEL S', 2014, 208, 69900, 2),
    (8, 8, 1, 'XC60', 2019, 17, 52900, 1),
    (9, 7, 2, 'ROADSTER', 2010, 245, 110950, 2),
    (10, 8, 1, 'XC60', 2018, 17, 52900, 1);



-- -----------------------------------------------------
-- Table `electric_vehicle`.`vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_vehicle`.`vehicle`;

CREATE TABLE IF NOT EXISTS `electric_vehicle`.`vehicle` (
    `vehicle_id` VARCHAR(45) NOT NULL,
    `model_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`vehicle_id`, `model_id`),
    FOREIGN KEY (`model_id`) REFERENCES `electric_vehicle`.`model`(`model_id`)
) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `electric_vehicle`.`vehicle` 
    (`vehicle_id`, `model_id`)
VALUES
    ('WBA8E1C54G', 1),
    ('JF2GTDNC9K', 2),
    ('KNDJX3AE5G', 3),
    ('5YJSA1DP4D', 4),
    ('WMZYU7C53K', 5),
    ('YH4K14AA0C', 6),
    ('5YJSA1CNXD', 4),
    ('5YJSA1CP9D', 4),
    ('5YJSA1DP5D', 4),
    ('5YJSA1H19E', 7),
    ('5YJSA1DN4D', 4),
    ('LYVBR0DM3K', 8),
    ('WMZYU7C59K', 5),
    ('5YJRE1A14A', 4),
    ('WMZYU7C52K', 5),
    ('5YJSA1DN9D', 4),
    ('LYVBR0DL6J', 4),
    ('LYVBR0DMXK', 8),
    ('KNDJX3AE3G', 4),
    ('5YJSA1DPXD', 4);


-- -----------------------------------------------------
-- Table `electric_vehicle`.`electric_vehicle_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_vehicle`.`electric_vehicle_type` ;

CREATE TABLE IF NOT EXISTS `electric_vehicle`.`electric_vehicle_type` (
	`type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`electric_vehicle_type` VARCHAR(45) NOT NULL DEFAULT '',
		PRIMARY KEY (`type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `electric_vehicle`.`electric_vehicle_type` 
    (`type_id`, `electric_vehicle_type`)
VALUES
    (1, 'Plug-in Hybrid Electric Vehicle (PHEV)'),
    (2, 'Battery Electric Vehicle (BEV)');

-- -----------------------------------------------------
-- Table `electric_vehicle`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_vehicle`.`location` ;

CREATE TABLE IF NOT EXISTS `electric_vehicle`.`location` (
	`location_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`county` VARCHAR(45) NOT NULL DEFAULT '',
	`city` VARCHAR(45) NOT NULL DEFAULT '',
	`2020_census_tract` VARCHAR(45) NOT NULL DEFAULT 0,
	`postal_code` INT NOT NULL DEFAULT 0,
		PRIMARY KEY (`location_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `electric_vehicle`.`location` 
    (`location_id`, `county`, `city`, `2020_census_tract`, `postal_code`)
VALUES
    (1, 'Kitsap', 'Bainbridge Island', '53035091002', 98110),
    (2, 'King', 'Seattle', '53033005801', 98199),
    (3, 'King', 'Renton', '53033025104', 98059),
    (4, 'King', 'Redmond', '53033032322', 98052),
    (5, 'Benton', 'Richland', '53005010819', 99352),
    (6, 'Snohomish', 'Lake Stevens', '53061052706', 98258),
    (7, 'Whatcom', 'Bellingham', '53073000402', 98225),
    (8, 'Clark', 'Vancouver', '53011041323', 98683),
    (9, 'Pierce', 'Lake Tapps', '53053070314', 98391),
    (10, 'King', 'Redmond', '53033032315', 98053),
    (11, 'King', 'Kirkland', '53033022205', 98034),
    (12, 'Grays Harbor', 'Hoquiam', '53027001400', 98550),
    (13, 'King', 'Federal Way', '53033030007', 98003),
    (14, 'King', 'Seattle', '53033011601', 98136),
    (15, 'King', 'Issaquah', '53033032104', 98027),
    (16, 'King', 'Sammamish', '53033032222', 98029),
    (17, 'King', 'Sammamish', '53033032213', 98075),
    (18, 'King', 'Seattle', '53033001400', 98177),
    (19, 'Snohomish', 'Mill Creek', '53061052004', 98012);



-- -----------------------------------------------------
-- Table `electric_vehicle`.`vehicle_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_vehicle`.`vehicle_location`;

CREATE TABLE IF NOT EXISTS `electric_vehicle`.`vehicle_location` (
    `vehicle_id` VARCHAR(45) NOT NULL,
    `location_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`vehicle_id`, `location_id`)
) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `electric_vehicle`.`vehicle_location` 
    (`vehicle_id`, `location_id`)
VALUES
    ('WBA8E1C54G', 1),
    ('JF2GTDNC9K', 2),
    ('KNDJX3AE5G', 3),
    ('5YJSA1DP4D', 4),
    ('WMZYU7C53K', 5),
    ('YH4K14AA0C', 6),
    ('5YJSA1CNXD', 7),
    ('5YJSA1CP9D', 8),
    ('5YJSA1DP5D', 9),
    ('5YJSA1H19E', 10),
    ('5YJSA1DN4D', 3),
    ('LYVBR0DM3K', 12),
    ('WMZYU7C59K', 13),
    ('5YJRE1A14A', 14),
    ('WMZYU7C52K', 15),
    ('5YJSA1DN9D', 16),
    ('LYVBR0DL6J', 17),
    ('LYVBR0DMXK', 18),
    ('KNDJX3AE3G', 19),
    ('5YJSA1DPXD', 20);
-- -----------------------------------------------------
-- Table `electric_vehicle`.`clean_eligibility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_vehicle`.`clean_eligibility` ;

CREATE TABLE IF NOT EXISTS `electric_vehicle`.`clean_eligibility` (
	`eligibility_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`CAFV_Eligibility` VARCHAR(45) NOT NULL DEFAULT '',
		PRIMARY KEY (`eligibility_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `electric_vehicle`.`clean_eligibility` 
    (`CAFV_Eligibility`)
VALUES
    ('Not eligible due to low battery range'),
    ('Clean Alternative Fuel Vehicle Eligible');

-- -----------------------------------------------------
-- Table `electric_vehicle`.`make`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `electric_vehicle`.`make` ;

CREATE TABLE IF NOT EXISTS `electric_vehicle`.`make` (
	`make_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`make` VARCHAR(45) NOT NULL DEFAULT '',
		PRIMARY KEY (`make_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `electric_vehicle`.`make` 
    (`make_id`, `make`)
VALUES
    (1, 'BMW'),
    (2, 'SUBARU'),
    (3, 'KIA'),
    (4, 'TESLA'),
    (5, 'MINI'),
    (6, 'FISKER'),
    (7, 'TESLA'),
    (8, 'VOLVO'),
    (9, 'CHRYSLER'),
    (10, 'PORSCHE'),
    (11, 'CADILLAC');
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



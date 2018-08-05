-- TEAM MAKESMART FINAL
-- CST336 Plant Database
-- TEAM MEMBERS Jake McGhee, Pavlos Papadonikolakis, Maco Doussias 
-- 07-27-18
--
-- MySQL Script generated by MySQL Workbench
-- Fri Jul 27 22:35:35 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin` (
  `idadmin` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(25) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idadmin`, `password`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer` (
  `idcustomer` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(25) NULL DEFAULT ' ',
  `lastName` VARCHAR(25) NULL DEFAULT ' ',
  `password` VARCHAR(40) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcustomer`),
  UNIQUE INDEX `address_UNIQUE` (`address` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `plant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plant` (
  `idplant` INT(11) NOT NULL AUTO_INCREMENT,
  `plantName` VARCHAR(45) NOT NULL DEFAULT ' ',
  `plantDesc` VARCHAR(225) NOT NULL DEFAULT ' ',
  `priceDollar` INT(11) NOT NULL DEFAULT '0',
  `priceCent` INT(11) NOT NULL DEFAULT '0',
  `imgLink` VARCHAR(225) NULL DEFAULT ' ',
  PRIMARY KEY (`idplant`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `purchase` (
  `idpurchase` INT(11) NOT NULL AUTO_INCREMENT,
  `purchaseDate` DATETIME NOT NULL,
  `customer_idcustomer` INT(11) NOT NULL,
  PRIMARY KEY (`idpurchase`, `customer_idcustomer`),
  INDEX `fk_purchase_customer_idx` (`customer_idcustomer` ASC),
  CONSTRAINT `fk_purchase_customer`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `plantdb`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lineItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lineItem` (
  `purchase_idpurchase` INT(11) NOT NULL,
  `plant_idplant` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL DEFAULT '0',
  `priceDollar` INT(11) NOT NULL DEFAULT '0',
  `priceCent` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`purchase_idpurchase`, `plant_idplant`),
  INDEX `fk_purchase_has_plant_plant1_idx` (`plant_idplant` ASC),
  INDEX `fk_purchase_has_plant_purchase1_idx` (`purchase_idpurchase` ASC),
  CONSTRAINT `fk_purchase_has_plant_plant1`
    FOREIGN KEY (`plant_idplant`)
    REFERENCES `plantdb`.`plant` (`idplant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_has_plant_purchase1`
    FOREIGN KEY (`purchase_idpurchase`)
    REFERENCES `plantdb`.`purchase` (`idpurchase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

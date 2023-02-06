-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema dummy_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dummy_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dummy_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Dummy_Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dummy_Table` (
  `Dummy 1`  NOT NULL,
  PRIMARY KEY (`Dummy 1`));

USE `dummy_schema` ;

-- -----------------------------------------------------
-- Table `dummy_schema`.`period`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dummy_schema`.`period` (
  `Period_Code` VARCHAR(10) NOT NULL,
  `Year` INT NULL DEFAULT NULL,
  `Quarter` INT NULL DEFAULT NULL,
  `Month` INT NULL DEFAULT NULL,
  `Day` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Period_Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dummy_schema`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dummy_schema`.`product` (
  `Product_Code` VARCHAR(10) NOT NULL,
  `Description` VARCHAR(100) NULL DEFAULT NULL,
  `Color` VARCHAR(30) NULL DEFAULT NULL,
  `Size` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Product_Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dummy_schema`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dummy_schema`.`store` (
  `Store_Code` VARCHAR(10) NOT NULL,
  `Store_Name` VARCHAR(50) NULL DEFAULT NULL,
  `City` VARCHAR(50) NULL DEFAULT NULL,
  `Telephone` INT NULL DEFAULT NULL,
  `Manager` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`Store_Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dummy_schema`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dummy_schema`.`sales` (
  `Product_Code` VARCHAR(10) NULL DEFAULT NULL,
  `Period_Code` VARCHAR(10) NULL DEFAULT NULL,
  `Store_Code` VARCHAR(10) NULL DEFAULT NULL,
  `Units_Sold` VARCHAR(10) NULL DEFAULT NULL,
  `Dollars_Sold` INT NULL DEFAULT NULL,
  `Dollars_Cost` INT NULL DEFAULT NULL,
  INDEX `Product_Code` (`Product_Code` ASC) VISIBLE,
  INDEX `Period_Code` (`Period_Code` ASC) VISIBLE,
  INDEX `Store_Code` (`Store_Code` ASC) VISIBLE,
  CONSTRAINT `sales_ibfk_1`
    FOREIGN KEY (`Product_Code`)
    REFERENCES `dummy_schema`.`product` (`Product_Code`),
  CONSTRAINT `sales_ibfk_2`
    FOREIGN KEY (`Period_Code`)
    REFERENCES `dummy_schema`.`period` (`Period_Code`),
  CONSTRAINT `sales_ibfk_3`
    FOREIGN KEY (`Store_Code`)
    REFERENCES `dummy_schema`.`store` (`Store_Code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

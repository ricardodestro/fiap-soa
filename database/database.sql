SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 ;
USE `store` ;

-- -----------------------------------------------------
-- Table `store`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `rg` VARCHAR(11) NULL,
  `address_home` VARCHAR(255) NULL,
  `address_delivery` VARCHAR(255) NULL,
  `phone_home` VARCHAR(45) NULL,
  `phone_mobile` VARCHAR(45) NULL,
  `creation_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`product` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL DEFAULT 0,
  `price` DECIMAL(10,3) NOT NULL,
  `max_discount_percent` INT NULL DEFAULT 0,
  `out_line_store` TINYINT(1) NULL,
  `out_line_factory` TINYINT(1) NULL,
  `creation_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NOT NULL,
  `client_id` INT NOT NULL,
  `total` DECIMAL(10,3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_client1_idx` (`client_id` ASC),
  CONSTRAINT `fk_order_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `store`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`order_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`order_product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_table1_order1_idx` (`order_id` ASC),
  INDEX `fk_table1_product1_idx` (`product_id` ASC),
  CONSTRAINT `fk_table1_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `store`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `store`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

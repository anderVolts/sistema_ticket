-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema zf3_helpdesk
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zf3_helpdesk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zf3_helpdesk` DEFAULT CHARACTER SET utf8mb4 ;
USE `zf3_helpdesk` ;

-- -----------------------------------------------------
-- Table `zf3_helpdesk`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zf3_helpdesk`.`users` (
  `id` INT ZEROFILL NOT NULL,
  `name` VARCHAR(120) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email_confirmed` TINYINT(1) NOT NULL,
  `token` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `zf3_helpdesk`.`tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zf3_helpdesk`.`tickets` (
  `id` INT ZEROFILL NOT NULL,
  `name` VARCHAR(85) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `priority` VARCHAR(45) NOT NULL,
  `created_at` INT NOT NULL,
  `users` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tickets_users1_idx` (`users` ASC),
  CONSTRAINT `fk_tickets_users1`
    FOREIGN KEY (`users`)
    REFERENCES `zf3_helpdesk`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `zf3_helpdesk`.`attachments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zf3_helpdesk`.`attachments` (
  `id` INT ZEROFILL NOT NULL,
  `name` VARCHAR(85) NOT NULL,
  `file` VARCHAR(45) NOT NULL,
  `tickets` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_attachments_tickets_idx` (`tickets` ASC),
  CONSTRAINT `fk_attachments_tickets`
    FOREIGN KEY (`tickets`)
    REFERENCES `zf3_helpdesk`.`tickets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

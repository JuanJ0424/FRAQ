-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema wad
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `wad` ;

-- -----------------------------------------------------
-- Schema wad
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wad` DEFAULT CHARACTER SET utf8 ;
USE `wad` ;

-- -----------------------------------------------------
-- Table `wad`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wad`.`user` ;

CREATE TABLE IF NOT EXISTS `wad`.`user` (
  `idUser` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(25) NULL DEFAULT NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `firstname` VARCHAR(30) NULL DEFAULT NULL,
  `lastname` VARCHAR(40) NULL DEFAULT NULL,
  `type` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wad`.`Exercise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wad`.`Exercise` ;

CREATE TABLE IF NOT EXISTS `wad`.`Exercise` (
  `idExercise` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT(11) NOT NULL,
  `type` INT NULL,
  `columns` INT NULL,
  `rows` INT NULL,
  PRIMARY KEY (`idExercise`),
  INDEX `fk_Exercise_user_idx` (`idUser` ASC),
  CONSTRAINT `fk_Exercise_user`
    FOREIGN KEY (`idUser`)
    REFERENCES `wad`.`user` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wad`.`Selected`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wad`.`Selected` ;

CREATE TABLE IF NOT EXISTS `wad`.`Selected` (
  `idSelected` INT NOT NULL AUTO_INCREMENT,
  `idExercise` INT NOT NULL,
  `x` INT NULL,
  `y` INT NULL,
  PRIMARY KEY (`idSelected`),
  INDEX `fk_Selected_Exercise_idx` (`idExercise` ASC),
  CONSTRAINT `fk_Selected_Exercise`
    FOREIGN KEY (`idExercise`)
    REFERENCES `wad`.`Exercise` (`idExercise`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `wad`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `wad`;
INSERT INTO `wad`.`user` (`idUser`, `username`, `password`, `email`, `firstname`, `lastname`, `type`) VALUES (DEFAULT, 'admin', 'admin', 'admin@admin.com', 'Administrador', '-', 1);
INSERT INTO `wad`.`user` (`idUser`, `username`, `password`, `email`, `firstname`, `lastname`, `type`) VALUES (DEFAULT, 'juanzv', 'contrasenasegura', 'juanjoze0424@gmail.com', 'Juan', 'Zenón', 1);
INSERT INTO `wad`.`user` (`idUser`, `username`, `password`, `email`, `firstname`, `lastname`, `type`) VALUES (DEFAULT, 'ximeML', 'Shalala1', 'ximmelu@hotmail.com', 'Ana Ximena', 'Medina Luqueño', 1);
INSERT INTO `wad`.`user` (`idUser`, `username`, `password`, `email`, `firstname`, `lastname`, `type`) VALUES (DEFAULT, 'idaliaMC', 'contrasenaidalia', 'iadlia@live.com', 'Idalia', 'Maldonado Castillo', 2);
INSERT INTO `wad`.`user` (`idUser`, `username`, `password`, `email`, `firstname`, `lastname`, `type`) VALUES (DEFAULT, 'arielLR', 'contrasenaariel', 'ariel@gmail.com', 'Ariel', 'López Rojas', 2);
INSERT INTO `wad`.`user` (`idUser`, `username`, `password`, `email`, `firstname`, `lastname`, `type`) VALUES (DEFAULT, 'axelMC', 'contrasenaaxel', 'axel@outlook.com', 'Axel Ernesto', 'Moreno Cervantes', 2);

COMMIT;


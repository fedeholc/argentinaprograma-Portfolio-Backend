-- MySQL Script generated by MySQL Workbench
-- Sat 17 Sep 2022 08:28:02 PM -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Portfolio Modulo 4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Portfolio Modulo 4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Portfolio Modulo 4` ;
USE `Portfolio Modulo 4` ;

-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Persona` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `mail` VARCHAR(45) NULL,
  `descripcion` VARCHAR(255) NULL,
  `foto` VARCHAR(255) NULL,
  `banner` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Idioma` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(255) NULL,
  `logo` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Persona_has_Idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Persona_has_Idioma` (
  `Persona_id` INT NOT NULL,
  `Idioma_id` INT NOT NULL,
  PRIMARY KEY (`Persona_id`, `Idioma_id`),
  INDEX `fk_Persona_has_Idioma_Idioma1_idx` (`Idioma_id` ASC) VISIBLE,
  INDEX `fk_Persona_has_Idioma_Persona_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Idioma_Persona`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `Portfolio Modulo 4`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Idioma_Idioma1`
    FOREIGN KEY (`Idioma_id`)
    REFERENCES `Portfolio Modulo 4`.`Idioma` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Institucion_educativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Institucion_educativa` (
  `id` INT NOT NULL,
  `institucion` VARCHAR(45) NULL,
  `logo` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Titulo_educativo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Titulo_educativo` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `Institucion_educativa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Titulos_educativos_Instituciones_educativas1_idx` (`Institucion_educativa_id` ASC) VISIBLE,
  CONSTRAINT `fk_Titulos_educativos_Instituciones_educativas1`
    FOREIGN KEY (`Institucion_educativa_id`)
    REFERENCES `Portfolio Modulo 4`.`Institucion_educativa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Educación`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Educación` (
  `id` INT NOT NULL,
  `periodo` VARCHAR(45) NULL,
  `Titulo_educativo_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Titulo_educativo_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Educación_Titulo_educativo1_idx` (`Titulo_educativo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Educación_Titulo_educativo1`
    FOREIGN KEY (`Titulo_educativo_id`)
    REFERENCES `Portfolio Modulo 4`.`Titulo_educativo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Persona_has_Educación`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Persona_has_Educación` (
  `Persona_id` INT NOT NULL,
  `Educación_id` INT NOT NULL,
  `Educación_Titulo_educativo_id` INT NOT NULL,
  PRIMARY KEY (`Persona_id`, `Educación_id`, `Educación_Titulo_educativo_id`),
  INDEX `fk_Persona_has_Educación_Educación1_idx` (`Educación_id` ASC, `Educación_Titulo_educativo_id` ASC) VISIBLE,
  INDEX `fk_Persona_has_Educación_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Educación_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `Portfolio Modulo 4`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Educación_Educación1`
    FOREIGN KEY (`Educación_id` , `Educación_Titulo_educativo_id`)
    REFERENCES `Portfolio Modulo 4`.`Educación` (`id` , `Titulo_educativo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Trabajo_lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Trabajo_lugar` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `logo` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Trabajo` (
  `id` INT NOT NULL,
  `puesto` VARCHAR(45) NULL,
  `descripcion` VARCHAR(255) NULL,
  `periodo` VARCHAR(45) NULL,
  `Trabajo_lugar_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Trabajo_lugar_id`),
  INDEX `fk_Trabajo_Trabajo_lugar1_idx` (`Trabajo_lugar_id` ASC) VISIBLE,
  CONSTRAINT `fk_Trabajo_Trabajo_lugar1`
    FOREIGN KEY (`Trabajo_lugar_id`)
    REFERENCES `Portfolio Modulo 4`.`Trabajo_lugar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Persona_has_Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Persona_has_Trabajo` (
  `Persona_id` INT NOT NULL,
  `Trabajo_id` INT NOT NULL,
  `Trabajo_Trabajo_lugar_id` INT NOT NULL,
  PRIMARY KEY (`Persona_id`, `Trabajo_id`, `Trabajo_Trabajo_lugar_id`),
  INDEX `fk_Persona_has_Trabajo_Trabajo1_idx` (`Trabajo_id` ASC, `Trabajo_Trabajo_lugar_id` ASC) VISIBLE,
  INDEX `fk_Persona_has_Trabajo_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Trabajo_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `Portfolio Modulo 4`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Trabajo_Trabajo1`
    FOREIGN KEY (`Trabajo_id` , `Trabajo_Trabajo_lugar_id`)
    REFERENCES `Portfolio Modulo 4`.`Trabajo` (`id` , `Trabajo_lugar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Pais` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Ciudad` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Pais_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Pais_id`),
  INDEX `fk_Ciudad_Pais1_idx` (`Pais_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ciudad_Pais1`
    FOREIGN KEY (`Pais_id`)
    REFERENCES `Portfolio Modulo 4`.`Pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Persona_has_Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Persona_has_Ciudad` (
  `Persona_id` INT NOT NULL,
  `Ciudad_id` INT NOT NULL,
  `Ciudad_Pais_id` INT NOT NULL,
  PRIMARY KEY (`Persona_id`, `Ciudad_id`, `Ciudad_Pais_id`),
  INDEX `fk_Persona_has_Ciudad_Ciudad1_idx` (`Ciudad_id` ASC, `Ciudad_Pais_id` ASC) VISIBLE,
  INDEX `fk_Persona_has_Ciudad_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Ciudad_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `Portfolio Modulo 4`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Ciudad_Ciudad1`
    FOREIGN KEY (`Ciudad_id` , `Ciudad_Pais_id`)
    REFERENCES `Portfolio Modulo 4`.`Ciudad` (`id` , `Pais_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Skill` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `valor` INT NULL,
  `logo` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Persona_has_Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Persona_has_Skill` (
  `Persona_id` INT NOT NULL,
  `Skill_id` INT NOT NULL,
  PRIMARY KEY (`Persona_id`, `Skill_id`),
  INDEX `fk_Persona_has_Skill_Skill1_idx` (`Skill_id` ASC) VISIBLE,
  INDEX `fk_Persona_has_Skill_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Skill_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `Portfolio Modulo 4`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Skill_Skill1`
    FOREIGN KEY (`Skill_id`)
    REFERENCES `Portfolio Modulo 4`.`Skill` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Proyecto` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(255) NULL,
  `logo` VARCHAR(255) NULL,
  `enlace` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio Modulo 4`.`Persona_has_Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio Modulo 4`.`Persona_has_Proyecto` (
  `Persona_id` INT NOT NULL,
  `Proyecto_id` INT NOT NULL,
  PRIMARY KEY (`Persona_id`, `Proyecto_id`),
  INDEX `fk_Persona_has_Proyecto_Proyecto1_idx` (`Proyecto_id` ASC) VISIBLE,
  INDEX `fk_Persona_has_Proyecto_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Proyecto_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `Portfolio Modulo 4`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Proyecto_Proyecto1`
    FOREIGN KEY (`Proyecto_id`)
    REFERENCES `Portfolio Modulo 4`.`Proyecto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
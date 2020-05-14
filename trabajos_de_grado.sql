-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trabajodegrado_gui
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema trabajodegrado_gui
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trabajodegrado_gui` DEFAULT CHARACTER SET utf8 ;
USE `trabajodegrado_gui` ;

-- -----------------------------------------------------
-- Table `trabajodegrado_gui`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajodegrado_gui`.`usuario` (
  `id_usuario` INT NOT NULL,
  `fecha_registro` DATE NOT NULL,
  `nombres` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `correo_electronico` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  `foto` MEDIUMBLOB NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajodegrado_gui`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajodegrado_gui`.`estudiante` (
  `id_estudiante` INT NOT NULL,
  `carrera` VARCHAR(45) NULL,
  `semestre` TINYINT(2) NULL,
  `usuario` INT NULL,
  PRIMARY KEY (`id_estudiante`),
  INDEX `usuario_idx` (`usuario` ASC) VISIBLE,
  CONSTRAINT `usuario_estudiante`
    FOREIGN KEY (`usuario`)
    REFERENCES `trabajodegrado_gui`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajodegrado_gui`.`tribunal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajodegrado_gui`.`tribunal` (
  `id_tribunal` INT NOT NULL,
  `cargo` VARCHAR(45) NULL,
  `usuario` INT NULL,
  PRIMARY KEY (`id_tribunal`),
  INDEX `usuario_tribunal_idx` (`usuario` ASC) VISIBLE,
  CONSTRAINT `usuario_tribunal`
    FOREIGN KEY (`usuario`)
    REFERENCES `trabajodegrado_gui`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajodegrado_gui`.`trabajo_de_grado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajodegrado_gui`.`trabajo_de_grado` (
  `id_trabajo_de_grado` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `autor` INT NULL,
  `fecha_subida` DATE NULL,
  `documento` LONGBLOB NULL,
  PRIMARY KEY (`id_trabajo_de_grado`),
  INDEX `usuario_trabajo_idx` (`autor` ASC) VISIBLE,
  CONSTRAINT `usuario_trabajo`
    FOREIGN KEY (`autor`)
    REFERENCES `trabajodegrado_gui`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajodegrado_gui`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajodegrado_gui`.`video` (
  `id_video` INT NOT NULL,
  `descripcion` MEDIUMTEXT NULL,
  `video` LONGBLOB NULL,
  `fecha_subida` DATE NULL,
  `trabajo_de_grado` INT NULL,
  PRIMARY KEY (`id_video`),
  INDEX `video_trabajo_de_grado_idx` (`trabajo_de_grado` ASC) VISIBLE,
  CONSTRAINT `video_trabajo_de_grado`
    FOREIGN KEY (`trabajo_de_grado`)
    REFERENCES `trabajodegrado_gui`.`trabajo_de_grado` (`id_trabajo_de_grado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajodegrado_gui`.`etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajodegrado_gui`.`etiqueta` (
  `id_etiqueta` INT NOT NULL,
  `etiqueta` VARCHAR(45) NULL,
  PRIMARY KEY (`id_etiqueta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajodegrado_gui`.`trabajo_etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajodegrado_gui`.`trabajo_etiqueta` (
  `id_trabajo_etiqueta` INT NOT NULL,
  `etiqueta` INT NULL,
  `trabajo` INT NULL,
  PRIMARY KEY (`id_trabajo_etiqueta`),
  INDEX `trabajo_trabajo_etiqueta_idx` (`trabajo` ASC) VISIBLE,
  INDEX `etiqueta_trabajo_etiqueta_idx` (`etiqueta` ASC) VISIBLE,
  CONSTRAINT `trabajo_trabajo_etiqueta`
    FOREIGN KEY (`trabajo`)
    REFERENCES `trabajodegrado_gui`.`trabajo_de_grado` (`id_trabajo_de_grado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `etiqueta_trabajo_etiqueta`
    FOREIGN KEY (`etiqueta`)
    REFERENCES `trabajodegrado_gui`.`etiqueta` (`id_etiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajodegrado_gui`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajodegrado_gui`.`categoria` (
  `id_categoria` INT NOT NULL,
  `categoria` VARCHAR(45) NULL,
  `descripcion` MEDIUMTEXT NULL,
  `imagen` MEDIUMBLOB NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajodegrado_gui`.`trabajo_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajodegrado_gui`.`trabajo_categoria` (
  `id_categoria_trabajo` INT NOT NULL,
  `categoria` INT NULL,
  `trabajo` INT NULL,
  PRIMARY KEY (`id_categoria_trabajo`),
  INDEX `trabajo_trabajo_categoria_idx` (`trabajo` ASC) VISIBLE,
  INDEX `categoria_trabajo_categoria_idx` (`categoria` ASC) VISIBLE,
  CONSTRAINT `trabajo_trabajo_categoria`
    FOREIGN KEY (`trabajo`)
    REFERENCES `trabajodegrado_gui`.`trabajo_de_grado` (`id_trabajo_de_grado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `categoria_trabajo_categoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `trabajodegrado_gui`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabajodegrado_gui`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabajodegrado_gui`.`comentarios` (
  `id_comentarios` INT NOT NULL,
  `contenido` MEDIUMTEXT NULL,
  `calificacion` TINYINT(2) NULL,
  `usuario` INT NULL,
  `trabajo_de_grado` INT NULL,
  PRIMARY KEY (`id_comentarios`),
  INDEX `trabajo_comentarios_idx` (`trabajo_de_grado` ASC) VISIBLE,
  INDEX `usuario_comentarios_idx` (`usuario` ASC) VISIBLE,
  CONSTRAINT `trabajo_comentarios`
    FOREIGN KEY (`trabajo_de_grado`)
    REFERENCES `trabajodegrado_gui`.`trabajo_de_grado` (`id_trabajo_de_grado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usuario_comentarios`
    FOREIGN KEY (`usuario`)
    REFERENCES `trabajodegrado_gui`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

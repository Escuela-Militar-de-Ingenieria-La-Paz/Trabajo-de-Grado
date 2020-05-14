-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Repositorio_Stilling_Program
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Repositorio_Stilling_Program
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Repositorio_Stilling_Program` DEFAULT CHARACTER SET utf8 ;
USE `Repositorio_Stilling_Program` ;

-- -----------------------------------------------------
-- Table `Repositorio_Stilling_Program`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Repositorio_Stilling_Program`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `nombre_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repositorio_Stilling_Program`.`Trabajo_de_grado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Repositorio_Stilling_Program`.`Trabajo_de_grado` (
  `idTrabajo_de_grado` INT NOT NULL,
  `titulo` VARCHAR(60) NOT NULL,
  `cuerpo_de__trabajo` VARCHAR(5000) NOT NULL,
  `año_de_publicacion` VARCHAR(5) NOT NULL,
  `carrera` VARCHAR(30) NOT NULL,
  `resumen_ejecutivo` VARCHAR(1000) NOT NULL,
  `palabras_clave` VARCHAR(45) NOT NULL,
  `nombres_tutor` VARCHAR(45) NOT NULL,
  `apellido_paterno_tutor` VARCHAR(25) NOT NULL,
  `apellido_materno_tutor` VARCHAR(25) NULL,
  `nombres_revisor` VARCHAR(45) NOT NULL,
  `apellido_paterno_revisor` VARCHAR(25) NOT NULL,
  `apellido_materno_revisor` VARCHAR(25) NULL,
  `enlace_github` VARCHAR(100) NOT NULL,
  `videograbacion` BLOB NOT NULL,
  `n_descargas` INT NULL,
  `n_vistas` INT NULL,
  PRIMARY KEY (`idTrabajo_de_grado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repositorio_Stilling_Program`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Repositorio_Stilling_Program`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `apellido_materno` VARCHAR(25) NULL,
  `apellido_paterno` VARCHAR(25) NULL,
  `ci` VARCHAR(15) NOT NULL,
  `tel_cel` VARCHAR(12) NOT NULL,
  `semestre` VARCHAR(15) NULL,
  `correo_institucional` VARCHAR(45) NOT NULL,
  `cuenta_github` VARCHAR(50) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repositorio_Stilling_Program`.`Calificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Repositorio_Stilling_Program`.`Calificacion` (
  `idCalificacion` INT NOT NULL,
  `idTrabajo_de_grado` INT ZEROFILL NOT NULL,
  `idUsuario` INT NOT NULL,
  `calificacion` INT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCalificacion`),
  INDEX `fk_Calificacion_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Calificacion_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Repositorio_Stilling_Program`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repositorio_Stilling_Program`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Repositorio_Stilling_Program`.`Comentarios` (
  `idComentarios` INT NOT NULL,
  `comentario` VARCHAR(1000) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idComentarios`),
  INDEX `fk_Comentarios_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Comentarios_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Repositorio_Stilling_Program`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repositorio_Stilling_Program`.`Trabajo_de_grado_has_Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Repositorio_Stilling_Program`.`Trabajo_de_grado_has_Comentarios` (
  `Comentarios_idComentarios` INT NOT NULL,
  `Trabajo_de_grado_idTrabajo_de_grado` INT NOT NULL,
  PRIMARY KEY (`Comentarios_idComentarios`, `Trabajo_de_grado_idTrabajo_de_grado`),
  INDEX `fk_Comentarios_Trabajo_de_Grado_Comentarios1_idx` (`Comentarios_idComentarios` ASC) VISIBLE,
  INDEX `fk_Trabajo_de_grado_has_Comentarios_Trabajo_de_grado1_idx` (`Trabajo_de_grado_idTrabajo_de_grado` ASC) VISIBLE,
  CONSTRAINT `fk_Comentarios_Trabajo_de_Grado_Comentarios1`
    FOREIGN KEY (`Comentarios_idComentarios`)
    REFERENCES `Repositorio_Stilling_Program`.`Comentarios` (`idComentarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajo_de_grado_has_Comentarios_Trabajo_de_grado1`
    FOREIGN KEY (`Trabajo_de_grado_idTrabajo_de_grado`)
    REFERENCES `Repositorio_Stilling_Program`.`Trabajo_de_grado` (`idTrabajo_de_grado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repositorio_Stilling_Program`.`Trabajo_de_grado_has_Calificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Repositorio_Stilling_Program`.`Trabajo_de_grado_has_Calificacion` (
  `Calificacion_idCalificacion` INT NOT NULL,
  `Trabajo_de_grado_idTrabajo_de_grado` INT NOT NULL,
  PRIMARY KEY (`Calificacion_idCalificacion`, `Trabajo_de_grado_idTrabajo_de_grado`),
  INDEX `fk_Calificacion_Trabajo_de_grado_Calificacion1_idx` (`Calificacion_idCalificacion` ASC) VISIBLE,
  INDEX `fk_Trabajo_de_grado_has_Calificacion_Trabajo_de_grado1_idx` (`Trabajo_de_grado_idTrabajo_de_grado` ASC) VISIBLE,
  CONSTRAINT `fk_Calificacion_Trabajo_de_grado_Calificacion1`
    FOREIGN KEY (`Calificacion_idCalificacion`)
    REFERENCES `Repositorio_Stilling_Program`.`Calificacion` (`idCalificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajo_de_grado_has_Calificacion_Trabajo_de_grado1`
    FOREIGN KEY (`Trabajo_de_grado_idTrabajo_de_grado`)
    REFERENCES `Repositorio_Stilling_Program`.`Trabajo_de_grado` (`idTrabajo_de_grado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repositorio_Stilling_Program`.`Trabajo_de_grado_has_Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Repositorio_Stilling_Program`.`Trabajo_de_grado_has_Categoria` (
  `Categoria_idCategoria` INT NOT NULL,
  `Trabajo_de_grado_idTrabajo_de_grado` INT NOT NULL,
  PRIMARY KEY (`Categoria_idCategoria`, `Trabajo_de_grado_idTrabajo_de_grado`),
  INDEX `fk_Trabajo_de_grado_has_Categoria_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  INDEX `fk_Trabajo_de_grado_has_Categoria_Trabajo_de_grado1_idx` (`Trabajo_de_grado_idTrabajo_de_grado` ASC) VISIBLE,
  CONSTRAINT `fk_Trabajo_de_grado_has_Categoria_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `Repositorio_Stilling_Program`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajo_de_grado_has_Categoria_Trabajo_de_grado1`
    FOREIGN KEY (`Trabajo_de_grado_idTrabajo_de_grado`)
    REFERENCES `Repositorio_Stilling_Program`.`Trabajo_de_grado` (`idTrabajo_de_grado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repositorio_Stilling_Program`.`Tipos_de_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Repositorio_Stilling_Program`.`Tipos_de_Usuario` (
  `Usuario_idUsuario` INT NOT NULL,
  `Estudiantes_3_7` INT NULL,
  `Estudiantes_8_10` INT NULL,
  `Tribunal_EMI` INT NULL,
  `Comunidad` INT NULL,
  PRIMARY KEY (`Usuario_idUsuario`),
  CONSTRAINT `fk_Tipos_de_Usuario_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Repositorio_Stilling_Program`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Repositorio_Stilling_Program`.`Privilegios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Repositorio_Stilling_Program`.`Privilegios` (
  `Tipos_de_Usuario_Usuario_idUsuario` INT NOT NULL,
  `Vista Completa` TINYINT NULL,
  `Vista Parcial` TINYINT NULL,
  `Vista Administrador` TINYINT NULL,
  PRIMARY KEY (`Tipos_de_Usuario_Usuario_idUsuario`),
  CONSTRAINT `fk_Privilegios_Tipos_de_Usuario1`
    FOREIGN KEY (`Tipos_de_Usuario_Usuario_idUsuario`)
    REFERENCES `Repositorio_Stilling_Program`.`Tipos_de_Usuario` (`Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

CREATE DATABASE Repositorio;
use Repositorio;

CREATE TABLE `Categoria` (
  `idCategoria` INT NOT NULL,
  `nombre_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;

CREATE TABLE `Usuario` (
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

CREATE TABLE `Trabajo_de_grado` (
  `idTrabajo_de_grado` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
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
  PRIMARY KEY (`idTrabajo_de_grado`),
  CONSTRAINT `fk_Trabajo_de_grado_Usuario1`
  FOREIGN KEY (`Usuario_idUsuario`)
  REFERENCES `Usuario`(`idUsuario`))
ENGINE = InnoDB;

CREATE TABLE `Calificacion` (
  `idCalificacion` INT NOT NULL,
  `calificacion` INT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCalificacion`),
  CONSTRAINT `fk_Calificacion_Usuario1`
  FOREIGN KEY (`Usuario_idUsuario`)
  REFERENCES `Usuario` (`idUsuario`)
	)
ENGINE = InnoDB;

CREATE TABLE `Comentarios` (
  `idComentarios` INT NOT NULL,
  `comentario` VARCHAR(1000) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idComentarios`),
  CONSTRAINT `fk_Comentarios_Usuario1`
  FOREIGN KEY (`Usuario_idUsuario`)
  REFERENCES `Usuario` (`idUsuario`)
   )
ENGINE = InnoDB;

CREATE TABLE `Trabajo_de_grado_has_Comentarios` (
`Trabajo_de_grado_idTrabajo_de_grado` INT NOT NULL,
  `Comentarios_idComentarios` INT NOT NULL,
  PRIMARY KEY (`Trabajo_de_grado_idTrabajo_de_grado`, `Comentarios_idComentarios`),
  CONSTRAINT `fk_Comentarios_Trabajo_de_Grado_Trabajo_de_grado1`
    FOREIGN KEY (`Trabajo_de_grado_idTrabajo_de_grado`)
    REFERENCES `Trabajo_de_grado` (`idTrabajo_de_grado`),
  CONSTRAINT `fk_Comentarios_Trabajo_de_Grado_Comentarios1`
    FOREIGN KEY (`Comentarios_idComentarios`)
    REFERENCES `Comentarios` (`idComentarios`)
	)
ENGINE = InnoDB;

CREATE TABLE `Trabajo_de_grado_has_Calificacion` (
  `Trabajo_de_grado_idTrabajo_de_grado` INT NOT NULL,
  `Calificacion_idCalificacion` INT NOT NULL,
  PRIMARY KEY (`Trabajo_de_grado_idTrabajo_de_grado`, `Calificacion_idCalificacion`),
  CONSTRAINT `fk_Calificacion_Trabajo_de_grado_Trabajo_de_grado1`
    FOREIGN KEY (`Trabajo_de_grado_idTrabajo_de_grado`)
    REFERENCES `Trabajo_de_grado` (`idTrabajo_de_grado`),
   
  CONSTRAINT `fk_Calificacion_Trabajo_de_grado_Calificacion1`
    FOREIGN KEY (`Calificacion_idCalificacion`)
    REFERENCES `Calificacion` (`idCalificacion`)
	)
ENGINE = InnoDB;

CREATE TABLE `Trabajo_de_grado_has_Categoria` (
 `Trabajo_de_grado_idTrabajo_de_grado` INT NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`Trabajo_de_grado_idTrabajo_de_grado`, `Categoria_idCategoria`),
  CONSTRAINT `fk_Categoria_y_Trabajo_de_grado_Trabajo_de_grado1`
    FOREIGN KEY (`Trabajo_de_grado_idTrabajo_de_grado`)
    REFERENCES `Trabajo_de_grado` (`idTrabajo_de_grado`),
  CONSTRAINT `fk_Categoria_y_Trabajo_de_grado_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `Categoria`(`idCategoria`)
    )
ENGINE = InnoDB;

CREATE TABLE `Tipos_de_Usuario` (
  `Usuario_idUsuario` INT NOT NULL,
  `Estudiantes_3_7` INT NULL,
  `Estudiantes_8_10` INT NULL,
  `Tribunal_EMI` INT NULL,
  `Comunidad` INT NULL,
  PRIMARY KEY (`Usuario_idUsuario`),
  CONSTRAINT `fk_Tipos_de_Usuario_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Usuario` (`idUsuario`)
    )
ENGINE = InnoDB;

CREATE TABLE `Privilegios` (
  `Tipos_de_Usuario_Usuario_idUsuario` INT NOT NULL,
  `Vista Completa` TINYINT NULL,
  `Vista Parcial` TINYINT NULL,
  `Vista Administrador` TINYINT NULL,
  PRIMARY KEY (`Tipos_de_Usuario_Usuario_idUsuario`),
  CONSTRAINT `fk_Privilegios_Tipos_de_Usuario1`
    FOREIGN KEY (`Tipos_de_Usuario_Usuario_idUsuario`)
    REFERENCES `Tipos_de_Usuario` (`Usuario_idUsuario`)
    )
ENGINE = InnoDB;
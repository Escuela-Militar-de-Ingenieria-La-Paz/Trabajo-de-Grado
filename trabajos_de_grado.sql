-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2020 a las 05:47:39
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trabajos_de_grado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `id_acceso` tinyint(4) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso_has_usuario`
--

CREATE TABLE `acceso_has_usuario` (
  `usuario` int(11) DEFAULT NULL,
  `acceso` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_has_trabajo`
--

CREATE TABLE `categorias_has_trabajo` (
  `trabajo` int(11) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `contenido` text DEFAULT NULL,
  `calificacion` tinyint(2) DEFAULT NULL,
  `autor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_has_trabajo`
--

CREATE TABLE `comentarios_has_trabajo` (
  `trabajo` int(11) DEFAULT NULL,
  `comentario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunidad`
--

CREATE TABLE `comunidad` (
  `id_comunidad` int(11) NOT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `estudiante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL,
  `codigo` varchar(12) DEFAULT NULL,
  `carrera` varchar(45) DEFAULT NULL,
  `semestre` tinyint(2) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas`
--

CREATE TABLE `etiquetas` (
  `id_etiqueta` int(11) NOT NULL,
  `etiqueta` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiquetas_has_trabajo`
--

CREATE TABLE `etiquetas_has_trabajo` (
  `trabajo` int(11) DEFAULT NULL,
  `etiqueta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grabacion_defensa`
--

CREATE TABLE `grabacion_defensa` (
  `id_grabacion` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `video` blob DEFAULT NULL,
  `trabajo_de_grado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos_de_grado`
--

CREATE TABLE `trabajos_de_grado` (
  `id_trabajo` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `documento` blob DEFAULT NULL,
  `autor` int(11) DEFAULT NULL,
  `comunidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tribunal`
--

CREATE TABLE `tribunal` (
  `id_tribunal` int(11) NOT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `usuario` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id_acceso`);

--
-- Indices de la tabla `acceso_has_usuario`
--
ALTER TABLE `acceso_has_usuario`
  ADD KEY `FK_ACCESO_HAS_USUARIO_USUARIO` (`usuario`),
  ADD KEY `FK_ACCESO_HAS_USUARIO_ACCESO` (`acceso`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `categorias_has_trabajo`
--
ALTER TABLE `categorias_has_trabajo`
  ADD KEY `FK_CATEGORIAS_HAS_TRABAJO_TRABAJO` (`trabajo`),
  ADD KEY `FK_CATEGORIAS_HAS_TRABAJO_CATEGORIAS` (`categoria`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`);

--
-- Indices de la tabla `comentarios_has_trabajo`
--
ALTER TABLE `comentarios_has_trabajo`
  ADD KEY `FK_COMENTARIOS_HAS_TRABAJO_TRABAJO` (`trabajo`),
  ADD KEY `FK_COMENTARIOS_HAS_TRABAJO_COMENTARIOS` (`comentario`);

--
-- Indices de la tabla `comunidad`
--
ALTER TABLE `comunidad`
  ADD PRIMARY KEY (`id_comunidad`),
  ADD KEY `FK_COMUNIDAD_ESTUDIANTE` (`estudiante`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `FK_ESTUDIANTE_USUARIO` (`usuario`);

--
-- Indices de la tabla `etiquetas`
--
ALTER TABLE `etiquetas`
  ADD PRIMARY KEY (`id_etiqueta`);

--
-- Indices de la tabla `etiquetas_has_trabajo`
--
ALTER TABLE `etiquetas_has_trabajo`
  ADD KEY `FK_ETIQUETAS_HAS_TRABAJO_TRABAJO` (`trabajo`),
  ADD KEY `FK_ETIQUETAS_HAS_TRABAJO_ETIQUETAS` (`etiqueta`);

--
-- Indices de la tabla `grabacion_defensa`
--
ALTER TABLE `grabacion_defensa`
  ADD PRIMARY KEY (`id_grabacion`),
  ADD KEY `FK_GRABACION_DEFENSA_TRABAJO_DE_GRADO` (`trabajo_de_grado`);

--
-- Indices de la tabla `trabajos_de_grado`
--
ALTER TABLE `trabajos_de_grado`
  ADD PRIMARY KEY (`id_trabajo`),
  ADD KEY `FK_TRABAJO_DE_GRADO_ESTUDIANTE` (`autor`),
  ADD KEY `FK_TRABAJO_DE_GRADO_COMUNIDAD` (`comunidad`);

--
-- Indices de la tabla `tribunal`
--
ALTER TABLE `tribunal`
  ADD PRIMARY KEY (`id_tribunal`),
  ADD KEY `FK_TRIBUNAL_USUARIO` (`usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso_has_usuario`
--
ALTER TABLE `acceso_has_usuario`
  ADD CONSTRAINT `FK_ACCESO_HAS_USUARIO_ACCESO` FOREIGN KEY (`acceso`) REFERENCES `acceso` (`id_acceso`),
  ADD CONSTRAINT `FK_ACCESO_HAS_USUARIO_USUARIO` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `categorias_has_trabajo`
--
ALTER TABLE `categorias_has_trabajo`
  ADD CONSTRAINT `FK_CATEGORIAS_HAS_TRABAJO_CATEGORIAS` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `FK_CATEGORIAS_HAS_TRABAJO_TRABAJO` FOREIGN KEY (`trabajo`) REFERENCES `trabajos_de_grado` (`id_trabajo`);

--
-- Filtros para la tabla `comentarios_has_trabajo`
--
ALTER TABLE `comentarios_has_trabajo`
  ADD CONSTRAINT `FK_COMENTARIOS_HAS_TRABAJO_COMENTARIOS` FOREIGN KEY (`comentario`) REFERENCES `comentarios` (`id_comentario`),
  ADD CONSTRAINT `FK_COMENTARIOS_HAS_TRABAJO_TRABAJO` FOREIGN KEY (`trabajo`) REFERENCES `trabajos_de_grado` (`id_trabajo`);

--
-- Filtros para la tabla `comunidad`
--
ALTER TABLE `comunidad`
  ADD CONSTRAINT `FK_COMUNIDAD_ESTUDIANTE` FOREIGN KEY (`estudiante`) REFERENCES `estudiante` (`id_estudiante`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `FK_ESTUDIANTE_USUARIO` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `etiquetas_has_trabajo`
--
ALTER TABLE `etiquetas_has_trabajo`
  ADD CONSTRAINT `FK_ETIQUETAS_HAS_TRABAJO_ETIQUETAS` FOREIGN KEY (`etiqueta`) REFERENCES `etiquetas` (`id_etiqueta`),
  ADD CONSTRAINT `FK_ETIQUETAS_HAS_TRABAJO_TRABAJO` FOREIGN KEY (`trabajo`) REFERENCES `trabajos_de_grado` (`id_trabajo`);

--
-- Filtros para la tabla `grabacion_defensa`
--
ALTER TABLE `grabacion_defensa`
  ADD CONSTRAINT `FK_GRABACION_DEFENSA_TRABAJO_DE_GRADO` FOREIGN KEY (`trabajo_de_grado`) REFERENCES `trabajos_de_grado` (`id_trabajo`);

--
-- Filtros para la tabla `trabajos_de_grado`
--
ALTER TABLE `trabajos_de_grado`
  ADD CONSTRAINT `FK_TRABAJO_DE_GRADO_COMUNIDAD` FOREIGN KEY (`comunidad`) REFERENCES `comunidad` (`id_comunidad`),
  ADD CONSTRAINT `FK_TRABAJO_DE_GRADO_ESTUDIANTE` FOREIGN KEY (`autor`) REFERENCES `estudiante` (`id_estudiante`);

--
-- Filtros para la tabla `tribunal`
--
ALTER TABLE `tribunal`
  ADD CONSTRAINT `FK_TRIBUNAL_USUARIO` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

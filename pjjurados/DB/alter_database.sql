-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-03-2017 a las 13:25:15
-- Versión del servidor: 5.7.17-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebajur`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juicio`
--

CREATE TABLE IF NOT EXISTS `juicio` (
  `idjuicio` int(11) NOT NULL AUTO_INCREMENT,
  `jufechainicio` date NOT NULL,
  `jujueces` varchar(100) NOT NULL,
  `judescripcion` varchar(100) NOT NULL,
  `juobservacion` varchar(150) NOT NULL,
  `jufechafin` date DEFAULT NULL,
  `jufechaaudiencia` date DEFAULT NULL,
  `junroconvocatoria` varchar(150) DEFAULT NULL,
  `judireccionaudiencia` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idjuicio`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juicionotificaciones`
--

CREATE TABLE IF NOT EXISTS `juicionotificaciones` (
  `idjuicionotificaciones` int(11) NOT NULL AUTO_INCREMENT,
  `idjuicio` int(11) NOT NULL,
  `jnnombreplantilla` varchar(150) NOT NULL,
  `jnnombrearchivo` varchar(150) NOT NULL,
  `jnfechageneracion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jndescripcion` varchar(150) NOT NULL,
  `jncamino` varchar(150) NOT NULL,
  `idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idjuicionotificaciones`),
  KEY `idjuicio` (`idjuicio`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotespersonanotificacion`
--

CREATE TABLE IF NOT EXISTS `lotespersonanotificacion` (
  `idlotespersonanotificacion` int(11) NOT NULL AUTO_INCREMENT,
  `idLP` int(11) NOT NULL,
  `lpnfecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lpnobservacion` text NOT NULL,
  PRIMARY KEY (`idlotespersonanotificacion`),
  KEY `idLP` (`idLP`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE IF NOT EXISTS `notificaciones` (
  `idNotificacion` int(11) NOT NULL AUTO_INCREMENT,
  `idLote` int(11) NOT NULL,
  `PlantillaNotificacion` varchar(200) DEFAULT NULL,
  `ArchivoNotificaciones` varchar(200) DEFAULT NULL,
  `PlantillaSobres` varchar(200) DEFAULT NULL,
  `ArchivoSobres` varchar(200) DEFAULT NULL,
  `CartaSaludo` text,
  `IniciarCedulas` int(11) DEFAULT NULL,
  `PlantillaIntimacion` varchar(200) DEFAULT NULL,
  `ArchivoIntimacion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idNotificacion`),
  KEY `idLote` (`idLote`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaseleccion`
--

CREATE TABLE IF NOT EXISTS `personaseleccion` (
  `idPersona` int(11) NOT NULL,
  `idseleccion` int(11) NOT NULL,
  `psnroordenseleccion` int(11) NOT NULL,
  `psexcusacion` text,
  `psrecusacioncausa` text,
  `pscaracter` varchar(50) NOT NULL,
  `psasiste` tinyint(1) DEFAULT NULL,
  `psasisteobservacion` text,
  `psobservacion` text,
  `idtiposeleccionrecusacion` int(11) DEFAULT NULL,
  `idpersonaseleccionresultadotipos` int(11) DEFAULT NULL,
  `idjuicio` int(11) NOT NULL,
  `psnrojurado` int(11) DEFAULT NULL,
  `psfechaexcusacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idLote` int(11) NOT NULL,
  `psfechaseleccion` date DEFAULT NULL,
  `psfechafinseleccion` date DEFAULT NULL,
  `psnrobolilla` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPersona`,`idseleccion`),
  KEY `idpersonaseleccionresultadotipos` (`idpersonaseleccionresultadotipos`),
  KEY `idjuicio` (`idjuicio`),
  KEY `idseleccion` (`idseleccion`),
  KEY `idtiposeleccionrecusacion` (`idtiposeleccionrecusacion`),
  KEY `idLote` (`idLote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaselecciondocumento`
--

CREATE TABLE IF NOT EXISTS `personaselecciondocumento` (
  `idpersonaselecciondocumento` int(11) NOT NULL AUTO_INCREMENT,
  `psddescripcion` text NOT NULL,
  `psdfechafin` datetime NOT NULL,
  `psdarchivo` text NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idseleccion` int(11) NOT NULL,
  `idpersonaselecciondocumentotipos` int(11) NOT NULL,
  PRIMARY KEY (`idpersonaselecciondocumento`),
  KEY `idseleccion` (`idseleccion`),
  KEY `idPersona` (`idPersona`),
  KEY `idpersonaselecciondocumentotipos` (`idpersonaselecciondocumentotipos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaselecciondocumentotipos`
--

CREATE TABLE IF NOT EXISTS `personaselecciondocumentotipos` (
  `idpersonaselecciondocumentotipos` int(11) NOT NULL AUTO_INCREMENT,
  `psdtdescripcion` varchar(150) NOT NULL,
  `psdtactivo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpersonaselecciondocumentotipos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personaselecciondocumentotipos`
--

INSERT INTO `personaselecciondocumentotipos` (`idpersonaselecciondocumentotipos`, `psdtdescripcion`, `psdtactivo`) VALUES
(1, 'Excusación', 1),
(2, 'Recusación', 1),
(3, 'Otros', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaseleccionresultadotipos`
--

CREATE TABLE IF NOT EXISTS `personaseleccionresultadotipos` (
  `idpersonaseleccionresultadotipos` int(11) NOT NULL AUTO_INCREMENT,
  `psrtdescripcion` varchar(50) NOT NULL,
  `psrtactivo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpersonaseleccionresultadotipos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personaseleccionresultadotipos`
--

INSERT INTO `personaseleccionresultadotipos` (`idpersonaseleccionresultadotipos`, `psrtdescripcion`, `psrtactivo`) VALUES
(1, 'Excusado', 1),
(2, 'Recusado con Causa', 1),
(3, 'Recusado sin Causa', 1),
(4, 'Designado', 1),
(5, 'No Designado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seleccion`
--

CREATE TABLE IF NOT EXISTS `seleccion` (
  `idseleccion` int(11) NOT NULL AUTO_INCREMENT,
  `sefecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idseleccion`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposeleccionrecusacion`
--

CREATE TABLE IF NOT EXISTS `tiposeleccionrecusacion` (
  `idtiposeleccionrecusacion` int(11) NOT NULL AUTO_INCREMENT,
  `trsdescripcion` varchar(100) NOT NULL,
  `trsactivo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtiposeleccionrecusacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposeleccionrecusacion`
--

INSERT INTO `tiposeleccionrecusacion` (`idtiposeleccionrecusacion`, `trsdescripcion`, `trsactivo`) VALUES
(1, 'Fiscalia', 1),
(2, 'Defensa', 1),
(3, 'Querella', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `juicionotificaciones`
--
ALTER TABLE `juicionotificaciones`
  ADD CONSTRAINT `juicionotificaciones_ibfk_1` FOREIGN KEY (`idjuicio`) REFERENCES `juicio` (`idjuicio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lotespersonanotificacion`
--
ALTER TABLE `lotespersonanotificacion`
  ADD CONSTRAINT `lotespersonanotificacion_ibfk_1` FOREIGN KEY (`idLP`) REFERENCES `lotespersonas` (`idLP`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `personaseleccion`
--
ALTER TABLE `personaseleccion`
  ADD CONSTRAINT `personaseleccion_ibfk_1` FOREIGN KEY (`idpersonaseleccionresultadotipos`) REFERENCES `personaseleccionresultadotipos` (`idpersonaseleccionresultadotipos`) ON UPDATE CASCADE,
  ADD CONSTRAINT `personaseleccion_ibfk_2` FOREIGN KEY (`idjuicio`) REFERENCES `juicio` (`idjuicio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `personaseleccion_ibfk_3` FOREIGN KEY (`idseleccion`) REFERENCES `seleccion` (`idseleccion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `personaseleccion_ibfk_4` FOREIGN KEY (`idtiposeleccionrecusacion`) REFERENCES `tiposeleccionrecusacion` (`idtiposeleccionrecusacion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `personaseleccion_ibfk_5` FOREIGN KEY (`idLote`) REFERENCES `lotes` (`idLote`);

--
-- Filtros para la tabla `personaselecciondocumento`
--
ALTER TABLE `personaselecciondocumento`
  ADD CONSTRAINT `personaselecciondocumento_ibfk_1` FOREIGN KEY (`idseleccion`) REFERENCES `seleccion` (`idseleccion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `personaselecciondocumento_ibfk_2` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `personaselecciondocumento_ibfk_3` FOREIGN KEY (`idpersonaselecciondocumentotipos`) REFERENCES `personaselecciondocumentotipos` (`idpersonaselecciondocumentotipos`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

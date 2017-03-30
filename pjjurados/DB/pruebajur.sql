-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-03-2017 a las 13:15:34
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
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Orden` int(11) DEFAULT NULL,
  `FHAlta` datetime DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `Descripcion`, `Orden`, `FHAlta`, `Login`) VALUES
(4, 'Requisitos para ser Jurado - Ley 2784 - Art. 43', 1, '2015-02-11 17:59:52', 'sroa'),
(5, 'Impedimentos para ser Jurado - Ley 2780 art 44', 2, '2015-02-11 18:00:22', 'sroa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrodistribucion`
--

CREATE TABLE `centrodistribucion` (
  `idCentroDistribucion` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `idLocalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `centrodistribucion`
--

INSERT INTO `centrodistribucion` (`idCentroDistribucion`, `Nombre`, `idLocalidad`) VALUES
(1, 'Div. Central', 1),
(2, 'Comisaria 5°', 2),
(3, 'Comisaria 7°', 5),
(4, 'Comisaria 11°', 6),
(7, 'Comisaria 46°', 5),
(8, 'Comisaria 35°', 10),
(9, 'czczxc zczxczxczxc', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `circuitos`
--

CREATE TABLE `circuitos` (
  `idCircuito` int(11) NOT NULL,
  `Nombre` varchar(10) NOT NULL,
  `Circunscripcion` int(11) NOT NULL,
  `idLocalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `circuitos`
--

INSERT INTO `circuitos` (`idCircuito`, `Nombre`, `Circunscripcion`, `idLocalidad`) VALUES
(1, '1', 1, 1),
(2, '1A', 1, 1),
(3, '1B', 1, 1),
(4, '1C', 1, 1),
(5, '1D', 1, 1),
(6, '1E', 1, 1),
(7, '1F', 1, 1),
(8, '1G', 1, 1),
(9, '62', 1, 1),
(10, '62A', 1, 1),
(11, '63', 1, 1),
(12, '63A', 1, 1),
(13, '64', 1, 1),
(14, '64A', 1, 1),
(15, '72', 1, 1),
(16, '73', 1, 1),
(17, '74', 1, 1),
(18, '74A', 1, 1),
(19, '4', 1, 2),
(20, '4A', 1, 2),
(21, '75', 1, 3),
(22, '7B', 1, 4),
(23, '6', 1, 5),
(24, '7', 1, 6),
(25, '7C', 1, 7),
(26, '14', 1, 8),
(27, '15', 1, 8),
(28, '15A', 1, 9),
(29, '15C', 1, 9),
(30, '16A', 1, 10),
(31, '17B', 1, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosddjj`
--

CREATE TABLE `estadosddjj` (
  `idEstadoDDJJ` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estadosddjj`
--

INSERT INTO `estadosddjj` (`idEstadoDDJJ`, `Descripcion`) VALUES
(1, 'Generada'),
(2, 'Enviada'),
(3, 'Completa'),
(4, 'Sin Notificar'),
(5, 'Sin Recepción'),
(6, 'Notificada'),
(7, 'Intimada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juicio`
--

CREATE TABLE `juicio` (
  `idjuicio` int(11) NOT NULL,
  `jufechainicio` date NOT NULL,
  `jujueces` varchar(100) NOT NULL,
  `judescripcion` varchar(100) NOT NULL,
  `juobservacion` varchar(150) NOT NULL,
  `jufechafin` date DEFAULT NULL,
  `jufechaaudiencia` date DEFAULT NULL,
  `junroconvocatoria` varchar(150) DEFAULT NULL,
  `judireccionaudiencia` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `juicio`
--

INSERT INTO `juicio` (`idjuicio`, `jufechainicio`, `jujueces`, `judescripcion`, `juobservacion`, `jufechafin`, `jufechaaudiencia`, `junroconvocatoria`, `judireccionaudiencia`) VALUES
(1, '2017-03-08', 'Aun sin definir', 'Uno el que sea', 'sdsdsd', '2017-03-10', '2017-03-02', '2/2017', 'Ant. Argentina Nro. 352'),
(2, '2017-03-08', 'rwer modificados', 'rwerwe', 'rwrwer', '2017-03-02', '2017-03-24', 'AAA', 'AAA'),
(3, '2017-03-04', 'ffff', 'ffff', 'fffff', NULL, NULL, NULL, NULL),
(4, '2017-12-12', 'malaa', 'judescripcion', 'juobservacion', NULL, NULL, NULL, NULL),
(5, '2017-03-08', 'rwer', 'rwerwe modificada', 'rwrwer', NULL, NULL, NULL, NULL),
(6, '2017-12-12', 'malaa', 'judescripcion dsdasdasd', 'juobservacion', NULL, NULL, NULL, NULL),
(7, '2017-03-08', 'rwer', 'rwerwe', 'rwrwer dsadasdsadsadsadsd', NULL, NULL, NULL, NULL),
(8, '2017-03-08', 'dd', 'dd', 'ddd', '2017-03-15', '2017-03-09', 'dd', 'dd'),
(9, '2017-03-01', 'dddd', 'asasas', 'ddd', '2017-03-15', '2017-03-09', 'asas', 'dd'),
(10, '2017-03-09', 'sadsad', 'dsadsad', 'asdasd', '2017-03-15', '2017-03-15', 'dsadasd', 'sdasdsd'),
(11, '2017-03-01', 'sss', 'ss', 'ss', '2017-03-01', '2017-03-01', 'ss', 'ss'),
(12, '2017-03-10', 'ddd', 'ddd', 'null', '2017-03-09', '2017-03-10', 'null', 'null');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juicionotificaciones`
--

CREATE TABLE `juicionotificaciones` (
  `idjuicionotificaciones` int(11) NOT NULL,
  `idjuicio` int(11) NOT NULL,
  `jnnombreplantilla` varchar(150) NOT NULL,
  `jnnombrearchivo` varchar(150) NOT NULL,
  `jnfechageneracion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jndescripcion` varchar(150) NOT NULL,
  `jncamino` varchar(150) NOT NULL,
  `idPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `juicionotificaciones`
--

INSERT INTO `juicionotificaciones` (`idjuicionotificaciones`, `idjuicio`, `jnnombreplantilla`, `jnnombrearchivo`, `jnfechageneracion`, `jndescripcion`, `jncamino`, `idPersona`) VALUES
(31, 1, '<a href="uploads/plantillas/plantilla_cedulas.rtf" >plantilla_cedulas.rtf </a>', '<a href="uploads/archivosrtf/1_plantilla_cedulas.rtf.zip" > 1_plantilla_cedulas.rtf.zip </a>', '2017-03-22 13:09:53', 'cedulas de citacion', 'uploads/archivosrtf/1_plantilla_cedulas.rtf.zip', 0),
(32, 1, 'Sin Plantilla', '<a href="uploads/archivosrtf/1_partes.xlsx" > 1_partes.xlsx </a>', '2017-03-22 13:09:54', 'Listado de Partes', 'uploads/archivosrtf/1_partes.xlsx', 0),
(33, 11, '<a href="uploads/plantillas/plantilla_cedulas.rtf" >plantilla_cedulas.rtf </a>', '<a href="uploads/archivosrtf/11_plantilla_cedulas.rtf.zip" > 11_plantilla_cedulas.rtf.zip </a>', '2017-03-27 18:33:55', 'cedulas de citacion', 'uploads/archivosrtf/11_plantilla_cedulas.rtf.zip', 0),
(34, 11, 'Sin Plantilla', '<a href="uploads/archivosrtf/11_partes.xlsx" > 11_partes.xlsx </a>', '2017-03-27 18:33:55', 'Listado de Partes', 'uploads/archivosrtf/11_partes.xlsx', 0),
(35, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > _1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:00:26', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(36, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > _1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:04:21', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(37, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > _1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:04:57', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(38, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > _1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:05:37', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(39, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > _1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:06:44', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(40, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > _1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:07:30', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(41, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:11:52', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(42, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:11:57', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(43, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:14:46', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(44, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:14:46', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(45, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:15:55', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(46, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:15:55', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(47, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:16:52', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(48, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:16:53', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(49, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:18:27', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(50, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:18:27', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(51, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:22:25', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(52, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:22:25', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(53, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:22:58', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(54, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:22:58', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(55, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:24:18', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(56, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:24:18', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(57, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:25:18', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(58, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:25:18', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(59, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:25:43', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(60, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:25:43', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(61, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:26:19', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(62, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:26:19', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(63, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:26:46', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(64, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:26:46', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(65, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:26:49', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(66, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:26:49', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(67, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:27:05', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(68, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:27:05', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(69, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:27:06', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(70, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:27:06', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(71, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:28:24', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(72, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:28:24', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(73, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:28:43', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(74, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:28:43', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(75, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:28:45', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(76, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:28:45', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(77, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:30:09', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(78, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:30:09', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(79, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:30:40', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(80, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:30:40', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 0),
(91, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:40:26', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2279_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 2279),
(92, 1, '<a href="uploads/plantillas/30032017NotificacionAudienciaSeleccion.rtf" >30032017NotificacionAudienciaSeleccion.rtf </a>', '<a href="uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip" > 2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip </a>', '2017-03-30 14:40:26', 'cedulas de notificacion audiencia', 'uploads/archivosrtf/2359_1_30032017NotificacionAudienciaSeleccion.rtf.zip', 2359);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `idLocalidad` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `localidades`
--

INSERT INTO `localidades` (`idLocalidad`, `Descripcion`) VALUES
(1, 'Neuquén Capital'),
(2, 'Centenario'),
(3, 'Vista Alegre'),
(4, 'Planicie Banderita'),
(5, 'Plottier'),
(6, 'Senillosa'),
(7, 'Arroyito'),
(8, 'Añelo'),
(9, 'S. P. Del Chañar'),
(10, 'Rincón De Los Sauces'),
(11, 'Octavio Pico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE `lotes` (
  `idLote` int(11) NOT NULL,
  `FechaDesde` date DEFAULT NULL,
  `FechaHasta` date DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `CantidadSorteados` int(11) DEFAULT NULL,
  `Observaciones` varchar(2000) DEFAULT NULL,
  `idPlantilla` int(11) DEFAULT NULL,
  `FHAlta` datetime DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lotes`
--

INSERT INTO `lotes` (`idLote`, `FechaDesde`, `FechaHasta`, `Descripcion`, `CantidadSorteados`, `Observaciones`, `idPlantilla`, `FHAlta`, `Login`) VALUES
(10, '2015-10-01', '2017-12-31', 'El Lote de Test', 299, 'dasdasdsad', 8, '2015-10-14 14:59:12', 'sroa'),
(11, '2016-01-01', '2016-06-30', 'Lote 1 2016', 497, 'dsadsadasd', 8, '2015-11-24 15:37:06', 'sroa'),
(12, '2016-07-01', '2016-12-31', 'fdsfsdf', 210, 'fdsfsdf', 8, '2015-12-16 11:07:54', 'sroa'),
(13, '2017-01-01', '2019-12-30', 'Lote 2017', 497, 'Prueba', 8, '2017-02-20 16:05:40', 'sroa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotespersonanotificacion`
--

CREATE TABLE `lotespersonanotificacion` (
  `idlotespersonanotificacion` int(11) NOT NULL,
  `idLP` int(11) NOT NULL,
  `lpnfecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lpnobservacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lotespersonanotificacion`
--

INSERT INTO `lotespersonanotificacion` (`idlotespersonanotificacion`, `idLP`, `lpnfecha`, `lpnobservacion`) VALUES
(1, 5767, '2017-03-06 03:00:00', 'Nueva'),
(2, 5767, '2015-12-01 03:00:00', 'Otra Nueva'),
(3, 5767, '2015-12-01 03:00:00', 'dgfdgdfgdfg fdf dsdsfsdf dgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdfdgfdgdfgdfg fdf dsdsfsdf'),
(4, 5766, '2017-03-06 03:00:00', 'dsdsadsdsa  ds dsdas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotespersonas`
--

CREATE TABLE `lotespersonas` (
  `idLP` int(11) NOT NULL,
  `idLote` int(11) DEFAULT NULL,
  `idPersona` int(11) DEFAULT NULL,
  `NroCedula` int(11) DEFAULT NULL,
  `id_reg` int(11) DEFAULT NULL,
  `FechaCarga` date DEFAULT NULL,
  `FechaNotificacion` datetime DEFAULT NULL,
  `FechaRecepcionDDJJ` datetime DEFAULT NULL,
  `FechaIntimacion` date DEFAULT NULL,
  `AptoJurado` bit(1) DEFAULT NULL,
  `idTipoImpedimento` int(11) DEFAULT NULL,
  `ObservacionesImpedimento` text,
  `idEstadoDDJJ` int(11) DEFAULT NULL,
  `idTipoResultado` int(11) DEFAULT NULL,
  `ObservacionesEstado` text,
  `CargaWeb` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lotespersonas`
--

INSERT INTO `lotespersonas` (`idLP`, `idLote`, `idPersona`, `NroCedula`, `id_reg`, `FechaCarga`, `FechaNotificacion`, `FechaRecepcionDDJJ`, `FechaIntimacion`, `AptoJurado`, `idTipoImpedimento`, `ObservacionesImpedimento`, `idEstadoDDJJ`, `idTipoResultado`, `ObservacionesEstado`, `CargaWeb`) VALUES
(5766, 10, 1932, 1500001, 9, '2015-10-14', NULL, NULL, NULL, b'1', 2, '', 3, NULL, '', 0),
(5767, 10, 1933, 1500002, 293, '2015-10-14', NULL, '2015-12-23 00:00:00', NULL, b'1', 3, '', 3, NULL, '', 0),
(5768, 10, 1934, 1500003, 577, '2015-10-14', NULL, '2015-12-15 00:00:00', NULL, b'0', 3, 'fgnfgnfgnfgn', 3, NULL, '', 0),
(5769, 10, 1935, 1500004, 861, '2015-10-14', NULL, NULL, NULL, b'1', NULL, '', 3, NULL, '', 0),
(5770, 10, 1936, 1500005, 1145, '2015-10-14', NULL, NULL, NULL, b'1', NULL, '', 3, NULL, '', 0),
(5771, 10, 1937, 1500006, 1429, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5772, 10, 1938, 1500007, 1713, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5773, 10, 1939, 1500008, 1997, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5774, 10, 1940, 1500009, 2281, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5775, 10, 1941, 1500010, 2565, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5776, 10, 1942, 1500011, 2849, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5777, 10, 1943, 1500012, 3133, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5778, 10, 1944, 1500013, 3417, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5779, 10, 1945, 1500014, 3701, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5780, 10, 1946, 1500015, 3985, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5781, 10, 1947, 1500016, 4269, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5782, 10, 1948, 1500017, 4553, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5783, 10, 1949, 1500018, 4837, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5784, 10, 1950, 1500019, 5121, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5785, 10, 1951, 1500020, 5405, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5786, 10, 1952, 1500021, 5689, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5787, 10, 1953, 1500022, 5973, '2015-10-14', '2015-05-01 00:00:00', NULL, NULL, NULL, NULL, NULL, 2, NULL, 'dwqd wdwqd wqdqw', 0),
(5788, 10, 1954, 1500023, 6257, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5789, 10, 1955, 1500024, 6541, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5790, 10, 1956, 1500025, 6825, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5791, 10, 1957, 1500026, 7109, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5792, 10, 1958, 1500027, 7393, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5793, 10, 1959, 1500028, 7677, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5794, 10, 1960, 1500029, 7961, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5795, 10, 1961, 1500030, 8245, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5796, 10, 1962, 1500031, 8529, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5797, 10, 1963, 1500032, 8813, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5798, 10, 1964, 1500033, 9097, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5799, 10, 1965, 1500034, 9381, '2015-10-14', '2015-05-02 00:00:00', NULL, NULL, NULL, NULL, NULL, 2, NULL, 'fdsfsd sdfsdf', 0),
(5800, 10, 1966, 1500035, 9665, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5801, 10, 1967, 1500036, 9949, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5802, 10, 1968, 1500037, 10233, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5803, 10, 1969, 1500038, 10517, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5804, 10, 1970, 1500039, 10801, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5805, 10, 1971, 1500040, 11085, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5806, 10, 1972, 1500041, 11369, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5807, 10, 1973, 1500042, 11653, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5808, 10, 1974, 1500043, 11937, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5809, 10, 1975, 1500044, 12221, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5810, 10, 1976, 1500045, 12505, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5811, 10, 1977, 1500046, 12789, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5812, 10, 1978, 1500047, 13073, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5813, 10, 1979, 1500048, 13357, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5814, 10, 1980, 1500049, 13641, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5815, 10, 1981, 1500050, 13925, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5816, 10, 1982, 1500051, 14209, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5817, 10, 1983, 1500052, 14493, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5818, 10, 1984, 1500053, 14777, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5819, 10, 1985, 1500054, 15061, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5820, 10, 1986, 1500055, 15345, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5821, 10, 1987, 1500056, 15629, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5822, 10, 1988, 1500057, 15913, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5823, 10, 1989, 1500058, 16197, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5824, 10, 1990, 1500059, 16481, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5825, 10, 1991, 1500060, 16765, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5826, 10, 1992, 1500061, 17049, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5827, 10, 1993, 1500062, 17333, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5828, 10, 1994, 1500063, 17617, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5829, 10, 1995, 1500064, 17901, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5830, 10, 1996, 1500065, 18185, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5831, 10, 1997, 1500066, 18469, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5832, 10, 1998, 1500067, 18753, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5833, 10, 1999, 1500068, 19037, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5834, 10, 2000, 1500069, 19321, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5835, 10, 2001, 1500070, 19605, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5836, 10, 2002, 1500071, 19889, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5837, 10, 2003, 1500072, 20173, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5838, 10, 2004, 1500073, 20457, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5839, 10, 2005, 1500074, 20741, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5840, 10, 2006, 1500075, 21025, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5841, 10, 2007, 1500076, 21309, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5842, 10, 2008, 1500077, 21593, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5843, 10, 2009, 1500078, 21877, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5844, 10, 2010, 1500079, 22161, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5845, 10, 2011, 1500080, 22445, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5846, 10, 2012, 1500081, 22729, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5847, 10, 2013, 1500082, 23013, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5848, 10, 2014, 1500083, 23297, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5849, 10, 2015, 1500084, 23581, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5850, 10, 2016, 1500085, 23865, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5851, 10, 2017, 1500086, 24149, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5852, 10, 2018, 1500087, 24433, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5853, 10, 2019, 1500088, 24717, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5854, 10, 2020, 1500089, 25001, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5855, 10, 2021, 1500090, 25285, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5856, 10, 2022, 1500091, 25569, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5857, 10, 2023, 1500092, 25853, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5858, 10, 2024, 1500093, 26137, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5859, 10, 2025, 1500094, 26421, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5860, 10, 2026, 1500095, 26705, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5861, 10, 2027, 1500096, 26989, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5862, 10, 2028, 1500097, 27273, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5863, 10, 2029, 1500098, 27557, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5864, 10, 2030, 1500099, 27841, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5865, 10, 2031, 1500100, 28125, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5866, 10, 2032, 1500101, 28409, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5867, 10, 2033, 1500102, 28693, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5868, 10, 2034, 1500103, 28977, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5869, 10, 2035, 1500104, 29261, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5870, 10, 2036, 1500105, 29545, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5871, 10, 2037, 1500106, 29829, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5872, 10, 2038, 1500107, 30113, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5873, 10, 2039, 1500108, 30397, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5874, 10, 2040, 1500109, 30681, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5875, 10, 2041, 1500110, 30965, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5876, 10, 2042, 1500111, 31249, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5877, 10, 2043, 1500112, 31533, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5878, 10, 2044, 1500113, 31817, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5879, 10, 2045, 1500114, 32101, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5880, 10, 2046, 1500115, 32385, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5881, 10, 2047, 1500116, 32669, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5882, 10, 2048, 1500117, 32953, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5883, 10, 2049, 1500118, 33237, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5884, 10, 2050, 1500119, 33521, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5885, 10, 2051, 1500120, 33805, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5886, 10, 2052, 1500121, 34089, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5887, 10, 2053, 1500122, 34373, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5888, 10, 2054, 1500123, 34657, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5889, 10, 2055, 1500124, 34941, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5890, 10, 2056, 1500125, 35225, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5891, 10, 2057, 1500126, 35509, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5892, 10, 2058, 1500127, 35793, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5893, 10, 2059, 1500128, 36077, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5894, 10, 2060, 1500129, 36361, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5895, 10, 2061, 1500130, 36645, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5896, 10, 2062, 1500131, 36929, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5897, 10, 2063, 1500132, 37213, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5898, 10, 2064, 1500133, 37497, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5899, 10, 2065, 1500134, 37781, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5900, 10, 2066, 1500135, 38065, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5901, 10, 2067, 1500136, 38349, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5902, 10, 2068, 1500137, 38633, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5903, 10, 2069, 1500138, 38917, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5904, 10, 2070, 1500139, 39201, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5905, 10, 2071, 1500140, 39485, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5906, 10, 2072, 1500141, 39769, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5907, 10, 2073, 1500142, 40053, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5908, 10, 2074, 1500143, 40337, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5909, 10, 2075, 1500144, 40621, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5910, 10, 2076, 1500145, 40905, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5911, 10, 2077, 1500146, 41189, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5912, 10, 2078, 1500147, 41473, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5913, 10, 2079, 1500148, 41757, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5914, 10, 2080, 1500149, 42041, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5915, 10, 2081, 1500150, 42325, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5916, 10, 2082, 1500151, 42609, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5917, 10, 2083, 1500152, 42893, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5918, 10, 2084, 1500153, 43177, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5919, 10, 2085, 1500154, 43461, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5920, 10, 2086, 1500155, 43745, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5921, 10, 2087, 1500156, 44029, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5922, 10, 2088, 1500157, 44313, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5923, 10, 2089, 1500158, 44597, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5924, 10, 2090, 1500159, 44881, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5925, 10, 2091, 1500160, 45165, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5926, 10, 2092, 1500161, 45449, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5927, 10, 2093, 1500162, 45733, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5928, 10, 2094, 1500163, 46017, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5929, 10, 2095, 1500164, 46301, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5930, 10, 2096, 1500165, 46585, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5931, 10, 2097, 1500166, 46869, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5932, 10, 2098, 1500167, 47153, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5933, 10, 2099, 1500168, 47437, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5934, 10, 2100, 1500169, 47721, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5935, 10, 2101, 1500170, 48005, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5936, 10, 2102, 1500171, 48289, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5937, 10, 2103, 1500172, 48573, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5938, 10, 2104, 1500173, 48857, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5939, 10, 2105, 1500174, 49141, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5940, 10, 2106, 1500175, 49425, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5941, 10, 2107, 1500176, 49709, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5942, 10, 2108, 1500177, 49993, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5943, 10, 2109, 1500178, 50277, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5944, 10, 2110, 1500179, 50561, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5945, 10, 2111, 1500180, 50845, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5946, 10, 2112, 1500181, 51129, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5947, 10, 2113, 1500182, 51413, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5948, 10, 2114, 1500183, 51697, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5949, 10, 2115, 1500184, 51981, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5950, 10, 2116, 1500185, 52265, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5951, 10, 2117, 1500186, 52549, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5952, 10, 2118, 1500187, 52833, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5953, 10, 2119, 1500188, 53117, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5954, 10, 2120, 1500189, 53401, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5955, 10, 2121, 1500190, 53685, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5956, 10, 2122, 1500191, 53969, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5957, 10, 2123, 1500192, 54253, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5958, 10, 2124, 1500193, 54537, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5959, 10, 2125, 1500194, 54821, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5960, 10, 2126, 1500195, 55105, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5961, 10, 2127, 1500196, 55389, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5962, 10, 2128, 1500197, 55673, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5963, 10, 2129, 1500198, 55957, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5964, 10, 2130, 1500199, 56241, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5965, 10, 2131, 1500200, 56525, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5966, 10, 2132, 1500201, 56809, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5967, 10, 2133, 1500202, 57093, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5968, 10, 2134, 1500203, 57377, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5969, 10, 2135, 1500204, 57661, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5970, 10, 2136, 1500205, 57945, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5971, 10, 2137, 1500206, 58229, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5972, 10, 2138, 1500207, 58513, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5973, 10, 2139, 1500208, 58797, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5974, 10, 2140, 1500209, 59081, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5975, 10, 2141, 1500210, 59365, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5976, 10, 2142, 1500211, 59649, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5977, 10, 2143, 1500212, 59933, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5978, 10, 2144, 1500213, 60217, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5979, 10, 2145, 1500214, 60501, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5980, 10, 2146, 1500215, 60785, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5981, 10, 2147, 1500216, 61069, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5982, 10, 2148, 1500217, 61353, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5983, 10, 2149, 1500218, 61637, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5984, 10, 2150, 1500219, 61921, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5985, 10, 2151, 1500220, 62205, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5986, 10, 2152, 1500221, 62489, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5987, 10, 2153, 1500222, 62773, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5988, 10, 2154, 1500223, 63057, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5989, 10, 2155, 1500224, 63341, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5990, 10, 2156, 1500225, 63625, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5991, 10, 2157, 1500226, 63909, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5992, 10, 2158, 1500227, 64193, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5993, 10, 2159, 1500228, 64477, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5994, 10, 2160, 1500229, 64761, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5995, 10, 2161, 1500230, 65045, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5996, 10, 2162, 1500231, 65329, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5997, 10, 2163, 1500232, 65613, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5998, 10, 2164, 1500233, 65897, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(5999, 10, 2165, 1500234, 66181, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6000, 10, 2166, 1500235, 66465, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6001, 10, 2167, 1500236, 66749, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6002, 10, 2168, 1500237, 67033, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6003, 10, 2169, 1500238, 67317, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6004, 10, 2170, 1500239, 67601, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6005, 10, 2171, 1500240, 67885, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6006, 10, 2172, 1500241, 68169, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6007, 10, 2173, 1500242, 68453, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6008, 10, 2174, 1500243, 68737, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6009, 10, 2175, 1500244, 69021, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6010, 10, 2176, 1500245, 69305, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6011, 10, 2177, 1500246, 69589, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6012, 10, 2178, 1500247, 69873, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6013, 10, 2179, 1500248, 70157, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6014, 10, 2180, 1500249, 70441, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6015, 10, 2181, 1500250, 70725, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6016, 10, 2182, 1500251, 71009, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6017, 10, 2183, 1500252, 71293, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6018, 10, 2184, 1500253, 71577, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6019, 10, 2185, 1500254, 71861, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6020, 10, 2186, 1500255, 72145, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6021, 10, 2187, 1500256, 72429, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6022, 10, 2188, 1500257, 72713, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6023, 10, 2189, 1500258, 72997, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6024, 10, 2190, 1500259, 73281, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6025, 10, 2191, 1500260, 73565, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6026, 10, 2192, 1500261, 73849, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6027, 10, 2193, 1500262, 74133, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6028, 10, 2194, 1500263, 74417, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6029, 10, 2195, 1500264, 74701, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6030, 10, 2196, 1500265, 74985, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6031, 10, 2197, 1500266, 75269, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6032, 10, 2198, 1500267, 75553, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6033, 10, 2199, 1500268, 75837, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6034, 10, 2200, 1500269, 76121, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6035, 10, 2201, 1500270, 76405, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6036, 10, 2202, 1500271, 76689, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6037, 10, 2203, 1500272, 76973, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6038, 10, 2204, 1500273, 77257, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6039, 10, 2205, 1500274, 77541, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6040, 10, 2206, 1500275, 77825, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6041, 10, 2207, 1500276, 78109, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6042, 10, 2208, 1500277, 78393, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6043, 10, 2209, 1500278, 78677, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6044, 10, 2210, 1500279, 78961, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6045, 10, 2211, 1500280, 79245, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6046, 10, 2212, 1500281, 79529, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6047, 10, 2213, 1500282, 79813, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6048, 10, 2214, 1500283, 80097, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6049, 10, 2215, 1500284, 80381, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6050, 10, 2216, 1500285, 80665, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6051, 10, 2217, 1500286, 80949, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6052, 10, 2218, 1500287, 81233, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6053, 10, 2219, 1500288, 81517, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6054, 10, 2220, 1500289, 81801, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6055, 10, 2221, 1500290, 82085, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6056, 10, 2222, 1500291, 82369, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6057, 10, 2223, 1500292, 82653, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6058, 10, 2224, 1500293, 82937, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6059, 10, 2225, 1500294, 83221, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6060, 10, 2226, 1500295, 83505, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6061, 10, 2227, 1500296, 83789, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6062, 10, 2228, 1500297, 84073, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6063, 10, 2229, 1500298, 84357, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6064, 10, 2230, 1500299, 84641, '2015-10-14', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6065, 11, 2231, NULL, 224, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6066, 11, 2232, NULL, 512, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6067, 11, 2233, NULL, 800, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6068, 11, 2234, NULL, 1088, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6069, 11, 2235, NULL, 1376, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6070, 11, 2236, NULL, 1664, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6071, 11, 2237, NULL, 1952, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6072, 11, 2238, NULL, 2240, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6073, 11, 2239, NULL, 2528, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6074, 11, 2240, NULL, 2816, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6075, 11, 2241, NULL, 3104, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6076, 11, 2242, NULL, 3392, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6077, 11, 2243, NULL, 3680, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6078, 11, 2244, NULL, 3968, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6079, 11, 2245, NULL, 4256, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6080, 11, 2246, NULL, 4544, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6081, 11, 2247, NULL, 4832, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6082, 11, 2248, NULL, 5120, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6083, 11, 2249, NULL, 5408, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6084, 11, 2250, NULL, 5696, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6085, 11, 2251, NULL, 5984, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6086, 11, 2252, NULL, 6272, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6087, 11, 2253, NULL, 6560, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6088, 11, 2254, NULL, 6848, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6089, 11, 2255, NULL, 7136, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6090, 11, 2256, NULL, 7424, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6091, 11, 2257, NULL, 7712, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6092, 11, 2258, NULL, 8000, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6093, 11, 2259, NULL, 8288, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6094, 11, 2260, NULL, 8576, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6095, 11, 2261, NULL, 8864, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6096, 11, 2262, NULL, 9152, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6097, 11, 2263, NULL, 9440, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6098, 11, 2264, NULL, 9728, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6099, 11, 2265, NULL, 10016, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6100, 11, 2266, NULL, 10304, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6101, 11, 2267, NULL, 10592, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6102, 11, 2268, NULL, 10880, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6103, 11, 2269, NULL, 11168, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6104, 11, 2270, NULL, 11456, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6105, 11, 2271, NULL, 11744, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6106, 11, 2272, NULL, 12032, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6107, 11, 2273, NULL, 12320, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6108, 11, 2274, NULL, 12608, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6109, 11, 2275, NULL, 12896, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6110, 11, 2276, NULL, 13184, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6111, 11, 2277, NULL, 13472, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6112, 11, 2278, NULL, 13760, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6113, 11, 2279, NULL, 14048, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6114, 11, 2280, NULL, 14336, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6115, 11, 2281, NULL, 14624, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6116, 11, 2282, NULL, 14912, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6117, 11, 2283, NULL, 15200, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6118, 11, 2284, NULL, 15488, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6119, 11, 2285, NULL, 15776, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6120, 11, 2286, NULL, 16064, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6121, 11, 2287, NULL, 16352, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6122, 11, 2288, NULL, 16640, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6123, 11, 2289, NULL, 16928, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6124, 11, 2290, NULL, 17216, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6125, 11, 2291, NULL, 17504, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6126, 11, 2292, NULL, 17792, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6127, 11, 2293, NULL, 18080, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6128, 11, 2294, NULL, 18368, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6129, 11, 2295, NULL, 18656, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6130, 11, 2296, NULL, 18944, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6131, 11, 2297, NULL, 19232, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6132, 11, 2298, NULL, 19520, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6133, 11, 2299, NULL, 19808, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6134, 11, 2300, NULL, 20096, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6135, 11, 2301, NULL, 20384, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6136, 11, 2302, NULL, 20672, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6137, 11, 2303, NULL, 20960, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6138, 11, 2304, NULL, 21248, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6139, 11, 2305, NULL, 21536, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6140, 11, 2306, NULL, 21824, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6141, 11, 2307, NULL, 22112, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6142, 11, 2308, NULL, 22400, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6143, 11, 2309, NULL, 22688, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6144, 11, 2310, NULL, 22976, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6145, 11, 2311, NULL, 23264, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6146, 11, 2312, NULL, 23552, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6147, 11, 2313, NULL, 23840, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6148, 11, 2314, NULL, 24128, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6149, 11, 2315, NULL, 24416, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6150, 11, 2316, NULL, 24704, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6151, 11, 2317, NULL, 24992, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6152, 11, 2318, NULL, 25280, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6153, 11, 2319, NULL, 25568, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6154, 11, 2320, NULL, 25856, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6155, 11, 2321, NULL, 26144, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6156, 11, 2322, NULL, 26432, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6157, 11, 2323, NULL, 26720, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6158, 11, 2324, NULL, 27008, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6159, 11, 2325, NULL, 27296, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6160, 11, 2326, NULL, 27584, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6161, 11, 2327, NULL, 27872, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6162, 11, 2328, NULL, 28160, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6163, 11, 2329, NULL, 28448, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6164, 11, 2330, NULL, 28736, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6165, 11, 2331, NULL, 29024, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6166, 11, 2332, NULL, 29312, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6167, 11, 2333, NULL, 29600, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6168, 11, 2334, NULL, 29888, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6169, 11, 2335, NULL, 30176, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6170, 11, 2336, NULL, 30464, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6171, 11, 2337, NULL, 30752, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6172, 11, 2338, NULL, 31040, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6173, 11, 2339, NULL, 31328, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6174, 11, 2340, NULL, 31616, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6175, 11, 2341, NULL, 31904, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6176, 11, 2342, NULL, 32192, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6177, 11, 2343, NULL, 32480, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6178, 11, 2344, NULL, 32768, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6179, 11, 2345, NULL, 33056, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6180, 11, 2346, NULL, 33344, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6181, 11, 2347, NULL, 33632, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6182, 11, 2348, NULL, 33920, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6183, 11, 2349, NULL, 34208, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6184, 11, 2350, NULL, 34496, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6185, 11, 2351, NULL, 34784, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6186, 11, 2352, NULL, 35072, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6187, 11, 2353, NULL, 35360, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6188, 11, 2354, NULL, 35648, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6189, 11, 2355, NULL, 35936, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6190, 11, 2356, NULL, 36224, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6191, 11, 2357, NULL, 36512, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6192, 11, 2358, NULL, 36800, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6193, 11, 2359, NULL, 37088, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6194, 11, 2360, NULL, 37376, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6195, 11, 2361, NULL, 37664, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6196, 11, 2362, NULL, 37952, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6197, 11, 2363, NULL, 38240, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6198, 11, 2364, NULL, 38528, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6199, 11, 2365, NULL, 38816, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6200, 11, 2366, NULL, 39104, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6201, 11, 2367, NULL, 39392, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6202, 11, 2368, NULL, 39680, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6203, 11, 2369, NULL, 39968, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6204, 11, 2370, NULL, 40256, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6205, 11, 2371, NULL, 40544, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6206, 11, 2372, NULL, 40832, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6207, 11, 2373, NULL, 41120, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6208, 11, 2374, NULL, 41408, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6209, 11, 2375, NULL, 41696, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6210, 11, 2376, NULL, 41984, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6211, 11, 2377, NULL, 42272, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6212, 11, 2378, NULL, 42560, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6213, 11, 2379, NULL, 42848, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6214, 11, 2380, NULL, 43136, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6215, 11, 2381, NULL, 43424, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6216, 11, 2382, NULL, 43712, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6217, 11, 2383, NULL, 44000, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6218, 11, 2384, NULL, 44288, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6219, 11, 2385, NULL, 44576, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6220, 11, 2386, NULL, 44864, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6221, 11, 2387, NULL, 45152, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6222, 11, 2388, NULL, 45440, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6223, 11, 2389, NULL, 45728, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6224, 11, 2390, NULL, 46016, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6225, 11, 2391, NULL, 46304, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6226, 11, 2392, NULL, 46592, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6227, 11, 2393, NULL, 46880, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6228, 11, 2394, NULL, 47168, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6229, 11, 2395, NULL, 47456, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6230, 11, 2396, NULL, 47744, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6231, 11, 2397, NULL, 48032, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6232, 11, 2398, NULL, 48320, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6233, 11, 2399, NULL, 48608, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6234, 11, 2400, NULL, 48896, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6235, 11, 2401, NULL, 49184, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6236, 11, 2402, NULL, 49472, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6237, 11, 2403, NULL, 49760, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6238, 11, 2404, NULL, 50048, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6239, 11, 2405, NULL, 50336, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6240, 11, 2406, NULL, 50624, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6241, 11, 2407, NULL, 50912, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6242, 11, 2408, NULL, 51200, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6243, 11, 2409, NULL, 51488, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6244, 11, 2410, NULL, 51776, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6245, 11, 2411, NULL, 52064, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6246, 11, 2412, NULL, 52352, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6247, 11, 2413, NULL, 52640, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6248, 11, 2414, NULL, 52928, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6249, 11, 2415, NULL, 53216, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6250, 11, 2416, NULL, 53504, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6251, 11, 2417, NULL, 53792, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6252, 11, 2418, NULL, 54080, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6253, 11, 2419, NULL, 54368, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6254, 11, 2420, NULL, 54656, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6255, 11, 2421, NULL, 54944, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6256, 11, 2422, NULL, 55232, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6257, 11, 2423, NULL, 55520, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6258, 11, 2424, NULL, 55808, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6259, 11, 2425, NULL, 56096, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6260, 11, 2426, NULL, 56384, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6261, 11, 2427, NULL, 56672, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6262, 11, 2428, NULL, 56960, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6263, 11, 1932, NULL, 9, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6264, 11, 1933, NULL, 293, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6265, 11, 1934, NULL, 577, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6266, 11, 1935, NULL, 861, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6267, 11, 1936, NULL, 1145, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6268, 11, 1937, NULL, 1429, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0);
INSERT INTO `lotespersonas` (`idLP`, `idLote`, `idPersona`, `NroCedula`, `id_reg`, `FechaCarga`, `FechaNotificacion`, `FechaRecepcionDDJJ`, `FechaIntimacion`, `AptoJurado`, `idTipoImpedimento`, `ObservacionesImpedimento`, `idEstadoDDJJ`, `idTipoResultado`, `ObservacionesEstado`, `CargaWeb`) VALUES
(6269, 11, 1938, NULL, 1713, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6270, 11, 1939, NULL, 1997, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6271, 11, 1940, NULL, 2281, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6272, 11, 1941, NULL, 2565, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6273, 11, 1942, NULL, 2849, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6274, 11, 1943, NULL, 3133, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6275, 11, 1944, NULL, 3417, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6276, 11, 1945, NULL, 3701, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6277, 11, 1946, NULL, 3985, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6278, 11, 1947, NULL, 4269, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6279, 11, 1948, NULL, 4553, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6280, 11, 1949, NULL, 4837, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6281, 11, 1950, NULL, 5121, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6282, 11, 1951, NULL, 5405, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6283, 11, 1952, NULL, 5689, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6284, 11, 1953, NULL, 5973, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6285, 11, 1954, NULL, 6257, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6286, 11, 1955, NULL, 6541, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6287, 11, 1956, NULL, 6825, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6288, 11, 1957, NULL, 7109, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6289, 11, 1958, NULL, 7393, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6290, 11, 1959, NULL, 7677, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6291, 11, 1960, NULL, 7961, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6292, 11, 1961, NULL, 8245, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6293, 11, 1962, NULL, 8529, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6294, 11, 1963, NULL, 8813, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6295, 11, 1964, NULL, 9097, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6296, 11, 1965, NULL, 9381, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6297, 11, 1966, NULL, 9665, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6298, 11, 1967, NULL, 9949, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6299, 11, 1968, NULL, 10233, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6300, 11, 1969, NULL, 10517, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6301, 11, 1970, NULL, 10801, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6302, 11, 1971, NULL, 11085, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6303, 11, 1972, NULL, 11369, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6304, 11, 1973, NULL, 11653, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6305, 11, 1974, NULL, 11937, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6306, 11, 1975, NULL, 12221, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6307, 11, 1976, NULL, 12505, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6308, 11, 1977, NULL, 12789, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6309, 11, 1978, NULL, 13073, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6310, 11, 1979, NULL, 13357, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6311, 11, 1980, NULL, 13641, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6312, 11, 1981, NULL, 13925, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6313, 11, 1982, NULL, 14209, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6314, 11, 1983, NULL, 14493, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6315, 11, 1984, NULL, 14777, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6316, 11, 1985, NULL, 15061, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6317, 11, 1986, NULL, 15345, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6318, 11, 1987, NULL, 15629, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6319, 11, 1988, NULL, 15913, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6320, 11, 1989, NULL, 16197, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6321, 11, 1990, NULL, 16481, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6322, 11, 1991, NULL, 16765, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6323, 11, 1992, NULL, 17049, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6324, 11, 1993, NULL, 17333, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6325, 11, 1994, NULL, 17617, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6326, 11, 1995, NULL, 17901, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6327, 11, 1996, NULL, 18185, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6328, 11, 1997, NULL, 18469, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6329, 11, 1998, NULL, 18753, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6330, 11, 1999, NULL, 19037, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6331, 11, 2000, NULL, 19321, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6332, 11, 2001, NULL, 19605, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6333, 11, 2002, NULL, 19889, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6334, 11, 2003, NULL, 20173, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6335, 11, 2004, NULL, 20457, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6336, 11, 2005, NULL, 20741, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6337, 11, 2006, NULL, 21025, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6338, 11, 2007, NULL, 21309, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6339, 11, 2008, NULL, 21593, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6340, 11, 2009, NULL, 21877, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6341, 11, 2010, NULL, 22161, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6342, 11, 2011, NULL, 22445, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6343, 11, 2012, NULL, 22729, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6344, 11, 2013, NULL, 23013, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6345, 11, 2014, NULL, 23297, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6346, 11, 2015, NULL, 23581, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6347, 11, 2016, NULL, 23865, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6348, 11, 2017, NULL, 24149, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6349, 11, 2018, NULL, 24433, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6350, 11, 2019, NULL, 24717, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6351, 11, 2020, NULL, 25001, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6352, 11, 2021, NULL, 25285, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6353, 11, 2022, NULL, 25569, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6354, 11, 2023, NULL, 25853, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6355, 11, 2024, NULL, 26137, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6356, 11, 2025, NULL, 26421, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6357, 11, 2026, NULL, 26705, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6358, 11, 2027, NULL, 26989, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6359, 11, 2028, NULL, 27273, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6360, 11, 2029, NULL, 27557, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6361, 11, 2030, NULL, 27841, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6362, 11, 2031, NULL, 28125, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6363, 11, 2032, NULL, 28409, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6364, 11, 2033, NULL, 28693, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6365, 11, 2034, NULL, 28977, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6366, 11, 2035, NULL, 29261, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6367, 11, 2036, NULL, 29545, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6368, 11, 2037, NULL, 29829, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6369, 11, 2038, NULL, 30113, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6370, 11, 2039, NULL, 30397, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6371, 11, 2040, NULL, 30681, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6372, 11, 2041, NULL, 30965, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6373, 11, 2042, NULL, 31249, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6374, 11, 2043, NULL, 31533, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6375, 11, 2044, NULL, 31817, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6376, 11, 2045, NULL, 32101, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6377, 11, 2046, NULL, 32385, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6378, 11, 2047, NULL, 32669, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6379, 11, 2048, NULL, 32953, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6380, 11, 2049, NULL, 33237, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6381, 11, 2050, NULL, 33521, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6382, 11, 2051, NULL, 33805, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6383, 11, 2052, NULL, 34089, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6384, 11, 2053, NULL, 34373, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6385, 11, 2054, NULL, 34657, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6386, 11, 2055, NULL, 34941, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6387, 11, 2056, NULL, 35225, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6388, 11, 2057, NULL, 35509, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6389, 11, 2058, NULL, 35793, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6390, 11, 2059, NULL, 36077, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6391, 11, 2060, NULL, 36361, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6392, 11, 2061, NULL, 36645, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6393, 11, 2062, NULL, 36929, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6394, 11, 2063, NULL, 37213, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6395, 11, 2064, NULL, 37497, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6396, 11, 2065, NULL, 37781, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6397, 11, 2066, NULL, 38065, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6398, 11, 2067, NULL, 38349, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6399, 11, 2068, NULL, 38633, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6400, 11, 2069, NULL, 38917, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6401, 11, 2070, NULL, 39201, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6402, 11, 2071, NULL, 39485, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6403, 11, 2072, NULL, 39769, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6404, 11, 2073, NULL, 40053, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6405, 11, 2074, NULL, 40337, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6406, 11, 2075, NULL, 40621, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6407, 11, 2076, NULL, 40905, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6408, 11, 2077, NULL, 41189, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6409, 11, 2078, NULL, 41473, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6410, 11, 2079, NULL, 41757, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6411, 11, 2080, NULL, 42041, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6412, 11, 2081, NULL, 42325, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6413, 11, 2082, NULL, 42609, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6414, 11, 2083, NULL, 42893, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6415, 11, 2084, NULL, 43177, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6416, 11, 2085, NULL, 43461, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6417, 11, 2086, NULL, 43745, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6418, 11, 2087, NULL, 44029, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6419, 11, 2088, NULL, 44313, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6420, 11, 2089, NULL, 44597, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6421, 11, 2090, NULL, 44881, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6422, 11, 2091, NULL, 45165, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6423, 11, 2092, NULL, 45449, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6424, 11, 2093, NULL, 45733, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6425, 11, 2094, NULL, 46017, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6426, 11, 2095, NULL, 46301, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6427, 11, 2096, NULL, 46585, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6428, 11, 2097, NULL, 46869, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6429, 11, 2098, NULL, 47153, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6430, 11, 2099, NULL, 47437, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6431, 11, 2100, NULL, 47721, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6432, 11, 2101, NULL, 48005, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6433, 11, 2102, NULL, 48289, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6434, 11, 2103, NULL, 48573, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6435, 11, 2104, NULL, 48857, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6436, 11, 2105, NULL, 49141, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6437, 11, 2106, NULL, 49425, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6438, 11, 2107, NULL, 49709, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6439, 11, 2108, NULL, 49993, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6440, 11, 2109, NULL, 50277, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6441, 11, 2110, NULL, 50561, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6442, 11, 2111, NULL, 50845, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6443, 11, 2112, NULL, 51129, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6444, 11, 2113, NULL, 51413, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6445, 11, 2114, NULL, 51697, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6446, 11, 2115, NULL, 51981, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6447, 11, 2116, NULL, 52265, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6448, 11, 2117, NULL, 52549, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6449, 11, 2118, NULL, 52833, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6450, 11, 2119, NULL, 53117, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6451, 11, 2120, NULL, 53401, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6452, 11, 2121, NULL, 53685, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6453, 11, 2122, NULL, 53969, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6454, 11, 2123, NULL, 54253, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6455, 11, 2124, NULL, 54537, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6456, 11, 2125, NULL, 54821, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6457, 11, 2126, NULL, 55105, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6458, 11, 2127, NULL, 55389, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6459, 11, 2128, NULL, 55673, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6460, 11, 2129, NULL, 55957, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6461, 11, 2130, NULL, 56241, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6462, 11, 2131, NULL, 56525, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6463, 11, 2132, NULL, 56809, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6464, 11, 2133, NULL, 57093, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6465, 11, 2134, NULL, 57377, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6466, 11, 2135, NULL, 57661, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6467, 11, 2136, NULL, 57945, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6468, 11, 2137, NULL, 58229, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6469, 11, 2138, NULL, 58513, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6470, 11, 2139, NULL, 58797, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6471, 11, 2140, NULL, 59081, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6472, 11, 2141, NULL, 59365, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6473, 11, 2142, NULL, 59649, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6474, 11, 2143, NULL, 59933, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6475, 11, 2144, NULL, 60217, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6476, 11, 2145, NULL, 60501, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6477, 11, 2146, NULL, 60785, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6478, 11, 2147, NULL, 61069, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6479, 11, 2148, NULL, 61353, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6480, 11, 2149, NULL, 61637, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6481, 11, 2150, NULL, 61921, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6482, 11, 2151, NULL, 62205, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6483, 11, 2152, NULL, 62489, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6484, 11, 2153, NULL, 62773, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6485, 11, 2154, NULL, 63057, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6486, 11, 2155, NULL, 63341, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6487, 11, 2156, NULL, 63625, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6488, 11, 2157, NULL, 63909, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6489, 11, 2158, NULL, 64193, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6490, 11, 2159, NULL, 64477, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6491, 11, 2160, NULL, 64761, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6492, 11, 2161, NULL, 65045, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6493, 11, 2162, NULL, 65329, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6494, 11, 2163, NULL, 65613, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6495, 11, 2164, NULL, 65897, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6496, 11, 2165, NULL, 66181, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6497, 11, 2166, NULL, 66465, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6498, 11, 2167, NULL, 66749, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6499, 11, 2168, NULL, 67033, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6500, 11, 2169, NULL, 67317, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6501, 11, 2170, NULL, 67601, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6502, 11, 2171, NULL, 67885, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6503, 11, 2172, NULL, 68169, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6504, 11, 2173, NULL, 68453, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6505, 11, 2174, NULL, 68737, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6506, 11, 2175, NULL, 69021, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6507, 11, 2176, NULL, 69305, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6508, 11, 2177, NULL, 69589, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6509, 11, 2178, NULL, 69873, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6510, 11, 2179, NULL, 70157, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6511, 11, 2180, NULL, 70441, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6512, 11, 2181, NULL, 70725, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6513, 11, 2182, NULL, 71009, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6514, 11, 2183, NULL, 71293, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6515, 11, 2184, NULL, 71577, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6516, 11, 2185, NULL, 71861, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6517, 11, 2186, NULL, 72145, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6518, 11, 2187, NULL, 72429, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6519, 11, 2188, NULL, 72713, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6520, 11, 2189, NULL, 72997, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6521, 11, 2190, NULL, 73281, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6522, 11, 2191, NULL, 73565, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6523, 11, 2192, NULL, 73849, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6524, 11, 2193, NULL, 74133, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6525, 11, 2194, NULL, 74417, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6526, 11, 2195, NULL, 74701, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6527, 11, 2196, NULL, 74985, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6528, 11, 2197, NULL, 75269, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6529, 11, 2198, NULL, 75553, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6530, 11, 2199, NULL, 75837, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6531, 11, 2200, NULL, 76121, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6532, 11, 2201, NULL, 76405, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6533, 11, 2202, NULL, 76689, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6534, 11, 2203, NULL, 76973, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6535, 11, 2204, NULL, 77257, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6536, 11, 2205, NULL, 77541, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6537, 11, 2206, NULL, 77825, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6538, 11, 2207, NULL, 78109, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6539, 11, 2208, NULL, 78393, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6540, 11, 2209, NULL, 78677, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6541, 11, 2210, NULL, 78961, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6542, 11, 2211, NULL, 79245, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6543, 11, 2212, NULL, 79529, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6544, 11, 2213, NULL, 79813, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6545, 11, 2214, NULL, 80097, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6546, 11, 2215, NULL, 80381, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6547, 11, 2216, NULL, 80665, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6548, 11, 2217, NULL, 80949, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6549, 11, 2218, NULL, 81233, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6550, 11, 2219, NULL, 81517, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6551, 11, 2220, NULL, 81801, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6552, 11, 2221, NULL, 82085, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6553, 11, 2222, NULL, 82369, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6554, 11, 2223, NULL, 82653, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6555, 11, 2224, NULL, 82937, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6556, 11, 2225, NULL, 83221, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6557, 11, 2226, NULL, 83505, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6558, 11, 2227, NULL, 83789, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6559, 11, 2228, NULL, 84073, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6560, 11, 2229, NULL, 84357, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6561, 11, 2230, NULL, 84641, '2015-11-24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0),
(6562, 12, 2429, 1600003, 57248, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6563, 12, 2430, 1600004, 57536, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6564, 12, 2431, 1600005, 57824, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6565, 12, 2432, 1600006, 58112, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6566, 12, 2433, 1600007, 58400, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6567, 12, 2434, 1600008, 58688, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6568, 12, 2435, 1600009, 58976, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6569, 12, 2436, 1600010, 59264, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6570, 12, 2437, 1600011, 59552, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6571, 12, 2438, 1600012, 59840, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6572, 12, 2439, 1600013, 60128, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6573, 12, 2440, 1600014, 60416, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6574, 12, 2441, 1600015, 60704, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6575, 12, 2442, 1600016, 60992, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6576, 12, 2443, 1600017, 61280, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6577, 12, 2444, 1600018, 61568, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6578, 12, 2445, 1600019, 61856, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6579, 12, 2446, 1600020, 62144, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6580, 12, 2447, 1600021, 62432, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6581, 12, 2448, 1600022, 62720, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6582, 12, 2449, 1600023, 63008, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6583, 12, 2450, 1600024, 63296, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6584, 12, 2451, 1600025, 63584, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6585, 12, 2452, 1600026, 63872, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6586, 12, 2453, 1600027, 64160, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6587, 12, 2454, 1600028, 64448, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6588, 12, 2455, 1600029, 64736, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6589, 12, 2456, 1600030, 65024, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6590, 12, 2457, 1600031, 65312, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6591, 12, 2458, 1600032, 65600, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6592, 12, 2459, 1600033, 65888, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6593, 12, 2460, 1600034, 66176, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6594, 12, 2461, 1600035, 66464, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6595, 12, 2462, 1600036, 66752, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6596, 12, 2463, 1600037, 67040, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6597, 12, 2464, 1600038, 67328, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6598, 12, 2465, 1600039, 67616, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6599, 12, 2466, 1600040, 67904, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6600, 12, 2467, 1600041, 68192, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6601, 12, 2468, 1600042, 68480, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6602, 12, 2469, 1600043, 68768, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6603, 12, 2470, 1600044, 69056, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6604, 12, 2471, 1600045, 69344, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6605, 12, 2472, 1600046, 69632, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6606, 12, 2473, 1600047, 69920, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6607, 12, 2474, 1600048, 70208, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6608, 12, 2475, 1600049, 70496, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6609, 12, 2476, 1600050, 70784, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6610, 12, 2477, 1600051, 71072, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6611, 12, 2478, 1600052, 71360, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6612, 12, 2479, 1600053, 71648, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6613, 12, 2480, 1600054, 71936, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6614, 12, 2481, 1600055, 72224, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6615, 12, 2482, 1600056, 72512, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6616, 12, 2483, 1600057, 72800, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6617, 12, 2484, 1600058, 73088, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6618, 12, 2485, 1600059, 73376, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6619, 12, 2486, 1600060, 73664, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6620, 12, 2487, 1600061, 73952, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6621, 12, 2488, 1600062, 74240, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6622, 12, 2489, 1600063, 74528, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6623, 12, 2490, 1600064, 74816, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6624, 12, 2491, 1600065, 75104, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6625, 12, 2492, 1600066, 75392, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6626, 12, 2493, 1600067, 75680, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6627, 12, 2494, 1600068, 75968, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6628, 12, 2495, 1600069, 76256, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6629, 12, 2496, 1600070, 76544, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6630, 12, 2497, 1600071, 76832, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6631, 12, 2498, 1600072, 77120, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6632, 12, 2499, 1600073, 77408, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6633, 12, 2500, 1600074, 77696, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6634, 12, 2501, 1600075, 77984, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6635, 12, 2502, 1600076, 78272, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6636, 12, 2503, 1600077, 78560, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6637, 12, 2504, 1600078, 78848, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6638, 12, 2505, 1600079, 79136, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6639, 12, 2506, 1600080, 79424, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6640, 12, 2507, 1600081, 79712, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6641, 12, 2508, 1600082, 80000, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6642, 12, 2509, 1600083, 80288, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6643, 12, 2510, 1600084, 80576, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6644, 12, 2511, 1600085, 80864, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6645, 12, 2512, 1600086, 81152, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6646, 12, 2513, 1600087, 81440, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6647, 12, 2514, 1600088, 81728, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6648, 12, 2515, 1600089, 82016, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6649, 12, 2516, 1600090, 82304, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6650, 12, 2517, 1600091, 82592, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6651, 12, 2518, 1600092, 82880, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6652, 12, 2519, 1600093, 83168, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6653, 12, 2520, 1600094, 83456, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6654, 12, 2521, 1600095, 83744, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6655, 12, 2522, 1600096, 84032, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6656, 12, 2523, 1600097, 84320, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6657, 12, 2524, 1600098, 84608, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6658, 12, 2525, 1600099, 84896, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6659, 12, 2526, 1600100, 85184, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6660, 12, 2527, 1600101, 85472, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6661, 12, 2528, 1600102, 85760, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6662, 12, 2529, 1600103, 86048, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6663, 12, 2530, 1600104, 86336, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6664, 12, 2531, 1600105, 86624, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6665, 12, 2532, 1600106, 86912, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6666, 12, 2533, 1600107, 87200, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6667, 12, 2534, 1600108, 87488, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6668, 12, 2535, 1600109, 87776, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6669, 12, 2536, 1600110, 88064, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6670, 12, 2537, 1600111, 88352, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6671, 12, 2538, 1600112, 88640, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6672, 12, 2539, 1600113, 88928, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6673, 12, 2540, 1600114, 89216, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6674, 12, 2541, 1600115, 89504, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6675, 12, 2542, 1600116, 89792, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6676, 12, 2543, 1600117, 90080, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6677, 12, 2544, 1600118, 90368, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6678, 12, 2545, 1600119, 90656, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6679, 12, 2546, 1600120, 90944, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6680, 12, 2547, 1600121, 91232, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6681, 12, 2548, 1600122, 91520, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6682, 12, 2549, 1600123, 91808, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6683, 12, 2550, 1600124, 92096, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6684, 12, 2551, 1600125, 92384, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6685, 12, 2552, 1600126, 92672, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6686, 12, 2553, 1600127, 92960, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6687, 12, 2554, 1600128, 93248, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6688, 12, 2555, 1600129, 93536, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6689, 12, 2556, 1600130, 93824, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6690, 12, 2557, 1600131, 94112, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6691, 12, 2558, 1600132, 94400, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6692, 12, 2559, 1600133, 94688, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6693, 12, 2560, 1600134, 94976, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6694, 12, 2561, 1600135, 95264, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6695, 12, 2562, 1600136, 95552, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6696, 12, 2563, 1600137, 95840, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6697, 12, 2564, 1600138, 96128, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6698, 12, 2565, 1600139, 96416, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6699, 12, 2566, 1600140, 96704, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6700, 12, 2567, 1600141, 96992, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6701, 12, 2568, 1600142, 97280, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6702, 12, 2569, 1600143, 97568, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6703, 12, 2570, 1600144, 97856, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6704, 12, 2571, 1600145, 98144, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6705, 12, 2572, 1600146, 98432, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6706, 12, 2573, 1600147, 98720, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6707, 12, 2574, 1600148, 99008, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6708, 12, 2575, 1600149, 99296, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6709, 12, 2576, 1600150, 99584, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6710, 12, 2577, 1600151, 99872, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6711, 12, 2578, 1600152, 100160, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6712, 12, 2579, 1600153, 100448, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6713, 12, 2580, 1600154, 100736, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6714, 12, 2581, 1600155, 101024, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6715, 12, 2582, 1600156, 101312, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6716, 12, 2583, 1600157, 101600, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6717, 12, 2584, 1600158, 101888, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6718, 12, 2585, 1600159, 102176, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6719, 12, 2586, 1600160, 102464, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6720, 12, 2587, 1600161, 102752, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6721, 12, 2588, 1600162, 103040, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6722, 12, 2589, 1600163, 103328, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6723, 12, 2590, 1600164, 103616, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6724, 12, 2591, 1600165, 103904, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6725, 12, 2592, 1600166, 104192, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6726, 12, 2593, 1600167, 104480, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6727, 12, 2594, 1600168, 104768, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6728, 12, 2595, 1600169, 105056, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6729, 12, 2596, 1600170, 105344, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6730, 12, 2597, 1600171, 105632, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6731, 12, 2598, 1600172, 105920, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6732, 12, 2599, 1600173, 106208, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6733, 12, 2600, 1600174, 106496, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6734, 12, 2601, 1600175, 106784, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6735, 12, 2602, 1600176, 107072, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6736, 12, 2603, 1600177, 107360, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6737, 12, 2604, 1600178, 107648, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6738, 12, 2605, 1600179, 107936, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6739, 12, 2606, 1600180, 108224, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6740, 12, 2607, 1600181, 108512, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6741, 12, 2608, 1600182, 108800, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6742, 12, 2609, 1600183, 109088, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6743, 12, 2610, 1600184, 109376, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6744, 12, 2611, 1600185, 109664, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6745, 12, 2612, 1600186, 109952, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6746, 12, 2613, 1600187, 110240, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6747, 12, 2614, 1600188, 110528, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6748, 12, 2615, 1600189, 110816, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6749, 12, 2616, 1600190, 111104, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6750, 12, 2617, 1600191, 111392, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6751, 12, 2618, 1600192, 111680, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6752, 12, 2619, 1600193, 111968, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6753, 12, 2620, 1600194, 112256, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6754, 12, 2621, 1600195, 112544, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6755, 12, 2622, 1600196, 112832, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6756, 12, 2623, 1600197, 113120, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6757, 12, 2624, 1600198, 113408, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6758, 12, 2625, 1600199, 113696, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6759, 12, 2626, 1600200, 113984, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6760, 12, 2627, 1600201, 114272, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6761, 12, 2628, 1600202, 114560, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6762, 12, 2629, 1600203, 114848, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6763, 12, 2630, 1600204, 115136, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6764, 12, 2631, 1600205, 115424, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6765, 12, 2632, 1600206, 115712, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6766, 12, 2633, 1600207, 116000, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6767, 12, 2634, 1600208, 116288, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6768, 12, 2635, 1600209, 116576, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6769, 12, 2636, 1600210, 116864, '2015-12-16', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0),
(6770, 12, 2637, 1600001, 41, '2015-12-16', '2016-02-03 00:00:00', NULL, NULL, b'0', 2, '', 6, NULL, 'dgdgdfg', 0),
(6771, 12, 2638, 1600002, 329, '2015-12-16', '2016-02-03 00:00:00', '2016-02-09 00:00:00', NULL, b'1', NULL, '', 3, NULL, 'dfgdfgd', 0),
(6772, 13, 2231, 1700002, 224, '2017-02-20', NULL, NULL, NULL, b'1', NULL, '', 3, NULL, '', 0),
(6773, 13, 2232, 1700004, 512, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0);
INSERT INTO `lotespersonas` (`idLP`, `idLote`, `idPersona`, `NroCedula`, `id_reg`, `FechaCarga`, `FechaNotificacion`, `FechaRecepcionDDJJ`, `FechaIntimacion`, `AptoJurado`, `idTipoImpedimento`, `ObservacionesImpedimento`, `idEstadoDDJJ`, `idTipoResultado`, `ObservacionesEstado`, `CargaWeb`) VALUES
(6774, 13, 2233, 1700006, 800, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6775, 13, 2234, 1700008, 1088, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6776, 13, 2235, 1700010, 1376, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6777, 13, 2236, 1700012, 1664, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6778, 13, 2237, 1700014, 1952, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6779, 13, 2238, 1700016, 2240, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6780, 13, 2239, 1700018, 2528, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6781, 13, 2240, 1700020, 2816, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6782, 13, 2241, 1700022, 3104, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6783, 13, 2242, 1700024, 3392, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6784, 13, 2243, 1700026, 3680, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6785, 13, 2244, 1700028, 3968, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6786, 13, 2245, 1700030, 4256, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6787, 13, 2246, 1700032, 4544, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6788, 13, 2247, 1700034, 4832, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6789, 13, 2248, 1700036, 5120, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6790, 13, 2249, 1700038, 5408, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6791, 13, 2250, 1700040, 5696, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6792, 13, 2251, 1700042, 5984, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6793, 13, 2252, 1700044, 6272, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6794, 13, 2253, 1700046, 6560, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6795, 13, 2254, 1700048, 6848, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6796, 13, 2255, 1700050, 7136, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6797, 13, 2256, 1700052, 7424, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6798, 13, 2257, 1700054, 7712, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6799, 13, 2258, 1700056, 8000, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6800, 13, 2259, 1700058, 8288, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6801, 13, 2260, 1700059, 8576, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6802, 13, 2261, 1700061, 8864, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6803, 13, 2262, 1700063, 9152, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6804, 13, 2263, 1700065, 9440, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6805, 13, 2264, 1700067, 9728, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6806, 13, 2265, 1700069, 10016, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6807, 13, 2266, 1700071, 10304, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6808, 13, 2267, 1700073, 10592, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6809, 13, 2268, 1700075, 10880, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6810, 13, 2269, 1700077, 11168, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6811, 13, 2270, 1700079, 11456, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6812, 13, 2271, 1700081, 11744, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6813, 13, 2272, 1700083, 12032, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6814, 13, 2273, 1700085, 12320, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6815, 13, 2274, 1700087, 12608, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6816, 13, 2275, 1700089, 12896, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6817, 13, 2276, 1700091, 13184, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6818, 13, 2277, 1700093, 13472, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6819, 13, 2278, 1700095, 13760, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6820, 13, 2279, 1700097, 14048, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6821, 13, 2280, 1700099, 14336, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6822, 13, 2281, 1700101, 14624, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6823, 13, 2282, 1700103, 14912, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6824, 13, 2283, 1700105, 15200, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6825, 13, 2284, 1700107, 15488, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6826, 13, 2285, 1700109, 15776, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6827, 13, 2286, 1700111, 16064, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6828, 13, 2287, 1700113, 16352, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6829, 13, 2288, 1700115, 16640, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6830, 13, 2289, 1700117, 16928, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6831, 13, 2290, 1700119, 17216, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6832, 13, 2291, 1700121, 17504, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6833, 13, 2292, 1700123, 17792, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6834, 13, 2293, 1700125, 18080, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6835, 13, 2294, 1700127, 18368, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6836, 13, 2295, 1700129, 18656, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6837, 13, 2296, 1700131, 18944, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6838, 13, 2297, 1700133, 19232, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6839, 13, 2298, 1700135, 19520, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6840, 13, 2299, 1700137, 19808, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6841, 13, 2300, 1700139, 20096, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6842, 13, 2301, 1700141, 20384, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6843, 13, 2302, 1700143, 20672, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6844, 13, 2303, 1700145, 20960, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6845, 13, 2304, 1700147, 21248, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6846, 13, 2305, 1700149, 21536, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6847, 13, 2306, 1700151, 21824, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6848, 13, 2307, 1700153, 22112, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6849, 13, 2308, 1700155, 22400, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6850, 13, 2309, 1700157, 22688, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6851, 13, 2310, 1700159, 22976, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6852, 13, 2311, 1700161, 23264, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6853, 13, 2312, 1700163, 23552, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6854, 13, 2313, 1700165, 23840, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6855, 13, 2314, 1700167, 24128, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6856, 13, 2315, 1700169, 24416, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6857, 13, 2316, 1700171, 24704, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6858, 13, 2317, 1700173, 24992, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6859, 13, 2318, 1700175, 25280, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6860, 13, 2319, 1700177, 25568, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6861, 13, 2320, 1700179, 25856, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6862, 13, 2321, 1700181, 26144, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6863, 13, 2322, 1700183, 26432, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6864, 13, 2323, 1700185, 26720, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6865, 13, 2324, 1700187, 27008, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6866, 13, 2325, 1700189, 27296, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6867, 13, 2326, 1700191, 27584, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6868, 13, 2327, 1700193, 27872, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6869, 13, 2328, 1700195, 28160, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6870, 13, 2329, 1700197, 28448, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6871, 13, 2330, 1700199, 28736, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6872, 13, 2331, 1700201, 29024, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6873, 13, 2332, 1700203, 29312, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6874, 13, 2333, 1700205, 29600, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6875, 13, 2334, 1700207, 29888, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6876, 13, 2335, 1700209, 30176, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6877, 13, 2336, 1700211, 30464, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6878, 13, 2337, 1700213, 30752, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6879, 13, 2338, 1700215, 31040, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6880, 13, 2339, 1700218, 31328, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6881, 13, 2340, 1700220, 31616, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6882, 13, 2341, 1700222, 31904, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6883, 13, 2342, 1700224, 32192, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6884, 13, 2343, 1700226, 32480, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6885, 13, 2344, 1700228, 32768, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6886, 13, 2345, 1700230, 33056, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6887, 13, 2346, 1700232, 33344, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6888, 13, 2347, 1700234, 33632, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6889, 13, 2348, 1700236, 33920, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6890, 13, 2349, 1700238, 34208, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6891, 13, 2350, 1700240, 34496, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6892, 13, 2351, 1700242, 34784, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6893, 13, 2352, 1700244, 35072, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6894, 13, 2353, 1700246, 35360, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6895, 13, 2354, 1700249, 35648, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6896, 13, 2355, 1700251, 35936, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6897, 13, 2356, 1700253, 36224, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6898, 13, 2357, 1700255, 36512, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6899, 13, 2358, 1700257, 36800, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6900, 13, 2359, 1700259, 37088, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6901, 13, 2360, 1700261, 37376, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6902, 13, 2361, 1700263, 37664, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6903, 13, 2362, 1700265, 37952, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6904, 13, 2363, 1700267, 38240, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6905, 13, 2364, 1700269, 38528, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6906, 13, 2365, 1700271, 38816, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6907, 13, 2366, 1700273, 39104, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6908, 13, 2367, 1700275, 39392, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6909, 13, 2368, 1700277, 39680, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6910, 13, 2369, 1700279, 39968, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6911, 13, 2370, 1700281, 40256, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6912, 13, 2371, 1700283, 40544, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6913, 13, 2372, 1700285, 40832, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6914, 13, 2373, 1700287, 41120, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6915, 13, 2374, 1700289, 41408, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6916, 13, 2375, 1700291, 41696, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6917, 13, 2376, 1700293, 41984, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6918, 13, 2377, 1700295, 42272, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6919, 13, 2378, 1700297, 42560, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6920, 13, 2379, 1700299, 42848, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6921, 13, 2380, 1700301, 43136, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6922, 13, 2381, 1700303, 43424, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6923, 13, 2382, 1700305, 43712, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6924, 13, 2383, 1700307, 44000, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6925, 13, 2384, 1700309, 44288, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6926, 13, 2385, 1700311, 44576, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6927, 13, 2386, 1700313, 44864, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6928, 13, 2387, 1700316, 45152, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6929, 13, 2388, 1700317, 45440, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6930, 13, 2389, 1700319, 45728, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6931, 13, 2390, 1700321, 46016, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6932, 13, 2391, 1700323, 46304, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6933, 13, 2392, 1700325, 46592, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6934, 13, 2393, 1700327, 46880, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6935, 13, 2394, 1700329, 47168, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6936, 13, 2395, 1700331, 47456, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6937, 13, 2396, 1700333, 47744, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6938, 13, 2397, 1700335, 48032, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6939, 13, 2398, 1700337, 48320, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6940, 13, 2399, 1700338, 48608, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6941, 13, 2400, 1700341, 48896, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6942, 13, 2401, 1700342, 49184, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6943, 13, 2402, 1700345, 49472, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6944, 13, 2403, 1700346, 49760, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6945, 13, 2404, 1700348, 50048, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6946, 13, 2405, 1700350, 50336, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6947, 13, 2406, 1700352, 50624, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6948, 13, 2407, 1700354, 50912, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6949, 13, 2408, 1700356, 51200, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6950, 13, 2409, 1700358, 51488, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6951, 13, 2410, 1700360, 51776, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6952, 13, 2411, 1700363, 52064, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6953, 13, 2412, 1700364, 52352, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6954, 13, 2413, 1700367, 52640, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6955, 13, 2414, 1700368, 52928, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6956, 13, 2415, 1700370, 53216, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6957, 13, 2416, 1700372, 53504, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6958, 13, 2417, 1700374, 53792, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6959, 13, 2418, 1700376, 54080, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6960, 13, 2419, 1700378, 54368, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6961, 13, 2420, 1700380, 54656, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6962, 13, 2421, 1700383, 54944, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6963, 13, 2422, 1700385, 55232, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6964, 13, 2423, 1700386, 55520, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6965, 13, 2424, 1700388, 55808, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6966, 13, 2425, 1700390, 56096, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6967, 13, 2426, 1700392, 56384, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6968, 13, 2427, 1700394, 56672, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6969, 13, 2428, 1700396, 56960, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6970, 13, 1932, 1700001, 9, '2017-02-20', NULL, NULL, NULL, b'1', NULL, '', 3, NULL, '', 0),
(6971, 13, 1933, 1700003, 293, '2017-02-20', NULL, NULL, NULL, b'1', NULL, '', 3, NULL, '', 0),
(6972, 13, 1934, 1700005, 577, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6973, 13, 1935, 1700007, 861, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6974, 13, 1936, 1700009, 1145, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6975, 13, 1937, 1700011, 1429, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6976, 13, 1938, 1700013, 1713, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6977, 13, 1939, 1700015, 1997, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6978, 13, 1940, 1700017, 2281, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6979, 13, 1941, 1700019, 2565, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6980, 13, 1942, 1700021, 2849, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6981, 13, 1943, 1700023, 3133, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6982, 13, 1944, 1700025, 3417, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6983, 13, 1945, 1700027, 3701, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6984, 13, 1946, 1700029, 3985, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6985, 13, 1947, 1700031, 4269, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6986, 13, 1948, 1700033, 4553, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6987, 13, 1949, 1700035, 4837, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6988, 13, 1950, 1700037, 5121, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6989, 13, 1951, 1700039, 5405, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6990, 13, 1952, 1700041, 5689, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6991, 13, 1953, 1700043, 5973, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6992, 13, 1954, 1700045, 6257, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6993, 13, 1955, 1700047, 6541, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6994, 13, 1956, 1700049, 6825, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6995, 13, 1957, 1700051, 7109, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6996, 13, 1958, 1700053, 7393, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6997, 13, 1959, 1700055, 7677, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6998, 13, 1960, 1700057, 7961, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(6999, 13, 1961, 1700060, 8245, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7000, 13, 1962, 1700062, 8529, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7001, 13, 1963, 1700064, 8813, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7002, 13, 1964, 1700066, 9097, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7003, 13, 1965, 1700068, 9381, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7004, 13, 1966, 1700070, 9665, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7005, 13, 1967, 1700072, 9949, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7006, 13, 1968, 1700074, 10233, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7007, 13, 1969, 1700076, 10517, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7008, 13, 1970, 1700078, 10801, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7009, 13, 1971, 1700080, 11085, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7010, 13, 1972, 1700082, 11369, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7011, 13, 1973, 1700084, 11653, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7012, 13, 1974, 1700086, 11937, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7013, 13, 1975, 1700088, 12221, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7014, 13, 1976, 1700090, 12505, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7015, 13, 1977, 1700092, 12789, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7016, 13, 1978, 1700094, 13073, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7017, 13, 1979, 1700096, 13357, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7018, 13, 1980, 1700098, 13641, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7019, 13, 1981, 1700100, 13925, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7020, 13, 1982, 1700102, 14209, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7021, 13, 1983, 1700104, 14493, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7022, 13, 1984, 1700106, 14777, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7023, 13, 1985, 1700108, 15061, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7024, 13, 1986, 1700110, 15345, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7025, 13, 1987, 1700112, 15629, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7026, 13, 1988, 1700114, 15913, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7027, 13, 1989, 1700116, 16197, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7028, 13, 1990, 1700118, 16481, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7029, 13, 1991, 1700120, 16765, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7030, 13, 1992, 1700122, 17049, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7031, 13, 1993, 1700124, 17333, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7032, 13, 1994, 1700126, 17617, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7033, 13, 1995, 1700128, 17901, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7034, 13, 1996, 1700130, 18185, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7035, 13, 1997, 1700132, 18469, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7036, 13, 1998, 1700134, 18753, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7037, 13, 1999, 1700136, 19037, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7038, 13, 2000, 1700138, 19321, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7039, 13, 2001, 1700140, 19605, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7040, 13, 2002, 1700142, 19889, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7041, 13, 2003, 1700144, 20173, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7042, 13, 2004, 1700146, 20457, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7043, 13, 2005, 1700148, 20741, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7044, 13, 2006, 1700150, 21025, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7045, 13, 2007, 1700152, 21309, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7046, 13, 2008, 1700154, 21593, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7047, 13, 2009, 1700156, 21877, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7048, 13, 2010, 1700158, 22161, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7049, 13, 2011, 1700160, 22445, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7050, 13, 2012, 1700162, 22729, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7051, 13, 2013, 1700164, 23013, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7052, 13, 2014, 1700166, 23297, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7053, 13, 2015, 1700168, 23581, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7054, 13, 2016, 1700170, 23865, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7055, 13, 2017, 1700172, 24149, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7056, 13, 2018, 1700174, 24433, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7057, 13, 2019, 1700176, 24717, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7058, 13, 2020, 1700178, 25001, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7059, 13, 2021, 1700180, 25285, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7060, 13, 2022, 1700182, 25569, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7061, 13, 2023, 1700184, 25853, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7062, 13, 2024, 1700186, 26137, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7063, 13, 2025, 1700188, 26421, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7064, 13, 2026, 1700190, 26705, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7065, 13, 2027, 1700192, 26989, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7066, 13, 2028, 1700194, 27273, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7067, 13, 2029, 1700196, 27557, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7068, 13, 2030, 1700198, 27841, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7069, 13, 2031, 1700200, 28125, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7070, 13, 2032, 1700202, 28409, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7071, 13, 2033, 1700204, 28693, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7072, 13, 2034, 1700206, 28977, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7073, 13, 2035, 1700208, 29261, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7074, 13, 2036, 1700210, 29545, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7075, 13, 2037, 1700212, 29829, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7076, 13, 2038, 1700214, 30113, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7077, 13, 2039, 1700216, 30397, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7078, 13, 2040, 1700217, 30681, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7079, 13, 2041, 1700219, 30965, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7080, 13, 2042, 1700221, 31249, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7081, 13, 2043, 1700223, 31533, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7082, 13, 2044, 1700225, 31817, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7083, 13, 2045, 1700227, 32101, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7084, 13, 2046, 1700229, 32385, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7085, 13, 2047, 1700231, 32669, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7086, 13, 2048, 1700233, 32953, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7087, 13, 2049, 1700235, 33237, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7088, 13, 2050, 1700237, 33521, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7089, 13, 2051, 1700239, 33805, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7090, 13, 2052, 1700241, 34089, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7091, 13, 2053, 1700243, 34373, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7092, 13, 2054, 1700245, 34657, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7093, 13, 2055, 1700247, 34941, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7094, 13, 2056, 1700248, 35225, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7095, 13, 2057, 1700250, 35509, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7096, 13, 2058, 1700252, 35793, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7097, 13, 2059, 1700254, 36077, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7098, 13, 2060, 1700256, 36361, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7099, 13, 2061, 1700258, 36645, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7100, 13, 2062, 1700260, 36929, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7101, 13, 2063, 1700262, 37213, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7102, 13, 2064, 1700264, 37497, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7103, 13, 2065, 1700266, 37781, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7104, 13, 2066, 1700268, 38065, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7105, 13, 2067, 1700270, 38349, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7106, 13, 2068, 1700272, 38633, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7107, 13, 2069, 1700274, 38917, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7108, 13, 2070, 1700276, 39201, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7109, 13, 2071, 1700278, 39485, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7110, 13, 2072, 1700280, 39769, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7111, 13, 2073, 1700282, 40053, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7112, 13, 2074, 1700284, 40337, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7113, 13, 2075, 1700286, 40621, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7114, 13, 2076, 1700288, 40905, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7115, 13, 2077, 1700290, 41189, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7116, 13, 2078, 1700292, 41473, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7117, 13, 2079, 1700294, 41757, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7118, 13, 2080, 1700296, 42041, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7119, 13, 2081, 1700298, 42325, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7120, 13, 2082, 1700300, 42609, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7121, 13, 2083, 1700302, 42893, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7122, 13, 2084, 1700304, 43177, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7123, 13, 2085, 1700306, 43461, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7124, 13, 2086, 1700308, 43745, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7125, 13, 2087, 1700310, 44029, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7126, 13, 2088, 1700312, 44313, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7127, 13, 2089, 1700314, 44597, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7128, 13, 2090, 1700315, 44881, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7129, 13, 2091, 1700318, 45165, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7130, 13, 2092, 1700320, 45449, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7131, 13, 2093, 1700322, 45733, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7132, 13, 2094, 1700324, 46017, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7133, 13, 2095, 1700326, 46301, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7134, 13, 2096, 1700328, 46585, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7135, 13, 2097, 1700330, 46869, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7136, 13, 2098, 1700332, 47153, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7137, 13, 2099, 1700334, 47437, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7138, 13, 2100, 1700336, 47721, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7139, 13, 2101, 1700339, 48005, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7140, 13, 2102, 1700340, 48289, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7141, 13, 2103, 1700343, 48573, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7142, 13, 2104, 1700344, 48857, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7143, 13, 2105, 1700347, 49141, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7144, 13, 2106, 1700349, 49425, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7145, 13, 2107, 1700351, 49709, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7146, 13, 2108, 1700353, 49993, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7147, 13, 2109, 1700355, 50277, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7148, 13, 2110, 1700357, 50561, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7149, 13, 2111, 1700359, 50845, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7150, 13, 2112, 1700361, 51129, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7151, 13, 2113, 1700362, 51413, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7152, 13, 2114, 1700365, 51697, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7153, 13, 2115, 1700366, 51981, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7154, 13, 2116, 1700369, 52265, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7155, 13, 2117, 1700371, 52549, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7156, 13, 2118, 1700373, 52833, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7157, 13, 2119, 1700375, 53117, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7158, 13, 2120, 1700377, 53401, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7159, 13, 2121, 1700379, 53685, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7160, 13, 2122, 1700381, 53969, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7161, 13, 2123, 1700382, 54253, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7162, 13, 2124, 1700384, 54537, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7163, 13, 2125, 1700387, 54821, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7164, 13, 2126, 1700389, 55105, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7165, 13, 2127, 1700391, 55389, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7166, 13, 2128, 1700393, 55673, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7167, 13, 2129, 1700395, 55957, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7168, 13, 2130, 1700397, 56241, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7169, 13, 2131, 1700398, 56525, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7170, 13, 2132, 1700399, 56809, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7171, 13, 2133, 1700400, 57093, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7172, 13, 2134, 1700401, 57377, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7173, 13, 2135, 1700402, 57661, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7174, 13, 2136, 1700403, 57945, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7175, 13, 2137, 1700404, 58229, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7176, 13, 2138, 1700405, 58513, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7177, 13, 2139, 1700406, 58797, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7178, 13, 2140, 1700407, 59081, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7179, 13, 2141, 1700408, 59365, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7180, 13, 2142, 1700409, 59649, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7181, 13, 2143, 1700410, 59933, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7182, 13, 2144, 1700411, 60217, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7183, 13, 2145, 1700412, 60501, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7184, 13, 2146, 1700413, 60785, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7185, 13, 2147, 1700414, 61069, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7186, 13, 2148, 1700415, 61353, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7187, 13, 2149, 1700416, 61637, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7188, 13, 2150, 1700417, 61921, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7189, 13, 2151, 1700418, 62205, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7190, 13, 2152, 1700419, 62489, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7191, 13, 2153, 1700420, 62773, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7192, 13, 2154, 1700421, 63057, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7193, 13, 2155, 1700422, 63341, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7194, 13, 2156, 1700423, 63625, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7195, 13, 2157, 1700424, 63909, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7196, 13, 2158, 1700425, 64193, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7197, 13, 2159, 1700426, 64477, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7198, 13, 2160, 1700427, 64761, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7199, 13, 2161, 1700428, 65045, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7200, 13, 2162, 1700429, 65329, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7201, 13, 2163, 1700430, 65613, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7202, 13, 2164, 1700431, 65897, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7203, 13, 2165, 1700432, 66181, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7204, 13, 2166, 1700433, 66465, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7205, 13, 2167, 1700434, 66749, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7206, 13, 2168, 1700435, 67033, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7207, 13, 2169, 1700436, 67317, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7208, 13, 2170, 1700437, 67601, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7209, 13, 2171, 1700438, 67885, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7210, 13, 2172, 1700439, 68169, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7211, 13, 2173, 1700440, 68453, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7212, 13, 2174, 1700441, 68737, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7213, 13, 2175, 1700442, 69021, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7214, 13, 2176, 1700443, 69305, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7215, 13, 2177, 1700444, 69589, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7216, 13, 2178, 1700445, 69873, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7217, 13, 2179, 1700446, 70157, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7218, 13, 2180, 1700447, 70441, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7219, 13, 2181, 1700448, 70725, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7220, 13, 2182, 1700449, 71009, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7221, 13, 2183, 1700450, 71293, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7222, 13, 2184, 1700451, 71577, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7223, 13, 2185, 1700452, 71861, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7224, 13, 2186, 1700453, 72145, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7225, 13, 2187, 1700454, 72429, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7226, 13, 2188, 1700455, 72713, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7227, 13, 2189, 1700456, 72997, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7228, 13, 2190, 1700457, 73281, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7229, 13, 2191, 1700458, 73565, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7230, 13, 2192, 1700459, 73849, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7231, 13, 2193, 1700460, 74133, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7232, 13, 2194, 1700461, 74417, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7233, 13, 2195, 1700462, 74701, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7234, 13, 2196, 1700463, 74985, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7235, 13, 2197, 1700464, 75269, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7236, 13, 2198, 1700465, 75553, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7237, 13, 2199, 1700466, 75837, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7238, 13, 2200, 1700467, 76121, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7239, 13, 2201, 1700468, 76405, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7240, 13, 2202, 1700469, 76689, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7241, 13, 2203, 1700470, 76973, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7242, 13, 2204, 1700471, 77257, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7243, 13, 2205, 1700472, 77541, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7244, 13, 2206, 1700473, 77825, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7245, 13, 2207, 1700474, 78109, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7246, 13, 2208, 1700475, 78393, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7247, 13, 2209, 1700476, 78677, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7248, 13, 2210, 1700477, 78961, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7249, 13, 2211, 1700478, 79245, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7250, 13, 2212, 1700479, 79529, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7251, 13, 2213, 1700480, 79813, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7252, 13, 2214, 1700481, 80097, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7253, 13, 2215, 1700482, 80381, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7254, 13, 2216, 1700483, 80665, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7255, 13, 2217, 1700484, 80949, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7256, 13, 2218, 1700485, 81233, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7257, 13, 2219, 1700486, 81517, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7258, 13, 2220, 1700487, 81801, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7259, 13, 2221, 1700488, 82085, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7260, 13, 2222, 1700489, 82369, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7261, 13, 2223, 1700490, 82653, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7262, 13, 2224, 1700491, 82937, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7263, 13, 2225, 1700492, 83221, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7264, 13, 2226, 1700493, 83505, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7265, 13, 2227, 1700494, 83789, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7266, 13, 2228, 1700495, 84073, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7267, 13, 2229, 1700496, 84357, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0),
(7268, 13, 2230, 1700497, 84641, '2017-02-20', NULL, NULL, NULL, b'1', NULL, NULL, 3, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes_extensiones`
--

CREATE TABLE `lotes_extensiones` (
  `idExtension` int(11) NOT NULL,
  `idLote` int(11) DEFAULT NULL,
  `FechaDesdeOriginal` datetime DEFAULT NULL,
  `FechaHastaOriginal` datetime DEFAULT NULL,
  `FechaDesdeNueva` datetime DEFAULT NULL,
  `FechaHastaNueva` datetime DEFAULT NULL,
  `FHAlta` datetime DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `idNotificacion` int(11) NOT NULL,
  `idLote` int(11) NOT NULL,
  `PlantillaNotificacion` varchar(200) DEFAULT NULL,
  `ArchivoNotificaciones` varchar(200) DEFAULT NULL,
  `PlantillaSobres` varchar(200) DEFAULT NULL,
  `ArchivoSobres` varchar(200) DEFAULT NULL,
  `CartaSaludo` text,
  `IniciarCedulas` int(11) DEFAULT NULL,
  `PlantillaIntimacion` varchar(200) DEFAULT NULL,
  `ArchivoIntimacion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`idNotificacion`, `idLote`, `PlantillaNotificacion`, `ArchivoNotificaciones`, `PlantillaSobres`, `ArchivoSobres`, `CartaSaludo`, `IniciarCedulas`, `PlantillaIntimacion`, `ArchivoIntimacion`) VALUES
(9, 10, '25Nov2015123138_plantillaNotificacion.rtf', '10_notificaciones.rtf.zip', '25Nov2015130825_plantillaSobres.rtf', '10_sobres.rtf.zip', '<p>Hola bbbbbbbbbbbbbb</p>\r\n', 1500001, '25Nov2015123138_plantillaIntimacion.rtf', '10_intimaciones.rtf.zip'),
(12, 12, '22Feb2016111240_plantillaNotificacion.rtf', '12_notificaciones.rtf.zip', '22Feb2016111124_plantillaSobres.rtf', NULL, '<p>fdsf sdfsdf</p>\r\n', 1600001, NULL, NULL),
(13, 13, '20Feb2017160914_plantillaNotificacion.rtf', '13_notificaciones.rtf.zip', '20Feb2017160904_5_plantillaSobres.rtf', '13_sobres.rtf.zip', '<p>hola</p>\r\n', 1700001, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `idPerfil` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`idPerfil`, `Descripcion`) VALUES
(1, 'administrador'),
(2, 'operador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idPersona` int(11) NOT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `idTipoDocumento` int(11) DEFAULT NULL,
  `DNI` int(11) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `CUIL` varchar(50) DEFAULT NULL,
  `FechaNacimiento` datetime DEFAULT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `LugarNacimiento` varchar(100) DEFAULT NULL,
  `Domicilio` varchar(200) DEFAULT NULL,
  `idLocalidad` int(11) DEFAULT NULL,
  `idCentroDistribucion` int(11) DEFAULT NULL,
  `Circuito` varchar(10) DEFAULT NULL,
  `CaracteristicaFijo` int(11) DEFAULT NULL,
  `TelefonoFijo` varchar(50) DEFAULT NULL,
  `CaracteristicaCelu` int(11) DEFAULT NULL,
  `TelefonoCelular` varchar(50) DEFAULT NULL,
  `CorreoElectronico` varchar(100) DEFAULT NULL,
  `Profesion` varchar(50) DEFAULT NULL,
  `Ocupacion` varchar(100) DEFAULT NULL,
  `Observaciones` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`idPersona`, `Apellido`, `Nombre`, `idTipoDocumento`, `DNI`, `Sexo`, `CUIL`, `FechaNacimiento`, `Nacionalidad`, `LugarNacimiento`, `Domicilio`, `idLocalidad`, `idCentroDistribucion`, `Circuito`, `CaracteristicaFijo`, `TelefonoFijo`, `CaracteristicaCelu`, `TelefonoCelular`, `CorreoElectronico`, `Profesion`, `Ocupacion`, `Observaciones`) VALUES
(1932, 'ABAD', 'JOSE ENRIQUE', 1, 31350661, 'M', '', '2015-12-08 00:00:00', '', '', 'CALFULCURA  Nro 90', 5, 3, '6', NULL, '', NULL, '', '', 'EMPLEAD', '', NULL),
(1933, 'ACCOMASSO', 'MARCELO ORLANDO', 1, 11824216, 'M', '', '1988-12-15 00:00:00', 'dsadasdasd', 'asdasd asdasdas', 'LOS NARANJOS Nro 2121', 1, 1, '64', 299, '1231313', NULL, '', '', 'EMPLEAD', 'dasdsa sadsad', NULL),
(1934, 'ACUÑA', 'CLAUDIO DANIEL', 1, 35037837, 'M', '', '1984-12-13 00:00:00', '', '', 'CALLE 1 MZ33 LT3', 8, NULL, '15', NULL, '', NULL, '', '', 'PEON RU', '', NULL),
(1935, 'ADAD', 'HUGO DANTE', 1, 31665113, 'M', '', '1980-09-18 00:00:00', '', '', 'GUIÑAZU EMILIO Nro 160', 1, 1, '73', NULL, '', NULL, '', '', 'EMPLEAD', '', NULL),
(1936, 'AGUERO', 'FRANCO DAMIAN', 1, 28952386, 'M', '', '1980-09-18 00:00:00', '', '', 'CALLE 1 MZ 39 LT 3', 8, NULL, '15', NULL, '', NULL, '', '', 'EMPLEAD', '', NULL),
(1937, 'AGUILERA', 'ALDO ALBERTO', 1, 8032071, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALCORTA Nro 1030', 1, 1, '1C', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(1938, 'AGUIRRE', 'WALTER FERNANDO', 1, 18170349, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ARGENTINA AVDA Nro 36', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1939, 'ALARCON', 'CLAUDIO ALBERTO', 1, 14761105, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PAIMUN/FIGUEROA', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1940, 'ALBEAL', 'EVARISTO', 1, 14780210, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AGUADO ALEJANDRO Nro 1774', 1, 1, '64A', NULL, NULL, NULL, NULL, NULL, 'PLOMERO', NULL, NULL),
(1941, 'ALCARAZ', 'JUAN MANUEL', 1, 27894438, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GATICA Nro 640', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1942, 'ALFARO', 'BRIAN FERNANDO', 1, 36434336, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B AGUILA TI M - Puerta: CS4', 5, 3, '6', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(1943, 'ALMADA', 'JAVIER ENRIQUE', 1, 25533111, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CASTELLI MZ76 CS24 Nro 1800', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(1944, 'ALOCILLA', 'NORBERTO', 1, 12648672, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LORENZO MZ35 CS23', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'CHOFER', NULL, NULL),
(1945, 'ALVARADO', 'ANGEL ALBERTO', 1, 17371917, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 5 ALMAF II MZ LL - Puerta: LT16', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(1946, 'ALVAREZ', 'LUIS', 1, 7574861, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B YPF', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(1947, 'ALVEZ', 'RUBEN ANGEL', 1, 13837700, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 19 MZ45 LT21', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'TRANSPO', NULL, NULL),
(1948, 'AMUÑANCO', 'ANDRES CESAR', 1, 28812103, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LZO NORTE MZ44 DX10', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(1949, 'ANDREIS', 'MARIO ALBERTO', 1, 30249599, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RODHE Nro 56', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1950, 'ANTILEF', 'JUAN ANTONIO', 1, 25451741, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DEL TRABAJO Nro 3107', 5, 3, '6', NULL, NULL, NULL, NULL, NULL, 'INDEPEN', NULL, NULL),
(1951, 'APABLAZA', 'MARCELO PABLO', 1, 21952587, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LA PAMPA Nro 1471', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'GASTRON', NULL, NULL),
(1952, 'ARANCIBIA', 'PEDRO ANTONIO', 1, 10802664, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MARA/PUDU', 1, 1, '1E', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(1953, 'ARAVENA', 'ALEX DAMIAN', 1, 35834169, 'M', '', '2030-11-01 00:00:00', '', '', 'EL SALVADOR Nro 345', 2, 2, '4', NULL, '', NULL, '', '', 'DOCENTE', '', NULL),
(1954, 'ARCE', 'JUAN MARTIN', 1, 30673662, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MUÑOZ BALTAZAR CS4', 1, 1, '63A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(1955, 'ARGEL', 'MIGUEL ANGEL', 1, 35493765, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VENECIA MZ E CS4', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1956, 'ARIAS', 'MARCOS ANDRES', 1, 34293373, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'OTAZUA PL12', 5, 3, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1957, 'ARNONI', 'DANIEL ALBERTO', 1, 16192251, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RUIVAL MANUEL Nro 1837', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(1958, 'ARRIOLA', 'DANIEL ZEBELIO', 1, 11841666, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHOS MALAL Nro 130', 1, 1, '64A', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(1959, 'ASSANDRI', 'CARLOS ESTEBAN', 1, 25917746, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SANTA FE PS5 DP3 Nro 1191', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'ARQUITE', NULL, NULL),
(1960, 'AVALOS', 'ROLANDO ALBERTO', 1, 22122561, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ITALIA Nro 47', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(1961, 'AVILA AGURTO', 'JORGE LUIS', 1, 29547609, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LEJOS DE PLOTTIER MZ A5 - Puerta: L 16B', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'METALUR', NULL, NULL),
(1962, 'BACA CAU FERNANDEZ', 'LUIS SANTIAGO', 1, 33291619, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO QUINTO Nro 275', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(1963, 'BAGLIONI', 'MARTIN RODOLFO', 1, 32021409, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DEL CAMPO MZ40 CS1', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1964, 'BALMACEDA', 'ROBERTO CARLOS', 1, 22816644, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELTRAN L.FRAY Nro 1153', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'TEC EL', NULL, NULL),
(1965, 'BARCUDES', 'FELIX GUSTAVO ADOLFO', 1, 10599421, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'L LUGONES/A YUPANQUI', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(1966, 'BARRERA', 'JORGE MARTIN', 1, 25951673, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 15 CS16 MZ 27', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'TER COM', NULL, NULL),
(1967, 'BARRIGA', 'JOSE FABIAN', 1, 23384846, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BARAONA Nro 325', 1, 1, '74', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1968, 'BARROS', 'JOSE DOMINGO', 1, 7562475, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AGUADA S ROQUE ZONA RURAL', 8, NULL, '14', NULL, NULL, NULL, NULL, NULL, 'JORNALE', NULL, NULL),
(1969, 'BARUTTIS', 'FABIAN RAMIRO', 1, 30220785, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PRIMERA JUNTA Nro 3040', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'PLAYERO', NULL, NULL),
(1970, 'BASTIAS', 'EMILIANO', 1, 36258118, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B CHACAY PILAR 196', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(1971, 'BAZAN AGUILAR', 'LUIS ALBERTO', 1, 26778959, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIVADAVIA BERNARDINO PI7 Nro 324 - Puerta: DP D', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(1972, 'BELLABARBA', 'DARIO CARLOS', 1, 14690663, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RAMON DR/IRIGOYEN MK2 1C', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'MA MAYO', NULL, NULL),
(1973, 'BENAVIDES', 'JUAN HECTOR', 1, 27674802, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CANADA Nro 185', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMP MUN', NULL, NULL),
(1974, 'BENITEZ', 'FERNANDO DAVID', 1, 33823533, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ST AMANECER MZ24 LT14 - Puerta: CS132', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(1975, 'BERDUN', 'SERGIO MARTIN', 1, 29939979, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PERU/ALUMINE', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(1976, 'BERRA', 'JUAN MARCELO', 1, 23348978, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MITRE Nro 1090', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'CHOFER', NULL, NULL),
(1977, 'BEURET', 'JAVIER FRANCISCO', 1, 27963653, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'HERNANDEZ JOSE Nro 1455', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(1978, 'BLANCO', 'GUILLERMO GABRIEL', 1, 29551768, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LOS NARANJOS MZ6 Nro 2170 - Puerta: CS17', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1979, 'BOJANICH BARRIENTOS', 'ALEJANDRO MARCELO', 1, 22855256, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B YPF', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(1980, 'BOREL', 'FERNANDO LUIS', 1, 22784061, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LULES Nro 2578', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(1981, 'BOYANO', 'JOSE PABLO', 1, 20436265, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CORRENTOSO Nro 23', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(1982, 'BRAVO', 'MARIO', 1, 7565797, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LOS LAGOS Nro 769', 1, 1, '74', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(1983, 'BRIONES', 'SANTIAGO MARTIN', 1, 31134210, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CASTELLI PI2 DP7 Nro 265', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(1984, 'BRUVERIS', 'PEDRO', 1, 8019294, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SANTIAGO DEL ESTERO Nro 1089', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'GEOLOGO', NULL, NULL),
(1985, 'BURGOS', 'CARLOS ALBERTO', 1, 12638394, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CASILDA/ORTEGA GASSET Nro 300', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'MECANIC', NULL, NULL),
(1986, 'BUSTAMANTE', 'JAVIER ALBERTO', 1, 31478112, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CASTELLI PI1 DP B Nro 256', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(1987, 'BUSTOS', 'PABLO GABRIEL', 1, 20121311, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'HONDURAS Nro 1324', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'PER MER', NULL, NULL),
(1988, 'CABEZAS', 'RAUL ALBERTO', 1, 28518345, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MZ.86 DX.49-B SAN LORENZO', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'OFIC AL', NULL, NULL),
(1989, 'CABRERA', 'WALTER RAMON', 1, 23419093, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BURATOVICH Nro 197', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1990, 'CAITRU', 'JAVIER NICOLAS', 1, 36840136, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B INDEPENDENCIA MZ8 - Puerta: LT6', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'SEC INC', NULL, NULL),
(1991, 'CALFUQUEO', 'CLAUDIO EDUARDO', 1, 30917309, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DEL TRABAJADOR Nro 2225', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(1992, 'CAMINOS', 'DELFOR LUIS', 1, 4977077, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RAULI Nro 2385', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1993, 'CAMPOS', 'JOSE CEFERINO', 1, 23483147, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B 10 VIV - Puerta: CS6', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1994, 'CANALE', 'MARIANO DAVID', 1, 36784444, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 30 - Puerta: CS 18', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SEC INC', NULL, NULL),
(1995, 'CANDIO', 'HECTOR RUBEN', 1, 12265050, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ANTU Nro 227', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(1996, 'CAÑUMIR', 'OMAR ENRIQUE', 1, 33495216, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 1 MZ27 CS9', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(1997, 'CARBASUYO', 'RAMON ROSA', 1, 31889330, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELGRANO Nro 0', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'PRI COM', NULL, NULL),
(1998, 'CARDENAS', 'RAUL ALBERTO', 1, 18558566, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CARRO ITTE Nro 0', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(1999, 'CARMONA', 'AVELINO SEGUNDO', 1, 22170376, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LA PAMPA/RIVADAVIA', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2000, 'CARRASCO', 'DANILO WALTER', 1, 30500892, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BATTILANA - Puerta: CS405', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'GASISTA', NULL, NULL),
(2001, 'CARRASCO RODRIGUEZ', 'ADOLFO ERWIN', 1, 18879688, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TIERRA DEL FUEGO Nro 1255', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2002, 'CARRIZO', 'JULIAN EDUARDO', 1, 28160423, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B AGUILA TI C DX9', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2003, 'CASANOVA', 'HECTOR ADRIAN', 1, 31864039, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MOQUEHUE Nro 3057', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'SEC INC', NULL, NULL),
(2004, 'CASTAÑO', 'MARIO SERGIO', 1, 14389179, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAZARO MARTIN Nro 214', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'UNI COM', NULL, NULL),
(2005, 'CASTILLO', 'FERNANDO DANIEL', 1, 30858415, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MENDOZA Nro 237', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2006, 'CASTILLO', 'NELSON ABEL', 1, 13901492, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALBERTI MANUEL Nro 1800', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2007, 'CASTRO', 'DARIO ALEJANDRO', 1, 30960074, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN Nro 2132', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2008, 'CASTRO', 'OSCAR RAUL', 1, 12820415, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COPOL CURA BROCHERO Nro 595', 1, 1, '1E', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2009, 'CATRICHEO', 'JUAN CARLOS', 1, 20793848, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MUDON MK22 DP344', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2010, 'CAYUQUEO', 'JOSE ROBERTO', 1, 29554443, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BARROS ALVARO Nro 369', 1, 1, '64A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2011, 'CELEIRO', 'OSVALDO ANTONIO', 1, 33917526, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'C 5 DP 9 B IS MALVINAS', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2012, 'CERDA', 'JUAN BAUTISTA', 1, 30698435, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B 72 VIV MZ G8 L13', 9, 9, '15A', NULL, NULL, NULL, NULL, NULL, 'EMP RUR', NULL, NULL),
(2013, 'CESPEDEZ', 'JOSE ALBERTO', 1, 18723136, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B EL MIRADOR LT15', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2014, 'CHAP', 'RUBEN SAUL', 1, 14625162, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ARENALES Nro 320', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2015, 'CHAVEZ CASTILLO', 'EXEQUIEL ALBERTO', 1, 34088464, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LOS ZORZALES MZ10 LT11', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2016, 'CHOCOBAR', 'EDGARDO MIGUEL', 1, 25834568, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PEHUEN Nro 907', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2017, 'CID ISLA', 'HECTOR MANUEL', 1, 34662089, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B IS MALVINAS MZ201 CS16', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2018, 'CINGOLANI', 'ARMANDO ALBERTO', 1, 18416142, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, '25 DE MAYO MD 1 PB DP E', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'TE ELEC', NULL, NULL),
(2019, 'CLOSS', 'BERNARDO ADOLFO', 1, 12395136, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MATHEU Nro 3856', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2020, 'COLAVITA', 'CARLOS MIGUEL', 1, 16816262, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'C H RODRIGUEZ Nro 298', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'ING AGR', NULL, NULL),
(2021, 'COLQUE', 'JUAN PABLO', 1, 27107487, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHOS MALAL Nro 56', 1, 1, '64A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2022, 'CONTRERA', 'GERMAN ANTONIO', 1, 20836228, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CENTENO MARIO Nro 3921', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2023, 'CONTRERAS', 'JUAN JOSE', 1, 36769494, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BACHMAN Nro 393', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2024, 'COPPOLA', 'JORGE ALBERTO', 1, 5193026, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'JUAN XXIII Nro 1490', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2025, 'CORIA', 'NELSON SEBASTIAN', 1, 30917157, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALICURA Nro 867', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2026, 'CORREA', 'DANIEL EDUARDO', 1, 7597694, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PALPALA 550', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'MEDICO', NULL, NULL),
(2027, 'CORTEZ', 'CRISTIAN IVAN', 1, 26607614, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ROSA JOSE/STA FE Nro 0', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2028, 'COSTANZO', 'DIEGO ALBERTO', 1, 24531517, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'FANGIO Nro 1257', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'TEC ELE', NULL, NULL),
(2029, 'CRESPO', 'CHRISTIAN EDUARDO', 1, 26810619, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RICCHIERI Nro 325', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2030, 'CRUZ CONTRERAS', 'PABLO CESAR', 1, 28400089, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHOCON 292', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2031, 'CUEVAS', 'GERARDO', 1, 7572263, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO NEGRO Nro 1339', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2032, 'CURIÑANCO', 'NELSON JUAN', 1, 34088237, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B CORDON COLON MZ23 LT5', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2033, 'DA ROSA', 'PATRICIO FELIX', 1, 14878925, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAGO PILHUE Nro 596', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2034, 'DE BERNARDIN', 'SEBASTIAN DANIEL', 1, 24925167, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PERCY CLARCK/LAVALLE', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'LABORAT', NULL, NULL),
(2035, 'DE LOS SANTOS', 'JUAN JOSE', 1, 14420836, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B LOS PIONEROS PET 2 DX32 Nro 0', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'TE ELEC', NULL, NULL),
(2036, 'DEL PINO', 'SIMON PEDRO', 1, 35310586, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GUATEMALA Nro 823', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2037, 'DELLA GASPERA', 'CLAUDIO FAVIAN', 1, 14362882, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MAIPU Nro 570', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(2038, 'DI DIEGO', 'JOSE MARIANO', 1, 14712063, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BRASIL Nro 44', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'PRF QUI', NULL, NULL),
(2039, 'DIAZ', 'DAMIAN ANTONIO', 1, 14835408, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TALERO Nro 763', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'TECNICO', NULL, NULL),
(2040, 'DIAZ', 'JUAN MANUEL', 1, 36669004, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN JAVIER CS313', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2041, 'DIAZ', 'RODRIGO SEBASTIAN', 1, 36371808, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 4/5 G ALV CS3', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2042, 'DILGE', 'SILVIO DANIEL', 1, 27488916, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B GRAN NEUQUEN MZ6 PB 3A', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2043, 'DOMINGUEZ', 'ALEXANDER HUMBERTO', 1, 37175706, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B CUENCA XV MZ A CS7', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2044, 'DOUGALL', 'RICARDO JUAN', 1, 10532537, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO DIAMANTE Nro 485', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2045, 'DURAN', 'EUFEMIO', 1, 10883548, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B 108 VIV MZ B CS10', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(2046, 'ECHEVERRIA', 'CARLOS ALEJO', 1, 22121981, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RELMU/HUALCUPEN MZ17 1P - Puerta: DP688', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2047, 'ENCINA', 'DECLER', 1, 7565744, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO VARVARCO Nro 135', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2048, 'ERLICHER', 'JORGE LUIS', 1, 12556389, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RINCON CLUB DE CAMPO CS86', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'GEOLOGO', NULL, NULL),
(2049, 'ESCOBAR', 'SERGIO GABRIEL', 1, 29078381, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MENDOZA Nro 435', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2050, 'ESPERON', 'LUIS ALBERTO', 1, 14891275, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAS HERAS Nro 96', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'TRANSPO', NULL, NULL),
(2051, 'ESPINOZA', 'LEONARDO SEBASTIAN', 1, 34352742, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GARCIA Nro 916', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2052, 'ESTRELLA', 'LUIS ALBERTO', 1, 28234458, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BAIGORRIA Nro 554', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(2053, 'FANELLO', 'MATIAS ALFREDO', 1, 32922475, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO ATUEL Nro 454', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2054, 'FAUNDEZ', 'ALBERTO HERELIO', 1, 23918744, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PASO DE LOS INDIOS CS105 Nro 356', 1, 1, '1C', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2055, 'FERNANDEZ', 'DARIO HECTOR', 1, 26575209, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CORRIENTES Nro 400', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2056, 'FERNANDEZ', 'JOSE RODOLFO', 1, 27221194, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COMAHUE MZ6 CS6', 1, 1, '74', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2057, 'FERNANDEZ', 'RAFAEL ADOLFO', 1, 21785396, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SARMIENTO Nro 360', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2058, 'FERRADA', 'JONATHAN EDUARDO', 1, 30542447, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELGRANO MZ R LT2', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2059, 'FERRERIA', 'JORGE LUIS', 1, 16703981, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BOUQUET ROLDAN PB DP A Nro 736', 1, 1, '1D', NULL, NULL, NULL, NULL, NULL, 'CONTADO', NULL, NULL),
(2060, 'FIGAR', 'NICOLAS EDUARDO', 1, 30529721, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CASTELLI MOD D2 DP199 Nro 1753', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2061, 'FIGUEROA', 'MIGUEL ANGEL', 1, 17632449, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SC LA ESTRELLA-MZ4 LT14', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'PEON', NULL, NULL),
(2062, 'FITTIPALDI', 'LUCAS NICOLAS', 1, 36945306, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VERON MARCIANO Nro 674', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2063, 'FLORES', 'JOSE LUIS', 1, 24633303, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SANTA FE MZ502A LT1 Nro 676', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'CHOFER', NULL, NULL),
(2064, 'FLORES', 'WALTER MARTIN', 1, 30412742, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAGO TITICACA Nro 767', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2065, 'FORESTIER', 'EDGARDO CESAR', 1, 8850234, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NOGOYA Nro 3993', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2066, 'FRANCO', 'RODOLFO BEBAN', 1, 27300774, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'HUILEN/PEREZ NOVELLA', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2067, 'FUENSALIDA', 'HUGO PABLO', 1, 28704645, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 5 ESFUERZO MZ5 LT3', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2068, 'FUENTES', 'ERNESTO', 1, 11288664, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B P IND SC B PT13 DX5', 1, 1, '1F', NULL, NULL, NULL, NULL, NULL, 'POLICIA', NULL, NULL),
(2069, 'FUENTES', 'MAXIMILIANO DANIEL', 1, 33650586, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 3/16 CS1', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2070, 'FUNES', 'JOSE EMANUEL', 1, 32021645, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SANTA FE PI8 DP D Nro 333', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'DOCTOR', NULL, NULL),
(2071, 'GAGO MENISES', 'CARLOS ALBERTO', 1, 29212141, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ANTARTIDA ARGENTINA PI1 Nro 976 - Puerta: DP B', 1, 1, '1D', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2072, 'GALLARDO', 'CLAUDIO RUBEN', 1, 31466551, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PICADA 21', 9, 9, '15A', NULL, NULL, NULL, NULL, NULL, 'PEON RU', NULL, NULL),
(2073, 'GALVAÑ', 'JUAN CARLOS', 1, 11276925, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ITALIA R DE Nro 15 - Puerta:   14A', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'INGENIE', NULL, NULL),
(2074, 'GARCIA', 'ADOLFO', 1, 7576011, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B A BARDA TO MIRADOR PI10 - Puerta: DP A', 1, 1, '1E', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2075, 'GARCIA', 'GUSTAVO ANDRES', 1, 18590962, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO COLORADO Nro 2400', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'TRANSPO', NULL, NULL),
(2076, 'GARCIA', 'MARIO RAUL', 1, 18618237, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PELAEZ Nro 1465', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2077, 'GARCIA GUIDI', 'DANIEL ADOLFO', 1, 20450839, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ACONCAGUA Nro 1339', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'TER COM', NULL, NULL),
(2078, 'GARRIDO', 'JAVIER ANGEL', 1, 22692229, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PANAMA Nro 887', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2079, 'GARRO', 'WALTER DANIEL', 1, 39523465, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, '9 DE JULIO Nro 611', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2080, 'GAUNA MORENO', 'FRANCO EXEQUIEL', 1, 36146756, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SANTA FE DX9 Nro 654', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2081, 'GEREZ', 'MANUEL VICTOR', 1, 11095396, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B KARTODROMO MZ J MK12 1P - Puerta: DP3', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'DEPORTI', NULL, NULL),
(2082, 'GIL', 'JULIO EDUARDO', 1, 21380484, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LA PAMPA Nro 740', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2083, 'GIMENO', 'MARTIN GASTON', 1, 31530204, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MASCARDI/CHUBUT', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2084, 'GODOY', 'CRISTIAN IVAN', 1, 31062674, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MOQUEHUE MZ37 CS2', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'ELECTRI', NULL, NULL),
(2085, 'GOMEZ', 'CARLOS GABINO', 1, 12393705, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TRENQUE LAUQUEN LT15', 1, 1, '63A', NULL, NULL, NULL, NULL, NULL, 'AGRICUL', NULL, NULL),
(2086, 'GOMEZ', 'JOSE GUILLERMO', 1, 12730235, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DR RAMON Nro 4545', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'DESOCUP', NULL, NULL),
(2087, 'GOMEZ', 'RAUL', 1, 16819607, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL SAUCE MZ13 LT2 Nro 1415', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2088, 'GONZALEZ', 'BONIFACIO ISIDRO', 1, 7290346, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 1 MZ23 LT4', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2089, 'GONZALEZ', 'FLAVIO DANIEL', 1, 16752992, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MARTINEZ GREGORIO Nro 197', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2090, 'GONZALEZ', 'JOSE MANUEL', 1, 22601287, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL SALVADOR CS3', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2091, 'GONZALEZ', 'MATIAS JAVIER', 1, 37758340, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EXP DEL DESIERTO/BROWN Nro 51', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2092, 'GONZALEZ', 'ROBERTO PAULO MATIAS', 1, 29312238, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHILE Nro 540', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2093, 'GORBACHOV', 'ESTEBAN DAVID', 1, 26148919, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CABO DE HORNOS Nro 915', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2094, 'GRECO', 'HUGO BENJAMIN', 1, 36711602, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CORRIENTES Nro 1661', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'MECANIC', NULL, NULL),
(2095, 'GUALDONI', 'JUAN CARLOS', 1, 10255095, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MANZI DX21 MZ2 Nro 2667', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'VIAJANT', NULL, NULL),
(2096, 'GUERRERA', 'EDGARDO SEBASTIAN', 1, 28559321, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELGRANO/BUTACO', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2097, 'GUILLEN', 'JOSE ALFREDO', 1, 25783135, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CORDOBA Nro 1285', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2098, 'GUTIERREZ', 'DIEGO SEBASTIAN', 1, 27987005, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LZO NTE MZ44 DX35', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2099, 'GUTIERREZ', 'MIGUEL EDMUNDO', 1, 14966901, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BROWN Nro 1002 - Puerta: PB', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(2100, 'GUZMAN', 'JORGE', 1, 18125212, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GUALEGUAY PI1 Nro 306', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2101, 'HARNNICH', 'RODRIGO IVAN', 1, 29939873, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BATILANA Nro 45', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2102, 'HEREDIA', 'JUAN CARLOS', 1, 7990495, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAYHUEQUE Nro 318', 1, 1, '1C', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2103, 'HERNANDEZ', 'DANIEL DARIO', 1, 30681060, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MENDOZA Nro 1737', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2104, 'HERNANDEZ', 'JULIO ALBERTO', 1, 27256391, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 4 MZ40 LT24', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2105, 'HERNANDEZ LOPETEGUI', 'AMHED', 1, 18800940, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PARAGUAY Nro 150', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'FISIOTE', NULL, NULL),
(2106, 'HERRERA', 'MARIO CARLOS', 1, 8312638, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHUBUT Nro 1033', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2107, 'HIELPOS', 'MIGUEL ALBERTO', 1, 21952800, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO PEPIRI Nro 404', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2108, 'HUARTE', 'NESTOR CESAR', 1, 26810246, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B CUENCA XV MZ17 LT15', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2109, 'HUENUMAN', 'RIGOBERTO', 1, 11233845, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CARRO ITTE Nro 1555', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'MECANIC', NULL, NULL),
(2110, 'IBAÑEZ', 'BENITO JORGE', 1, 17900786, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL CHOCON MZ F LT9 Nro 2400', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2111, 'IBARROLA', 'PABLO NICOLAS', 1, 31609353, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PUENTE PASCUAL - Puerta: CS12', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2112, 'INFANTE', 'FRANCO GERARDO', 1, 29588780, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'REALICO Nro 366', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2113, 'INOSTROZA', 'SEBASTIAN ALEJANDRO', 1, 35188057, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'FLORES J.M. Nro 42', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2114, 'ISLA OPAZO', 'MARTIN ALEJANDRO', 1, 32568475, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'JUAN XXIII Nro 1355', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2115, 'JALIFF', 'ADHEL ANTONIO', 1, 12291906, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PLANICIE BANDERITA Nro 151', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'TEC QUI', NULL, NULL),
(2116, 'JARA', 'HECTOR ORLANDO', 1, 14088812, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ISLAS MALVINAS Nro 2255', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'PINTOR', NULL, NULL),
(2117, 'JARA', 'OMAR', 1, 16717338, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B 380 VIV PT3 DX36', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2118, 'JARAMILLO CASTRO', 'CESAR LEONIDAS', 1, 18787263, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'STORNI Nro 1200', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2119, 'JOFRE', 'EDGARDO SEBASTIAN', 1, 31316761, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MISIONES Nro 347', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2120, 'JUAREZ', 'JOSE ANTONIO', 1, 24266206, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALUMINE MZ E3 CS18', 9, 9, '15A', NULL, NULL, NULL, NULL, NULL, 'EMP RUR', NULL, NULL),
(2121, 'KILAPI', 'ELISEO DANIEL', 1, 25019982, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'FERNANDEZ ORO', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2122, 'KREITZER', 'OSCAR RAMON', 1, 5955992, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BUENOS AIRES Nro 267', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'CARPINT', NULL, NULL),
(2123, 'LAGOS', 'ALEXIS EMANUEL', 1, 37943706, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELGRANO/T DEL FUEGO', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2124, 'LAIME', 'IGNACIO GABRIEL', 1, 24240881, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PQ INDUSTRIAL MZ D3 LT3', 9, 9, '15A', NULL, NULL, NULL, NULL, NULL, 'EMP RUR', NULL, NULL),
(2125, 'LARA', 'DIEGO HERNAN', 1, 34657347, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CANADA/ECUADOR', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2126, 'LARRONDO', 'CARLOS NELSON', 1, 27422082, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'IRIGOYEN PI2 DP A Nro 212', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2127, 'LAZCANO', 'GUSTAVO ADOLFO', 1, 34088206, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'J B JUSTO Nro 1950', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2128, 'LEGUIZAMON', 'PEDRO ANTONIO', 1, 17641058, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MK50 DP640', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2129, 'LEIVA', 'RUBEN REINALDO', 1, 22474475, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO NEGRO Nro 813', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'TER COM', NULL, NULL),
(2130, 'LEPEZ', 'EDGARDO ALEJANDRO', 1, 26909294, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B LOS PIONEROS PT10 DX254', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2131, 'LEZCANO', 'RUBEN DARIO', 1, 16608299, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 11 TI M ENT2 PI2 - Puerta: DP B', 1, 1, '1F', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2132, 'LINARES', 'HORACIO', 1, 18747195, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B TOMA NORTE MZ30 LT13', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2133, 'LIZARDO', 'ALEJANDRO RODOLFO', 1, 22329736, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, '12 DE SEP/TRAB MUNICIPAL - Puerta: CS210', 1, 1, '1C', NULL, NULL, NULL, NULL, NULL, 'METALUR', NULL, NULL),
(2134, 'LOBOS', 'ATILIO', 1, 7573248, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALBERTI Nro 1230', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2135, 'LOPEZ', 'CLAUDIO ADRIAN', 1, 24581518, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 2 MZ 29 LT 17', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2136, 'LOPEZ', 'JORGE OSCAR', 1, 10535855, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO COLORADO Nro 231', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2137, 'LOPEZ', 'OMAR BELISARIO', 1, 17575431, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'HONDURAS Nro 1330', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2138, 'LOPEZ SARALEGUI', 'LUIS RICARDO', 1, 28945874, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MUDON MK15 D.231', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2139, 'LUCCIONI', 'GONZALO SEBASTIAN', 1, 34663192, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ÑIRE DX451', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2140, 'LUENGO', 'PABLO ALFREDO', 1, 16816371, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TAFI DEL VALLE Nro 107', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'CHOFER', NULL, NULL),
(2141, 'LUSONA', 'MARCO DANIEL', 1, 28945595, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LORENZO MZ71 CS15', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMP COM', NULL, NULL),
(2142, 'MAGAÑA', 'FERNANDO MIGUEL', 1, 35354835, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DEL SOL Nro 0', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2143, 'MALDONADO', 'ERNESTO DELFIN', 1, 11640507, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHIAVARINO CS5 Nro 1854', 1, 1, '64A', NULL, NULL, NULL, NULL, NULL, 'PRI COM', NULL, NULL),
(2144, 'MAMANI', 'ISAAC ZACARIAS', 1, 32058484, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B 1 DE FEBRERO MZ1 LT7', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2145, 'MANRIQUE', 'ADOLFO DARIO', 1, 23428692, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ITALIA PB DP A Nro 615', 1, 1, '1D', NULL, NULL, NULL, NULL, NULL, 'ENFERME', NULL, NULL),
(2146, 'MANZINO', 'RENE OSCAR', 1, 11640795, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELGRANO Nro 3937', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2147, 'MARDONES', 'CARLOS SEBASTIAN', 1, 27932203, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 2/20 MZ45 LT10', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'PER MER', NULL, NULL),
(2148, 'MARIGUAN', 'MARCELO', 1, 11861793, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PIEDRA DEL AGUILA MZ5 Nro 871 - Puerta:   CS2', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2149, 'MARINO', 'CRISTIAN NICOLAS', 1, 30010482, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GODOY Nro 245', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'MA MAYO', NULL, NULL),
(2150, 'MARRON PANES', 'MARTIN NICOLAS', 1, 37757507, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MUDON MK21 DP336', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2151, 'MARTINEZ', 'ALEJANDRO JAVIER', 1, 21038518, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO DIAMANTE Nro 458', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2152, 'MARTINEZ', 'FRANCO GABRIEL', 1, 37173228, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B EL BOSQUE MZ4 LT22', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2153, 'MARTINEZ', 'LUCIO EDGARDO', 1, 16696244, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALBARDON MZ7 CS6 Nro 4306', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2154, 'MARTINEZ', 'RAUL OMAR', 1, 7687557, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CERRO BANDERA Nro 2325', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2155, 'MARZULLO', 'ANTONIO HUGO', 1, 20436492, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BUENOS AIRES Nro 1020', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2156, 'MATURANO', 'JUAN FRANCISCO', 1, 16165162, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PALACIOS NICOLAS Nro 288', 1, 1, '1C', NULL, NULL, NULL, NULL, NULL, 'PINTOR', NULL, NULL),
(2157, 'MAZZA', 'JORGE HORACIO', 1, 16501247, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SANTA ROSA Nro 545', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2158, 'MEDINA', 'PEDRO OCTAVIO', 1, 11662918, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'IRIGOYEN PI3 DP A Nro 513', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(2159, 'MELIPIL', 'PRUDENCIO VICTOR', 1, 32614081, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B EL MIRADOR LT111', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2160, 'MELO', 'GASTON RAFAEL', 1, 27406893, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALDERETE Nro 618', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2161, 'MENDEZ', 'EUGENIO ROBERTO', 1, 25725640, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PERGAMINO LT22', 1, 1, '63A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2162, 'MENDEZ', 'SERGIO RAUL', 1, 14424453, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SARMIENTO Nro 55', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'PELUQUE', NULL, NULL),
(2163, 'MENOCHIO', 'JESUS EMANUEL', 1, 33354247, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B TOMA 7 DE MAYO MZ49 - Puerta: LT4', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'PETROLE', NULL, NULL),
(2164, 'MERIÑO', 'CRISTIAN ALBERTO', 1, 30412858, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHOELE CHOEL/PASTO VERDE - Puerta: CS26R', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2165, 'METRALLE', 'BRIAN EXEQUIEL', 1, 37567249, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AGOTE LUIS Nro 336', 1, 1, '64A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2166, 'MIGUEZ', 'JUAN CRUZ', 1, 32779061, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MARONESSE MZ3 CS14', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2167, 'MILLAQUEO', 'NESTOR FACUNDO', 1, 37176071, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LORENZO MZ 69 - Puerta: DX 25', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'SEC INC', NULL, NULL),
(2168, 'MIRANDA', 'MATIAS DAMIAN', 1, 34310727, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ST 192 VVDAS MZ H LT22', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2169, 'MOLINA', 'FERNANDO JOEL', 1, 37172835, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAPAG CANAAN Nro 2290', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2170, 'MOLINA VEGA', 'ALVARO ANDRES', 1, 37173255, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LIBERTADOR Nro 3118', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2171, 'MONSALVE', 'RICARDO HUGO', 1, 12066128, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B COLONIA SAN FRANCISCO', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'MECANIC', NULL, NULL),
(2172, 'MONTECINOS', 'OSCAR ERNESTO', 1, 23917775, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ESPAÑA PI13 A Nro 185', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2173, 'MONTI', 'AGUSTIN MARIO', 1, 27668755, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MINAS Nro 1020', 1, 1, '74', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2174, 'MORA', 'ELVIS MANUEL', 1, 37857705, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BORLENGHI Nro 739', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2175, 'MORALES', 'CARLOS ADRIAN', 1, 17107751, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LUAN PI3 DP D Nro 2845', 1, 1, '1E', NULL, NULL, NULL, NULL, NULL, 'MEDICO', NULL, NULL),
(2176, 'MORALES', 'LUIS ALBERTO', 1, 22092005, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PELAGATTI MZ3 LT24', 1, 1, '74', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2177, 'MORAN', 'SERGIO RUBEN', 1, 34811140, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RODHE Nro 1817', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2178, 'MORENO', 'SERGIO ALBERTO', 1, 14800327, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ANTARTIDA ARGENTINA Nro 1735', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'CHOFER', NULL, NULL),
(2179, 'MOYA', 'CRISTIAN EDUARDO', 1, 25329597, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'FORMOSA Nro 176', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2180, 'MOYANO', 'RAMON', 1, 7562474, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AGDA SAN ROQUE', 8, NULL, '14', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2181, 'MUÑOZ', 'CARLOS', 1, 7688012, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELGRANO', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2182, 'MUÑOZ', 'GUSTAVO ARIEL', 1, 31099405, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ESTADOS UNIDOS MZ393A - Puerta: LT10', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'MAQUINI', NULL, NULL),
(2183, 'MUÑOZ', 'JULIO DANTE', 1, 23918185, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PERI Nro 714 - Puerta: CS502', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'PER MER', NULL, NULL),
(2184, 'MUÑOZ', 'OMAR REGINO', 1, 14362729, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'HONDURAS/ANTU CS268 Nro 1260', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ADMIN', NULL, NULL),
(2185, 'MUÑOZ LAGO', 'LUIS ARTURO', 1, 36434154, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DR RAMON/BATTILANA MZ203 - Puerta: LT4', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2186, 'NAHUELHUAL', 'JORGE OSCAR MAXIMILIANO', 1, 34381049, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B H COMUNITARIAS MZ21 LT1', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2187, 'NARBO', 'CARLOS ROBERTO', 1, 14368341, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LOC CENTENARIO SC CHACRA - Puerta: LT63', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2188, 'NAVARRETE', 'RENE', 1, 7687571, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHUBUT Nro 526', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2189, 'NAVIA', 'CRISTIAN OMAR', 1, 39128872, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BATTILANA MZ B LT4', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2190, 'NIELI', 'MILCIADES VICENTE', 1, 16758231, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SALTA Nro 255', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'INDEPEN', NULL, NULL),
(2191, 'NOGUES', 'PABLO ENRIQUE', 1, 23856194, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'C H RODRIGUEZ PI6 DP A Nro 840', 1, 1, '1D', NULL, NULL, NULL, NULL, NULL, 'CONTADO', NULL, NULL),
(2192, 'NUÑEZ', 'JUAN HUMBERTO', 1, 28254006, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B PQ INDUST MZ G10 LT1', 9, 9, '15A', NULL, NULL, NULL, NULL, NULL, 'METALUR', NULL, NULL),
(2193, 'OBREQUE', 'RODOLFO LUIS', 1, 28356683, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NECOCHEA MZ16 LT12 CS2', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2194, 'OJEDA', 'MARTIN LEONARDO', 1, 28941577, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MARCELO BERBEL Nro 42', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'TER COM', NULL, NULL),
(2195, 'OLGUIN', 'PABLO GUSTAVO', 1, 22234898, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CARAGUATAY Nro 4366', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'ING CIV', NULL, NULL),
(2196, 'OLIVERA COLIPE', 'JONATAN ULISES', 1, 34220091, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'REYES MALVINA MZ E LT3', 3, NULL, '75', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2197, 'OPAZO CAMPOS', 'JUAN RAMON', 1, 33384569, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CA 15/6 G ALV TI51 - Puerta: DP787', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SEC INC', NULL, NULL),
(2198, 'ORLANDO', 'GUSTAVO FABIAN', 1, 16739478, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BOLIVAR SIMON Nro 630', 1, 1, '74', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2199, 'ORTEGA', 'ROBERTO CARLOS', 1, 26233282, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN Nro 574', 3, NULL, '75', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2200, 'ORTIZ', 'NARCISO ALEJO', 1, 18105007, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SALTA Nro 145', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2201, 'OSORIO', 'DELFIN', 1, 7569557, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NAMUNCURA CEFERINO Nro 2156', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2202, 'OVIEDO', 'ALBERTO DANIEL', 1, 40248845, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COPAHUE/ALUMINE Nro 1637', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL);
INSERT INTO `personas` (`idPersona`, `Apellido`, `Nombre`, `idTipoDocumento`, `DNI`, `Sexo`, `CUIL`, `FechaNacimiento`, `Nacionalidad`, `LugarNacimiento`, `Domicilio`, `idLocalidad`, `idCentroDistribucion`, `Circuito`, `CaracteristicaFijo`, `TelefonoFijo`, `CaracteristicaCelu`, `TelefonoCelular`, `CorreoElectronico`, `Profesion`, `Ocupacion`, `Observaciones`) VALUES
(2203, 'PACHECO', 'MARIO LUIS', 1, 24140195, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MORENO MARIANO Nro 287', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2204, 'PAGANO', 'JONATHAN ANDRES', 1, 33941846, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NEUQUEN Nro 177', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2205, 'PAINEVIL', 'DANIEL ABRAHAM ELISEO', 1, 36769451, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VALDEZ Nro 23', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2206, 'PALLAQUEO', 'MIGUEL ANGEL', 1, 36955366, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B S LORENZO NTE MZ39 DX4', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2207, 'PANES', 'JORGE HORACIO', 1, 26636333, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B CUENCA XV MZ G CS 9', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2208, 'PARADA', 'RUBEN EMILIO', 1, 16393202, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PERON Nro 779', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2209, 'PAREDES', 'PEDRO MARCELINO', 1, 20951547, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DEL LIBERTADOR CS379', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2210, 'PARRA', 'JORGE ALBERTO', 1, 23063212, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELGRANO/BUTACO LT4', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'JARDINE', NULL, NULL),
(2211, 'PARROTTI', 'LUIS SILVERIO', 1, 5496875, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AMANCAY PI2 DP9 Nro 350', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2212, 'PAVON', 'JONATAN RODOLFO', 1, 34960703, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GODOY/MATHEU Nro 1106', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2213, 'PEDRERO', 'JUAN CARLOS', 1, 33610774, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CUBA CS25', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMP COM', NULL, NULL),
(2214, 'PENA', 'NORBERTO FABIO', 1, 21603431, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LZO NTE MZ49 CS11', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2215, 'PERALTA', 'LEOPOLDO', 1, 8850450, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAVALLE Nro 826', 3, NULL, '75', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2216, 'PEREYRA', 'CESAR', 1, 32962830, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CACHEUTA 3 Nro 1026', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'EMP COM', NULL, NULL),
(2217, 'PEREZ', 'CARMELO CESAR', 1, 20114890, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RICCHIERI Nro 2090', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'TE RADL', NULL, NULL),
(2218, 'PEREZ', 'JORGE OMAR', 1, 10159494, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B EL CHACAY', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'CHAPIST', NULL, NULL),
(2219, 'PEREZ', 'PABLO EZEQUIEL', 1, 36801233, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B S LORENZO NTE MZ87 DX42', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2220, 'PERREN', 'MIGUEL ANGEL', 1, 6253340, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COLOMBIA Nro 1474', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2221, 'PICCIOLI', 'BRAIAN EMMANUEL', 1, 35492112, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN Nro 35', 3, NULL, '75', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2222, 'PIÑA', 'WILLIAN JUSTO EZEQUIEL', 1, 35875756, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VOLCAN LANIN CS16 MZ D3', 9, 9, '15A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2223, 'PINO', 'CESAR ELISEO', 1, 30432703, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MAMA MARGARITA MZ380 LT17', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMBALAD', NULL, NULL),
(2224, 'PIÑOL', 'RODRIGO', 1, 31985148, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ROCA Nro 1167', 1, 1, '1D', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2225, 'PIZARRO', 'ANGEL SEBASTIAN', 1, 17274911, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B GRAN NEUQUEN MZ17 CS11', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2226, 'POBLETE HERNANDEZ', 'SERGIO ALBERTO', 1, 18649637, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RELMU MZ R CS44', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2227, 'PONCE', 'WALTER AMBROSIO', 1, 16433960, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'POSADAS MZ I LT17', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2228, 'POSSE', 'MATIAS EDUARDO', 1, 34812769, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AUSTRALIA CS11', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2229, 'PRIETO', 'OSCAR', 1, 12699321, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ESTADOS UNIDOS Nro 536', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ALBAÑIL', NULL, NULL),
(2230, 'PUENTES', 'JULIO CESAR', 1, 27327270, 'M', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COMBATE DE SAN LOR MZ70 - Puerta: CS9', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2231, 'ABOU ADAL MIRANDA', 'MARIA SUYAY', 1, 30355904, 'F', '', '1980-09-18 00:00:00', '', '', 'BELGRANO PI2 DP D Nro 167', 1, 1, '1B', NULL, '', NULL, '', '', 'UNI INC', '', NULL),
(2232, 'ACOSTA', 'MARA GISELLE MAGALI', 1, 30174891, 'F', '', '2015-12-01 00:00:00', '', '', 'ALUMINE Nro 975', 1, 1, '64', NULL, '', NULL, '', '', 'EMPLEAD', '', NULL),
(2233, 'ACUÑA', 'NATALIA EDITH', 1, 28945525, 'F', '', '1980-09-18 00:00:00', '', '', 'NAMUNCURA PI1 DP4 Nro 1137', 1, 1, '72', NULL, '', NULL, '', '', 'SEC COM', '', NULL),
(2234, 'AGUADA MORA', 'JAQUELINE SOLEDAD', 1, 36372311, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LZO MZ82 - Puerta: DX27', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2235, 'AGUILAR', 'MARIA JESUS', 1, 36256412, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CANDELARIA Nro 272', 1, 1, '1C', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2236, 'AGUIRRE', 'MARIA VIRGINIA', 1, 10296485, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'OLASCOAGA AV Nro 784', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'PSICOLO', NULL, NULL),
(2237, 'ALARCON', 'ALICIA', 1, 18516888, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CANADA Nro 1574', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMP DOM', NULL, NULL),
(2238, 'ALBAMONTE', 'RAQUEL MARGARITA', 1, 5471795, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PILAR Nro 3595', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'UNI COM', NULL, NULL),
(2239, 'ALBORNOZ MARZAN', 'LYDIA', 1, 11454701, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ARGENTINA Nro 223', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ASI SOC', NULL, NULL),
(2240, 'ALEGRIA', 'ROXANA JIMENA', 1, 31613956, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CASTELLI Nro 2175', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2241, 'ALIPPI', 'MARIA AYELEN', 1, 32188381, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PILAR Nro 3949 - Puerta: DP 9', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2242, 'ALMENDRAS', 'NORMA SUSANA', 1, 11345619, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RODRIGUEZ MANUEL Nro 155', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2243, 'ALTAMIRANO', 'GLADYS MONICA B', 1, 12550948, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'C H RODRIGUEZ Nro 2130', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2244, 'ALVAREZ', 'GLADYS ELENA', 1, 4749499, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'INDEPENDENCIA PI7 DP A Nro 124', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2245, 'ALVAREZ', 'VIRGINIA DEL CARMEN', 1, 10660499, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ZEBALLOS Nro 615', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2246, 'AMARANTE', 'JOBA DEL CARMEN', 1, 17868936, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHOELE CHOEL MZ G1 - Puerta: CS30', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'ARTESAN', NULL, NULL),
(2247, 'ANCAFIL', 'ROXANA NOEMI', 1, 30913155, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SR BELEN MZ25 LT14', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2248, 'ANDRES', 'NORMA BEATRIZ', 1, 18009787, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO PEPIRI Nro 217', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2249, 'ANTIÑIR', 'NATALI CAROLINA', 1, 34658911, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B TOMA NORTE MZ26 LT8', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2250, 'APPIGNANESI', 'SANDRA DANIELA', 1, 17622533, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELEN Nro 4590', 1, 1, '62', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2251, 'ARANDA', 'NORA MABEL', 1, 17809509, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PASCUAL PUENTE Nro 941 - Puerta: CS4', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2252, 'ARAVENA', 'MARIA ALFONSINA', 1, 13472597, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALMAFUERTE II MZ P LT4', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2253, 'ARCOS', 'VALERIA DEL PILAR', 1, 25948375, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GAZARI RUFINO Nro 1137', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2254, 'ARIAS', 'ALEJANDRA ANDREA', 1, 25575010, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALUMINE Nro 848', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2255, 'ARIAS', 'SANDRA EDITH', 1, 22287245, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ANTARTIDA ARGENTINA Nro 2665 - Puerta: CS420', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2256, 'AROCA', 'ZULEMA', 1, 6491052, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PERON Nro 0', 5, 3, '6', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2257, 'ARRON', 'TERESA', 1, 10223095, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO QUINTO Nro 333', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'PROFESO', NULL, NULL),
(2258, 'ASSELBORN', 'NORA GRACIELA', 1, 24721359, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELTRAN Nro 655', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2259, 'AVALOS', 'SILVANA ALEJANDRA', 1, 22190437, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SANTA FE PI1 DP C Nro 740', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2260, 'AVILA', 'VIVIANA ALEJANDRA', 1, 23726310, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B ST PLATEAS MZ Q CS13', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2261, 'AZUA', 'VANESA FABIANA', 1, 32021703, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELLO M B LA ESPERANZA - Puerta: CS10', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2262, 'BAEZA', 'PAULA ALICIA', 1, 24109639, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CODIGO 414 MZ41F LT9 Nro 235', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2263, 'BALDIVIEZO RAMOS', 'MARIA LUISA', 1, 30226592, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELGRANO Nro 3374', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2264, 'BARBERIS', 'MICAELA NAHIR', 1, 38812487, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAS FLORES Nro 490', 1, 1, '1E', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2265, 'BARRERA', 'BLANCA ESTER', 1, 22593768, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'JAMAICA Nro 750', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(2266, 'BARRIENTO', 'YANINA SOLEDAD', 1, 28196318, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, '12 DE SETIEMBRE Nro 2949', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'UNI COM', NULL, NULL),
(2267, 'BARROS', 'CARMEN EDITH', 1, 17188268, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LOC PLOTTIER SEC CHACRAS', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2268, 'BARROSO', 'DAKMA AMALIA', 1, 34791572, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GUIRALDES MZ365 LT11 Nro 511', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2269, 'BASCUR', 'ROSA ETELVINA', 1, 10042103, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAGO LOLOG Nro 1370', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2270, 'BATTISTONI', 'MARIA VICTORIA', 1, 27684208, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CAVIAHUE PI 6 DP D Nro 302', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'UNI COM', NULL, NULL),
(2271, 'BEEGUIER', 'MABEL RAQUEL', 1, 14389486, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MICHAY MZ8 LT32', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2272, 'BELTRAN', 'MARIA ELVIRA', 1, 10437789, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B VALENTINA SUR MZ T - Puerta: CS23', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2273, 'BENEGAS', 'MARIA ALICIA', 1, 12158159, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'URQUIZA Nro 1064', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2274, 'BENITEZ VEGA', 'MARIA LORENA', 1, 36371504, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CUADROS HILARIO Nro 2500 - Puerta: LT20', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2275, 'BERNIER', 'ADRIANA MABEL', 1, 17868884, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B TCI CANAL V MZ E DX21 Nro 0', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2276, 'BERTUZZI', 'NORMA GRACIELA', 1, 16284878, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ATLANTIDA Nro 289 - Puerta: CS35', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2277, 'BILLAGUINCA', 'MARIA EVA', 1, 12210115, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ANDALGALA Nro 371', 1, 1, '62', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2278, 'BOBADILLA', 'AMELIA AZUCENA', 1, 33450204, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B V CEFERINO MZ89 CS20', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2279, 'BONIFACIO', 'DORA GRACIELA', 1, 17066215, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PELAGATTI Nro 1610', 1, 1, '74', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2280, 'BOSKOVIC', 'MARIA', 1, 14193590, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ROCA Nro 1564', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ARQUITE', NULL, NULL),
(2281, 'BRAVO', 'ARABELA MIRNA', 1, 17066230, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHAJARI Nro 3315', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2282, 'BRAVO', 'VICTORIA EVANGELINA', 1, 20722358, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELEN Nro 4774', 1, 1, '62', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2283, 'BRITOS', 'SULMA ENCARNACION', 1, 12209072, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN JUAN TO A1 PB DP A Nro 133', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2284, 'BUDUBA', 'ERMINDA ELSA', 1, 14963826, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAVALLE Nro 154', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2285, 'BURGOS', 'NOEMI SOFIA', 1, 28887693, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B CORDON COLON MZ4 LT5', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2286, 'BUSTO', 'MIRTA GRACIELA', 1, 11579026, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'J B JUSTO Nro 1707', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2287, 'BUYONES', 'MARIA GUADALUPE', 1, 28361613, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B GRAN NQN NTE MZ14 MK3 - Puerta: PB3', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2288, 'CABRERA', 'ARIADNA MARIANELA', 1, 35310947, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COLLON CURA Nro 112', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2289, 'CACERES', 'FLORENCIA NAIR', 1, 37101780, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B PIN SR2 MZ A LT9', 1, 1, '1F', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2290, 'CALDART', 'MARIA CELESTE', 1, 29940683, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ASMAR Nro 454', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'TRADUCT', NULL, NULL),
(2291, 'CALLUAN', 'ANA ROSA', 1, 23734372, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL SALVADOR MZ346 LT3', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2292, 'CAMPOS', 'ANA GISELA', 1, 34357593, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B PARQUE IND MZ I ST4 CS7', 1, 1, '1F', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2293, 'CAMPOS', 'PAULA ANDREA', 1, 23856083, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CABO DE HORNOS Nro 720', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2294, 'CANAY', 'DAMARIS TAMARA', 1, 34125200, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MOZART Nro 2090', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2295, 'CANIUQUEO VERGARA', 'ALICIA DEL CARMEN', 1, 18760322, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL CHOCON Nro 1105', 1, 1, '74', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2296, 'CAPPELLI', 'VILNA ROCIO', 1, 35040450, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SPINELLI MZ18 CS11', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2297, 'CARDENAS', 'FERMINA BEATRIZ', 1, 16429757, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ROJAS RICARDO Nro 319', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2298, 'CARES', 'BRIGIDA EDITH', 1, 35311099, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B CUENCA XV MZ G2 CS20', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2299, 'CARRASCAL', 'YURI TAMARA', 1, 22902110, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ROCA PI5 DP B Nro 150', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'RADIOLO', NULL, NULL),
(2300, 'CARRASCO', 'OLGA', 1, 16671406, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'OTTO NEUMANN MZ59 DX27 Nro 4651', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2301, 'CARRILLO', 'MARIA ANGELICA', 1, 10437767, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CASILDA/NOGOYA Nro 557', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2302, 'CARTIER', 'MARIA AGOSTINA', 1, 37348472, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PALPALA Nro 650', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2303, 'CASILLA', 'HILDA MIRIAM', 1, 23514610, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MAZZA Nro 1680', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2304, 'CASTILLO', 'ANA ROSA', 1, 18193055, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MINAS Nro 1509', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2305, 'CASTILLO', 'MABEL DEL CARMEN', 1, 28990458, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ROCA Nro 2300', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2306, 'CASTILLO', 'SUSANA MARIA', 1, 25765746, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B C COLON. MZ16A- LT8', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2307, 'CASTRO', 'JAQUELINE VERONICA', 1, 33095157, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SUAREZ AMARANTO Nro 1358', 1, 1, '74', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2308, 'CASTRO COLIL', 'ALEJANDRA BEATRIZ', 1, 27377340, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B LTO ALZOGARAY MZ E LT15', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2309, 'CAVACO', 'MARIA', 1, 4159608, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TROITIÑO Nro 2791', 1, 1, '1E', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2310, 'CEBALLOS', 'GABRIELA ALEJANDRA', 1, 31156625, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO ALUMINE Nro 226', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2311, 'CENTENO', 'OLGA RAQUEL', 1, 20234462, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PICADA 21 Nro 35', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2312, 'CERDAS', 'ANGELA MABEL', 1, 32189889, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VARVARCO Nro 1201 - Puerta: C337', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2313, 'CHAMATROPULOS', 'PAULA', 1, 17451479, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SEC CHACRAS CHACRA 150', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'LIC TUR', NULL, NULL),
(2314, 'CHAVES', 'ANALIA ANDREA', 1, 27773002, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BARILOCHE Nro 2211', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2315, 'CHEUQUETA', 'MELODI MARIA DENIS', 1, 36433594, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TRIMARCO Nro 140', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2316, 'CHURY', 'JESSICA', 1, 33952805, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LIBERTAD Nro 336', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'PRI INC', NULL, NULL),
(2317, 'CIFUENTES', 'ELSA', 1, 5688171, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PERU/ALUMINE Nro 306', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2318, 'CISTERNA', 'MIRIAM MARCELINA', 1, 18194931, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TUCUMAN Nro 1410', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2319, 'COFRE', 'ISABEL CRISTINA', 1, 18722293, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B 180 VDAS MZ31 CS158', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2320, 'COLIPAN', 'MARIA MARCELA', 1, 27323638, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B VALENTINA NTE', 1, 1, '63A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2321, 'COÑAQUEO SEPULVEDA', 'ALICIA EVA', 1, 30403818, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MOSCONI PILAR 204', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2322, 'CONTRERAS', 'ARACELI DENISE', 1, 35313698, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VOLCAN LANIN CS17', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2323, 'CONTRERAS', 'NORMA', 1, 10287653, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VALENZUELA CS18', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2324, 'CORDERO', 'NORMA BEATRIZ', 1, 14649525, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIVADAVIA/CORDOBA Nro 297', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2325, 'CORONA STRADI', 'ANTONELLA', 1, 36435189, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELGRANO Nro 3800', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2326, 'CORREA', 'SILVANA BELEN', 1, 36150800, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PIRKER/RECONQUISTA MZ14B - Puerta: DX16', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2327, 'CORTINA', 'ALEJANDRA OLGA', 1, 16189910, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MUDON MK10 PS2 - Puerta: DP153', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2328, 'COTARO', 'SANDRA ELENA', 1, 22663449, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RECONQUISTA Nro 341', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2329, 'CRUAÑAS', 'SILVANA LIDIA', 1, 23169422, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO MOCORETA Nro 814', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2330, 'CUELLO', 'ROCIO BELEN', 1, 35464040, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHUBUT Nro 1112', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2331, 'CUMILAF', 'HAYDEE ALEJANDRA', 1, 31820015, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LZO MZ57 DX51', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2332, 'CUSINIER CRESPO', 'NATALIA JIMENA', 1, 33476890, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NOGOYA Nro 2265 - Puerta: CS9', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2333, 'DASSO', 'MARIA DEL CARMEN', 1, 14729775, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DEL TRABAJADOR Nro 1519', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ENFERME', NULL, NULL),
(2334, 'DE LA VEGA', 'ELBA RITA', 1, 10208105, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CASILDA Nro 992', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2335, 'DEL CAMPO', 'MARIA LETICIA', 1, 24924731, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GATICA Nro 1135', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2336, 'DELL\'ORO', 'GISELLA ALDANA', 1, 37781978, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CORDOBA Nro 290', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2337, 'DI CLERICO', 'EVA TERESA', 1, 10208233, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO CALEUFU MZ14 CS12 Nro 3860', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2338, 'DIAZ', 'CLAUDIA PATRICIA', 1, 20828103, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CORDOBA Nro 1265', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2339, 'DIAZ', 'MARIA ALEJANDRA', 1, 21750265, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PARAGUAY Nro 315', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2340, 'DIAZ', 'SOFIA AIDA', 1, 20117030, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AV MOSCONI Nro 690', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2341, 'DINAMARCA', 'ANA MARIA CONCEPCION', 1, 10595461, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AGUILA MZ Ñ CS2', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2342, 'DOMINGUEZ', 'GRACIELA', 7, 6368399, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LOS LIRIOS TO B 1D Nro 0', 1, 1, '1E', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2343, 'DUARTE', 'MARIA DOLORES MARGARITA', 1, 10044716, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PICARDI RAFAEL Nro 1490', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'PRF LET', NULL, NULL),
(2344, 'DUS', 'MARIA CECILIA', 1, 14942523, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PALPALA Nro 650', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2345, 'ELGUETA', 'MARILINA AILEN', 1, 37348730, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELGRANO Nro 3923', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2346, 'EPULEF', 'CLAUDIA ANDREA', 1, 28621195, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 9 G ALV DX276', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2347, 'ESCOBAR', 'GLADI NOEMI', 1, 10170278, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO CARCARAÑA Nro 783', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2348, 'ESPARZA', 'MARTA MARIA', 7, 4761143, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B EL TRIANGULO', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2349, 'ESPINOZA', 'CAROLINA ELISABETH', 1, 29919987, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NAVARRO Nro 1680', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'PROFESO', NULL, NULL),
(2350, 'ESTEVES', 'VERONICA SUYAI', 1, 22474901, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PICO TRUNCADO Nro 1078', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'INGENIE', NULL, NULL),
(2351, 'FAJINA', 'SANDRA ALEJANDRA', 1, 27496993, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B GIACHINO DP1 PB MOD E', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2352, 'FARO', 'BLANCA ERCILIA', 1, 5874490, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CARILAFQUEN LAGO MZ13 Nro 3858 - Puerta:   DP2', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2353, 'FERNANDEZ', 'BRUNILDA GUADALUPE', 1, 18534792, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'USPALLATA Nro 1397 - Puerta: DP2', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2354, 'FERNANDEZ', 'MARIA ALEJANDRA', 1, 31968201, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B NTRA ESPER MZ37 - Puerta: LT5', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2355, 'FERNANDEZ', 'SILVANA ELIZABETH', 1, 23713445, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'FLORES CS28', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2356, 'FERRADAS', 'SABRINA JULIA', 1, 35968251, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B V CEFERINO MZ109 LT20', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2357, 'FERREYRA', 'MAIRA NATALI', 1, 32779089, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B VALENTINA SUR MZ24 LT14', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2358, 'FIGUEROA', 'EDITH DEL CARMEN', 1, 20280305, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MELIPAL MZ18 MK16', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2359, 'FIGUEROA', 'SUSANA SILVIA', 1, 13863979, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TI G ENT7 PI1 DP A', 1, 1, '1F', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2360, 'FLORES', 'ANA MARIA', 1, 10422393, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BRENTANA Nro 546', 1, 1, '1D', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2361, 'FLORES', 'MARIA PATRICIA', 1, 13872851, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BERMUDAS Nro 65', 1, 1, '63A', NULL, NULL, NULL, NULL, NULL, 'PSICOLO', NULL, NULL),
(2362, 'FLORES JARPA', 'MARIA INES', 1, 36586619, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NEWBERY Nro 0', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2363, 'FORNERON', 'LAURA NOEMI', 1, 28623380, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COSTA RICA Nro 839', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2364, 'FREIJE', 'MARINA VANESA', 1, 27741051, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN PI1 DP A Nro 1450', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2365, 'FUENTEALBA', 'JUANA DE LA CRUZ', 1, 23247017, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CENTENO MZ24 C12 Nro 3657', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2366, 'FUENTES', 'GLORIA ESTELA', 1, 24180974, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B PQUE INDUSTRIAL MZ E2 - Puerta: CS15', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2367, 'FUENTES', 'ROSA ELENA', 1, 27526559, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LOC AÑELO', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'PENSION', NULL, NULL),
(2368, 'FURLAN', 'NORA ALICIA', 1, 11410798, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AMEGHINO Nro 1018', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2369, 'GALANTINI', 'LISA VALERIA', 1, 21734406, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PEHUEN PS1 DP8 Nro 1080', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2370, 'GALLARDO', 'ROSALIA NELIDA', 1, 16954491, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHILE Nro 455', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2371, 'GAMARRA', 'REGINA YOLA', 1, 16651041, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CASTELLI MZ16 CS9', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2372, 'GARCIA', 'AILEN TAMARA', 1, 34173902, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PIUQUEN Nro 684', 1, 1, '1E', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2373, 'GARCIA', 'HEBE AURORA', 1, 5190919, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ITALIA Nro 150', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2374, 'GARCIA', 'NATALIA ROMINA', 1, 28734559, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'C.CONFLUENCIA ALUMINE Nro 1268', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2375, 'GARCIA SAN MARTIN', 'KARIN ALEJANDRA', 1, 18850459, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TRAFUL LAGO Nro 1535', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2376, 'GARRIDO', 'MARGARITA DELICIA', 1, 37348773, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B EL MIRADOR', 8, NULL, '15', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2377, 'GASPART', 'GRETHEL SABRINA', 1, 37461544, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NOGOYA Nro 3491 - Puerta: CS26', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2378, 'GECAMBURU', 'MARIA ISABEL', 1, 24533881, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'S DEL ESTERO Nro 985', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2379, 'GHILINI', 'FLORENCIA', 1, 32844278, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NAHUEL Nro 10', 1, 1, '1E', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2380, 'GIMENEZ', 'KAREN MAGALI', 1, 35306978, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NORDENSTROM Nro 1668', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2381, 'GIUFRIDA', 'GABRIELA INES', 1, 29351376, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ROCA Nro 1327', 1, 1, '1D', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2382, 'GODOY VALDIVIESO', 'EDA MARIA', 1, 25462050, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PICUN LEUFU Nro 84 - Puerta: DX5', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'LIC PSI', NULL, NULL),
(2383, 'GOMEZ', 'GABRIELA', 1, 30231530, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CARRO ITTE Nro 1553', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2384, 'GOMEZ', 'NATALIA PILAR', 1, 30336260, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LORENZO MZ88 CS17', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2385, 'GONZALEZ', 'ADRIANA VANESA', 1, 33331986, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO COLORADO Nro 262', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2386, 'GONZALEZ', 'DIANA VERONICA', 1, 28586074, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'C PATAGONES/PICUNCHE MD1 - Puerta: DP3', 1, 1, '74A', NULL, NULL, NULL, NULL, NULL, 'PER MER', NULL, NULL),
(2387, 'GONZALEZ', 'LAURA ANALIA', 1, 24825437, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BEJARANO Nro 1441', 1, 1, '62', NULL, NULL, NULL, NULL, NULL, 'UNI COM', NULL, NULL),
(2388, 'GONZALEZ', 'MARIANELA', 1, 30640407, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NAMUNCURA CEFERINO Nro 330', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'PRF EDU', NULL, NULL),
(2389, 'GONZALEZ', 'PETRA', 1, 5169398, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ANTARTIDA ARGENTINA PI7 Nro 531 - Puerta: DP A', 1, 1, '1B', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2390, 'GONZALEZ', 'YANINA NOEMI', 1, 27644297, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'IBAÑEZ TTE PI7 C Nro 544', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2391, 'GOTFRIT', 'LUCIA IRENE', 1, 18294213, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LONDRES/DRURY', 1, 1, '62', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2392, 'GRISON', 'OLIVIA', 1, 33387443, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ARAUCARIA CS5', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2393, 'GUARDA', 'OLGA', 1, 5704863, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MILANESIO PADRE Nro 1634 - Puerta: CS11', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2394, 'GUERRERO', 'MARIA ROSA', 1, 28989236, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TRONADOR Nro 1800', 1, 1, '64', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2395, 'GUIÑEZ', 'ANDREA FABIANA', 1, 23494377, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MARONESSE IIET MZ23 DP1', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2396, 'GUTIERREZ', 'GLADYS MERCEDES', 1, 26854677, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CADIZ MZ E CS6 Nro 0', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2397, 'GUTIERREZ', 'ROMINA SOLEDAD', 1, 30740365, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 3 P IND ST B PT12 - Puerta: DX4', 1, 1, '1F', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2398, 'GUZMAN', 'LORENA AILEN', 1, 30055678, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAS HERAS Nro 124', 1, 1, '1D', NULL, NULL, NULL, NULL, NULL, 'PER MER', NULL, NULL),
(2399, 'HANZICH', 'PAMELA ANDREA', 1, 29092554, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SANTA FE 9P DP3 Nro 1191', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'LIC PSI', NULL, NULL),
(2400, 'HEREDIA', 'MARILU', 1, 31360434, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CATRIEL MZ6 LT9', 10, 8, '16A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2401, 'HERNANDEZ', 'CLELIA ROSALBA', 1, 27986925, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ESTADOS UNIDOS Nro 625', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2402, 'HERNANDEZ', 'MARIA LUISA', 1, 10597361, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PJE AGUADA SAN ROQUE', 8, NULL, '14', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2403, 'HERNANDEZ', 'YOHANA NOEMI', 1, 34866687, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CERRO BANDERA MZ15 CS14', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'PRI COM', NULL, NULL),
(2404, 'HERRERA', 'MARIANELA AILIN', 1, 34811072, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CABRERA V 18', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2405, 'HIDALGO', 'PAOLA EDITH', 1, 29154041, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DON BOSCO Nro 749', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2406, 'HUALLPA FLORES', 'JOHANA JUDIT', 1, 32292930, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B S LORENZO MZ35 CS21', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2407, 'HUENUHAN HUENUVAN', 'SUSANA ANDREA', 1, 31166328, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ECHEVERRIA ESTEBAN Nro 149', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2408, 'IACONO', 'ARIANA FLORENCIA', 1, 35165570, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SECCION CHACRAS 29A', 2, 2, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2409, 'IBARRA', 'MARIA DE LOS ANGELES', 1, 33047824, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 6 ALMAF MZ W LT17', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2410, 'INFANTE', 'CARLA SUYAI', 1, 32020802, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B VALENTINA SUR MZ M CS19', 1, 1, '63', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2411, 'INOSTROZA', 'SILVANA DEL CARMEN', 1, 25948871, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN Nro 211', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2412, 'ISLA', 'INGRID ELIZABETH', 1, 34439152, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COMPLEJO CHOCON MZ G10 - Puerta: LT10', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2413, 'JAMESON', 'MONICA NIDIA', 1, 10223935, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EDELMAN ANGEL Nro 364', 1, 1, '73', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2414, 'JARA', 'FLORENCIA FERNANDA', 1, 35165337, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAVALLE Nro 748', 3, NULL, '75', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2415, 'JARA', 'NILDA ROSALIA', 1, 20239044, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'URUGUAY Nro 595', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'PRF MUS', NULL, NULL),
(2416, 'JARAMILLO', 'MAIRA MELISA AILIN', 1, 36928440, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MANANTIAL DE VIDA CS43', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'SEC INC', NULL, NULL),
(2417, 'JIMENEZ ROSAS', 'AYELEN SORAYA', 1, 34486786, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VARVARCO Nro 309', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2418, 'JUAREZ', 'ADRIANA ANGELICA', 1, 30500362, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 34 G ALV CS47', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2419, 'KELER', 'MARIA DEL CARMEN', 1, 11233997, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN CARLOS Nro 666', 1, 1, '74', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2420, 'KRANEVITTER', 'ARACELI DEL CARMEN', 1, 22160021, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL CHOCON Nro 761', 5, 7, '6', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2421, 'LAGOS', 'ANA MARIA', 1, 18180219, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CORDOBA Nro 394', 1, 1, '1', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2422, 'LAINO', 'MARIA EVA', 1, 13047680, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PILHUE MK43 PB DP286', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2423, 'LARA', 'DANIELA PAOLA', 1, 26772153, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DR RAMON MZ7 DX27 Nro 5105', 1, 1, '62A', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2424, 'LARROCA', 'SUSANA ELSA', 1, 5309974, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CIPOLLETTI Nro 85', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2425, 'LAZARTE', 'NATALIA GRISELDA', 1, 27687651, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VILLAGUAY Nro 823', 1, 1, '1G', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2426, 'LEGUIZAMON', 'CLAUDIA BEATRIZ', 1, 29547757, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B LA MESETA MZ1 LT8', 1, 1, '1F', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2427, 'LEIVA', 'PAOLA MARILU', 1, 35165522, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B CTA DE REYES MZ C LT11', 3, NULL, '75', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2428, 'LEON', 'SILVIA EVA', 1, 10891205, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELMONTE Nro 965', 1, 1, '72', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2429, 'LEZCANO', 'FABIANA ELIZABETH', 1, 30956515, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LOS COPIHUES Nro 1064', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2430, 'LINARES', 'ALEJANDRA BEATRIZ', 1, 23001053, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DON QUIJOTE Nro 584', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2431, 'LIZANA', 'MERCEDES ALEJANDRA', 1, 18123174, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAT TORRES 262', 1, NULL, '64A', NULL, NULL, NULL, NULL, NULL, 'CHOFER', NULL, NULL),
(2432, 'LOBOS', 'DEBORA JACQUELINE', 1, 35492312, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ABRAHAM MZ12 CS18', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2433, 'LOPEZ', 'BEATRIZ AZUCENA', 1, 28180765, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PRINGLES MZ8 LT6 Nro 1275', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2434, 'LOPEZ', 'LILIAN GRACIELA', 1, 11397910, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ROCA CS23', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2435, 'LOPEZ', 'NATALIA NANCY', 1, 28557941, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B 107 VIV MZ14 CS2549', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2436, 'LOPEZ DIGON', 'VERONICA', 1, 29118443, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'JUSTO JUAN B.DX1 Nro 1550', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2437, 'LOYOLA', 'NANCY YANET', 1, 32710053, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MELIPAL MK29 MZ6 - Puerta: DP181', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2438, 'LUCINI', 'AGUSTINA ANTONELLA', 1, 36151189, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, '1 DE MAYO MK99 PI1 DP102 Nro 3381', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2439, 'LUNGO', 'ANDREA MARCELA', 1, 16696447, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAGOS DEL SUR Nro 114', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'GEOLOGO', NULL, NULL),
(2440, 'MADARIAGA', 'IRMA ALICIA', 1, 18509231, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL MANZANO Nro 1725', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2441, 'MALABE', 'SUSANA', 1, 14349955, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B P IND ST A CS3', 1, NULL, '1F', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2442, 'MALLEA', 'MARIA AURORA', 1, 16366352, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B UTEDIC MZ G CS14', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2443, 'MANONI', 'MARIA VIRGINIA', 1, 23384529, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BRENTANA Nro 37', 1, NULL, '1D', NULL, NULL, NULL, NULL, NULL, 'UNI COM', NULL, NULL),
(2444, 'MANTEGAZZA', 'IRMA ELVIRA', 1, 11265476, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B 140 VIV VAL SUR MZ8 - Puerta: CS12', 1, NULL, '63', NULL, NULL, NULL, NULL, NULL, 'PENSION', NULL, NULL),
(2445, 'MARDONE', 'SANDRA NOEMI', 1, 28982138, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CAMPORA PTE MZ388 LT15', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2446, 'MARIGUAN', 'MARTA GENOVEVA', 1, 16030697, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PROS POBLADORES Nro 449', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2447, 'MARINO', 'DEBORA AYELEN', 1, 33637182, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B Z1 MZ14 CS8', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2448, 'MARTIARENA', 'NATALI BELEN', 1, 36928488, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MUÑOZ MANUEL Nro 1320', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2449, 'MARTINEZ', 'AZUCENA FELISA', 1, 10599602, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CULTRUM DP20 Nro 1265', 1, NULL, '74', NULL, NULL, NULL, NULL, NULL, 'MEDICO', NULL, NULL),
(2450, 'MARTINEZ', 'JANET', 1, 22816588, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'JUAN PABLO II MZ394 LT16', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2451, 'MARTINEZ', 'MARTA ALICIA', 1, 17575479, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B 190 VIV VAL NTE MZ35 - Puerta: CS35', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2452, 'MARTINEZ', 'TAMARA DAIANA', 1, 36371052, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PEHUENCHES Nro 647', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2453, 'MASINI', 'LIDIA', 1, 4612102, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VARVARCO Nro 19', 10, NULL, '16A', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2454, 'MATUS', 'CECILIA ORNELLA', 1, 33952561, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TUPUNGATO Nro 1122', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2455, 'MAZZONI', 'PATRICIA VERONICA', 1, 33575907, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALCORTA Nro 606', 1, NULL, '1C', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2456, 'MEDORI', 'PAULA', 1, 36371996, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ALDERETE Nro 874', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2457, 'MELLADO', 'ANALIA BELEN', 1, 35079750, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BOLIVAR MZ218 LT18', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2458, 'MENA', 'AILEN LUCERO', 1, 24157860, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAS VIOLETAS Nro 1119', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'INS GIM', NULL, NULL),
(2459, 'MENDEZ', 'JUANA DEL CARMEN', 1, 23837598, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AMARANTE MZ L CS8', 1, NULL, '63', NULL, NULL, NULL, NULL, NULL, 'PER MER', NULL, NULL),
(2460, 'MENDEZ', 'VILMA LILIANA', 1, 30710456, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MILITAR B ROLDAN CS120', 1, NULL, '62', NULL, NULL, NULL, NULL, NULL, 'TER COM', NULL, NULL),
(2461, 'MENNA', 'GRACIELA SUSANA', 1, 22804484, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BS AS PS15 DP2 Nro 174', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2462, 'MERIÑO', 'ANDREA SANDRA', 1, 13660959, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B-AINIL ANDALUE C.211', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2463, 'MESTRES', 'MARTA DENIA', 1, 5878901, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COLOMBIA Nro 1477', 1, NULL, '74A', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2464, 'MILAGRANI', 'GLORIA NOEMI', 1, 10681300, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NICARAGUA Nro 197', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2465, 'MILLAQUEO', 'CLAUDIA MARCELA', 1, 29224894, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ESPEJO LAGO MZ E6 LT12', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2466, 'MIRANDA', 'MONICA NOEMI', 1, 12692181, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BLANCO Nro 1141', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2467, 'MOLINA', 'EVA ESTHER', 1, 17416428, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B S LORENZO M45 DX17', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2468, 'MOLINA SALGADO', 'CECILIA MERCEDES', 1, 32293263, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAGO NONTHUE Nro 2408', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'ENFERME', NULL, NULL),
(2469, 'MONSALVES', 'GRACIELA MIRIAN', 1, 13483695, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RODHE Nro 1012', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2470, 'MONTECINOS', 'TAMARA ROCIO BELEN', 1, 33952706, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MITRE Nro 1325', 1, NULL, '64A', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2471, 'MONTESINO', 'MARTA ANTONIA', 1, 16376290, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BUENOS AIRES Nro 719', 10, NULL, '16A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2472, 'MORA', 'ADRIANA VANESA', 1, 32577331, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, '126 VVDAS MZ A2 DX 33', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2473, 'MORAGA', 'ESTEFANIA CRISTINA', 1, 25860361, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN TI K DX7 Nro 2500', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL);
INSERT INTO `personas` (`idPersona`, `Apellido`, `Nombre`, `idTipoDocumento`, `DNI`, `Sexo`, `CUIL`, `FechaNacimiento`, `Nacionalidad`, `LugarNacimiento`, `Domicilio`, `idLocalidad`, `idCentroDistribucion`, `Circuito`, `CaracteristicaFijo`, `TelefonoFijo`, `CaracteristicaCelu`, `TelefonoCelular`, `CorreoElectronico`, `Profesion`, `Ocupacion`, `Observaciones`) VALUES
(2474, 'MORALES', 'MARGARITA DEL CARMEN', 1, 30059655, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TANUZ ORLANDO MZ G LT8', 3, NULL, '75', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2475, 'MORALES HANDZIAK', 'CARLA VALERIA', 1, 32778980, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'FIGUEROA DEL C. Nro 2467', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2476, 'MORENO', 'MARIA PAULA', 1, 25898153, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CODIGO 414 CS 224', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2477, 'MOSCOSO', 'CINTIA VANESA', 1, 35313563, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHUBUT CS29 Nro 0', 10, NULL, '16A', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2478, 'MOYANO', 'MAILEN ANYELEN', 1, 35865110, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AUCA MAHUIDA Nro 786', 10, NULL, '16A', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2479, 'MUÑOZ', 'ANALIA GABRIELA', 1, 23611947, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PALPALA Nro 620', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'PRENPRI', NULL, NULL),
(2480, 'MUÑOZ', 'FIAMA ANDREA', 1, 37767404, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B P INDUSTRIAL MZ E6 - Puerta: LT25', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'SEC INC', NULL, NULL),
(2481, 'MUÑOZ', 'MARIA DE LOS ANGELES', 1, 13970803, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'JUBILADOS NEUQUINOS MZ25 Nro 1331 - Puerta: CS18', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'EMP COM', NULL, NULL),
(2482, 'MUÑOZ', 'OLGA DEL CARMEN', 1, 23001122, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CNIA CONFL BORGES CS16', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2483, 'MUÑOZ FERNANDEZ', 'CAROLINA', 1, 36258100, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SOLDADO DESC. Nro 2044', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2484, 'NAHUEL', 'LIRIA JACINTA', 1, 28776032, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'IRIGOYEN Nro 416 - Puerta: 2E', 1, NULL, '1B', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2485, 'NARA', 'ALICIA', 1, 17250406, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SANTA CRUZ Nro 1395', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'EMPRESA', NULL, NULL),
(2486, 'NAVARRETE', 'MARIA REBECA', 1, 20606146, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ESTRADA MANUEL Nro 82', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'TEC DEN', NULL, NULL),
(2487, 'NAVARRO', 'TANIA GISELA ANGELA', 1, 27789794, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ELORDI Nro 324', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2488, 'NICOLAS', 'SILVIA KARINA', 1, 14848592, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PERTICONE Nro 2351', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2489, 'NOGUEIRA', 'CLARISA', 1, 24136309, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NORDENSTROM Nro 2216', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'CONTADO', NULL, NULL),
(2490, 'NUÑEZ', 'LINA EMILSE', 1, 25419795, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B RUCA NIYEU SAN LUIS Nro 55', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'TEC ADE', NULL, NULL),
(2491, 'OBREQUE', 'NOELIA GISEL', 1, 37175906, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'DR RAMON ST112 MZ D CS1', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2492, 'OJEDA', 'LAURA CAROLINA', 1, 34168519, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MITRE Nro 1128', 10, NULL, '16A', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(2493, 'OLEA', 'GABRIELA SUYAI', 1, 31528323, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN LUIS/CASTILLO Nro 1220', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2494, 'OLIVERA', 'MARIA BELEN', 1, 37806355, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MOREAU DE JUSTO Nro 2480', 1, NULL, '62', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2495, 'OPAZO', 'PAMELA NOELIA', 1, 30467493, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAS ROSAS CS14', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2496, 'ORELLANO', 'ELVIRA', 1, 4165101, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AUCA MAHUIDA Nro 580', 1, NULL, '62', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2497, 'ORTEGA', 'MARIA SUSANA', 1, 14761351, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 11 P IND TI C4 PI1 - Puerta: DP B', 1, NULL, '1F', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2498, 'ORTIZ', 'MARIA BELEN', 1, 35151619, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHACAY CS12', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2499, 'OSES', 'MARIA ALEJANDRA', 1, 22783864, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELISLE Nro 1625', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2500, 'OTERO', 'SANDRA PATRICIA', 1, 18395721, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO DIAMANTE Nro 667', 1, NULL, '74A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2501, 'OYOLA', 'MARIANA SOLEDAD', 1, 36371714, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B TOMA NORTE II MZ44 LT3', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2502, 'PAEZ', 'CYNTHIA ANAHI', 1, 32119487, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAVRON MZ 374A LT5', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2503, 'PAINE', 'SILVINA LAURA', 1, 24527656, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LIBERTAD Nro 432', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'MARTILL', NULL, NULL),
(2504, 'PALAVECINO', 'PATRICIA ALEJANDRA', 1, 24697808, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B AGUILA TI H CS7', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'TEC EL', NULL, NULL),
(2505, 'PANDOLFI', 'MELISA', 1, 36784398, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B BOCAHUE UF106', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2506, 'PARADA', 'MARIA ALEJANDRA', 1, 30001937, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'URQUIZA Nro 455', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2507, 'PAREDES', 'DANIELA MARIANA', 1, 29239602, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B BELEN MZ22 LT13', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2508, 'PARRA', 'CLAUDIA CRISTINA', 1, 21378448, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MARONESSE I MZ11 DX2', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'TER COM', NULL, NULL),
(2509, 'PARRA', 'ROSALIA ISABEL', 1, 28213565, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ITALIA Nro 3782', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2510, 'PATIÑO', 'TANIA LORENA', 1, 26543559, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALVUQUEO Nro 2181', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2511, 'PAZOS', 'MARINA ISABEL', 1, 34657463, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VTA HERMOSA MZ228 LT16', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2512, 'PEÑA', 'ANGELA EVELYN', 1, 33291657, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PRINGLES MZ3 CS17', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2513, 'PERALTA', 'ANGELA BELEN', 1, 34293317, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'QUILLEN CS17', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2514, 'PEREIRA', 'IVANNA CECILIA', 1, 28792593, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RUIVAL MANUEL Nro 1555', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2515, 'PEREZ', 'ALDANA LUCIA', 1, 36371553, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TIERRA DEL FUEGO Nro 1059', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2516, 'PEREZ', 'ISABEL', 1, 20565692, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EDELMAN Nro 136', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'LOCUTOR', NULL, NULL),
(2517, 'PEREZ', 'NOELIA MABEL', 1, 27196447, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B GRAN NQN NORTE MZ18 MK1 - Puerta: PB1', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'PER MER', NULL, NULL),
(2518, 'PEREZ OYARZUN', 'ANDREA NATALIA', 1, 34088060, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NOVELLA/CURRHUE Nro 1729 - Puerta: MZ6', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2519, 'PETTINEROLI', 'JULIA MARTA', 1, 13657494, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TARANTINO CARLOS Nro 2740', 1, NULL, '1E', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2520, 'PIEDRABUENA', 'MARIA TERESA', 1, 10820077, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LOS PIONEROS PT14 CS206', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2521, 'PINEDA', 'ERIKA MARIEL', 1, 22670533, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'IRIGOYEN Nro 803', 1, NULL, '1B', NULL, NULL, NULL, NULL, NULL, 'CONTADO', NULL, NULL),
(2522, 'PINO', 'MARIA ISABEL', 1, 21385953, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL CHOCON MZ H LT7 Nro 2400', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2523, 'PINTOS', 'MICAELA NORALY', 1, 35354819, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B 1099 VIV MK6 PB - Puerta: DP28', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2524, 'PLIEGER', 'HELGA ELIANA', 1, 24054788, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TUCUMAN Nro 645 - Puerta: 2P E', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(2525, 'POLONI', 'LARISA ERICA', 1, 36784434, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ACONCAGUA Nro 241', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2526, 'POPIC', 'TANIA NOEMI', 1, 31318290, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TALERO PI1 DP A Nro 454', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2527, 'PRADILLA', 'ARACELI FABIANA', 1, 21873428, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BORLENGHI Nro 215', 1, NULL, '74A', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2528, 'PUCHI', 'CRISTINA MARIELA', 1, 20935230, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COSTA RICA Nro 2129 - Puerta: CS27', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2529, 'PUSSETTO', 'SILVINA GABRIELA', 1, 25127717, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LELOIR PI3 DP C Nro 869', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'MEDICO', NULL, NULL),
(2530, 'QUEZADA', 'PATRICIA CRISTINA', 1, 16717344, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B VALENTINA SUR MZ7 LT8', 1, NULL, '63', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2531, 'QUINCHAO', 'IRMA SUSANA', 1, 28094807, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BRENTANA Nro 529', 1, NULL, '1D', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2532, 'QUINTEROS', 'ELSA DEL CARMEN', 1, 4975564, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAGO ESPEJO C404', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2533, 'QUIROGA', 'JUANA ERMELINDA', 1, 11431193, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LA PLATA Nro 830', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'PENSION', NULL, NULL),
(2534, 'RABOVICH', 'VIVIANA MARISOL', 1, 25216302, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LEGUIZAMON Nro 1794', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'TER COM', NULL, NULL),
(2535, 'RAMIREZ', 'DEBORA MAIRA', 1, 32021325, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CENTENO MARIO CS11', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2536, 'RAMIREZ', 'ROSALIA', 1, 17786409, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B TO UNION Y FUERZA MZ6 - Puerta: LT31', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2537, 'RAMS', 'CARINA ETEL', 1, 28160245, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PROS POBLADORES Nro 1050', 1, NULL, '64A', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2538, 'REBECO', 'MARIA ELENA', 1, 12828377, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LZO NORTE MZ57 DX13', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2539, 'RENDA', 'SILVIA LORENA', 1, 23918980, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COPAHUE Nro 380', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'UNI COM', NULL, NULL),
(2540, 'RETAMALES', 'VILMA VERONICA', 1, 22474964, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SUAREZ AMARANTO Nro 385', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2541, 'REYES', 'NOEMI BELEN', 1, 36606649, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B BELLA VISTA MZ534 - Puerta: LT12', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2542, 'RICO', 'MARIA CECILIA', 1, 29446591, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CARRO ITTE Nro 646', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2543, 'RIOS', 'DAIANA JANET', 1, 36955570, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NECOCHEA MZ82 DX14 Nro 1425', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'NIÑERA', NULL, NULL),
(2544, 'RIOSECO', 'DELMIRA', 1, 12210357, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MARTINEZ GREGORIO Nro 512', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2545, 'RIQUELME', 'ROMINA ESTHER', 1, 28160159, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COMAHUE Nro 1300', 1, NULL, '74', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2546, 'RIVAS', 'LUCIA ANTONELLA', 1, 37603190, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NOGOYA Nro 3516', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'SEC INC', NULL, NULL),
(2547, 'RIVERA', 'MONICA ISABEL', 1, 23038182, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LOS ALAMOS MZ A LT1', 2, NULL, '4A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2548, 'ROA', 'MONICA ESTER', 1, 23121746, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MORITAN/ASAMBLEA', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'SIN PRO', NULL, NULL),
(2549, 'ROCO', 'ESTELA MARILINA', 1, 25536150, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ZONA COSTA', 10, NULL, '16A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2550, 'RODRIGUEZ', 'DALMA ANTONELLA', 1, 38044736, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 15 G ALV TI45 PI2 - Puerta: DP741', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2551, 'RODRIGUEZ', 'LIDIA MONICA', 1, 13350587, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'IRIGOYEN Nro 590', 10, NULL, '16A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2552, 'RODRIGUEZ', 'MICAELA EUGENIA', 1, 35834352, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CUBA Nro 1829', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2553, 'RODRIGUEZ', 'SILVIA LILIANA', 1, 20133317, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'QUILLEN CS20', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2554, 'ROGER', 'MARTA LUCIANA', 1, 24398078, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CHOS MALAL Nro 266 - Puerta: DP A', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(2555, 'ROJAS', 'MARTHA RAMONA', 1, 6401033, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B FONAVI CS213', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2556, 'ROLDAN', 'ROBERTA', 1, 20814477, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PATQUIA Nro 1845', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2557, 'ROMERO', 'CELERINA LIBIA', 1, 11628268, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B TCI MZ L 27C', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2558, 'ROMERO', 'MARIELA ALEJANDRA', 1, 20436535, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MINAS/COMAHUE', 1, NULL, '74', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2559, 'ROS CROCITTO', 'ANDREA MARTHA', 1, 23384712, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CLUB E GOLF UF12', 7, NULL, '7C', NULL, NULL, NULL, NULL, NULL, 'ADM HOT', NULL, NULL),
(2560, 'ROSAS', 'MAYRA JULIETA', 1, 35571736, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'QUETRIHUE MZ1 CS335', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2561, 'ROZKIEWICZ', 'YANINA SORAYA ISABEL', 1, 33275172, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ASMAR Nro 480', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2562, 'RUIZ', 'ADRIANA BEATRIZ', 1, 17592100, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN TI E DX5 Nro 2200', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2563, 'RUIZ BOBADILLA', 'PATRICIA FERNANDA', 1, 32021204, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COLIHUE MZ E4 Nro 2638', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'TER INC', NULL, NULL),
(2564, 'SAAVEDRA', 'PAMELA ANDREA', 1, 35571722, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELISLE Nro 1824', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2565, 'SAEZ', 'MARIA PAOLA', 1, 27789914, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN Nro 28', 3, NULL, '75', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2566, 'SALAMANCA', 'MARIANA VERONICA', 1, 31530489, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NORDENSTROM - Puerta: CS216', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2567, 'SALAZAR', 'FABIANA ANDREA', 1, 28705042, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'BELISLE Nro 1958', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'PER MER', NULL, NULL),
(2568, 'SALGADO', 'DANIELA MARIA', 1, 35313626, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'RIO LIMAY MZ A1 LT2', 9, NULL, '15A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2569, 'SALOMONSOHN', 'IRENE GUILLERMINA', 1, 12065154, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NOGOYA Nro 3993', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2570, 'SAMBUEZA', 'VANESA ALEJANDRA', 1, 28443471, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'NEHUEN MZ3 CS27', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2571, 'SAN MARTIN', 'SUSANA LORENA', 1, 24054893, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL CHOCON Nro 789', 1, NULL, '74', NULL, NULL, NULL, NULL, NULL, 'BACHILL', NULL, NULL),
(2572, 'SANCHEZ', 'GLADYS SEBASTIANA', 1, 17672834, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL TREBOL Nro 5550', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2573, 'SANCHEZ', 'NAZARET INES', 1, 29407796, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MISIONES Nro 609', 10, NULL, '16A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2574, 'SANDOBAL', 'MARTA FLOR', 1, 13837660, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 11 G ALV CS71', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2575, 'SANDOVAL', 'MARIANA DEL CARMEN', 1, 20606163, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'S DEL ESTERO Nro 715', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2576, 'SANHUEZA', 'BETSY ROSEMARY MARGARET', 1, 17018856, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, '1 DE MAYO MZ4 CS52', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'CONTADO', NULL, NULL),
(2577, 'SANTILLAN', 'CECILIA GRISELDA', 1, 13079698, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ABRAHAM/ALUNEY MK8 3P - Puerta: DP126', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2578, 'SARLI', 'ADELA BEATRIZ', 1, 11719764, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COPIHUE Nro 111', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'MEDICO', NULL, NULL),
(2579, 'SCARIONE', 'STELLA MARIS', 1, 31640398, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COLIHUE MZ1 LT3 A', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2580, 'SCHWINDT', 'ERICA', 1, 25725680, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'J B JUSTO PI5 DP D Nro 438', 1, NULL, '1B', NULL, NULL, NULL, NULL, NULL, 'PSICOLO', NULL, NULL),
(2581, 'SEGUEL GUTIERREZ', 'GISELLE ALEJANDRA', 1, 33917473, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ARABARCO MZ120 LT28 Nro 0', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2582, 'SEPULVEDA', 'CARMEN ALICIA', 1, 4975485, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PUESTO LARA', 10, NULL, '16A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2583, 'SEPULVEDA', 'MARIA DEL CARMEN', 1, 20960374, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'URUGUAY Nro 843', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2584, 'SEPULVEDA CARRASCO', 'BARBARA PAOLA', 1, 35311433, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ITALIA MZ E CS2', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2585, 'SIDES', 'CAROLINA SILVANA', 1, 32922172, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN JAVIER Nro 424', 1, NULL, '63', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2586, 'SILVA', 'LUCIANA', 1, 26690258, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PERCY CLARCK Nro 1356', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2587, 'SINCOSKY', 'BERTA', 7, 4202055, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SARMIENTO Nro 680', 1, NULL, '1C', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2588, 'SOLIS', 'ANA SONIA', 1, 31965493, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B MELIPAL MZ W CS60', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2589, 'SORIA', 'MARIA EUGENIA', 1, 20501682, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MATHEU Nro 335 - Puerta: DX4', 1, NULL, '1B', NULL, NULL, NULL, NULL, NULL, 'PER MER', NULL, NULL),
(2590, 'SOSA', 'NATALIA EDITH', 1, 24109617, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, '9 DE JULIO Nro 35', 1, NULL, '1B', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2591, 'SOTO', 'DEOLINDA DEL CARMEN', 1, 23948769, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B ST PEUMAYEN MZ65 LT13', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2592, 'SOTO', 'NIBIA DE LOURDES', 1, 24700640, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B KARTODROMO MZ1 MK3 DP2', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2593, 'SPAGNUOLO', 'CATALINA MARTA', 1, 4453700, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ROCA Nro 1485', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2594, 'STORTINI', 'JIMENA PAULA', 1, 27107446, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LELOIR/ILLIA - Puerta: CS129', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'CONTADO', NULL, NULL),
(2595, 'SUAZO', 'CARLA JULIETA', 1, 22586436, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SIERRA GRANDE Nro 920', 1, NULL, '74', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2596, 'TAGLIAPIETRA', 'DAIANA KARINA', 1, 35492229, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'QUIROGA Nro 554', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2597, 'TAPIA', 'MARIA CRISTINA', 1, 22474354, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B CUENCA XV MZD1 CS11', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2598, 'TARIFEÑO', 'MARIA EUGENIA', 1, 29235101, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'COLIHUE Nro 1476', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2599, 'TEMI', 'DELIA DEL CARMEN', 1, 5288783, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LELOIR PI1 DP H Nro 231', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2600, 'TITTON', 'NELIDA SILVIA DEL HUERTO', 1, 12814856, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 6 ALMAFUERTE MZ F - Puerta: LT3', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2601, 'TONELLI', 'GLADIS', 1, 10432202, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ANT ARGENTINA Nro 1076', 1, NULL, '1D', NULL, NULL, NULL, NULL, NULL, 'PROFESO', NULL, NULL),
(2602, 'TORRES', 'DANIELA CAROLINA', 1, 32037023, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ABELLI/CAMPILLO', 1, NULL, '1E', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2603, 'TORRES', 'NOEMI EMILCE', 1, 27646258, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B TOMA NORTE MZ6 LT5', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2604, 'TOSSEN', 'CLAUDIA ALEJANDRA', 1, 27646247, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GOMEZ CASIMIRO MZ78 CS4', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2605, 'TRIPAILAF', 'UBERLINDA DEL CARMEN', 1, 11431090, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B COL SAN FCO O KM1250', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2606, 'TRONCOSO CARES', 'MIRELLA DEL CARMEN', 1, 18791122, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CERROS COLORADOS Nro 363', 1, NULL, '73', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2607, 'ULIARTE QUIROGA', 'PAMELA FLORENCIA', 1, 33444892, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MAZZONI PEDRO Nro 830', 1, NULL, '64A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2608, 'URETA', 'GRACIELA IRLANDA', 1, 13456278, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN Nro 15', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'PER MER', NULL, NULL),
(2609, 'URRUTIA', 'FATIMA NOEMI', 1, 29312139, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SALVADOR 479 /SGO.DEL EST - Puerta: ERO', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2610, 'VALDEBENITO', 'MARIA VICTORIA', 7, 5630730, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'PEÑALOZA MZ10 CASA 17', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2611, 'VALEIRAS', 'MARIA DEL CARMEN', 1, 12066262, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CALLE 5 G ALV TI3 PI2 - Puerta: DP119', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'JUBILAD', NULL, NULL),
(2612, 'VALENZUELA', 'STELLA MARIS', 1, 14349610, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ITALIA Nro 4366', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'PENSION', NULL, NULL),
(2613, 'VALLEJOS', 'ROXANA MARLENE', 1, 34662585, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN CS11 Nro 3700', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2614, 'VARGAS', 'CEFERINA INES', 1, 18052046, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SAN MARTIN', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2615, 'VASQUEZ', 'MIRNA ADRIANA', 1, 31530197, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, '20 DE JUNIO Nro 198', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2616, 'VAZQUEZ', 'GRECIA ELIZABETH', 1, 37101003, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'VERZEGNAZZI Nro 621 - Puerta:   DP7', 1, NULL, '74', NULL, NULL, NULL, NULL, NULL, 'UNI INC', NULL, NULL),
(2617, 'VAZQUEZ', 'SILVIA CRISTINA', 1, 16671594, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B SAN LORENZO MZ23 DX48', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'QUEHAC.', NULL, NULL),
(2618, 'VEGA', 'OLGA INES', 1, 21916201, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SANTIAGO DEL ESTERO Nro 108 - Puerta: DP 3B', 1, NULL, '1B', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2619, 'VELAZQUEZ', 'MARGARITA ELIDA', 1, 6490197, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'CUYO MZ G CS6', 1, NULL, '63', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2620, 'VERA', 'ADRIANA ISABEL', 1, 27377455, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ZABALETA Nro 220', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2621, 'VERDUGO', 'INES SUSANA', 1, 14024501, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, '9 DE JULIO Nro 0', 5, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'ESTUDIA', NULL, NULL),
(2622, 'VEZZONI', 'MARIA CRISTINA', 1, 28694994, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'B S LZO NTE MZ75 DX25', 1, NULL, '62A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2623, 'VIDELA', 'CINTIA YANET', 1, 30001962, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'MOQUEHUE Nro 994', 1, NULL, '64', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2624, 'VILCHE', 'SILVINA MARIA', 1, 28398289, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ORTEGA Y GASSET Nro 3545', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'UNI COM', NULL, NULL),
(2625, 'VILLAGRAN', 'MARIA ALEJANDRA', 1, 23494593, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ELORDI Nro 1885', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2626, 'VILLAR', 'DELIA SUSANA', 1, 11339492, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'AGUILERA LORENZA/PILAR - Puerta: CS42', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'PENSION', NULL, NULL),
(2627, 'VILLEGAS', 'ANDREA BEATRIZ', 1, 26357488, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'EL NIHUIL Nro 771', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2628, 'VIÑALES', 'LILIANA BEATRIZ', 1, 11049589, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'ITALIA Nro 241 - Puerta: 0.041666666666667', 1, NULL, '1B', NULL, NULL, NULL, NULL, NULL, 'COMERCI', NULL, NULL),
(2629, 'VIVEROS', 'MONICA ETHEL', 1, 18180477, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'GARCIA AURELIO Nro 3435', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'TER COM', NULL, NULL),
(2630, 'WHARTON', 'LILIANA MARGARITA', 1, 20436610, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAPRIDA Nro 782', 6, NULL, '7', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2631, 'YAROSUK', 'CLARA ELISABET', 1, 18649969, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LINCOLN ABRAHAM Nro 819', 1, NULL, '72', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2632, 'ZALAZAR', 'ESTELA EVANGELINA', 1, 22619203, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'LAS HERAS Nro 46', 2, NULL, '4', NULL, NULL, NULL, NULL, NULL, 'UNI COM', NULL, NULL),
(2633, 'ZAPATA', 'ADRIANA DEL VALLE', 1, 27698588, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'TRONADOR Nro 221', 1, NULL, '64A', NULL, NULL, NULL, NULL, NULL, 'A/C', NULL, NULL),
(2634, 'ZARATE', 'DANIELA NATALIA', 1, 28989006, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'QUIROGA Nro 965', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'EMPLEAD', NULL, NULL),
(2635, 'ZOIA', 'MARIA GABRIELA', 1, 18129073, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'SARMIENTO Nro 71', 10, NULL, '16A', NULL, NULL, NULL, NULL, NULL, 'SEC COM', NULL, NULL),
(2636, 'ZUÑIGA', 'MARIELA IRENE', 1, 18279175, 'F', NULL, '1980-09-18 00:00:00', NULL, NULL, 'L AGUILERA CS12', 1, NULL, '1G', NULL, NULL, NULL, NULL, NULL, 'DOCENTE', NULL, NULL),
(2637, 'ABALO', 'VIRGINIA ESTELA', 1, 6284773, 'F', '', '1980-09-18 00:00:00', '', '', 'LAGO QUILLEN Nro 1427', 1, NULL, '74A', NULL, '', NULL, '', '', 'A/C', '', NULL),
(2638, 'ACARICIA', 'PATRICIA ELEA', 1, 20449177, 'F', '', '1980-09-18 00:00:00', '', '', 'EE UU MZ37 LT2', 2, NULL, '4', NULL, '', NULL, '', '', 'QUEHAC.', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaseleccion`
--

CREATE TABLE `personaseleccion` (
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
  `psnrobolilla` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personaseleccion`
--

INSERT INTO `personaseleccion` (`idPersona`, `idseleccion`, `psnroordenseleccion`, `psexcusacion`, `psrecusacioncausa`, `pscaracter`, `psasiste`, `psasisteobservacion`, `psobservacion`, `idtiposeleccionrecusacion`, `idpersonaseleccionresultadotipos`, `idjuicio`, `psnrojurado`, `psfechaexcusacion`, `idLote`, `psfechaseleccion`, `psfechafinseleccion`, `psnrobolilla`) VALUES
(1932, 39, 1, '', '', '', NULL, '', '', NULL, NULL, 10, NULL, '2017-03-27 18:23:18', 10, '2017-03-27', '2020-03-27', NULL),
(1933, 37, 1, '', '', '', NULL, '', '', NULL, NULL, 4, NULL, '2017-03-22 13:36:56', 10, '2017-03-22', '2020-03-22', 1),
(1935, 36, 1, '', '', '', NULL, '', '', NULL, NULL, 3, NULL, '2017-03-22 13:35:34', 10, '2017-03-22', '2020-03-22', 2),
(1936, 39, 2, '', '', '', NULL, '', '', NULL, NULL, 10, NULL, '2017-03-27 18:23:18', 10, '2017-03-27', '2020-03-27', NULL),
(1956, 40, 4, '', '', '', NULL, '', '', NULL, NULL, 8, NULL, '2017-03-27 18:29:46', 13, '2017-03-27', '2020-03-27', 20),
(1960, 41, 3, '', '', '', NULL, '', '', NULL, NULL, 8, NULL, '2017-03-27 18:30:20', 13, '2017-03-27', '2020-03-27', 23),
(2010, 42, 3, '', '', '', NULL, '', '', NULL, NULL, 11, NULL, '2017-03-27 18:33:27', 13, '2017-03-27', '2020-03-27', 72),
(2080, 40, 3, '', '', '', NULL, '', '', NULL, NULL, 8, NULL, '2017-03-27 18:29:46', 13, '2017-03-27', '2020-03-27', 144),
(2106, 38, 1, '', '', '', NULL, '', '', NULL, NULL, 7, NULL, '2017-03-22 13:38:29', 13, '2017-03-22', '2020-03-22', 172),
(2166, 42, 4, '', '', '', NULL, '', '', NULL, NULL, 11, NULL, '2017-03-27 18:33:27', 13, '2017-03-27', '2020-03-27', 225),
(2176, 41, 4, '', '', '', NULL, '', '', NULL, NULL, 8, NULL, '2017-03-27 18:30:20', 13, '2017-03-27', '2020-03-27', 236),
(2279, 31, 2, 'rrr', 'zcxzc', 'cxcxzc', NULL, 'czxcxzc', 'czxczxc', 2, 2, 1, 2, '2017-03-13 20:40:58', 13, '2017-03-13', '2020-03-13', 48),
(2293, 41, 1, '', '', '', NULL, '', '', NULL, NULL, 8, NULL, '2017-03-27 18:30:20', 13, '2017-03-27', '2020-03-27', 61),
(2318, 42, 1, '', '', '', NULL, '', '', NULL, NULL, 11, NULL, '2017-03-27 18:33:27', 13, '2017-03-27', '2020-03-27', 85),
(2354, 41, 2, '', '', '', NULL, '', '', NULL, NULL, 8, NULL, '2017-03-27 18:30:20', 13, '2017-03-27', '2020-03-27', 121),
(2359, 31, 1, 'rrrr', 'r', 'r', NULL, 'r', 'r', 2, 3, 1, 3, '2017-03-13 20:40:58', 13, '2017-03-13', '2020-03-13', 128),
(2366, 42, 2, '', '', '', NULL, '', '', NULL, NULL, 11, NULL, '2017-03-27 18:33:27', 13, '2017-03-27', '2020-03-27', 130),
(2405, 32, 1, '', '', '', NULL, '', '', NULL, NULL, 2, NULL, '2017-03-22 13:21:08', 13, '2017-03-22', '2020-03-22', 172),
(2410, 40, 1, '', '', '', NULL, '', '', NULL, NULL, 8, NULL, '2017-03-27 18:29:46', 13, '2017-03-27', '2020-03-27', 176),
(2423, 40, 2, '', '', '', NULL, '', '', NULL, NULL, 8, NULL, '2017-03-27 18:29:46', 13, '2017-03-27', '2020-03-27', 188);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaselecciondocumento`
--

CREATE TABLE `personaselecciondocumento` (
  `idpersonaselecciondocumento` int(11) NOT NULL,
  `psddescripcion` text NOT NULL,
  `psdfechafin` datetime NOT NULL,
  `psdarchivo` text NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idseleccion` int(11) NOT NULL,
  `idpersonaselecciondocumentotipos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaselecciondocumentotipos`
--

CREATE TABLE `personaselecciondocumentotipos` (
  `idpersonaselecciondocumentotipos` int(11) NOT NULL,
  `psdtdescripcion` varchar(150) NOT NULL,
  `psdtactivo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `personaseleccionresultadotipos` (
  `idpersonaseleccionresultadotipos` int(11) NOT NULL,
  `psrtdescripcion` varchar(50) NOT NULL,
  `psrtactivo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Estructura de tabla para la tabla `plantillas`
--

CREATE TABLE `plantillas` (
  `idPlantilla` int(11) NOT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `FHAlta` datetime DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantillas`
--

INSERT INTO `plantillas` (`idPlantilla`, `Descripcion`, `FHAlta`, `Login`) VALUES
(7, 'Jurados Populares Lote 2014', '2015-02-11 18:08:15', 'sroa'),
(8, 'Declaracion Jurada 2015', '2015-02-12 11:35:09', 'sroa'),
(9, 'adasdasd', '2017-02-20 18:24:54', 'sroa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantillas_preguntas`
--

CREATE TABLE `plantillas_preguntas` (
  `idPP` int(11) NOT NULL,
  `idPlantilla` int(11) DEFAULT NULL,
  `idPregunta` int(11) DEFAULT NULL,
  `Orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantillas_preguntas`
--

INSERT INTO `plantillas_preguntas` (`idPP`, `idPlantilla`, `idPregunta`, `Orden`) VALUES
(35, 7, 11, 16),
(36, 7, 7, 12),
(37, 7, 8, 13),
(38, 7, 9, 14),
(39, 7, 10, 15),
(40, 8, 12, 12),
(41, 8, 13, 13),
(42, 8, 14, 14),
(43, 8, 10, 18),
(44, 8, 11, 19),
(45, 8, 15, 15),
(46, 8, 16, 16),
(47, 8, 17, 17),
(48, 8, 20, 20),
(49, 8, 21, 21),
(50, 8, 22, 22),
(51, 8, 23, 23),
(52, 8, 24, 24),
(53, 8, 25, 25),
(54, 8, 26, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `idPregunta` int(11) NOT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `idTipoRespuesta` int(11) DEFAULT NULL,
  `FHAlta` datetime DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`idPregunta`, `idCategoria`, `Descripcion`, `idTipoRespuesta`, `FHAlta`, `Login`) VALUES
(7, 4, '¿Tiene Usted ente veintiuno (21) y setenta y cinco (75) años de edad?', 1, '2015-02-11 18:02:12', 'sroa'),
(8, 4, 'Vive usted en el mismo domicilio indicado en el punto 8. hace mas de dos años?', 1, '2015-02-11 18:05:51', 'sroa'),
(9, 4, 'En caso de haber respondido que no en la pregunta anterior, señale el lugar donde vivia con anterioridad', 2, '2015-02-11 18:06:36', 'sroa'),
(10, 5, 'Es usted abogado/a?', 1, '2015-02-11 18:07:12', 'sroa'),
(11, 5, 'Es usted gobernador, vicegobernador, ministro, titular del Poder Ejecutivo', 1, '2015-02-11 18:07:48', 'sroa'),
(12, 4, 'Tiene usted entre veintiuno (21) y setenta y cinco (75) años de edad? (Elija lo que corresponda)', 1, '2015-02-12 11:36:54', 'sroa'),
(13, 4, 'Vive Ud. en el domicilio indicado en el punto 8. hace mas de dos años? (Elija lo que corresponda)', 1, '2015-02-12 11:38:04', 'sroa'),
(14, 4, 'En caso de haber respondido que no en la pregunta anterior, señale el lugar donde vivía con anterioridad', 2, '2015-02-12 11:38:50', 'sroa'),
(15, 4, '¿Cuál es su ocupación principal?', 2, '2015-02-12 11:39:26', 'sroa'),
(16, 4, '¿Trabaja? (Elija lo que corresponda)', 1, '2015-02-12 11:39:41', 'sroa'),
(17, 4, 'Indique domicilio laboral', 2, '2015-02-12 11:39:55', 'sroa'),
(18, 5, '¿Es usted abogado/a? (Elija lo que corresponda)', 1, '2015-02-12 11:40:39', 'sroa'),
(19, 5, '¿Es usted gobernador, vicegobernador, ministro, titular del Poder Ejecutivo comunal? (Elija lo que corresponda)', 1, '2015-02-12 11:41:06', 'sroa'),
(20, 5, '¿Es usted funcionario auxiliar del Poder Judicial, del Ministerio Público Fiscal, de la Defensa Pública? (Elija lo que corresponda)', 1, '2015-02-12 11:41:37', 'sroa'),
(21, 5, '¿Es usted miembro en servicio activo de las Fuerzas Armadas o de Seguridad, de la Policía Provincial o Nacional? (Elija lo que corresponda)', 1, '2015-02-12 11:42:25', 'sroa'),
(22, 5, '¿Es usted ministro de algún culto religioso? (Elija lo que corresponda)', 1, '2015-02-12 11:42:42', 'sroa'),
(23, 5, '¿Ha sido usted condenado a pena privativa de la libertad por delito doloso? (Elija lo que corresponda)', 1, '2015-02-12 11:43:02', 'sroa'),
(24, 5, '¿Se encuentra usted sometido a proceso penal en trámite? (Elija lo que corresponda)', 1, '2015-02-12 11:43:29', 'sroa'),
(25, 5, '¿Tiene usted algún problema físico o psíquico que podría impedirle el desempeño de la función de jurado popular? Ejercer la función de jurado popular implica estar presente, sentado/a en una sala, en forma permanente en una audiencia durante varias horas; si tuviera alguna afección que le impida la permanencia, aquí debe responder en forma afirmativa. (Elija lo que corresponda)', 1, '2015-02-12 11:45:10', 'sroa'),
(26, 5, 'Si en la pregunta anterior respondió que sí, consigne a continuación de que problema físico o psíquico se trata. Deberá acompañar documentación médica que acredite dicha situación.', 2, '2015-02-12 11:46:29', 'sroa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `idRespuesta` int(11) NOT NULL,
  `idLP` int(11) DEFAULT NULL,
  `idPregunta` int(11) DEFAULT NULL,
  `Respuesta` varchar(500) DEFAULT NULL,
  `FH` datetime DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`idRespuesta`, `idLP`, `idPregunta`, `Respuesta`, `FH`, `Login`) VALUES
(1, 5766, 12, 'Si', '2015-11-24 17:48:51', 'sroa'),
(2, 5766, 13, 'Si', '2015-11-24 17:48:51', 'sroa'),
(3, 5766, 14, '', '2015-11-24 17:48:51', 'sroa'),
(4, 5766, 10, 'No', '2015-11-24 17:48:51', 'sroa'),
(5, 5766, 11, 'No', '2015-11-24 17:48:51', 'sroa'),
(6, 5767, 12, 'Si', '2015-11-25 17:56:06', 'sroa'),
(7, 5767, 13, 'Si', '2015-11-25 17:56:06', 'sroa'),
(8, 5767, 14, '', '2015-11-25 17:56:06', 'sroa'),
(9, 5767, 10, 'No', '2015-11-25 17:56:06', 'sroa'),
(10, 5767, 11, 'No', '2015-11-25 17:56:06', 'sroa'),
(11, 5768, 12, 'Si', '2015-11-25 18:00:30', 'sroa'),
(12, 5768, 13, 'No', '2015-11-25 18:00:30', 'sroa'),
(13, 5768, 14, '', '2015-11-25 18:00:30', 'sroa'),
(14, 5768, 10, 'No', '2015-11-25 18:00:30', 'sroa'),
(15, 5768, 11, 'No', '2015-11-25 18:00:30', 'sroa'),
(16, 6066, 12, 'Si', '2015-11-26 13:52:31', 'sroa'),
(17, 6066, 13, 'No', '2015-11-26 13:52:31', 'sroa'),
(18, 6066, 14, 'gfdg dfgdfgdfg', '2015-11-26 13:52:31', 'sroa'),
(19, 6066, 10, 'Si', '2015-11-26 13:52:31', 'sroa'),
(20, 6066, 11, 'No', '2015-11-26 13:52:31', 'sroa'),
(21, 6265, 12, 'Si', '2015-11-26 13:54:52', 'sroa'),
(22, 6265, 13, 'Si', '2015-11-26 13:54:52', 'sroa'),
(23, 6265, 14, '', '2015-11-26 13:54:52', 'sroa'),
(24, 6265, 10, 'No', '2015-11-26 13:54:52', 'sroa'),
(25, 6265, 11, 'No', '2015-11-26 13:54:52', 'sroa'),
(26, 6264, 12, 'Si', '2015-11-26 14:47:29', 'sroa'),
(27, 6264, 13, 'Si', '2015-11-26 14:47:29', 'sroa'),
(28, 6264, 14, '', '2015-11-26 14:47:29', 'sroa'),
(29, 6264, 10, 'No', '2015-11-26 14:47:29', 'sroa'),
(30, 6264, 11, 'No', '2015-11-26 14:47:29', 'sroa'),
(31, 6771, 12, 'Si', '2016-02-22 11:15:59', 'sroa'),
(32, 6771, 13, 'Si', '2016-02-22 11:15:59', 'sroa'),
(33, 6771, 14, '', '2016-02-22 11:15:59', 'sroa'),
(34, 6771, 10, 'No', '2016-02-22 11:15:59', 'sroa'),
(35, 6771, 11, 'No', '2016-02-22 11:15:59', 'sroa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seleccion`
--

CREATE TABLE `seleccion` (
  `idseleccion` int(11) NOT NULL,
  `sefecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seleccion`
--

INSERT INTO `seleccion` (`idseleccion`, `sefecha`) VALUES
(11, '2017-03-10 20:13:44'),
(12, '2017-03-13 14:14:06'),
(13, '2017-03-13 14:28:38'),
(14, '2017-03-13 15:37:19'),
(15, '2017-03-13 15:39:17'),
(16, '2017-03-13 15:46:34'),
(17, '2017-03-13 15:48:40'),
(18, '2017-03-13 15:50:04'),
(19, '2017-03-13 15:50:46'),
(20, '2017-03-13 15:51:33'),
(21, '2017-03-13 15:51:35'),
(22, '2017-03-13 15:52:11'),
(23, '2017-03-13 15:53:16'),
(24, '2017-03-13 15:53:32'),
(25, '2017-03-13 15:54:25'),
(26, '2017-03-13 16:02:44'),
(27, '2017-03-13 16:03:18'),
(28, '2017-03-13 18:46:56'),
(29, '2017-03-13 19:41:58'),
(30, '2017-03-13 20:39:46'),
(31, '2017-03-13 20:40:58'),
(32, '2017-03-22 13:21:08'),
(33, '2017-03-22 13:27:45'),
(34, '2017-03-22 13:33:35'),
(35, '2017-03-22 13:34:33'),
(36, '2017-03-22 13:35:34'),
(37, '2017-03-22 13:36:56'),
(38, '2017-03-22 13:38:29'),
(39, '2017-03-27 18:23:18'),
(40, '2017-03-27 18:29:46'),
(41, '2017-03-27 18:30:20'),
(42, '2017-03-27 18:33:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumentos`
--

CREATE TABLE `tipodocumentos` (
  `idTipoDocumento` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipodocumentos`
--

INSERT INTO `tipodocumentos` (`idTipoDocumento`, `Descripcion`) VALUES
(1, 'DNI'),
(7, 'L');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoimpedimentos`
--

CREATE TABLE `tipoimpedimentos` (
  `idTipoImpedimento` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Sistema` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipoimpedimentos`
--

INSERT INTO `tipoimpedimentos` (`idTipoImpedimento`, `Descripcion`, `Sistema`) VALUES
(1, 'No Se Notificó', 1),
(2, 'No se recepcionó la declaración jurada', 1),
(3, 'Impedimiento Médico', 0),
(4, 'Residencia en el Exterior', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporespuestas`
--

CREATE TABLE `tiporespuestas` (
  `idTipoRespuesta` int(11) NOT NULL,
  `TipoRespuesta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tiporespuestas`
--

INSERT INTO `tiporespuestas` (`idTipoRespuesta`, `TipoRespuesta`) VALUES
(1, 'Si/No'),
(2, 'Texto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporesultadonotificacion`
--

CREATE TABLE `tiporesultadonotificacion` (
  `idTipoResultado` int(11) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposeleccionrecusacion`
--

CREATE TABLE `tiposeleccionrecusacion` (
  `idtiposeleccionrecusacion` int(11) NOT NULL,
  `trsdescripcion` varchar(100) NOT NULL,
  `trsactivo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposeleccionrecusacion`
--

INSERT INTO `tiposeleccionrecusacion` (`idtiposeleccionrecusacion`, `trsdescripcion`, `trsactivo`) VALUES
(1, 'Fiscalia', 1),
(2, 'Defensa', 1),
(3, 'Querella', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Clave` varchar(100) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `FechaAlta` date NOT NULL,
  `Activo` tinyint(1) NOT NULL DEFAULT '1',
  `FechaBaja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `Usuario`, `Clave`, `idPerfil`, `Apellido`, `Nombre`, `FechaAlta`, `Activo`, `FechaBaja`) VALUES
(1, 'sroa', 'd1d1e36bc17e3d304e1be39c6f50c1be32e81c13', 1, 'Roa', 'Silvina', '2015-01-09', 1, NULL),
(2, 'aadd', '64df017d1851e7220149c21bdeaadbc8d670fa6a', 2, 'aaaa', 'aaaa', '2015-10-14', 0, '2015-10-14'),
(3, 'fdsf', '5d559c91fd418e97e1ec3d5fd858d6bc1bf92084', 1, 'rwerwer wewer', 'tertre tertert', '2015-10-14', 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `centrodistribucion`
--
ALTER TABLE `centrodistribucion`
  ADD PRIMARY KEY (`idCentroDistribucion`),
  ADD KEY `idLocalidad` (`idLocalidad`);

--
-- Indices de la tabla `circuitos`
--
ALTER TABLE `circuitos`
  ADD PRIMARY KEY (`idCircuito`),
  ADD UNIQUE KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `estadosddjj`
--
ALTER TABLE `estadosddjj`
  ADD PRIMARY KEY (`idEstadoDDJJ`);

--
-- Indices de la tabla `juicio`
--
ALTER TABLE `juicio`
  ADD PRIMARY KEY (`idjuicio`);

--
-- Indices de la tabla `juicionotificaciones`
--
ALTER TABLE `juicionotificaciones`
  ADD PRIMARY KEY (`idjuicionotificaciones`),
  ADD KEY `idjuicio` (`idjuicio`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`idLocalidad`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`idLote`),
  ADD KEY `FK_Lotes_Plantillas` (`idPlantilla`);

--
-- Indices de la tabla `lotespersonanotificacion`
--
ALTER TABLE `lotespersonanotificacion`
  ADD PRIMARY KEY (`idlotespersonanotificacion`),
  ADD KEY `idLP` (`idLP`);

--
-- Indices de la tabla `lotespersonas`
--
ALTER TABLE `lotespersonas`
  ADD PRIMARY KEY (`idLP`),
  ADD KEY `FK_LotesPersonas_EstadosDDJJ` (`idEstadoDDJJ`),
  ADD KEY `FK_LotesPersonas_Impedimentos` (`idTipoImpedimento`),
  ADD KEY `FK_LotesPersonas_Lotes` (`idLote`),
  ADD KEY `FK_LotesPersonas_Personas` (`idPersona`),
  ADD KEY `FK_LotesPersonas_TipoResultadoPolicial` (`idTipoResultado`);

--
-- Indices de la tabla `lotes_extensiones`
--
ALTER TABLE `lotes_extensiones`
  ADD PRIMARY KEY (`idExtension`),
  ADD KEY `FK_Lotes_Extensiones_Lotes` (`idLote`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`idNotificacion`),
  ADD KEY `idLote` (`idLote`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idPersona`),
  ADD KEY `FK_Personas_TiposDocumentos` (`idTipoDocumento`),
  ADD KEY `idLocalidad` (`idLocalidad`),
  ADD KEY `idComisaria` (`idCentroDistribucion`);

--
-- Indices de la tabla `personaseleccion`
--
ALTER TABLE `personaseleccion`
  ADD PRIMARY KEY (`idPersona`,`idseleccion`),
  ADD KEY `idpersonaseleccionresultadotipos` (`idpersonaseleccionresultadotipos`),
  ADD KEY `idjuicio` (`idjuicio`),
  ADD KEY `idseleccion` (`idseleccion`),
  ADD KEY `idtiposeleccionrecusacion` (`idtiposeleccionrecusacion`),
  ADD KEY `idLote` (`idLote`);

--
-- Indices de la tabla `personaselecciondocumento`
--
ALTER TABLE `personaselecciondocumento`
  ADD PRIMARY KEY (`idpersonaselecciondocumento`),
  ADD KEY `idseleccion` (`idseleccion`),
  ADD KEY `idPersona` (`idPersona`),
  ADD KEY `idpersonaselecciondocumentotipos` (`idpersonaselecciondocumentotipos`);

--
-- Indices de la tabla `personaselecciondocumentotipos`
--
ALTER TABLE `personaselecciondocumentotipos`
  ADD PRIMARY KEY (`idpersonaselecciondocumentotipos`);

--
-- Indices de la tabla `personaseleccionresultadotipos`
--
ALTER TABLE `personaseleccionresultadotipos`
  ADD PRIMARY KEY (`idpersonaseleccionresultadotipos`);

--
-- Indices de la tabla `plantillas`
--
ALTER TABLE `plantillas`
  ADD PRIMARY KEY (`idPlantilla`);

--
-- Indices de la tabla `plantillas_preguntas`
--
ALTER TABLE `plantillas_preguntas`
  ADD PRIMARY KEY (`idPP`),
  ADD KEY `FK_Plantillas_Preguntas_Plantillas` (`idPlantilla`),
  ADD KEY `fk_preguntas` (`idPregunta`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`idPregunta`),
  ADD KEY `FK_Preguntas_Categorias` (`idCategoria`),
  ADD KEY `FK_Preguntas_TipoRespuestas` (`idTipoRespuesta`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`idRespuesta`),
  ADD KEY `FK_Respuestas_LotesPersonas` (`idLP`),
  ADD KEY `FK_Respuestas_Preguntas` (`idPregunta`);

--
-- Indices de la tabla `seleccion`
--
ALTER TABLE `seleccion`
  ADD PRIMARY KEY (`idseleccion`);

--
-- Indices de la tabla `tipodocumentos`
--
ALTER TABLE `tipodocumentos`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `tipoimpedimentos`
--
ALTER TABLE `tipoimpedimentos`
  ADD PRIMARY KEY (`idTipoImpedimento`);

--
-- Indices de la tabla `tiporespuestas`
--
ALTER TABLE `tiporespuestas`
  ADD PRIMARY KEY (`idTipoRespuesta`);

--
-- Indices de la tabla `tiporesultadonotificacion`
--
ALTER TABLE `tiporesultadonotificacion`
  ADD PRIMARY KEY (`idTipoResultado`);

--
-- Indices de la tabla `tiposeleccionrecusacion`
--
ALTER TABLE `tiposeleccionrecusacion`
  ADD PRIMARY KEY (`idtiposeleccionrecusacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `centrodistribucion`
--
ALTER TABLE `centrodistribucion`
  MODIFY `idCentroDistribucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `circuitos`
--
ALTER TABLE `circuitos`
  MODIFY `idCircuito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `estadosddjj`
--
ALTER TABLE `estadosddjj`
  MODIFY `idEstadoDDJJ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `juicio`
--
ALTER TABLE `juicio`
  MODIFY `idjuicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `juicionotificaciones`
--
ALTER TABLE `juicionotificaciones`
  MODIFY `idjuicionotificaciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `idLocalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `lotes`
--
ALTER TABLE `lotes`
  MODIFY `idLote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `lotespersonanotificacion`
--
ALTER TABLE `lotespersonanotificacion`
  MODIFY `idlotespersonanotificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `lotespersonas`
--
ALTER TABLE `lotespersonas`
  MODIFY `idLP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7269;
--
-- AUTO_INCREMENT de la tabla `lotes_extensiones`
--
ALTER TABLE `lotes_extensiones`
  MODIFY `idExtension` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `idNotificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2639;
--
-- AUTO_INCREMENT de la tabla `personaselecciondocumento`
--
ALTER TABLE `personaselecciondocumento`
  MODIFY `idpersonaselecciondocumento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `personaselecciondocumentotipos`
--
ALTER TABLE `personaselecciondocumentotipos`
  MODIFY `idpersonaselecciondocumentotipos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `personaseleccionresultadotipos`
--
ALTER TABLE `personaseleccionresultadotipos`
  MODIFY `idpersonaseleccionresultadotipos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `plantillas`
--
ALTER TABLE `plantillas`
  MODIFY `idPlantilla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `plantillas_preguntas`
--
ALTER TABLE `plantillas_preguntas`
  MODIFY `idPP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `idPregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `idRespuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `seleccion`
--
ALTER TABLE `seleccion`
  MODIFY `idseleccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `tipodocumentos`
--
ALTER TABLE `tipodocumentos`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tipoimpedimentos`
--
ALTER TABLE `tipoimpedimentos`
  MODIFY `idTipoImpedimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tiporespuestas`
--
ALTER TABLE `tiporespuestas`
  MODIFY `idTipoRespuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tiporesultadonotificacion`
--
ALTER TABLE `tiporesultadonotificacion`
  MODIFY `idTipoResultado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tiposeleccionrecusacion`
--
ALTER TABLE `tiposeleccionrecusacion`
  MODIFY `idtiposeleccionrecusacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `centrodistribucion`
--
ALTER TABLE `centrodistribucion`
  ADD CONSTRAINT `centrodistribucion_ibfk_1` FOREIGN KEY (`idLocalidad`) REFERENCES `localidades` (`idLocalidad`);

--
-- Filtros para la tabla `juicionotificaciones`
--
ALTER TABLE `juicionotificaciones`
  ADD CONSTRAINT `juicionotificaciones_ibfk_1` FOREIGN KEY (`idjuicio`) REFERENCES `juicio` (`idjuicio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD CONSTRAINT `FK_Lotes_Plantillas` FOREIGN KEY (`idPlantilla`) REFERENCES `plantillas` (`idPlantilla`);

--
-- Filtros para la tabla `lotespersonanotificacion`
--
ALTER TABLE `lotespersonanotificacion`
  ADD CONSTRAINT `lotespersonanotificacion_ibfk_1` FOREIGN KEY (`idLP`) REFERENCES `lotespersonas` (`idLP`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `lotespersonas`
--
ALTER TABLE `lotespersonas`
  ADD CONSTRAINT `FK_LotesPersonas_EstadosDDJJ` FOREIGN KEY (`idEstadoDDJJ`) REFERENCES `estadosddjj` (`idEstadoDDJJ`),
  ADD CONSTRAINT `FK_LotesPersonas_Impedimentos` FOREIGN KEY (`idTipoImpedimento`) REFERENCES `tipoimpedimentos` (`idTipoImpedimento`),
  ADD CONSTRAINT `FK_LotesPersonas_Lotes` FOREIGN KEY (`idLote`) REFERENCES `lotes` (`idLote`),
  ADD CONSTRAINT `FK_LotesPersonas_Personas` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`),
  ADD CONSTRAINT `FK_LotesPersonas_TipoResultadoPolicial` FOREIGN KEY (`idTipoResultado`) REFERENCES `tiporesultadonotificacion` (`idTipoResultado`);

--
-- Filtros para la tabla `lotes_extensiones`
--
ALTER TABLE `lotes_extensiones`
  ADD CONSTRAINT `FK_Lotes_Extensiones_Lotes` FOREIGN KEY (`idLote`) REFERENCES `lotes` (`idLote`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `FK_Personas_TiposDocumentos` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumentos` (`idTipoDocumento`),
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`idLocalidad`) REFERENCES `localidades` (`idLocalidad`),
  ADD CONSTRAINT `personas_ibfk_2` FOREIGN KEY (`idCentroDistribucion`) REFERENCES `centrodistribucion` (`idCentroDistribucion`);

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

--
-- Filtros para la tabla `plantillas_preguntas`
--
ALTER TABLE `plantillas_preguntas`
  ADD CONSTRAINT `FK_Plantillas_Preguntas_Plantillas` FOREIGN KEY (`idPlantilla`) REFERENCES `plantillas` (`idPlantilla`),
  ADD CONSTRAINT `plantillas_preguntas_ibfk_1` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `FK_Preguntas_Categorias` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`),
  ADD CONSTRAINT `FK_Preguntas_TipoRespuestas` FOREIGN KEY (`idTipoRespuesta`) REFERENCES `tiporespuestas` (`idTipoRespuesta`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `FK_Respuestas_LotesPersonas` FOREIGN KEY (`idLP`) REFERENCES `lotespersonas` (`idLP`),
  ADD CONSTRAINT `FK_Respuestas_Preguntas` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

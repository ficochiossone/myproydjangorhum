-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 01, 2018 at 04:38 PM
-- Server version: 5.5.59-0+deb8u1
-- PHP Version: 5.6.33-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rhssp`
--

-- --------------------------------------------------------

--
-- Table structure for table `areasdependencia`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `areasdependencia` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(8) COLLATE utf8_bin NOT NULL,
  `responsable_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `areasdependencia`:
--   `responsable_id`
--       `trabajadores` -> `id`
--

--
-- Dumping data for table `areasdependencia`
--

INSERT INTO `areasdependencia` (`id`, `nombre`, `codigo`, `responsable_id`) VALUES
(1, 'Ortopedia y Traumatologia', 'ADPOYT', 1515),
(2, 'Imagenes', 'ADPDGIMG', 578),
(3, 'Cirugia', 'ADPCGIA', 692),
(4, 'Salud S y Reproductiva', 'ADPSSYRP', 694),
(6, 'DIRECCION ENFERMERIA ', 'ADPENFRM', 1249),
(7, 'Direccion Salud Mental', 'ADPSMTAL', 1525),
(8, 'Neurociencias', 'ADPNLGIA', 741),
(12, 'ADPHNVJVILELA', 'ADPHNV', 1164),
(14, 'ADPHRSPEÑA', 'ADPRSP', 798),
(15, 'ADPHIC', 'ADPHIC', 636),
(16, 'A D APS', 'ADPAPS', 534),
(17, 'Area Dep Heca', 'ADPHECA', 327),
(18, 'ADP H ALBERDI', 'ADPHALBD', 811),
(19, 'AREA ILAR', 'ADPILAR', 1341),
(20, 'Imusa', 'ADPIMUSA', 845);

-- --------------------------------------------------------

--
-- Table structure for table `asignalabs`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `asignalabs` (
`id` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  `tipoasignacion` varchar(12) COLLATE utf8_bin NOT NULL,
  `profesion_id` int(11) DEFAULT NULL,
  `areadep_id` int(11) DEFAULT NULL,
  `institucion_id` int(11) DEFAULT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  `funcion_id` int(11) NOT NULL,
  `espec_id` int(11) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `modosemanal` varchar(18) COLLATE utf8_bin NOT NULL,
  `horasxdia` int(11) NOT NULL,
  `comentarios` longtext COLLATE utf8_bin,
  `xausenciatrab_id` int(11) DEFAULT NULL,
  `usuario_registro_id` int(11) DEFAULT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `asignalabs`:
--   `areadep_id`
--       `areasdependencia` -> `id`
--   `espec_id`
--       `especialidades` -> `id`
--   `funcion_id`
--       `funclabs` -> `id`
--   `institucion_id`
--       `instituciones` -> `id`
--   `profesion_id`
--       `profesiones` -> `id`
--   `servicio_id`
--       `servicios` -> `id`
--   `trabajador_id`
--       `trabajadores` -> `id`
--   `xausenciatrab_id`
--       `ausencias_trbs` -> `id`
--

--
-- Dumping data for table `asignalabs`
--

INSERT INTO `asignalabs` (`id`, `activo`, `trabajador_id`, `tipoasignacion`, `profesion_id`, `areadep_id`, `institucion_id`, `servicio_id`, `funcion_id`, `espec_id`, `fecha_inicio`, `fecha_fin`, `modosemanal`, `horasxdia`, `comentarios`, `xausenciatrab_id`, `usuario_registro_id`, `fecha_registro`) VALUES
(1, 0, 1005, 'REG', NULL, 1, 1, NULL, 4, 1, '2017-12-04', NULL, 'UDS', 6, '', 7, 1, '2017-12-12'),
(2, 1, 1005, 'REG', NULL, 1, 4, NULL, 1, 1, '2017-11-01', NULL, 'TLD', 16, '', NULL, 1, '2017-12-12'),
(3, 1, 232, 'REG', NULL, 1, 7, NULL, 5, 1, '2010-11-01', NULL, 'TLD', 4, '', NULL, 1, '2017-12-12'),
(4, 1, 1266, 'REG', NULL, NULL, 2, NULL, 5, NULL, '2017-10-01', NULL, 'TLD', 4, '', NULL, 1, '2017-12-14'),
(5, 1, 1266, 'REG', NULL, 1, 3, NULL, 1, 1, '2017-06-01', NULL, 'TLD', 24, '', NULL, 1, '2017-12-14'),
(6, 1, 469, 'REG', NULL, NULL, 7, NULL, 5, NULL, '2009-11-01', NULL, 'TLD', 6, '', NULL, 1, '2017-11-07'),
(7, 1, 817, 'REG', NULL, NULL, 2, NULL, 5, NULL, '2016-11-01', NULL, 'TLD', 4, '', NULL, 1, '2017-11-07'),
(8, 1, 817, 'REG', NULL, NULL, 5, NULL, 5, NULL, '2016-11-01', NULL, 'TLD', 4, '', NULL, 1, '2017-11-07'),
(9, 1, 817, 'REG', NULL, NULL, 1, NULL, 3, NULL, '2016-11-01', NULL, 'UDS', 26, '', NULL, 1, '2017-11-07'),
(10, 1, 817, 'REG', NULL, NULL, 1, NULL, 5, NULL, '2016-11-01', NULL, 'UDS', 4, '', NULL, 1, '2017-11-07'),
(11, 1, 8, 'REG', NULL, NULL, 5, NULL, 5, NULL, '2014-11-01', NULL, 'TLD', 4, '', NULL, 1, '2017-11-07'),
(12, 1, 8, 'REG', NULL, NULL, 7, NULL, 5, NULL, '2014-11-01', NULL, 'TLD', 4, '', NULL, 1, '2017-11-07'),
(13, 1, 8, 'REG', NULL, NULL, 1, NULL, 5, NULL, '2014-11-01', NULL, 'TLD', 4, '', NULL, 1, '2017-11-07'),
(14, 1, 8, 'REG', NULL, NULL, 2, NULL, 5, NULL, '2014-11-01', NULL, 'TLD', 4, '', NULL, 1, '2017-11-07'),
(15, 1, 789, 'REG', NULL, 2, 7, NULL, 5, NULL, '2017-02-01', NULL, 'TLD', 4, '', NULL, 1, '2017-11-07'),
(16, 1, 1124, 'REG', NULL, NULL, 4, NULL, 1, NULL, '2017-07-02', NULL, 'TLD', 24, '', NULL, 1, '2017-11-09'),
(17, 1, 8, 'REG', NULL, 2, 9, NULL, 3, NULL, '2017-12-01', NULL, 'TLD', 12, 'fdsgfdsfae', NULL, 1, '2017-11-08'),
(18, 1, 812, 'REG', NULL, 1, 11, NULL, 5, NULL, '2013-11-01', NULL, 'TLD', 6, '', NULL, 1, '2017-11-10'),
(19, 1, 307, 'REG', NULL, 1, 11, NULL, 5, NULL, '1999-11-07', NULL, 'TLD', 6, '', NULL, 1, '2017-11-10'),
(20, 1, 528, 'REG', NULL, 1, 3, NULL, 1, NULL, '2015-11-01', NULL, 'LAV', 24, '', NULL, 1, '2017-11-10'),
(21, 1, 498, 'REG', NULL, 1, 3, NULL, 1, NULL, '2017-11-01', NULL, 'TLD', 12, '', NULL, 1, '2017-11-10'),
(22, 1, 498, 'REG', NULL, 1, 3, NULL, 6, NULL, '2012-10-11', NULL, 'TLD', 4, '', NULL, 1, '2017-11-10'),
(23, 1, 498, 'REG', NULL, 1, 7, NULL, 5, NULL, '2012-11-14', NULL, 'TLD', 4, '', NULL, 1, '2017-11-10'),
(24, 1, 498, 'REG', NULL, 1, 3, NULL, 1, NULL, '2012-11-13', NULL, 'LAV', 24, '', NULL, 1, '2017-11-10'),
(25, 1, 1003, 'REG', NULL, 1, 1, NULL, 5, NULL, '2013-11-14', NULL, 'TLD', 6, '', NULL, 1, '2017-11-10'),
(26, 1, 896, 'REG', NULL, 1, 1, NULL, 1, NULL, '2011-11-01', NULL, 'TLD', 6, '', NULL, 1, '2017-11-10'),
(27, 1, 697, 'REG', NULL, 1, 4, NULL, 3, NULL, '1999-11-01', NULL, 'TLD', 24, '', NULL, 1, '2017-11-10'),
(28, 1, 697, 'REG', NULL, 1, 4, NULL, 3, NULL, '2013-11-01', NULL, 'LAV', 24, '', NULL, 1, '2017-11-10'),
(29, 1, 697, 'REG', NULL, 1, 4, NULL, 5, NULL, '2013-11-01', NULL, 'TLD', 4, '', NULL, 1, '2017-11-10'),
(30, 1, 800, 'REG', NULL, 1, 4, NULL, 1, NULL, '2013-11-01', NULL, 'TLD', 24, '', NULL, 1, '2017-11-10'),
(31, 0, 996, 'REG', NULL, 1, 4, NULL, 1, NULL, '2014-11-01', NULL, 'TLD', 24, '', NULL, 1, '2017-11-21'),
(32, 1, 660, 'REG', NULL, 1, 4, NULL, 1, NULL, '1999-11-01', NULL, 'TLD', 24, '', NULL, 1, '2017-11-10'),
(33, 1, 660, 'REG', NULL, 1, 4, NULL, 1, NULL, '1999-11-01', NULL, 'LAV', 24, '', NULL, 1, '2017-11-10'),
(34, 1, 1213, 'REG', NULL, 7, 11, NULL, 6, NULL, '2016-12-31', NULL, 'TLD', 4, '', 3, 1, '2017-11-12'),
(35, 1, 1153, 'REG', NULL, 12, 4, NULL, 1, NULL, '2016-11-01', NULL, 'TLD', 24, 'Ocupa lugar en Guardia de marcela alonso que paso a TMO', 17, 1, '2017-11-13'),
(36, 1, 1128, 'REG', NULL, 12, 4, NULL, 1, NULL, '2017-11-01', NULL, 'TLD', 24, '', 16, 1, '2017-11-13'),
(37, 1, 1126, 'REG', NULL, NULL, 9, NULL, 1, NULL, '2016-07-01', NULL, 'TLD', 24, '', NULL, 1, '2017-11-13'),
(38, 1, 1126, 'REG', NULL, 4, 9, NULL, 1, NULL, '2016-07-01', NULL, 'LAV', 24, '', 19, 1, '2017-11-13'),
(39, 1, 1000, 'REG', NULL, 1, 3, NULL, 7, NULL, '2017-09-01', NULL, 'TLD', 6, '', 20, 1, '2017-11-15'),
(40, 1, 1290, 'REG', NULL, 7, 4, NULL, 11, NULL, '2014-11-15', NULL, 'TLD', 6, '', 2, 1, '2017-11-15'),
(41, 1, 312, 'REG', NULL, 1, 4, NULL, 4, NULL, '2017-11-08', NULL, 'TLD', 4, '', 13, 1, '2017-11-15'),
(42, 1, 855, 'REG', NULL, 1, 4, NULL, 5, NULL, '2012-11-14', NULL, 'TLD', 4, '', 13, 1, '2017-11-15'),
(43, 1, 408, 'REG', NULL, 1, 9, NULL, 5, NULL, '2017-02-07', NULL, 'TLD', 6, '', NULL, 1, '2017-11-16'),
(44, 1, 1235, 'REG', NULL, 12, 4, NULL, 1, NULL, '2015-07-01', NULL, 'TLD', 24, '', 21, 1, '2017-11-17'),
(45, 1, 1229, 'REG', NULL, 14, 1, NULL, 5, NULL, '2017-12-01', NULL, 'TLD', 6, '', 8, 2, '2017-11-17'),
(46, 1, 1229, 'REG', NULL, 12, 4, NULL, 1, NULL, '2017-07-01', NULL, 'LAV', 24, 'wrwrwrerwer', NULL, 2, '2017-11-17'),
(47, 1, 1150, 'REG', NULL, 15, 2, NULL, 5, NULL, '2017-11-01', NULL, 'TLD', 6, '', 12, 2, '2017-11-17'),
(48, 1, 1004, 'REG', NULL, 1, 5, NULL, 5, 1, '2016-11-01', NULL, 'TLD', 6, '', NULL, 1, '2018-02-09'),
(49, 1, 1295, 'REG', NULL, 4, 9, NULL, 1, NULL, '2017-10-01', NULL, 'TLD', 24, '', 18, 1, '2017-11-17'),
(50, 1, 1266, 'REG', NULL, 1, 1, NULL, 5, 1, '2018-02-01', NULL, 'TLD', 4, '', NULL, 1, '2017-12-14'),
(51, 1, 996, 'REG', NULL, 1, 4, NULL, 1, NULL, '2017-12-01', NULL, 'UDS', 16, '', 6, 1, '2017-11-21'),
(52, 1, 800, 'REG', NULL, 1, 4, NULL, 1, NULL, '2017-12-01', NULL, 'UDS', 16, '', 6, 1, '2017-11-21'),
(53, 1, 996, 'REG', NULL, 1, 4, NULL, 3, NULL, '2017-12-01', NULL, 'UDS', 8, '', 6, 1, '2017-11-21'),
(54, 1, 800, 'REG', NULL, 1, NULL, NULL, 3, NULL, '2017-12-01', NULL, 'UDS', 8, '', 6, 1, '2017-11-21'),
(55, 1, 1005, 'REG', NULL, 1, 4, NULL, 1, 1, '2017-12-01', NULL, 'TLD', 8, 'Se desplaza de activa de Jueves a sistema mixto pas act con Mfernandez los miercoles', 24, 1, '2017-12-12'),
(56, 1, 1000, 'REG', NULL, 1, 1, NULL, 5, NULL, '2017-08-08', NULL, 'TLD', 4, 'asdsDFSFDWAFW', 1, 1, '2017-12-14'),
(57, 1, 1194, 'REG', NULL, 17, 3, NULL, 13, NULL, '2017-11-01', NULL, 'TLD', 24, '', 41, 1, '2017-11-22'),
(58, 1, 1204, 'REG', NULL, 17, 3, NULL, 13, NULL, '2017-09-03', NULL, 'TLD', 24, '', 40, 1, '2017-11-22'),
(59, 1, 814, 'REG', NULL, 14, 1, NULL, 11, NULL, '2017-11-01', NULL, 'TLD', 8, '', 55, 1, '2017-11-23'),
(60, 1, 1231, 'REG', NULL, 14, 1, NULL, 1, 4, '2017-07-01', NULL, 'TLD', 24, 'xzs', 60, 1, '2017-11-27'),
(61, 1, 822, 'REG', NULL, NULL, 7, NULL, 3, 2, '2016-11-01', NULL, 'TLD', 12, '', NULL, 1, '2017-11-28'),
(62, 1, 446, 'REG', NULL, 2, 4, NULL, 15, 2, '2016-10-01', NULL, 'TLD', 6, '', NULL, 1, '2017-12-15'),
(63, 1, 261, 'REG', NULL, NULL, 3, NULL, 11, 2, '2017-11-01', NULL, 'TLD', 6, '', NULL, 1, '2017-11-28'),
(64, 1, 1239, 'REG', NULL, 18, 11, NULL, 13, 3, '2017-12-01', NULL, 'TLD', 12, '', 72, 1, '2017-11-29'),
(65, 1, 2258, 'REG', NULL, 19, 11, NULL, 14, 3, '2017-09-01', NULL, 'TLD', 14, '', NULL, 1, '2017-11-29'),
(66, 1, 1142, 'REG', NULL, NULL, 11, NULL, 5, NULL, '2017-03-01', NULL, 'TLD', 6, '', 73, 1, '2017-11-29'),
(67, 1, 1340, 'REG', NULL, 18, 11, NULL, 6, 3, '2017-12-25', '2017-11-25', 'XTR', 12, '', NULL, 1, '2017-11-29'),
(68, 1, 2108, 'REG', NULL, 16, 19, NULL, 5, 5, '2017-11-01', NULL, 'TLD', 6, '', NULL, 1, '2017-12-05'),
(69, 0, 854, 'REG', NULL, 1, 4, NULL, 5, 1, '2015-07-12', '2018-03-15', 'TLD', 4, '', 13, 1, '2018-01-24'),
(70, 1, 1462, 'REG', NULL, 1, 4, NULL, 17, 1, '2017-09-01', NULL, 'TLD', 3, '', NULL, 1, '2017-12-15'),
(71, 1, 1004, 'REG', 1, 1, 4, NULL, 17, 1, '2017-12-01', NULL, 'TLD', 4, '', NULL, 1, '2017-12-14'),
(72, 1, 1000, 'REG', NULL, NULL, 3, NULL, 17, NULL, '2016-05-09', NULL, 'TLD', 4, '', NULL, 1, '2017-12-06'),
(73, 1, 1366, 'REG', NULL, 1, 4, NULL, 17, 1, '2016-12-01', NULL, 'TLD', 4, '', NULL, 1, '2017-12-12'),
(74, 1, 1266, 'REG', NULL, 1, 3, NULL, 17, 1, '2017-06-01', NULL, 'TLD', 4, '', NULL, 1, '2017-12-06'),
(75, 1, 1001, 'REG', NULL, 1, 4, NULL, 17, 1, '2017-10-01', NULL, 'TLD', 4, '', NULL, 1, '2017-12-06'),
(76, 1, 367, 'REG', 1, 1, NULL, NULL, 18, 1, '2018-01-01', NULL, 'TLD', 6, 'dR Mora con problemas visuales no en condiciones de practicar cirugias oyt', NULL, NULL, '2017-12-13'),
(77, 1, 801, 'REG', 1, NULL, 3, NULL, 1, NULL, '2014-05-01', NULL, 'TLD', 12, '', NULL, NULL, '2017-12-13'),
(78, 1, 801, 'REG', 1, NULL, 3, NULL, 1, NULL, '2014-12-01', NULL, 'LAV', 24, '', NULL, NULL, '2017-12-13'),
(79, 1, 1595, 'REG', 1, NULL, 3, NULL, 1, NULL, '2011-11-05', NULL, 'TLD', 12, '', NULL, 1, '2017-12-13'),
(80, 1, 1595, 'REG', 1, 1, 3, NULL, 1, 1, '2017-09-01', NULL, 'LAV', 24, '', NULL, NULL, '2017-12-13'),
(81, 1, 232, 'REG', 1, NULL, 3, NULL, 17, NULL, '1999-12-01', NULL, 'TLD', 4, '', NULL, NULL, '2017-12-13'),
(82, 1, 232, 'REG', 1, NULL, 3, NULL, 7, NULL, '1999-12-01', NULL, 'TLD', 6, '', NULL, NULL, '2017-12-13'),
(83, 1, 232, 'REG', 1, NULL, 3, NULL, 8, 1, '1999-12-01', NULL, 'TLD', 6, '', NULL, NULL, '2017-12-13'),
(84, 1, 232, 'REG', 1, NULL, 3, NULL, 6, 1, '1999-12-01', NULL, 'TLD', 6, '', NULL, NULL, '2017-12-13'),
(85, 1, 1001, 'REG', 1, 1, 4, NULL, 1, 1, '2018-01-01', NULL, 'LAV', 20, '', 24, NULL, '2017-12-14'),
(86, 1, 1001, 'REG', NULL, NULL, 4, NULL, 5, NULL, '2017-12-01', NULL, 'TLD', 4, '', NULL, NULL, '2017-12-14'),
(87, 1, 1000, 'REG', 1, 1, 3, NULL, 1, 1, '2017-10-16', NULL, 'TLD', 12, '', 74, NULL, '2017-12-14'),
(88, 1, 1000, 'REG', 1, 1, 3, NULL, 1, 1, '2017-10-01', NULL, 'LAV', 24, '', NULL, NULL, '2017-12-14'),
(89, 1, 1000, 'REG', 1, 1, 7, NULL, 5, 1, '2015-11-01', NULL, 'TLD', 4, '', NULL, NULL, '2017-12-14'),
(90, 1, 528, 'REG', NULL, 1, 3, NULL, 1, 1, '2017-11-01', NULL, 'TLD', 12, '', NULL, NULL, '2017-12-14'),
(91, 1, 1001, 'REG', 1, 1, 4, NULL, 1, 1, '2018-01-01', NULL, 'UDS', 24, '', 24, NULL, '2017-12-14'),
(92, 1, 1171, 'REG', 1, 12, 4, NULL, 14, 7, '2018-01-04', NULL, 'TLD', 24, '', NULL, NULL, '2018-01-18'),
(93, 1, 854, 'REG', NULL, 1, 4, NULL, 17, 1, '2018-01-01', NULL, 'TLD', 6, '', NULL, NULL, '2018-01-23'),
(94, 1, 854, 'REG', 1, NULL, 1, NULL, 5, 1, '2018-03-15', NULL, 'TLD', 6, '', NULL, NULL, '2018-01-23'),
(95, 1, 854, 'REG', 1, NULL, 1, NULL, 3, 1, '2018-03-15', NULL, 'TLD', 12, '', NULL, NULL, '2018-01-23'),
(96, 1, 854, 'REG', 1, NULL, 1, NULL, 6, NULL, '2018-03-15', NULL, 'TLD', 3, '', 1, NULL, '2018-01-23'),
(97, 1, 1366, 'REG', 1, NULL, 4, NULL, 1, NULL, '2018-01-22', NULL, 'UDS', 16, '', NULL, NULL, '2018-02-09'),
(98, 1, 1366, 'REG', NULL, 1, 4, NULL, 5, 1, '2018-01-23', NULL, 'TLD', 4, '', NULL, NULL, '2018-02-09'),
(99, 1, 1004, 'REG', 1, 1, 1, NULL, 5, 1, '2017-12-21', NULL, 'TLD', 4, '', NULL, NULL, '2018-02-09'),
(100, 1, 1004, 'REG', 1, 1, 7, NULL, 7, 1, '2017-10-10', NULL, 'UDS', 4, '', NULL, NULL, '2018-02-09'),
(101, 1, 481, 'REG', 1, 3, 4, NULL, 11, NULL, '2017-04-01', NULL, 'TLD', 6, 'cargo transitorio hasta concurso definido x direccion hospital y jefatura area\r\ncedido x traumatologia y cubierto por reemp y ex', NULL, NULL, '2018-02-09'),
(102, 1, 189, 'REG', 1, NULL, 3, NULL, 11, NULL, '2016-12-21', NULL, 'TLD', 6, '', NULL, NULL, '2018-02-09'),
(103, 1, 646, 'REG', 1, 1, 4, NULL, 11, NULL, '2017-10-01', NULL, 'TLD', 6, '', NULL, NULL, '2018-02-09');

-- --------------------------------------------------------

--
-- Table structure for table `asignalabs_dds`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `asignalabs_dds` (
`id` int(11) NOT NULL,
  `asigna_lab_id` int(11) NOT NULL,
  `dds_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `asignalabs_dds`:
--   `asigna_lab_id`
--       `asignalabs` -> `id`
--   `dds_id`
--       `dataextra_dds` -> `id`
--

--
-- Dumping data for table `asignalabs_dds`
--

INSERT INTO `asignalabs_dds` (`id`, `asigna_lab_id`, `dds_id`) VALUES
(139, 1, 2),
(138, 2, 1),
(135, 3, 1),
(154, 4, 2),
(155, 4, 5),
(157, 5, 7),
(3, 16, 3),
(5, 18, 1),
(6, 18, 2),
(7, 18, 3),
(8, 18, 4),
(9, 19, 1),
(10, 19, 2),
(11, 19, 3),
(12, 19, 4),
(13, 19, 5),
(14, 20, 6),
(15, 21, 3),
(16, 22, 1),
(17, 22, 3),
(18, 22, 5),
(19, 23, 3),
(20, 24, 6),
(21, 25, 3),
(22, 26, 2),
(23, 26, 3),
(24, 27, 2),
(25, 28, 6),
(26, 28, 7),
(27, 29, 2),
(28, 29, 4),
(29, 30, 3),
(87, 31, 4),
(31, 32, 2),
(32, 33, 6),
(33, 34, 1),
(34, 34, 2),
(35, 34, 3),
(36, 34, 4),
(37, 34, 5),
(40, 35, 1),
(41, 35, 3),
(42, 35, 5),
(43, 36, 2),
(44, 37, 5),
(49, 38, 7),
(50, 39, 4),
(58, 40, 1),
(59, 40, 2),
(60, 40, 3),
(61, 40, 4),
(62, 40, 5),
(63, 40, 6),
(64, 40, 7),
(67, 41, 2),
(66, 42, 5),
(68, 43, 3),
(70, 44, 3),
(71, 45, 1),
(72, 45, 3),
(73, 45, 5),
(75, 46, 7),
(76, 47, 1),
(77, 47, 3),
(184, 48, 1),
(185, 48, 3),
(186, 48, 4),
(82, 49, 2),
(156, 50, 4),
(88, 51, 3),
(89, 52, 3),
(90, 53, 3),
(91, 54, 3),
(137, 55, 4),
(163, 56, 2),
(96, 57, 1),
(97, 58, 2),
(98, 58, 3),
(99, 59, 1),
(100, 59, 2),
(101, 59, 3),
(102, 59, 4),
(103, 59, 5),
(104, 60, 5),
(105, 61, 1),
(167, 62, 3),
(108, 63, 1),
(109, 63, 2),
(110, 63, 3),
(111, 63, 4),
(112, 63, 5),
(113, 64, 2),
(114, 65, 3),
(115, 66, 3),
(116, 67, 1),
(117, 68, 1),
(118, 68, 2),
(119, 68, 3),
(120, 68, 4),
(121, 68, 5),
(175, 69, 4),
(168, 70, 2),
(161, 71, 2),
(129, 72, 1),
(136, 73, 2),
(131, 74, 1),
(132, 75, 2),
(140, 76, 1),
(141, 76, 2),
(142, 76, 3),
(143, 76, 4),
(144, 76, 5),
(145, 77, 2),
(147, 78, 6),
(148, 79, 3),
(149, 80, 6),
(150, 81, 1),
(151, 82, 2),
(152, 83, 5),
(153, 84, 3),
(158, 85, 4),
(159, 86, 2),
(160, 87, 2),
(162, 88, 6),
(164, 89, 3),
(165, 90, 3),
(166, 91, 6),
(169, 92, 4),
(170, 93, 2),
(171, 94, 4),
(172, 95, 4),
(174, 96, 1),
(176, 97, 1),
(177, 98, 3),
(183, 99, 5),
(182, 100, 2),
(187, 101, 1),
(188, 101, 2),
(189, 101, 3),
(190, 101, 4),
(191, 101, 5),
(192, 101, 6),
(193, 101, 7),
(194, 102, 1),
(195, 102, 2),
(196, 102, 3),
(197, 102, 4),
(198, 102, 5),
(199, 102, 6),
(200, 102, 7),
(201, 103, 1),
(202, 103, 2),
(203, 103, 3),
(204, 103, 4),
(205, 103, 5),
(206, 103, 6),
(207, 103, 7);

-- --------------------------------------------------------

--
-- Table structure for table `ausencias_trbs`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `ausencias_trbs` (
`id` int(11) NOT NULL,
  `generavacgen` tinyint(1) NOT NULL,
  `areadep_id` int(11) NOT NULL,
  `solicita_cobertura` tinyint(1) NOT NULL,
  `trabajador_ausente_id` int(11) DEFAULT NULL,
  `cobertura_princ_por_id` int(11) DEFAULT NULL,
  `tipo_ausencia_id` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `usuario_registro_id` int(11) NOT NULL,
  `fecha_insert` date NOT NULL,
  `comentarios` longtext COLLATE utf8_bin
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `ausencias_trbs`:
--   `areadep_id`
--       `areasdependencia` -> `id`
--   `cobertura_princ_por_id`
--       `trabajadores` -> `id`
--   `tipo_ausencia_id`
--       `tipos_ausencias` -> `id`
--   `trabajador_ausente_id`
--       `trabajadores` -> `id`
--

--
-- Dumping data for table `ausencias_trbs`
--

INSERT INTO `ausencias_trbs` (`id`, `generavacgen`, `areadep_id`, `solicita_cobertura`, `trabajador_ausente_id`, `cobertura_princ_por_id`, `tipo_ausencia_id`, `fecha_inicio`, `fecha_fin`, `usuario_registro_id`, `fecha_insert`, `comentarios`) VALUES
(1, 0, 1, 1, 767, NULL, 5, '2014-06-13', NULL, 1, '2017-11-12', ''),
(2, 1, 12, 0, 94, NULL, 5, '2014-11-01', NULL, 1, '2017-11-17', 'en funciones jefa de servicio HNVJV'),
(3, 0, 7, 0, 154, 1213, 5, '2017-11-04', NULL, 1, '2017-11-12', 'en tratamiento por enfermedad de ..... \r\nContinua siendo vista por sss\r\nFue designada la reemplazante chimento para cubrir su situacion'),
(4, 0, 8, 0, 617, 1249, 6, '2017-11-12', NULL, 1, '2017-11-12', ''),
(5, 0, 7, 1, 737, NULL, 7, '2017-04-01', NULL, 1, '2017-11-12', 'lICEN'),
(6, 0, 1, 0, 481, 1005, 8, '2017-08-01', NULL, 1, '2017-11-12', 'Pasa a ocupar funciones jefe de quirofanos en hnvjv por jubilacuion Dr Sors'),
(7, 0, 1, 0, 896, 1000, 4, '2017-10-01', NULL, 1, '2017-11-13', ''),
(8, 1, 16, 1, 280, NULL, 9, '2017-11-01', NULL, 1, '2017-11-23', 'en Dunant'),
(9, 0, 16, 0, 585, NULL, 9, '2017-12-01', NULL, 1, '2017-11-23', 'santa teresita'),
(10, 0, 16, 1, 1221, NULL, 5, '2017-11-13', NULL, 1, '2017-11-23', 'Champagnat'),
(11, 0, 16, 1, 628, NULL, 5, '2017-11-13', NULL, 1, '2017-11-23', 'pasteur'),
(12, 0, 16, 1, 679, NULL, 5, '2017-11-13', NULL, 1, '2017-11-23', 'naranjo'),
(13, 0, 1, 0, 408, 855, 8, '2015-11-01', NULL, 1, '2017-11-13', 'sale de hnvjv a cumplir parte de su funcion en GENER en H n xona norte maternidades'),
(14, 0, 12, 0, 1288, 14, 9, '2017-01-01', NULL, 1, '2017-11-13', 'por ahora ljeior'),
(15, 0, 12, 0, 328, 1236, 10, '2016-11-01', NULL, 1, '2017-11-13', ''),
(16, 0, 12, 0, 581, 1128, 6, '2015-11-01', NULL, 1, '2017-11-13', 'paso a toxicologia'),
(17, 0, 12, 0, 247, 1153, 8, '2016-11-01', NULL, 1, '2017-11-13', 'Marcela -Alonso pasa a guardias TMO en Vilela'),
(18, 0, 4, 0, 713, 1122, 8, '2017-07-01', NULL, 1, '2017-11-13', ''),
(19, 0, 4, 0, 843, 1126, 10, '2017-09-01', NULL, 1, '2017-11-13', ''),
(20, 1, 1, 0, 1289, NULL, 11, '2017-09-04', NULL, 1, '2017-11-17', ''),
(21, 0, 12, 0, 1291, NULL, 9, '2017-06-01', NULL, 2, '2017-11-17', ''),
(23, 0, 12, 0, 1294, NULL, 9, '2017-01-01', NULL, 1, '2017-11-17', ''),
(24, 0, 1, 0, 996, NULL, 8, '2017-12-01', NULL, 1, '2017-11-21', ''),
(25, 0, 14, 1, 814, NULL, 8, '2017-11-01', NULL, 1, '2017-11-23', 'cubre a patricia ponce de leon\r\nlao y luego jubilacion 3 de enero'),
(26, 0, 14, 0, 2210, NULL, 1, '2017-11-22', NULL, 1, '2017-11-22', ''),
(27, 0, 14, 0, 118, NULL, 1, '2017-11-22', NULL, 1, '2017-11-22', ''),
(28, 0, 14, 0, 54, NULL, 1, '2018-02-01', NULL, 1, '2017-11-22', ''),
(29, 0, 14, 0, 142, NULL, 1, '2018-02-21', '2018-03-09', 1, '2017-11-22', ''),
(30, 0, 15, 0, 175, NULL, 1, '2017-11-30', NULL, 1, '2017-11-22', ''),
(31, 0, 15, 0, 2205, NULL, 1, '2017-11-22', NULL, 1, '2017-11-22', ''),
(32, 0, 15, 0, 2139, NULL, 2, '2017-11-23', NULL, 1, '2017-11-22', ''),
(33, 0, 15, 0, 1452, NULL, 3, '2017-11-23', NULL, 1, '2017-11-22', ''),
(34, 0, 15, 0, 2071, NULL, 2, '2017-11-14', NULL, 1, '2017-11-22', ''),
(35, 0, 15, 0, 986, NULL, 1, '2017-11-30', NULL, 1, '2017-11-22', ''),
(36, 0, 15, 0, 2169, NULL, 1, '2017-11-30', NULL, 1, '2017-11-22', ''),
(37, 0, 17, 0, 903, NULL, 2, '2017-11-29', NULL, 1, '2017-11-22', 'viene cubriendo Patricio lopez'),
(38, 0, 17, 0, 1896, NULL, 4, '2017-11-06', NULL, 1, '2017-11-22', 'fpp  febrero'),
(39, 0, 17, 0, 1650, NULL, 4, '2017-11-22', NULL, 1, '2017-11-22', ''),
(40, 0, 17, 0, 989, NULL, 5, '2017-11-01', NULL, 1, '2017-11-22', ''),
(41, 0, 17, 0, 2002, NULL, 2, '2017-09-12', '2017-11-15', 1, '2017-11-22', ''),
(42, 0, 12, 0, 1292, NULL, 8, '2017-10-01', NULL, 1, '2017-11-23', 'pasa a Cardiollogia '),
(43, 0, 12, 0, 396, NULL, 8, '2017-09-01', NULL, 1, '2017-11-23', 'pasa a neurologia'),
(44, 0, 12, 0, 1704, NULL, 8, '2017-09-01', NULL, 1, '2017-11-23', ''),
(45, 0, 12, 0, 1614, NULL, 8, '2017-09-01', NULL, 1, '2017-11-23', ''),
(46, 0, 12, 0, 684, NULL, 8, '2017-09-01', NULL, 1, '2017-11-23', ''),
(47, 0, 12, 0, 947, NULL, 1, '2017-12-01', NULL, 1, '2017-11-23', ''),
(48, 0, 12, 0, 662, NULL, 1, '2017-11-01', NULL, 1, '2017-11-23', ''),
(49, 0, 12, 0, 1649, NULL, 1, '2017-12-01', NULL, 1, '2017-11-23', ''),
(50, 0, 12, 0, 915, NULL, 1, '2017-12-01', NULL, 1, '2017-11-23', ''),
(51, 0, 12, 0, 1490, NULL, 1, '2017-12-01', NULL, 1, '2017-11-23', ''),
(52, 0, 12, 0, 1153, NULL, 1, NULL, NULL, 1, '2017-11-23', 'reemp cubriendo fijo??'),
(53, 0, 12, 0, 1416, NULL, 1, '2017-12-01', NULL, 1, '2017-11-23', ''),
(54, 0, 4, 0, 61, NULL, 1, NULL, NULL, 1, '2017-11-23', ''),
(55, 0, 14, 0, 696, NULL, 9, '2017-10-01', NULL, 1, '2017-12-04', ''),
(57, 0, 14, 1, 656, NULL, 1, '2017-12-04', '2017-12-11', 1, '2017-11-24', ''),
(58, 0, 4, 0, 505, NULL, 8, '2017-12-01', NULL, 1, '2017-11-27', ''),
(59, 0, 14, 1, 597, NULL, 5, '2017-11-01', NULL, 1, '2017-11-27', ''),
(60, 1, 14, 0, 343, NULL, 9, '2017-07-01', NULL, 1, '2017-12-05', ''),
(61, 0, 14, 0, 813, NULL, 5, '2017-06-01', NULL, 1, '2017-11-27', ''),
(62, 0, 14, 0, 2006, NULL, 4, '2017-12-01', NULL, 1, '2017-11-27', ''),
(63, 0, 16, 0, 104, NULL, 5, '2017-09-20', NULL, 1, '2017-11-28', 'control el 23 dic en art'),
(64, 0, 16, 0, 1930, NULL, 2, '2017-11-20', NULL, 1, '2017-11-28', ''),
(65, 0, 16, 0, 1962, NULL, 2, '2017-10-23', NULL, 1, '2017-11-28', ''),
(66, 0, 16, 0, 1892, NULL, 5, '2017-11-27', NULL, 1, '2017-11-28', ''),
(67, 0, 16, 0, 1221, NULL, 5, '2017-11-01', NULL, 3, '2017-11-28', ''),
(68, 0, 16, 0, 454, NULL, 8, '2017-12-04', NULL, 1, '2017-11-28', ''),
(69, 0, 16, 0, 462, NULL, 8, '2017-12-04', NULL, 1, '2017-11-28', ''),
(70, 0, 16, 0, 850, NULL, 8, '2017-12-04', NULL, 1, '2017-11-28', ''),
(71, 0, 18, 1, 174, NULL, 8, '2017-08-01', NULL, 1, '2017-12-05', ''),
(72, 0, 18, 0, 1340, NULL, 8, '2017-12-01', NULL, 1, '2017-11-29', ''),
(73, 0, 18, 0, 1655, NULL, 5, '2016-05-15', NULL, 1, '2017-11-29', 'fono y deglucion'),
(74, 0, 1, 0, 367, NULL, 5, '2017-11-01', NULL, 1, '2017-12-13', ''),
(75, 0, 1, 1, 1944, NULL, 12, '2017-12-01', NULL, 1, '2017-12-14', ''),
(76, 0, 1, 0, 855, NULL, 1, '2017-12-22', '2018-01-12', 1, '2017-12-14', ''),
(77, 0, 1, 0, 660, NULL, 1, '2018-02-20', '2018-03-13', 1, '2017-12-14', ''),
(78, 0, 8, 0, 1523, NULL, 1, '2018-02-01', NULL, 1, '2018-01-18', 'piensa renunciar por viaje al sur ');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `auth_group` (
`id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
`id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `auth_group_permissions`:
--   `group_id`
--       `auth_group` -> `id`
--   `permission_id`
--       `auth_permission` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
`id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `auth_permission`:
--   `content_type_id`
--       `django_content_type` -> `id`
--

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add Dia Semana', 7, 'add_dia_sm'),
(20, 'Can change Dia Semana', 7, 'change_dia_sm'),
(21, 'Can delete Dia Semana', 7, 'delete_dia_sm'),
(22, 'Can add Funcion', 8, 'add_func_lab'),
(23, 'Can change Funcion', 8, 'change_func_lab'),
(24, 'Can delete Funcion', 8, 'delete_func_lab'),
(25, 'Can add Estado Laboral', 9, 'add_status_lab'),
(26, 'Can change Estado Laboral', 9, 'change_status_lab'),
(27, 'Can delete Estado Laboral', 9, 'delete_status_lab'),
(28, 'Can add Categoria ', 10, 'add_categoria_lab'),
(29, 'Can change Categoria ', 10, 'change_categoria_lab'),
(30, 'Can delete Categoria ', 10, 'delete_categoria_lab'),
(31, 'Can add Cambio Estado', 11, 'add_registro_status'),
(32, 'Can change Cambio Estado', 11, 'change_registro_status'),
(33, 'Can delete Cambio Estado', 11, 'delete_registro_status'),
(34, 'Can add registro_categorias', 12, 'add_registro_categorias'),
(35, 'Can change registro_categorias', 12, 'change_registro_categorias'),
(36, 'Can delete registro_categorias', 12, 'delete_registro_categorias'),
(37, 'Can add Profesion', 13, 'add_profesion'),
(38, 'Can change Profesion', 13, 'change_profesion'),
(39, 'Can delete Profesion', 13, 'delete_profesion'),
(40, 'Can add Especialidad', 14, 'add_especialidad'),
(41, 'Can change Especialidad', 14, 'change_especialidad'),
(42, 'Can delete Especialidad', 14, 'delete_especialidad'),
(43, 'Can add registro_especialidad', 15, 'add_registro_especialidad'),
(44, 'Can change registro_especialidad', 15, 'change_registro_especialidad'),
(45, 'Can delete registro_especialidad', 15, 'delete_registro_especialidad'),
(46, 'Can add Area de Dependencia', 16, 'add_areadependencia'),
(47, 'Can change Area de Dependencia', 16, 'change_areadependencia'),
(48, 'Can delete Area de Dependencia', 16, 'delete_areadependencia'),
(49, 'Can add Trabajador', 17, 'add_trabajador'),
(50, 'Can change Trabajador', 17, 'change_trabajador'),
(51, 'Can delete Trabajador', 17, 'delete_trabajador'),
(52, 'Can add contrato', 18, 'add_contrato'),
(53, 'Can change contrato', 18, 'change_contrato'),
(54, 'Can delete contrato', 18, 'delete_contrato'),
(55, 'Can add reemplazo', 19, 'add_reemplazo'),
(56, 'Can change reemplazo', 19, 'change_reemplazo'),
(57, 'Can delete reemplazo', 19, 'delete_reemplazo'),
(58, 'Can add extension', 20, 'add_extension'),
(59, 'Can change extension', 20, 'change_extension'),
(60, 'Can delete extension', 20, 'delete_extension'),
(61, 'Can add Asignacion', 21, 'add_asigna_lab'),
(62, 'Can change Asignacion', 21, 'change_asigna_lab'),
(63, 'Can delete Asignacion', 21, 'delete_asigna_lab'),
(64, 'Can add Solicitud Recurso', 22, 'add_clm_asigna'),
(65, 'Can change Solicitud Recurso', 22, 'change_clm_asigna'),
(66, 'Can delete Solicitud Recurso', 22, 'delete_clm_asigna'),
(67, 'Can add institucion', 23, 'add_institucion'),
(68, 'Can change institucion', 23, 'change_institucion'),
(69, 'Can delete institucion', 23, 'delete_institucion'),
(70, 'Can add servicio', 24, 'add_servicio'),
(71, 'Can change servicio', 24, 'change_servicio'),
(72, 'Can delete servicio', 24, 'delete_servicio'),
(73, 'Can add tipo_ ausencia_trb', 25, 'add_tipo_ausencia_trb'),
(74, 'Can change tipo_ ausencia_trb', 25, 'change_tipo_ausencia_trb'),
(75, 'Can delete tipo_ ausencia_trb', 25, 'delete_tipo_ausencia_trb'),
(76, 'Can add Ausencia TRB', 26, 'add_ausencia_trb'),
(77, 'Can change Ausencia TRB', 26, 'change_ausencia_trb'),
(78, 'Can delete Ausencia TRB', 26, 'delete_ausencia_trb'),
(79, 'Can add sqlscript', 27, 'add_sql_script'),
(80, 'Can change sqlscript', 27, 'change_sql_script'),
(81, 'Can delete sqlscript', 27, 'delete_sql_script'),
(82, 'Can add Dia Semanal', 28, 'add_dds'),
(83, 'Can change Dia Semanal', 28, 'change_dds'),
(84, 'Can delete Dia Semanal', 28, 'delete_dds');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `auth_user` (
`id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$15000$hIEDndPCGfUD$ZRNy2Rwx2sdbilW27NCcj0q/5uTgljaG+0w5auc9Iq8=', '2018-02-09 23:32:41', 1, 'fico', '', '', 'ficochiossone@yahoo.com', 1, 1, '2018-01-17 21:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `auth_user_groups`:
--   `group_id`
--       `auth_group` -> `id`
--   `user_id`
--       `auth_user` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `auth_user_user_permissions`:
--   `user_id`
--       `auth_user` -> `id`
--   `permission_id`
--       `auth_permission` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `clamaxasigna`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `clamaxasigna` (
`id` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `trb_sugerido_id` int(11) DEFAULT NULL,
  `tipoasignacion` varchar(12) COLLATE utf8_bin NOT NULL,
  `areadep_id` int(11) DEFAULT NULL,
  `institucion_id` int(11) DEFAULT NULL,
  `funcion_id` int(11) NOT NULL,
  `espec_id` int(11) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `modosemanal` varchar(18) COLLATE utf8_bin NOT NULL,
  `horasxdia` int(11) NOT NULL,
  `comentarios` longtext COLLATE utf8_bin,
  `xausenciatrab_id` int(11) DEFAULT NULL,
  `usuario_registro_id` int(11) DEFAULT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `clamaxasigna`:
--   `areadep_id`
--       `areasdependencia` -> `id`
--   `espec_id`
--       `especialidades` -> `id`
--   `funcion_id`
--       `funclabs` -> `id`
--   `institucion_id`
--       `instituciones` -> `id`
--   `trb_sugerido_id`
--       `trabajadores` -> `id`
--   `xausenciatrab_id`
--       `ausencias_trbs` -> `id`
--

--
-- Dumping data for table `clamaxasigna`
--

INSERT INTO `clamaxasigna` (`id`, `activo`, `trb_sugerido_id`, `tipoasignacion`, `areadep_id`, `institucion_id`, `funcion_id`, `espec_id`, `fecha_inicio`, `fecha_fin`, `modosemanal`, `horasxdia`, `comentarios`, `xausenciatrab_id`, `usuario_registro_id`, `fecha_registro`) VALUES
(3, 1, 1235, 'REG', 12, 4, 13, NULL, '2017-12-01', NULL, 'TLD', 24, '', 21, 1, '2017-11-22'),
(5, 1, NULL, 'REG', 14, 1, 13, NULL, '2017-12-03', NULL, 'XTR', 24, '', 62, 1, '2017-11-27'),
(6, 1, 1153, 'REG', 12, 4, 14, NULL, '2017-12-01', NULL, 'TLD', 24, '', 17, 1, '2017-11-22'),
(7, 1, 1236, 'REG', 12, 4, 13, NULL, '2017-12-01', NULL, 'TLD', 24, '', 15, 1, '2017-11-22'),
(8, 1, NULL, 'REG', 4, 1, 1, NULL, '2017-12-03', NULL, 'XTR', 24, '', 25, 1, '2017-11-22'),
(9, 1, NULL, 'REG', 4, 1, 1, 6, '2017-12-07', NULL, 'TLD', 24, 'son 4 jueves', 25, 1, '2017-11-23'),
(10, 1, NULL, 'REG', 14, 1, 1, 6, '2017-12-24', NULL, 'XTR', 12, '', 25, 1, '2017-11-27'),
(11, 1, NULL, 'REG', 14, 1, 1, NULL, '2018-01-03', NULL, 'XTR', 24, '', 26, 1, '2017-11-22'),
(12, 1, NULL, 'REG', 14, 1, 1, NULL, '2018-01-10', NULL, 'XTR', 24, '', 26, 1, '2017-11-22'),
(13, 1, NULL, 'REG', 14, 1, 1, NULL, '2018-01-06', NULL, 'XTR', 24, '', 26, 1, '2017-11-22'),
(15, 1, NULL, 'REG', 14, 1, 1, NULL, '2018-01-13', NULL, 'XTR', 24, 'pediatria', 27, 1, '2017-11-22'),
(16, 1, NULL, 'REG', 4, 1, 1, 6, '2018-01-15', NULL, 'XTR', 24, '', 27, 1, '2017-11-27'),
(17, 1, NULL, 'REG', 14, 1, 1, NULL, '2018-01-22', NULL, 'XTR', 24, '', 27, 1, '2017-11-22'),
(18, 1, NULL, 'REG', 14, 1, 1, NULL, '2018-01-29', NULL, 'XTR', 24, '', 27, 1, '2017-11-22'),
(19, 1, NULL, 'REG', 14, 1, 1, 6, '2018-02-04', NULL, 'XTR', 24, '', 28, 1, '2017-11-22'),
(20, 1, NULL, 'REG', 14, 1, 1, 6, '2018-02-06', NULL, 'XTR', 24, '', 28, 1, '2017-11-22'),
(21, 1, NULL, 'REG', 14, 1, 1, 6, '2018-02-13', NULL, 'XTR', 24, '', 28, 1, '2017-11-22'),
(22, 1, NULL, 'REG', 16, 12, 5, NULL, '2017-12-15', NULL, 'TLD', 6, '', 63, 1, '2017-11-28'),
(23, 1, NULL, 'REG', 16, 13, 5, 3, '2017-12-15', NULL, 'TLD', 6, 'sdsadasda', NULL, 1, '2017-11-27'),
(24, 1, NULL, 'REG', 16, 14, 5, NULL, '2017-12-15', NULL, 'TLD', 8, '', NULL, 1, '2017-11-22'),
(25, 1, NULL, 'REG', 16, 15, 5, NULL, '2017-12-15', NULL, 'TLD', 8, '', NULL, 1, '2017-11-22'),
(26, 1, 1204, 'REG', 17, 3, 13, NULL, '2017-11-15', NULL, 'TLD', 24, '', 38, 1, '2017-11-22'),
(27, 1, NULL, 'REG', 4, 9, 1, 4, '2017-12-30', NULL, 'XTR', 24, '', 54, 1, '2017-11-23'),
(28, 1, NULL, 'REG', 4, 9, 1, 4, '2017-12-25', NULL, 'XTR', 24, '', 54, 1, '2017-11-23'),
(33, 1, NULL, 'REG', 15, 2, 14, 3, '2017-12-09', NULL, 'XTR', 24, '', NULL, 1, '2017-11-24'),
(34, 1, NULL, 'REG', 15, 2, 14, 3, '2017-12-24', NULL, 'XTR', 12, '', NULL, 1, '2017-11-24'),
(35, 1, NULL, 'REG', 15, 2, 14, 3, '2017-12-25', NULL, 'XTR', 12, 'nocturana', NULL, 1, '2017-11-24'),
(36, 1, NULL, 'REG', 15, 2, 14, 3, '2017-12-31', NULL, 'XTR', 12, '', NULL, 1, '2017-11-24'),
(37, 1, NULL, 'REG', 4, 1, 6, 3, '2017-12-04', NULL, 'TLD', 6, '', 57, 1, '2017-11-24'),
(38, 1, NULL, 'REG', 14, 1, 1, 4, '2017-12-01', NULL, 'TLD', 24, '', 58, 1, '2017-11-27'),
(39, 1, NULL, 'REG', 14, 1, 10, 3, '2017-12-01', NULL, 'TLD', 24, '', 61, 1, '2017-11-27'),
(40, 1, NULL, 'REG', 14, 1, 10, 3, '2017-12-01', NULL, 'TLD', 24, '', 62, 1, '2017-11-27'),
(41, 1, NULL, 'REG', 16, 5, 16, NULL, '2017-12-04', NULL, 'TLD', 10, 'repartira labor en psm  rosello jbjusto\r\nsugerida dipato', 64, 1, '2017-11-28'),
(42, 1, NULL, 'REG', 16, 16, 5, 3, '2017-12-04', NULL, 'TLD', 6, '', 68, 1, '2017-11-28'),
(43, 1, NULL, 'REG', 16, 17, 5, 5, '2017-12-04', NULL, 'TLD', 7, '', 69, 1, '2017-11-28'),
(44, 1, NULL, 'REG', 16, 18, 5, 15, '2018-02-01', NULL, 'TLD', 6, '', 70, 1, '2017-11-28'),
(45, 1, NULL, 'REG', 18, 11, 13, 3, '2017-12-01', NULL, 'TLD', 24, '', 71, 1, '2017-11-29'),
(46, 1, NULL, 'REG', 18, 11, 6, 3, '2017-12-01', NULL, 'TLD', 6, '', NULL, 1, '2017-11-29'),
(47, 1, NULL, 'REG', 18, 11, 6, 3, '2017-12-01', NULL, 'TLD', 12, '', NULL, 1, '2017-11-29'),
(48, 1, NULL, 'REG', 17, 3, 14, 3, '2017-12-18', NULL, 'XTR', 12, '', NULL, 1, '2017-11-30'),
(49, 1, NULL, 'REG', 17, 3, 14, 3, '2017-12-10', NULL, 'XTR', 24, '', NULL, 1, '2017-11-30'),
(50, 1, NULL, 'REG', 17, 3, 14, 3, '2017-12-17', NULL, 'XTR', 12, '', NULL, 1, '2017-11-30'),
(51, 1, NULL, 'REG', 17, 3, 14, 3, '2017-12-26', NULL, 'XTR', 24, '', NULL, 1, '2017-11-30'),
(52, 1, NULL, 'REG', 17, 3, 14, 3, '2017-12-31', NULL, 'XTR', 24, '', NULL, 1, '2017-11-30'),
(53, 1, 854, 'REG', 1, 1, 6, 1, '2018-04-01', NULL, 'TLD', 6, '', NULL, NULL, '2017-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `clamaxasigna_dds`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `clamaxasigna_dds` (
`id` int(11) NOT NULL,
  `clm_asigna_id` int(11) NOT NULL,
  `dds_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `clamaxasigna_dds`:
--   `clm_asigna_id`
--       `clamaxasigna` -> `id`
--   `dds_id`
--       `dataextra_dds` -> `id`
--

--
-- Dumping data for table `clamaxasigna_dds`
--

INSERT INTO `clamaxasigna_dds` (`id`, `clm_asigna_id`, `dds_id`) VALUES
(6, 3, 1),
(79, 5, 1),
(7, 6, 2),
(8, 7, 3),
(9, 8, 7),
(52, 9, 4),
(75, 10, 7),
(18, 11, 3),
(19, 12, 3),
(23, 13, 6),
(24, 15, 6),
(70, 16, 1),
(26, 17, 1),
(27, 18, 1),
(28, 19, 7),
(29, 20, 2),
(30, 21, 2),
(80, 22, 1),
(81, 22, 2),
(82, 22, 3),
(73, 23, 1),
(74, 23, 2),
(36, 24, 1),
(37, 24, 2),
(38, 24, 3),
(43, 25, 1),
(44, 25, 2),
(45, 25, 3),
(46, 25, 4),
(48, 26, 5),
(51, 27, 6),
(50, 28, 1),
(58, 33, 6),
(64, 34, 7),
(60, 35, 1),
(62, 36, 7),
(65, 37, 1),
(66, 37, 2),
(67, 37, 3),
(68, 37, 4),
(69, 37, 5),
(76, 38, 5),
(77, 39, 5),
(78, 40, 1),
(88, 41, 1),
(89, 41, 2),
(90, 41, 3),
(91, 41, 4),
(92, 41, 5),
(93, 42, 1),
(94, 42, 2),
(95, 42, 3),
(96, 42, 4),
(97, 42, 5),
(98, 43, 1),
(99, 43, 2),
(100, 43, 3),
(101, 43, 4),
(102, 43, 5),
(103, 44, 1),
(104, 44, 2),
(105, 44, 3),
(106, 44, 4),
(107, 44, 5),
(116, 45, 2),
(115, 46, 6),
(114, 47, 7),
(119, 48, 1),
(118, 49, 7),
(120, 50, 7),
(121, 51, 2),
(122, 52, 7),
(123, 53, 5);

-- --------------------------------------------------------

--
-- Table structure for table `contratos`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `contratos` (
`id` int(11) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  `nhoras` int(11) DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `usuario_registro_id` int(11) NOT NULL,
  `xausenciatrab_id` int(11) DEFAULT NULL,
  `fecha_insert` date NOT NULL,
  `fecha_cobro` datetime DEFAULT NULL,
  `comentarios` longtext COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `contratos`:
--   `trabajador_id`
--       `trabajadores` -> `id`
--   `xausenciatrab_id`
--       `ausencias_trbs` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `dataextra_dds`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `dataextra_dds` (
`id` int(11) NOT NULL,
  `nombre` varchar(14) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(6) COLLATE utf8_bin NOT NULL,
  `num` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `dataextra_dds`
--

INSERT INTO `dataextra_dds` (`id`, `nombre`, `codigo`, `num`) VALUES
(1, 'Lunes', 'LUN', 0),
(2, 'Martes', 'MAR', 0),
(3, 'Miercoles', 'MIE', 0),
(4, 'Jueves', 'JUE', 0),
(5, 'Viernes', 'VIE', 0),
(6, 'Sabado', 'SAB', 0),
(7, 'Domingo', 'DOM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ddlasem`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `ddlasem` (
`id` int(11) NOT NULL,
  `nombre` varchar(12) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(6) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
`id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `django_admin_log`:
--   `user_id`
--       `auth_user` -> `id`
--   `content_type_id`
--       `django_content_type` -> `id`
--

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-01-17 21:31:42', '2034', 'QUIROGA  VALERIA SOLEDAD-- (MGNRL)', 2, 'Modifica especialidad_1.', 17, 1),
(2, '2018-01-17 23:28:00', '1505', 'CEPEDA  ZARIAGA JAVIER SEBASTIA-- ( )', 3, '', 17, 1),
(3, '2018-01-17 23:31:58', '1', 'MD - MEDICO', 2, 'Modifica nombre.', 13, 1),
(4, '2018-01-17 23:32:35', '2', 'ENF - ENFERMERO', 2, 'Modifica nombre.', 13, 1),
(5, '2018-01-17 23:33:24', '157', 'ABDALA  MARCELO ALBERTO-- ( )', 2, 'Modifica profesion.', 17, 1),
(6, '2018-01-18 15:47:55', '2261', 'MENOYO  VIRGINIA-- (NNTGIA)', 1, '', 17, 1),
(7, '2018-01-18 15:52:40', '78', 'CLARICH  ILEANA FERNANDA LUJAN-- ( )  LAO-- D:2018-02-01', 1, '', 26, 1),
(8, '2018-01-18 16:47:53', '1', '2018-01-01 - CRIPOVICH  ALEJANDRINA-- ( ) => PPT - PLANTA TRANSITORIA', 1, '', 11, 1),
(9, '2018-01-18 16:49:24', '92', 'CRIPOVICH  HNVILELA-   Jueves - ', 1, '', 21, 1),
(10, '2018-01-19 13:02:46', '1148', 'LOPEZ PAPUCCI  PEDRO AGUSTIN-- (PDTRIA)', 2, 'Modifica apellido y nombre.', 17, 1),
(11, '2018-01-19 13:03:44', '222', 'LOPEZ PAPUCCI  SANTIAGO-- (PDTRIA)', 2, 'Modifica apellido, nombre, mr_statuslab, especialidad_1 y profesion.', 17, 1),
(12, '2018-01-19 13:14:09', '1287', 'ZEBALLOS  VIRGINIA-- (NNTGIA)', 2, 'Modifica especialidad_1 y profesion.', 17, 1),
(13, '2018-01-19 13:14:35', '1283', 'CEPEDA  RODRIGO-- (NNTGIA)', 2, 'Modifica mr_statuslab, especialidad_1 y profesion.', 17, 1),
(14, '2018-01-19 13:14:52', '2261', 'MENOYO  VIRGINIA-- (NNTGIA)', 2, 'Modifica mr_statuslab.', 17, 1),
(15, '2018-01-21 23:27:40', '1827', 'LIZZI  CRISTIAN JORGE-- ( )', 3, '', 17, 1),
(16, '2018-01-21 23:27:51', '1290', 'LIZZI  CRISTIAN-- ( )', 2, 'Modifica mr_legajo.', 17, 1),
(17, '2018-01-22 12:52:36', '2261', 'MENOYO  VIRGINIA-- (NNTGIA)', 2, 'Modifica mr_statuslab.', 17, 1),
(18, '2018-01-22 12:53:51', '2262', 'DURE MADARIAGA  PAULA-- (NNTGIA)', 1, '', 17, 1),
(19, '2018-01-22 12:59:40', '2262', 'DURE MADARIAGA  PAULA-- (NNTGIA)', 2, 'Modifica mr_legajo.', 17, 1),
(20, '2018-01-22 13:01:34', '76', '2017-10-01 - DURE MADARIAGA  PAULA-- (NNTGIA) => RMPLZ - REEMPLAZANTE AUTORIZADO', 1, '', 11, 1),
(21, '2018-01-22 13:26:35', '333', 'PAZ  GUIDO ULISES-- (GCOBST)', 2, 'Modifica mr_statuslab, especialidad_1 y profesion.', 17, 1),
(22, '2018-01-22 13:28:22', '694', 'TEPPAZ  DANIEL OMAR-- (GCOBST)', 2, 'Modifica mr_statuslab, especialidad_1 y profesion.', 17, 1),
(23, '2018-01-22 13:29:17', '1284', 'ALBANESI  MICAELA-- ( )', 2, 'Modifica mr_statuslab.', 17, 1),
(24, '2018-01-22 13:30:03', '1145', 'BERNAUS  MARIANELA-- (CGRAL)', 2, 'Modifica mr_statuslab.', 17, 1),
(25, '2018-01-22 13:30:49', '1217', 'BLANCO  LUCRECIA-- ( )', 2, 'Modifica mr_statuslab.', 17, 1),
(26, '2018-01-23 13:39:07', '93', 'RANALLI  HNVILELA-   Martes - ', 1, '', 21, 1),
(27, '2018-01-23 13:42:53', '94', 'RANALLI  HRSP-   Jueves - ', 1, '', 21, 1),
(28, '2018-01-23 13:45:55', '95', 'RANALLI  HRSP-   Jueves - ', 1, '', 21, 1),
(29, '2018-01-23 13:46:30', '69', 'RANALLI  HNVILELA-   Jueves - ', 2, 'Modifica fecha_fin.', 21, 1),
(30, '2018-01-23 13:53:05', '96', 'RANALLI  HRSP-   Lunes - ', 1, '', 21, 1),
(31, '2018-01-24 10:24:52', '69', 'RANALLI  HNVILELA-   Jueves - ', 2, 'Modifica activo.', 21, 1),
(32, '2018-01-25 14:13:32', '2180', 'THORKELSEN  NADIA AYELEN-- (FSATRIA)', 2, 'Modifica mr_statuslab y especialidad_1.', 17, 1),
(33, '2018-02-09 23:36:16', '97', 'AMELONG  HNVILELA-   Lunes - ', 1, '', 21, 1),
(34, '2018-02-09 23:38:10', '98', 'AMELONG  HNVILELA-   Miercoles - ', 1, '', 21, 1),
(35, '2018-02-09 23:41:07', '48', 'CEPEDA  PSM-   Lunes - Miercoles - Jueves - ', 2, 'Modifica dds.', 21, 1),
(36, '2018-02-09 23:42:26', '99', 'CEPEDA  HRSP-   Viernes - ', 1, '', 21, 1),
(37, '2018-02-09 23:43:50', '100', 'CEPEDA  CEMAR-   Martes - ', 1, '', 21, 1),
(38, '2018-02-09 23:44:51', '99', 'CEPEDA  HRSP-   Viernes - ', 2, 'Modifica espec y areadep.', 21, 1),
(39, '2018-02-09 23:45:11', '48', 'CEPEDA  PSM-   Lunes - Miercoles - Jueves - ', 2, 'Modifica espec.', 21, 1),
(40, '2018-02-10 00:08:46', '101', 'MAHFUD  HNVILELA-   Lunes - Martes - Miercoles - Jueves - Viernes - Sabado - Domingo - ', 1, '', 21, 1),
(41, '2018-02-10 00:10:36', '102', 'LOMBARDO  HECA-   Lunes - Martes - Miercoles - Jueves - Viernes - Sabado - Domingo - ', 1, '', 21, 1),
(42, '2018-02-10 00:13:03', '103', 'D ELIA  HNVILELA-   Lunes - Martes - Miercoles - Jueves - Viernes - Sabado - Domingo - ', 1, '', 21, 1),
(43, '2018-02-10 00:17:30', '307', 'BATLE  JOSE-- (OYT)', 2, 'Modifica mr_statuslab, especialidad_1 y profesion.', 17, 1),
(44, '2018-02-10 00:17:59', '812', 'SANMARTI  ROBERTO ALEJANDRO-- (OYT)', 2, 'Modifica mr_statuslab, especialidad_1 y profesion.', 17, 1),
(45, '2018-02-10 00:19:00', '2108', 'SANMARTI  CARLOS ARSENIO-- ( )', 2, 'Modifica mr_statuslab.', 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
`id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'Dia Semana', 'servicios', 'dia_sm'),
(8, 'Funcion', 'servicios', 'func_lab'),
(9, 'Estado Laboral', 'servicios', 'status_lab'),
(10, 'Categoria ', 'servicios', 'categoria_lab'),
(11, 'Cambio Estado', 'servicios', 'registro_status'),
(12, 'registro_categorias', 'servicios', 'registro_categorias'),
(13, 'Profesion', 'servicios', 'profesion'),
(14, 'Especialidad', 'servicios', 'especialidad'),
(15, 'registro_especialidad', 'servicios', 'registro_especialidad'),
(16, 'Area de Dependencia', 'servicios', 'areadependencia'),
(17, 'Trabajador', 'servicios', 'trabajador'),
(18, 'contrato', 'servicios', 'contrato'),
(19, 'reemplazo', 'servicios', 'reemplazo'),
(20, 'extension', 'servicios', 'extension'),
(21, 'Asignacion', 'servicios', 'asigna_lab'),
(22, 'Solicitud Recurso', 'servicios', 'clm_asigna'),
(23, 'institucion', 'entornos', 'institucion'),
(24, 'servicio', 'entornos', 'servicio'),
(25, 'tipo_ ausencia_trb', 'ausencias', 'tipo_ausencia_trb'),
(26, 'Ausencia TRB', 'ausencias', 'ausencia_trb'),
(27, 'sqlscript', 'dataextra', 'sql_script'),
(28, 'Dia Semanal', 'dataextra', 'dds');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
`id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-01-17 16:55:19'),
(2, 'auth', '0001_initial', '2018-01-17 16:55:23'),
(3, 'admin', '0001_initial', '2018-01-17 16:55:24'),
(4, 'sessions', '0001_initial', '2018-01-17 16:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5cjpn2rkkqnb3jazq63tm35hfw203uxo', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-11 13:34:47'),
('g0u0su1d1k1lr4vktalvk3lm988lcdbg', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-05 02:53:16'),
('hvv77pam1fwzkslervpfs0im6ud2hh6c', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-02 12:02:53'),
('hxnk1xsucigben2hdyje2s8thc8wm7uy', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-05 15:06:43'),
('ibi4phytu5pfgdea1emomar2wid1r46m', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-01-31 23:23:20'),
('ke57sy37igquo4jir6jqsisc38ejuvsu', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-01 12:00:22'),
('kiw64s7kw2wtjh9t1io6zcbhsteeuf1a', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-01-31 21:18:54'),
('lns7o24yt2ql1npz3t12q1ng3v9r59gq', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-01 15:45:00'),
('mhebjymdthigmzlt24x1r4tk6rcsiqt4', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-12 16:36:30'),
('nv2han9a5c426pzc5qbt68k8rz5m69st', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-06 13:35:51'),
('oucbhjg2lndk3m4u5siby948na283mum', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-05 12:50:53'),
('s3qk6j2qa8turfpov4y9vdpyfmv51qje', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-05 14:20:18'),
('sje0pf5ej3ngftkmtflxlo3sd0dzduyq', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-10 13:01:31'),
('uem8xrvzlpv9sxr39p20skb4kdq8fctc', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-05 14:01:44'),
('uhnhplzkejfuhle8sk4b6sxocqn693sl', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-23 23:32:41'),
('vk94qk53q64ofce8zfa4fx6kd9uehf5b', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-07 10:23:49'),
('vq4bn4m2taevrhzpqk9wvgcrnjm9yrk7', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-04 23:13:08'),
('vqtzbgye4b3uft1074zwnpx2g2x0xhy7', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-08 14:12:39'),
('w9fsayu7lbjgvh0wyqvjzyl3tquzd3lc', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-22 21:30:06'),
('yf1s35hqj6xfovclgq103cmnkc1k9rlm', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-16 00:25:44'),
('yyjnju4c6s99sh2ga2jz8eump6d5xkur', 'MGJlMTM2Yjg0ZWJkNDcxYzgxYmQzODdjNThkYzBiOThmMTE3Y2FjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTdkN2FmYTAxMDI2MDBiZWM1Y2ZlZWQzZWVhNTAwODRmZTRjZTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2018-02-12 14:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `especialidades`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `especialidades` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`, `codigo`) VALUES
(1, 'Ortopedia y Traumatologia', 'OYT'),
(2, 'Cardiologia', 'CRDLG'),
(3, 'Clinica Medica', 'CLMD'),
(4, 'Ginecologia y Obstetricia', 'GCOBST'),
(5, 'Pediatria', 'PDTRIA'),
(6, 'Neonatologia', 'NNTGIA'),
(7, 'Cirugia general', 'CGRAL'),
(8, 'Nefrologia', 'NFRLGIA'),
(9, 'Oncologia', 'ONCGIA'),
(10, 'Oftalmologia', 'OFTGIA'),
(11, 'Endocrinologia', 'ENDLGIA'),
(12, 'Diagnostico x Imagenes', 'DGXIMG'),
(13, 'Dermatologia', 'DRMTGIA'),
(14, 'Fisiatria', 'FSATRIA'),
(15, 'MGeneral', 'MGNRL'),
(17, 'Hemoterapia', 'HMTRPIA'),
(18, 'Neurocirugia', 'NRCGIA'),
(19, 'Otorrinolaringologia', 'OTRLRGIA'),
(20, 'Psiquiatria', 'PSQTRIA'),
(21, 'Reumatologia', 'RMTLGIA'),
(22, 'Obstetricia', 'OBSTTRA'),
(23, 'Ecografia', 'ECGRAFIA'),
(24, 'Urologia', 'UROLOGIA'),
(25, 'Neurologia', 'NRLGIA');

-- --------------------------------------------------------

--
-- Table structure for table `extensiones`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `extensiones` (
`id` int(11) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  `asignalab_id` int(11) NOT NULL,
  `xausenciatrab_id` int(11) DEFAULT NULL,
  `nhoras` int(11) DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `usuario_registro_id` int(11) NOT NULL,
  `fecha_insert` date NOT NULL,
  `fecha_cobro` datetime DEFAULT NULL,
  `comentarios` longtext COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `extensiones`:
--   `asignalab_id`
--       `asignalabs` -> `id`
--   `trabajador_id`
--       `trabajadores` -> `id`
--   `xausenciatrab_id`
--       `ausencias_trbs` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `funclabs`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `funclabs` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(12) COLLATE utf8_bin NOT NULL,
  `descripcion` longtext COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `funclabs`
--

INSERT INTO `funclabs` (`id`, `nombre`, `codigo`, `descripcion`) VALUES
(1, 'guardia activa especializada', 'GASP', 'Atencion pacs ambulatorios que ingresan x guardia.\r\nAtencion pacs internados en Sala .Cirugias de urgenciay programadas .\r\nInterconsultas .....'),
(3, 'guardia pasiva especialista', 'GPSP', 'Descripcion ...\r\nAl llamado para evacuar consultas x a distancia y posibilidad de concurrir en tiempo breve de acuerdo a \r\ndisposicion del jefe del servicio al que pertenece. '),
(4, 'Consulta Con Acto Unico', 'CAU', 'Descripcion ...'),
(5, 'Consultorio Externo ', 'CEX', 'Descripcion ...'),
(6, 'Sala Internacion', 'INTS', 'Cuidados pacs internados en Salas.Evolucion .Indicacion .Interconsultas.'),
(7, 'Cirugia Programada', 'CGPG', 'Descripcion'),
(8, 'Docencia postgrado', 'DOCPOSTG', 'Descripcion ...'),
(9, 'docencia pregrado', 'DOCPREG', 'Descripcion ...'),
(10, 'Guardia General Activa', 'GGA', 'Descripcion ...'),
(11, 'Jefatura Servicio', 'JFTSRVCIO', 'Descripcion ...'),
(12, 'COORDINACION C EXTERNO', 'COORDCEXT', 'Descripcion ...'),
(13, 'Guardia Externa', 'GGEX', 'Descripcion ...'),
(14, 'Guardia Interna Activa', 'GGINT', 'Descripcion ...'),
(15, 'Ecocardiografia', 'ECOGRAFIA', 'Descripcion ...'),
(16, 'TrsApoyoMatricial', 'TRBSAM', 'Descripcion ...'),
(17, 'Ateneo Asistencial Servicio', 'ATENEO', 'Descripcion ...'),
(18, 'auditoria ', 'ADTRIA', 'Descripcion ...');

-- --------------------------------------------------------

--
-- Table structure for table `instituciones`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `instituciones` (
`id` int(11) NOT NULL,
  `nombre` varchar(64) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(12) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(64) COLLATE utf8_bin NOT NULL,
  `domicilio` varchar(128) COLLATE utf8_bin NOT NULL,
  `telefonos` varchar(128) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `web` varchar(200) COLLATE utf8_bin NOT NULL,
  `comentarios` longtext COLLATE utf8_bin
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `instituciones`
--

INSERT INTO `instituciones` (`id`, `nombre`, `codigo`, `descripcion`, `domicilio`, `telefonos`, `email`, `web`, `comentarios`) VALUES
(1, 'Hospital Roque Saenz Peña', 'HRSP', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(2, 'Hospital Carrasco', 'HICARRASCO', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(3, 'hospital de emergencias Clemente Alvarez', 'HECA', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(4, 'Hospital de Niños Victor J Vilela', 'HNVILELA', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(5, 'Policlinico San Martín', 'PSM', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(6, 'Instituto Liga Antipolio Rosario', 'ILAR', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(7, 'Centro Medicina ambulatoria Rosario', 'CEMAR', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(8, 'Centro salud Juana Azurduy', 'CSMJAZURDUY', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(9, 'Maternidad martin', 'MMRTIN', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(10, 'Centro Salud Casiano Casas', 'CSMCASCAS', 'Descripcion..', 'Casiano cassas', '341 ....', '', '', 'Comentarios...'),
(11, 'Hospital Alberdi', 'HALBERDI', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(12, 'C S Elena Bazet', 'CSEBAZET', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(13, 'CS San MartinA', 'CSMSMARTINA', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(14, 'CSBarrioPlata', 'CSMBRRPLATA', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(15, 'CS Ugarte', 'CSMUGARTE', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(16, 'Centro SM A Moreau', 'CSMAMOREAU', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(17, 'CS Eva Duarte', 'CSMEVADUARTE', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(18, 'Vecinal Roca', 'CSMVECROCA', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(19, 'VECINAL VICTOR CUE', 'VVICTORCUE', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...');

-- --------------------------------------------------------

--
-- Table structure for table `mr_categorias`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `mr_categorias` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(8) COLLATE utf8_bin NOT NULL,
  `descripcion` longtext COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `mr_status`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `mr_status` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(8) COLLATE utf8_bin NOT NULL,
  `descripcion` longtext COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `mr_status`
--

INSERT INTO `mr_status` (`id`, `nombre`, `codigo`, `descripcion`) VALUES
(1, 'Reemplazante autorizado', 'RMPLZ', 'Descr....'),
(2, 'Planta transitoria', 'PPT', 'Descr....'),
(3, 'Planta permanente', 'PPP', 'Descr....P'),
(4, 'Pasante', 'pss', 'Descr....P'),
(5, 'Concursante', 'Cncrste', 'Descr....P');

-- --------------------------------------------------------

--
-- Table structure for table `profesiones`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `profesiones` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `profesiones`
--

INSERT INTO `profesiones` (`id`, `nombre`, `codigo`) VALUES
(1, 'MEDICO', 'MD'),
(2, 'ENFERMERO', 'ENF'),
(3, 'Licenciada en Obstetricia', 'LOBSTR'),
(4, 'Bioquimico', 'BQMCO'),
(5, 'Farmaceutico', 'FRMCTCO'),
(6, 'Fonoaudiologo', 'FNADLGO'),
(7, 'Kinesiologo', 'KNSLOGO'),
(8, 'Operario', 'OPRARIO'),
(9, 'Administrativo', 'ADMNSTVO'),
(10, 'Psicologo', 'PSCLGO'),
(11, 'Trabajador Social', 'TRBSCAL'),
(12, 'Odontologo', 'ODNTLGO'),
(13, 'Tecnico Radiologo', 'TCRDLGO'),
(14, 'Tecnico Bioquimico', 'TCBQMCO'),
(15, 'VETERINARIO ', 'VTRINRIO');

-- --------------------------------------------------------

--
-- Table structure for table `reemplazos`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `reemplazos` (
`id` int(11) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  `nhoras` int(11) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `areadep_id` int(11) DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `usuario_registro_id` int(11) DEFAULT NULL,
  `fecha_insert` date NOT NULL,
  `fecha_cobro` datetime DEFAULT NULL,
  `comentarios` longtext COLLATE utf8_bin
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `reemplazos`:
--   `areadep_id`
--       `areasdependencia` -> `id`
--   `trabajador_id`
--       `trabajadores` -> `id`
--

--
-- Dumping data for table `reemplazos`
--

INSERT INTO `reemplazos` (`id`, `trabajador_id`, `nhoras`, `fecha_inicio`, `areadep_id`, `fecha_solicitud`, `usuario_registro_id`, `fecha_insert`, `fecha_cobro`, `comentarios`) VALUES
(1, 1005, NULL, '2017-11-01', 1, NULL, 1, '2017-12-12', NULL, ''),
(2, 1266, 144, '2017-12-01', 1, NULL, 1, '2017-12-12', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `reemplazos_asglabs`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `reemplazos_asglabs` (
`id` int(11) NOT NULL,
  `reemplazo_id` int(11) NOT NULL,
  `asigna_lab_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `reemplazos_asglabs`:
--   `asigna_lab_id`
--       `asignalabs` -> `id`
--   `reemplazo_id`
--       `reemplazos` -> `id`
--

--
-- Dumping data for table `reemplazos_asglabs`
--

INSERT INTO `reemplazos_asglabs` (`id`, `reemplazo_id`, `asigna_lab_id`) VALUES
(8, 1, 1),
(9, 1, 2),
(10, 1, 55),
(12, 2, 4),
(14, 2, 5),
(11, 2, 50),
(13, 2, 74);

-- --------------------------------------------------------

--
-- Table structure for table `registros_catgs`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `registros_catgs` (
`id` int(11) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `fecha_ini_vigencia` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_registro_id` int(11) NOT NULL,
  `comentarios` varchar(128) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `registros_catgs`:
--   `categoria_id`
--       `mr_categorias` -> `id`
--   `trabajador_id`
--       `trabajadores` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `registros_esps`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `registros_esps` (
`id` int(11) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  `especialidad_id` int(11) NOT NULL,
  `fecha_ini_vigencia` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_registro_id` int(11) NOT NULL,
  `comentarios` varchar(128) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `registros_esps`:
--   `especialidad_id`
--       `especialidades` -> `id`
--   `trabajador_id`
--       `trabajadores` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `registros_status`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `registros_status` (
`id` int(11) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `fecha_ini_vigencia` date DEFAULT NULL,
  `comentarios` longtext COLLATE utf8_bin,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_registro_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `registros_status`:
--   `status_id`
--       `mr_status` -> `id`
--   `trabajador_id`
--       `trabajadores` -> `id`
--

--
-- Dumping data for table `registros_status`
--

INSERT INTO `registros_status` (`id`, `trabajador_id`, `status_id`, `fecha_ini_vigencia`, `comentarios`, `fecha_creacion`, `usuario_registro_id`) VALUES
(1, 1171, 2, '2018-01-01', 'por concurso', '2018-01-18 16:47:53', NULL),
(2, 1944, 2, '2016-01-01', '', '2017-12-29 12:16:31', NULL),
(3, 1944, 1, '2013-05-24', '', '2017-12-29 12:17:25', NULL),
(4, 1242, 1, '2016-06-01', 'inicia funcion como reemplazante', '2018-01-03 00:15:21', NULL),
(5, 1169, 1, '2016-01-01', 'inicia como REEMP', '2018-01-03 00:16:22', NULL),
(6, 1210, 1, '2016-10-01', 'inicia como REEMP', '2018-01-03 00:17:26', NULL),
(7, 1245, 1, '2017-07-01', 'inicia REEmp', '2018-01-03 00:19:51', NULL),
(8, 1147, 1, '2015-04-01', 'inicia REEMP', '2018-01-03 00:20:36', NULL),
(9, 1124, 1, '2013-08-01', 'inicia REEMP', '2018-01-03 00:21:32', NULL),
(10, 1231, 1, '2016-12-01', 'inicia REE;P\r\nx veraldi', '2018-01-03 00:22:59', NULL),
(11, 1234, 1, '2016-07-01', 'reemp fijo   DIAZ V', '2018-01-03 00:23:52', NULL),
(12, 2259, 1, '2017-10-01', 'REEMP EN HALBERDI', '2018-01-03 00:31:43', NULL),
(13, 1174, 1, '2016-02-01', 'hospital alberdi REEMP', '2018-01-03 00:32:41', NULL),
(14, 2258, 1, '2017-10-01', 'HOSPITAL ALBERDI REEMP', '2018-01-03 00:33:41', NULL),
(15, 1000, 1, '2015-06-01', 'salio de jefe residentes de heca ', '2018-01-03 11:36:13', NULL),
(16, 1266, 1, '2016-06-01', 'fue jefe residentes heca', '2018-01-03 11:36:58', NULL),
(17, 1005, 1, '2017-11-01', 'por cobertura embarazos ortopedistass vilelea\r\nmalma  amelong y cabezas y musso.ini', '2018-01-03 12:24:04', NULL),
(18, 1004, 1, '2014-06-01', 'ex res', '2018-01-05 11:04:32', NULL),
(19, 1004, 2, '2017-01-01', 'reempl en policlinico sanmartin buena evaluacion', '2018-01-05 11:05:14', NULL),
(20, 1001, 1, '2017-03-01', 'necesidad de cubrir mussolini embarazada', '2018-01-05 11:31:07', NULL),
(21, 1239, 2, '2018-01-01', 'pasaria a RSP ', '2018-01-05 13:28:12', NULL),
(22, 1239, 1, '2016-07-01', '??fecha', '2018-01-05 13:29:00', NULL),
(23, 1123, 1, '2014-02-01', '', '2018-01-08 12:43:11', NULL),
(24, 1123, 2, '2018-01-01', 'decreto', '2018-01-08 12:43:41', NULL),
(25, 1008, 1, '2014-01-01', '', '2018-01-08 12:44:29', NULL),
(26, 1008, 2, '2018-01-01', '', '2018-01-08 12:45:14', NULL),
(27, 1126, 1, '2015-01-01', '', '2018-01-08 12:46:24', NULL),
(28, 1126, 2, '2018-01-01', '', '2018-01-08 12:48:19', NULL),
(29, 1145, 1, '2015-03-01', '', '2018-01-08 12:49:12', NULL),
(30, 1145, 2, '2018-01-01', '', '2018-01-08 12:49:38', NULL),
(31, 1152, 1, '2015-06-01', '', '2018-01-08 12:50:21', NULL),
(32, 1152, 2, '2018-01-01', '', '2018-01-08 12:50:53', NULL),
(33, 1162, 1, '2015-12-01', '', '2018-01-08 12:51:27', NULL),
(34, 1162, 2, '2018-01-01', '', '2018-01-08 12:51:48', NULL),
(35, 1171, 2, '2018-01-01', '', '2018-01-08 12:52:47', NULL),
(36, 1171, 1, '2016-01-01', '', '2018-01-08 12:54:11', NULL),
(37, 1180, 1, '2016-03-01', '', '2018-01-08 12:55:02', NULL),
(38, 1180, 2, '2018-01-01', '', '2018-01-08 12:55:23', NULL),
(39, 1187, 2, '2018-01-01', '', '2018-01-08 12:58:12', NULL),
(40, 1187, 1, '2016-05-01', '', '2018-01-08 12:58:51', NULL),
(41, 1194, 1, '2016-06-01', '', '2018-01-08 12:59:34', NULL),
(42, 1194, 2, '2018-01-01', '', '2018-01-08 13:00:02', NULL),
(43, 1212, 1, '2016-11-01', '', '2018-01-08 13:01:02', NULL),
(44, 1212, 2, '2018-01-01', '', '2018-01-08 13:01:21', NULL),
(45, 1217, 2, '2018-01-01', '', '2018-01-08 13:02:18', NULL),
(46, 1217, 1, '2016-12-01', '', '2018-01-08 13:03:02', NULL),
(47, 1235, 2, '2018-01-01', '', '2018-01-08 13:03:39', NULL),
(48, 1235, 1, '2015-06-01', '', '2018-01-08 13:04:15', NULL),
(49, 1167, 2, '2018-01-01', '', '2018-01-08 13:04:56', NULL),
(50, 1167, 1, '2016-11-01', '', '2018-01-08 13:05:32', NULL),
(51, 1172, 1, '2017-09-01', '', '2018-01-08 13:06:25', NULL),
(52, 1172, 2, '2018-01-01', '', '2018-01-08 13:06:43', NULL),
(53, 1221, 2, '2018-01-01', '', '2018-01-08 13:07:50', NULL),
(54, 1221, 1, '2016-12-01', '', '2018-01-08 13:08:22', NULL),
(55, 1240, 2, '2018-01-01', '', '2018-01-08 13:09:39', NULL),
(56, 1240, 1, '2015-06-01', '', '2018-01-08 13:10:07', NULL),
(57, 1267, 2, '2018-01-01', '', '2018-01-08 13:10:40', NULL),
(58, 1267, 1, '2017-06-01', '', '2018-01-08 13:11:13', NULL),
(59, 1272, 2, '2018-01-01', '', '2018-01-08 13:11:52', NULL),
(60, 1272, 1, '2017-08-01', '', '2018-01-08 13:12:23', NULL),
(61, 1155, 1, '2015-09-01', '', '2018-01-08 13:13:14', NULL),
(62, 1155, 2, '2018-01-01', '', '2018-01-08 13:13:42', NULL),
(65, 1246, 2, '2018-01-01', '', '2018-01-08 13:17:37', NULL),
(66, 1246, 1, '2017-08-01', '', '2018-01-08 13:18:05', NULL),
(67, 1270, 2, '2018-01-01', '', '2018-01-08 13:18:34', NULL),
(68, 1270, 1, '2017-07-01', '', '2018-01-08 13:19:10', NULL),
(69, 1284, 1, '2017-09-01', '', '2018-01-08 13:19:41', NULL),
(70, 1284, 2, '2018-01-01', '', '2018-01-08 13:19:59', NULL),
(71, 1287, 1, '2017-09-01', '', '2018-01-08 13:20:35', NULL),
(72, 1287, 2, '2018-01-01', '', '2018-01-08 13:21:03', NULL),
(74, 2261, 1, '2017-10-01', '', '2018-01-08 13:25:06', NULL),
(75, 2261, 2, '2018-01-01', '', '2018-01-08 13:25:28', NULL),
(76, 2262, 1, '2017-10-01', '', '2018-01-22 13:01:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `servicios` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(8) COLLATE utf8_bin NOT NULL,
  `descripcion` longtext COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `codigo`, `descripcion`) VALUES
(1, 'oyt hospital vilela', 'OYTHNVJV', 'Descr.....'),
(2, 'OYT heca', 'OYTHECA', 'Descr.....'),
(3, 'guardia Policl SMartin', 'GDIAPSM', 'Descr.....'),
(5, 'OYT H CARRASCO', 'OYTHIC', 'Descr.....');

-- --------------------------------------------------------

--
-- Table structure for table `sqlscripts`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `sqlscripts` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(8) COLLATE utf8_bin NOT NULL,
  `scripto` longtext COLLATE utf8_bin,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_registro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_ausencias`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `tipos_ausencias` (
`id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(8) COLLATE utf8_bin NOT NULL,
  `descripcion` longtext COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tipos_ausencias`
--

INSERT INTO `tipos_ausencias` (`id`, `nombre`, `codigo`, `descripcion`) VALUES
(1, 'Licencia anual ordinaria', 'LAO', 'Lic anual ordinaria'),
(2, 'Licencia por maternidad', 'LMA', 'Lic x ..MATERNIDAD'),
(3, 'Licencia por Enfermedad', 'LXE', 'Lic x ..'),
(4, 'Licencia preservacion embarazo', 'LPRVEBZO', 'Lic x ..'),
(5, 'Licencia enfermedad Prolongada', 'LENFPRLG', 'Lic x ..'),
(6, 'Traslado a Provincia', 'TRLAPRV', 'Lic x ..'),
(7, 'Licencia sin Goce Sueldo', 'LSGSLDO', 'Lic x ..'),
(8, 'CambioFunciones', 'CBIOFUNC', 'Lic x ..'),
(9, 'Jubilacion', 'JBLCION', 'Lic x ..'),
(10, 'Licencia Gremial', 'LICGRM', 'Lic x ..'),
(11, 'Renuncia', 'RNCIA', 'Lic x ..'),
(12, 'Horas Lactancia materna', 'HLCTCIA', 'Lic x ..');

-- --------------------------------------------------------

--
-- Table structure for table `trabajadores`
--
-- Creation: Jan 21, 2018 at 08:51 PM
--

CREATE TABLE IF NOT EXISTS `trabajadores` (
`id` int(11) NOT NULL,
  `apellido` varchar(128) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(128) COLLATE utf8_bin NOT NULL,
  `tpodoc` varchar(5) COLLATE utf8_bin NOT NULL,
  `nrodoc` int(11) NOT NULL,
  `ncuitl` varchar(24) COLLATE utf8_bin DEFAULT NULL,
  `matricula` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `imgtrb` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `profesion_id` int(11) DEFAULT NULL,
  `especialidad_1_id` int(11) DEFAULT NULL,
  `especialidad_2_id` int(11) DEFAULT NULL,
  `especialidad_3_id` int(11) DEFAULT NULL,
  `especialidad_4_id` int(11) DEFAULT NULL,
  `domicilio` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `celular` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `cuit` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `mr_fecha_ingreso` date DEFAULT NULL,
  `mr_legajo` int(11) DEFAULT NULL,
  `mr_categoria_id` int(11) DEFAULT NULL,
  `mr_statuslab_id` int(11) DEFAULT NULL,
  `xlreparticion` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `xltipoemp` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `xlcaliflab` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `xltitulo` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `mrmapid` int(11) DEFAULT NULL,
  `mrpersonaid` int(11) DEFAULT NULL,
  `comentarios` longtext COLLATE utf8_bin,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2263 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- RELATIONS FOR TABLE `trabajadores`:
--   `especialidad_1_id`
--       `especialidades` -> `id`
--   `especialidad_2_id`
--       `especialidades` -> `id`
--   `especialidad_3_id`
--       `especialidades` -> `id`
--   `especialidad_4_id`
--       `especialidades` -> `id`
--   `mr_categoria_id`
--       `mr_categorias` -> `id`
--   `mr_statuslab_id`
--       `mr_status` -> `id`
--   `profesion_id`
--       `profesiones` -> `id`
--

--
-- Dumping data for table `trabajadores`
--

INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, 'lononi', 'eduardo', 'DNI', 21690472, NULL, NULL, '', NULL, 1, NULL, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, '2017-09-12', '2017-10-04'),
(2, 'ulepe', 'luis alberto', 'DNI', 1, NULL, NULL, '', NULL, 1, NULL, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, 50643, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, '2017-09-17', '2017-09-17'),
(3, 'golato', 'adriana edith', 'DNI', 11449474, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-07-23', 42151, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'LIC. EN OBSTETRICIA', NULL, NULL, NULL, NULL, NULL),
(4, 'morales', 'patricia graciela', 'DNI', 13093498, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-07-01', 16632, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(5, 'tomatis', 'nestor hugo', 'DNI', 11753994, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-03-01', 18573, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(6, 'spataro', 'silvia monica', 'DNI', 16113961, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 42702, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(7, 'taverna', 'croci ifigenia', 'DNI', 22584752, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 44149, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(8, 'kinen', 'edmundo juan', 'DNI', 10695653, NULL, NULL, '', NULL, 1, 23, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2007-02-01', 51981, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, '2017-11-07'),
(9, 'gastaldi', 'liliana pilar', 'DNI', 14202870, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 51982, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(10, 'griot', 'esteban jose', 'DNI', 21528968, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52108, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(11, 'pentimalli', 'bruno italo', 'DNI', 24350513, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52512, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(12, 'sosa', 'carolina pamela', 'DNI', 21674041, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 52883, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(13, 'rafuls', 'esteban antonio', 'DNI', 26375580, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 53161, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(14, 'ojeda', 'romina natalia', 'DNI', 25588468, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-07-01', 57522, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(15, 'gentiletti', 'anibal rodolfo', 'DNI', 23290753, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 57524, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(16, 'bergallo', 'justo ignacio', 'LC', 7822900, NULL, NULL, '', NULL, 1, 2, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '1979-01-01', 107181, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'COORDINADOR/A', 'PERMANENTES', 'MED. CARDIOLOGO', NULL, NULL, NULL, NULL, '2017-10-08'),
(17, 'ferraro', 'juan jose', 'DNI', 21567759, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 51172, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CIRUGIA GENERAL', NULL, NULL, NULL, NULL, NULL),
(18, 'bianchin', 'ezequiel antonio', 'DNI', 27889402, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-10-01', 55393, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CIRUGIA GENERAL', NULL, NULL, NULL, NULL, NULL),
(19, 'del', 'rio diez luis', 'DNI', 14760479, NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-12-04', 41291, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. CIRUJANO', NULL, NULL, NULL, NULL, NULL),
(20, 'marozzi', 'flavio cesar', 'DNI', 24702926, NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 45624, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CIRUJANO', NULL, NULL, NULL, NULL, NULL),
(21, 'obaid', 'anibal eduardo', 'DNI', 20923182, NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51581, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CIRUJANO', NULL, NULL, NULL, NULL, NULL),
(22, 'abellan', 'julio cesar', 'LE', 8599891, NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1977-02-24', 104173, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE DIVISION', 'PERMANENTES', 'MED. CIRUJANO', NULL, NULL, NULL, NULL, NULL),
(23, 'pafundi', 'juan carlos', 'DNI', 11124406, NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-01-07', 107055, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. CIRUJANO', NULL, NULL, NULL, NULL, NULL),
(24, 'ferrer', 'dora liliana', 'DNI', 11446000, NULL, NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-09-01', 27646, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. DERMATOLOGO', NULL, NULL, NULL, NULL, NULL),
(25, 'ferrero', 'adriana', 'DNI', 17444008, NULL, NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-07-01', 45001, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. DERMATOLOGO', NULL, NULL, NULL, NULL, NULL),
(26, 'ferrari', 'emelda estela', 'DNI', 11087188, NULL, NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-06-09', 100309, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. DERMATOLOGO', NULL, NULL, NULL, NULL, NULL),
(27, 'balcaza', 'maria sabina', 'DNI', 27003832, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-04-01', 53593, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. DIAGNOST.P/IMAGENES', NULL, NULL, NULL, NULL, NULL),
(28, 'molteni', 'gustavo mariano', 'DNI', 20354483, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56414, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. DIAGNOST.P/IMAGENES', NULL, NULL, NULL, NULL, NULL),
(29, 'cordoba', 'melba cecilia', 'DNI', 10987535, NULL, NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-04-01', 44865, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. ENDOCRINOLOGO', NULL, NULL, NULL, NULL, NULL),
(30, 'lerda', 'ana maria antonia', 'DNI', 17823594, NULL, NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-09-07', 100134, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. FISIOTERAPEUTA', NULL, NULL, NULL, NULL, NULL),
(31, 'goñi', 'ricardo aniceto', 'DNI', 12297773, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-09-01', 14197, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'COORDIN.AREA', 'PERMANENTES', 'MED. GENERALISTA', NULL, NULL, NULL, NULL, NULL),
(32, 'bogado', 'maria cecilia', 'DNI', 20264679, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-09-01', 44355, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. GENERALISTA', NULL, NULL, NULL, NULL, NULL),
(33, 'capaldi', 'fernanda de los a.', 'DNI', 21507913, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 49025, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. GENERALISTA', NULL, NULL, NULL, NULL, NULL),
(34, 'reich', 'gabriel hernan', 'DNI', 21972200, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-06-01', 50876, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. GENERALISTA', NULL, NULL, NULL, NULL, NULL),
(35, 'stringhini', 'emilio horacio', 'DNI', 20854109, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 51017, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. GENERALISTA', NULL, NULL, NULL, NULL, NULL),
(36, 'guerrero', 'maria graciela', 'DNI', 14444753, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56413, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. GINECOLOGO', NULL, NULL, NULL, NULL, NULL),
(37, 'okon', 'mariana olga', 'DNI', 14055371, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-01-01', 104341, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE DIVISION', 'PERMANENTES', 'MED. GINECOLOGO', NULL, NULL, NULL, NULL, NULL),
(38, 'alvarez', 'maria roxana', 'DNI', 13788353, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-06-29', 126214, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. GINECOLOGO', NULL, NULL, NULL, NULL, NULL),
(39, 'baccifava', 'gustavo jorge', 'DNI', 14899533, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-07-01', 21860, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE DIVISION', 'PERMANENTES', 'MED. GINECOLOGO OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(40, 'gregorutti', 'mariela yolanda', 'DNI', 20552806, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-05-01', 44901, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. GINECOLOGO OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(41, 'insaubralde', 'quiñones lida c', 'DNI', 18732601, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-08-14', 103843, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. HEMOTERAPEUTA', NULL, NULL, NULL, NULL, NULL),
(42, 'ruiz', 'daniel enrique', 'DNI', 20732525, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-06-01', 515800, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. KINESIOLOGO', NULL, NULL, NULL, NULL, NULL),
(43, 'casoli', 'mirta susana', 'DNI', 17423408, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-07-26', 41257, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. KINESIOLOGO', NULL, NULL, NULL, NULL, NULL),
(44, 'gallo', 'jose luis', 'DNI', 23645248, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51651, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. KINESIOLOGO', NULL, NULL, NULL, NULL, NULL),
(45, 'alonso', 'claudio marcelo', 'DNI', 12522316, NULL, NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-10-14', 40008, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'COORDINADOR/A', 'PERMANENTES', 'MED. NEFROLOGO', NULL, NULL, NULL, NULL, NULL),
(46, 'fernandez', 'maria cristina', 'DNI', 11871173, NULL, NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 49017, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. NEFROLOGO', NULL, NULL, NULL, NULL, NULL),
(47, 'rodriguez', 'marcelo daniel', 'DNI', 12324033, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-08-24', 27601, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(48, 'morales', 'susana beatriz', 'DNI', 10416652, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-08-24', 27608, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(49, 'acurso', 'laura alba', 'DNI', 11581952, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-02-01', 27681, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(50, 'carazzone', 'silvia ana', 'DNI', 12700289, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44815, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(51, 'fernandez', 'melo silvia', 'DNI', 16155563, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-04-01', 44866, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(52, 'vilar', 'andrea fabiana', 'DNI', 18043550, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-04-01', 44873, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(53, 'jaurrietta', 'norma  alicia', 'DNI', 6378104, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 47351, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(54, 'corbalan', 'patricia del lujan', 'DNI', 21421655, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 49474, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(55, 'cisneros', 'noelia alejandra', 'DNI', 24720399, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52411, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(56, 'marcos', 'maria dolores', 'DNI', 22661769, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52487, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(57, 'contreras', 'tauil  maria fabiola', 'DNI', 22028043, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52558, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(58, 'herrera', 'carina marcela gabriel', 'DNI', 21521224, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-01', 53230, NULL, NULL, 'MATERNIDAD MARTIN', 'NEONATOLOGO', 'PERMANENTES', 'MED. NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(59, 'abou', 'abdallah  juan alberto', 'DNI', 13788847, NULL, NULL, NULL, NULL, 1, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-10-26', 21069, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. NEUROCIRUJANO', NULL, NULL, NULL, NULL, NULL),
(60, 'guzman', 'enrique f', 'LE', 8444288, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-10-24', 27738, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(61, 'diorio ', 'elena beatriz', 'LC', 6070156, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-25', 27780, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(62, 'villeco', 'daniel oscar', 'DNI', 12524313, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-12-16', 27781, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(63, 'lombarte', 'graciela dolores', 'DNI', 12599547, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-02-16', 42119, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE CLINICA', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(64, 'nardin', 'juan manuel', 'DNI', 22329365, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 43064, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(65, 'de', 'gasperi eleonora maria h.', 'DNI', 17604576, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 44353, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(66, 'lombardi', 'gabriel jose', 'DNI', 22766569, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-04-01', 45889, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(67, 'menighini', 'marisa nora', 'DNI', 20847079, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 45991, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(68, 'mesa', 'enrique manuel', 'DNI', 16982255, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 48635, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE/A DE AREA', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(69, 'acosta', 'miriam graciela', 'DNI', 12028724, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-01-01', 49058, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(70, 'armendariz', 'silvina fabiana', 'DNI', 20304748, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 49479, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(71, 'carradori', 'maria liliana', 'DNI', 12042731, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-01-01', 50027, NULL, NULL, 'MATERNIDAD MARTIN', 'COORDINADOR/A', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(72, 'ubillus', 'carlos claudio', 'DNI', 18069049, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 51989, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(73, 'campora', 'mangione  javier salva', 'DNI', 24566880, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52398, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(74, 'dallari', 'leonardo alberto', 'DNI', 22625009, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-04-01', 52555, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(75, 'costanti', 'hugo angel', 'DNI', 10188051, NULL, NULL, NULL, NULL, 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-01', 117641, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OBSTETRA', NULL, NULL, NULL, NULL, NULL),
(76, 'cena', 'josefina ana', 'DNI', 13502475, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-08-01', 43724, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OFTALMOLOGO', NULL, NULL, NULL, NULL, NULL),
(77, 'daneri', 'liliana mirtha', 'DNI', 11126522, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-05-19', 50048, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. ONCOLOGO', NULL, NULL, NULL, NULL, NULL),
(78, 'ruggeroni', 'flavia teresa', 'DNI', 20392146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 52023, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. ONCOLOGO', NULL, NULL, NULL, NULL, NULL),
(79, 'comelli', 'lucas jorge', 'DNI', 28101649, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-04-01', 55965, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. OTORRINOLARINGOLOGO', NULL, NULL, NULL, NULL, NULL),
(80, 'lanatti', 'silvia lucia', 'DNI', 20279134, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 8946, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE CLINICA', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(81, 'aliverti', 'gustavo hector', 'DNI', 21011536, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 8950, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(82, 'garcia', 'monica', 'DNI', 10727049, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-12-01', 16192, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(83, 'verduna', 'gustavo hernan', 'DNI', 13788381, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-01', 16665, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(84, 'huck', 'jorge guillermo', 'DNI', 13428686, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-12-04', 22109, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'COORDINADOR/A', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(85, 'zago', 'graciela beatriz', 'DNI', 12466385, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-03-01', 27617, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(86, 'aletti', 'alicia maria', 'DNI', 13190155, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-08-01', 27620, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(87, 'zcerevin', 'margarita', 'DNI', 13580429, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-01', 27744, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(88, 'scuisatto', 'marcela teresa', 'DNI', 13491428, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-05-13', 27745, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(89, 'fernandez', 'hilda beatriz', 'DNI', 11672447, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-03-06', 27779, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(90, 'blasco', 'alicia carmen', 'DNI', 12730749, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 41184, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(91, 'bonini', 'maria teresa magdalena', 'DNI', 13788774, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 41216, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(92, 'fabisch', 'liliana rosa', 'DNI', 11872595, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 41339, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(93, 'lavitula', 'silvia', 'DNI', 12886086, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-12-01', 42114, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE DIVISION', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(94, 'labartete', 'andrea', 'DNI', 14345489, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1994-06-01', 42123, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE DIVISION', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(95, 'prause', 'maria luisa', 'DNI', 12565325, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-06-16', 42219, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(96, 'texier', 'ileana marta', 'DNI', 13366932, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-06-16', 42317, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(97, 'siccardi', 'liana', 'DNI', 12823142, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-09-04', 42400, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(98, 'uboldi', 'maria andrea', 'DNI', 16595047, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-12-24', 42406, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE DIVISION', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(99, 'plano', 'monica susana', 'DNI', 13544120, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-01', 42582, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(100, 'ares', 'carolina', 'DNI', 22391416, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 43704, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(101, 'abonizio', 'gabriela andrea', 'DNI', 17228788, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-04-01', 44864, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(102, 'contreras', 'silvia ines', 'DNI', 17444210, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-10-01', 44887, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(103, 'gustafsson', 'monica liliana', 'DNI', 10727055, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44903, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(104, 'acosta', 'alberto milko', 'DNI', 20671746, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44940, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(105, 'veggi', 'viviana maria', 'DNI', 16745422, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-11-01', 47357, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(106, 'binelli', 'stella marys', 'DNI', 16778222, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 47367, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'COORDINADOR/A', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(107, 'iovaldi', 'patricia elena', 'DNI', 12179497, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-09-14', 47439, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(108, 'guidobaldi', 'adriana cristina', 'DNI', 12914627, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-06-29', 47684, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(109, 'coteluzzi', 'ronald luis cayetano', 'DNI', 20263779, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-08-01', 48638, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(110, 'binner', 'maria laura', 'DNI', 21620385, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 49100, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(111, 'bravo', 'silvia maria del valle', 'DNI', 13202904, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2999-12-12', 49546, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(112, 'sciolla', 'gustavo fabian', 'DNI', 14729073, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997-04-09', 49677, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(113, 'brizuela', 'maria jose', 'DNI', 23928904, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 49697, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(114, 'cano', 'claudia andrea', 'DNI', 16521288, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 50029, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE CLINICA', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(115, 'faguaga', 'gabriela abigail', 'DNI', 16645459, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01', 50054, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE DIVISION', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(116, 'galicchio', 'santiago martin', 'DNI', 17826026, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 50068, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(117, 'ibañez', 'elba  beatriz', 'DNI', 12494585, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-01-01', 50081, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(118, 'martinez', 'maria de los angeles', 'DNI', 20402603, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 50100, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(119, 'rodriguez', 'ismael alvaro', 'DNI', 26255963, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 50653, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(120, 'cantero', 'lorenza', 'DNI', 92768569, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-01', 50823, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(121, 'ravizzini', 'sandra edith', 'DNI', 22955363, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-01-01', 50993, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(122, 'de', 'rossi gisela paola', 'DNI', 23071164, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 51019, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(123, 'rabadan', 'andres alberto', 'DNI', 16778331, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-03-01', 51131, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(124, 'rodriguez', 'alassia maria del p', 'DNI', 14760808, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51586, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(125, 'vega', 'gonzalo', 'DNI', 23242308, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51760, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(126, 'conzolino', 'sergio orlando', 'DNI', 21721316, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 51988, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(127, 'castellini', 'valter mauro', 'DNI', 23645166, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52007, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(128, 'caresani', 'gabriel alejandro', 'DNI', 24373530, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52017, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(129, 'lopez', 'karina andrea', 'DNI', 23622159, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52168, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(130, 'zagaglia', 'alicia rosanna', 'DNI', 14541097, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-04-01', 52225, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(131, 'aranda', 'roxana carina', 'DNI', 24194669, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52377, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(132, 'carauni', 'maria fernanda', 'DNI', 23899505, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52399, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(133, 'casas', 'carina edit', 'DNI', 21523658, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52404, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(134, 'de', 'la torre marcos gustavo', 'DNI', 14758150, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52420, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(135, 'garcia', 'fabiana carina', 'DNI', 21523354, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52439, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(136, 'martinez', 'mariella   liliana', 'DNI', 23719039, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52491, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(137, 'oliva', 'soraya virginia', 'DNI', 23645414, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52503, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(138, 'gallardo', 'silvina alicia', 'DNI', 17904277, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 52581, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(139, 'pagliero', 'alejandro eugenio', 'DNI', 23399201, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52598, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(140, 'tornatore', 'giselle veronica', 'DNI', 24400750, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52698, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(141, 'garcia', 'rocio daniela', 'DNI', 24909644, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52802, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(142, 'binner', 'varinia susana', 'DNI', 21690473, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 53154, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(143, 'cipollone', 'julia fernanda', 'DNI', 25505334, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-11-01', 53595, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(144, 'reyes', 'espinoza cesar augusto', 'DNI', 18864175, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 53974, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(145, 'caballero', 'ana maria', 'DNI', 27817330, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 54180, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(146, 'cerioni', 'paola vanesa', 'DNI', 26225644, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-07-01', 55341, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(147, 'aleart', 'laura mariana', 'DNI', 29047055, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-12-01', 55390, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(148, 'molinatto', 'jorgelina beatriz', 'DNI', 28914710, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-10-01', 55391, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(149, 'retamero', 'mirta', 'DNI', 12944917, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-01-01', 101754, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(150, 'baigorri', 'elba susana flora', 'LC', 6246349, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-04-02', 104505, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(151, 'rodriguez', 'alicia amanda', 'DNI', 12520712, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-08-09', 124795, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(152, 'schifino', 'andrea mariela', 'DNI', 17825866, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-05-01', 150140, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(153, 'huerta', 'adriana mabel', 'DNI', 17190495, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44948, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'COORDINADOR/A', 'PERMANENTES', 'MED. PSIQUIATRA', NULL, NULL, NULL, NULL, NULL),
(154, 'figueredo', 'paola  maria', 'DNI', 20375093, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-09-01', 54206, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PSIQUIATRA', NULL, NULL, NULL, NULL, NULL),
(155, 'tagliafico', 'cinthya valeria', 'DNI', 24194091, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-02-01', 55147, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. PSIQUIATRA', NULL, NULL, NULL, NULL, NULL),
(156, 'goñi', 'mario alberto', 'DNI', 12631653, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-11-12', 460043, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. REUMATOLOGO', NULL, NULL, NULL, NULL, NULL),
(157, 'abdala', 'marcelo alberto', 'DNI', 14287976, NULL, NULL, '', NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2001-04-01', 44863, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. REUMATOLOGO', NULL, NULL, NULL, NULL, '2018-01-17'),
(158, 'olivera', 'claudio alejandro', 'DNI', 22400450, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 43063, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. TOCOGINECOLOGO', NULL, NULL, NULL, NULL, NULL),
(159, 'domissi', 'carolina', 'DNI', 23737355, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 45672, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. TOCOGINECOLOGO', NULL, NULL, NULL, NULL, NULL),
(160, 'martinez', 'torres lorena susana', 'DNI', 25161197, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52159, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. TOCOGINECOLOGO', NULL, NULL, NULL, NULL, NULL),
(161, 'giraudo', 'mariela beatriz', 'DNI', 23964900, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-04-01', 52222, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. TOCOGINECOLOGO', NULL, NULL, NULL, NULL, NULL),
(162, 'locatelli', 'maria eugenia', 'DNI', 25328438, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52481, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. TOCOGINECOLOGO', NULL, NULL, NULL, NULL, NULL),
(163, 'galassi', 'andrea veronica', 'DNI', 23228626, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-01-01', 53224, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. TOCOGINECOLOGO', NULL, NULL, NULL, NULL, NULL),
(164, 'martorano', 'valeria monica', 'DNI', 27291364, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-03-01', 54065, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. TOCOGINECOLOGO', NULL, NULL, NULL, NULL, NULL),
(165, 'di', 'filippo federico jose', 'DNI', 11673424, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-08-01', 20436, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. TRAUMATOLOGO', NULL, NULL, NULL, NULL, NULL),
(166, 'mondino', 'juan alberto', 'DNI', 16272122, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-01-25', 50094, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. TRAUMATOLOGO', NULL, NULL, NULL, NULL, NULL),
(167, 'fernandez', 'eduardo manuel marti', 'LE', 8506088, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-12-17', 101927, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE DIVISION', 'PERMANENTES', 'MED. TRAUMATOLOGO', NULL, NULL, NULL, NULL, NULL),
(168, 'milanesio', 'eduardo luis', 'DNI', 10061075, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1979-01-01', 102367, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED. TRAUMATOLOGO', NULL, NULL, NULL, NULL, NULL),
(169, 'lizzi', 'daniel fernando', 'DNI', 23038663, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 50669, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MED. UROLOGO', NULL, NULL, NULL, NULL, NULL),
(170, 'mata', 'lucrecia', 'DNI', 28450549, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-02-01', 55665, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CARDIOL.PEDIATRICA', NULL, NULL, NULL, NULL, NULL),
(171, 'martinez', 'sandra', 'DNI', 16879010, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-02-01', 29182, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE DIVISION', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(172, 'davidow', 'federico gabriel', 'DNI', 22535227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 45594, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(173, 'grossi', 'georgina patricia', 'DNI', 28144734, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-08-01', 51247, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(174, 'bettini', 'lisandro roberto', 'DNI', 20167504, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-11-01', 51363, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(175, 'turletti', 'maria carolina', 'DNI', 27674161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 51608, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(176, 'virga', 'eliana laura', 'DNI', 28536154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 51609, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(177, 'di', 'santo maria veronica', 'DNI', 21890621, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51634, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(178, 'cortese', 'maria noel', 'DNI', 24642907, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52416, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(179, 'estefano', 'patricia monica', 'DNI', 12523132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52427, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(180, 'nieto', 'romina estefania', 'DNI', 25588030, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52500, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(181, 'casas', 'andrea veronica', 'DNI', 23462503, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52794, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(182, 'scheitlin', 'barbara', 'DNI', 25648102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 53091, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(183, 'romagnoli', 'lisandro alfredo', 'DNI', 24267585, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 53141, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(184, 'gomez', 'maria cielo', 'DNI', 29528656, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-10-01', 54212, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(185, 'serrano', 'diego', 'DNI', 27419468, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-11-01', 55057, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(186, 'magnin', 'maria del rosario', 'DNI', 28449130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 55058, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(187, 'lattuca', 'pedro luis', 'DNI', 29762776, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 55671, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.CLINICA MEDICA', NULL, NULL, NULL, NULL, NULL),
(188, 'cicao', 'alejandro', 'DNI', 23082077, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 55110, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.DE EMERG.Y DESASTRES', NULL, NULL, NULL, NULL, NULL),
(189, 'lombardo', 'ernesto', 'DNI', 23964515, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 45654, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MED.EN ORTOPED. Y TRAUMATOLOGI', NULL, NULL, NULL, NULL, NULL),
(190, 'carretto', 'caceres federico dant', 'DNI', 28199524, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-08-01', 51259, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(191, 'payer', 'gerardo ernesto', 'DNI', 22028179, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 51261, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE CENTRO', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(192, 'perfumo', 'giselle ines', 'DNI', 26005969, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-06-01', 51262, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(193, 'salinas', 'graciela lorena', 'DNI', 25840763, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 51264, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(194, 'schmidt', 'maria de los angeles', 'DNI', 26977014, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-06-01', 51624, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE CENTRO', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(195, 'tomasello', 'andrea veronica', 'DNI', 23317383, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-06-01', 52932, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(196, 'castillo', 'andrea karina', 'DNI', 17331189, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-06-01', 53497, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(197, 'giugge', 'maria laura', 'DNI', 28568004, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 55011, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(198, 'maidana', 'maria paula', 'DNI', 26750158, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-01', 55301, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(199, 'fernandez', 'claudia alejandra', 'DNI', 24586743, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-06-01', 55484, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(200, 'vailatti', 'lorena', 'DNI', 25162441, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 55675, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(201, 'esmay', 'dora alcira', 'DNI', 17558722, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 127830, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.GENER.Y DE FAMILIA', NULL, NULL, NULL, NULL, NULL),
(202, 'cuello', 'monica silvina', 'DNI', 16745582, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 50706, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.NEUMONOLOGO', NULL, NULL, NULL, NULL, NULL),
(203, 'figueroa', 'casas marcelo pedro', 'DNI', 21946731, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51556, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.NEUMONOLOGO', NULL, NULL, NULL, NULL, NULL),
(204, 'romano', 'maria gabriela', 'DNI', 17308122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 53952, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.RADIODIAGNOSTICO', NULL, NULL, NULL, NULL, NULL),
(205, 'becherucci', 'andrea diana', 'DNI', 22095673, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51633, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MED.TERAPIA INTENSIVA', NULL, NULL, NULL, NULL, NULL),
(206, 'fontanellas', 'dora claudia', 'DNI', 20853543, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 52578, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'MEDICO ESPEC TERAPIA INTENSIVA', 'PERMANENTES', 'MED.TERAPIA INTENSIVA', NULL, NULL, NULL, NULL, NULL),
(207, 'vercesi', 'daniel pablo', 'DNI', 12480799, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1994-07-01', 9031, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(208, 'morales', 'beatriz isabel', 'DNI', 10068245, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 17784, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(209, 'yunes', 'ana maria', 'DNI', 11874939, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 46639, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(210, 'sack', 'vilma elizabeth', 'DNI', 16552628, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51705, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(211, 'sbarra', 'maria valeria', 'DNI', 27291181, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-07-01', 53225, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE SALA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(212, 'moyano', 'crespo  marta angelica', 'DNI', 14449389, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-07-01', 460047, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(213, 'vergili', 'graciela s de', 'DNI', 11270887, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1982-03-15', 500030, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(214, 'tuells', 'gabriela beatriz', 'DNI', 20298317, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-10', 515767, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(215, 'reviglio', 'paula fabiana', 'DNI', 20853602, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 515786, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(216, 'martinez', 'silvina ines', 'DNI', 17773086, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 515803, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(217, 'mucci', 'carolina maria', 'DNI', 25959753, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-01', 515833, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(218, 'giovagnoli', 'gisela silvia', 'DNI', 20812367, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 516001, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(219, 'mangiarelli', 'pamela rosana', 'DNI', 18330066, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 516002, NULL, NULL, 'INST.LUCHA ANTIPOL.DE ROSARIO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(220, 'tapia', 'ana graciela', 'DNI', 10590164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-01-01', 446, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(221, 'tacconi', 'jorge ernesto', 'DNI', 12111434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-10-27', 897, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(222, 'lopez papucci', 'santiago', 'DNI', 12804602, NULL, NULL, '', NULL, 1, 5, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '1990-01-01', 1197, NULL, 3, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2018-01-19'),
(223, 'mattana', 'omar renee', 'DNI', 12281616, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-01-01', 1356, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(224, 'faust', 'abel eduardo', 'DNI', 11907988, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-08-27', 3178, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(225, 'pece', 'claudia andrea', 'DNI', 16191371, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-12-24', 3476, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(226, 'taboada', 'ernesto', 'LE', 6055849, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-02-12', 4037, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(227, 'redondo', 'nora silvia', 'DNI', 12111056, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-07-31', 5012, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'DIRECTOR /A GENERAL', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(228, 'montes', 'jorge marcos', 'DNI', 17891550, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2006-06-01', 8512, NULL, 3, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(229, 'gunziger', 'patricia', 'DNI', 21417452, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 8926, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(230, 'rojas', 'silvina paula', 'DNI', 21008042, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 8928, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(231, 'strasser', 'ivana marcela', 'DNI', 20536629, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-02-01', 8934, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE CLINICA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(232, 'bichara', 'jorge ariel', 'DNI', 20820792, NULL, NULL, 'pintatrb/2017/10/rxmanosobls.png', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2006-08-01', 8940, NULL, 3, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-10-09'),
(233, 'mussano', 'maria lina', 'DNI', 20923607, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-09-01', 8947, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(234, 'chumpitaz', 'filipone analia', 'DNI', 20704776, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-08-01', 8949, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(235, 'tello', 'monica andrea', 'DNI', 21545967, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-12-01', 8953, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(236, 'ezcurra', 'guillermo', 'DNI', 18480146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-12-01', 8964, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(237, 'juarez', 'sonia daniela', 'DNI', 20175331, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 8983, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'MEDICO AUDITOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(238, 'rascon', 'adrian alejandro', 'DNI', 20536420, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-10-01', 8994, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(239, 'dubrawski', 'gabriel hector', 'DNI', 21920381, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 8996, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(240, 'allovio', 'maria josefina', 'DNI', 21444429, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-06-01', 8998, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(241, 'galende', 'silvina', 'DNI', 20207511, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 9039, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(242, 'cota', 'jorge luis', 'DNI', 20705246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 9042, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(243, 'els', 'ramona angelica', 'DNI', 14859581, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-12-01', 9044, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'MEDICO/A REGULADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(244, 'o toole', 'gabriela eva', 'DNI', 20461915, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-01-01', 9072, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(245, 'morabito', 'abel luis', 'DNI', 13588894, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997-01-01', 9089, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(246, 'soldani', 'marisel del rosario', 'DNI', 16286970, NULL, NULL, '', NULL, 1, 5, 6, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '1991-07-01', 14169, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-10-25'),
(247, 'alonso', 'claudia marcela', 'DNI', 16277150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-12-01', 15359, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(248, 'lavarello', 'damian adolfo', 'DNI', 16265741, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-07-01', 16538, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(249, 'sanchez', 'daniel alberto', 'DNI', 11874406, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-01', 16756, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(250, 'pretelli', 'nicolas andre', 'DNI', 10866511, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-02-09', 17634, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(251, 'girino', 'cristina elena', 'DNI', 13958976, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-07-01', 18818, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(252, 'duarte', 'marina beatriz', 'DNI', 18840270, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-11-19', 19274, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'DIR. ASISTENTE', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(253, 'zarate', 'liliana monica', 'DNI', 13174745, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-01', 19359, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(254, 'torres', 'roberto mario', 'DNI', 14228583, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-07-24', 19396, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(255, 'bustamante', 'olga ines', 'DNI', 16793756, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-08-07', 19541, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(256, 'pedraza', 'rosa angela', 'DNI', 12523687, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-02-01', 19585, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(257, 'martin', 'juan carlos', 'DNI', 12282679, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-09-21', 19881, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(258, 'martino', 'raul sergio', 'DNI', 13488674, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-12-01', 20162, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(259, 'ensinck', 'gabriela nidia', 'DNI', 14913839, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-05-01', 21858, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(260, 'jorfen', 'marisa', 'DNI', 14704231, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-05-01', 21900, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(261, 'marino', 'marcelo gustavo', 'DNI', 17668675, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-07-01', 22750, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE CLINICA SERV.CARDIOLOG', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(262, 'caporaletti', 'nirley graciela', 'DNI', 13886657, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-08-30', 23955, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(263, 'gonzalez', 'hector horacio', 'DNI', 12862769, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-12-01', 24778, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(264, 'nardin', 'carlos alberto', 'LE', 6062085, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1984-02-22', 25806, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(265, 'bertone', 'claudio', 'DNI', 10643513, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-03-01', 27213, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(266, 'borgna', 'marcelo alberto', 'DNI', 14558021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-07-04', 27647, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(267, 'cornier', 'federico guillermo', 'DNI', 17324787, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-04-01', 27669, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'DIR. ASISTENTE', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(268, 'roman', 'noemi', 'DNI', 12826904, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-06-26', 27726, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(269, 'lagorio', 'sergio gabriel', 'DNI', 16690821, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-01-01', 27727, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(270, 'bonetti', 'sofia elvira', 'DNI', 17773183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-07-01', 27732, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(271, 'sandoval', 'eduardo ronald d', 'DNI', 12521982, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-01', 27746, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(272, 'bobatto', 'andrea', 'DNI', 16797726, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-06-21', 27782, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(273, 'quino', 'espejo juan crisologo', 'DNI', 18773286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-05-19', 27786, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(274, 'hoet', 'hector hugo', 'DNI', 13811704, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 27821, NULL, NULL, 'HOSPITAL ALBERDI', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(275, 'de', 'la iglesia marcela patricia', 'DNI', 13752025, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-02-08', 29119, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(276, 'grassetin', 'monica silvana', 'DNI', 17807360, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-03-15', 29850, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(277, 'arrastia', 'griselda lucia', 'DNI', 14510455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-05-01', 40005, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(278, 'bergonzi', 'jorge eduardo', 'DNI', 12111560, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-05-14', 40024, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(279, 'maino', 'nestor', 'DNI', 8599245, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-12-06', 40098, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(280, 'contreras', 'alicia beatriz', 'DNI', 12381279, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-06-04', 40197, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(281, 'colombero', 'bibiana emilia', 'DNI', 14474169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-08-26', 40213, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(282, 'heredia', 'campos agustin', 'DNI', 18843455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-12-01', 40335, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(283, 'oddone', 'hernan esteban', 'DNI', 14529317, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-05-02', 40379, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(284, 'pereyra', 'maria eva', 'DNI', 5487550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-02-01', 40397, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(285, 'pochettino', 'sandra teresa', 'DNI', 16400315, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-03-05', 40401, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(286, 'quintana', 'liliana beatriz', 'DNI', 13333413, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 40431, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(287, 'vilariño', 'claudia ebe', 'DNI', 16149138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-05-01', 40529, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'DIR. ASISTENTE', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(288, 'grande', 'silvia ines', 'DNI', 13568467, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-01', 40682, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(289, 'ruiz', 'bry francisco florencio', 'DNI', 10986619, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-21', 40931, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(290, 'tisera', 'norma susana', 'DNI', 13294029, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-05-01', 40958, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(291, 'molini', 'remilly', 'DNI', 13143835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 40995, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(292, 'pire', 'lelio gustavo', 'DNI', 13255406, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-02-01', 41007, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(293, 'robledo', 'belkis', 'DNI', 22447113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 41023, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(294, 'mendoza', 'mirta graciela', 'DNI', 13752173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-10-01', 41051, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(295, 'marrocco', 'sergio dario', 'DNI', 16064381, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-04-01', 41053, NULL, NULL, 'DIRECCION DE BIOQUIMICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(296, 'pistelli', 'ma de los angeles', 'DNI', 17130389, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 41068, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(297, 'pascual', 'ana maria', 'DNI', 17213206, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-27', 41071, NULL, NULL, 'DIRECCION DE BIOQUIMICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(298, 'baggio', 'gloria mabel', 'DNI', 13692309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-04-19', 41083, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(299, 'gariboldi', 'graciela guadalupe', 'DNI', 14072687, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-07-01', 41098, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(300, 'gersi', 'bibiana margarita', 'DNI', 12736849, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-12-01', 41105, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(301, 'kohan', 'jorge jacobo', 'DNI', 14081505, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-01', 41113, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(302, 'lezcano', 'monica', 'DNI', 12324609, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-05-13', 41117, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(303, 'amigot', 'beatriz elena', 'DNI', 11273513, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-05', 41130, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(304, 'alvarez', 'berenice agueda', 'DNI', 14287797, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-09-01', 41160, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(305, 'borsani', 'eugenia rosa', 'DNI', 12112279, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-07-01', 41175, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(306, 'barragan', 'liliana graciela', 'DNI', 13588452, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1982-07-01', 41208, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(307, 'batle', 'jose', 'DNI', 10778688, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '1993-01-01', 41213, NULL, 3, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2018-02-09'),
(308, 'chierichetti', 'maria angela', 'DNI', 14541060, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-05-01', 41232, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(309, 'carradori', 'maria del carmen r.', 'DNI', 12064575, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-01-01', 41240, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'DIR. ASISTENTE', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(310, 'capra', 'patricia', 'DNI', 14206239, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-08-01', 41263, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(311, 'casim', 'eduardo roque', 'DNI', 14681658, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-06-08', 41280, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(312, 'cabeza', 'marisa alejandra', 'DNI', 14729281, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-05-02', 41281, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(313, 'carbognani', 'aguilar silvia n', 'DNI', 13651847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-10-01', 41288, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'RESP.DEL AREA GENETICA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(314, 'del', 'aguila maria elena', 'DNI', 92326867, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-05-01', 41294, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(315, 'de', 'paz laura beatriz', 'DNI', 16033670, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-01-01', 41314, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(316, 'echave', 'elena', 'DNI', 13449781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-08-01', 41330, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(317, 'fritschy', 'marta patricia', 'DNI', 14538335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-02', 41374, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(318, 'franke', 'alicia', 'DNI', 11673155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-06-01', 41378, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(319, 'garcia', 'armando', 'DNI', 11753080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-02-27', 42078, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(320, 'leroux', 'alberto augusto', 'DNI', 11448319, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-08-15', 42097, NULL, NULL, 'MATERNIDAD MARTIN', 'SUB.DIREC.', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(321, 'leiva', 'patricia dora', 'DNI', 14143911, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-07-08', 42099, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(322, 'leto', 'patricia julia', 'DNI', 14704356, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-05-01', 42100, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(323, 'laboranti', 'maria claudia', 'DNI', 14081294, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-05-01', 42101, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(324, 'lassaga', 'omar gabriel', 'DNI', 14863983, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-10-29', 42102, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(325, 'lotto', 'guillermo andres', 'DNI', 12756224, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-07-01', 42112, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(326, 'mannarino', 'silvina estela', 'DNI', 16948195, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 42128, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(327, 'marchetti', 'nestor omar', 'DNI', 12135098, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1982-05-04', 42152, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'DIR. ASISTENTE', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(328, 'maiorana', 'sandra beatriz', 'DNI', 13240373, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-09-01', 42163, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(329, 'maccario', 'maria fernanda', 'DNI', 14529448, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 42168, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(330, 'merad', 'liliana', 'DNI', 11757223, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-12-01', 42172, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE CENTRO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(331, 'nobile', 'elsio mario', 'DNI', 14453181, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-01-02', 42192, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'DIR. ASISTENTE', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(332, 'palacios', 'nelly mabel', 'DNI', 14512335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-07', 42216, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(333, 'paz', 'guido ulises', 'DNI', 10865464, NULL, NULL, '', NULL, 1, 4, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '1986-12-16', 42224, NULL, 3, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2018-01-22'),
(334, 'putero', 'alicia beatriz', 'DNI', 14426320, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-09-21', 42236, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(335, 'perouch', 'claudia alejandra', 'DNI', 13449441, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-02-14', 42241, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(336, 'schoeller', 'ana maria', 'DNI', 12523962, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 42288, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(337, 'taiana', 'sandra maria', 'DNI', 14287218, NULL, NULL, '', NULL, 1, 5, 6, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '1987-05-01', 42306, NULL, 3, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-10-28'),
(338, 'terrazzino', 'juan carlos', 'DNI', 12523354, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-01', 42309, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(339, 'tuninetti', 'alberto', 'DNI', 12884383, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-09-29', 44863, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(340, 'taborda', 'patricia maria i', 'DNI', 12955630, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-07-01', 42321, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(341, 'vacarezza', 'nelida gabriela', 'DNI', 11446640, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-01-01', 42332, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(342, 'vecchio', 'mario oscar', 'DNI', 13788830, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 42334, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(343, 'veraldi', 'angel hugo', 'DNI', 10866887, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-01-01', 42336, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(344, 'villella', 'mario m', 'DNI', 93280042, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 42337, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(345, 'villanova', 'norma maria', 'DNI', 12360107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-06-01', 42338, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(346, 'zappelli', 'analia noemi', 'DNI', 16250249, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-05-12', 42348, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(347, 'zaffora', 'cayetano calixto', 'DNI', 11751751, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-25', 42355, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(348, 'rabinovich', 'susana', 'DNI', 12111967, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-08-01', 42388, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(349, 'mazza', 'ariel', 'DNI', 14510837, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-22', 42415, NULL, NULL, 'HOSPITAL ALBERDI', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(350, 'ramirez', 'daniel cesar jose', 'DNI', 13509881, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-05-01', 42458, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'MEDICO LABORAL', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(351, 'catallo', 'alicia de los milagros', 'DNI', 12147638, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997-04-09', 42476, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(352, 'petrocelli', 'sergio hector', 'DNI', 13032098, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-04-01', 42505, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(353, 'both', 'suzete', 'DNI', 18152754, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-10-01', 42534, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(354, 'cigno', 'edgardo luis', 'DNI', 10779649, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-01-29', 42536, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(355, 'pellegrini', 'silvina claudia', 'DNI', 14758554, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-08-01', 42585, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'MED. RADIOLOGO/A - JEFE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(356, 'cordone', 'ricardo rubens', 'DNI', 16911808, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-03-01', 42591, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'PROFESIONAL MEDICO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(357, 'pando', 'alberto julian', 'LE', 6144728, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-02', 42604, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(358, 'cachia', 'pedro alberto', 'DNI', 14509664, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-06-28', 42613, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(359, 'ciarlo', 'sergio gabriel', 'DNI', 12523733, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-01', 42662, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(360, 'de', 'giulio hugo andres', 'DNI', 11610459, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-09-30', 42685, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(361, 'siegel', 'maria rosa', 'DNI', 13498921, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 43052, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(362, 'quinteros', 'javier oscar', 'DNI', 20474065, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 43053, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(363, 'alfano', 'silvana andrea', 'DNI', 22175526, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-10-01', 43059, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(364, 'bonnor', 'ariana analia', 'DNI', 22462192, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-10-01', 43060, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(365, 'cogo', 'viviana lujan', 'DNI', 22435933, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-11-01', 43061, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(366, 'negri', 'mariana ines', 'DNI', 22400983, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-10-01', 43062, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(367, 'mora', 'pablo augusto', 'DNI', 20176600, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2006-09-01', 43066, NULL, 3, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(368, 'solis', 'cecilia elisa', 'DNI', 21941904, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 43072, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(369, 'clementz', 'gabriela mariana', 'DNI', 22766663, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-07-01', 43073, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(370, 'binner', 'carolina', 'DNI', 21690472, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-07-01', 43076, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'SUB.DIREC.', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(371, 'bichara', 'andrea cecilia', 'DNI', 22105835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-01', 43080, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(372, 'garcia', 'maria silvina', 'DNI', 22674072, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-03-01', 43081, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'COORDINADOR/A TERRITORIAL', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(373, 'becerra', 'juan manuel', 'DNI', 21774829, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-10-01', 43087, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'COORD. TECNICO /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(374, 'forchino', 'maria ines', 'DNI', 20812215, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 43319, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(375, 'rios', 'favio edgardo', 'DNI', 12528506, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-10-01', 43321, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(376, 'fernandez', 'maria laura', 'DNI', 23230349, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 43423, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(377, 'acosta', 'ruben marcos', 'DNI', 21810769, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 43425, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(378, 'pizarro', 'cabezas gina rosario', 'DNI', 18832463, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-03-01', 43550, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(379, 'moses', 'mariana isabel', 'DNI', 23894958, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-01-01', 43554, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(380, 'parnisari', 'leandro', 'DNI', 23993571, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 43555, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(381, 'pafundi', 'adrian fabio', 'DNI', 17988541, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 43584, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(382, 'ontivero', 'natalia', 'DNI', 24282384, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-11-01', 43626, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(383, 'gotlieb', 'florencia', 'DNI', 22889539, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 43686, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(384, 'azar', 'rene alejandro', 'DNI', 20551162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-07-01', 43707, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(385, 'marino', 'maria de los angeles', 'DNI', 22607786, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-07-01', 43709, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(386, 'caura', 'claudia nieves', 'DNI', 13060386, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-03-01', 43711, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(387, 'filosa', 'graciela', 'DNI', 10987458, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-08-01', 43723, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(388, 'ponce', 'nestor raul', 'DNI', 16418997, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-08-01', 43742, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'SUB.DIREC.', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(389, 'gonzalez', 'karina beatriz', 'DNI', 22777929, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-10-19', 43811, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(390, 'alvites', 'antero edmundo', 'DNI', 92219928, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-11-02', 43812, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(391, 'nadalin', 'pablo cristian', 'DNI', 23674099, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 44143, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(392, 'gomez', 'cristian alberto', 'DNI', 23645097, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 44145, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(393, 'sala', 'amalia carolina', 'DNI', 22889190, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 44146, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(394, 'bilesio', 'fernanda lorena', 'DNI', 23737389, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 44147, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(395, 'pulcinelli', 'silvio leonardo', 'DNI', 23344370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 44150, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(396, 'carbonari', 'maria laura', 'DNI', 23914912, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 44160, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(397, 'kowalczuk', 'silvia monica', 'DNI', 21531800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 44163, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(398, 'rajmil', 'daniela patricia', 'DNI', 23740828, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 44167, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(399, 'moran', 'silvia estela', 'DNI', 21638329, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 44168, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(400, 'gioberti', 'adriana gabriela', 'DNI', 20461213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 44169, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(401, 'herrera', 'jorgelina noemi', 'DNI', 23457873, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-11-01', 44255, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(402, 'falbo', 'maria fabiana', 'DNI', 21412446, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 44356, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(403, 'alvarez', 'marisa claudia', 'DNI', 14228216, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-02-01', 44375, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(404, 'gattelet', 'karina elizabeth', 'DNI', 20820774, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 44436, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(405, 'ojeda', 'luis alberto', 'DNI', 18342125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-12-06', 44526, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(406, 'leon', 'avellaneda carina m.', 'DNI', 18438907, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-02-01', 44577, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(407, 'gomez', 'fernando', 'DNI', 20174014, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-07-01', 44578, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(408, 'campora', 'nidia nora', 'DNI', 14934905, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-11-01', 44579, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(409, 'quadri', 'isabel andrea', 'DNI', 18030830, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-12-27', 44605, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(410, 'piccolini', 'patricia alejandra', 'DNI', 16690675, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-04-01', 44672, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(411, 'calabuig', 'martin', 'DNI', 20298854, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-04-17', 44693, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(412, 'sanchez', 'maria lucrecia', 'DNI', 12324495, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-04-10', 44694, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(413, 'bulla', 'valeria beatriz', 'DNI', 22010097, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-03-01', 44695, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(414, 'di', 'fazio isabel lucia v.', 'DNI', 14631308, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-07-01', 44699, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(415, 'esquivel', 'viviana', 'DNI', 18618083, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-07-01', 44700, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(416, 'fadlala', 'jose maria', 'DNI', 17832861, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 44703, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(417, 'ibañez', 'victor vicente', 'DNI', 16985302, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-07-01', 44704, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(418, 'alvarez', 'jorge luis fernando', 'DNI', 16033790, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-12-01', 44707, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(419, 'aronson', 'victor horacio', 'DNI', 17234302, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 44722, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(420, 'chavero', 'mario alejandro', 'DNI', 17399639, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 44728, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(421, 'demichelis', 'adriana monica', 'DNI', 14504328, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 44729, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(422, 'gutierrez', 'nancy adriana', 'DNI', 17320808, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 44740, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(423, 'labarrere', 'alvaro eduardo', 'DNI', 18774256, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 44741, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(424, 'perelli', 'laura adelina', 'DNI', 11099030, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 44748, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(425, 'sobol', 'alejandra', 'DNI', 20141499, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 44749, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(426, 'mantello', 'dora', 'DNI', 13752850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44756, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'DIR. ASISTENTE', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(427, 'crochet', 'enrique lisandro', 'DNI', 24779319, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44781, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(428, 'roldan', 'ana sandra', 'DNI', 18520624, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44785, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(429, 'aguero', 'andres pablo', 'DNI', 18383892, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44800, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(430, 'cavallo', 'susana', 'DNI', 13692015, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44802, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(431, 'moro', 'juan jose', 'DNI', 18559488, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 44808, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'SUB.DIREC.', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(432, 'skindzier', 'elcira victoria', 'DNI', 6288777, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44809, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(433, 'spanevello', 'valeria adriana', 'DNI', 20598733, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 44810, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(434, 'allasia', 'jorge alberto', 'DNI', 17896922, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44814, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(435, 'puig', 'maria gabriela', 'DNI', 13240088, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44816, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(436, 'silva', 'martinez carmen elvira', 'DNI', 18826105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44817, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(437, 'crosta', 'daniel natalio', 'DNI', 17590538, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-12-01', 44818, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(438, 'abalos', 'edgardo javier', 'DNI', 16815535, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-12-01', 44819, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(439, 'ricci', 'sergio alfonso', 'DNI', 14888505, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 44821, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(440, 'pinzone', 'adriana elena', 'DNI', 14143405, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44823, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(441, 'saez', 'carlos alberto', 'DNI', 12381441, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44825, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(442, 'elarrat', 'sara graciela', 'DNI', 13077047, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-07-01', 44827, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(443, 'bartolomei', 'sergio aldo', 'DNI', 17094229, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 44832, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(444, 'logica', 'miguel', 'DNI', 11379208, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44837, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(445, 'espinosa', 'hector enrique', 'DNI', 20098316, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44838, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(446, 'bentolila', 'juan jose', 'DNI', 7841449, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44840, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(447, 'paradelo', 'mauricio ariel', 'DNI', 17954720, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44842, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(448, 'bordato', 'juan antonio', 'DNI', 12028597, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 44853, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(449, 'fernandez', 'pedro federico', 'DNI', 20141154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 44867, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(450, 'vieder', 'claudia silvia', 'DNI', 14084486, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44872, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(451, 'beltramino', 'elisabet andrea', 'DNI', 20180337, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44881, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(452, 'caruana', 'leonardo marcelo(c.ret', 'DNI', 18430123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44883, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'DIRECTOR /A GENERAL', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(453, 'chisari', 'ana carina', 'DNI', 21885695, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44885, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(454, 'elliff', 'maria ines', 'DNI', 17826428, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44892, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(455, 'englander', 'gustavo', 'DNI', 24912662, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-12-01', 44893, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(456, 'feroci', 'silvina andrea', 'DNI', 18361480, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-03-01', 44895, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(457, 'frontini', 'marcela beatriz', 'DNI', 18438909, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44896, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(458, 'gamba', 'ariel alejandro', 'DNI', 20853763, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44897, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(459, 'giuliani', 'malvina maria', 'DNI', 20499570, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44899, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(460, 'gohlke', 'mario cesar', 'DNI', 11871722, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44900, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(461, 'jaimet', 'maria celia', 'DNI', 21875454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 44905, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(462, 'juan', 'roxana', 'DNI', 18339938, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44906, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(463, 'lanciotti', 'sonia olga', 'DNI', 17712312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44907, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(464, 'lifschitz', 'olga rosa', 'DNI', 13169725, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 44908, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(465, 'martin', 'ana maria', 'DNI', 17904370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44910, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(466, 'martinez', 'cabrero karina estela', 'DNI', 18361490, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44911, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(467, 'mastrangelo', 'viviana claudia', 'DNI', 20923225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44912, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(468, 'montero', 'leonor graciela', 'DNI', 6685119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44915, NULL, NULL, 'INST.ALIMENTO DR.B. BERISSO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(469, 'montoya', 'debora noemi', 'DNI', 14094769, NULL, NULL, '', NULL, 1, 23, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2000-11-01', 44916, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-11-07'),
(470, 'musso', 'raquel catalina', 'DNI', 13028681, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44917, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(471, 'perisset', 'esteban maria', 'DNI', 17449493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44919, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(472, 'robbiano', 'cecilia graciela', 'DNI', 14898828, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44925, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(473, 'sero', 'rolando gregorio', 'DNI', 12804880, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44928, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(474, 'stroppi', 'andrea esperanza', 'DNI', 17779699, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44929, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(475, 'camussi', 'mariela fernanda', 'DNI', 21557203, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 44943, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(476, 'quintanilla', 'gabriela maria', 'DNI', 14658030, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44950, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(477, 'salazar', 'ramiro alberto', 'DNI', 18037459, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44953, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(478, 'sarasa', 'osvaldo', 'DNI', 11449061, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44958, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(479, 'capozza', 'maria ines', 'DNI', 18583542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-01-01', 44964, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(480, 'augsburger', 'ana cecilia', 'DNI', 16249511, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-07-01', 44999, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(481, 'mahfud', 'miled', 'DNI', 14760992, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-07-01', 45000, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(482, 'gioia', 'gabriela sandra', 'DNI', 17716547, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 45008, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(483, 'ocampo', 'rosana patricia', 'DNI', 17410080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-06-01', 45024, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(484, 'pait', 'gonzalo andres', 'DNI', 21879983, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-10-01', 45031, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(485, 'dimarco', 'cecilia susana', 'DNI', 21044630, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 45032, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(486, 'candio', 'fernanda mabel', 'DNI', 21415533, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-05-01', 45041, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(487, 'aldaz', 'claudio alfredo', 'DNI', 12944015, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-08-01', 45063, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(488, 'marchesini', 'miriam marcela', 'DNI', 16728158, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 45209, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(489, 'guillen', 'analia noemi', 'DNI', 21531734, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-03-01', 45322, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(490, 'venesia', 'roberto omar', 'DNI', 12050542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-05-01', 45429, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'PROFESIONAL DE LA SALUD', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(491, 'antuna', 'ana maria', 'DNI', 22244520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-07-01', 45442, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(492, 'gherardi', 'guillermo raul', 'DNI', 23973723, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-07-01', 45443, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(493, 'toni', 'pablo', 'DNI', 21932425, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-07-01', 45444, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(494, 'marmiroli', 'laura', 'DNI', 20471638, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-06-01', 45458, NULL, NULL, 'DIR ODONTOLOGIA HOSPITALARIA', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(495, 'linares', 'nicolas', 'DNI', 24586621, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-04-01', 45485, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(496, 'palou', 'bernardo', 'DNI', 25568687, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 45595, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(497, 'piombino', 'diego daniel', 'DNI', 25381962, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 45596, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(498, 'rubi', 'luciano antonio', 'DNI', 22955626, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-04-01', 45603, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(499, 'forte', 'maria jose', 'DNI', 24772845, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 45607, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(500, 'perez', 'juan pablo', 'DNI', 25034334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-03-01', 45610, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(501, 'dominguez', 'maria lorena', 'DNI', 23761306, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 45615, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(502, 'kantor', 'bernardo carlos', 'DNI', 25007252, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-03-01', 45622, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(503, 'neuman', 'martin gustavo', 'DNI', 23539880, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 45623, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(504, 'chappel', 'maria cecilia', 'DNI', 25403440, NULL, NULL, '', NULL, NULL, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2007-10-01', 45627, NULL, 2, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(505, 'bosco', 'marcos ariel', 'DNI', 21826381, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-10-01', 45628, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(506, 'albornoz', 'maria soledad', 'DNI', 24282853, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 45629, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(507, 'idoate', 'maria lis', 'DNI', 25082377, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 45630, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(508, 'alonso', 'castilla mira maría', 'DNI', 24630226, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 45631, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(509, 'falcon', 'maria ester', 'DNI', 20176739, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 45633, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(510, 'cappiello', 'maria gabriela', 'DNI', 24779110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 45639, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(511, 'garcia', 'marina nanci', 'DNI', 23785723, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 45640, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(512, 'ianni', 'daniela alejandra', 'DNI', 22691220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 45641, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(513, 'montani', 'evangelina gisela', 'DNI', 24151395, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 45644, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(514, 'moloeznik', 'laura marcela', 'DNI', 23645377, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 45645, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(515, 'rossi', 'mariana soledad', 'DNI', 23925966, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 45646, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(516, 'giurastante', 'andrea veronica', 'DNI', 22908976, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-03-01', 45650, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(517, 'valcarcel', 'rocio andrea', 'DNI', 24386565, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 45651, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(518, 'stur', 'karim', 'DNI', 23880233, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 45652, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(519, 'cataldo', 'analia cristina', 'DNI', 23928782, NULL, NULL, '', NULL, NULL, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2006-05-01', 45653, NULL, 2, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(520, 'garrote', 'jimena maria', 'DNI', 92874372, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-08-01', 45655, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(521, 'ferrero', 'patricia veronica', 'DNI', 24350412, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-01-01', 45657, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(522, 'maranzana', 'marcelo ruben', 'DNI', 12724710, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-01-01', 45659, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(523, 'crespo', 'horacio alfredo', 'DNI', 22236535, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 45660, NULL, NULL, 'HOSPITAL CARRASCO', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(524, 'dominguez', 'yates leonor mariana', 'DNI', 23849359, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 45664, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(525, 'sabena', 'leticia mabel', 'DNI', 24290911, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 45665, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(526, 'bria', 'silvina mariel', 'DNI', 22438542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 45673, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(527, 'willems', 'david gustavo', 'DNI', 11270679, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 45680, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(528, 'seletti', 'maximiliano', 'DNI', 24863417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-01-01', 45877, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(529, 'talarn', 'ariel alejandro', 'DNI', 25648042, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 45879, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'SUB.DIREC.', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(530, 'fernandez', 'coria rodrigo gaston', 'DNI', 26409089, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 45880, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(531, 'rodriguez', 'marina laura', 'DNI', 25588091, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-11-01', 45883, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(532, 'mussi', 'mariano', 'DNI', 26375863, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 45884, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(533, 'masciarelli', 'paola silvana', 'DNI', 25852389, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 45885, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(534, 'vignoni', 'fernando', 'DNI', 26193241, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 45890, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(535, 'sosa', 'mariana alejandra', 'DNI', 24409764, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 45892, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(536, 'mardoni', 'diana maria', 'DNI', 24887487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-04-01', 45894, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'COORDINADOR/A TERRITORIAL', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(537, 'melgin', 'maria soledad', 'DNI', 26543101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 45896, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(538, 'candia', 'maria cecilia', 'DNI', 26460049, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 45898, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(539, 'mastroberardino', 'juliana andrea', 'DNI', 26073783, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 45899, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(540, 'isaias', 'maria laura', 'DNI', 25900894, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 45900, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(541, 'meroi', 'maria rosa', 'DNI', 26358459, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-11-01', 45901, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(542, 'di', 'marco elina', 'DNI', 23978677, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-11-01', 45902, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(543, 'fachinelli', 'carlos cristian', 'DNI', 20643436, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 45994, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(544, 'echevarria', 'demetrio antonio', 'DNI', 92818037, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 45995, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(545, 'montaner', 'andrea', 'DNI', 23957904, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 45997, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(546, 'terrazzino', 'alicia minuzzo', 'DNI', 14087254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-01', 46664, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(547, 'miljevic', 'julio norberto', 'DNI', 14403369, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-02-01', 46714, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(548, 'pampaluna', 'judit graciela', 'DNI', 13923631, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-07-07', 46735, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(549, 'verger', 'sergio', 'DNI', 14287949, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-01', 46859, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(550, 'perez', 'maria jose', 'DNI', 20130465, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 46901, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(551, 'quiroga', 'adriana marcela', 'DNI', 16415732, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-02-09', 46947, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(552, 'della', 'rosa griselda mariel', 'DNI', 21416253, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-09-01', 46981, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(553, 'chiarotti', 'pablo ignacio', 'DNI', 18476136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 47085, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE CLINICA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(554, 'galvan', 'nestor osvaldo', 'DNI', 20320766, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-19', 47233, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'COORDINADOR/A TECNICO/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(555, 'marmiroli', 'silvia (cargo reteni', 'DNI', 17444358, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-10-01', 47325, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'DIRECTOR /A GENERAL', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(556, 'zivkovich', 'maria fernanda', 'DNI', 17818967, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-02-15', 47346, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(557, 'kabermatter', 'maria', 'DNI', 14158995, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 47350, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(558, 'segado', 'ariel julio', 'DNI', 16483892, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-03-01', 47354, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE CLINICA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(559, 'fernandez', 'bruera gonzalo', 'DNI', 13958881, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-08-01', 47355, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(560, 'yañez', 'luis omar', 'DNI', 12471878, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-09-01', 47359, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(561, 'medina', 'patricia marcela', 'DNI', 17591516, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-06-01', 47360, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(562, 'viarengo', 'maria teresa', 'DNI', 16745609, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-03-01', 47361, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE CENTRO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(563, 'de', 'vita gerardo', 'DNI', 16249635, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 47364, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(564, 'milano', 'zunilda roxana', 'DNI', 16435184, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 47368, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(565, 'maggi', 'maria teresa', 'DNI', 5754858, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 47392, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(566, 'scime', 'gustavo tito', 'DNI', 20947202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-20', 47412, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(567, 'silvestro', 'hector marcelo', 'DNI', 17324207, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-12-01', 47472, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(568, 'bortolozzi', 'raul luis eugenio', 'DNI', 13779773, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-02-01', 47479, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(569, 'solis', 'anabel nereida', 'DNI', 11233470, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-02-01', 47532, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(570, 'varela', 'maria laura', 'DNI', 17387131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-05-02', 47586, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(571, 'montenovo', 'adrian dario', 'DNI', 17099309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 47646, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(572, 'levin', 'alberto salomon', 'LE', 6066240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-07-01', 47656, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(573, 'coirini', 'marcelo daniel', 'DNI', 18393684, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-05-01', 47812, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(574, 'garcia', 'dario antonio', 'DNI', 20674836, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-03-01', 47841, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(575, 'garcia', 'guillermo horacio', 'DNI', 16871690, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 47842, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(576, 'godes', 'juan ernesto', 'DNI', 20176033, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-03-01', 47850, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(577, 'leguizamon', 'marcelo gustavo', 'DNI', 16098636, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 47865, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(578, 'perretta', 'alberto cesar', 'DNI', 12282592, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-06-01', 47902, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(579, 'bonifacich', 'elena amalia', 'DNI', 6031728, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-12-01', 47915, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(580, 'sauro', 'marcelo daniel', 'DNI', 16536785, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-06-22', 47921, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(581, 'travella', 'maria cecilia', 'DNI', 20579805, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-09-01', 47930, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(582, 'trucco', 'juan pablo', 'DNI', 18578253, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 47931, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(583, 'barbona', 'javier', 'DNI', 6141068, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 47960, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(584, 'pierrot', 'claudia alejandra', 'DNI', 16770768, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-08-04', 48018, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(585, 'rodriguez', 'delfina dora susana', 'DNI', 12110020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-08-06', 48026, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(586, 'saldias', 'francisco jose', 'DNI', 17793553, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 48032, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(587, 'larrambebere', 'laura', 'DNI', 18623328, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-09-01', 48157, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(588, 'perez', 'monica fabiana', 'DNI', 18224770, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-09-01', 48225, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(589, 'grigioni', 'martin luis', 'DNI', 11273422, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 48542, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'COORDINADOR/A TECNICO/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(590, 'baro', 'maria cristina', 'DNI', 13174214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-02-17', 48545, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(591, 'del', 'pino maria alejandra', 'DNI', 17444125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 48605, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(592, 'petroni', 'gustavo jose', 'DNI', 17603649, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 48612, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(593, 'ramello', 'pedro daniel', 'DNI', 21650584, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 48619, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE GUARDIA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(594, 'conde', 'hernan rodrigo', 'DNI', 21898670, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 48624, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(595, 'mierez', 'rodrigo', 'DNI', 21108930, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 48631, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(596, 'quiroga', 'richard paul', 'DNI', 92434657, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-10-01', 48633, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(597, 'quacesi', 'marcelo ricardo', 'DNI', 17692645, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-05-01', 48634, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(598, 'nast', 'german sabino', 'DNI', 20754488, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-09-01', 48636, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(599, 'ferraris', 'valeria andrea', 'DNI', 20882526, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 48637, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(600, 'capdevila', 'claudia andrea', 'DNI', 18363373, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-08-01', 48640, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE CLINICA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(601, 'roldan', 'daniela elvira', 'DNI', 20978643, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-07-01', 48642, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(602, 'sotelo', 'lucila', 'DNI', 17668344, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-12-01', 48645, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(603, 'keller', 'luis esteban', 'DNI', 20490841, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 48646, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE CLINICA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(604, 'chiossone', 'ana maria', 'DNI', 14081552, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-07-04', 48765, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(605, 'lande', 'hilda mabel', 'DNI', 11255548, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-07-20', 48812, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(606, 'flores', 'oviedo orlando miguel', 'DNI', 92278310, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-08-01', 48844, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(607, 'andrada', 'graciela cristina', 'DNI', 6256132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-08-01', 48852, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(608, 'macia', 'anibal', 'DNI', 14988546, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-10-26', 48871, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(609, 'bertolotti', 'fatima m. guadalupe', 'DNI', 20882689, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-07-01', 48874, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'MEDICO/A EVALUADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(610, 'silva', 'jose de arimateia', 'DNI', 92219660, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-10-26', 48876, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(611, 'nallino', 'jose carlos', 'DNI', 11678884, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-10-26', 48877, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(612, 'gallardo', 'maria delia', 'DNI', 17668741, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-10-01', 48958, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(613, 'disanti', 'marcela', 'DNI', 17079604, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 48959, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(614, 'troncoso', 'haydee maria', 'DNI', 18216117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 48960, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(615, 'ciaschini', 'carlos alberto', 'DNI', 12523542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 48967, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(616, 'ciarrocca', 'juan carlos ramon', 'DNI', 12977211, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 48970, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(617, 'oliva', 'patricia maria', 'DNI', 13448050, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-10-01', 48975, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(618, 'milito', 'annalisa marcela', 'DNI', 20239214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 48978, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(619, 'aranalde', 'gabriel', 'DNI', 20408978, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-10-01', 48980, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(620, 'achondo', 'marcela alejandra', 'DNI', 17930267, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-07-23', 48982, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'DIR. ASISTENTE', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(621, 'vargas', 'irma nelida', 'DNI', 12749334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-02-01', 48983, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(622, 'alba', 'sandra fabiana', 'DNI', 18473553, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 48984, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(623, 'prigione', 'monti cargo retenido', 'DNI', 21044498, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 48985, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(624, 'iudica', 'graciela isabel', 'DNI', 11200830, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-11-01', 48987, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'SUB.DIREC.', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(625, 'fernandez', 'javier', 'DNI', 14440168, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 48989, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(626, 'españa', 'ricardo alberto', 'DNI', 17078794, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-02-01', 48991, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(627, 'yafusco', 'claudio alejandro', 'DNI', 14664743, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-02-01', 48992, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(628, 'zacchino', 'miriam elisabet', 'DNI', 17033650, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 48994, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(629, 'castagno', 'nanci fabiana', 'DNI', 17104899, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-04-01', 48995, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(630, 'souto', 'dario oscar', 'DNI', 17918786, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 48998, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(631, 'grinspan', 'mario ricardo', 'DNI', 13692763, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 48999, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(632, 'covian', 'gustavo sergio', 'DNI', 20174960, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 49003, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'MEDICO/A EVALUADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(633, 'tamargo', 'carlos angel', 'DNI', 12267272, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-10-01', 49004, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(634, 'furlan', 'claudia carolina', 'DNI', 20197225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-10-01', 49005, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'MED. RADIOLOGO/A - JEFE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(635, 'stettler', 'jorge alberto', 'DNI', 14341172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-01-01', 49006, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(636, 'belletich', 'ruiz pietro antonio', 'DNI', 18735058, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 49008, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(637, 'pajaro', 'gutierrez jose antonio', 'DNI', 18781862, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-10-01', 49009, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(638, 'bonavia', 'horacio dario', 'DNI', 16837037, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 49010, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(639, 'mac', 'carlos alberto', 'DNI', 17234377, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 49011, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(640, 'villavicencio', 'carlos horacio', 'DNI', 13808560, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-08-01', 49016, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE/A DE AREA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(641, 'bazan', 'horacio antonio', 'DNI', 12577031, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 49020, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(642, 'pratto', 'daniel jose', 'DNI', 17262282, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-10-01', 49021, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'COORDIN.AREA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(643, 'bersanker', 'graciela beatriz', 'DNI', 6031314, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 49056, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(644, 'nidd', 'ricardo', 'DNI', 17460542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 49064, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(645, 'de', 'feo hernan ernesto', 'DNI', 20175844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 49077, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(646, 'd elia', 'martin esteban', 'DNI', 22592281, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2004-11-01', 49088, NULL, 3, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(647, 'gervasoni', 'maria eugenia', 'DNI', 21721451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-08-01', 49095, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(648, 'di', 'santo juan jose', 'DNI', 21144226, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-10-01', 49097, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(649, 'giorgi', 'silvia edit', 'DNI', 22087550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-08-01', 49098, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE GUARDIA PEDIATRICA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(650, 'farruggia', 'gustavo gabriel', 'DNI', 20174737, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 49099, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(651, 'tomasetti', 'maria de las mercede', 'DNI', 21578938, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-10-01', 49103, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(652, 'sbarra', 'lercari silvina paula', 'DNI', 20904033, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-10-01', 49104, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(653, 'ruiz', 'silva javier alejo', 'DNI', 21008838, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-06-01', 49105, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(654, 'waxemberg', 'marisa', 'DNI', 21946811, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 49109, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(655, 'marczuk', 'patricia alejandra', 'DNI', 21044693, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 49574, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(656, 'ramos', 'ines beatriz', 'DNI', 20355062, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 49577, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(657, 'aguila', 'brunet damian guillermo', 'DNI', 17825973, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 49578, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(658, 'di', 'caro viviana noemi', 'DNI', 17803455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 49579, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(659, 'tamantini', 'abel mario', 'DNI', 21017817, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997-04-01', 49952, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(660, 'fernandez', 'carlos alberto', 'DNI', 18182550, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2006-07-01', 49994, NULL, 3, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(661, 'caminiti', 'alejandra lujan', 'DNI', 17555539, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 50033, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(662, 'cagnasia', 'sandra veronica', 'DNI', 17773117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-08-01', 50034, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(663, 'cabrera', 'analia monica', 'DNI', 20354087, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 50036, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(664, 'cera', 'domingo', 'DNI', 17471458, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-11-01', 50041, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(665, 'casabuena', 'alejandra maria', 'DNI', 17518937, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 50042, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(666, 'delgado', 'ernesto esteban', 'DNI', 13032564, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-10-01', 50050, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(667, 'fontana', 'laura elena', 'DNI', 18068846, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-08-01', 50055, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(668, 'gonzalez', 'fernando sergio', 'DNI', 17519481, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-07-01', 50063, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(669, 'girardi', 'laura beatriz', 'DNI', 14500455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-05-01', 50065, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(670, 'garcia', 'walter fabian alberto', 'DNI', 16381635, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-06-01', 50066, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(671, 'galicchio', 'miguel federico', 'DNI', 17826025, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 50069, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(672, 'gimelli', 'adriana emilia', 'DNI', 13588850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 50070, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(673, 'galeano', 'eugenio', 'DNI', 16728364, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 50071, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(674, 'javkin', 'adriana lea', 'DNI', 16994601, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-04-01', 50083, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(675, 'lescano', 'claudia cecilia', 'DNI', 14510328, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 50087, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(676, 'lopez', 'jose maria', 'DNI', 17344364, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-12-01', 50088, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(677, 'lopez', 'azcurra  rafael eduardo', 'DNI', 20183964, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 50089, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(678, 'maximino', 'guillermo oscar', 'DNI', 16972178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 50096, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'COORDIN.AREA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(679, 'martinez', 'villa marcela ines', 'DNI', 13972838, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-01', 50097, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(680, 'maldonado', 'daniel oscar', 'DNI', 16807161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-06-01', 50098, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE/A DEPARTAMENTO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(681, 'mazzetti', 'sandra fabiana', 'DNI', 20045350, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-06-01', 50099, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(682, 'martinez', 'liliana graciela', 'DNI', 11445971, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-08-17', 50102, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(683, 'quiroga', 'maria ines', 'DNI', 12507657, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-06-03', 50119, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(684, 'ruiz', 'maria viviana', 'DNI', 18562455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-09-01', 50125, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(685, 'raffagnini', 'marcelo roberto', 'DNI', 16778400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-05-21', 50126, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(686, 'romero', 'dora del huerto', 'DNI', 17130145, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-05-01', 50129, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(687, 'suarez', 'claudia juana', 'DNI', 18568612, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 50132, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(688, 'salguero', 'diego raul', 'DNI', 17523049, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-02-01', 50137, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(689, 'schor', 'marcelo adrian', 'DNI', 18093809, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-07-01', 50141, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(690, 'simioni', 'alberto tomas', 'DNI', 16538126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 50143, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(691, 'sinopoli', 'gustavo maria', 'DNI', 10860003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-12-12', 50147, NULL, NULL, 'MATERNIDAD MARTIN', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(692, 'trevisan', 'sergio omar', 'DNI', 17737070, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 50149, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE GUARDIA', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(693, 'tortorelli', 'miguel angel', 'DNI', 16994717, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 50150, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(694, 'teppaz', 'daniel omar', 'DNI', 16628645, NULL, NULL, '', NULL, 1, 4, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2000-01-01', 50151, NULL, 3, 'SECRETARIA SALUD PUBLICA', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2018-01-22'),
(695, 'vidal', 'liliana beatriz antonia', 'DNI', 12086354, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-01', 50155, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(696, 'ponce', 'de leon patricia alejand', 'DNI', 13502172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-04-01', 50161, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(697, 'juanto', 'mario alberto', 'DNI', 12944739, NULL, NULL, '', NULL, NULL, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '1989-11-08', 50171, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(698, 'orecchia', 'maria jorgelina', 'DNI', 26026827, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 50216, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(699, 'casanova', 'raul oscar', 'DNI', 13169012, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-10-01', 50257, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(700, 'taljame', 'maria laura', 'DNI', 27233894, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-09-01', 50634, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(701, 'angeletti', 'damian adolfo', 'DNI', 27291221, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-06-01', 50636, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(702, 'abellan', 'von farkas diego', 'DNI', 26871179, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 50643, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(703, 'galassi', 'marcos martin', 'DNI', 26503375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 50644, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(704, 'tumini', 'maria andrea', 'DNI', 24684064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 50645, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(705, 'sforzini', 'patricia teresa', 'DNI', 16208485, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 50646, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(706, 'tuttolomondo', 'federico', 'DNI', 25204526, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 50647, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE CENTRO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(707, 'di', 'carlantonio lorena celina', 'DNI', 25311599, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 50650, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(708, 'garcete', 'victoria', 'DNI', 25750687, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-09-01', 50654, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(709, 'zimmermann', 'marisa leticia', 'DNI', 26609267, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 50656, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(710, 'bonetto', 'virginia veronica', 'DNI', 26023025, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-06-01', 50658, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(711, 'siccardi', 'mariana', 'DNI', 24995711, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 50659, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(712, 'marchetti', 'mario hugo', 'DNI', 17160642, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-07-01', 50671, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(713, 'abello', 'marcela claudia', 'DNI', 20174667, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-07-01', 50672, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(714, 'gasparetti', 'mariela', 'DNI', 14449938, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-07-01', 50673, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(715, 'fachinelli', 'dario cristian', 'DNI', 22095342, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-07-01', 50682, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(716, 'mansilla', 'cintia veronica s.', 'DNI', 23281704, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-01', 50683, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(717, 'maidana', 'maria del rosario', 'DNI', 17277488, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 50697, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(718, 'bossicovich', 'carolina', 'DNI', 20298726, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 50705, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(719, 'graff', 'susana elisabet', 'DNI', 22398682, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-19', 50715, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(720, 'forasiepi', 'carina graciela', 'DNI', 22094994, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-19', 50716, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(721, 'azulay', 'alberto', 'DNI', 11271183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-19', 50717, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(722, 'ferreyra', 'maria teresa', 'DNI', 11270868, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-09-01', 50728, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(723, 'paradiso', 'bruno', 'DNI', 22766799, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-09-01', 50729, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(724, 'druetta', 'marta maria del rosar', 'DNI', 10930844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 50780, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(725, 'blanco', 'maria viviana', 'DNI', 13182742, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 50782, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(726, 'zampa', 'ernesto fabian', 'DNI', 20705214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 50783, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(727, 'besprosvanny', 'romina andrea', 'DNI', 23402450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 50784, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(728, 'claus', 'beatriz del carmen', 'DNI', 10410476, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 50785, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(729, 'gomez', 'monica irupe', 'DNI', 23317548, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-01', 50824, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'COORDINADOR/A TERRITORIAL', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(730, 'redin', 'ivana raquel', 'DNI', 20149955, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-01', 50829, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(731, 'cassiraga', 'guillermo', 'DNI', 13509562, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-01', 50834, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(732, 'maccagno', 'georgina eugenia', 'DNI', 26356553, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-01', 50871, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(733, 'aymo', 'florencia', 'DNI', 25982565, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-01', 50881, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(734, 'navarini', 'roberto hugo', 'DNI', 20174220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 50970, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(735, 'gennaro', 'maria veronica', 'DNI', 23052171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 50971, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SERVICIO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(736, 'strano', 'andrea valeria', 'DNI', 21011768, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 50972, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(737, 'fernandez', 'octavio maximo', 'DNI', 23262405, NULL, NULL, '', NULL, 1, 3, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2004-12-01', 50978, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-11-12'),
(738, 'ballone', 'cintia monica', 'DNI', 21890147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 50979, NULL, NULL, 'DIRECCION DE BIOQUIMICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(739, 'schwank', 'cesar ernesto', 'DNI', 11810315, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-08', 50981, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(740, 'valenzuela', 'mariana', 'DNI', 24239213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-08', 50983, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(741, 'bolbol', 'miguel victor', 'DNI', 12480191, NULL, NULL, '', NULL, 1, 25, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2005-02-01', 50984, NULL, 3, 'HOSP.EMERGENCIAS C.ALVAREZ', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-11-12'),
(742, 'gomez', 'hernan gustavo', 'DNI', 23049151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 50989, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(743, 'de', 'michelis jorgelina', 'DNI', 24252220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-01-01', 50992, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(744, 'rodriguez', 'patricia isabel', 'DNI', 20216195, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 51014, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(745, 'vidal', 'carina andrea', 'DNI', 22595286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 51018, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(746, 'flores', 'silvina eleonora', 'DNI', 21962359, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-02-01', 51020, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(747, 'porpatto', 'maria de los angeles', 'DNI', 20174413, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-03-01', 51084, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE CENTRO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(748, 'torletti', 'maria veronica', 'DNI', 23184010, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-03-01', 51085, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(749, 'di', 'paolo silvana', 'DNI', 23038813, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-11-01', 51129, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(750, 'borello', 'adriana marta del v.', 'DNI', 13920782, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-04-01', 51138, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(751, 'quercia', 'claudia fabiana', 'DNI', 22175507, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 51149, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(752, 'moscetta', 'maria eugenia', 'DNI', 22932645, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 51156, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(753, 'spitale', 'natalia brenda', 'DNI', 20174105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 51160, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(754, 'randisi', 'carina alejandra', 'DNI', 22040634, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 51170, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'RESP CONTROL DE CAL Y DOC CLIN', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(755, 'rivero', 'malvina patricia', 'DNI', 21011571, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 51171, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(756, 'renzi', 'diego', 'DNI', 20904174, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-06-01', 51209, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(757, 'miorelli', 'mauro alberto', 'DNI', 23165243, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-07-01', 51210, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(758, 'varoli', 'favio omar', 'DNI', 27047584, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-08-01', 51242, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(759, 'bosch', 'maria belen', 'DNI', 27337749, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-11-01', 51243, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(760, 'valtorta', 'emiliano', 'DNI', 27093125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-06-01', 51249, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(761, 'gavira', 'natalia raquel', 'DNI', 27462778, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 51252, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(762, 'martinez', 'marisol beatriz', 'DNI', 22093319, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-06-01', 51253, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(763, 'quintero', 'nerina vanesa', 'DNI', 25982463, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 51255, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(764, 'aguirre', 'daniel', 'DNI', 28100997, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 51258, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE CENTRO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(765, 'procopio', 'cintia carla', 'DNI', 25149976, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-06-01', 51263, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(766, 'saggal', 'cintia debora', 'DNI', 20173074, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-08-01', 51269, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(767, 'cattaneo', 'dario omar', 'DNI', 14727110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-07-01', 51275, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(768, 'gerbaudo', 'maria susana', 'DNI', 17872972, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-08-01', 51296, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(769, 'molina', 'claudia noemi', 'DNI', 28087851, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-09-01', 51333, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(770, 'torre', 'hugo alfredo', 'DNI', 14704696, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-11-01', 51362, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(771, 'trivisonno', 'fabian mariano', 'DNI', 17668003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-11-01', 51364, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(772, 'camiletti', 'german dario', 'DNI', 21416274, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-11-01', 51365, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(773, 'sagripanti', 'jorge daniel', 'DNI', 17452244, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-11-01', 51366, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(774, 'morali', 'marcelo javier', 'DNI', 22901681, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-11-01', 51367, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(775, 'filas', 'rodolfo', 'DNI', 25750916, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 51379, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(776, 'renna', 'sebastian lorenzo', 'DNI', 28148028, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-08-01', 51426, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(777, 'cruz', 'silvina raquel', 'DNI', 22296497, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-03-01', 51471, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(778, 'belloni', 'soto  maria jose', 'DNI', 20515076, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-12-01', 51489, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(779, 'nodari', 'maria claudia', 'DNI', 18065666, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 51511, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(780, 'perazzo', 'norma', 'DNI', 13077387, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 51515, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'MEDICO/A EVALUADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(781, 'reinhardt', 'maria alejandra', 'DNI', 17148936, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 51516, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(782, 'vilar', 'marcela alejandra', 'DNI', 16867013, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 51517, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(783, 'gussoni', 'porrez marcelo carlos', 'DNI', 18093859, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51554, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(784, 'roldan', 'griselda adriana', 'DNI', 14758910, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51557, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(785, 'salafica', 'javier', 'DNI', 23262414, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51558, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(786, 'galletti', 'mariana', 'DNI', 23760984, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51559, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'RESP. DE CAPACITACION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(787, 'alonso', 'verges alejandro', 'DNI', 22095373, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51560, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'MEDICO/A REGULADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(788, 'ceballos', 'jose maria', 'DNI', 17849709, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51568, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(789, 'marzano', 'hernan lionel', 'DNI', 21579585, NULL, NULL, '', NULL, NULL, 23, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2006-06-01', 51569, NULL, 3, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-11-07'),
(790, 'andreussi', 'lorna beatriz ramona', 'DNI', 20382310, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51574, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(791, 'ruiz', 'mirta graciela', 'DNI', 14975496, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51577, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(792, 'ferrari', 'emilse lidia', 'DNI', 18232807, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51583, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'MEDICO/A EVALUADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(793, 'olivetto', 'adrian luis', 'DNI', 18263987, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51584, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(794, 'bustamante', 'mabel maria', 'DNI', 20175498, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51587, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(795, 'bevacqua', 'dario flavio', 'DNI', 17957534, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51589, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(796, 'garcia', 'igrarabide luciana vero', 'DNI', 22329070, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51591, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(797, 'isurieta', 'ruben rolando', 'DNI', 24479006, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51594, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(798, 'vidal', 'matias', 'DNI', 25902244, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51595, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'DIRECTOR /A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(799, 'ferrero', 'andrea elida', 'DNI', 18564127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51596, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(800, 'fernandez', 'marcela noris', 'DNI', 28565988, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-06-01', 51601, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(801, 'catalano', 'jeronimo benito atili', 'DNI', 26270606, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2011-01-01', 51602, NULL, 2, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(802, 'varela', 'emanuel adolfo', 'DNI', 27466711, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-07-01', 51606, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(803, 'stelzer', 'luciana', 'DNI', 27742691, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-08-01', 51616, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(804, 'servera', 'marta isabel', 'DNI', 26667797, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-06-01', 51621, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(805, 'audisio', 'maricel beatriz', 'DNI', 25750155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-06-01', 51623, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(806, 'cuesta', 'lorena ivana', 'DNI', 26073836, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-05-01', 51625, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(807, 'lujan', 'silvia beatriz', 'DNI', 17701610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51630, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(808, 'prato', 'raul lorenzo', 'DNI', 13632113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51631, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(809, 'sanchez', 'mazzaferri  fabio', 'DNI', 18113057, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51632, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(810, 'laudanno', 'luis alberto', 'DNI', 17807108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51635, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(811, 'peresini', 'silvina margarita', 'DNI', 20175322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51636, NULL, NULL, 'HOSPITAL ALBERDI', 'SUB.DIRECTOR A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(812, 'sanmarti', 'roberto alejandro', 'DNI', 12984450, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2006-07-01', 51640, NULL, 3, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2018-02-09'),
(813, 'leiva', 'jael marina', 'DNI', 20179865, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51644, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(814, 'rios', 'vanesa maria', 'DNI', 22690951, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51646, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(815, 'dimenza', 'luis francisco', 'DNI', 21650106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51649, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(816, 'lombardo', 'silvana edith', 'DNI', 23061399, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51650, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(817, 'gonzalez', 'eduardo adrian', 'DNI', 20176868, NULL, NULL, '', NULL, 1, 23, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2006-07-01', 51652, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-11-07'),
(818, 'scandroglio', 'tomas alcides', 'DNI', 18480422, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51654, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(819, 'ceriani', 'marisela noemi', 'DNI', 20142604, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51655, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(820, 'martinez', 'danilo carlos ariel', 'DNI', 24479387, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51658, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(821, 'molina', 'maria gabriela', 'DNI', 20579983, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51665, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(822, 'trivi', 'iris marcela', 'DNI', 22510730, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51666, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(823, 'vilches', 'aniceto victor guiller', 'DNI', 19019299, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51667, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(824, 'lima', 'anabella claudia', 'DNI', 17807200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 51670, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(825, 'chapelet', 'adrian gustavo', 'DNI', 21578758, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 51683, NULL, NULL, 'HOSPITAL CARRASCO', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(826, 'lesa', 'maria eugenia', 'DNI', 18032089, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 51695, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(827, 'kresic', 'sonia teresita', 'DNI', 22295348, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 51697, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE CENTRO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(828, 'riggio', 'daniela andrea', 'DNI', 21414787, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51704, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(829, 'troiano', 'maria fernanda', 'DNI', 18339917, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51724, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(830, 'alvarez', 'gisela belen', 'DNI', 24386415, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51728, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(831, 'costanzo', 'claudia andrea', 'DNI', 17130066, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51729, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(832, 'battellini', 'elsa gabriela', 'DNI', 20098504, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51730, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(833, 'bogino', 'ana paula', 'DNI', 23936483, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51731, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(834, 'galetto', 'silvina beatriz', 'DNI', 20514848, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51738, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(835, 'roldan', 'veronica irina', 'DNI', 18030804, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51739, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(836, 'cornejo', 'evangelina', 'DNI', 23233285, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51745, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(837, 'fernandez', 'militello edgardo', 'DNI', 25204146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51758, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(838, 'perretta', 'maria martha', 'DNI', 24193525, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51759, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(839, 'asenia', 'sebastian jorge', 'DNI', 21022387, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51785, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(840, 'ronzano', 'gustavo daniel', 'DNI', 21810049, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51786, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(841, 'gori', 'rosa graciela', 'DNI', 12324545, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51788, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(842, 'colusso', 'andrea liliana', 'DNI', 20704672, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51789, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(843, 'lopez', 'pablo alberto', 'DNI', 21417437, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51821, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(844, 'iracelay', 'susana beatriz', 'DNI', 22098146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51822, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(845, 'mandrille', 'gregorio claudia and', 'DNI', 20667689, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51823, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(846, 'perino', 'gabriel miguel', 'DNI', 21818308, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51825, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(847, 'mucilli', 'maria susana', 'DNI', 25492296, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51827, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE CENTRO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(848, 'milanesio', 'natacha noelia', 'DNI', 26020524, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51829, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(849, 'strada', 'monica camila de las me', 'DNI', 22816981, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51830, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(850, 'gaona', 'ines', 'DNI', 24312645, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51832, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(851, 'mercalli', 'carina veronica', 'DNI', 21865844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51841, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(852, 'moran', 'eva del carmen', 'DNI', 12309472, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 51847, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'MEDICO/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(853, 'fernandez', 'silvana daniela', 'DNI', 22889265, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-12-01', 51908, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(854, 'ranalli', 'santiago', 'DNI', 21402460, NULL, NULL, '', NULL, NULL, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2006-12-01', 51910, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(855, 'ramacciotti', 'alejandro roberto', 'DNI', 20174127, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2006-12-01', 51946, NULL, 3, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(856, 'otero', 'emilio jose', 'DNI', 22939052, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 51980, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'MED. RADIOLOGO/A - JEFE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(857, 'mollo', 'elda maria', 'DNI', 12480862, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 51984, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(858, 'galarza', 'maria de lourdes', 'DNI', 20923567, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 51986, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(859, 'di', 'falco veronica', 'DNI', 23899646, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 51987, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(860, 'armando', 'maria cecilia', 'DNI', 18416712, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 51995, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(861, 'vivenzi', 'gustavo nicolas', 'DNI', 23262129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 51996, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(862, 'rovira', 'patricia marta', 'DNI', 13449316, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 51997, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(863, 'cuevas', 'fabiana beatriz', 'DNI', 23096338, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52005, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(864, 'buera', 'juan zenon', 'DNI', 22272737, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52008, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(865, 'barbona', 'roberto enrique', 'DNI', 14137831, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52013, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(866, 'biscione', 'gerardo bautista a.', 'DNI', 12199531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52014, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(867, 'bocchino', 'eduardo victor e.', 'DNI', 12517672, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52015, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'MEDICO/A REGULADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(868, 'ruggieri', 'rodolfo santiago', 'DNI', 23061512, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52016, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(869, 'fracalossi', 'sebastian eduardo', 'DNI', 22374945, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52018, NULL, NULL, 'INTERNACION DOMICILIARIA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(870, 'soboleosky', 'moira roxana', 'DNI', 18562773, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-04-01', 52048, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(871, 'conforti', 'valeria', 'DNI', 26073580, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52057, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(872, 'quignard', 'mariana', 'DNI', 25171076, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52058, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(873, 'lacorte', 'veronica laura', 'DNI', 22296950, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52059, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(874, 'arrieta', 'maria paula', 'DNI', 23061616, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52062, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(875, 'mazzola', 'maricel silvina', 'DNI', 20535930, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52063, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(876, 'bustamante', 'natalia noemi', 'DNI', 26199159, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52064, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(877, 'cirrincione', 'daniel elio', 'DNI', 18233618, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52069, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(878, 'moreno', 'gustavo pablo', 'DNI', 21415597, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52088, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(879, 'sullivan', 'judith claudia', 'DNI', 24980748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52098, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(880, 'paladini', 'melina', 'DNI', 25979376, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52099, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(881, 'charul', 'palacio yanina veronica', 'DNI', 22955440, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52101, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(882, 'galfre', 'luis carlos', 'DNI', 23646155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52109, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(883, 'monzon', 'diego sebastian', 'DNI', 25364293, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52110, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(884, 'maccagni', 'maria carla', 'DNI', 23185125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52111, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'GASTROENTEROLOGO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(885, 'benedetto', 'lucrecia', 'DNI', 26073855, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52136, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(886, 'albarracin', 'carlos hernan', 'DNI', 24239330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52137, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(887, 'alberelli', 'maria romina', 'DNI', 24779098, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52138, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(888, 'rios', 'laura gabriela', 'DNI', 23880651, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52160, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(889, 'bozzetti', 'marcelo humberto', 'DNI', 21984067, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52161, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(890, 'maretti', 'daniel jose', 'DNI', 13588231, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52162, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(891, 'heredia', 'omar daniel', 'DNI', 17424983, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52165, NULL, NULL, 'DIRECCION DE BIOQUIMICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(892, 'foos', 'maria candela', 'DNI', 23488009, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52170, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(893, 'blödorn', 'debora', 'DNI', 24282431, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52177, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE DIVISION', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(894, 'gonzalez', 'leandra fabiana', 'DNI', 23513326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52199, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(895, 'trottini', 'julio cesar', 'DNI', 18267802, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52200, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'COORDINADOR/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(896, 'mallma giraldo', 'marcia olga', 'DNI', 25750006, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2007-06-01', 52201, NULL, 3, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-10-28'),
(897, 'juarez', 'andrea veronica', 'DNI', 22095561, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52202, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(898, 'bottari', 'cristian alberto', 'DNI', 22898105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52203, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'SUB.DIREC.', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(899, 'yacono', 'ariadna elisabet', 'DNI', 21985753, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-04-01', 52219, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(900, 'gonzalez', 'margarita', 'DNI', 17167717, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-04-01', 52224, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(901, 'chaqui', 'gabriel eduardo', 'DNI', 11270314, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-04-01', 52226, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(902, 'cuneo', 'lis', 'DNI', 22400581, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-04-01', 52227, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(903, 'londero', 'eliana', 'DNI', 28913148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-08-01', 52281, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(904, 'figge', 'camila paula', 'DNI', 28146691, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-08-01', 52295, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(905, 'rivero', 'laura', 'DNI', 25750680, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-09-01', 52296, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(906, 'rosa', 'geraldine', 'DNI', 23759905, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-01', 52298, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(907, 'borzone', 'federico carlos', 'DNI', 27887152, NULL, NULL, '', NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2012-07-01', 52301, NULL, 2, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-10-06'),
(908, 'rudolf', 'liza mariela', 'DNI', 24400512, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 52302, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(909, 'weisburd', 'maria juliana', 'DNI', 22091368, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52367, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(910, 'amato', 'ines', 'DNI', 26355519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52375, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(911, 'argento', 'raúl sebastián', 'DNI', 23789643, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-06-01', 52379, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(912, 'buscema', 'valeria laura', 'DNI', 24541290, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52396, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(913, 'fernandez', 'veronica gabriela', 'DNI', 21650961, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52428, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(914, 'ferrari', 'diego dalmiro', 'DNI', 22300265, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52430, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(915, 'guberti', 'federico armando', 'DNI', 23338549, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52458, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(916, 'hollidge', 'maria paula', 'DNI', 23317512, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52462, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(917, 'jauri', 'carrillo cesar augusto', 'DNI', 93277513, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 52464, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(918, 'lainatti', 'laura mabel', 'DNI', 27137200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-11-01', 52472, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(919, 'marmarusso', 'diego javier', 'DNI', 25832741, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 52488, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(920, 'martinez', 'virginia alicia', 'DNI', 25750472, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-11-01', 52492, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(921, 'pastorutti', 'gustavo gabriel', 'DNI', 17728451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52510, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(922, 'pepe', 'vanina carmen', 'DNI', 29140472, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52513, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(923, 'lopez', 'condemarin patricia r.', 'DNI', 92788027, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52559, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(924, 'bitar', 'jorge ignacio', 'DNI', 23403771, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52565, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(925, 'cinelli', 'claudia gabriela', 'DNI', 18643299, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52572, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(926, 'huanambal', 'pablo eugenio', 'DNI', 18772354, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52585, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(927, 'linares', 'marisel carina', 'DNI', 20699123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52589, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(928, 'ocampo', 'carina natalia', 'DNI', 26540631, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52596, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'MEDICO/A HEMATOLOGO/A', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(929, 'olivera', 'jorgelina liliana', 'DNI', 22955713, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-04-01', 52597, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(930, 'poles', 'natalia', 'DNI', 18022718, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52600, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(931, 'rodriguez', 'montani hernan alber', 'DNI', 23716754, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52602, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(932, 'seineldin', 'carlos alejo', 'DNI', 22592370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-11-01', 52608, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(933, 'sosa', 'javier leandro', 'DNI', 24409762, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 52610, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(934, 'thimental', 'vanina soledad', 'DNI', 27196866, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 52614, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(935, 'bertune', 'lorena carolina', 'DNI', 27200444, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52621, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(936, 'diaz', 'silvia susana', 'DNI', 14440936, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 52622, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(937, 'funes', 'sandra maria', 'DNI', 17803159, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52624, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(938, 'mora', 'natalia rosa', 'DNI', 25816744, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52626, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(939, 'moreira', 'ignacio edel', 'DNI', 28407345, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52627, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(940, 'portillo', 'elisabet natalia', 'DNI', 22807580, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 52694, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(941, 'mc', 'garrell daniela lilian', 'DNI', 21557128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52702, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(942, 'serafin', 'egidia rosa', 'DNI', 12265888, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52703, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(943, 'belmonte', 'patricia marcela', 'DNI', 17471315, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 52722, NULL, NULL, 'BANCO CENTRAL DE SANGRE', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(944, 'gonzalez', 'liliana', 'DNI', 14758831, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52787, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(945, 'andreone', 'cristina guadalupe', 'DNI', 16550078, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52788, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(946, 'barros', 'irene paula', 'DNI', 25480127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 52792, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(947, 'formica', 'noelia', 'DNI', 25982088, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52801, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(948, 'landriel', 'carla hortencia', 'DNI', 16770433, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52803, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(949, 'lodigiani', 'mariano jose', 'DNI', 29339276, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 52805, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(950, 'messina', 'lorena veronica', 'DNI', 23623504, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52809, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(951, 'silvestro', 'adriana patricia', 'DNI', 18419879, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-08-01', 52817, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(952, 'perez', 'fernando rodrigo', 'DNI', 25712843, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-08-01', 52829, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(953, 'variego', 'maria', 'DNI', 28058309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 52884, NULL, NULL, 'HOSPITAL ALBERDI', 'JEFE AREA URGENCIAS Y EMERG.', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(954, 'anziano', 'alejandra patricia', 'DNI', 21434378, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 52892, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(955, 'francia', 'maria eugenia', 'DNI', 25519370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 52895, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(956, 'albornoz', 'maria florencia', 'DNI', 22896450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 52896, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(957, 'rotondo', 'leylen amorina', 'DNI', 29724495, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 52900, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(958, 'tinirello', 'florencia paula', 'DNI', 27725003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-06-01', 52903, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(959, 'gabutti', 'ernesto', 'DNI', 20536065, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 52908, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(960, 'saez', 'daniel omar', 'DNI', 23407441, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 52909, NULL, NULL, 'HOSP.DE NIÑOS V.J.VILELA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(961, 'tizziani', 'raquel', 'DNI', 25903724, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-04-01', 52917, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(962, 'cinara', 'luis carlos', 'DNI', 27334903, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 52923, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(963, 'villani', 'alejandro luis', 'DNI', 17326394, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 52924, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(964, 'venturini', 'analia adriana', 'DNI', 21512407, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-12-01', 52925, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(965, 'goralnik', 'jorge luis', 'DNI', 26066950, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-11-01', 52933, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(966, 'jacoboni', 'viviana raquel', 'DNI', 18116524, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-11-01', 52935, NULL, NULL, 'CENTRO ESPEC.MEDIC.AMBULATOR.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(967, 'jamin', 'alexis gustavo', 'DNI', 20174073, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 52936, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'MED. RADIOLOGO/A - JEFE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(968, 'moschin', 'oscar horacio', 'DNI', 11738569, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 52937, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'MED. RADIOLOGO/A - JEFE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(969, 'silva', 'roberto horacio', 'DNI', 10516990, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 52938, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'MED. RADIOLOGO/A - JEFE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(970, 'muñoz', 'maria soledad', 'DNI', 22955232, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 52939, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'MED. RADIOLOGO/A - JEFE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(971, 'cardillo', 'omar pedro', 'DNI', 14087164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 52940, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(972, 'pla', 'fernando martin', 'DNI', 20461493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 52941, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(973, 'settetrombe', 'jorgelina fernanda', 'DNI', 21843827, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 52942, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(974, 'vera', 'leonardo valentin', 'DNI', 22595499, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 52943, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(975, 'capriotti', 'corrente lila', 'DNI', 27057243, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-12-01', 52993, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(976, 'rosso', 'fernando antonio', 'DNI', 14940481, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 53054, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(977, 'macagno', 'berenice', 'DNI', 25900860, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 53074, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(978, 'chapoñan', 'acha manuel miguel', 'DNI', 92808925, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-12-01', 53077, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(979, 'peñaranda', 'eliana raquel', 'DNI', 24207077, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-12-01', 53079, NULL, NULL, 'SIS.INTEG.DE EMERG.SANITARIA.', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(980, 'lopez', 'gonzalez gustavo', 'DNI', 24722869, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53138, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(981, 'ostoich', 'maria teresa', 'DNI', 16072425, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 53140, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(982, 'giarra', 'martin', 'DNI', 25648474, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 53160, NULL, NULL, 'SECRETARIA SALUD PUBLICA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(983, 'salina', 'maria paola', 'DNI', 23964514, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-07-01', 53204, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(984, 'molina', 'pedro augusto', 'DNI', 22439100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 53234, NULL, NULL, 'MATERNIDAD MARTIN', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(985, 'bortoli', 'hernan marcelo', 'DNI', 21421254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-04-01', 53240, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(986, 'fonaroff', 'enrique gabriel', 'DNI', 25707609, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-03-01', 53241, NULL, NULL, 'HOSPITAL CARRASCO', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(987, 'andaluz', 'walter daniel', 'DNI', 22205428, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-05-01', 53322, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(988, 'domanico', 'alfredo ariel', 'DNI', 23674783, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-09-01', 53410, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(989, 'franchi', 'natalia cecilia', 'DNI', 25450876, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-10-01', 53411, NULL, NULL, 'HOSP.EMERGENCIAS C.ALVAREZ', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(990, 'guerrina', 'claudio marcelo', 'DNI', 23746807, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53419, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(991, 'melatini', 'zulma', 'DNI', 16491137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-06-01', 53468, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(992, 'cena', 'patricia soledad', 'DNI', 27064385, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 53472, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(993, 'guerrina', 'claudio marcelo', 'DNI', 23746807, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53419, NULL, NULL, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(994, 'melatini', 'zulma', 'DNI', 16491137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-06-01', 53468, NULL, NULL, 'HOSPITAL ROQUE SAENZ PEÑA', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(995, 'cena', 'patricia soledad', 'DNI', 27064385, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2008-07-01', 53472, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-10-08'),
(996, 'franzolini', 'magali fernanda', 'DNI', 29933881, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2012-11-01', 53483, NULL, 2, 'DIR.GRAL.DE SERVICIOS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, '2017-12-13'),
(997, 'ainsuain', 'diego oscar', 'DNI', 25224540, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53495, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(998, 'carlesso', 'soledad celeste', 'DNI', 28069849, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-08-01', 53496, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE SECTOR', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(999, 'mirada', 'sabrina', 'DNI', 29221783, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 53498, NULL, NULL, 'DIRECCION DE CENTROS DE SALUD', 'JEFE DE CENTRO', 'PERMANENTES', 'MEDICO', NULL, NULL, NULL, NULL, NULL),
(1000, 'velez', 'manuel', 'DNI', 30155087, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, 1, 'direccion servicios salud', NULL, NULL, '', NULL, NULL, NULL, '2017-10-06', '2017-11-07'),
(1001, 'sinopoli', 'belen', 'DNI', 31874783, NULL, NULL, 'foto/2017/10/rxmanosobls.png', NULL, 1, 1, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, 1, '', NULL, NULL, '', NULL, NULL, NULL, '2017-10-06', '2017-10-08'),
(1003, 'venaria', 'alejandro', 'DNI', 1, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, '2017-10-06', '2017-10-08'),
(1004, 'cepeda', 'javier', 'DNI', 1, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, 2, '', NULL, NULL, '', NULL, NULL, NULL, '2017-10-06', '2017-10-08'),
(1005, 'taborro', 'betina', 'DNI', 1, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, 1, '', NULL, NULL, '', NULL, NULL, NULL, '2017-10-23', '2017-11-06'),
(1007, 'urbinati', 'leonor', 'DNI', 1, NULL, NULL, '', NULL, 1, 4, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, 44863, NULL, 1, '', NULL, NULL, '', NULL, NULL, NULL, '2017-10-25', '2017-10-25'),
(1008, 'randolino', 'gimena', 'DNI', 28280381, NULL, NULL, NULL, '1980-07-15', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-01-01', 53507, NULL, NULL, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A TOCOGINECOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1120, 'santini', 'carlos javier', 'DNI', 22435749, '20-22435749-5', NULL, NULL, '1971-12-21', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-03-01', 43317, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1121, 'nicolorich', 'maria', 'DNI', 20971126, '27-20971126-0', NULL, NULL, '1969-09-24', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-09-01', 44134, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1122, 'rodriguez', 'angelina marta', 'DNI', 25979153, '27-25979153-2', NULL, NULL, '1977-05-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 51604, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1123, 'buono', 'yanina alejandra', 'DNI', 29730339, '27-29730339-8', NULL, NULL, '1982-11-09', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-01-01', 53480, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A TOCOGINECOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1124, 'signorelli', 'maria cecilia', 'DNI', 28148547, '23-28148547-4', NULL, NULL, '1980-06-01', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-01', 53493, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(1125, 'gumy', 'etelvina marisa', 'DNI', 26912921, '27-26912921-8', NULL, NULL, '1978-12-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-01', 53541, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1126, 'urbinatti', 'leonor beatriz', 'DNI', 25171132, '27-25171132-7', NULL, NULL, '1976-03-18', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-01-01', 54058, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A TOCOGINECOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1127, 'ruiz', 'macarena', 'DNI', 30560505, '27-30560505-6', NULL, NULL, '1983-11-20', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-07-01', 54152, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A TOCOGINECOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1128, 'rahi', 'mariana', 'DNI', 32125520, '27-32125520-0', NULL, NULL, '1986-04-06', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-01', 54229, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(1129, 'di', 'santolo analia', 'DNI', 21958644, '27-21958644-8', NULL, NULL, '1970-12-22', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-05-01', 54705, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1130, 'pijuan', 'maria victoria', 'DNI', 28575153, '27-28575153-0', NULL, NULL, '1981-06-17', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-06-01', 54723, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'KINESIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1131, 'giacomino', 'mariana ines', 'DNI', 28486839, '27-28486839-6', NULL, NULL, '1981-03-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-01', 54726, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1132, 'pecile', 'rosana maria', 'DNI', 27101955, '27-27101955-1', NULL, NULL, '1979-09-25', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-01', 54741, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'PSICOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1133, 'suarez', 'veronica flavia', 'DNI', 24289589, '23-24289589-4', NULL, NULL, '1975-01-22', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-10-01', 54770, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'FARMACEUTICO/A', NULL, NULL, NULL, NULL, NULL),
(1134, 'gallardo', 'veronica', 'DNI', 21885478, '27-21885478-3', NULL, NULL, '2999-12-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 54774, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1135, 'robledo', 'belinda', 'DNI', 33301123, '27-33301123-4', NULL, NULL, '1988-01-09', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-01', 54784, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1136, 'de', 'vincentis maria victoria', 'DNI', 33561444, '27-33561444-0', NULL, NULL, '1988-01-17', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-01', 54785, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1137, 'de', 'azcuenaga maria jose', 'DNI', 31272660, '27-31272660-8', NULL, NULL, '1984-10-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-01-01', 54790, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1138, 'godoy', 'maria soledad', 'DNI', 30185644, '27-30185644-5', NULL, NULL, '1983-06-02', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-01', 54800, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(1139, 'sacco', 'guido', 'DNI', 35222021, '20-35222021-4', NULL, NULL, '1990-06-12', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-01', 54801, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TECNICO/A BIOQUIMICO', NULL, NULL, NULL, NULL, NULL),
(1140, 'talledo', 'rodrigo', 'DNI', 37715291, '20-37715291-4', NULL, NULL, '1994-04-27', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-01', 54803, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TECNICO/A BIOQUIMICO', NULL, NULL, NULL, NULL, NULL),
(1141, 'lastorta', 'fernando', 'DNI', 17507394, '23-17507394-9', NULL, NULL, '1965-11-15', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-01', 54804, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TECNICO/A BIOQUIMICO', NULL, NULL, NULL, NULL, NULL),
(1142, 'ceola', 'manuela', 'DNI', 31500778, '27-31500778-5', NULL, NULL, '1985-04-21', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-03-01', 54806, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'FONOAUDIÓLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1143, 'puntonet', 'evangelina', 'DNI', 26016235, '27-26016235-2', NULL, NULL, '1977-10-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-03-01', 54807, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1144, 'herrera', 'manuela', 'DNI', 33684772, '27-33684772-4', NULL, NULL, '1988-05-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-03-01', 54808, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1145, 'bernaus', 'marianela', 'DNI', 30630225, '27-30630225-1', NULL, '', '1983-11-11', 1, 7, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2015-03-01', 54809, NULL, 2, '', NULL, 'REEMPLAZANTE', 'MEDICO/A CIRUJANO', NULL, NULL, NULL, NULL, '2018-01-22'),
(1146, 'funes', 'paula belen', 'DNI', 34044856, '27-34044856-7', NULL, NULL, '1988-12-26', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-03-01', 54812, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1147, 'barrios', 'maria lujan', 'DNI', 30476179, '27-30476179-8', NULL, NULL, '1984-05-09', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-04-01', 54821, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(1148, 'lopez papucci', 'pedro agustin', 'DNI', 31393392, '20-31393392-0', NULL, '', '1985-01-20', 1, 5, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2015-05-01', 54823, NULL, 1, '', NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, '2018-01-19'),
(1149, 'fernandez', 'luciana', 'DNI', 30459123, '23-30459123-4', NULL, NULL, '1983-10-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-01', 54824, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A ', NULL, NULL, NULL, NULL, NULL),
(1150, 'lissarrague', 'daniela', 'DNI', 28372077, '27-28372077-8', NULL, NULL, '1980-09-19', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-01', 54827, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A CARDIOLOGO', NULL, NULL, NULL, NULL, NULL),
(1151, 'battilana', 'javier', 'DNI', 27725039, '20-27725039-0', NULL, NULL, '1979-09-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-01', 54829, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1152, 'santoro', 'maria victoria', 'DNI', 29140429, '23-29140429-4', NULL, NULL, '1981-10-01', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-01', 54832, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(1153, 'panciroli', 'rocio belen', 'DNI', 31961923, '27-31961923-8', NULL, NULL, '1985-12-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-01', 54834, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1154, 'malchiodi', 'mariana', 'DNI', 29662244, '27-29662244-9', NULL, NULL, '1982-10-01', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-08-01', 54842, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'PSICOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1155, 'gamba', 'marilina', 'DNI', 33469115, '27-33469115-8', NULL, NULL, '1987-12-21', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-09-01', 54844, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1156, 'cruz', 'nancy', 'DNI', 23317617, '27-23317617-1', NULL, NULL, '2999-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-09-01', 54847, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1157, 'villarruel', 'micaela', 'DNI', 30802319, '27-30802319-8', NULL, NULL, '1984-05-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-01', 54848, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1158, 'mancione', 'manuela', 'DNI', 33623355, '27-33623355-6', NULL, NULL, '1988-10-06', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-10-01', 54853, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1159, 'michelli', 'paola', 'DNI', 30102068, '27-30102068-1', NULL, NULL, '2999-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-10-01', 54854, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1160, 'lopez', 'jorge', 'DNI', 29001656, '20-29001656-9', NULL, NULL, '2999-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-11-01', 54856, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1161, 'vicente', 'maria emilia', 'DNI', 29487025, '27-29487025-9', NULL, NULL, '1982-04-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-11-01', 54887, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1162, 'lepori', 'cynthia', 'DNI', 30478386, '27-30478386-6', NULL, NULL, '1983-10-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-01', 54889, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1163, 'pons', 'maria', 'DNI', 28499826, '27-28499826-5', NULL, NULL, '1981-07-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-01', 54891, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1164, 'andrada', 'cecilia', 'DNI', 29401739, '27-29401739-4', NULL, NULL, '1982-04-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-01', 54892, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1165, 'liaudat', 'carolina', 'DNI', 31282393, '23-31282393-4', NULL, NULL, '2999-12-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 54900, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1166, 'd angelo', 'marianela', 'DNI', 27332795, '27-27332795-4', NULL, NULL, '1979-12-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 54901, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1167, 'grana', 'gaston', 'DNI', 29662706, '20-29662706-3', NULL, NULL, '1988-10-04', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-11-01', 54902, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A TOCOGINECOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1168, 'portoman', 'facundo nicolas', 'DNI', 38448559, '20-38448559-7', NULL, NULL, '1994-10-28', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 54903, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TEC. RADIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1169, 'genta', 'maia', 'DNI', 32289830, '23-32289830-4', NULL, NULL, '1986-08-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 54905, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1170, 'acosta', 'erica', 'DNI', 30484761, '27-30484761-7', NULL, NULL, '1983-12-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 54907, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1171, 'cripovich', 'alejandrina', 'DNI', 31535627, '27-31535627-5', NULL, NULL, '1985-04-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 54908, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1172, 'wuthrich', 'gabriela', 'DNI', 29500093, '27-29500093-2', NULL, NULL, '1982-10-14', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54910, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(1173, 'sague', 'lizandro', 'DNI', 31432599, '20-31432599-1', NULL, NULL, '1984-02-10', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 54912, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'PSICOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1174, 'giroud', 'guillet gisela', 'DNI', 33933922, '27-33933922-3', NULL, NULL, '1988-08-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 54913, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1175, 'monteverde', 'maria paula', 'DNI', 32841499, '27-32841499-1', NULL, NULL, '1987-07-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 54914, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1176, 'uribe', 'mariel', 'DNI', 26143457, '27-26143457-7', NULL, NULL, '1977-10-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 54915, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1177, 'abrudsky', 'laura judith', 'DNI', 25007573, '27-25007573-7', NULL, NULL, '1976-04-12', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-03-01', 54918, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'PSICOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1178, 'ronchi', 'ana', 'DNI', 30165963, '27-30165963-1', NULL, NULL, '1983-08-19', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-03-01', 54919, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'PSICOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1179, 'farini', 'andrea', 'DNI', 27560855, '27-27560855-1', NULL, NULL, '1979-08-01', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-03-01', 54922, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1180, 'stepnik', 'german', 'DNI', 25910517, '20-25910517-0', NULL, NULL, '1977-11-02', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-03-01', 54923, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'ODONTOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1181, 'mayora', 'maria violeta', 'DNI', 29828030, '27-29828030-8', NULL, NULL, '1982-10-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-04-01', 54925, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1182, 'domanico', 'mariana', 'DNI', 28912966, '27-28912966-4', NULL, NULL, '1981-08-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-04-01', 54926, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1183, 'ameriso', 'lucia', 'DNI', 34557791, '27-34557791-8', NULL, NULL, '1989-07-26', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-04-01', 54927, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TECNICO/A BIOQUIMICO', NULL, NULL, NULL, NULL, NULL),
(1184, 'virili', 'cesar', 'DNI', 32579285, '20-32579285-0', NULL, NULL, '1987-04-05', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-04-01', 54928, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'FARMACEUTICO/A', NULL, NULL, NULL, NULL, NULL),
(1185, 'fonseca', 'joaquin', 'DNI', 31540528, '23-31540528-9', NULL, NULL, '1985-02-19', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-01', 54930, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TECNICO/A BIOQUIMICO', NULL, NULL, NULL, NULL, NULL),
(1186, 'garello', 'rafael', 'DNI', 26428138, '20-26428138-6', NULL, NULL, '1978-05-19', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-01', 54931, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TECNICO/A BIOQUIMICO', NULL, NULL, NULL, NULL, NULL),
(1187, 'maino', 'sergio gabriel', 'DNI', 25900478, '20-25900478-1', NULL, NULL, '1977-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-01', 54932, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PSIQUIATRA', NULL, NULL, NULL, NULL, NULL),
(1188, 'glocer', 'dina', 'DNI', 32125938, '27-32125938-9', NULL, NULL, '1986-05-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-01', 54934, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1189, 'kinkela', 'juana', 'DNI', 29863791, '27-29863791-5', NULL, NULL, '1983-07-15', 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-01', 54938, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A GENERALISTA', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1190, 'alberti', 'maria sol', 'DNI', 34240560, '27-34240560-1', NULL, NULL, '1989-04-24', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54941, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'KINESIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1191, 'scuderi', 'valeria  gisela', 'DNI', 29047207, '27-29047207-0', NULL, NULL, '1981-10-30', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-01', 54942, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'KINESIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1192, 'gago', 'noble paula', 'DNI', 33316994, '27-33316994-6', NULL, NULL, '1988-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-01', 54943, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1193, 'perez', 'cecilia', 'DNI', 32074195, '27-32074195-0', NULL, NULL, '1986-04-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-01', 54944, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1194, 'bernava', 'juan luis', 'DNI', 31364140, '20-31364140-7', NULL, NULL, '1984-12-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-01', 54945, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1195, 'preisz', 'roman yamil', 'DNI', 26332280, '20-26332280-1', NULL, NULL, '2999-12-12', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-01', 54949, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'KINESIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1196, 'benetti', 'maria jose', 'DNI', 30548174, '27-30548174-8', NULL, NULL, '1983-09-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-01', 54950, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1197, 'ruiz', 'maria belen', 'DNI', 36691142, '27-36691142-7', NULL, NULL, '1992-02-29', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-01', 54951, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TEC. RADIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1198, 'bier', 'cecilia ines', 'DNI', 30048600, '27-30048600-8', NULL, NULL, '1983-03-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-01', 54952, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1199, 'latini', 'ariana', 'DNI', 35647805, '27-35647805-9', NULL, NULL, '1991-06-13', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-01', 54953, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'FARMACEUTICO/A', NULL, NULL, NULL, NULL, NULL),
(1200, 'osca', 'maria', 'DNI', 33990293, '27-33990293-9', NULL, NULL, '1989-04-18', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-01', 54954, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1201, 'coviello', 'german', 'DNI', 28565639, '20-28565639-8', NULL, NULL, '1980-11-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-01', 54955, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1202, 'balbuena', 'jeronimo', 'DNI', 27466210, '20-27466210-8', NULL, NULL, '1979-08-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-01', 54956, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1203, 'mela', 'mariana', 'DNI', 32505040, '27-32505040-9', NULL, NULL, '1986-09-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-01', 54957, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1204, 'copioli', 'diego alejandro', 'DNI', 31313797, '20-31313797-0', NULL, NULL, '1985-04-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-01', 54958, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1205, 'moreyra', 'mariana melisa', 'DNI', 32496757, '27-32496757-0', NULL, NULL, '1986-08-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-01', 54959, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1206, 'samaniego', 'franco', 'DNI', 33451130, '20-33451130-9', NULL, NULL, '1987-11-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-01', 54962, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1207, 'schiavo', 'julieta belen', 'DNI', 33573183, '27-33573183-8', NULL, NULL, '1988-03-04', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-01', 54967, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1208, 'lucero', 'emiliano', 'DNI', 27863147, '20-27863147-9', NULL, NULL, '1980-07-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-01', 54968, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1209, 'vives', 'maria veronica', 'DNI', 24647466, '27-24647466-5', NULL, NULL, '1970-10-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-01', 54970, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A OFTALMOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1210, 'maceroni', 'claudia', 'DNI', 32832734, '27-32832734-4', NULL, NULL, '1987-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-01', 54971, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1211, 'alessandrini', 'alejandra', 'DNI', 29099170, '27-29099170-1', NULL, NULL, '1981-10-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-10-01', 54973, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1212, 'rubulotta', 'melisa', 'DNI', 33807962, '27-33807962-7', NULL, NULL, '1988-10-05', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-11-01', 54979, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'ODONTOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1213, 'chimento', 'maria fernanda', 'DNI', 29402925, '27-29402925-2', NULL, NULL, '1982-05-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-11-01', 54980, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PSIQUIATRA', NULL, NULL, NULL, NULL, NULL),
(1214, 'britez', 'silvina', 'DNI', 31406073, '27-31406073-9', NULL, NULL, '2999-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-11-01', 54981, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1215, 'aresi', 'ariel', 'DNI', 28536612, '20-28536612-8', NULL, NULL, '1981-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-11-01', 54983, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1216, 'orue', 'hernan', 'DNI', 32082078, '20-32082078-3', NULL, NULL, '2999-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-11-01', 54984, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1217, 'blanco', 'lucrecia', 'DNI', 34100051, '27-34100051-9', NULL, '', '1988-08-30', 12, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-12-01', 54988, NULL, 2, '', NULL, 'REEMPLAZANTE', 'ODONTOLOGO/A', NULL, NULL, NULL, NULL, '2018-01-22'),
(1218, 'ocampo', 'alzate carlos david', 'DNI', 19019530, '23-19019530-9', NULL, NULL, '1990-12-07', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-01', 54989, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1219, 'oprimi', 'ramirez yamila', 'DNI', 33318469, '27-33318469-4', NULL, NULL, '1987-12-21', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-01', 54990, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1220, 'acevedo', 'cristina susana', 'DNI', 30484907, '27-30484907-5', NULL, NULL, '1983-10-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-01', 54991, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1221, 'salido', 'carolina', 'DNI', 30890866, '27-30890866-1', NULL, NULL, '1984-06-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-01', 54992, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1222, 'torres', 'liliana', 'DNI', 32129004, '27-32129004-9', NULL, NULL, '1986-01-09', 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-01', 54993, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A GENERALISTA', NULL, NULL, NULL, NULL, NULL),
(1223, 'truccolo', 'paula', 'DNI', 28576339, '27-28576339-3', NULL, NULL, '1981-04-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-01', 54996, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1224, 'crudeli', 'bruno', 'DNI', 33129454, '20-33129454-4', NULL, NULL, '1987-10-24', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-01-01', 54997, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'PSICOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1225, 'vicenz', 'florencia', 'DNI', 36612121, '27-36612121-3', NULL, NULL, '1992-02-26', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-01-01', 54999, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1226, 'sabatini', 'luciana cristina', 'DNI', 30875148, '27-30875148-7', NULL, NULL, '1984-09-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 55546, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1228, 'adriani', 'santiago javier', 'DNI', 32307001, '20-32307001-7', NULL, '', '1986-02-18', 1, 3, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2015-09-01', 56285, NULL, 1, '', NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, '2017-11-06'),
(1229, 'pizzo', 'debora mariel', 'DNI', 31815132, '27-31815132-1', NULL, NULL, '1985-08-05', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-04-01', 56300, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(1230, 'cosentino', 'guido', 'DNI', 31435067, '20-31435067-8', NULL, NULL, '1985-04-15', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 56302, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(1231, 'rodriguez', 'maria eugenia', 'DNI', 30312761, '27-30312761-0', NULL, NULL, '1984-02-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-01', 56316, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1232, 'moron', 'maria guadalupe', 'DNI', 30347276, '27-30347276-8', NULL, NULL, '1983-11-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-01', 56391, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1233, 'capeletti', 'maria alejandra', 'DNI', 27124596, '27-27124596-9', NULL, NULL, '1979-01-14', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56620, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1234, 'forno', 'm.florencia', 'DNI', 32217486, '27-32217486-7', NULL, NULL, '1986-04-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 57055, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1235, 'giussani', 'natali roxana', 'DNI', 32185842, '27-32185842-8', NULL, NULL, '1986-07-01', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-01', 57059, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(1236, 'paglialunga', 'melisa guadalupe', 'DNI', 32490242, '27-32490242-8', NULL, NULL, '1986-09-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 57065, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1237, 'nal', 'alejandra vanesa', 'DNI', 31542275, '27-31542275-8', NULL, NULL, '1985-04-23', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-01', 57147, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PEDIATRA', NULL, NULL, NULL, NULL, NULL),
(1238, 'raimondi', 'priscila lais', 'DNI', 32218974, '27-32218974-0', NULL, NULL, '1986-05-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 57648, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1239, 'pilotti', 'florencia marcela', 'DNI', 32703084, '27-32703084-7', NULL, NULL, '1986-12-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-01', 57657, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1240, 'cesolari', 'jorgelina mabel', 'DNI', 30301765, '27-30301765-3', NULL, NULL, '1983-09-12', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-01', 57658, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A NEONATOLOGO', NULL, NULL, NULL, NULL, NULL),
(1241, 'delizia', 'maria florencia', 'DNI', 29690339, '27-29690339-1', NULL, NULL, '1982-12-28', 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-01', 57660, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A GENERALISTA', NULL, NULL, NULL, NULL, NULL),
(1242, 'paultroni', 'maria laura', 'DNI', 32191428, '23-32191428-4', NULL, NULL, '1986-03-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-01', 57729, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1243, 'malanca', 'carla', 'DNI', 30379929, '27-30379929-5', NULL, NULL, '1983-09-09', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-05-01', 58121, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A GINECOLOGA', NULL, NULL, NULL, NULL, NULL),
(1244, 'sermasi', 'agustin eduardo', 'DNI', 33190033, '20-33190033-9', NULL, NULL, '1987-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 58174, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1245, 'cimenton', 'natali andrea', 'DNI', 33446387, '24-33446387-3', NULL, NULL, '1988-03-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 58180, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1246, 'tomich', 'magali', 'DNI', 30986062, '23-30986062-4', NULL, NULL, '1984-10-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 58191, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1247, 'batistuta', 'clarisa', 'DNI', 31849673, '27-31849673-6', NULL, NULL, '1985-09-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-01-01', 59529, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1248, 'petsiotis', 'bruna', 'DNI', 30763244, '27-30763244-1', NULL, NULL, '1984-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-01-01', 59530, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TRABAJADOR/A SOCIAL', NULL, NULL, NULL, NULL, NULL),
(1249, 'maria', 'helga eliana', 'DNI', 28806679, '27-28806679-0', NULL, NULL, '1981-08-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-01-01', 59531, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A NEUROLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1250, 'silva', 'avendaño andres', 'DNI', 18824432, '20-18824432-8', NULL, NULL, '1966-06-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-01-01', 59533, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1251, 'fiorucci', 'gabriela', 'DNI', 21422393, '27-21422393-2', NULL, NULL, '1970-03-09', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-01', 59549, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TEC. RADIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1252, 'portoman', 'maria elena', 'DNI', 27059989, '27-27059989-9', NULL, NULL, '1979-03-06', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-01', 59550, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TEC. RADIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1253, 'uberti', 'maria eugenia', 'DNI', 35586925, '23-35586925-3', NULL, NULL, '1991-11-25', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-01', 59551, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TEC. RADIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1254, 'degiorgis', 'marisa', 'DNI', 23156640, '27-23156640-1', NULL, NULL, '1973-10-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-01', 59552, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TRABAJADOR/A SOCIAL', NULL, NULL, NULL, NULL, NULL),
(1255, 'ansaldi', 'sebastian', 'DNI', 32312228, '20-32312228-9', NULL, NULL, '1986-06-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-01', 59554, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1256, 'falco', 'susel', 'DNI', 35748811, '27-35748811-2', NULL, NULL, '1991-02-15', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-02-01', 59555, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'FARMACEUTICO/A', NULL, NULL, NULL, NULL, NULL),
(1257, 'argento', 'lucas', 'DNI', 30948321, '23-30948321-9', NULL, NULL, '1984-04-27', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-03-01', 59689, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'KINESIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1258, 'frigieri', 'luciano', 'DNI', 36055436, '20-36055436-9', NULL, NULL, '1991-06-27', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-03-01', 59690, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1259, 'scapino', 'juan manuel', 'DNI', 33791411, '20-33791411-0', NULL, NULL, '1988-04-23', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-03-01', 59691, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TECNICO/A BIOQUIMICO', NULL, NULL, NULL, NULL, NULL),
(1260, 'carroza', 'juan', 'DNI', 29443444, '20-29443444-6', NULL, NULL, '1982-08-09', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-03-01', 59692, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1261, 'abud', 'leonel yair', 'DNI', 33619571, '20-33619571-4', NULL, NULL, '1988-07-06', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-03-01', 59693, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'PSICOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1262, 'herrera', 'nahuel', 'DNI', 34572525, '20-34572525-4', NULL, NULL, '1990-05-17', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-04-01', 59709, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1263, 'herrero', 'analia', 'DNI', 31758158, '27-31758158-6', NULL, NULL, '2999-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-04-01', 59711, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1264, 'anton', 'mauricio', 'DNI', 27880901, '20-27880901-4', NULL, NULL, '1980-01-18', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-04-01', 59712, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'KINESIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1265, 'saez', 'maria elisa', 'DNI', 28130268, '27-28130268-5', NULL, NULL, '1980-07-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-05-01', 59722, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A ENDROCRINOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1266, 'borzone', 'martin jose', 'DNI', 28731454, '20-28731454-0', NULL, NULL, '1981-05-22', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-06-01', 56283, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A TRAUMATOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1267, 'puente', 'maria alejandra', 'DNI', 20255886, '27-20255886-6', NULL, NULL, '1969-10-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-06-01', 59842, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A PSIQUIATRA', NULL, NULL, NULL, NULL, NULL),
(1268, 'tripoloni', 'javier', 'DNI', 26662261, '23-26662261-9', NULL, NULL, '1978-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-06-01', 59843, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1269, 'lazzaroni', 'matias', 'DNI', 30700994, '20-30700994-4', NULL, NULL, '1984-11-18', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-06-01', 59844, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A TRAUMATOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1270, 'panizza', 'antolina', 'DNI', 32038277, '27-32038277-2', NULL, NULL, '1986-06-19', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-01', 59916, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'BIOQUIMICO/A', NULL, NULL, NULL, NULL, NULL),
(1271, 'berloni', 'luciano', 'DNI', 35714026, '23-35714026-9', NULL, NULL, '1991-05-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59937, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1272, 'lopez', 'diana', 'DNI', 30169580, '27-30169580-8', NULL, NULL, '1993-05-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59938, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1273, 'buttori', 'ivana', 'DNI', 31623385, '27-31623385-1', NULL, NULL, '1986-04-30', 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59939, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A GENERALISTA', NULL, NULL, NULL, NULL, NULL),
(1274, 'gallo', 'andrea', 'DNI', 33299503, '27-33299503-6', NULL, NULL, '1987-09-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59940, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1275, 'carasso', 'florencia', 'DNI', 28575765, '27-28575765-2', NULL, NULL, '2999-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59941, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TRABAJADOR/A SOCIAL', NULL, NULL, NULL, NULL, NULL),
(1276, 'margherit', 'mariana', 'DNI', 27896228, '27-27896228-3', NULL, NULL, '1980-06-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59942, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TRABAJADOR/A SOCIAL', NULL, NULL, NULL, NULL, NULL),
(1277, 'martinetti', 'paula', 'DNI', 30155853, '27-30155853-3', NULL, NULL, '1985-10-25', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59943, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'PSICOLOGA/O', NULL, NULL, NULL, NULL, NULL),
(1278, 'arone', 'leilen', 'DNI', 34177823, '27-34177823-4', NULL, NULL, '1988-11-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59944, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1279, 'meloni', 'mariela', 'DNI', 33070634, '27-33070634-7', NULL, NULL, '1987-06-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59945, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1280, 'salvatierra', 'elina', 'DNI', 33882775, '27-33882775-5', NULL, NULL, '2999-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59946, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1281, 'ferreyra', 'jimena belen', 'DNI', 37209718, '27-37209718-9', NULL, NULL, '1993-02-25', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59947, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TECNICO/A RADIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1282, 'faranna', 'juliana', 'DNI', 34134269, '23-34134269-4', NULL, NULL, '1988-11-17', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-01', 59948, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'TECNICO/A RADIOLOGO/A', NULL, NULL, NULL, NULL, NULL),
(1283, 'cepeda', 'rodrigo', 'DNI', 26503498, '20-26503498-6', NULL, '', '2999-12-12', 1, 6, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-09-01', 59951, NULL, 2, '', NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, '2018-01-19'),
(1284, 'albanesi', 'micaela', 'DNI', 33654709, '27-33654709-7', NULL, '', '2999-12-12', 5, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-09-01', 59952, NULL, 2, '', NULL, 'REEMPLAZANTE', 'FARMACEUTICO/A', NULL, NULL, NULL, NULL, '2018-01-22'),
(1285, 'silva', 'ailen', 'DNI', 32513611, '27-32513611-7', NULL, NULL, '2999-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 59953, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1286, 'bordato', 'florencia', 'DNI', 31757919, '27-31757919-0', NULL, NULL, '2999-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 59954, NULL, 1, NULL, NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, NULL),
(1287, 'zeballos', 'virginia', 'DNI', 31116428, '27-31116428-2', NULL, '', '2999-12-12', 1, 6, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-09-01', 59955, NULL, 1, '', NULL, 'REEMPLAZANTE', 'MEDICO/A', NULL, NULL, NULL, NULL, '2018-01-19'),
(1288, 'saravalli', 'oscar', 'DNI', 1, NULL, NULL, '', NULL, 1, 2, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, 2, '', NULL, NULL, '', NULL, NULL, NULL, '2017-11-13', '2017-11-13'),
(1289, 'capomassi', 'miguel', 'DNI', 1, NULL, NULL, '', NULL, 1, 1, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, 103809, NULL, 3, '', NULL, NULL, '', NULL, NULL, NULL, '2017-11-15', '2017-11-15'),
(1290, 'lizzi', 'cristian', 'DNI', 1, NULL, NULL, '', NULL, 10, NULL, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, 48611, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, '2017-11-15', '2018-01-21'),
(1291, 'grau', 'liliana', 'DNI', 1, NULL, NULL, '', NULL, 1, 5, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, 111, NULL, 3, '', NULL, NULL, '', NULL, NULL, NULL, '2017-11-17', '2017-11-17'),
(1292, 'balducci', 'maria ines', 'DNI', 1, NULL, NULL, '', NULL, 1, 5, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, 55321, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, '2017-11-17', '2017-11-17'),
(1294, 'marini', 'nora', 'DNI', 1, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, '2017-11-17', '2017-11-17'),
(1295, 'zaja', 'rodolfo', 'DNI', 1, NULL, NULL, '', NULL, 1, 4, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, 2, '', NULL, NULL, '', NULL, NULL, NULL, '2017-11-17', '2017-11-17'),
(1306, 'achilli', 'lisandro carlos', 'DNI', 27055773, NULL, NULL, NULL, '1979-02-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 54204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1328, 'asmores', 'nilda mabel', 'DNI', 13873425, NULL, NULL, NULL, '1960-03-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-10-01', 100769, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1329, 'atienza', 'maria victoria', 'DNI', 23262929, NULL, NULL, NULL, '1973-06-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', 50254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1330, 'attme', 'juan mauel', 'DNI', 25206577, NULL, NULL, NULL, '1976-12-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 50234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1331, 'audano', 'guillermo mario', 'DNI', 10438864, NULL, NULL, NULL, '1952-09-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-02-01', 101714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1332, 'audano', 'guillermo mario', 'DNI', 10438864, NULL, NULL, NULL, '1952-09-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-02-01', 101714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1333, 'audano', 'guillermo mario', 'DNI', 10438864, NULL, NULL, NULL, '1952-09-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-02-01', 101714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1334, 'arroniz', 'juan jose', 'DNI', 16627571, NULL, NULL, NULL, '1963-10-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-01-11', 122939, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1335, 'arroyo', 'fernanda', 'DNI', 25729400, NULL, NULL, NULL, '1977-02-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 51154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1336, 'audisio', 'gisela vanesa', 'DNI', 30074045, NULL, NULL, NULL, '1983-02-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-10-01', 54210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1337, 'avanza', 'marcela cristina', 'DNI', 17773060, NULL, NULL, NULL, '1966-06-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-02-02', 47779, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1338, 'avila', 'pablo ariel', 'DNI', 26480497, NULL, NULL, NULL, '1978-03-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-12-01', 55522, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1339, 'babini', 'noelia ana', 'DNI', 29524939, NULL, NULL, NULL, '1982-10-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-11-01', 54163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1340, 'bacelli', 'natalia ximena', 'DNI', 29684952, NULL, NULL, NULL, '1982-07-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-11-01', 54568, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1341, 'abecasis', 'lucia', 'DNI', 28157363, NULL, NULL, NULL, '1980-03-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-01', 53977, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1342, 'acardi', 'hugo horacio', 'DNI', 31101973, NULL, NULL, NULL, '1985-01-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-30', 54715, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1343, 'acebal', 'stella maris clotilde', 'DNI', 13553505, NULL, NULL, NULL, '1957-04-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1984-08-21', 102216, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1344, 'acosta', 'juan miguel', 'DNI', 13255890, NULL, NULL, NULL, '1957-10-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-10-28', 100508, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1345, 'actis', 'melina lucia', 'DNI', 32657212, NULL, NULL, NULL, '1987-01-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-11-01', 54772, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1346, 'adan', 'maria alejandra', 'DNI', 17444168, NULL, NULL, NULL, '1965-01-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-08-01', 40113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1347, 'aguilar', 'lucia belen', 'DNI', 33135435, NULL, NULL, NULL, '1987-07-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-14', 54978, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1348, 'airasca', 'fernando luis', 'DNI', 22072339, NULL, NULL, NULL, '1971-07-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 50702, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1349, 'alarcon', 'loizaga maria celeste', 'DNI', 26577375, NULL, NULL, NULL, '1978-07-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 53713, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1350, 'alberdi', 'ana maria', 'DNI', 10061025, NULL, NULL, NULL, '1952-01-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1994-09-01', 48357, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1351, 'alberdi', 'julieta maria', 'DNI', 32166006, NULL, NULL, NULL, '1986-01-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-01', 57067, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1352, 'albornoz', 'victor hugo', 'DNI', 24063849, NULL, NULL, NULL, '1975-02-05', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56551, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1353, 'alesso', 'diana de lourdes', 'DNI', 16424424, NULL, NULL, NULL, '1964-02-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-06-21', 41154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1354, 'alfonso', 'patricia andrea', 'DNI', 12694484, NULL, NULL, NULL, '1958-10-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-03-01', 49136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1355, 'alfonso', 'silvina mercedes', 'DNI', 23978350, NULL, NULL, NULL, '1974-08-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 53519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1356, 'all', 'maria fernanda', 'DNI', 25262801, NULL, NULL, NULL, '1976-06-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 52636, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1357, 'allassia', 'sonia liliam', 'DNI', 17989911, NULL, NULL, NULL, '1966-08-14', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-07-01', 50681, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1358, 'allo', 'maria noel', 'DNI', 26956436, NULL, NULL, NULL, '1978-10-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-06-01', 53471, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1359, 'alonso', 'hilda daniela', 'DNI', 20643283, NULL, NULL, NULL, '1969-02-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-12-04', 46785, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1360, 'alonso', 'rodrigo', 'DNI', 24239218, NULL, NULL, NULL, '1974-12-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-11-01', 55397, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1361, 'alvarez', 'ariel silvio', 'DNI', 22771947, NULL, NULL, NULL, '1972-08-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-05-01', 53476, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1362, 'alvarez', 'ghergo paula', 'DNI', 25942548, NULL, NULL, NULL, '1977-07-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1363, 'alvarez', 'sandra laura', 'DNI', 14494001, NULL, NULL, NULL, '1961-04-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-07-23', 119816, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1364, 'alvarez', 'vilma roxana', 'DNI', 13169812, NULL, NULL, NULL, '1957-09-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-01-01', 102544, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1365, 'ambrogio', 'adriana alejandra', 'DNI', 16994797, NULL, NULL, NULL, '1964-11-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 49339, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1366, 'amelong', 'valeria', 'DNI', 24586190, NULL, NULL, '', '1975-07-01', 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-08-01', 53069, NULL, 2, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-12-13'),
(1367, 'amigo', 'gimena', 'DNI', 32962777, NULL, NULL, NULL, '1987-06-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-01', 57644, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1368, 'amigot', 'susana lucrecia', 'DNI', 13544190, NULL, NULL, NULL, '1959-06-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-03-17', 121968, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1369, 'andreatta', 'maricel adriana', 'DNI', 23189500, NULL, NULL, NULL, '1973-06-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 53183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1370, 'andreu', 'veronica laura', 'DNI', 25588880, NULL, NULL, NULL, '1977-03-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52637, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1371, 'angaroni', 'lucas gabriel', 'DNI', 29923640, NULL, NULL, NULL, '1982-12-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-01', 515835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1372, 'aquino', 'federico reinaldo', 'DNI', 25007118, NULL, NULL, NULL, '1976-01-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 59923, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1373, 'aranguren', 'leticia mariana', 'DNI', 31741651, NULL, NULL, NULL, '1985-06-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 54713, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1374, 'arciero', 'graciela alicia', 'DNI', 17914636, NULL, NULL, NULL, '1966-07-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-02-09', 48544, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1375, 'ares', 'maria eugenia', 'DNI', 17818839, NULL, NULL, NULL, '1966-04-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44788, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1376, 'armando', 'maria fernanda', 'DNI', 25217263, NULL, NULL, NULL, '1976-12-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-09-01', 55003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1377, 'aronson', 'alicia judit', 'DNI', 14287342, NULL, NULL, NULL, '1960-11-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-10-13', 17558, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1378, 'arrighi', 'ayelen', 'DNI', 31758014, NULL, NULL, NULL, '1985-08-21', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-12-17', 57259, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1379, 'badano', 'andrea raquel', 'DNI', 12720291, NULL, NULL, NULL, '1958-08-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-11-01', 41997, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1380, 'bagdzius', 'cecilia andrea', 'DNI', 17849183, NULL, NULL, NULL, '1966-06-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52385, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1381, 'balbi', 'lilian andrea', 'DNI', 23242639, NULL, NULL, NULL, '1973-05-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-05-01', 51576, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1382, 'balbiani', 'mariela', 'DNI', 22684135, NULL, NULL, NULL, '1972-02-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-01-01', 44834, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1383, 'baldelli', 'sergio nicolas', 'DNI', 29341877, NULL, NULL, NULL, '1982-07-30', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-10-01', 56392, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1384, 'baldessari', 'zulema beatriz', 'DNI', 14994760, NULL, NULL, NULL, '1962-09-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-06-01', 104672, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1385, 'baldoma', 'melisa', 'DNI', 32606226, NULL, NULL, NULL, '1986-12-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54797, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1386, 'ballerini', 'viviana alicia', 'DNI', 12720808, NULL, NULL, NULL, '1959-01-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-01-01', 102894, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1387, 'baraldi', 'martin vicente', 'DNI', 12112595, NULL, NULL, NULL, '1956-03-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1982-06-02', 101715, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1388, 'baravalle', 'vanesa alicia', 'DNI', 30099612, NULL, NULL, NULL, '1983-07-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-01', 56314, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1389, 'barbaccia', 'daniel pablo', 'DNI', 17079855, NULL, NULL, NULL, '1965-09-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 45542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1390, 'barbero', 'daniela silveria', 'DNI', 28398564, NULL, NULL, NULL, '1980-08-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-01', 54544, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1391, 'barbero', 'jaquelina elizabeth', 'DNI', 20382302, NULL, NULL, NULL, '1968-08-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-06-01', 48052, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1392, 'bargiacchi', 'estefania maria ine', 'DNI', 30254288, NULL, NULL, NULL, '1983-07-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-01', 54521, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1393, 'baroni', 'mario', 'DNI', 11111188, NULL, NULL, NULL, '1954-12-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1984-01-01', 103743, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1394, 'barrios', 'edgardo cristian', 'DNI', 23030973, NULL, NULL, NULL, '1973-04-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 53976, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1395, 'bartolomeo', 'mirta liliana', 'DNI', 13077150, NULL, NULL, NULL, '1959-04-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-06-21', 42029, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1396, 'basa', 'exequiel alfredo', 'DNI', 27607373, NULL, NULL, NULL, '1980-01-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-07-01', 52275, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1397, 'basualdo', 'alberto abel', 'DNI', 17637906, NULL, NULL, NULL, '1966-03-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-10-01', 49659, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1398, 'bautista', 'carola noemí', 'DNI', 26375697, NULL, NULL, NULL, '1978-01-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-07-01', 55008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1399, 'beccacece', 'stella maris l', 'DNI', 6434633, NULL, NULL, NULL, '1951-01-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1976-01-01', 102936, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1400, 'becker', 'maria laura', 'DNI', 30074161, NULL, NULL, NULL, '1983-03-09', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-15', 57573, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1401, 'belizan', 'jose miguel', 'DNI', 24779066, NULL, NULL, NULL, '1975-09-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-12-01', 53661, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1402, 'bella', 'maria gabriela', 'DNI', 16761645, NULL, NULL, NULL, '1964-11-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-08-01', 41173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1403, 'belmonte', 'elisabet ana', 'DNI', 12037124, NULL, NULL, NULL, '1956-04-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-12-01', 107916, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1404, 'belotti', 'olga beatriz', 'DNI', 26074013, NULL, NULL, NULL, '1977-10-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-12-01', 55052, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1405, 'benedetto', 'alejandro', 'DNI', 23061870, NULL, NULL, NULL, '1973-06-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-01', 54255, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1406, 'benegas', 'liliana beatriz', 'DNI', 12700695, NULL, NULL, NULL, '1957-02-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-12-15', 107928, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1407, 'benetti', 'maría silvina', 'DNI', 18308463, NULL, NULL, NULL, '1967-09-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 54300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1408, 'benitez', 'graciela', 'DNI', 13588835, NULL, NULL, NULL, '1959-11-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-05-23', 41198, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1409, 'bentos', 'natalia soledad', 'DNI', 26845948, NULL, NULL, NULL, '1978-11-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-01', 54701, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1410, 'berardo', 'gloria elena', 'DNI', 18310247, NULL, NULL, NULL, '1967-09-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-12-30', 120534, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1411, 'bergamasco', 'valeria', 'DNI', 22175358, NULL, NULL, NULL, '1971-07-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-03-22', 24957, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1412, 'bergelin', 'edit maria', 'DNI', 12736417, NULL, NULL, NULL, '1958-10-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1978-09-18', 102032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1413, 'bergia', 'silvia isabel', 'DNI', 14217824, NULL, NULL, NULL, '1960-11-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-04-01', 51513, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1414, 'bernachea', 'natalia', 'DNI', 27124878, NULL, NULL, NULL, '1979-05-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54840, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1415, 'berrone', 'florencia', 'DNI', 26538993, NULL, NULL, NULL, '1978-04-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-06-01', 54135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1416, 'bertone', 'virginia ines', 'DNI', 31527180, NULL, NULL, NULL, '1985-04-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-01', 54736, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1417, 'bertorello', 'carina andrea', 'DNI', 22642996, NULL, NULL, NULL, '1972-09-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52391, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1418, 'bianchi', 'alberto mariano', 'DNI', 23645082, NULL, NULL, NULL, '1973-11-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-06-01', 53537, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1419, 'bianchi', 'enrique alfredo', 'DNI', 18460427, NULL, NULL, NULL, '1967-06-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-08-01', 54550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1420, 'bindotti', 'gabriela andrea', 'DNI', 27643490, NULL, NULL, NULL, '1979-08-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-10-01', 55331, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1421, 'biondo', 'leandro nicolás', 'DNI', 25079126, NULL, NULL, '', '1975-12-11', 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2012-12-01', 45626, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-12-13'),
(1422, 'bisio', 'maria fernanda', 'DNI', 14365845, NULL, NULL, NULL, '1961-03-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-03-01', 51091, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1423, 'blanco', 'adriana andrea', 'DNI', 17896974, NULL, NULL, NULL, '1967-07-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-01', 41183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1424, 'blanco', 'rivero maria claudia', 'DNI', 20742069, NULL, NULL, NULL, '1969-04-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 54489, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1425, 'blanco', 'roberto guillermo', 'DNI', 8284191, NULL, NULL, NULL, '1950-03-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1973-01-01', 1551, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1426, 'blanco', 'veronica silvana', 'DNI', 23905979, NULL, NULL, NULL, '1974-12-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-10-01', 52902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1427, 'blanco', 'virginia ines', 'DNI', 30548048, NULL, NULL, NULL, '1983-09-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-01-01', 54196, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1428, 'bletler', 'caren natalia', 'DNI', 33625523, NULL, NULL, NULL, '1989-01-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-01', 54791, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1429, 'blus', 'dario gustavo', 'DNI', 16738973, NULL, NULL, NULL, '1964-05-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1430, 'bogue', 'cristina raquel', 'DNI', 11950280, NULL, NULL, NULL, '1958-02-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-12-01', 103749, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1431, 'bolis', 'cecilia maria', 'DNI', 17819212, NULL, NULL, NULL, '1966-04-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-01', 59921, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1432, 'bonaldi', 'carina elisabet', 'DNI', 22095423, NULL, NULL, NULL, '1971-05-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-06-01', 43655, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1433, 'bongiovanni', 'gonzalo osvaldo', 'DNI', 30560770, NULL, NULL, NULL, '1984-01-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-03-01', 55538, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1434, 'bonifacio', 'diana ruth', 'DNI', 14758195, NULL, NULL, NULL, '1962-05-26', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-14', 51799, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1435, 'bonino', 'lidia del valle', 'DNI', 13788379, NULL, NULL, NULL, '1960-03-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44706, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1436, 'borao', 'jorgelina viviana', 'DNI', 26700515, NULL, NULL, NULL, '1978-11-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-01', 55336, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1437, 'borda', 'nelba monica hebe', 'DNI', 25274063, NULL, NULL, NULL, '1976-05-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-12-01', 53925, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1438, 'borgo', 'monica patricia', 'DNI', 17079602, NULL, NULL, NULL, '1965-04-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-04-01', 51137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1439, 'borras', 'betina belen', 'DNI', 23938833, NULL, NULL, NULL, '1974-07-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-04-01', 53167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1440, 'bott', 'mariela beatriz', 'DNI', 20141876, NULL, NULL, NULL, '1968-01-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-12-14', 47180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1441, 'botta', 'carina andrea', 'DNI', 20812156, NULL, NULL, NULL, '1969-03-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-18', 44039, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1442, 'botta', 'lorena veronica', 'DNI', 25275631, NULL, NULL, NULL, '1976-06-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-03-01', 52038, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1443, 'botta', 'maria paula', 'DNI', 32780194, NULL, NULL, NULL, '1987-04-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 57070, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1444, 'bottoli', 'maria soledad', 'DNI', 24586952, NULL, NULL, NULL, '1975-12-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56415, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1445, 'braccia', 'valentina', 'DNI', 32908168, NULL, NULL, NULL, '1987-02-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-09-01', 57053, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1446, 'braida', 'noelia natalia', 'DNI', 32968912, NULL, NULL, NULL, '1987-05-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-01', 54792, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1447, 'brandolisio', 'maria eugenia', 'DNI', 29311900, NULL, NULL, NULL, '1982-06-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-01', 54734, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1448, 'brasca', 'gabriela beatriz', 'DNI', 23071127, NULL, NULL, NULL, '1972-12-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51740, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1449, 'brasesco', 'hugo fabian', 'DNI', 22205594, NULL, NULL, NULL, '1971-06-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-07-01', 47681, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1450, 'brebbia', 'cecilia', 'DNI', 26986399, NULL, NULL, NULL, '1978-12-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-08-01', 52394, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1451, 'breppe', 'diana cristina', 'DNI', 17756448, NULL, NULL, NULL, '1966-10-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-10-03', 8988, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1452, 'brissio', 'paola silvia', 'DNI', 29818371, NULL, NULL, NULL, '1982-11-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-01', 54408, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1453, 'brunis', 'arturo luis', 'DNI', 17184244, NULL, NULL, NULL, '1964-11-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-10-01', 108709, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1454, 'bruno', 'sergio leonardo', 'DNI', 16435315, NULL, NULL, NULL, '1963-07-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 108788, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1455, 'brunori', 'ghina rosanna', 'DNI', 20119724, NULL, NULL, NULL, '1968-02-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 43537, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1456, 'brutinel', 'sabrina luz', 'DNI', 31274137, NULL, NULL, NULL, '1984-09-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-03-01', 58515, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1457, 'brutinel', 'soledad', 'DNI', 29923917, NULL, NULL, NULL, '1982-10-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-30', 54140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1458, 'bug', 'wanda paula', 'DNI', 27134139, NULL, NULL, NULL, '1979-03-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-01', 54781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1459, 'buiras', 'viviana maria zulema', 'DNI', 17788350, NULL, NULL, NULL, '1966-11-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-01', 53657, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1460, 'bulleri', 'julian andres', 'DNI', 28650750, NULL, NULL, NULL, '1981-12-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-11-01', 53653, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1461, 'caballini', 'pablo ariel', 'DNI', 26543334, NULL, NULL, NULL, '1978-04-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-09-01', 54556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1462, 'cabeza', 'ivana florencia', 'DNI', 28146520, NULL, NULL, '', '1980-06-15', 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-08-01', 59301, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-12-13'),
(1463, 'cabezas', 'riegelhaupt ana luz', 'DNI', 27006191, NULL, NULL, NULL, '1978-12-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-09-01', 55367, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1464, 'cabrini', 'ana silvia', 'DNI', 16515486, NULL, NULL, NULL, '1963-10-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-03-06', 103902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1465, 'caccia', 'aquiles anibal', 'DNI', 14131174, NULL, NULL, NULL, '1960-09-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1994-09-01', 46616, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1466, 'cadoj', 'andrea rosana', 'DNI', 17460669, NULL, NULL, NULL, '1965-08-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-06-21', 47097, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1467, 'calatayud', 'silvia andrea', 'DNI', 17712231, NULL, NULL, NULL, '1966-06-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-27', 41251, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1468, 'callejon', 'miriam del carmen', 'DNI', 20507977, NULL, NULL, NULL, '1969-09-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 44727, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1469, 'cambero', 'gabriela nanci', 'DNI', 29415744, NULL, NULL, NULL, '1982-02-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 57663, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1470, 'cambiaso', 'pablo gustavo', 'DNI', 20394414, NULL, NULL, NULL, '1968-08-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51761, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1471, 'cambursano', 'pablo omar', 'DNI', 14206728, NULL, NULL, NULL, '1960-11-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-07-01', 44990, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1472, 'campos', 'jorgelina isabel', 'DNI', 13923149, NULL, NULL, NULL, '1957-10-29', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-03-01', 55796, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1473, 'canastrelli', 'pablo', 'DNI', 27148127, NULL, NULL, NULL, '1979-03-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-03-01', 54708, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1474, 'canaves', 'martin alejandro', 'DNI', 23586309, NULL, NULL, NULL, '1973-11-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-03-01', 54707, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1475, 'canepa', 'andrea veronica', 'DNI', 24784169, NULL, NULL, NULL, '1975-09-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 50210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1476, 'cano', 'maria victoria', 'DNI', 23317775, NULL, NULL, NULL, '1973-09-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 817088, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1477, 'canuto', 'natalia soledad', 'DNI', 26835628, NULL, NULL, NULL, '1978-11-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-10-01', 55482, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1478, 'cañellas', 'maria silvina', 'DNI', 21421540, NULL, NULL, NULL, '1970-08-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 53518, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1479, 'caplan', 'patricia judit', 'DNI', 16985228, NULL, NULL, NULL, '1964-06-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-11-01', 43540, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1480, 'cappa', 'gustavo alejandro', 'DNI', 26020045, NULL, NULL, NULL, '1977-11-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 45886, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1481, 'cappelletti', 'barbero carina and', 'DNI', 23495381, NULL, NULL, NULL, '1973-09-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51828, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1482, 'capriotti', 'maria alejandra', 'DNI', 25707997, NULL, NULL, NULL, '1977-05-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-08-01', 55028, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1483, 'caravaca', 'miguel alberto', 'DNI', 8418088, NULL, NULL, NULL, '1946-10-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1979-12-18', 100399, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1484, 'cardozo', 'celso hugo', 'DNI', 17079327, NULL, NULL, NULL, '1965-02-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-10-01', 44761, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1485, 'carlevaro', 'rebeca', 'DNI', 25724221, NULL, NULL, NULL, '1977-01-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52402, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1486, 'carlini', 'maria de las nieves', 'DNI', 25979823, NULL, NULL, NULL, '1977-11-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 50988, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1487, 'carparelli', 'silvia elena', 'DNI', 16674366, NULL, NULL, NULL, '1964-02-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 20174, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1488, 'casali', 'liliana isabel', 'DNI', 11827088, NULL, NULL, NULL, '1955-07-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-05-01', 41286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1489, 'casella', 'gustavo daniel', 'DNI', 18264482, NULL, NULL, NULL, '1967-09-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-18', 40764, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1490, 'casim', 'julieta', 'DNI', 28645444, NULL, NULL, NULL, '1981-02-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-11-01', 54124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1491, 'cassis', 'jorge valeriano', 'DNI', 11448337, NULL, NULL, NULL, '1954-10-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 104471, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1492, 'castañeira', 'lara m noel', 'DNI', 25648962, NULL, NULL, NULL, '1977-05-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 53744, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1493, 'castellani', 'nadia teresa', 'DNI', 27890796, NULL, NULL, NULL, '1980-10-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 55669, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1494, 'castiglioni', 'alejandra gabriela', 'DNI', 16861151, NULL, NULL, NULL, '1963-12-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-01-31', 48471, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1495, 'castro', 'pablo', 'DNI', 14803598, NULL, NULL, NULL, '1962-08-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-07-03', 41290, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1496, 'catalan', 'graciela', 'DNI', 23348991, NULL, NULL, NULL, '1974-03-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-01', 54404, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1497, 'catena', 'marianela', 'DNI', 25176628, NULL, NULL, NULL, '1976-09-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-07-01', 44272, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1498, 'cattaneo', 'maximiliano luis', 'DNI', 29348854, NULL, NULL, NULL, '1982-03-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-01', 57324, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1499, 'cavallin', 'juliana beatriz', 'DNI', 28821970, NULL, NULL, NULL, '1981-07-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-06-01', 53494, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1500, 'caviglia', 'maria fernanda', 'DNI', 14729192, NULL, NULL, NULL, '1962-02-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-04', 46856, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1501, 'cejas', 'sandra liliana', 'DNI', 22874873, NULL, NULL, NULL, '1972-08-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52408, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1502, 'celaya', 'maria de los angeles', 'DNI', 18599057, NULL, NULL, NULL, '1967-11-21', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 50917, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1503, 'celentano', 'andres jose', 'DNI', 14228741, NULL, NULL, NULL, '1961-06-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-03-01', 101778, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1504, 'celoria', 'melisa paula', 'DNI', 29112056, NULL, NULL, NULL, '1982-01-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-09', 56291, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1506, 'ceppi', 'maria rosa', 'DNI', 17930273, NULL, NULL, NULL, '1967-02-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44813, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1507, 'chaingam', 'chanthana', 'DNI', 18873749, NULL, NULL, NULL, '1975-08-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 53570, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1508, 'chaperon', 'andrea silvana', 'DNI', 27663929, NULL, NULL, NULL, '2999-12-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 59925, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1509, 'chiani', 'betina', 'DNI', 20218179, NULL, NULL, NULL, '1968-06-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-01-01', 44790, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1510, 'chierichetti', 'maria ines', 'DNI', 17096059, NULL, NULL, NULL, '1965-03-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52645, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1511, 'chimenton', 'vanina', 'DNI', 27385759, NULL, NULL, NULL, '1979-06-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 52795, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1512, 'chinetti', 'hortencia ines', 'DNI', 13488578, NULL, NULL, NULL, '1957-08-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-11-13', 102926, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1513, 'chiodin', 'diana alicia', 'DNI', 25492170, NULL, NULL, NULL, '1976-07-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52646, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1514, 'chiora', 'alejandra lourdes', 'DNI', 23084292, NULL, NULL, NULL, '1973-06-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52192, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1515, 'chiossone', 'federico', 'DNI', 12944409, NULL, NULL, '', '1959-02-18', 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2007-08-01', 103813, NULL, 3, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-12-13'),
(1516, 'chufeni', 'cinthia sandra', 'DNI', 21591243, NULL, NULL, NULL, '1971-05-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-06-01', 80118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1517, 'ciaccio', 'romina', 'DNI', 30879560, NULL, NULL, NULL, '1984-05-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 54969, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1518, 'ciancio', 'romina paola', 'DNI', 29000371, NULL, NULL, NULL, '1982-01-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-10-01', 51855, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1519, 'ciglietti', 'mabel rosana', 'DNI', 16812721, NULL, NULL, NULL, '1964-03-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-04-01', 55039, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1520, 'cimarelli', 'luciana rita', 'DNI', 25900258, NULL, NULL, NULL, '1977-08-03', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 817094, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1521, 'ciminari', 'noemi beatriz', 'DNI', 13245311, NULL, NULL, NULL, '1957-06-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 48415, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1522, 'ciraolo', 'nancy mabel', 'DNI', 26073020, NULL, NULL, NULL, '1977-07-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 53534, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1523, 'clarich', 'ileana fernanda lujan', 'DNI', 25394124, NULL, NULL, NULL, '1976-09-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 54769, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1524, 'coccaro', 'silvia adriana', 'DNI', 29851613, NULL, NULL, NULL, '1983-01-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-03-01', 53926, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1525, 'cocconi', 'paola', 'DNI', 23848381, NULL, NULL, NULL, '1974-04-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-10-01', 44242, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1526, 'coccoz', 'desiree', 'DNI', 31484704, NULL, NULL, NULL, '1985-05-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-01', 54490, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1527, 'codutti', 'victoria soledad', 'DNI', 33452537, NULL, NULL, NULL, '1988-04-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-11-01', 54555, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1528, 'cohen', 'nora viviana', 'DNI', 20167305, NULL, NULL, NULL, '1968-01-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44886, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1529, 'colao', 'maria laura jorgelina', 'DNI', 26538527, NULL, NULL, NULL, '1978-04-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 53694, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1530, 'coletta', 'carla judith', 'DNI', 30045648, NULL, NULL, NULL, '1985-05-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-01', 54522, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1531, 'coletto', 'maria laura', 'DNI', 28520327, NULL, NULL, NULL, '1981-04-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52574, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1532, 'coll', 'armando andres', 'DNI', 6054538, NULL, NULL, NULL, '1944-03-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-01-01', 104506, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1533, 'collura', 'maria luisa', 'DNI', 23790855, NULL, NULL, NULL, '1974-04-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 43570, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1534, 'coloccini', 'natalia susana', 'DNI', 23317498, NULL, NULL, NULL, '1973-07-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-04-01', 53306, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1535, 'colusso', 'carlos gabriel', 'DNI', 23061582, NULL, NULL, NULL, '1973-03-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44937, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1536, 'comba', 'humberto leonardo', 'DNI', 11767243, NULL, NULL, NULL, '1955-10-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-01-01', 103269, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1537, 'comin', 'betina viviana', 'DNI', 18472603, NULL, NULL, NULL, '1967-10-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-05-23', 41089, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1538, 'conde', 'alejandro sebastian', 'DNI', 26188320, NULL, NULL, NULL, '1977-11-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 57521, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1539, 'conforti', 'carina beatriz', 'DNI', 20590830, NULL, NULL, NULL, '1969-02-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51663, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1540, 'copponi', 'armando rogelio', 'DNI', 20948121, NULL, NULL, NULL, '1969-08-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-07-01', 500143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1541, 'corallo', 'lucrecia maria', 'DNI', 12725621, NULL, NULL, NULL, '1958-08-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-01-01', 41283, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1542, 'corneli', 'lucia', 'DNI', 26603342, NULL, NULL, NULL, '1978-05-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-07-01', 45966, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1543, 'corral', 'gimena', 'DNI', 30254831, NULL, NULL, NULL, '1983-11-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54327, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1544, 'cortez', 'torres eduardo andres', 'DNI', 29960767, NULL, NULL, NULL, '1983-01-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-03-01', 54535, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1545, 'costa', 'ana flavia', 'DNI', 20778637, NULL, NULL, NULL, '1969-11-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 55029, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1546, 'costa', 'andrea fernanda', 'DNI', 27462245, NULL, NULL, NULL, '1979-08-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-04-01', 55212, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1547, 'cravero', 'marina raquel', 'DNI', 24026556, NULL, NULL, NULL, '1974-07-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-30', 54338, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1548, 'crisci', 'maria soledad', 'DNI', 26073079, NULL, NULL, NULL, '1977-07-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52842, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1549, 'cristofaro', 'stella maris', 'DNI', 21972294, NULL, NULL, NULL, '1971-01-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-06-01', 515801, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1550, 'croux', 'gabriela', 'DNI', 14729723, NULL, NULL, NULL, '1962-10-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-01-01', 43722, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1551, 'cuadrado', 'eduardo anibal', 'DNI', 11309515, NULL, NULL, NULL, '1954-12-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-04-01', 52229, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1552, 'cuevas', 'daniela beatriz', 'DNI', 27076752, NULL, NULL, NULL, '1979-01-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1553, 'curzio', 'maria lourdes', 'DNI', 36592906, NULL, NULL, NULL, '1986-03-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-01', 54933, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1554, 'dagata', 'gilda viviana', 'DNI', 24945578, NULL, NULL, NULL, '1976-03-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-11-01', 52919, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1555, 'dalessandro', 'pablo andres', 'DNI', 21563695, NULL, NULL, NULL, '1970-07-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-11-01', 43611, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1556, 'daloisio', 'jose luis', 'DNI', 23961921, NULL, NULL, NULL, '1974-08-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 45493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1557, 'dandrea', 'silvia raquel', 'DNI', 17098783, NULL, NULL, NULL, '1964-12-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44765, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1558, 'dangelo', 'alejandro miguel', 'DNI', 30838388, NULL, NULL, NULL, '1984-07-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-11-01', 55308, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1559, 'dangelo', 'susana beatriz', 'DNI', 14843978, NULL, NULL, NULL, '1962-11-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52357, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1560, 'dercoli', 'adriana maria', 'DNI', 13174854, NULL, NULL, NULL, '1957-07-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-11-01', 100722, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1561, 'dippolito', 'romina laura', 'DNI', 24282482, NULL, NULL, NULL, '1975-03-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-03-01', 45647, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1562, 'dahi', 'daniel omar', 'DNI', 10187232, NULL, NULL, NULL, '1951-12-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-01-01', 102178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1563, 'damiani', 'horacio juan', 'DNI', 12691089, NULL, NULL, NULL, '1957-02-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-12-07', 103313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1564, 'danielli', 'debora maria', 'DNI', 23190139, NULL, NULL, NULL, '1973-03-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51762, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1565, 'daram', 'marcela judith', 'DNI', 18146058, NULL, NULL, NULL, '1966-05-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-12-30', 40250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1566, 'dascani', 'natalia andrea', 'DNI', 23585276, NULL, NULL, NULL, '1974-02-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1567, 'dascanio', 'lorena eliana', 'DNI', 25007899, NULL, NULL, NULL, '1976-05-10', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52784, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1568, 'daveau', 'fabiana guadalupe', 'DNI', 21821405, NULL, NULL, NULL, '1970-12-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 45992, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1569, 'de', 'candia lucas fernando', 'DNI', 30851648, NULL, NULL, NULL, '1984-11-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-01', 54161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1570, 'de', 'francesco irene', 'DNI', 31609952, NULL, NULL, NULL, '1985-05-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-01', 55304, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1571, 'de', 'la felice anabel claudia', 'DNI', 22194966, NULL, NULL, NULL, '1971-08-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 57518, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1572, 'de', 'la fuente monica mariela', 'DNI', 26884338, NULL, NULL, NULL, '1978-09-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 53520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1573, 'de', 'la riva marisol vanina', 'DNI', 23399304, NULL, NULL, NULL, '1973-09-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 51703, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1574, 'de', 'lorenzi paola susana', 'DNI', 26833610, NULL, NULL, NULL, '1978-08-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52647, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1575, 'de', 'luise clara maria', 'DNI', 23317953, NULL, NULL, NULL, '1973-10-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-03-01', 54080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1576, 'de', 'rosa guillermina ines', 'DNI', 28978479, NULL, NULL, NULL, '1981-11-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-09-01', 56341, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1577, 'de', 'rossi maria laura', 'DNI', 31116332, NULL, NULL, NULL, '1984-11-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-08-01', 55007, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1578, 'dean', 'gabriela eliana', 'DNI', 26739616, NULL, NULL, NULL, '1978-07-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 51496, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1579, 'decima', 'maria elida', 'DNI', 11446377, NULL, NULL, NULL, '1954-07-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-30', 50982, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1580, 'del', 'blanco gustavo simon', 'DNI', 17740683, NULL, NULL, NULL, '1966-11-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-08-01', 55365, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1581, 'del', 'cerro silvia liliana', 'DNI', 20399189, NULL, NULL, NULL, '1968-10-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-11-01', 48808, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1582, 'del', 'grego gonzalo nicolas', 'DNI', 28837470, NULL, NULL, NULL, '1982-02-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-06', 54692, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1583, 'del', 'pazo carolina', 'DNI', 28059094, NULL, NULL, NULL, '1980-07-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51737, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1584, 'delfabro', 'marcela', 'DNI', 14373243, NULL, NULL, NULL, '1961-06-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-01', 41305, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1585, 'delizia', 'maria virginia', 'DNI', 33485417, NULL, NULL, NULL, '1988-03-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 58911, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1586, 'dellaia', 'enzo daniel', 'DNI', 17132407, NULL, NULL, NULL, '1964-05-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-12-01', 53169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1587, 'delle', 'vedove maria belen', 'DNI', 32268387, NULL, NULL, NULL, '1986-05-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 58912, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1588, 'dellisanti', 'vanina esilda', 'DNI', 27935450, NULL, NULL, NULL, '1980-02-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-01-01', 58336, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1589, 'destefanis', 'juan pablo', 'DNI', 24779441, NULL, NULL, NULL, '1975-07-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-10-01', 55068, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1590, 'di', 'capua mabel liliana', 'DNI', 10866547, NULL, NULL, NULL, '1953-11-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-04-01', 100177, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1591, 'di', 'cosco adriana aurora maria', 'DNI', 20536003, NULL, NULL, NULL, '1968-10-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1592, 'di', 'falco german hector', 'DNI', 25959515, NULL, NULL, NULL, '2999-12-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 57968, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1593, 'di', 'liscia maria laura', 'DNI', 12194444, NULL, NULL, NULL, '1958-05-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-06-23', 120231, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1594, 'di', 'marco carina viviana', 'DNI', 22296266, NULL, NULL, NULL, '1971-08-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-06-01', 43173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1595, 'di mauro', 'mariano', 'DNI', 24945794, NULL, NULL, '', '1976-04-20', 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2012-09-17', 52279, NULL, 2, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-12-13'),
(1596, 'di', 'napoli sandra marcela', 'DNI', 14618451, NULL, NULL, NULL, '1961-12-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-11-01', 118953, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1597, 'diaz', 'andrea miriam', 'DNI', 20173945, NULL, NULL, NULL, '1968-05-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-10-26', 46808, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1598, 'diaz', 'anibal gerardo', 'DNI', 22300939, NULL, NULL, NULL, '1972-02-09', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44766, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1599, 'diaz', 'cristian rafael', 'DNI', 31851816, NULL, NULL, NULL, '1985-11-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-09-01', 54558, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1600, 'diaz', 'graciela alba', 'DNI', 5784159, NULL, NULL, NULL, '1948-03-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-07-22', 103386, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1601, 'diaz', 'maria jose', 'DNI', 24411987, NULL, NULL, NULL, '1975-06-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 53536, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1602, 'diaz', 'maria susana', 'DNI', 20853559, NULL, NULL, NULL, '1969-05-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-08-01', 48693, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1603, 'diaz', 'susana beatriz', 'DNI', 14938314, NULL, NULL, NULL, '1962-08-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-04-15', 55210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1604, 'diaz', 'veronica andrea', 'DNI', 24239292, NULL, NULL, NULL, '1974-12-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-09-01', 53556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1605, 'diaz', 'virginia', 'DNI', 28199383, NULL, NULL, NULL, '1980-06-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 52278, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1606, 'dip', 'gustavo ariel', 'DNI', 18113286, NULL, NULL, NULL, '1966-11-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-04-01', 40051, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1607, 'dip', 'silvina veronica', 'DNI', 26066185, NULL, NULL, NULL, '1977-09-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1608, 'diruscio', 'valeriana alejandra', 'DNI', 28808962, NULL, NULL, NULL, '1981-05-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', 54513, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1609, 'doino', 'federico', 'DNI', 28771165, NULL, NULL, NULL, '1981-02-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 55638, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1610, 'dolza', 'maria lucia', 'DNI', 32131269, NULL, NULL, NULL, '1988-02-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-01', 54414, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1611, 'donadio', 'carina natalia', 'DNI', 22435772, NULL, NULL, NULL, '1971-12-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-06-01', 49242, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1612, 'donati', 'sonia mariela', 'DNI', 24861187, NULL, NULL, NULL, '1976-04-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1613, 'drisun', 'graciela rebeca', 'DNI', 6730244, NULL, NULL, NULL, '1951-06-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-12-06', 40053, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1614, 'drivet', 'cecilia', 'DNI', 30101292, NULL, NULL, NULL, '1984-04-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 54156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1615, 'druetta', 'natalia magdalena', 'DNI', 27620709, NULL, NULL, NULL, '1979-11-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52834, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1616, 'duarte', 'sequino rita carolina', 'DNI', 27084966, NULL, NULL, NULL, '1979-02-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-01', 515834, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1617, 'dubois', 'nelida monica', 'DNI', 12113500, NULL, NULL, NULL, '1958-04-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-11-01', 104904, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1618, 'dufour', 'jessica', 'DNI', 30528510, NULL, NULL, NULL, '1983-12-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-06-01', 54337, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1619, 'duks', 'natacha maria del valle', 'DNI', 21884583, NULL, NULL, NULL, '1971-04-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-09-01', 515806, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1620, 'dura', 'erika analia', 'DNI', 25505562, NULL, NULL, NULL, '1977-05-17', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52649, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1621, 'dutto', 'veronica lucia', 'DNI', 23811694, NULL, NULL, NULL, '1974-04-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-05-01', 53418, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1622, 'eggimann', 'ana maría', 'DNI', 16249739, NULL, NULL, NULL, '1963-10-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-12-01', 54299, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1623, 'elia', 'analia griselda', 'DNI', 25204914, NULL, NULL, NULL, '1976-10-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 50703, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1624, 'elias', 'hector daniel', 'DNI', 18242761, NULL, NULL, NULL, '1966-09-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-18', 40777, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1625, 'elizaga', 'carlos gabriel', 'DNI', 30155343, NULL, NULL, NULL, '1983-06-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-11-01', 54211, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1626, 'elizalde', 'alejandra ma.cristina', 'DNI', 17213301, NULL, NULL, NULL, '1965-08-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-07-02', 49195, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1627, 'encalada', 'damian ezequiel', 'DNI', 28536228, NULL, NULL, NULL, '1981-02-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-01', 56312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1628, 'ermini', 'rosalia maria', 'DNI', 27516497, NULL, NULL, NULL, '1980-05-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 55670, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1629, 'ernst', 'adriana', 'DNI', 16881027, NULL, NULL, NULL, '1964-05-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-08-15', 19341, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1630, 'espadas', 'melisa', 'DNI', 28146793, NULL, NULL, NULL, '1980-07-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-09-01', 56315, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1631, 'esposti', 'maria angela', 'DNI', 11793506, NULL, NULL, NULL, '1955-10-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-05-01', 103382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1632, 'esrequis', 'esmeralda', 'DNI', 23282719, NULL, NULL, NULL, '1973-05-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52650, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1633, 'esterlizzi', 'richard luis', 'DNI', 18125872, NULL, NULL, NULL, '1967-10-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-09-08', 41325, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1634, 'esteve', 'maria cecilia', 'DNI', 21722283, NULL, NULL, NULL, '1970-06-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52832, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1635, 'etchart', 'paula maria', 'DNI', 29722551, NULL, NULL, NULL, '1982-12-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56554, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1636, 'eusebi', 'claudia paula', 'DNI', 18365946, NULL, NULL, NULL, '1967-05-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-03-01', 51092, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1637, 'exposito', 'mauricio lucas', 'DNI', 14392353, NULL, NULL, NULL, '1961-10-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-26', 46965, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1638, 'fadil', 'iturralde jose luis', 'DNI', 20459809, NULL, NULL, NULL, '1968-09-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 57105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1639, 'fages', 'matilde guadalupe', 'DNI', 30792047, NULL, NULL, NULL, '1984-05-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 57073, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1640, 'faggi', 'maria teresa', 'DNI', 25707661, NULL, NULL, NULL, '1969-06-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-10-01', 49309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1641, 'faggiani', 'marina ines', 'DNI', 27882093, NULL, NULL, NULL, '1980-01-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-09-01', 55369, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1642, 'fagioli', 'micaela', 'DNI', 31405758, NULL, NULL, NULL, '1985-05-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-01', 59918, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1643, 'fain', 'humberto esteban ramon', 'DNI', 14094567, NULL, NULL, NULL, '1960-08-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-10-24', 111644, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1644, 'fajardo', 'sandra cristina', 'DNI', 17148797, NULL, NULL, NULL, '1964-05-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-04-27', 19926, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1645, 'falconi', 'silvio daniel', 'DNI', 21690632, NULL, NULL, NULL, '1970-08-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 515785, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1646, 'fanutti', 'maria eugenia', 'DNI', 22592261, NULL, NULL, NULL, '1972-02-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44769, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1647, 'farias', 'gustavo javier', 'DNI', 24574222, NULL, NULL, NULL, '1975-03-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', 54501, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1648, 'farrando', 'daniel alberto', 'DNI', 18093781, NULL, NULL, NULL, '1967-02-26', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-02-01', 47066, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1649, 'farrando', 'malena', 'DNI', 25116317, NULL, NULL, NULL, '1976-04-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 56322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1650, 'favini', 'barbara natacha', 'DNI', 29562344, NULL, NULL, NULL, '1982-07-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-09', 54814, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1651, 'fazi', 'hector constantino', 'DNI', 6030574, NULL, NULL, NULL, '1942-01-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-01-01', 49057, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1652, 'fein', 'monica haydee-cargo ret.', 'DNI', 11547996, NULL, NULL, NULL, '1957-06-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1984-01-01', 107394, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1653, 'fernandez', 'alejandra del valle', 'DNI', 25596451, NULL, NULL, NULL, '1977-04-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-01-01', 58335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1654, 'fernandez', 'maria alejandra', 'DNI', 25171636, NULL, NULL, NULL, '1976-07-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-05-01', 54064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1655, 'fernandez', 'melina perla', 'DNI', 25381078, NULL, NULL, NULL, '1976-06-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1656, 'fernandez', 'silvina laura', 'DNI', 26073418, NULL, NULL, NULL, '1977-09-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-01-01', 44236, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1657, 'ferrara', 'miriam mariel', 'DNI', 20167796, NULL, NULL, NULL, '1968-01-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-07', 27607, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1658, 'ferrari', 'gabriela susana', 'DNI', 18339811, NULL, NULL, NULL, '1967-04-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 51001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1659, 'ferrari', 'natalia rita', 'DNI', 23317836, NULL, NULL, NULL, '1973-09-16', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-01-01', 56041, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1660, 'ferrari', 'olivero andres f', 'DNI', 22054903, NULL, NULL, NULL, '1971-07-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-10-01', 44573, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1661, 'ferraro', 'alberto salvador', 'DNI', 11678205, NULL, NULL, NULL, '1955-04-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1982-07-01', 100835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1662, 'ferrero', 'mariana paula', 'DNI', 25900668, NULL, NULL, NULL, '1977-10-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-01', 52800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1663, 'ferreyra', 'maria de lujan', 'DNI', 30484362, NULL, NULL, NULL, '1983-09-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54937, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1664, 'ferreyra', 'patricia norma', 'DNI', 12519981, NULL, NULL, NULL, '1956-12-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1981-11-12', 102999, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1665, 'figueroa', 'mariana alejandra', 'DNI', 26351955, NULL, NULL, NULL, '1978-03-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-08-01', 54837, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1666, 'figueroa', 'pablo armando', 'DNI', 17891786, NULL, NULL, NULL, '1966-11-22', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-18', 20558, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1667, 'firpo', 'sara viviana', 'DNI', 16418637, NULL, NULL, NULL, '1963-02-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-03-01', 48084, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1668, 'flaherty', 'patricia adriana', 'DNI', 20590398, NULL, NULL, NULL, '1969-07-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-09-01', 50733, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1669, 'flores', 'mariana guadalupe', 'DNI', 18242090, NULL, NULL, NULL, '1966-08-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-12-01', 500131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1670, 'folio', 'miriam graciela', 'DNI', 25101692, NULL, NULL, NULL, '1976-09-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53946, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1671, 'fontana', 'silvana miriam', 'DNI', 14494263, NULL, NULL, NULL, '1961-03-15', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-07-04', 41359, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1672, 'fornes', 'claudia cecilia', 'DNI', 20144268, NULL, NULL, NULL, '1968-02-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 9079, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1673, 'forte', 'ruben vicente', 'DNI', 12700799, NULL, NULL, NULL, '1957-03-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1982-01-01', 103653, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1674, 'forte', 'sofia roberta', 'DNI', 29001833, NULL, NULL, NULL, '1982-02-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 52277, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1675, 'fossaroli', 'gustavo', 'DNI', 14685502, NULL, NULL, NULL, '1962-04-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-09-01', 107439, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1676, 'franco', 'maria victoria', 'DNI', 21528729, NULL, NULL, NULL, '1970-06-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-10-01', 460031, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1677, 'frascaroli', 'maria alejandra', 'DNI', 16633729, NULL, NULL, NULL, '1964-03-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-03-01', 51090, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1678, 'frascoli', 'adriana cristina', 'DNI', 6377216, NULL, NULL, NULL, '1950-05-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-02-01', 41366, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1679, 'frazzetto', 'marcelo adolfo', 'DNI', 16265748, NULL, NULL, NULL, '1962-10-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-02-01', 44732, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1680, 'frigo', 'cintia', 'DNI', 29633148, NULL, NULL, NULL, '1982-11-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 54702, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1681, 'frutos', 'jorge manuel', 'DNI', 18120998, NULL, NULL, NULL, '1967-05-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-03-01', 44770, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1682, 'fuentecilla', 'marina', 'DNI', 28536250, NULL, NULL, NULL, '1981-02-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-09-01', 54745, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1683, 'furlano', 'gustavo alberto', 'DNI', 17669333, NULL, NULL, NULL, '1966-04-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-05-01', 40261, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1684, 'fuster', 'laura marcela', 'DNI', 14392508, NULL, NULL, NULL, '1961-12-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-12-01', 53237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1685, 'gabinetti', 'marcela', 'DNI', 16674369, NULL, NULL, NULL, '1964-01-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-04-01', 42026, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1686, 'galeano', 'amilcar', 'DNI', 29311367, NULL, NULL, NULL, '1982-03-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-01', 55384, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1687, 'galetto', 'jesica', 'DNI', 24527701, NULL, NULL, NULL, '1975-03-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 515819, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1688, 'gallardo', 'liliana matilde', 'DNI', 12522576, NULL, NULL, NULL, '1958-05-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-01-01', 102132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1689, 'galli', 'jonatan mauricio', 'DNI', 27970802, NULL, NULL, NULL, '1980-08-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-08-01', 53505, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1690, 'gallino', 'jorge raul', 'DNI', 13543892, NULL, NULL, NULL, '1957-11-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-11-01', 49637, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1691, 'gamero', 'alejandro jesus', 'DNI', 18438501, NULL, NULL, NULL, '1967-08-04', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-11-01', 43778, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1692, 'garbini', 'marisa lujan', 'DNI', 18011526, NULL, NULL, NULL, '1966-10-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 50788, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1693, 'garcia', 'gabriela cecilia', 'DNI', 21414952, NULL, NULL, NULL, '1970-02-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 48609, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1694, 'garcia', 'gustavo andres', 'DNI', 21958815, NULL, NULL, NULL, '1971-01-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-06-01', 56197, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1695, 'garcia', 'lodi silvia elena', 'DNI', 18583237, NULL, NULL, NULL, '1967-09-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 51693, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1696, 'garcia', 'maria soledad', 'DNI', 27697181, NULL, NULL, NULL, '1979-11-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-08-01', 55370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1697, 'garcia', 'miriam patricia', 'DNI', 14081330, NULL, NULL, NULL, '1960-07-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-11-24', 42063, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1698, 'garcia', 'rinaldi magali alejandr', 'DNI', 27971015, NULL, NULL, NULL, '1980-03-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-08-01', 55021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1699, 'garcia', 'silvina beatriz', 'DNI', 17818954, NULL, NULL, NULL, '1966-03-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-12-01', 50312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1700, 'gareis', 'maria laura', 'DNI', 26332478, NULL, NULL, NULL, '1978-03-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-30', 54917, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1701, 'garo', 'dario raul', 'DNI', 17462386, NULL, NULL, NULL, '1965-07-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-06-01', 40066, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1702, 'gasparini', 'maría cecilia', 'DNI', 32078163, NULL, NULL, NULL, '1986-01-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-01', 57193, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1703, 'gastaldi', 'maria gabriela', 'DNI', 21778112, NULL, NULL, NULL, '1971-01-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 45998, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1704, 'gatti', 'maximiliano dario', 'DNI', 26525259, NULL, NULL, NULL, '1978-07-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-11-01', 56298, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1705, 'gaudio', 'susana beatriz', 'DNI', 23645751, NULL, NULL, NULL, '1974-03-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 57520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1706, 'gauseño', 'sergio luis', 'DNI', 24048072, NULL, NULL, NULL, '1974-11-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-04-01', 54724, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1707, 'genaccio', 'hector raul', 'DNI', 11447041, NULL, NULL, NULL, '1955-02-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-01-01', 100215, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1708, 'genovese', 'alicia nora', 'DNI', 5988879, NULL, NULL, NULL, '1949-04-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-10-01', 44377, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1709, 'gentini', 'elina graciela', 'DNI', 25880116, NULL, NULL, NULL, '1977-07-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52654, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1710, 'gerbaudo', 'hector fabian', 'DNI', 17905289, NULL, NULL, NULL, '1966-07-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-11-01', 49654, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1711, 'gerlero', 'sandra', 'DNI', 16745082, NULL, NULL, NULL, '1963-09-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44733, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1712, 'gervasoni', 'matias ariel', 'DNI', 29348224, NULL, NULL, NULL, '1982-03-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 53818, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1713, 'getar', 'silvina marcela', 'DNI', 17479556, NULL, NULL, NULL, '1965-09-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44806, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1714, 'gianserra', 'carina vanesa', 'DNI', 29402856, NULL, NULL, NULL, '1982-04-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-04-01', 51779, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1715, 'giarda', 'paola beatriz', 'DNI', 23848656, NULL, NULL, NULL, '1974-06-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 43589, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1716, 'giavarini', 'cintia', 'DNI', 24239104, NULL, NULL, NULL, '1974-10-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 515821, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1717, 'gil', 'fauceglia juan manuel', 'DNI', 26501089, NULL, NULL, NULL, '1978-02-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-09', 54720, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1718, 'gil', 'marcelo roberto', 'DNI', 18264363, NULL, NULL, NULL, '1967-04-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-10-01', 8674, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1719, 'gille', 'monica mabel', 'DNI', 11445981, NULL, NULL, NULL, '1954-03-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-02-01', 102607, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1720, 'gimenez', 'adrian ivan', 'DNI', 23645626, NULL, NULL, NULL, '1968-07-02', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 45984, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1721, 'gimenez', 'silvia analia elena', 'DNI', 13174831, NULL, NULL, NULL, '1959-04-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-08-01', 42038, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1722, 'ginex', 'oscar orlando', 'DNI', 13077507, NULL, NULL, NULL, '1957-06-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-08-16', 108220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1723, 'ginghini', 'maria fernanda', 'DNI', 24186098, NULL, NULL, NULL, '1974-10-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52446, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1724, 'giordano', 'anabel mariana', 'DNI', 29634464, NULL, NULL, NULL, '1982-09-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-12-01', 56178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1725, 'gismondi', 'sofia', 'DNI', 25868499, NULL, NULL, NULL, '1977-07-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52697, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1726, 'giunipero', 'gloria del carmen', 'DNI', 12037186, NULL, NULL, NULL, '1958-04-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-03-17', 42539, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1727, 'gnass', 'nestor evaldo', 'DNI', 11107435, NULL, NULL, NULL, '1954-09-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-05-21', 103970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1728, 'godoy', 'pablo javier', 'DNI', 27134425, NULL, NULL, NULL, '1979-05-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1729, 'goldin', 'carlos marcelo antonio', 'DNI', 22510336, NULL, NULL, NULL, '1972-05-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-10-01', 57730, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1730, 'goldin', 'daniela beatriz mabel', 'DNI', 22040408, NULL, NULL, NULL, '1971-02-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-10-01', 57732, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1731, 'gomez', 'carlos roberto', 'DNI', 14631588, NULL, NULL, NULL, '1962-03-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-07-01', 107880, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1732, 'gomez', 'margarita e', 'DNI', 14685545, NULL, NULL, NULL, '1961-12-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-16', 41106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1733, 'gondo', 'anahi luz', 'DNI', 32653790, NULL, NULL, NULL, '1987-02-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54843, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1734, 'gonzalez', 'marcela susana', 'DNI', 16943236, NULL, NULL, NULL, '1964-07-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-16', 42075, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1735, 'gonzalez', 'maria angelina', 'DNI', 18215528, NULL, NULL, NULL, '1967-05-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 47663, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1736, 'gonzalez', 'marina', 'DNI', 30254634, NULL, NULL, NULL, '1983-09-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-04-01', 58009, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1737, 'gonzalez', 'monica mercedes', 'DNI', 13352692, NULL, NULL, NULL, '1959-09-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-05-08', 48608, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1738, 'gonzalez', 'nelda mabel', 'DNI', 20347676, NULL, NULL, NULL, '1968-10-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 44947, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1739, 'gorina', 'alberto ramon', 'DNI', 11872330, NULL, NULL, NULL, '1955-10-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-01-01', 100828, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1740, 'gorosito', 'maria soledad', 'DNI', 29658145, NULL, NULL, NULL, '1982-08-23', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-10-22', 50421, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1741, 'gorosito', 'nora', 'DNI', 14444912, NULL, NULL, NULL, '1961-10-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-08-14', 42057, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1742, 'gradilone', 'maria fernanda', 'DNI', 26547444, NULL, NULL, NULL, '1978-05-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-03-01', 55202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1743, 'gramajo', 'marcela alejandra', 'DNI', 21403078, NULL, NULL, NULL, '1970-04-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-05-01', 54118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1744, 'granados', 'graciela isabel', 'DNI', 17413118, NULL, NULL, NULL, '1965-10-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1745, 'grand', 'ricardo maria', 'DNI', 28257391, NULL, NULL, NULL, '1980-08-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-04-01', 54735, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1746, 'grandi', 'laura beatriz', 'DNI', 12324539, NULL, NULL, NULL, '1958-04-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 42034, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1747, 'grappa', 'liliana alejandra', 'DNI', 14143468, NULL, NULL, NULL, '1961-02-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 50225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1748, 'graziani', 'paula', 'DNI', 28190687, NULL, NULL, NULL, '1980-11-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-09-01', 55043, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1749, 'gribaudo', 'eliana anabel', 'DNI', 27865079, NULL, NULL, NULL, '1980-04-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1750, 'gueli', 'gabriela beatriz', 'DNI', 16812801, NULL, NULL, NULL, '1964-06-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-06-21', 42070, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1751, 'guenzelovich', 'graciela', 'DNI', 16272075, NULL, NULL, NULL, '1963-04-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-03-01', 124788, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1752, 'guerra', 'alfredo nicolas', 'DNI', 27414076, NULL, NULL, NULL, '1979-10-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', 57331, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1753, 'guerrero', 'gladis patricia', 'DNI', 17803195, NULL, NULL, NULL, '1966-08-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-05-08', 48610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1754, 'guerrero', 'soledad amalia', 'DNI', 12804145, NULL, NULL, NULL, '1958-11-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-04-01', 122935, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1755, 'guevara', 'valeria elba', 'DNI', 25588161, NULL, NULL, NULL, '1976-11-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1756, 'hacker', 'elisabet debora', 'DNI', 27320609, NULL, NULL, NULL, '1979-05-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-01', 54518, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1757, 'harman', 'luciano', 'DNI', 23344061, NULL, NULL, NULL, '1973-05-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-08-01', 44162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1758, 'haurie', 'juan pablo', 'DNI', 11272542, NULL, NULL, NULL, '1954-03-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-01-01', 107198, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1759, 'hernandez', 'elba andrea', 'DNI', 17460584, NULL, NULL, NULL, '1965-08-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-11-01', 52893, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1760, 'herrera', 'alejo', 'DNI', 29449628, NULL, NULL, NULL, '1982-07-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 59924, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1761, 'herrera', 'claudio', 'DNI', 14704213, NULL, NULL, NULL, '1962-02-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-07-01', 103169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1762, 'herrera', 'marisol', 'DNI', 27134101, NULL, NULL, NULL, '1979-04-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-12-01', 54132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1763, 'hiraldo', 'celia maria luz', 'DNI', 5716173, NULL, NULL, NULL, '1948-12-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51653, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1764, 'hollidge', 'eleonora paula', 'DNI', 23928435, NULL, NULL, NULL, '1974-07-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52656, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1765, 'hourquescos', 'maria del carmen', 'DNI', 13788960, NULL, NULL, NULL, '1960-03-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-10-05', 42085, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1766, 'ibarra', 'martin', 'DNI', 30875944, NULL, NULL, NULL, '1984-06-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-01', 54525, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1767, 'inchauspe', 'gabriel alejandro', 'DNI', 27425716, NULL, NULL, NULL, '1980-01-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-01', 59303, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1768, 'intile', 'claudia susana', 'DNI', 20218851, NULL, NULL, NULL, '1968-08-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-02-01', 43320, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1769, 'iraolagoitia', 'marina alejandra', 'DNI', 25171851, NULL, NULL, NULL, '1976-07-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52355, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1770, 'isa', 'maximiliano', 'DNI', 30700523, NULL, NULL, NULL, '1983-12-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-05-11', 55655, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1771, 'iuorno', 'claudia patricia', 'DNI', 17773104, NULL, NULL, NULL, '1966-02-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-06-22', 47870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1772, 'ivancich', 'gabriel eduardo', 'DNI', 30256373, NULL, NULL, NULL, '1983-07-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-09', 54139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1773, 'jacquelin', 'estefania', 'DNI', 33370068, NULL, NULL, NULL, '1988-05-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-01', 54500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1774, 'jaras', 'pellegrini maria laura', 'DNI', 25588481, NULL, NULL, NULL, '1977-01-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56327, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1775, 'jotomliansky', 'julia raquel', 'DNI', 6047895, NULL, NULL, NULL, '1949-12-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-07-07', 101539, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1776, 'jourdan', 'christian edsel', 'DNI', 92494168, NULL, NULL, NULL, '1975-10-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-30', 54540, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1777, 'jrapko', 'mario', 'DNI', 21041254, NULL, NULL, NULL, '1969-11-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 44763, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1778, 'juan', 'eliana gisela', 'DNI', 29056609, NULL, NULL, NULL, '1981-10-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-04-01', 55146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1779, 'juan', 'laura celia', 'DNI', 14758497, NULL, NULL, NULL, '1962-02-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-06-11', 515788, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1780, 'juaniz', 'andrea nelida', 'DNI', 17094288, NULL, NULL, NULL, '1964-12-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-11-01', 41112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1781, 'kahan', 'melania', 'DNI', 25648980, NULL, NULL, NULL, '1977-06-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1782, 'karlusich', 'luisina', 'DNI', 30022923, NULL, NULL, NULL, '1983-04-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-11-01', 57058, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1783, 'karra', 'liliana cristina', 'DNI', 13795518, NULL, NULL, NULL, '1960-01-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-04-01', 45036, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1784, 'kozicki', 'graciela lilian', 'DNI', 17139306, NULL, NULL, NULL, '1965-01-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-08-26', 42095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1785, 'kreiman', 'miriam andrea', 'DNI', 21425325, NULL, NULL, NULL, '1970-04-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-08-01', 44275, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1786, 'krohling', 'julian rené', 'DNI', 25008759, NULL, NULL, NULL, '1975-11-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 54552, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1787, 'kurlat', 'rosalia', 'DNI', 29723573, NULL, NULL, NULL, '1982-08-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 54195, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1788, 'kuschel', 'romina', 'DNI', 29769153, NULL, NULL, NULL, '1982-12-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54841, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1789, 'kuz', 'veronica adriana', 'DNI', 24327253, NULL, NULL, NULL, '1974-11-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52471, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1790, 'lepiscopo', 'marcela laura', 'DNI', 26356777, NULL, NULL, NULL, '1978-07-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 54547, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1791, 'la', 'roca carina vanesa', 'DNI', 26078067, NULL, NULL, NULL, '1978-02-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-04-01', 54714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1792, 'labeque', 'maria jose', 'DNI', 31724397, NULL, NULL, NULL, '1985-10-19', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-01', 56624, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1793, 'lacorte', 'santiago', 'DNI', 27059731, NULL, NULL, NULL, '1979-01-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', 54512, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1794, 'lagier', 'marcela silvia', 'DNI', 17807197, NULL, NULL, NULL, '1966-06-16', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-03-01', 24249, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1795, 'lagiu', 'anastasia', 'DNI', 93756477, NULL, NULL, NULL, '1947-12-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-10-01', 1483, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1796, 'lahitte', 'matias alfredo', 'DNI', 29449775, NULL, NULL, NULL, '1982-08-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-01', 54409, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1797, 'lamanuzzi', 'romina', 'DNI', 27462531, NULL, NULL, NULL, '1979-10-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52356, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1798, 'lanfranco', 'federico miguel', 'DNI', 25524146, NULL, NULL, NULL, '1976-09-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 57519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1799, 'larini', 'silvia', 'DNI', 13502005, NULL, NULL, NULL, '1957-07-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-27', 41118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1800, 'larrambebere', 'marcela', 'DNI', 16355923, NULL, NULL, NULL, '1963-01-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-16', 42118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1801, 'larriera', 'yanina gabriela', 'DNI', 24258573, NULL, NULL, NULL, '1975-07-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1802, 'larsen', 'melina jesica', 'DNI', 29047136, NULL, NULL, NULL, '1981-08-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-01-01', 52979, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1803, 'lascano', 'alejandra susana', 'DNI', 21528543, NULL, NULL, NULL, '1970-04-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51719, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1804, 'lastra', 'agustina renee', 'DNI', 30645783, NULL, NULL, NULL, '1983-08-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 53470, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1805, 'lavarello', 'simona', 'DNI', 20011333, NULL, NULL, NULL, '1968-01-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 58187, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1806, 'lazarte', 'gustavo fernando', 'DNI', 23973203, NULL, NULL, NULL, '1974-06-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-09', 54935, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1807, 'ledesma', 'sandra daniela', 'DNI', 18607622, NULL, NULL, NULL, '1967-12-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-12-14', 46889, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1808, 'leguizamon', 'lilia andrea', 'DNI', 21415173, NULL, NULL, NULL, '1970-02-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-07-19', 47662, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1809, 'leidi', 'mariana', 'DNI', 29255114, NULL, NULL, NULL, '1982-02-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-10-01', 55332, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1810, 'leiggener', 'maria alejandra', 'DNI', 16537356, NULL, NULL, NULL, '1963-12-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997-01-15', 49517, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1811, 'leiva', 'sanchez cecilia analia', 'DNI', 30092272, NULL, NULL, NULL, '1983-04-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-01', 54924, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1812, 'lejona', 'sergio', 'DNI', 22095622, NULL, NULL, NULL, '1971-06-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-03-01', 52045, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1813, 'lelli', 'ana clara', 'DNI', 28524366, NULL, NULL, NULL, '1981-01-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52837, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1814, 'lencina', 'myriam beatriz', 'DNI', 11874478, NULL, NULL, NULL, '1955-01-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-07-31', 19653, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1815, 'leone', 'sergio omar', 'DNI', 13488702, NULL, NULL, NULL, '1959-12-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-27', 41114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1816, 'levin', 'sandra elisabet', 'DNI', 18514715, NULL, NULL, NULL, '1967-11-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 50787, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1817, 'levy', 'raquel', 'DNI', 12812185, NULL, NULL, NULL, '1958-10-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 51155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1818, 'lezcano', 'ruben osvaldo', 'DNI', 16064238, NULL, NULL, NULL, '1962-11-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-10-01', 108703, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1819, 'libedinsky', 'fabiana paola', 'DNI', 21512009, NULL, NULL, NULL, '1970-04-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44771, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1820, 'licatta', 'claudia alejandra', 'DNI', 18074735, NULL, NULL, NULL, '1966-09-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-10-03', 47867, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1821, 'liljesthrom', 'karen cristina', 'DNI', 12208122, NULL, NULL, NULL, '1956-03-18', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1981-12-21', 101163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1822, 'lincho', 'maria de los angeles', 'DNI', 21417907, NULL, NULL, NULL, '1970-03-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-10-14', 47166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1823, 'linke', 'silvina andrea', 'DNI', 17462403, NULL, NULL, NULL, '1965-07-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-03-17', 19850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1824, 'lippi', 'samanta', 'DNI', 23928901, NULL, NULL, NULL, '1974-11-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52657, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1825, 'lisandrello', 'nerina mariel', 'DNI', 30938361, NULL, NULL, NULL, '1984-05-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-30', 54559, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1826, 'liuti', 'mara', 'DNI', 25245812, NULL, NULL, NULL, '1976-09-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-10-01', 50268, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1828, 'llensa', 'mabel alejandra', 'DNI', 17963429, NULL, NULL, NULL, '1966-10-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997-02-24', 49548, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1829, 'llorden', 'sergio', 'DNI', 10059955, NULL, NULL, NULL, '1952-04-03', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1977-05-24', 100007, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1830, 'lo', 'pilato adriana marcela', 'DNI', 17849186, NULL, NULL, NULL, '1966-02-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-06-04', 22669, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1831, 'lobos', 'claudia noemi', 'DNI', 16935310, NULL, NULL, NULL, '1963-10-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-10-01', 47207, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1832, 'lombardi', 'evangelina', 'DNI', 28944257, NULL, NULL, NULL, '1981-07-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51497, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1833, 'lombardi', 'javier ignacio', 'DNI', 24505084, NULL, NULL, NULL, '1975-02-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-08-01', 55012, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1834, 'lombardo', 'rosana monica andrea', 'DNI', 22896776, NULL, NULL, NULL, '1973-01-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-10-01', 52901, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1835, 'longo', 'gabriela', 'DNI', 21414848, NULL, NULL, NULL, '1970-01-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56412, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1836, 'lopez', 'alvarez  pilar', 'DNI', 93357388, NULL, NULL, NULL, '1957-02-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-10-01', 44878, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1837, 'lopez', 'claudia', 'DNI', 16852815, NULL, NULL, NULL, '1964-08-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-09-01', 49991, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1838, 'lopez', 'claudia marisa', 'DNI', 17324518, NULL, NULL, NULL, '1965-02-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52483, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1839, 'lopez', 'maria laura', 'DNI', 24239487, NULL, NULL, NULL, '1975-03-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53932, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1840, 'lopez', 'paula andrea', 'DNI', 25381093, NULL, NULL, NULL, '1976-06-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51833, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1841, 'lopez', 'siboldi mariana', 'DNI', 21942041, NULL, NULL, NULL, '1970-11-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-01-01', 44852, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1842, 'lorenzo', 'jorgelina', 'DNI', 27055561, NULL, NULL, NULL, '1978-12-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 55672, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1843, 'luca', 'maria jose', 'DNI', 28088069, NULL, NULL, NULL, '1980-04-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54811, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1844, 'lucarelli', 'maria florencia', 'DNI', 28059187, NULL, NULL, NULL, '1980-07-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51837, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1845, 'lunghi', 'veronica silvia', 'DNI', 29616045, NULL, NULL, NULL, '1982-08-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 55673, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1846, 'luraschi', 'cristian daniel', 'DNI', 21523951, NULL, NULL, NULL, '1970-08-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44772, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1847, 'luraschi', 'mariel elisabet', 'DNI', 29806734, NULL, NULL, NULL, '1983-04-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-09-01', 56310, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1848, 'macedo', 'alberto jose agustin', 'DNI', 12113675, NULL, NULL, NULL, '1958-02-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 45126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1849, 'macerola', 'betiana carina', 'DNI', 31074251, NULL, NULL, NULL, '1984-07-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-01', 54411, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1850, 'machtey', 'maia', 'DNI', 32874025, NULL, NULL, NULL, '1987-06-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-01', 515846, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1851, 'macri', 'maria magdalena', 'DNI', 13588254, NULL, NULL, NULL, '1957-12-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-03-01', 102029, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1852, 'maga', 'ana carolina', 'DNI', 26126768, NULL, NULL, NULL, '1977-11-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53591, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1853, 'magagnini', 'maria virginia', 'DNI', 27515668, NULL, NULL, NULL, '1979-08-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 54172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1854, 'magliaro', 'daniel alberto', 'DNI', 18030923, NULL, NULL, NULL, '1966-11-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-06-12', 515782, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1855, 'maiocco', 'juan matias', 'DNI', 31847933, NULL, NULL, NULL, '1985-09-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-30', 54939, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1856, 'makovsky', 'ana alejandra', 'DNI', 92483935, NULL, NULL, NULL, '1968-04-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01', 44025, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1857, 'malchiodi', 'silvia alejandra', 'DNI', 20392032, NULL, NULL, NULL, '1968-09-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-06-24', 47676, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1858, 'malin', 'maria eugenia', 'DNI', 27742580, NULL, NULL, NULL, '1979-11-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-10-01', 53488, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1859, 'malinskas', 'gloria silvia guadal', 'DNI', 12437824, NULL, NULL, NULL, '1956-12-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 53928, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1860, 'mancini', 'victoria', 'DNI', 29560789, NULL, NULL, NULL, '1982-08-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-01', 58351, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1861, 'manfred', 'alejandro maximiliano', 'DNI', 20598847, NULL, NULL, NULL, '1969-03-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1862, 'mansilla', 'carina alejandra', 'DNI', 21521490, NULL, NULL, NULL, '1970-06-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1863, 'marani', 'valeria', 'DNI', 27428134, NULL, NULL, NULL, '1979-10-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 51498, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1864, 'march', 'maria belen', 'DNI', 26775978, NULL, NULL, NULL, '1977-11-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-04-01', 55952, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1865, 'marchisio', 'maria fernanda', 'DNI', 27890288, NULL, NULL, NULL, '1980-12-03', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-09-20', 55494, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1866, 'marcon', 'maria teresa', 'DNI', 12202472, NULL, NULL, NULL, '1958-05-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997-09-12', 43170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1867, 'marcozzi', 'natalia', 'DNI', 20490718, NULL, NULL, NULL, '1969-01-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52087, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1868, 'margonari', 'albertina', 'DNI', 25750727, NULL, NULL, NULL, '1977-05-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-12-20', 45184, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1869, 'margutti', 'maria teresa', 'DNI', 11874769, NULL, NULL, NULL, '1955-07-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-02-09', 102452, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1870, 'mari', 'raquel valeria', 'DNI', 20174300, NULL, NULL, NULL, '1968-06-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-03-01', 52918, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1871, 'marin', 'enrique', 'DNI', 12404947, NULL, NULL, NULL, '1958-07-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 44599, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1872, 'marotta', 'viviana', 'DNI', 16344824, NULL, NULL, NULL, '1962-10-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-06-19', 100790, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1873, 'marquez', 'ariana gabriela', 'DNI', 22660708, NULL, NULL, NULL, '1972-08-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-01', 46891, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1874, 'marquez', 'damian edgardo', 'DNI', 24298567, NULL, NULL, NULL, '1975-02-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-10-26', 43407, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1875, 'marroni', 'javier gaston', 'DNI', 27022282, NULL, NULL, NULL, '1978-11-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-08-01', 55371, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1876, 'martello', 'oscar ariel', 'DNI', 14975390, NULL, NULL, NULL, '1962-10-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-08-01', 43741, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1877, 'martignone', 'maricel alicia', 'DNI', 30155656, NULL, NULL, NULL, '1983-08-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-08-01', 59302, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1878, 'martin', 'analia raquel', 'DNI', 18455125, NULL, NULL, NULL, '1967-07-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52659, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1879, 'martin', 'erica romina', 'DNI', 28912182, NULL, NULL, NULL, '1981-07-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 52288, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1880, 'martin', 'lautaro juan', 'DNI', 24566788, NULL, NULL, NULL, '1975-06-28', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1881, 'martinelli', 'maria florencia', 'DNI', 28536505, NULL, NULL, NULL, '1981-04-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-01', 54776, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1882, 'martinelli', 'maria gisela', 'DNI', 25427375, NULL, NULL, NULL, '1977-01-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 817135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1883, 'martinez', 'alicia cristina', 'DNI', 18491800, NULL, NULL, NULL, '1967-10-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 50980, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1884, 'martinez', 'gabriela alejandra', 'DNI', 16770636, NULL, NULL, NULL, '1964-03-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1994-12-30', 48430, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1885, 'martinez', 'guillermo federico', 'DNI', 23061995, NULL, NULL, NULL, '1973-07-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56603, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1886, 'martinez', 'lilian ivon', 'DNI', 24900507, NULL, NULL, NULL, '1975-10-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-09-01', 50736, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1887, 'martinich', 'carina elisabet', 'DNI', 22175235, NULL, NULL, NULL, '1971-05-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52661, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1888, 'martino', 'cecilia m.mattia de', 'DNI', 16935106, NULL, NULL, NULL, '1964-05-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-08-14', 101273, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1889, 'martino', 'eduardo walter', 'DNI', 23281994, NULL, NULL, NULL, '1973-08-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-09-01', 50734, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1890, 'martino', 'elisa soledad', 'DNI', 28177249, NULL, NULL, NULL, '1980-07-01', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52753, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1891, 'martino', 'fabiana marcela', 'DNI', 20355126, NULL, NULL, NULL, '1968-12-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1994-01-01', 41019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1892, 'maskin', 'debora rut', 'DNI', 27134576, NULL, NULL, NULL, '1979-07-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-01-01', 55109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1893, 'massolo', 'florencia carolina', 'DNI', 27890409, NULL, NULL, NULL, '1980-03-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52593, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1894, 'mastrogiovanni', 'maria susana', 'DNI', 11874763, NULL, NULL, NULL, '1955-08-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1979-08-06', 101039, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1895, 'mateu', 'gagliardi janina', 'DNI', 23344412, NULL, NULL, NULL, '1973-06-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 43587, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1896, 'matzner', 'judith alejandra', 'DNI', 30960309, NULL, NULL, NULL, '1984-07-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-10-01', 54564, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1897, 'maximino', 'leonardo fabián', 'DNI', 21579347, NULL, NULL, NULL, '1970-07-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-09-01', 55667, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1898, 'maza', 'cristian walter', 'DNI', 23978247, NULL, NULL, NULL, '1974-07-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-08-13', 49189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1899, 'mazzuchini', 'monica lucia', 'DNI', 20173646, NULL, NULL, NULL, '1968-02-21', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52808, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1900, 'mazzurco', 'maria florencia', 'DNI', 28912461, NULL, NULL, NULL, '1981-08-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-08-01', 55054, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1901, 'medina', 'claudia susana', 'DNI', 14729719, NULL, NULL, NULL, '1962-11-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44795, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1902, 'medina', 'diana', 'DNI', 24779481, NULL, NULL, NULL, '1975-10-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 54542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1903, 'medina', 'maria florencia', 'DNI', 25126667, NULL, NULL, NULL, '1976-04-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-12-01', 55663, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1904, 'medina', 'ruben adrian', 'DNI', 17859126, NULL, NULL, NULL, '1966-02-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 56321, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1905, 'mehring', 'silvana andrea', 'DNI', 26319071, NULL, NULL, NULL, '1977-12-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1906, 'mena', 'sandra mariela', 'DNI', 17278028, NULL, NULL, NULL, '1965-07-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 44745, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1907, 'mendoza', 'silvia susana', 'DNI', 26460534, NULL, NULL, NULL, '1978-03-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1908, 'meneguzzi', 'alejandra beatriz', 'DNI', 23004732, NULL, NULL, NULL, '1972-11-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-03-01', 56541, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1909, 'menendez', 'analia', 'DNI', 27498565, NULL, NULL, NULL, '1979-07-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52086, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1910, 'menzella', 'guillermo', 'DNI', 22698049, NULL, NULL, NULL, '1972-03-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 53521, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1911, 'mercado', 'maria celia', 'DNI', 28059153, NULL, NULL, NULL, '1980-07-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-09-01', 57074, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1912, 'merli', 'silvia alejandra', 'DNI', 17460632, NULL, NULL, NULL, '1966-01-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-05-01', 100898, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1913, 'migueles', 'jose maria', 'DNI', 11493539, NULL, NULL, NULL, '1954-10-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-01-01', 104440, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1914, 'milici', 'sandra gabriela', 'DNI', 14081248, NULL, NULL, NULL, '1960-10-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44773, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1915, 'minni', 'georgina gabriela', 'DNI', 29662912, NULL, NULL, NULL, '1982-11-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-30', 54155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1916, 'miño', 'maria cecilia', 'DNI', 28135987, NULL, NULL, NULL, '1981-02-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-12-01', 54496, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1917, 'mirabet', 'paula', 'DNI', 30265824, NULL, NULL, NULL, '1983-08-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-07-01', 56313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1918, 'mitjans', 'ana maria', 'DNI', 22010813, NULL, NULL, NULL, '1971-01-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-11-01', 52497, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1919, 'modarelli', 'melina maria', 'DNI', 28449318, NULL, NULL, NULL, '1980-11-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-12-01', 51012, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1920, 'moirin', 'ana silvina', 'DNI', 25713065, NULL, NULL, NULL, '1977-06-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-11-01', 51834, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1921, 'molina', 'boero rodrigo', 'DNI', 29989185, NULL, NULL, NULL, '1983-03-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-01', 54815, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1922, 'molina', 'luciana juliana', 'DNI', 29902241, NULL, NULL, NULL, '1983-02-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-07-01', 54936, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1923, 'mollard', 'virginia', 'DNI', 29162956, NULL, NULL, NULL, '1981-11-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-06-01', 54334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1924, 'monateri', 'soledad', 'DNI', 28817053, NULL, NULL, NULL, '1981-03-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-09-01', 55040, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1925, 'montenegro', 'sofia flavia', 'DNI', 21525357, NULL, NULL, NULL, '1970-06-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 43588, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1926, 'montorfano', 'miguel angel', 'DNI', 13182633, NULL, NULL, NULL, '1959-09-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 120208, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1927, 'morand', 'angeles haydee', 'DNI', 21697742, NULL, NULL, NULL, '1971-01-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-08-01', 53557, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1928, 'morante', 'jorge andres', 'DNI', 11226219, NULL, NULL, NULL, '1954-12-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-02-01', 102160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1929, 'morbiducci', 'valeria anabel', 'DNI', 21413824, NULL, NULL, NULL, '1970-02-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', 54515, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1930, 'moreno', 'carla lucia', 'DNI', 32648313, NULL, NULL, NULL, '1986-11-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-04-01', 59134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1931, 'morgantini', 'florencia maria', 'DNI', 30022533, NULL, NULL, NULL, '1983-10-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-01', 59917, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1932, 'moro', 'andrea', 'DNI', 14510897, NULL, NULL, NULL, '1962-02-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 52142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1933, 'moscardi', 'yanina', 'DNI', 22013658, NULL, NULL, NULL, '1971-06-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44777, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1934, 'mule', 'claudia patricia', 'DNI', 16218788, NULL, NULL, NULL, '1963-01-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44774, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1935, 'muller', 'leila', 'DNI', 31280632, NULL, NULL, NULL, '1984-12-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-01', 54828, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1936, 'muller', 'romina', 'DNI', 25588588, NULL, NULL, NULL, '1977-01-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-04-01', 52228, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1937, 'muniategui', 'julieta carmela', 'DNI', 30688609, NULL, NULL, NULL, '1983-12-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-12-10', 50455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1938, 'munnich', 'alfredo eduardo', 'DNI', 18480132, NULL, NULL, NULL, '1967-04-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44775, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1939, 'muñiz', 'maria eugenia', 'DNI', 32832907, NULL, NULL, NULL, '1987-04-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54582, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1940, 'muñoz', 'lorena vanina', 'DNI', 23941565, NULL, NULL, NULL, '1974-10-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-01', 55668, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1941, 'mura', 'stella maris', 'DNI', 11784239, NULL, NULL, NULL, '1955-12-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 52662, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1942, 'murillo', 'maria fernanda', 'DNI', 18522928, NULL, NULL, NULL, '1967-12-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-07-03', 27606, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1943, 'mussetti', 'luciana', 'DNI', 32114117, NULL, NULL, NULL, '1986-06-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 54906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1944, 'mussolini', 'eliana mariel', 'DNI', 29926122, NULL, NULL, '', '1982-12-30', 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-09-01', 54145, NULL, 2, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2017-12-13'),
(1945, 'mutti', 'maria balbiana', 'DNI', 22533679, NULL, NULL, NULL, '1971-10-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-03-01', 515790, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1946, 'nassivera', 'silvana maria', 'DNI', 28101855, NULL, NULL, NULL, '1980-05-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-09-08', 43802, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1947, 'nava', 'carina paula', 'DNI', 20854265, NULL, NULL, NULL, '1969-11-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-01-17', 49046, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1948, 'navarro', 'silvia beatriz', 'DNI', 13958684, NULL, NULL, NULL, '1960-09-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 50213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1949, 'neuman', 'debora', 'DNI', 18094130, NULL, NULL, NULL, '1967-03-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-08-01', 27623, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1950, 'nicoletta', 'daniel lautaro', 'DNI', 31437767, NULL, NULL, NULL, '1985-01-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54423, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1951, 'nicora', 'vanesa', 'DNI', 31500754, NULL, NULL, NULL, '1985-04-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-09', 55323, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1952, 'niello', 'alberto', 'DNI', 17930241, NULL, NULL, NULL, '1967-05-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-07-01', 54721, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1953, 'nieto', 'maximiliano mauricio', 'DNI', 24479394, NULL, NULL, NULL, '1975-05-27', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1954, 'nieva', 'maria del lujan', 'DNI', 17716735, NULL, NULL, NULL, '1966-05-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-08-01', 119855, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1955, 'nipoti', 'jesica paola', 'DNI', 30948524, NULL, NULL, NULL, '1984-05-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-01', 54529, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1956, 'nobile', 'fabio angel', 'DNI', 20239277, NULL, NULL, NULL, '1968-06-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-10-01', 50264, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1957, 'nobo', 'gabriela veronica', 'DNI', 25012005, NULL, NULL, NULL, '1975-09-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 58188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1958, 'obertti', 'patricia beatriz', 'DNI', 16745707, NULL, NULL, NULL, '1964-07-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-07-01', 18619, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1959, 'oggier', 'laura mariel', 'DNI', 24571969, NULL, NULL, NULL, '1975-08-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-04-01', 51140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1960, 'ojeda', 'javier luis', 'DNI', 22009062, NULL, NULL, NULL, '1971-05-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 53705, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1961, 'orsaria', 'laura beatriz', 'DNI', 28199400, NULL, NULL, NULL, '1980-06-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-01-01', 54782, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1962, 'orsolini', 'maria paula', 'DNI', 29120580, NULL, NULL, NULL, '1981-12-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1963, 'osta', 'marisabel beatriz', 'DNI', 12922296, NULL, NULL, NULL, '1958-11-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-01-01', 100912, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1964, 'otazua', 'monica beatriz', 'DNI', 17758498, NULL, NULL, NULL, '1966-05-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52066, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1965, 'otero', 'telmo ariel', 'DNI', 10410299, NULL, NULL, NULL, '1952-05-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-01-01', 107979, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1966, 'oudot', 'silvia beatriz', 'DNI', 14373468, NULL, NULL, NULL, '1961-03-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1984-06-11', 102777, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1967, 'oviedo', 'valeria alejandra', 'DNI', 25161625, NULL, NULL, NULL, '1976-06-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-10-01', 54182, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1968, 'oviedo', 'vanina gisela', 'DNI', 23740846, NULL, NULL, NULL, '1974-06-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-07-01', 52068, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1969, 'pabon', 'maciel  jimena', 'DNI', 25328866, NULL, NULL, NULL, '1976-11-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-08-01', 54323, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1970, 'pagani', 'daniela andrea', 'DNI', 22040503, NULL, NULL, NULL, '1971-03-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 43344, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1971, 'paizal', 'marisa silvia', 'DNI', 13788811, NULL, NULL, NULL, '1960-07-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53165, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1972, 'paleari', 'luis ernesto', 'DNI', 12694312, NULL, NULL, NULL, '1957-01-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-04-02', 100939, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1973, 'palillo', 'andrea raquel', 'DNI', 18339616, NULL, NULL, NULL, '1967-06-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44776, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1974, 'palma', 'delicia mercedes', 'DNI', 13885533, NULL, NULL, NULL, '1957-10-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-01-01', 102063, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1975, 'palmerola', 'daniela alejandra', 'DNI', 30405371, NULL, NULL, NULL, '1983-08-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-11-01', 54773, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1976, 'paniagua', 'ernesto ezequiel', 'DNI', 20298682, NULL, NULL, NULL, '1969-05-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1977, 'pantalone', 'anabela', 'DNI', 31250985, NULL, NULL, NULL, '1984-11-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54972, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1978, 'parcellier', 'maria soledad', 'DNI', 24292487, NULL, NULL, NULL, '1975-04-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-09-01', 515795, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1979, 'parizzi', 'alicia beatriz', 'DNI', 17572926, NULL, NULL, NULL, '1965-09-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-04-01', 51139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1980, 'parodi', 'coccaro juan pedro', 'DNI', 92836495, NULL, NULL, NULL, '1971-03-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 51702, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1981, 'passerini', 'laura mabel', 'DNI', 28536585, NULL, NULL, NULL, '1981-04-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-08-01', 54553, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1982, 'paura', 'maria laura', 'DNI', 31542214, NULL, NULL, NULL, '1985-04-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', 54516, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1983, 'pedemonte', 'maria regina', 'DNI', 29623153, NULL, NULL, NULL, '1982-07-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 50955, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1984, 'pellegrini', 'carlos horacio', 'DNI', 12522663, NULL, NULL, NULL, '1958-06-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-09-01', 50730, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1985, 'pellegrino', 'angel fabian', 'DNI', 23184189, NULL, NULL, NULL, '1973-02-09', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-02-01', 50486, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1986, 'pellegrino', 'hector enrique', 'DNI', 12522756, NULL, NULL, NULL, '1956-06-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1982-07-20', 101314, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1987, 'penayo', 'salvador andres', 'DNI', 24591908, NULL, NULL, NULL, '1975-11-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52511, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1988, 'peña', 'laura', 'DNI', 27092819, NULL, NULL, NULL, '1979-01-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-08-01', 55030, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1989, 'pera', 'laura ines', 'DNI', 20536162, NULL, NULL, NULL, '1968-11-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1990, 'perbellini', 'valeria', 'DNI', 25615899, NULL, NULL, NULL, '1977-03-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 55674, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1991, 'peredo', 'patricia claudia', 'DNI', 18116579, NULL, NULL, NULL, '1966-10-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-04-01', 53311, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1992, 'pereira', 'maria gabriela', 'DNI', 31365149, NULL, NULL, NULL, '1985-01-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-11-01', 56309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1993, 'pereyra', 'silvana marcela', 'DNI', 20143659, NULL, NULL, NULL, '1968-01-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-02-01', 47541, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1994, 'perez', 'fernandez carla florenci', 'DNI', 29268568, NULL, NULL, NULL, '1982-01-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-30', 56304, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1995, 'perez', 'mariela', 'DNI', 18425331, NULL, NULL, NULL, '1967-07-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-11-01', 44715, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1996, 'perez', 'marisol marta', 'DNI', 30548464, NULL, NULL, NULL, '1983-12-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-01', 55326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1997, 'peri', 'susana beatriz', 'DNI', 12480322, NULL, NULL, NULL, '1958-05-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-07-01', 103470, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1998, 'perotti', 'daniela marisa', 'DNI', 29777317, NULL, NULL, NULL, '1982-11-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-06-01', 54335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1999, 'perotti', 'liza beatriz', 'DNI', 24055997, NULL, NULL, NULL, '1975-02-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52665, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000, 'pescador', 'ines matilde', 'DNI', 12523066, NULL, NULL, NULL, '1956-09-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-08-01', 48847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2001, 'pesiri', 'laura', 'DNI', 17849289, NULL, NULL, NULL, '1965-12-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-07-20', 42682, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2002, 'pestrin', 'maria natalia', 'DNI', 28795577, NULL, NULL, NULL, '1981-04-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-05-01', 54531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2003, 'petronio', 'cesar alejandro', 'DNI', 16770634, NULL, NULL, NULL, '1964-05-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 515828, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2004, 'piacentini', 'pablo enrique', 'DNI', 26667688, NULL, NULL, NULL, '1978-06-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-06-01', 54167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2005, 'piacenza', 'maria gimena', 'DNI', 28132792, NULL, NULL, NULL, '1980-05-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 59556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2006, 'pianetti', 'daniela joana', 'DNI', 31112080, NULL, NULL, NULL, '1984-06-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-03-01', 54527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2007, 'piccini', 'vanina', 'DNI', 29928984, NULL, NULL, NULL, '1983-04-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-01', 54946, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2008, 'piccioni', 'carla jimena', 'DNI', 27211814, NULL, NULL, NULL, '1979-05-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52061, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2009, 'piccoli', 'marcela deolinda', 'DNI', 28398689, NULL, NULL, NULL, '1980-08-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-06-01', 54332, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2010, 'pidone', 'anibal hernan', 'DNI', 21041180, NULL, NULL, NULL, '1969-10-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-07-01', 47661, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2011, 'pineda', 'juan pablo', 'DNI', 26912483, NULL, NULL, NULL, '1979-02-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-05-01', 54078, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2012, 'pini', 'miriam ana', 'DNI', 12910941, NULL, NULL, NULL, '1957-05-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1982-11-16', 102699, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2013, 'pitarella', 'carolina florencia', 'DNI', 30689577, NULL, NULL, NULL, '1983-12-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 53827, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2014, 'plaza', 'maria eugenia', 'DNI', 25171840, NULL, NULL, NULL, '1976-08-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-02-01', 48555, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2015, 'plebani', 'daniela mirta', 'DNI', 14510721, NULL, NULL, NULL, '1962-01-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 55016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2016, 'polidoro', 'natalia', 'DNI', 32125538, NULL, NULL, NULL, '1986-04-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54886, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2017, 'poratti', 'roxana jorgelina', 'DNI', 21579222, NULL, NULL, NULL, '1970-06-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52666, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2018, 'porcel', 'maria julieta', 'DNI', 20745106, NULL, NULL, NULL, '1969-03-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-08-01', 500141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2019, 'porreca', 'naida nadia', 'DNI', 30485043, NULL, NULL, NULL, '1983-07-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-01', 54694, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2020, 'porta', 'noemi ida', 'DNI', 11196647, NULL, NULL, NULL, '1954-08-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-01-16', 42225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2021, 'posella', 'cecilia vanesa', 'DNI', 29487453, NULL, NULL, NULL, '1982-07-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-11-01', 54324, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2022, 'posella', 'noelia elisa', 'DNI', 30671096, NULL, NULL, NULL, '1984-02-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53933, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2023, 'pozzi', 'mariela hevie del lujan', 'DNI', 14729415, NULL, NULL, NULL, '1962-05-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-07-01', 122466, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2024, 'pradal', 'andres federico', 'DNI', 30002789, NULL, NULL, NULL, '2999-12-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 57969, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2025, 'prestera', 'jorgelina ana', 'DNI', 24282584, NULL, NULL, NULL, '1975-02-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-06-01', 52187, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2026, 'prieto', 'eliana belen', 'DNI', 27880891, NULL, NULL, NULL, '1980-01-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-07-01', 54200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2027, 'prosperi', 'natalia', 'DNI', 23044869, NULL, NULL, NULL, '1973-09-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-01', 59922, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2028, 'puntarello', 'marcelo', 'DNI', 18074349, NULL, NULL, NULL, '1967-02-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-05-12', 42227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2029, 'puntorillo', 'evelina eugenia', 'DNI', 26184280, NULL, NULL, NULL, '1977-01-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51743, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2030, 'puszkin', 'jennifer vanessa', 'DNI', 18512728, NULL, NULL, NULL, '1966-11-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1997-01-01', 40419, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2031, 'quintana', 'mariana laura', 'DNI', 26999768, NULL, NULL, NULL, '1978-11-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-07-01', 55300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2032, 'quintana', 'pablo', 'DNI', 24987722, NULL, NULL, NULL, '1976-02-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-03-01', 45887, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2033, 'quiroga', 'monica graciela', 'DNI', 12527866, NULL, NULL, NULL, '1958-10-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-11-01', 44564, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2034, 'quiroga', 'valeria soledad', 'DNI', 30764881, NULL, NULL, '', '1984-07-03', 1, 15, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2016-08-01', 54747, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2018-01-17'),
(2035, 'quispe', 'raimundo', 'DNI', 10959469, NULL, NULL, NULL, '1953-12-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-05-01', 108227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2036, 'racedo', 'aragon ignacio eduardo', 'DNI', 26073464, NULL, NULL, NULL, '1977-09-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-09-01', 54202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2037, 'raggio', 'carina', 'DNI', 21422672, NULL, NULL, NULL, '1970-02-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-01-01', 44860, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2038, 'raguseo', 'viviana renee', 'DNI', 13958779, NULL, NULL, NULL, '1957-11-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-05-01', 115337, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2039, 'raimondi', 'natalia beatriz', 'DNI', 27205108, NULL, NULL, NULL, '1979-03-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 52290, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2040, 'rall', 'rayen', 'DNI', 25002591, NULL, NULL, NULL, '1975-07-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 55330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2041, 'ramacciotti', 'julieta', 'DNI', 29792599, NULL, NULL, NULL, '1983-05-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-04-01', 54920, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2042, 'ramirez', 'marina', 'DNI', 26642182, NULL, NULL, NULL, '1978-07-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-12-01', 54780, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2043, 're', 'martin sebastian', 'DNI', 30256149, NULL, NULL, NULL, '1983-05-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-09', 55313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2044, 'redondo', 'jesica vanesa', 'DNI', 25979467, NULL, NULL, NULL, '1977-09-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-11-01', 55398, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2045, 'regenhardt', 'luciana veronica', 'DNI', 27590847, NULL, NULL, NULL, '1979-11-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56602, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2046, 'repetto', 'marina', 'DNI', 24592554, NULL, NULL, NULL, '1975-08-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-08-01', 55017, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2047, 'reynoso', 'hernan marcelo', 'DNI', 17519293, NULL, NULL, NULL, '1966-02-16', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-11-01', 40452, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2048, 'ricchetti', 'marcela susana', 'DNI', 17228614, NULL, NULL, NULL, '1964-11-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44923, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2049, 'ricciuti', 'maria del lujan', 'DNI', 22683744, NULL, NULL, NULL, '1972-09-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-07-01', 47911, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2050, 'rico', 'mariangeles', 'DNI', 29316608, NULL, NULL, NULL, '1982-01-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-01', 54845, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2051, 'riego', 'julia', 'DNI', 30689368, NULL, NULL, NULL, '1983-12-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-10-01', 57191, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2052, 'rigalli', 'maria alejandra', 'DNI', 17160365, NULL, NULL, NULL, '1965-01-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 44951, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2053, 'rimini', 'patricio', 'DNI', 33318264, NULL, NULL, NULL, '1987-12-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 58189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2054, 'rinaldi', 'daniel cesar', 'DNI', 16306580, NULL, NULL, NULL, '1963-04-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-11-01', 44600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2055, 'rinaldi', 'gabriela andrea', 'DNI', 23061696, NULL, NULL, NULL, '1973-05-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-01-01', 49246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2056, 'rios', 'claudia ines', 'DNI', 17357124, NULL, NULL, NULL, '1965-04-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52669, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2057, 'rios', 'silvia marisa angelica', 'DNI', 20173369, NULL, NULL, NULL, '1968-06-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51783, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2058, 'ripoll', 'laura andrea', 'DNI', 25942454, NULL, NULL, NULL, '1977-08-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 51694, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2059, 'ripoll', 'sebastian ubaldo', 'DNI', 25088523, NULL, NULL, NULL, '1976-01-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-07-01', 50635, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2060, 'rita', 'fabio daniel', 'DNI', 17849725, NULL, NULL, NULL, '1966-06-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-09-21', 42366, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2061, 'roasio', 'carlos norberto', 'DNI', 12211740, NULL, NULL, NULL, '1956-07-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-08-22', 118946, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2062, 'robledo', 'cintia sabrina', 'DNI', 29516387, NULL, NULL, NULL, '1982-07-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-03-01', 58514, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trabajadores` (`id`, `apellido`, `nombre`, `tpodoc`, `nrodoc`, `ncuitl`, `matricula`, `imgtrb`, `fecha_nacimiento`, `profesion_id`, `especialidad_1_id`, `especialidad_2_id`, `especialidad_3_id`, `especialidad_4_id`, `domicilio`, `telefono`, `celular`, `email`, `cuit`, `activo`, `mr_fecha_ingreso`, `mr_legajo`, `mr_categoria_id`, `mr_statuslab_id`, `xlreparticion`, `xltipoemp`, `xlcaliflab`, `xltitulo`, `mrmapid`, `mrpersonaid`, `comentarios`, `fecha_creacion`, `fecha_modificacion`) VALUES
(2063, 'roces', 'daniela susana', 'DNI', 25524250, NULL, NULL, NULL, '1976-10-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-10-01', 51751, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2064, 'rodriguez', 'durini marina', 'DNI', 28058487, NULL, NULL, NULL, '1980-03-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-05-01', 54169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2065, 'rodriguez', 'elsa noemi', 'DNI', 10347256, NULL, NULL, NULL, '1951-10-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-06-01', 21831, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2066, 'rodriguez', 'gabriel guillermo g.', 'DNI', 13502572, NULL, NULL, NULL, '1957-08-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-01-01', 50997, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2067, 'rodriguez', 'leon paula', 'DNI', 26730328, NULL, NULL, NULL, '1978-09-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 817148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2068, 'rodriguez', 'liliana monica', 'DNI', 11752523, NULL, NULL, NULL, '1955-05-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1982-10-25', 100360, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2069, 'rodriguez', 'viviana mariela', 'DNI', 24586088, NULL, NULL, NULL, '1975-06-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-12-01', 53923, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2070, 'roeschlin', 'juan jose', 'DNI', 28581230, NULL, NULL, NULL, '1982-01-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', 54160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2071, 'roitman', 'dana laura', 'DNI', 29401528, NULL, NULL, NULL, '1982-03-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-09-01', 54149, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2072, 'rojas', 'narvaez jesus maria', 'DNI', 18798385, NULL, NULL, NULL, '1952-09-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-07-01', 108775, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2073, 'rolando', 'gabriela', 'DNI', 22766431, NULL, NULL, NULL, '1972-05-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 49720, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2074, 'rolon', 'angela elena', 'DNI', 17094094, NULL, NULL, NULL, '1964-08-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-08-01', 44280, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2075, 'rolon', 'sandra', 'DNI', 31290034, NULL, NULL, NULL, '1984-09-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54831, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2076, 'romagnoli', 'antonela', 'DNI', 29611797, NULL, NULL, NULL, '1982-09-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-01', 54691, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2077, 'romero', 'jose manuel', 'DNI', 17555876, NULL, NULL, NULL, '1965-05-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-04-17', 48451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2078, 'romero', 'maria mercedes', 'DNI', 26871496, NULL, NULL, NULL, '1978-11-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52673, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2079, 'romero', 'mariana laura', 'DNI', 21528720, NULL, NULL, NULL, '1970-06-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 51071, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2080, 'ronco', 'juan carlos', 'DNI', 25512493, NULL, NULL, NULL, '1977-03-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-06-01', 55018, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2081, 'rosales', 'marcelo gerardo', 'DNI', 18112955, NULL, NULL, NULL, '1967-03-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1996-07-19', 48882, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2082, 'rosel', 'valeria  cintia', 'DNI', 28524079, NULL, NULL, NULL, '1980-12-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52603, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2083, 'ross', 'elena', 'DNI', 10594131, NULL, NULL, NULL, '1952-06-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51664, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2084, 'rossi', 'adriana d francioni de', 'DNI', 14697430, NULL, NULL, NULL, '1961-11-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-10-01', 100716, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2085, 'rossi', 'eduardo alberto', 'DNI', 14494726, NULL, NULL, NULL, '1961-08-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-05-02', 130442, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2086, 'rossi', 'fabricini virginia soled', 'DNI', 28915631, NULL, NULL, NULL, '2999-12-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 57354, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2087, 'rossignol', 'gustavo', 'DNI', 18149513, NULL, NULL, NULL, '1966-11-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-11-01', 44717, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2088, 'rotger', 'diana andrea', 'DNI', 12111407, NULL, NULL, NULL, '1955-12-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1982-01-18', 100733, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2089, 'rovetto', 'noelia andrea', 'DNI', 25328815, NULL, NULL, NULL, '1976-04-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-09-01', 55053, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2090, 'ruben', 'maria mercedes', 'DNI', 24086776, NULL, NULL, NULL, '1974-07-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', 55658, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2091, 'rubies', 'julia carolina', 'DNI', 29623297, NULL, NULL, NULL, '1982-08-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54948, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2092, 'rubinich', 'tamara andrea', 'DNI', 18503702, NULL, NULL, NULL, '1967-05-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-07', 27604, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2093, 'rubio', 'marina angelica', 'DNI', 18547865, NULL, NULL, NULL, '1967-07-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 56601, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2094, 'saccone', 'eleonora ema', 'DNI', 6246225, NULL, NULL, NULL, '1949-09-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-01-01', 101547, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2095, 'sader', 'veronica silvina', 'DNI', 20641761, NULL, NULL, NULL, '1969-07-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-01-01', 50503, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2096, 'salamero', 'mario martin', 'DNI', 27826169, NULL, NULL, NULL, '1980-01-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-02-06', 55519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2097, 'saldaña', 'arroyo jessica elizabe', 'DNI', 18901582, NULL, NULL, NULL, '1972-06-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-10-01', 54405, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2098, 'salomone', 'silvia susana', 'DNI', 31521229, NULL, NULL, NULL, '1985-05-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01', 54546, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2099, 'salvatore', 'erica lorena', 'DNI', 29348913, NULL, NULL, NULL, '1982-03-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52838, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2100, 'salvia', 'maria del carmen', 'DNI', 30838223, NULL, NULL, NULL, '1984-05-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-06-01', 54336, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2101, 'san', 'miguel ana barruetaveña de', 'DNI', 11445106, NULL, NULL, NULL, '1954-10-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1979-03-24', 108363, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2102, 'sanchez', 'almeyra rodrigo jorge', 'DNI', 11673143, NULL, NULL, NULL, '1955-01-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1981-05-01', 103887, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2103, 'sanchez', 'debora andrea', 'DNI', 29683845, NULL, NULL, NULL, '1982-11-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-07-01', 53538, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2104, 'sanchez', 'gabriel', 'DNI', 17228936, NULL, NULL, NULL, '1965-10-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 49640, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2105, 'sanchez', 'gustavo hernan', 'DNI', 27318112, NULL, NULL, NULL, '1979-04-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 50640, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2106, 'sandalo', 'lucia amelia', 'DNI', 33318163, NULL, NULL, NULL, '1987-11-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-09', 54890, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2107, 'sandoval', 'graciela alicia', 'DNI', 16367932, NULL, NULL, NULL, '1963-05-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-12-30', 40476, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2108, 'sanmarti', 'carlos arsenio', 'DNI', 12984446, NULL, NULL, '', '1957-09-24', 1, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2005-06-01', 108760, NULL, 3, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2018-02-09'),
(2109, 'sansone', 'adriana  carmen', 'DNI', 10189766, NULL, NULL, NULL, '1952-06-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1978-01-01', 101529, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2110, 'santanatoglia', 'jorge', 'DNI', 16483869, NULL, NULL, NULL, '1963-11-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44718, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2111, 'santos', 'diaz juan manuel', 'DNI', 23954185, NULL, NULL, NULL, '1974-05-31', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52749, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2112, 'sanvido', 'josefina silvia', 'DNI', 28921475, NULL, NULL, NULL, '1982-01-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54687, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2113, 'sarnago', 'melina silvana', 'DNI', 33720475, NULL, NULL, NULL, '1988-05-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-01', 54743, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2114, 'scabuzzo', 'aldana marina', 'DNI', 32803206, NULL, NULL, NULL, '1986-12-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 57066, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2115, 'scagliola', 'lucia', 'DNI', 30685122, NULL, NULL, NULL, '1984-02-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-01', 54737, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2116, 'scali', 'liliana maria', 'DNI', 21689722, NULL, NULL, NULL, '1970-09-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-03-01', 52033, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2117, 'scarpelli', 'loredana viviana', 'DNI', 27880982, NULL, NULL, NULL, '1980-01-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-11-01', 58220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2118, 'scarpignato', 'maria de carmen', 'DNI', 12521157, NULL, NULL, NULL, '1958-05-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1981-08-18', 107075, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2119, 'schenquer', 'aliza', 'DNI', 22526571, NULL, NULL, NULL, '1972-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44768, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2120, 'scheuerlein', 'karina silvana', 'DNI', 29633050, NULL, NULL, NULL, '1982-10-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', 54497, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2121, 'schirmer', 'ana teresa', 'DNI', 13448319, NULL, NULL, NULL, '1957-07-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-27', 42263, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2122, 'schmidt', 'jorgelina luz maría', 'DNI', 30730937, NULL, NULL, NULL, '1984-03-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-04-01', 54727, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2123, 'schmukler', 'german', 'DNI', 25942758, NULL, NULL, NULL, '1977-09-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-01', 53969, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2124, 'sedepski', 'ruben oscar', 'DNI', 12788523, NULL, NULL, NULL, '1957-03-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-07-01', 123961, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2125, 'segovia', 'david alcides', 'DNI', 29241348, NULL, NULL, NULL, '1981-02-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-10-01', 50278, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2126, 'seijas', 'carina lorena', 'DNI', 23755976, NULL, NULL, NULL, '1974-08-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-09-01', 51711, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2127, 'semino', 'gabriela alejandra', 'DNI', 17828071, NULL, NULL, NULL, '1966-07-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-03-01', 47244, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2128, 'sempio', 'roxana maria', 'DNI', 17480605, NULL, NULL, NULL, '1966-01-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52674, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2129, 'serantes', 'ines', 'DNI', 29662598, NULL, NULL, NULL, '1982-09-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-05-01', 52984, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2130, 'settimini', 'nestor mario', 'DNI', 12804216, NULL, NULL, NULL, '1957-02-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-01-01', 108301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2131, 'severini', 'javier martin', 'DNI', 28999704, NULL, NULL, NULL, '1981-10-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-07-01', 55343, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2132, 'sevilla', 'maria fernanda g.', 'DNI', 25381923, NULL, NULL, NULL, '1976-11-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-07-01', 51659, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2133, 'sileo', 'rita maria', 'DNI', 10594847, NULL, NULL, NULL, '1952-09-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52538, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2134, 'simonetta', 'hector guillermo', 'DNI', 8617677, NULL, NULL, NULL, '1951-07-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1980-07-24', 100311, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2135, 'sinkevich', 'celina analia', 'DNI', 27093067, NULL, NULL, NULL, '1979-02-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-01', 57626, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2136, 'sisto', 'pablo cesar', 'DNI', 22300349, NULL, NULL, NULL, '1971-09-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-06-01', 51597, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2137, 'sola', 'pablo', 'DNI', 28101234, NULL, NULL, NULL, '1980-06-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-09-01', 54560, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2138, 'solari', 'marcela vanina', 'DNI', 22703997, NULL, NULL, NULL, '1972-08-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-10-01', 43746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2139, 'solari', 'melisa', 'DNI', 31874721, NULL, NULL, NULL, '1985-10-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-30', 54554, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2140, 'soldani', 'lorena paola', 'DNI', 22401054, NULL, NULL, NULL, '1972-03-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52010, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2141, 'soldano', 'mirta noris', 'DNI', 16547001, NULL, NULL, NULL, '1963-08-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-18', 20125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2142, 'solis', 'estefania', 'DNI', 26866889, NULL, NULL, NULL, '1979-01-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-11-01', 55145, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2143, 'solis', 'silvia guadalupe', 'DNI', 14343016, NULL, NULL, NULL, '1961-01-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-06-01', 21368, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2144, 'sopranzetti', 'viviana noemi', 'DNI', 16690148, NULL, NULL, NULL, '1965-01-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-08-01', 50211, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2145, 'sosa', 'gisel romina', 'DNI', 32968086, NULL, NULL, NULL, '1987-04-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-04-01', 59133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2146, 'sosa', 'graciela liliana', 'DNI', 17695279, NULL, NULL, NULL, '1965-12-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2002-09-01', 44799, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2147, 'sotelo', 'mirta alicia', 'DNI', 13509068, NULL, NULL, NULL, '1957-10-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-05-01', 48414, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2148, 'soto', 'luciano eugenio jesús', 'DNI', 26959932, NULL, NULL, NULL, '1978-10-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-02-01', 54491, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2149, 'spada', 'flavia mariana', 'DNI', 26349451, NULL, NULL, NULL, '1978-03-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-11-01', 52675, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2150, 'spagnuolo', 'maria celeste', 'DNI', 27801677, NULL, NULL, NULL, '1980-02-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-01', 52611, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2151, 'spalding', 'tamara judith', 'DNI', 28274626, NULL, NULL, NULL, '1980-11-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53571, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2152, 'spatafora', 'silvana letizia', 'DNI', 17387254, NULL, NULL, NULL, '1965-12-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 104125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2153, 'squillaci', 'yanina sol', 'DNI', 31990096, NULL, NULL, NULL, '1985-11-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-01', 58352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2154, 'squizzato', 'graciela marta', 'DNI', 12522259, NULL, NULL, NULL, '1956-05-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-06-05', 103827, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2155, 'stapaj', 'maria ines', 'DNI', 30615340, NULL, NULL, NULL, '1984-01-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-01', 55333, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2156, 'stecchini', 'patricia', 'DNI', 93499534, NULL, NULL, NULL, '1950-06-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1977-12-15', 101057, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2157, 'sterpone', 'valeria soledad', 'DNI', 29352032, NULL, NULL, NULL, '1982-03-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-01-01', 56031, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2158, 'stettler', 'abel', 'DNI', 30670846, NULL, NULL, NULL, '1983-12-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-07-01', 54732, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2159, 'sticotti', 'maricel marta', 'DNI', 21078203, NULL, NULL, NULL, '1969-10-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 51993, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2160, 'stoppani', 'maria veronica', 'DNI', 20188354, NULL, NULL, NULL, '1968-05-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-10-01', 44804, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2161, 'suarez', 'barbara alejandra', 'DNI', 26517726, NULL, NULL, NULL, '1978-07-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-30', 54413, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2162, 'suarez', 'cecilia maria', 'DNI', 28647963, NULL, NULL, NULL, '1981-03-10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-09-01', 53508, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2163, 'sueiras', 'francisco ramon', 'DNI', 31696197, NULL, NULL, NULL, '1985-09-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54216, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2164, 'suppicich', 'gisela paola', 'DNI', 27589632, NULL, NULL, NULL, '1979-12-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-09-01', 54909, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2165, 'svetaz', 'cynthia carolina', 'DNI', 26731969, NULL, NULL, NULL, '1978-09-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52743, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2166, 'szemuda', 'cecilia', 'DNI', 32399039, NULL, NULL, NULL, '1986-06-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-30', 54921, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2167, 'taberna', 'maria eugenia', 'DNI', 26763944, NULL, NULL, NULL, '1978-08-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-01-01', 53178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2168, 'talamonti', 'valeria', 'DNI', 23585259, NULL, NULL, NULL, '1974-01-21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-01-01', 53709, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2169, 'tardio', 'carolina', 'DNI', 18893654, NULL, NULL, NULL, '1981-02-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-07-01', 55342, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2170, 'tarditti', 'maria gabriela', 'DNI', 20630244, NULL, NULL, NULL, '1969-05-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-02-01', 44719, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2171, 'tartaglini', 'victor jose', 'DNI', 12788362, NULL, NULL, NULL, '1958-10-31', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52752, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2172, 'taruselli', 'diego ezequiel', 'DNI', 27140961, NULL, NULL, NULL, '1979-01-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-12-30', 51617, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2173, 'tassone', 'vanina hebe', 'DNI', 29662604, NULL, NULL, NULL, '1982-09-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-06-01', 52546, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2174, 'tassoni', 'silvia alejandra', 'DNI', 13720462, NULL, NULL, NULL, '1961-10-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-05-04', 118952, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2175, 'tazzioli', 'graciela', 'DNI', 16511754, NULL, NULL, NULL, '1963-10-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-07-03', 42299, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2176, 'telesco', 'carina liliana', 'DNI', 21635300, NULL, NULL, NULL, '1970-09-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1998-11-01', 49234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2177, 'tendela', 'helena cecilia', 'DNI', 28566907, NULL, NULL, NULL, '1981-02-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-01', 55329, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2178, 'terre', 'gladis mabel', 'DNI', 13692013, NULL, NULL, NULL, '1957-09-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-12-12', 100602, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2179, 'testoni', 'ileana vanesa maria', 'DNI', 27862559, NULL, NULL, NULL, '1980-03-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-04-01', 54117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2180, 'thorkelsen', 'nadia ayelen', 'DNI', 27663933, NULL, NULL, '', '1980-02-21', 1, 14, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2014-04-01', 515839, NULL, 2, '', NULL, NULL, '', NULL, NULL, NULL, NULL, '2018-01-25'),
(2181, 'timpanaro', 'valeria georgina', 'DNI', 24586544, NULL, NULL, NULL, '1975-09-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-02-01', 52022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2182, 'tobin', 'patricia', 'DNI', 11557935, NULL, NULL, NULL, '1954-05-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-05-01', 44657, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2183, 'toledo', 'alejandra viviana', 'DNI', 18617074, NULL, NULL, NULL, '1967-10-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-07-01', 42502, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2184, 'toledo', 'flavia daniela', 'DNI', 27291149, NULL, NULL, NULL, '1979-06-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-01', 53085, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2185, 'tomasin', 'marina', 'DNI', 29680637, NULL, NULL, NULL, '1982-08-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-01-01', 56004, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2186, 'tomasini', 'carolina  andrea', 'DNI', 28776135, NULL, NULL, NULL, '1981-02-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-06-01', 55520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2187, 'tomisani', 'adriana maria', 'DNI', 13499404, NULL, NULL, NULL, '1957-05-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-06-01', 45025, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2188, 'toneguzzo', 'janina raquel', 'DNI', 28571119, NULL, NULL, NULL, '1981-07-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-04-01', 56751, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2189, 'tonelli', 'leonel gustavo', 'DNI', 32086934, NULL, NULL, NULL, '1986-06-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 54688, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2190, 'torno', 'adrian andres', 'DNI', 11965769, NULL, NULL, NULL, '1958-01-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-03-26', 40960, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2191, 'torrez', 'juan gil', 'DNI', 11270718, NULL, NULL, NULL, '1954-03-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1984-09-01', 100064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2192, 'toto', 'silvia beatriz', 'DNI', 13692045, NULL, NULL, NULL, '1959-10-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-01-01', 104501, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2193, 'trabattoni', 'florencia', 'DNI', 25017676, NULL, NULL, NULL, '1976-01-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 43560, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2194, 'trobbiani', 'gisela paola', 'DNI', 29806630, NULL, NULL, NULL, '1983-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-10-01', 54562, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2195, 'turdo', 'viviana graciela', 'DNI', 16805723, NULL, NULL, NULL, '1964-03-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1993-01-01', 47329, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2196, 'turi', 'andrea carina', 'DNI', 21530723, NULL, NULL, NULL, '1970-03-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-10-01', 57731, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2197, 'urmeneta', 'carina natalia', 'DNI', 24492271, NULL, NULL, NULL, '1975-06-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-09-01', 52844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2198, 'vacotto', 'diego martin', 'DNI', 28392166, NULL, NULL, NULL, '1980-08-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-06-01', 53501, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2199, 'valdes', 'maria de los angeles', 'DNI', 18467611, NULL, NULL, NULL, '1967-09-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-09-01', 50732, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2200, 'vallejos', 'liliana nieves', 'DNI', 12404348, NULL, NULL, NULL, '1956-03-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1987-08-01', 102707, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2201, 'valles', 'julieta andrea', 'DNI', 23049765, NULL, NULL, NULL, '1973-05-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-04-01', 49721, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2202, 'vargas', 'susana patricia', 'DNI', 12284822, NULL, NULL, NULL, '1958-08-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1995-06-01', 40891, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2203, 'varona', 'marta beatriz', 'DNI', 11448424, NULL, NULL, NULL, '1954-05-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-02-01', 42571, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2204, 'vecchio', 'luciano augusto', 'DNI', 31115995, NULL, NULL, NULL, '1985-02-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 58909, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2205, 'vedromick', 'sergio hernán', 'DNI', 23848211, NULL, NULL, NULL, '1974-02-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-01', 54517, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2206, 'velazquez', 'ana maria cristina', 'DNI', 12772351, NULL, NULL, NULL, '1956-11-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003-11-01', 49632, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2207, 'venaria', 'alejandro', 'DNI', 27292589, NULL, NULL, NULL, '1979-07-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-12-05', 56606, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2208, 'venegas', 'veronica lia', 'DNI', 28035246, NULL, NULL, NULL, '1980-01-26', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52751, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2209, 'ventura', 'maria elisa', 'DNI', 12527654, NULL, NULL, NULL, '1956-11-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1983-05-01', 101988, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2210, 'venturi', 'cecilia', 'DNI', 27442790, NULL, NULL, NULL, '1979-12-19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-09-01', 54538, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2211, 'vera', 'silvia alejandra', 'DNI', 26694388, NULL, NULL, NULL, '1978-07-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-06-01', 54201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2212, 'verolo', 'diego david', 'DNI', 16630357, NULL, NULL, NULL, '1965-03-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-01-24', 15024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2213, 'vidalle', 'dalila cristina', 'DNI', 25445406, NULL, NULL, NULL, '1976-06-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-01', 45882, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2214, 'vidre', 'ana cecilia', 'DNI', 28449431, NULL, NULL, NULL, '1980-11-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-10-01', 52986, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2215, 'vietto', 'maria gabriela', 'DNI', 16627424, NULL, NULL, NULL, '1963-01-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1989-11-20', 46672, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2216, 'vignoli', 'carmelo', 'DNI', 8524487, NULL, NULL, NULL, '1951-05-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1979-03-28', 102955, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2217, 'villa', 'analia rosa', 'DNI', 27864234, NULL, NULL, NULL, '1980-04-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-06-01', 55299, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2218, 'villagra', 'maria eugenia', 'DNI', 18107068, NULL, NULL, NULL, '1966-10-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-08-01', 44931, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2219, 'villanueva', 'amparo', 'DNI', 26662698, NULL, NULL, NULL, '1978-05-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-10-01', 53600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2220, 'villarreal', 'omar elvio', 'DNI', 16063942, NULL, NULL, NULL, '1962-09-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-08-01', 50166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2221, 'villasanti', 'monica mercedes', 'DNI', 12113854, NULL, NULL, NULL, '1958-03-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1988-05-01', 101201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2222, 'vincenti', 'cecilia evangelina', 'DNI', 28818760, NULL, NULL, NULL, '1981-05-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-01', 52285, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2223, 'vinciguerra', 'roxana claudia', 'DNI', 20408825, NULL, NULL, NULL, '1968-11-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-01-01', 49050, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2224, 'vitantonio', 'maria noemi', 'DNI', 16745991, NULL, NULL, NULL, '1964-05-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-21', 17141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2225, 'vitelli', 'maria paula', 'DNI', 29677484, NULL, NULL, NULL, '1983-01-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-05-01', 53310, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2226, 'viudez', 'maria gabriela', 'DNI', 20536407, NULL, NULL, NULL, '1969-02-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-09-21', 27642, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2227, 'voltattorni', 'patricia evangelin', 'DNI', 18149946, NULL, NULL, NULL, '1967-05-04', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1992-11-18', 20595, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2228, 'vozza', 'betina maria', 'DNI', 23674309, NULL, NULL, NULL, '1973-12-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-01-01', 44981, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2229, 'weinstein', 'sergio alejandro', 'DNI', 17241905, NULL, NULL, NULL, '1965-02-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-04-01', 54536, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2230, 'weiss', 'annelise maria del rosar', 'DNI', 34299851, NULL, NULL, NULL, '2999-12-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 59926, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2231, 'willems', 'alejandra  anahi', 'DNI', 29140734, NULL, NULL, NULL, '1981-12-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2010-01-01', 55085, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2232, 'willi', 'betina eliana', 'DNI', 27421924, NULL, NULL, NULL, '1979-09-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-08-01', 52678, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2233, 'wulfsohn', 'florencia', 'DNI', 33448042, NULL, NULL, NULL, '1988-01-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 58213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2234, 'yacomini', 'alejandra', 'DNI', 24926471, NULL, NULL, NULL, '1976-03-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-07-01', 43640, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2235, 'yocco', 'gabriel nicolas domingo', 'DNI', 30951290, NULL, NULL, NULL, '1983-07-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-11-01', 58219, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2236, 'yorie', 'zulma mabel', 'DNI', 14938758, NULL, NULL, NULL, '1963-04-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1994-01-01', 40900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2237, 'yrubeta', 'goyena cintia', 'DNI', 31897891, NULL, NULL, NULL, '1986-04-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-01', 54321, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2238, 'zabalza', 'analia', 'DNI', 29680275, NULL, NULL, NULL, '1982-09-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-01', 53502, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2239, 'zacchino', 'ariel fabian', 'DNI', 13989737, NULL, NULL, NULL, '1962-10-26', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2006-08-01', 50233, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2240, 'zadunaisky', 'rovegno  valeria', 'DNI', 18339515, NULL, NULL, NULL, '1967-08-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-09-16', 460042, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2241, 'zaja', 'rodolfo alejandro ivan', 'DNI', 21789543, NULL, NULL, NULL, '1971-08-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-12-01', 50642, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2242, 'zalazar', 'mariana elizabet', 'DNI', 28242431, NULL, NULL, NULL, '1980-07-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-12-01', 53469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2243, 'zalba', 'juan jose', 'DNI', 20461395, NULL, NULL, NULL, '1969-01-29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-08-01', 44278, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2244, 'zamboni', 'maria ines', 'DNI', 17234554, NULL, NULL, NULL, '1965-03-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1990-11-27', 19571, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2245, 'zamora', 'juan ramon', 'DNI', 7951163, NULL, NULL, NULL, '1947-04-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1978-06-01', 107089, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2246, 'zanardi', 'liza maria', 'DNI', 26449958, NULL, NULL, NULL, '1978-05-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-11-01', 54810, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2247, 'zanchetta', 'graciela noemi', 'DNI', 17387277, NULL, NULL, NULL, '1965-10-28', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-02-01', 53143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2248, 'zanello', 'agustina', 'DNI', 30390619, NULL, NULL, NULL, '1983-01-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-02-01', 54520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2249, 'zanini', 'karina', 'DNI', 20263826, NULL, NULL, NULL, '1969-05-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-11-01', 44932, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2250, 'zappulla', 'analia silvia', 'DNI', 21690271, NULL, NULL, NULL, '1970-08-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2001-01-01', 29205, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2251, 'zarate', 'alicia vicenta', 'DNI', 16731294, NULL, NULL, NULL, '1964-06-23', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1991-05-23', 28018, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2252, 'zerpa', 'stella maris', 'DNI', 21557322, NULL, NULL, NULL, '1970-05-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2004-07-01', 43146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2253, 'zgaga', 'marisa alejandra', 'DNI', 18296737, NULL, NULL, NULL, '1967-08-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2005-05-01', 515778, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2254, 'zini', 'cintia maria', 'DNI', 28199622, NULL, NULL, NULL, '1980-07-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2009-02-01', 54067, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2255, 'zorrilla', 'julieta', 'DNI', 29623141, NULL, NULL, NULL, '1982-07-15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-01-01', 54407, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2256, 'zufiaur', 'edith andrea', 'DNI', 13788898, NULL, NULL, NULL, '1960-05-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1985-01-22', 103397, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2257, 'zwenger', 'yanina paola', 'DNI', 26912852, NULL, NULL, NULL, '1978-11-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2007-01-01', 52002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2258, 'barbieri', 'pablo', 'DNI', 1, NULL, NULL, '', NULL, NULL, 3, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, 1, '', NULL, NULL, '', NULL, NULL, NULL, '2017-11-29', '2017-11-29'),
(2259, 'ripolone', 'maricel', 'DNI', 1, NULL, NULL, '', NULL, 1, 3, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, 1, '', NULL, NULL, '', NULL, NULL, NULL, '2017-11-29', '2017-11-29'),
(2260, 'rossit', 'melina', 'DNI', 1, NULL, NULL, '', NULL, 1, 3, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, NULL, NULL, 1, '', NULL, NULL, '', NULL, NULL, NULL, '2017-11-29', '2017-11-29'),
(2261, 'menoyo', 'virginia', 'DNI', 1, NULL, NULL, '', NULL, 1, 6, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, 59978, NULL, 1, '', NULL, NULL, '', NULL, NULL, NULL, '2018-01-18', '2018-01-22'),
(2262, 'dure madariaga', 'paula', 'DNI', 1, NULL, NULL, '', NULL, 1, 6, NULL, NULL, NULL, NULL, '', '341', NULL, NULL, 1, NULL, 57064, NULL, 2, '', NULL, NULL, '', NULL, NULL, NULL, '2018-01-22', '2018-01-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areasdependencia`
--
ALTER TABLE `areasdependencia`
 ADD PRIMARY KEY (`id`), ADD KEY `areasdependencia_cd9f3227` (`responsable_id`);

--
-- Indexes for table `asignalabs`
--
ALTER TABLE `asignalabs`
 ADD PRIMARY KEY (`id`), ADD KEY `asignalabs_061b2772` (`trabajador_id`), ADD KEY `asignalabs_4f1e5aad` (`profesion_id`), ADD KEY `asignalabs_da6e0363` (`areadep_id`), ADD KEY `asignalabs_01d59ba2` (`institucion_id`), ADD KEY `asignalabs_1d6a3c49` (`servicio_id`), ADD KEY `asignalabs_a70eee0d` (`funcion_id`), ADD KEY `asignalabs_501a6ea5` (`espec_id`), ADD KEY `asignalabs_b41b671c` (`xausenciatrab_id`), ADD KEY `asignalabs_3fe0ce2f` (`usuario_registro_id`);

--
-- Indexes for table `asignalabs_dds`
--
ALTER TABLE `asignalabs_dds`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `asigna_lab_id` (`asigna_lab_id`,`dds_id`), ADD KEY `asignalabs_dds_4944416c` (`asigna_lab_id`), ADD KEY `asignalabs_dds_32c0dc19` (`dds_id`);

--
-- Indexes for table `ausencias_trbs`
--
ALTER TABLE `ausencias_trbs`
 ADD PRIMARY KEY (`id`), ADD KEY `ausencias_trbs_da6e0363` (`areadep_id`), ADD KEY `ausencias_trbs_934d0743` (`trabajador_ausente_id`), ADD KEY `ausencias_trbs_352e83db` (`cobertura_princ_por_id`), ADD KEY `ausencias_trbs_3d9a2b0d` (`tipo_ausencia_id`), ADD KEY `ausencias_trbs_3fe0ce2f` (`usuario_registro_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `group_id` (`group_id`,`permission_id`), ADD KEY `auth_group_permissions_0e939a4f` (`group_id`), ADD KEY `auth_group_permissions_8373b171` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `content_type_id` (`content_type_id`,`codename`), ADD KEY `auth_permission_417f1b1c` (`content_type_id`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_id` (`user_id`,`group_id`), ADD KEY `auth_user_groups_e8701ad4` (`user_id`), ADD KEY `auth_user_groups_0e939a4f` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_id` (`user_id`,`permission_id`), ADD KEY `auth_user_user_permissions_e8701ad4` (`user_id`), ADD KEY `auth_user_user_permissions_8373b171` (`permission_id`);

--
-- Indexes for table `clamaxasigna`
--
ALTER TABLE `clamaxasigna`
 ADD PRIMARY KEY (`id`), ADD KEY `clamaxasigna_aef6067f` (`trb_sugerido_id`), ADD KEY `clamaxasigna_da6e0363` (`areadep_id`), ADD KEY `clamaxasigna_01d59ba2` (`institucion_id`), ADD KEY `clamaxasigna_a70eee0d` (`funcion_id`), ADD KEY `clamaxasigna_501a6ea5` (`espec_id`), ADD KEY `clamaxasigna_b41b671c` (`xausenciatrab_id`), ADD KEY `clamaxasigna_3fe0ce2f` (`usuario_registro_id`);

--
-- Indexes for table `clamaxasigna_dds`
--
ALTER TABLE `clamaxasigna_dds`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `clm_asigna_id` (`clm_asigna_id`,`dds_id`), ADD KEY `clamaxasigna_dds_7877e0e2` (`clm_asigna_id`), ADD KEY `clamaxasigna_dds_32c0dc19` (`dds_id`);

--
-- Indexes for table `contratos`
--
ALTER TABLE `contratos`
 ADD PRIMARY KEY (`id`), ADD KEY `contratos_061b2772` (`trabajador_id`), ADD KEY `contratos_3fe0ce2f` (`usuario_registro_id`), ADD KEY `contratos_b41b671c` (`xausenciatrab_id`);

--
-- Indexes for table `dataextra_dds`
--
ALTER TABLE `dataextra_dds`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ddlasem`
--
ALTER TABLE `ddlasem`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
 ADD PRIMARY KEY (`id`), ADD KEY `django_admin_log_417f1b1c` (`content_type_id`), ADD KEY `django_admin_log_e8701ad4` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
 ADD PRIMARY KEY (`session_key`), ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `especialidades`
--
ALTER TABLE `especialidades`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensiones`
--
ALTER TABLE `extensiones`
 ADD PRIMARY KEY (`id`), ADD KEY `extensiones_061b2772` (`trabajador_id`), ADD KEY `extensiones_e00dc1b7` (`asignalab_id`), ADD KEY `extensiones_b41b671c` (`xausenciatrab_id`), ADD KEY `extensiones_3fe0ce2f` (`usuario_registro_id`);

--
-- Indexes for table `funclabs`
--
ALTER TABLE `funclabs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instituciones`
--
ALTER TABLE `instituciones`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `mr_categorias`
--
ALTER TABLE `mr_categorias`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mr_status`
--
ALTER TABLE `mr_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profesiones`
--
ALTER TABLE `profesiones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reemplazos`
--
ALTER TABLE `reemplazos`
 ADD PRIMARY KEY (`id`), ADD KEY `reemplazos_061b2772` (`trabajador_id`), ADD KEY `reemplazos_da6e0363` (`areadep_id`), ADD KEY `reemplazos_3fe0ce2f` (`usuario_registro_id`);

--
-- Indexes for table `reemplazos_asglabs`
--
ALTER TABLE `reemplazos_asglabs`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `reemplazo_id` (`reemplazo_id`,`asigna_lab_id`), ADD KEY `reemplazos_asglabs_456a6f43` (`reemplazo_id`), ADD KEY `reemplazos_asglabs_41ab89a1` (`asigna_lab_id`);

--
-- Indexes for table `registros_catgs`
--
ALTER TABLE `registros_catgs`
 ADD PRIMARY KEY (`id`), ADD KEY `registros_catgs_061b2772` (`trabajador_id`), ADD KEY `registros_catgs_5f2644f7` (`categoria_id`), ADD KEY `registros_catgs_3fe0ce2f` (`usuario_registro_id`);

--
-- Indexes for table `registros_esps`
--
ALTER TABLE `registros_esps`
 ADD PRIMARY KEY (`id`), ADD KEY `registros_esps_061b2772` (`trabajador_id`), ADD KEY `registros_esps_a8995c62` (`especialidad_id`), ADD KEY `registros_esps_3fe0ce2f` (`usuario_registro_id`);

--
-- Indexes for table `registros_status`
--
ALTER TABLE `registros_status`
 ADD PRIMARY KEY (`id`), ADD KEY `registros_status_061b2772` (`trabajador_id`), ADD KEY `registros_status_48fb58bb` (`status_id`), ADD KEY `registros_status_3fe0ce2f` (`usuario_registro_id`);

--
-- Indexes for table `servicios`
--
ALTER TABLE `servicios`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sqlscripts`
--
ALTER TABLE `sqlscripts`
 ADD PRIMARY KEY (`id`), ADD KEY `sqlscripts_3fe0ce2f` (`usuario_registro_id`);

--
-- Indexes for table `tipos_ausencias`
--
ALTER TABLE `tipos_ausencias`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trabajadores`
--
ALTER TABLE `trabajadores`
 ADD PRIMARY KEY (`id`), ADD KEY `trabajadores_4f1e5aad` (`profesion_id`), ADD KEY `trabajadores_0afe2636` (`especialidad_1_id`), ADD KEY `trabajadores_c4d1f676` (`especialidad_2_id`), ADD KEY `trabajadores_848dd65a` (`especialidad_3_id`), ADD KEY `trabajadores_22c498e1` (`especialidad_4_id`), ADD KEY `trabajadores_437d3041` (`mr_categoria_id`), ADD KEY `trabajadores_b7f61620` (`mr_statuslab_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areasdependencia`
--
ALTER TABLE `areasdependencia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `asignalabs`
--
ALTER TABLE `asignalabs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `asignalabs_dds`
--
ALTER TABLE `asignalabs_dds`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT for table `ausencias_trbs`
--
ALTER TABLE `ausencias_trbs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clamaxasigna`
--
ALTER TABLE `clamaxasigna`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `clamaxasigna_dds`
--
ALTER TABLE `clamaxasigna_dds`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `contratos`
--
ALTER TABLE `contratos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dataextra_dds`
--
ALTER TABLE `dataextra_dds`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ddlasem`
--
ALTER TABLE `ddlasem`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `especialidades`
--
ALTER TABLE `especialidades`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `extensiones`
--
ALTER TABLE `extensiones`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `funclabs`
--
ALTER TABLE `funclabs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `instituciones`
--
ALTER TABLE `instituciones`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `mr_categorias`
--
ALTER TABLE `mr_categorias`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mr_status`
--
ALTER TABLE `mr_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `profesiones`
--
ALTER TABLE `profesiones`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `reemplazos`
--
ALTER TABLE `reemplazos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reemplazos_asglabs`
--
ALTER TABLE `reemplazos_asglabs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `registros_catgs`
--
ALTER TABLE `registros_catgs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `registros_esps`
--
ALTER TABLE `registros_esps`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `registros_status`
--
ALTER TABLE `registros_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `servicios`
--
ALTER TABLE `servicios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sqlscripts`
--
ALTER TABLE `sqlscripts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipos_ausencias`
--
ALTER TABLE `tipos_ausencias`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `trabajadores`
--
ALTER TABLE `trabajadores`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2263;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `areasdependencia`
--
ALTER TABLE `areasdependencia`
ADD CONSTRAINT `responsable_id_refs_id_ad01cbb6` FOREIGN KEY (`responsable_id`) REFERENCES `trabajadores` (`id`);

--
-- Constraints for table `asignalabs`
--
ALTER TABLE `asignalabs`
ADD CONSTRAINT `areadep_id_refs_id_903eb87e` FOREIGN KEY (`areadep_id`) REFERENCES `areasdependencia` (`id`),
ADD CONSTRAINT `espec_id_refs_id_aa894c24` FOREIGN KEY (`espec_id`) REFERENCES `especialidades` (`id`),
ADD CONSTRAINT `funcion_id_refs_id_94e68fb7` FOREIGN KEY (`funcion_id`) REFERENCES `funclabs` (`id`),
ADD CONSTRAINT `institucion_id_refs_id_0fd1696a` FOREIGN KEY (`institucion_id`) REFERENCES `instituciones` (`id`),
ADD CONSTRAINT `profesion_id_refs_id_532f146b` FOREIGN KEY (`profesion_id`) REFERENCES `profesiones` (`id`),
ADD CONSTRAINT `servicio_id_refs_id_2fe2dbb5` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
ADD CONSTRAINT `trabajador_id_refs_id_d725d42c` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`),
ADD CONSTRAINT `xausenciatrab_id_refs_id_2a545a65` FOREIGN KEY (`xausenciatrab_id`) REFERENCES `ausencias_trbs` (`id`);

--
-- Constraints for table `asignalabs_dds`
--
ALTER TABLE `asignalabs_dds`
ADD CONSTRAINT `asigna_lab_id_refs_id_4d6db2bf` FOREIGN KEY (`asigna_lab_id`) REFERENCES `asignalabs` (`id`),
ADD CONSTRAINT `dds_id_refs_id_4185e0c8` FOREIGN KEY (`dds_id`) REFERENCES `dataextra_dds` (`id`);

--
-- Constraints for table `ausencias_trbs`
--
ALTER TABLE `ausencias_trbs`
ADD CONSTRAINT `areadep_id_refs_id_9153e0b2` FOREIGN KEY (`areadep_id`) REFERENCES `areasdependencia` (`id`),
ADD CONSTRAINT `cobertura_princ_por_id_refs_id_78eb94e4` FOREIGN KEY (`cobertura_princ_por_id`) REFERENCES `trabajadores` (`id`),
ADD CONSTRAINT `tipo_ausencia_id_refs_id_2a774a68` FOREIGN KEY (`tipo_ausencia_id`) REFERENCES `tipos_ausencias` (`id`),
ADD CONSTRAINT `trabajador_ausente_id_refs_id_78eb94e4` FOREIGN KEY (`trabajador_ausente_id`) REFERENCES `trabajadores` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
ADD CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
ADD CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
ADD CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `clamaxasigna`
--
ALTER TABLE `clamaxasigna`
ADD CONSTRAINT `areadep_id_refs_id_502f8d33` FOREIGN KEY (`areadep_id`) REFERENCES `areasdependencia` (`id`),
ADD CONSTRAINT `espec_id_refs_id_d358a198` FOREIGN KEY (`espec_id`) REFERENCES `especialidades` (`id`),
ADD CONSTRAINT `funcion_id_refs_id_523d4be4` FOREIGN KEY (`funcion_id`) REFERENCES `funclabs` (`id`),
ADD CONSTRAINT `institucion_id_refs_id_3c1f7daa` FOREIGN KEY (`institucion_id`) REFERENCES `instituciones` (`id`),
ADD CONSTRAINT `trb_sugerido_id_refs_id_7b2c7a6d` FOREIGN KEY (`trb_sugerido_id`) REFERENCES `trabajadores` (`id`),
ADD CONSTRAINT `xausenciatrab_id_refs_id_1d5b8b1a` FOREIGN KEY (`xausenciatrab_id`) REFERENCES `ausencias_trbs` (`id`);

--
-- Constraints for table `clamaxasigna_dds`
--
ALTER TABLE `clamaxasigna_dds`
ADD CONSTRAINT `clm_asigna_id_refs_id_730af3d1` FOREIGN KEY (`clm_asigna_id`) REFERENCES `clamaxasigna` (`id`),
ADD CONSTRAINT `dds_id_refs_id_6b704959` FOREIGN KEY (`dds_id`) REFERENCES `dataextra_dds` (`id`);

--
-- Constraints for table `contratos`
--
ALTER TABLE `contratos`
ADD CONSTRAINT `trabajador_id_refs_id_c9777a7b` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`),
ADD CONSTRAINT `xausenciatrab_id_refs_id_f9fd8ad7` FOREIGN KEY (`xausenciatrab_id`) REFERENCES `ausencias_trbs` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `extensiones`
--
ALTER TABLE `extensiones`
ADD CONSTRAINT `asignalab_id_refs_id_c3595b79` FOREIGN KEY (`asignalab_id`) REFERENCES `asignalabs` (`id`),
ADD CONSTRAINT `trabajador_id_refs_id_7175b3dd` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`),
ADD CONSTRAINT `xausenciatrab_id_refs_id_e410901d` FOREIGN KEY (`xausenciatrab_id`) REFERENCES `ausencias_trbs` (`id`);

--
-- Constraints for table `reemplazos`
--
ALTER TABLE `reemplazos`
ADD CONSTRAINT `areadep_id_refs_id_932eef74` FOREIGN KEY (`areadep_id`) REFERENCES `areasdependencia` (`id`),
ADD CONSTRAINT `trabajador_id_refs_id_e3f67211` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`);

--
-- Constraints for table `reemplazos_asglabs`
--
ALTER TABLE `reemplazos_asglabs`
ADD CONSTRAINT `asigna_lab_id_refs_id_412518c4` FOREIGN KEY (`asigna_lab_id`) REFERENCES `asignalabs` (`id`),
ADD CONSTRAINT `reemplazo_id_refs_id_a29e03b3` FOREIGN KEY (`reemplazo_id`) REFERENCES `reemplazos` (`id`);

--
-- Constraints for table `registros_catgs`
--
ALTER TABLE `registros_catgs`
ADD CONSTRAINT `categoria_id_refs_id_53fe7440` FOREIGN KEY (`categoria_id`) REFERENCES `mr_categorias` (`id`),
ADD CONSTRAINT `trabajador_id_refs_id_48468c0a` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`);

--
-- Constraints for table `registros_esps`
--
ALTER TABLE `registros_esps`
ADD CONSTRAINT `especialidad_id_refs_id_f8987b77` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`id`),
ADD CONSTRAINT `trabajador_id_refs_id_d5400764` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`);

--
-- Constraints for table `registros_status`
--
ALTER TABLE `registros_status`
ADD CONSTRAINT `status_id_refs_id_2c9e16a6` FOREIGN KEY (`status_id`) REFERENCES `mr_status` (`id`),
ADD CONSTRAINT `trabajador_id_refs_id_ec3b0751` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`);

--
-- Constraints for table `trabajadores`
--
ALTER TABLE `trabajadores`
ADD CONSTRAINT `especialidad_1_id_refs_id_7941e7ac` FOREIGN KEY (`especialidad_1_id`) REFERENCES `especialidades` (`id`),
ADD CONSTRAINT `especialidad_2_id_refs_id_7941e7ac` FOREIGN KEY (`especialidad_2_id`) REFERENCES `especialidades` (`id`),
ADD CONSTRAINT `especialidad_3_id_refs_id_7941e7ac` FOREIGN KEY (`especialidad_3_id`) REFERENCES `especialidades` (`id`),
ADD CONSTRAINT `especialidad_4_id_refs_id_7941e7ac` FOREIGN KEY (`especialidad_4_id`) REFERENCES `especialidades` (`id`),
ADD CONSTRAINT `mr_categoria_id_refs_id_62c16f0a` FOREIGN KEY (`mr_categoria_id`) REFERENCES `mr_categorias` (`id`),
ADD CONSTRAINT `mr_statuslab_id_refs_id_a19c0908` FOREIGN KEY (`mr_statuslab_id`) REFERENCES `mr_status` (`id`),
ADD CONSTRAINT `profesion_id_refs_id_5551ffdd` FOREIGN KEY (`profesion_id`) REFERENCES `profesiones` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

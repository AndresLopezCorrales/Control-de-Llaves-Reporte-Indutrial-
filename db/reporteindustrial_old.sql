-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2024 a las 02:47:01
-- Versión del servidor: 10.6.7-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reporteindustrial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `IDHorario` int(11) NOT NULL,
  `IDSalon` int(11) NOT NULL,
  `IDPersonal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`IDHorario`, `IDSalon`, `IDPersonal`) VALUES
(1, 31, 24308),
(2, 31, 5594),
(3, 31, 32985),
(4, 31, 17710),
(5, 19, 31596),
(6, 37, 9801),
(7, 45, 30779),
(8, 36, 34607),
(9, 30, 24308),
(10, 21, 35351),
(11, 21, 31853),
(12, 11, 35351),
(13, 5, 31233),
(14, 30, 5594),
(15, 28, 33369),
(16, 36, 26837),
(17, 37, 30419),
(18, 37, 30661),
(19, 36, 9801),
(20, 36, 30411),
(21, 41, 33111),
(22, 45, 30645),
(23, 21, 31233),
(24, 5, 31444),
(25, 29, 34714),
(26, 45, 35529),
(27, 28, 31234),
(28, 5, 35529),
(29, 45, 32212),
(30, 45, 34607),
(31, 26, 35529),
(32, 28, 28579),
(33, 11, 28071),
(34, 11, 35529),
(35, 21, 30427),
(36, 41, 30427),
(37, 28, 31564),
(38, 5, 31584),
(39, 11, 35672),
(40, 5, 30772),
(41, 11, 29870),
(42, 5, 22277),
(43, 11, 23889),
(44, 5, 22286),
(45, 11, 28052),
(46, 28, 28053),
(47, 11, 23625),
(48, 5, 28099),
(49, 5, 28071),
(50, 21, 28053),
(51, 21, 23887),
(52, 5, 25968),
(53, 5, 31423),
(54, 21, 35501),
(55, 3, 24308),
(56, 28, 32207),
(57, 41, 9801),
(58, 42, 30411),
(59, 24, 26837),
(60, 22, 24491),
(61, 22, 30419),
(62, 38, 26837),
(63, 38, 30411),
(64, 38, 31442),
(65, 24, 31442),
(66, 24, 29383),
(67, 24, 30547),
(68, 24, 30419),
(69, 24, 31082),
(70, 38, 34286),
(71, 38, 31082),
(72, 44, 34462),
(73, 22, 31442),
(74, 38, 30547),
(75, 24, 33594),
(76, 2, 32985),
(77, 6, 31002),
(78, 42, 25585),
(79, 44, 31002),
(80, 44, 32129),
(81, 44, 31442),
(82, 6, 32129),
(83, 44, 30411),
(84, 6, 24491),
(85, 40, 31442),
(86, 30, 32985),
(87, 22, 21643),
(88, 22, 23548),
(89, 6, 24411),
(90, 22, 32335),
(91, 6, 32335),
(92, 44, 35361),
(93, 44, 28047),
(94, 6, 29504),
(95, 6, 31423),
(96, 42, 24644),
(97, 19, 29256),
(98, 39, 23025),
(99, 39, 34607),
(100, 39, 35351),
(101, 39, 31102),
(102, 12, 31102),
(103, 8, 31102),
(104, 1, 30710),
(105, 26, 28883),
(106, 28, 24386),
(107, 20, 24393),
(108, 32, 24393),
(109, 20, 28579),
(110, 32, 28955),
(111, 32, 28579),
(112, 27, 31366),
(113, 43, 33369),
(114, 43, 30937),
(115, 27, 30729),
(116, 43, 33372),
(117, 40, 35500),
(118, 15, 30729),
(119, 15, 33372),
(120, 15, 32158),
(121, 15, 24678),
(122, 29, 31423),
(123, 29, 27460),
(124, 29, 24644),
(125, 29, 31234),
(126, 29, 31366),
(127, 29, 29756),
(128, 29, 30729),
(129, 8, 31412),
(130, 29, 31412),
(131, 26, 30937),
(132, 1, 13869),
(133, 4, 31423),
(134, 1, 27665),
(135, 8, 28095),
(136, 8, 27888),
(137, 9, 31584),
(138, 9, 28023),
(139, 7, 16339),
(140, 10, 31584),
(141, 10, 34982),
(142, 9, 28615),
(143, 7, 23950),
(144, 7, 31929),
(145, 10, 23548),
(146, 9, 21911),
(147, 9, 32389),
(148, 7, 20646),
(149, 10, 30968),
(150, 10, 32335),
(151, 9, 23548),
(152, 7, 23237),
(153, 7, 23887),
(154, 10, 23883),
(155, 10, 24411),
(156, 12, 30561),
(157, 12, 28047),
(158, 8, 31906),
(159, 8, 28099),
(160, 12, 29504),
(161, 12, 28099),
(162, 10, 27522),
(163, 1, 28071),
(164, 10, 31580),
(165, 4, 22286),
(166, 4, 33375),
(167, 3, 23550),
(168, 3, 33438),
(169, 27, 25968),
(170, 40, 29756),
(171, 12, 21328),
(172, 8, 32812),
(173, 12, 24393),
(174, 12, 25968),
(175, 8, 31580),
(176, 34, 31510),
(177, 40, 28579),
(178, 4, 33369),
(179, 4, 23769),
(180, 4, 31233),
(181, 5, 31102),
(182, 3, 31102),
(183, 4, 32431),
(184, 3, 31624),
(185, 3, 22823),
(186, 20, 31412),
(187, 3, 31412),
(188, 4, 31366),
(189, 34, 22031),
(190, 26, 8388),
(191, 40, 24644),
(192, 40, 32207),
(193, 27, 33125),
(194, 40, 33369),
(195, 27, 33372),
(196, 27, 27521),
(197, 27, 31423),
(198, 27, 24644),
(199, 1, 27771),
(200, 18, 31233),
(201, 15, 31234),
(202, 15, 24644),
(203, 30, 17710);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosactivos`
--

CREATE TABLE `pedidosactivos` (
  `IDPedidosactivo` int(11) NOT NULL,
  `IDSalon` int(11) NOT NULL,
  `IDPersonal` int(11) NOT NULL,
  `Llave` varchar(50) DEFAULT NULL,
  `Objetos` varchar(255) DEFAULT NULL,
  `FechaHoraCreacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `IDPersonal` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `ApellidoPaterno` varchar(255) NOT NULL,
  `ApellidoMaterno` varchar(255) NOT NULL,
  `Tipo` varchar(255) NOT NULL,
  `Departamento` varchar(255) DEFAULT NULL,
  `Carrera` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`IDPersonal`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `Tipo`, `Departamento`, `Carrera`) VALUES
(5594, 'CARLOS', 'ANAYA', 'EREDIAS', 'Maestro', 'DII', NULL),
(8388, 'GUILLERMO', 'CUAMEA', 'CRUZ', 'Maestro', 'DII', NULL),
(9801, 'CARLOS', 'FIGUEROA', 'NAVARRO', 'Maestro', 'DII', NULL),
(11968, 'SILVIA ELENA', 'IBARRA', 'OLMOS', 'Maestro', 'DII', NULL),
(12866, 'GUADALUPE AMANDA', 'LOPEZ', 'AHUMADA', 'Maestro', 'DII', NULL),
(13800, 'ROBERTO RODOLFO', 'MARRUFO', 'PINEDO', 'Maestro', 'DII', NULL),
(13869, 'JOSE LUIS', 'MARTINEZ', 'CASTRO', 'Maestro', 'DII', NULL),
(16339, 'FRANCISCO JAVIER', 'PARRA', 'VERGARA', 'Maestro', 'DII', NULL),
(17710, 'LUIS FELIPE', 'ROMERO', 'DESSENS', 'Maestro', 'DII', NULL),
(20646, 'EDUARDO', 'VERDIN', 'LOPEZ', 'Maestro', 'DII', NULL),
(21328, 'RAUL', 'ACEVES', 'TORRES', 'Maestro', 'DII', NULL),
(21591, 'JOSE LUIS', 'SOTO', 'MUNGUIA', 'Maestro', 'DII', NULL),
(21643, 'ROBERTO', 'LEYVA', 'ONTIVEROS', 'Maestro', 'DII', NULL),
(21911, 'IGNACIO', 'CRUZ', 'ENCINAS', 'Maestro', 'DII', NULL),
(22031, 'GILBERTO', 'ORTIZ', 'SUAREZ', 'Maestro', 'DII', NULL),
(22277, 'AGUSTIN', 'GRIJALVA', 'MONTEVERDE', 'Maestro', 'DII', NULL),
(22286, 'HORACIO', 'LEYVA', 'CASTELLANOS', 'Maestro', 'DII', NULL),
(22823, 'GILBERTO', 'GARCIA', 'NAVARRETE', 'Maestro', 'DII', NULL),
(23006, 'BENITO ROBERTO', 'CERVANTES', 'SANCHEZ', 'Maestro', '', NULL),
(23025, 'FRANCISCO ALBERTO', 'OROZCO', 'DUENAS', 'Maestro', 'DII', NULL),
(23193, 'MINERVA ELIZABETH', 'ARAUJO', 'MORENO', 'Maestro', '', NULL),
(23237, 'MANUEL ALFREDO', 'URREA', 'BERNAL', 'Maestro', 'DII', NULL),
(23548, 'ISRAEL', 'CONTRERAS', 'ESTRADA', 'Maestro', 'DII', NULL),
(23550, 'DE JESUS', 'AYALA', 'JOSE', 'Maestro', 'DII', NULL),
(23625, 'MARTIN DE JESUS', 'MANOSALVAS', 'LEYVA', 'Maestro', 'DII', NULL),
(23769, 'MARTIN', 'CHAVEZ', 'MORALES', 'Maestro', 'DII', NULL),
(23883, 'VITALIANO', 'SANTANA', 'ROJAS', 'Maestro', 'DII', NULL),
(23887, 'GERMAN', 'CAUDANA', 'CAMACHO', 'Maestro', 'DII', NULL),
(23889, 'BLANCA EVELIA', 'FLORES', 'SOTO', 'Maestro', 'DII', NULL),
(23950, 'HECTOR ALFREDO', 'HERNANDEZ', 'HERNANDEZ', 'Maestro', 'DII', NULL),
(24308, 'GUADALUPE ARACELI', 'TORRES', 'VALVERDE', 'Maestro', 'DII', NULL),
(24386, 'JESUS', 'MALDONADO', 'CASTRO', 'Maestro', 'DII', NULL),
(24393, 'FELIX', 'MONTANO', 'VALLE', 'Maestro', 'DII', NULL),
(24411, 'REYNALDO', 'FIGUEROA', 'GALINDO', 'Maestro', 'DII', NULL),
(24491, 'MARIO', 'BARCELO', 'VALENZUELA', 'Maestro', 'DII', NULL),
(24644, 'MIGUEL DANIEL', 'SOTO', 'RUIZ', 'Maestro', 'DII', NULL),
(24678, 'YNA MARIA', 'DAVILA', 'RASCON', 'Maestro', 'DII', NULL),
(25585, 'ALONSO', 'PEREZ', 'SOLTERO', 'Maestro', 'DII', NULL),
(25968, 'CONSUELO', 'MORA', 'CASTELLANOS', 'Maestro', 'DII', NULL),
(26017, 'RENE CESAR', 'LEYVA', 'CONTRERAS', 'Maestro', 'DII', NULL),
(26837, 'VICTOR HUGO', 'SAPIEN', 'CHAVEZ', 'Maestro', 'DII', NULL),
(27460, 'CARLOS ARMANDO', 'YOCUPICIO', 'CASTRO', 'Maestro', 'DII', NULL),
(27521, 'JAIME ALFONSO', 'LEON', 'DUARTE', 'Maestro', 'DII', NULL),
(27522, 'GERARDO', 'CALDERON', 'AYALA', 'Maestro', 'DII', NULL),
(27665, 'MIRNA ELIA', 'AGUAYO', 'SALINAS', 'Maestro', 'DII', NULL),
(27771, 'JOSE MAGDALENO', 'ALVARADO', 'RUIZ', 'Maestro', 'DII', NULL),
(27888, 'CLAUDIA ANGELICA', 'ZEPEDA', 'MILANEZ', 'Maestro', 'DII', NULL),
(28023, 'JOSE ROGELIO', 'RAMOS', 'ENRIQUEZ', 'Maestro', 'DII', NULL),
(28047, 'MAXIMINO', 'DORAME', 'VELASQUEZ', 'Maestro', 'DII', NULL),
(28052, 'HERMENEGILDO', 'RIVERA', 'MARTINEZ', 'Maestro', 'DII', NULL),
(28053, 'MARIA DE JESUS', 'RIVERA', 'FLORES', 'Maestro', 'DII', NULL),
(28071, 'FRANCISCA', 'MONGE', 'AMAYA', 'Maestro', 'DII', NULL),
(28095, 'JORGE', 'CHAVEZ', 'ORDUNO', 'Maestro', 'DII', NULL),
(28099, 'JORGE USBALDO', 'FIERROS', 'BOBADILLA', 'Maestro', 'DII', NULL),
(28579, 'FRANCISCA', 'PEDROZA', 'MONTERO', 'Maestro', 'DII', NULL),
(28615, 'ISABEL', 'DORADO', 'AUZ', 'Maestro', 'DII', NULL),
(28883, 'ALEJANDRO', 'VALENZUELA', 'VALENZUELA', 'Maestro', 'DII', NULL),
(28955, 'MARIA MAGDALENA', 'ROMO', 'AYALA', 'Maestro', '', NULL),
(29256, 'JAIME', 'OLEA', 'MIRANDA', 'Maestro', 'DII', NULL),
(29383, 'RENE FRANCISCO', 'NAVARRO', 'HERNANDEZ', 'Maestro', 'DII', NULL),
(29504, 'MYRIAM VIRGINIA', 'MORALES', 'GONZALEZ', 'Maestro', 'DII', NULL),
(29756, 'ANDREA GUADALUPE', 'ZAVALA', 'REYNA', 'Maestro', 'DII', NULL),
(29870, 'CASTRO TERESA', 'DEL', 'CASTILLO', 'Maestro', 'DII', NULL),
(30411, 'JORGE FRANCO', 'ROMERO', 'AGUILAR', 'Maestro', 'DII', NULL),
(30419, 'IVAN DOSTOYEWSKI', 'MEZA', 'IBARRA', 'Maestro', 'DII', NULL),
(30427, 'MIGUEL', 'PORCHAS', 'OROZCO', 'Maestro', 'DII', NULL),
(30428, 'JUAN MARTIN', 'PRECIADO', 'RODRIGUEZ', 'Maestro', 'DII', NULL),
(30481, 'TATLIANA MERCEDES', 'ICEDO', 'ZAMORA', 'Maestro', 'DII', NULL),
(30547, 'FEDERICO MIGUEL', 'CIRETT', 'GALAN', 'Maestro', 'DII', NULL),
(30561, 'MARIA ESMERALDA', 'CARRENO', 'MONTOYA', 'Maestro', 'DII', NULL),
(30645, 'DAINET', 'BERMAN', 'MENDOZA', 'Maestro', 'DII', NULL),
(30656, 'RAMON ALBERTO', 'LUQUE', 'MORALES', 'Maestro', 'DII', NULL),
(30661, 'VICTOR MANUEL', 'HERRERA', 'JIMENEZ', 'Maestro', 'DII', NULL),
(30673, 'RAFAEL', 'CASTILLO', 'ORTEGA', 'Maestro', 'DII', NULL),
(30710, 'MIGUEL ANGEL', 'LOPEZ', 'ARRIQUIVEZ', 'Maestro', 'DII', NULL),
(30729, 'LUIS FERNANDO', 'GARCIA', 'GARCIA', 'Maestro', 'DII', NULL),
(30772, 'DORA EVELIA', 'RODRIGUEZ', 'FELIX', 'Maestro', 'DII', NULL),
(30779, 'JESUS HORACIO', 'PACHECO', 'RAMIREZ', 'Maestro', 'DII', NULL),
(30937, 'RENE ROGELIO', 'DURAND', 'VILLALOBOS', 'Maestro', 'DII', NULL),
(30957, 'TEMISTOCLES', 'MENDIVIL', 'REYNOSO', 'Maestro', '', NULL),
(30968, 'ADRIAN', 'NAVARRO', 'BADILLA', 'Maestro', '', NULL),
(31002, 'ALEX IVAN', 'COTA', 'REMBAU', 'Maestro', 'DII', NULL),
(31082, 'MIGUEL ENRIQUE', 'LOPEZ', 'MUNOZ', 'Maestro', 'DII', NULL),
(31102, 'PATRICIA EUGENIA', 'SORTILLON', 'GONZALEZ', 'Maestro', 'DII', NULL),
(31233, 'JESUS ERIBERTO', 'GRANILLO', 'CONTRERAS', 'Maestro', 'DII', NULL),
(31234, 'ELBA HORTENSIA', 'CRUZ', 'VALENCIA', 'Maestro', 'DII', NULL),
(31366, 'GRACIELA', 'RODRIGUEZ', 'VEGA', 'Maestro', 'DII', NULL),
(31412, 'GUSTAVO JESUS', 'OZUNA', 'HUERTA', 'Maestro', 'DII', NULL),
(31423, 'RAYMUNDO', 'MARTINEZ', 'MONTANO', 'Maestro', 'DII', NULL),
(31442, 'ALVARO ALFONSO', 'VALENZUELA', 'FIGUEROA', 'Maestro', 'DII', NULL),
(31444, 'NUN', 'PITALUA', 'DIAZ', 'Maestro', 'DII', NULL),
(31510, 'ELSY GUADALUPE', 'PARADA', 'RUIZ', 'Maestro', 'DII', NULL),
(31564, 'ADRIAN', 'VAZQUEZ', 'OSORIO', 'Maestro', 'DII', NULL),
(31580, 'DIANA', 'FIGUEROA', 'MARTINEZ', 'Maestro', 'DII', NULL),
(31584, 'FLORES ANED', 'DE', 'LEON', 'Maestro', 'DII', NULL),
(31596, 'VICTOR HUGO', 'BENITEZ', 'BALTAZAR', 'Maestro', 'DII', NULL),
(31624, 'VICTOR RAMON', 'ORANTE', 'BARRON', 'Maestro', 'DII', NULL),
(31853, 'PABLO', 'SOSA', 'FLORES', 'Maestro', 'DII', NULL),
(31906, 'MARIA INES', 'GIL', 'TOLANO', 'Maestro', 'DII', NULL),
(31917, 'JURADO TERESITA', 'DEL', 'RINCON', 'Maestro', 'DII', NULL),
(31929, 'FRANCISCO MIGUEL', 'VELARDE', 'LOPEZ', 'Maestro', 'DII', NULL),
(32037, 'DUPRET ALBERTO', 'SANTANA', 'BEJARANO', 'Maestro', '', NULL),
(32129, 'JOSE LUIS', 'OCHOA', 'HERNANDEZ', 'Maestro', 'DII', NULL),
(32158, 'GERARDO', 'ACOSTA', 'CAPERON', 'Maestro', 'DII', NULL),
(32207, 'LUCIA GUADALUPE', 'ESTRADA', 'LARA', 'Maestro', 'DII', NULL),
(32212, 'VICTOR HUGO', 'LOPEZ', 'VIERA', 'Maestro', 'DII', NULL),
(32243, 'DENNIZ', 'MARQUEZ', 'RUIZ', 'Maestro', '', NULL),
(32335, 'LUIS JUAN', 'ORTIZ', 'VALDIVIA', 'Maestro', 'DII', NULL),
(32389, 'JAVIER', 'MONTANO', 'PERAZA', 'Maestro', '', NULL),
(32431, 'GUADALUPE', 'LOPEZ', 'AVILES', 'Maestro', 'DII', NULL),
(32482, 'ROBERTO', 'AYON', 'MUNGUIA', 'Maestro', 'DII', NULL),
(32486, 'JOSUE ELIAS', 'JUAREZ', 'ONOFRE', 'Maestro', '', NULL),
(32586, 'PAULA CLAUDIA', 'HIRALES', 'AVINA', 'Maestro', '', NULL),
(32590, 'NATHALY', 'MONTOYA', 'CAMACHO', 'Maestro', '', NULL),
(32791, 'JOSE ALFREDO', 'GALAVIZ', 'SANUDO', 'Maestro', 'DII', NULL),
(32812, 'RAUL', 'SANCHEZ', 'ZEFERINO', 'Maestro', 'DII', NULL),
(32985, 'RAQUEL', 'TORRES', 'PERALTA', 'Maestro', 'DII', NULL),
(33080, 'DIANA ELISA', 'RODRIGUEZ', 'SANCHEZ', 'Maestro', '', NULL),
(33111, 'ANTONIO', 'RAMOS', 'CARRAZCO', 'Maestro', 'DII', NULL),
(33121, 'MARGARITA', 'VALENZUELA', 'GALVAN', 'Maestro', 'DII', NULL),
(33125, 'AGUSTIN', 'BRAU', 'AVILA', 'Maestro', 'DII', NULL),
(33138, 'RAMON FRANCISCO', 'DORAME', 'MIRANDA', 'Maestro', '', NULL),
(33142, 'JUDAS TADEO', 'VARGAS', 'DURAZO', 'Maestro', '', NULL),
(33212, 'JAVIER', 'HERNANDEZ', 'PAREDES', 'Maestro', '', NULL),
(33302, 'RICARDO ARTURO', 'PEREZ', 'ENCISO', 'Maestro', 'DII', NULL),
(33369, 'VIRIDIANA', 'LEAL', 'SOTO', 'Maestro', 'DII', NULL),
(33372, 'OBED RICARDO', 'MADRID', 'ZAYAS', 'Maestro', 'DII', NULL),
(33375, 'GENARO', 'HERNANDEZ', 'MADA', 'Maestro', 'DII', NULL),
(33438, 'MARTIN AARON', 'CARRILLO', 'CARRANZA', 'Maestro', 'DII', NULL),
(33522, 'SANDRA ANGELICA', 'URZUA', 'OCHOA', 'Maestro', '', NULL),
(33568, 'SHEYLA DINORAH', 'YANEZ', 'CHACON', 'Maestro', '', NULL),
(33594, 'JOSE HUMBERTO', 'ABRIL', 'GARCIA', 'Maestro', 'DII', NULL),
(34286, 'PEDRO', 'GONZALEZ', 'ZAMORA', 'Maestro', 'DII', NULL),
(34462, 'MERY HELEN', 'PESANTES', 'ESPINOZA', 'Maestro', 'DII', NULL),
(34607, 'AURELIANO', 'CERON', 'FRANCO', 'Maestro', 'DII', NULL),
(34714, 'JESUS DANIEL', 'VALENZUELA', 'SAU', 'Maestro', 'DII', NULL),
(34982, 'REY DAVID', 'ITURRALDE', 'GARCIA', 'Maestro', 'DII', NULL),
(35351, 'FLOR', 'RAMIREZ', 'TORRES', 'Maestro', 'DII', NULL),
(35361, 'JIMENEZ LUIS RENE', 'SAN', 'MARTIN', 'Maestro', 'DII', NULL),
(35500, 'GUILLERMO', 'MARTINEZ', 'CADENA', 'Maestro', 'DII', NULL),
(35501, 'KAROL YESENIA', 'HERNANDEZ', 'GIOTTONINI', 'Maestro', 'DII', NULL),
(35529, 'JUAN CARLOS', 'GRIJALVA', 'ACUNA', 'Maestro', 'DII', NULL),
(35672, 'JESUS ENRIQUE', 'GERARDO', 'RODRIGUEZ', 'Maestro', 'DII', NULL),
(222202156, 'Alex Gabi', 'José', 'José', 'Alumno', NULL, 'ISI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salon`
--

CREATE TABLE `salon` (
  `IDSalon` int(11) NOT NULL,
  `Clave` varchar(50) NOT NULL,
  `Edificio` varchar(50) NOT NULL,
  `Piso` int(11) NOT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `NumLlaves` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `salon`
--

INSERT INTO `salon` (`IDSalon`, `Clave`, `Edificio`, `Piso`, `Tipo`, `NumLlaves`) VALUES
(1, '5K-101', '5K', 1, 'A', 2),
(2, '5K-102', '5K', 1, 'A', 2),
(3, '5K-201', '5K', 2, 'A', 2),
(4, '5K-202', '5K', 2, 'A', 2),
(5, '5K-203', '5K', 2, 'A', 2),
(6, '5K-204', '5K', 2, 'A', 2),
(7, '5K-205', '5K', 2, 'A', 2),
(8, '5K-301', '5K', 3, 'A', 2),
(9, '5K-302', '5K', 3, 'A', 2),
(10, '5K-303', '5K', 3, 'A', 2),
(11, '5K-304', '5K', 3, 'A', 2),
(12, '5K-305', '5K', 3, 'A', 2),
(13, '5M-201', '5M', 2, NULL, 2),
(14, '5M-202', '5M', 2, NULL, 2),
(15, '5M-203', '5M', 2, 'A', 2),
(16, '5M-205', '5M', 2, NULL, 2),
(17, '5M-206', '5M', 2, NULL, 2),
(18, '5G-101', '5G', 1, 'A', 2),
(19, '5G-102', '5G', 1, 'A', 2),
(20, '5G-201', '5G', 2, 'A', 2),
(21, '5G-202', '5G', 2, 'A', 2),
(22, '5G-203', '5G', 2, 'A', 2),
(23, '5G-204', '5G', 2, NULL, 2),
(24, '5G-205', '5G', 2, 'L', 2),
(25, '5G-206', '5G', 2, NULL, 2),
(26, '5O-301', '5O', 3, 'A', 2),
(27, '5O-302', '5O', 3, 'A', 2),
(28, '5O-303', '5O', 3, 'A', 2),
(29, '5O-304', '5O', 3, 'A', 2),
(30, '5O-101', '5O', 1, 'CO', 2),
(31, '5O-101', '5O', 1, 'CO', 2),
(32, '5R-101', '5R', 1, 'L', 2),
(33, '5R-102', '5R', 1, NULL, 2),
(34, '5R-103', '5R', 1, 'A', 2),
(35, '5R-106', '5R', 1, NULL, 2),
(36, '5J-201', '5J', 2, 'CO', 2),
(37, '5J-202', '5J', 2, 'CO', 2),
(38, '5J-203', '5J', 2, 'CO', 2),
(39, '5J-204', '5J', 2, 'CO', 2),
(40, '5J-301', '5J', 3, 'A', 2),
(41, '5J-302', '5J', 3, 'A', 2),
(42, '5J-303', '5J', 3, 'A', 2),
(43, '5J-304', '5J', 3, 'A', 2),
(44, '5J-305', '5J', 3, 'A', 2),
(45, '8B-120', '8B', 1, 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `todospedidos`
--

CREATE TABLE `todospedidos` (
  `IDTodosPedidos` int(11) NOT NULL,
  `IDSalon` int(11) NOT NULL,
  `IDPersonal` int(11) NOT NULL,
  `Objetos` varchar(255) NOT NULL,
  `FechaHoraCreacion` datetime NOT NULL,
  `FechaHoraFinal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `User` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `User`, `Password`) VALUES
(1, 'secretaria', 'pswd123');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pedidosactivos_filtrarnombreyedificio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pedidosactivos_filtrarnombreyedificio` (
`IDPedidosActivo` int(11)
,`IDSalon` int(11)
,`ClaveSalon` varchar(50)
,`IDPersonal` int(11)
,`Nombre` varchar(255)
,`ApellidoPaterno` varchar(255)
,`ApellidoMaterno` varchar(255)
,`Llave` varchar(50)
,`Objetos` varchar(255)
,`FechaHoraCreacion` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pedidosactivos_registroporid`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pedidosactivos_registroporid` (
`IDPedidosActivo` int(11)
,`IDSalon` int(11)
,`IDPersonal` int(11)
,`Llave` varchar(50)
,`Objetos` varchar(255)
,`FechaHoraCreacion` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pedidosactivos_salones_personal`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pedidosactivos_salones_personal` (
`IDPedidosActivo` int(11)
,`IDSalon` int(11)
,`ClaveSalon` varchar(50)
,`IDPersonal` int(11)
,`Nombre` varchar(255)
,`ApellidoPaterno` varchar(255)
,`ApellidoMaterno` varchar(255)
,`Llave` varchar(50)
,`Objetos` varchar(255)
,`FechaHoraCreacion` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_personal_alumnoporclave`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_personal_alumnoporclave` (
`IDPersonal` int(11)
,`Nombre` varchar(255)
,`ApellidoPaterno` varchar(255)
,`ApellidoMaterno` varchar(255)
,`Carrera` varchar(255)
,`Tipo` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_personal_maestroporclave`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_personal_maestroporclave` (
`IDPersonal` int(11)
,`Nombre` varchar(255)
,`ApellidoPaterno` varchar(255)
,`ApellidoMaterno` varchar(255)
,`Departamento` varchar(255)
,`Tipo` varchar(255)
,`Clave` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_personal_verusuarios_y_filtrartipoycarrera`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_personal_verusuarios_y_filtrartipoycarrera` (
`IDPersonal` int(11)
,`Nombre` varchar(255)
,`ApellidoPaterno` varchar(255)
,`ApellidoMaterno` varchar(255)
,`Departamento` varchar(255)
,`Carrera` varchar(255)
,`Tipo` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pedidosactivos_filtrarnombreyedificio`
--
DROP TABLE IF EXISTS `vista_pedidosactivos_filtrarnombreyedificio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pedidosactivos_filtrarnombreyedificio`  AS SELECT `pa`.`IDPedidosactivo` AS `IDPedidosActivo`, `pa`.`IDSalon` AS `IDSalon`, `s`.`Clave` AS `ClaveSalon`, `pa`.`IDPersonal` AS `IDPersonal`, `p`.`Nombre` AS `Nombre`, `p`.`ApellidoPaterno` AS `ApellidoPaterno`, `p`.`ApellidoMaterno` AS `ApellidoMaterno`, `pa`.`Llave` AS `Llave`, `pa`.`Objetos` AS `Objetos`, `pa`.`FechaHoraCreacion` AS `FechaHoraCreacion` FROM ((`pedidosactivos` `pa` join `personal` `p` on(`p`.`IDPersonal` = `pa`.`IDPersonal`)) join `salon` `s` on(`s`.`IDSalon` = `pa`.`IDSalon`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pedidosactivos_registroporid`
--
DROP TABLE IF EXISTS `vista_pedidosactivos_registroporid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pedidosactivos_registroporid`  AS SELECT `pa`.`IDPedidosactivo` AS `IDPedidosActivo`, `pa`.`IDSalon` AS `IDSalon`, `pa`.`IDPersonal` AS `IDPersonal`, `pa`.`Llave` AS `Llave`, `pa`.`Objetos` AS `Objetos`, `pa`.`FechaHoraCreacion` AS `FechaHoraCreacion` FROM `pedidosactivos` AS `pa` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pedidosactivos_salones_personal`
--
DROP TABLE IF EXISTS `vista_pedidosactivos_salones_personal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pedidosactivos_salones_personal`  AS SELECT `pa`.`IDPedidosactivo` AS `IDPedidosActivo`, `pa`.`IDSalon` AS `IDSalon`, `s`.`Clave` AS `ClaveSalon`, `pa`.`IDPersonal` AS `IDPersonal`, `p`.`Nombre` AS `Nombre`, `p`.`ApellidoPaterno` AS `ApellidoPaterno`, `p`.`ApellidoMaterno` AS `ApellidoMaterno`, `pa`.`Llave` AS `Llave`, `pa`.`Objetos` AS `Objetos`, `pa`.`FechaHoraCreacion` AS `FechaHoraCreacion` FROM ((`pedidosactivos` `pa` join `salon` `s` on(`s`.`IDSalon` = `pa`.`IDSalon`)) join `personal` `p` on(`p`.`IDPersonal` = `pa`.`IDPersonal`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_personal_alumnoporclave`
--
DROP TABLE IF EXISTS `vista_personal_alumnoporclave`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_personal_alumnoporclave`  AS SELECT `p`.`IDPersonal` AS `IDPersonal`, `p`.`Nombre` AS `Nombre`, `p`.`ApellidoPaterno` AS `ApellidoPaterno`, `p`.`ApellidoMaterno` AS `ApellidoMaterno`, `p`.`Carrera` AS `Carrera`, `p`.`Tipo` AS `Tipo` FROM `personal` AS `p` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_personal_maestroporclave`
--
DROP TABLE IF EXISTS `vista_personal_maestroporclave`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_personal_maestroporclave`  AS SELECT `p`.`IDPersonal` AS `IDPersonal`, `p`.`Nombre` AS `Nombre`, `p`.`ApellidoPaterno` AS `ApellidoPaterno`, `p`.`ApellidoMaterno` AS `ApellidoMaterno`, `p`.`Departamento` AS `Departamento`, `p`.`Tipo` AS `Tipo`, `s`.`Clave` AS `Clave` FROM ((`personal` `p` left join `horario` `h` on(`h`.`IDPersonal` = `p`.`IDPersonal`)) left join `salon` `s` on(`s`.`IDSalon` = `h`.`IDSalon`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_personal_verusuarios_y_filtrartipoycarrera`
--
DROP TABLE IF EXISTS `vista_personal_verusuarios_y_filtrartipoycarrera`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_personal_verusuarios_y_filtrartipoycarrera`  AS SELECT `p`.`IDPersonal` AS `IDPersonal`, `p`.`Nombre` AS `Nombre`, `p`.`ApellidoPaterno` AS `ApellidoPaterno`, `p`.`ApellidoMaterno` AS `ApellidoMaterno`, `p`.`Departamento` AS `Departamento`, `p`.`Carrera` AS `Carrera`, `p`.`Tipo` AS `Tipo` FROM `personal` AS `p` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`IDHorario`),
  ADD KEY `IDSalon_fk` (`IDSalon`),
  ADD KEY `IDPersonal_fk` (`IDPersonal`);

--
-- Indices de la tabla `pedidosactivos`
--
ALTER TABLE `pedidosactivos`
  ADD PRIMARY KEY (`IDPedidosactivo`),
  ADD KEY `IDSalon_PA_fk` (`IDSalon`),
  ADD KEY `IDPersonal_PA_fk` (`IDPersonal`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`IDPersonal`);

--
-- Indices de la tabla `salon`
--
ALTER TABLE `salon`
  ADD PRIMARY KEY (`IDSalon`);

--
-- Indices de la tabla `todospedidos`
--
ALTER TABLE `todospedidos`
  ADD PRIMARY KEY (`IDTodosPedidos`),
  ADD KEY `IDSalon_TP_fk` (`IDSalon`),
  ADD KEY `IDPersonal_TP_fk` (`IDPersonal`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `IDHorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT de la tabla `pedidosactivos`
--
ALTER TABLE `pedidosactivos`
  MODIFY `IDPedidosactivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `IDPersonal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222202157;

--
-- AUTO_INCREMENT de la tabla `salon`
--
ALTER TABLE `salon`
  MODIFY `IDSalon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `todospedidos`
--
ALTER TABLE `todospedidos`
  MODIFY `IDTodosPedidos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `IDPersonal_fk` FOREIGN KEY (`IDPersonal`) REFERENCES `personal` (`IDPersonal`),
  ADD CONSTRAINT `IDSalon_fk` FOREIGN KEY (`IDSalon`) REFERENCES `salon` (`IDSalon`);

--
-- Filtros para la tabla `pedidosactivos`
--
ALTER TABLE `pedidosactivos`
  ADD CONSTRAINT `IDPersonal_PA_fk` FOREIGN KEY (`IDPersonal`) REFERENCES `personal` (`IDPersonal`),
  ADD CONSTRAINT `IDSalon_PA_fk` FOREIGN KEY (`IDSalon`) REFERENCES `salon` (`IDSalon`);

--
-- Filtros para la tabla `todospedidos`
--
ALTER TABLE `todospedidos`
  ADD CONSTRAINT `IDPersonal_TP_fk` FOREIGN KEY (`IDPersonal`) REFERENCES `personal` (`IDPersonal`),
  ADD CONSTRAINT `IDSalon_TP_fk` FOREIGN KEY (`IDSalon`) REFERENCES `salon` (`IDSalon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

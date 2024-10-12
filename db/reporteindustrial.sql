-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2024 a las 00:18:52
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
  `IDPersonal` int(11) DEFAULT NULL,
  `IDSalon` int(11) DEFAULT NULL,
  `Lunes` varchar(20) DEFAULT NULL,
  `Martes` varchar(20) DEFAULT NULL,
  `Miercoles` varchar(20) DEFAULT NULL,
  `Jueves` varchar(20) DEFAULT NULL,
  `Viernes` varchar(20) DEFAULT NULL,
  `Sabado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`IDHorario`, `IDPersonal`, `IDSalon`, `Lunes`, `Martes`, `Miercoles`, `Jueves`, `Viernes`, `Sabado`) VALUES
(1, 21549, 8, '07:00-08:00', '07:00-08:00', '07:00-08:00', NULL, NULL, NULL),
(2, 24167, 49, '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL, NULL, NULL),
(3, 23313, 6, '07:00-08:00', '07:00-08:00', '07:00-08:00', NULL, NULL, NULL),
(4, 21723, 6, '19:00-20:00', '19:00-20:00', '19:00-20:00', NULL, NULL, NULL),
(5, 26815, 22, '20:00-21:00', '20:00-21:00', '20:00-21:00', NULL, NULL, NULL),
(6, 24468, 22, '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL, NULL, NULL),
(7, 27448, 22, '19:00-20:00', '19:00-20:00', '19:00-20:00', NULL, NULL, NULL),
(8, 27448, 6, '20:00-21:00', '20:00-21:00', '20:00-21:00', NULL, NULL, NULL),
(9, 30509, 42, '07:00-08:00', '07:00-08:00', '07:00-08:00', '07:00-08:00', NULL, NULL),
(10, 30411, 42, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL),
(11, 26837, 36, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL),
(12, 24491, 22, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL),
(13, 30419, 22, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL),
(14, 32400, 6, '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL),
(15, 26837, 36, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL),
(16, 30411, 38, '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL),
(17, 26837, 38, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL),
(18, 31442, 38, '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL),
(19, 31442, 38, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL, NULL),
(20, 31442, 24, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL, NULL),
(21, 29383, 24, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL),
(22, 30547, 24, '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL),
(23, 30419, 24, '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL),
(24, 31082, 24, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL),
(25, 34286, 38, '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL),
(26, 31082, 38, '19:00-20:00', '19:00-20:00', '19:00-20:00', '19:00-20:00', '19:00-20:00', NULL),
(27, 34462, 44, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL, NULL),
(28, 31442, 22, '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL, NULL),
(29, 33594, 38, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL),
(30, 30547, 38, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL),
(31, 33594, 38, '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL),
(32, 30547, 38, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL),
(33, 33594, 24, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL, NULL),
(34, 32985, 2, '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL, NULL, NULL),
(35, 33200, 42, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL, NULL),
(36, 31002, 6, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL, NULL),
(37, 25585, 42, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL, NULL),
(38, 31002, 44, '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL, NULL, NULL),
(39, 34462, 44, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL),
(40, 31516, 44, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL),
(41, 32129, 44, '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL, NULL),
(42, 31442, 44, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL, NULL),
(43, 32129, 6, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL, NULL),
(44, 31516, 44, '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL, NULL),
(45, 33594, 44, '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL, NULL),
(46, 35830, 42, '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL),
(47, 30509, 42, '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL, NULL),
(48, 30411, 44, '19:00-20:00', '19:00-20:00', '19:00-20:00', '19:00-20:00', '19:00-20:00', NULL),
(49, 30411, 44, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL),
(50, 24491, 6, '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL, NULL, NULL),
(51, 32129, 6, '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL),
(52, 29383, 46, '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL),
(53, 35801, 42, '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL),
(54, 31442, 40, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL, NULL),
(55, 32985, 31, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL, NULL),
(56, 35801, 20, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL, NULL),
(57, 31516, 38, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL, NULL),
(58, 21643, 22, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL),
(59, 23548, 22, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL),
(60, 24411, 6, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL),
(61, 33646, 22, '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL),
(62, 32335, 22, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL),
(63, 32335, 6, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL),
(64, 35361, 44, '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL),
(65, 28047, 44, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL),
(66, 35869, 6, '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL),
(67, 30481, 22, '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL, NULL, NULL),
(68, 31423, 6, '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL, NULL, NULL),
(69, 24644, 18, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL, NULL),
(70, 29256, 19, '07:00-08:00', '07:00-08:00', '07:00-08:00', '07:00-08:00', '07:00-08:00', NULL),
(71, 36051, 22, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL),
(72, 30481, 22, '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL),
(73, 32158, 2, '20:00-21:00', '20:00-21:00', '20:00-21:00', '20:00-21:00', NULL, NULL),
(74, 19694, 41, '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL, NULL, NULL),
(75, 35567, 48, '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL, NULL, NULL),
(76, 27413, 21, '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL, NULL),
(77, 24166, 28, '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL, NULL, NULL),
(78, 24166, 41, '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL, NULL),
(79, 26256, 41, '19:00-20:00', '19:00-20:00', '19:00-20:00', NULL, NULL, NULL),
(80, 31596, 19, '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL),
(81, 9801, 37, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL),
(82, 35013, 41, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL),
(83, 30779, 45, '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL),
(84, 34920, 36, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL, NULL),
(85, 36095, 36, '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL, NULL),
(86, 34920, 36, '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL, NULL),
(87, 34607, 36, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL, NULL),
(88, 24308, 31, '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL),
(89, 35351, 21, '19:00-20:00', '19:00-20:00', '19:00-20:00', '19:00-20:00', '19:00-20:00', NULL),
(90, 31853, 21, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL),
(91, 35351, 11, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL),
(92, 30656, 48, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL),
(93, 31233, 5, '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL),
(94, 5594, 31, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL),
(95, 33369, 28, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL),
(96, 35540, 2, '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL, NULL),
(97, 28579, 48, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL, NULL),
(98, 31853, 21, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL),
(99, 35351, 21, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL),
(100, 30481, 21, '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL, NULL),
(101, 35825, 3, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL, NULL),
(102, 26837, 36, '07:00-08:00', '07:00-08:00', '07:00-08:00', '07:00-08:00', '07:00-08:00', NULL),
(103, 30419, 37, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL),
(104, 32212, 48, '13:00-14:00', NULL, NULL, NULL, NULL, NULL),
(105, 33302, 48, '19:00-20:00', NULL, NULL, NULL, NULL, NULL),
(106, 32156, 48, '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL, NULL),
(107, 31853, 48, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL),
(108, 30661, 37, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL),
(109, 9801, 36, '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL),
(110, 30411, 36, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL),
(111, 35020, 41, '11:00-12:00', '11:00-12:00', NULL, NULL, NULL, NULL),
(112, 33111, 41, '16:00-17:00', '16:00-17:00', NULL, NULL, NULL, NULL),
(113, 34256, 41, '14:00-15:00', '14:00-15:00', NULL, NULL, NULL, NULL),
(114, 34049, 45, '07:00-08:00', NULL, NULL, NULL, NULL, NULL),
(115, 30645, 45, '17:00-18:00', NULL, NULL, NULL, NULL, NULL),
(116, 30661, 37, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL),
(117, 30661, 37, '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL),
(118, 35351, 11, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL, NULL),
(119, 31233, 21, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL, NULL),
(120, 31444, 5, '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', '11:00-12:00', NULL),
(121, 34714, 29, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL, NULL),
(122, 35529, 26, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL, NULL),
(123, 34286, 48, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL, NULL),
(124, 31234, 28, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL, NULL),
(125, 35529, 5, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL),
(126, 32212, 45, '11:00-12:00', NULL, NULL, NULL, NULL, NULL),
(127, 34607, 45, '16:00-17:00', NULL, NULL, NULL, NULL, NULL),
(128, 35802, 41, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL, NULL),
(129, 32156, 41, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL, NULL),
(130, 31596, 19, '12:00-13:00', '12:00-13:00', NULL, NULL, NULL, NULL),
(131, 35802, 45, '15:00-16:00', '15:00-16:00', NULL, NULL, NULL, NULL),
(132, 35529, 26, '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL, NULL),
(133, 35802, 36, '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL),
(134, 36044, 41, '07:00-08:00', '07:00-08:00', '07:00-08:00', '07:00-08:00', NULL, NULL),
(135, 28579, 28, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL, NULL),
(136, 28071, 11, '12:00-13:00', '12:00-13:00', '12:00-13:00', '12:00-13:00', NULL, NULL),
(137, 35529, 11, '11:00-12:00', NULL, NULL, NULL, NULL, NULL),
(138, 36049, 45, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL),
(139, 35802, 42, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL),
(140, 30427, 21, '07:00-08:00', NULL, NULL, NULL, NULL, NULL),
(141, 30427, 41, '10:00-11:00', NULL, NULL, NULL, NULL, NULL),
(142, 32208, 28, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL),
(143, 34953, 28, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL),
(144, 31584, 5, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL, NULL),
(145, 35672, 11, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL, NULL),
(146, 30772, 5, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL, NULL),
(147, 29870, 11, '13:00-14:00', '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL),
(148, 22277, 5, '07:00-08:00', '07:00-08:00', '07:00-08:00', '07:00-08:00', '07:00-08:00', NULL),
(149, 23889, 11, '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL),
(150, 22286, 5, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL),
(151, 28052, 11, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL),
(152, 28053, 28, '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL),
(153, 23625, 11, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL),
(154, 28099, 5, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL),
(155, 23625, 11, '07:00-08:00', '07:00-08:00', '07:00-08:00', '07:00-08:00', '07:00-08:00', NULL),
(156, 32167, 5, '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', '14:00-15:00', NULL),
(157, 28071, 5, '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL, NULL, NULL),
(158, 28053, 21, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL),
(159, 23887, 21, '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', '15:00-16:00', NULL),
(160, 25968, 5, '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL, NULL),
(161, 31423, 5, '19:00-20:00', '19:00-20:00', '19:00-20:00', NULL, NULL, NULL),
(162, 35501, 21, '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL),
(163, 35635, 28, '13:00-14:00', '13:00-14:00', '13:00-14:00', NULL, NULL, NULL),
(164, 24308, 3, '10:00-11:00', '10:00-11:00', '10:00-11:00', '10:00-11:00', NULL, NULL),
(165, 32207, 28, '18:00-19:00', '18:00-19:00', '18:00-19:00', '18:00-19:00', NULL, NULL),
(166, 32791, 48, '09:00-10:00', '09:00-10:00', '09:00-10:00', NULL, NULL, NULL),
(167, 27906, 48, '16:00-17:00', '16:00-17:00', '16:00-17:00', NULL, NULL, NULL),
(168, 9801, 41, '08:00-09:00', '08:00-09:00', '08:00-09:00', '08:00-09:00', NULL, NULL),
(169, 31917, 48, '17:00-18:00', '17:00-18:00', '17:00-18:00', '17:00-18:00', NULL, NULL);

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
(5594, 'CARLOS', 'ANAYA', 'EREDIAS', 'Maestro', '', NULL),
(8388, 'GUILLERMO', 'CUAMEA', 'CRUZ', 'Maestro', 'DII', NULL),
(9801, 'CARLOS', 'FIGUEROA', 'NAVARRO', 'Maestro', 'DII', NULL),
(13800, 'ROBERTO RODOLFO', 'MARRUFO', 'PINEDO', 'Maestro', 'DII', NULL),
(13869, 'JOSE LUIS', 'MARTINEZ', 'CASTRO', 'Maestro', 'DII', NULL),
(17710, 'LUIS FELIPE', 'ROMERO', 'DESSENS', 'Maestro', 'DII', NULL),
(19694, 'JOSUE', 'TORRES', 'RAMIREZ', 'Maestro', '', NULL),
(21549, 'JAIME', 'CRUZ', 'LARIOS', 'Maestro', '', NULL),
(21643, 'ROBERTO', 'LEYVA', 'ONTIVEROS', 'Maestro', '', NULL),
(21723, 'FIDENCIO', 'RENTERIA', 'GUTIERREZ', 'Maestro', '', NULL),
(22031, 'GILBERTO', 'ORTIZ', 'SUAREZ', 'Maestro', 'DII', NULL),
(22277, 'AGUSTIN', 'GRIJALVA', 'MONTEVERDE', 'Maestro', '', NULL),
(22286, 'HORACIO', 'LEYVA', 'CASTELLANOS', 'Maestro', '', NULL),
(23025, 'FRANCISCO ALBERTO', 'OROZCO', 'DUENAS', 'Maestro', 'DII', NULL),
(23313, 'ALIPIA', 'AVENDANO', 'ENCISO', 'Maestro', '', NULL),
(23548, 'ISRAEL', 'CONTRERAS', 'ESTRADA', 'Maestro', '', NULL),
(23625, 'MARTIN', 'MANOSALVAS', 'LEYVA', 'Maestro', '', NULL),
(23769, 'MARTIN', 'CHAVEZ', 'MORALES', 'Maestro', 'DII', NULL),
(23887, 'GERMAN', 'CAUDANA', 'CAMACHO', 'Maestro', '', NULL),
(23889, 'BLANCA EVELIA', 'FLORES', 'SOTO', 'Maestro', '', NULL),
(24166, 'RAUL ALFREDO', 'ORTIZ', 'AYALA', 'Maestro', '', NULL),
(24167, 'CONSTANTINO', 'MARTINEZ', 'FABIAN', 'Maestro', '', NULL),
(24308, 'GUADALUPE ARACELI', 'TORRES', 'VALVERDE', 'Maestro', 'DII', NULL),
(24386, 'JESUS', 'MALDONADO', 'CASTRO', 'Maestro', 'DII', NULL),
(24393, 'FELIX', 'MONTANO', 'VALLE', 'Maestro', 'DII', NULL),
(24411, 'REYNALDO', 'FIGUEROA', 'GALINDO', 'Maestro', '', NULL),
(24468, 'ALVARO', 'MARTINEZ', 'URENA', 'Maestro', '', NULL),
(24491, 'MARIO', 'BARCELO', 'VALENZUELA', 'Maestro', 'DII', NULL),
(24644, 'MIGUEL DANIEL', 'SOTO', 'RUIZ', 'Maestro', 'DII', NULL),
(24678, 'YNA MARIA', 'DAVILA', 'RASCON', 'Maestro', 'DII', NULL),
(25064, 'GONZALO', 'MOROYOQUI', 'ESTRELLA', 'Maestro', 'DII', NULL),
(25585, 'ALONSO', 'PEREZ', 'SOLTERO', 'Maestro', 'DII', NULL),
(25960, 'ALFREDO', 'ORTIZ', 'ESTARDANTE', 'Maestro', 'DII', NULL),
(25963, 'LUIS EDUARDO', 'VELAZQUEZ', 'CONTRERAS', 'Maestro', 'DII', NULL),
(25968, 'CONSUELO', 'MORA', 'CASTELLANOS', 'Maestro', 'DII', NULL),
(26256, 'MARTINA', 'SOTO', 'MORALES', 'Maestro', '', NULL),
(26815, 'MARIA', 'QUIROZ', 'CINCO', 'Maestro', '', NULL),
(26837, 'VICTOR HUGO', 'SAPIEN', 'CHAVEZ', 'Maestro', 'DII', NULL),
(26848, 'NORA ELBA', 'MUNGUIA', 'VEGA', 'Maestro', 'DII', NULL),
(27413, 'JUANA ELIA', 'MANJARREZ', 'JIMENEZ', 'Maestro', '', NULL),
(27448, 'LUIS ALBERTO', 'VALENZUELA', 'JACOBO', 'Maestro', '', NULL),
(27460, 'CARLOS ARMANDO', 'YOCUPICIO', 'CASTRO', 'Maestro', 'DII', NULL),
(27521, 'JAIME ALFONSO', 'LEON', 'DUARTE', 'Maestro', 'DII', NULL),
(27665, 'MIRNA ELIA', 'AGUAYO', 'SALINAS', 'Maestro', 'DII', NULL),
(27771, 'JOSE MAGDALENO', 'ALVARADO', 'RUIZ', 'Maestro', 'DII', NULL),
(27906, 'NORA CLAUDIA', 'SANDOVAL', 'INDA', 'Maestro', '', NULL),
(28047, 'MAXIMINO', 'DORAME', 'VELASQUEZ', 'Maestro', '', NULL),
(28052, 'HERMENEGILDO', 'RIVERA', 'MARTINEZ', 'Maestro', '', NULL),
(28053, 'MARIA', 'RIVERA', 'FLORES', 'Maestro', '', NULL),
(28071, 'FRANCISCA', 'MONGE', 'AMAYA', 'Maestro', 'DII', NULL),
(28099, 'JORGE USBALDO', 'FIERROS', 'BOBADILLA', 'Maestro', '', NULL),
(28341, 'JAVIER', 'ESQUER', 'PERALTA', 'Maestro', 'DII', NULL),
(28412, 'LA', 'SERVIN', 'DE', 'Maestro', 'DII', NULL),
(28579, 'FRANCISCA', 'PEDROZA', 'MONTERO', 'Maestro', 'DII', NULL),
(28883, 'ALEJANDRO', 'VALENZUELA', 'VALENZUELA', 'Maestro', 'DII', NULL),
(28955, 'MARIA MAGDALENA', 'ROMO', 'AYALA', 'Maestro', 'DII', NULL),
(29256, 'JAIME', 'OLEA', 'MIRANDA', 'Maestro', 'DII', NULL),
(29383, 'RENE FRANCISCO', 'NAVARRO', 'HERNANDEZ', 'Maestro', 'DII', NULL),
(29384, 'MARIA ELENA', 'ANAYA', 'PEREZ', 'Maestro', 'DII', NULL),
(29428, 'ANGEL BENJAMIN', 'GUTIERREZ', 'CURENO', 'Maestro', 'DII', NULL),
(29756, 'ANDREA GUADALUPE', 'ZAVALA', 'REYNA', 'Maestro', 'DII', NULL),
(29870, 'CASTRO TERESA', 'DEL', 'CASTILLO', 'Maestro', '', NULL),
(30082, 'ALMA ANGELINA', 'AYALA', 'MORENO', 'Maestro', 'DII', NULL),
(30411, 'JORGE FRANCO', 'ROMERO', 'AGUILAR', 'Maestro', 'DII', NULL),
(30419, 'IVAN DOSTOYEWSKI', 'MEZA', 'IBARRA', 'Maestro', 'DII', NULL),
(30427, 'MIGUEL', 'PORCHAS', 'OROZCO', 'Maestro', 'DII', NULL),
(30428, 'JUAN MARTIN', 'PRECIADO', 'RODRIGUEZ', 'Maestro', 'DII', NULL),
(30481, 'TATLIANA MERCEDES', 'ICEDO', 'ZAMORA', 'Maestro', 'DII', NULL),
(30509, 'LEV DAVID', 'VALENZUELA', 'LOPEZ', 'Maestro', 'DII', NULL),
(30547, 'FEDERICO MIGUEL', 'CIRETT', 'GALAN', 'Maestro', 'DII', NULL),
(30645, 'DAINET', 'BERMAN', 'MENDOZA', 'Maestro', '', NULL),
(30656, 'RAMON ALBERTO', 'LUQUE', 'MORALES', 'Maestro', 'DII', NULL),
(30661, 'VICTOR MANUEL', 'HERRERA', 'JIMENEZ', 'Maestro', 'DII', NULL),
(30673, 'RAFAEL', 'CASTILLO', 'ORTEGA', 'Maestro', 'DII', NULL),
(30710, 'MIGUEL ANGEL', 'LOPEZ', 'ARRIQUIVEZ', 'Maestro', 'DII', NULL),
(30729, 'LUIS FERNANDO', 'GARCIA', 'GARCIA', 'Maestro', 'DII', NULL),
(30772, 'DORA EVELIA', 'RODRIGUEZ', 'FELIX', 'Maestro', '', NULL),
(30779, 'JESUS HORACIO', 'PACHECO', 'RAMIREZ', 'Maestro', 'DII', NULL),
(30937, 'RENE ROGELIO', 'DURAND', 'VILLALOBOS', 'Maestro', 'DII', NULL),
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
(31479, 'RODOLFO', 'PEON', 'ANAYA', 'Maestro', 'DII', NULL),
(31510, 'ELSY GUADALUPE', 'PARADA', 'RUIZ', 'Maestro', 'DII', NULL),
(31516, 'EDUARDO', 'BOJORQUEZ', 'MARTINEZ', 'Maestro', 'DII', NULL),
(31580, 'DIANA', 'FIGUEROA', 'MARTINEZ', 'Maestro', 'DII', NULL),
(31584, 'FLORES ANED', 'DE', 'LEON', 'Maestro', '', NULL),
(31596, 'VICTOR HUGO', 'BENITEZ', 'BALTAZAR', 'Maestro', 'DII', NULL),
(31853, 'PABLO', 'SOSA', 'FLORES', 'Maestro', 'DII', NULL),
(31917, 'JURADO TERESITA', 'DEL', 'RINCON', 'Maestro', 'DII', NULL),
(32129, 'JOSE LUIS', 'OCHOA', 'HERNANDEZ', 'Maestro', 'DII', NULL),
(32143, 'JOSE JESUS', 'VIDAL', 'CORDOVA', 'Maestro', 'DII', NULL),
(32156, 'CUITLAHUAC', 'IRIARTE', 'CORNEJO', 'Maestro', 'DII', NULL),
(32158, 'GERARDO', 'ACOSTA', 'CAPERON', 'Maestro', 'DII', NULL),
(32167, 'OSCAR ALBERTO', 'TANAHARA', 'ROMERO', 'Maestro', '', NULL),
(32207, 'LUCIA GUADALUPE', 'ESTRADA', 'LARA', 'Maestro', 'DII', NULL),
(32208, 'JUAN ANDRES', 'CASTILLO', 'VALENZUELA', 'Maestro', '', NULL),
(32212, 'VICTOR HUGO', 'LOPEZ', 'VIERA', 'Maestro', 'DII', NULL),
(32335, 'LUIS JUAN', 'ORTIZ', 'VALDIVIA', 'Maestro', '', NULL),
(32400, 'IVAN ALEJANDRO', 'CHAVEZ', 'MORALES', 'Maestro', 'DII', NULL),
(32482, 'ROBERTO', 'AYON', 'MUNGUIA', 'Maestro', 'DII', NULL),
(32791, 'JOSE ALFREDO', 'GALAVIZ', 'SANUDO', 'Maestro', '', NULL),
(32985, 'RAQUEL', 'TORRES', 'PERALTA', 'Maestro', 'DII', NULL),
(33111, 'ANTONIO', 'RAMOS', 'CARRAZCO', 'Maestro', '', NULL),
(33121, 'MARGARITA', 'VALENZUELA', 'GALVAN', 'Maestro', 'DII', NULL),
(33125, 'AGUSTIN', 'BRAU', 'AVILA', 'Maestro', 'DII', NULL),
(33171, 'DAVID SLIM', 'ZEPEDA', 'QUINTANA', 'Maestro', 'DII', NULL),
(33200, 'JESUS LEONEL', 'GOMEZ', 'PALOMARES', 'Maestro', 'DII', NULL),
(33285, 'ANAHI', 'LUQUE', 'ACUNA', 'Maestro', 'DII', NULL),
(33302, 'RICARDO ARTURO', 'PEREZ', 'ENCISO', 'Maestro', 'DII', NULL),
(33369, 'VIRIDIANA', 'LEAL', 'SOTO', 'Maestro', 'DII', NULL),
(33372, 'OBED RICARDO', 'MADRID', 'ZAYAS', 'Maestro', 'DII', NULL),
(33508, 'HECTOR MANUEL', 'GUZMAN', 'GRIJALVA', 'Maestro', 'DII', NULL),
(33593, 'JESUS MANUEL', 'ESPINOZA', 'SANDOVAL', 'Maestro', 'DII', NULL),
(33594, 'JOSE HUMBERTO', 'ABRIL', 'GARCIA', 'Maestro', 'DII', NULL),
(33646, 'RICARDO ANDRES', 'BRITTO', 'HURTADO', 'Maestro', '', NULL),
(33965, 'VIRGILIO', 'LIZARRAGA', 'MORALES', 'Maestro', 'DII', NULL),
(34049, 'AMED', 'GALLEGOS', 'TABANICO', 'Maestro', '', NULL),
(34256, 'FRANCISCO JAVIER', 'ARIZAGA', 'AYALA', 'Maestro', '', NULL),
(34286, 'PEDRO', 'GONZALEZ', 'ZAMORA', 'Maestro', 'DII', NULL),
(34404, 'ALMA GABRIELA', 'PULGARIN', 'HERRERA', 'Maestro', 'DII', NULL),
(34462, 'MERY HELEN', 'PESANTES', 'ESPINOZA', 'Maestro', 'DII', NULL),
(34607, 'AURELIANO', 'CERON', 'FRANCO', 'Maestro', 'DII', NULL),
(34637, 'ALEJANDRO', 'GOMEZ', 'CARDENAS', 'Maestro', 'DII', NULL),
(34684, 'JUAN CARLOS', 'ROLDAN', 'SANCHEZ', 'Maestro', 'DII', NULL),
(34714, 'JESUS DANIEL', 'VALENZUELA', 'SAU', 'Maestro', '', NULL),
(34836, 'ESTEBAN', 'PICAZZO', 'PALENCIA', 'Maestro', 'DII', NULL),
(34899, 'JESUS SALVADOR', 'GUTIERREZ', 'RUELAS', 'Maestro', 'DII', NULL),
(34900, 'MAAT YERED', 'OCHOA', 'CANTON', 'Maestro', 'DII', NULL),
(34920, 'ALAN GERMAN', 'ACEDO', 'MENDOZA', 'Maestro', '', NULL),
(34953, 'DANIEL', 'RUBAL', 'VALENCIA', 'Maestro', '', NULL),
(34999, 'JOSE DIEGO', 'GOMEZ', 'MADRID', 'Maestro', 'DII', NULL),
(35013, 'GERARDO', 'VALENZUELA', 'HERNANDEZ', 'Maestro', '', NULL),
(35020, 'FRANCISCO RAFAEL', 'BERRELLEZ', 'REYES', 'Maestro', '', NULL),
(35351, 'FLOR', 'RAMIREZ', 'TORRES', 'Maestro', 'DII', NULL),
(35361, 'JIMENEZ', 'SAN', 'MARTIN', 'Maestro', '', NULL),
(35500, 'GUILLERMO', 'MARTINEZ', 'CADENA', 'Maestro', 'DII', NULL),
(35501, 'KAROL YESENIA', 'HERNANDEZ', 'GIOTTONINI', 'Maestro', '', NULL),
(35529, 'JUAN CARLOS', 'GRIJALVA', 'ACUNA', 'Maestro', 'DII', NULL),
(35540, 'PATRICIA', 'SALCIDO', 'ESCOBAR', 'Maestro', 'DII', NULL),
(35566, 'JESUS ANTONIO', 'MALDONADO', 'ARRIOLA', 'Maestro', 'DII', NULL),
(35567, 'BRENDA MONSERRATH', 'PARTIDA', 'GAXIOLA', 'Maestro', '', NULL),
(35579, 'FERNANDO', 'MADERO', 'CASTILLO', 'Maestro', 'DII', NULL),
(35635, 'JUAN MIGUEL', 'CASTELLANOS', 'JARAMILLO', 'Maestro', '', NULL),
(35672, 'JESUS ENRIQUE', 'GERARDO', 'RODRIGUEZ', 'Maestro', '', NULL),
(35740, 'JOSE ALEJANDRO', 'GUERENA', 'ZAMORANO', 'Maestro', 'DII', NULL),
(35801, 'DENNIS OSWALDO', 'SAENZ', 'HERNANDEZ', 'Maestro', 'DII', NULL),
(35802, 'DAVID RAFAEL', 'VIDAL', 'CORONA', 'Maestro', 'DII', NULL),
(35804, 'CARLOS', 'VALDEZ', 'AGUILAR', 'Maestro', 'DII', NULL),
(35808, 'VICTOR MANUEL', 'ENCISO', 'ROJAS', 'Maestro', 'DII', NULL),
(35825, 'CLAUDIA PAULINA', 'SOTO', 'MORA', 'Maestro', 'DII', NULL),
(35829, 'MARIA FERNANDA', 'QUINTANA', 'LAGARDA', 'Maestro', 'DII', NULL),
(35830, 'JOSE LUIS', 'AGUILERA', 'LUZANIA', 'Maestro', 'DII', NULL),
(35869, 'ZUBELDA GUADALUPE', 'SANDERS', 'GUTIERREZ', 'Maestro', '', NULL),
(36043, 'JOSE ANTONIO', 'BERNAL', 'LOPEZ', 'Maestro', 'DII', NULL),
(36044, 'ALEXIA ISABEL', 'CARRAZCO', 'SANCHEZ', 'Maestro', 'DII', NULL),
(36049, 'HUMBERTO', 'ANGULO', 'COSIOS', 'Maestro', 'DII', NULL),
(36050, 'DAVID ALEJANDRO', 'PALACIOS', 'GOMEZ', 'Maestro', 'DII', NULL),
(36051, 'CARLOS', 'OLVERA', 'FELIX', 'Maestro', 'DII', NULL),
(36053, 'CLAUDIA PATRICIA', 'ROMERO', 'ROUNTREE', 'Maestro', 'DII', NULL),
(36054, 'DANIEL GUILLERMO', 'RAMIREZ', 'ZABALETA', 'Maestro', 'DII', NULL),
(36063, 'CAROLINA', 'LUGO', 'ZUNIGA', 'Maestro', 'DII', NULL),
(36095, 'ANGEL ISAAC', 'SEPULVEDA', 'MARRON', 'Maestro', 'DII', NULL),
(222202156, 'Alex Gabi', 'Jose', 'Jose', 'Alumno', '', 'ISI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salon`
--

CREATE TABLE `salon` (
  `IDSalon` int(11) NOT NULL,
  `Clave` varchar(100) NOT NULL,
  `Edificio` varchar(50) NOT NULL,
  `Piso` int(11) DEFAULT NULL,
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
(30, '5-O', '5O', 1, 'CO', 2),
(31, '5O-101', '5O', 1, 'CO', 2),
(32, '5R-101', '5R', 1, 'L', 2),
(33, '5R-102', '5R', 1, NULL, 2),
(34, '5R-103', '5R', 1, 'A', 2),
(35, '5R-104', '5R', 1, NULL, 2),
(36, '5J-201', '5J', 2, 'CO', 2),
(37, '5J-202', '5J', 2, 'CO', 2),
(38, '5J-203', '5J', 2, 'CO', 2),
(39, '5J-204', '5J', 2, 'CO', 2),
(40, '5J-301', '5J', 3, 'A', 2),
(41, '5J-302', '5J', 3, 'A', 2),
(42, '5J-303', '5J', 3, 'A', 2),
(43, '5J-304', '5J', 3, 'A', 2),
(44, '5J-305', '5J', 3, 'A', 2),
(45, '8B-120', '8B', 1, 'A', 2),
(46, '5G-301', '5G', NULL, NULL, 2),
(47, '5G-302', '5G', NULL, NULL, 2),
(48, '5G-303', '5G', NULL, NULL, 2),
(49, '5G-304', '5G', NULL, NULL, 2),
(50, '5G-305', '5G', NULL, NULL, 2),
(51, '5J-Auditorio Gustavo Figueroa', '5J', NULL, NULL, 2),
(52, '8B-Metrologia', '8B', NULL, NULL, 2),
(53, '8D-Inyeccion de Plastico', '8D', NULL, NULL, 2),
(54, '8D-Mecatronica Basica', '8D', NULL, NULL, 2),
(55, '8D-Mecatronica Avanzada', '8D', NULL, NULL, 2),
(56, '8D-Mecatronica Mtros', '8D', NULL, NULL, 2),
(57, '8D-Ing Electrica', '8D', NULL, NULL, 2),
(58, '8D-Manufactura', '8D', NULL, NULL, 2),
(59, '8D-Robotica', '8D', NULL, NULL, 2),
(60, '8D-Area de instrumentacion', '8D', NULL, NULL, 2),
(61, '8D-Lab Soldadura', '8D', NULL, NULL, 2),
(62, '5G-CSTI', '5G', NULL, NULL, 2),
(63, '5J-Sala Lozano Taylor', '5J', NULL, NULL, 2),
(64, '5R-Enrutadores', '5R', NULL, NULL, 2);

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
,`ClaveSalon` varchar(100)
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
,`ClaveSalon` varchar(100)
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
,`Clave` varchar(100)
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
  ADD KEY `IDPersonal` (`IDPersonal`),
  ADD KEY `IDSalon` (`IDSalon`);

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
  MODIFY `IDHorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT de la tabla `pedidosactivos`
--
ALTER TABLE `pedidosactivos`
  MODIFY `IDPedidosactivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salon`
--
ALTER TABLE `salon`
  MODIFY `IDSalon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

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
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`IDPersonal`) REFERENCES `personal` (`IDPersonal`),
  ADD CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`IDSalon`) REFERENCES `salon` (`IDSalon`);

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

-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2021 a las 17:48:30
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pagoscolegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branch`
--

CREATE TABLE `branch` (
  `id` int(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `detail` text NOT NULL,
  `delete_status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `branch`
--

INSERT INTO `branch` (`id`, `branch`, `address`, `detail`, `delete_status`) VALUES
(1, 'Banco Falabella', 'Calle 54 N 35 23', 'Excelente banco no cobra por cuota de manejo ni por sacar el dinero de cajeros automáticos.', '1'),
(2, 'Banco Colpatria', 'Calle 88 N 123 - 12', 'Excelente bancos, tampoco cobra cuota de manejo, ni por sacar dinero de sus cajero automáticos.', '1'),
(6, 'Bancolombia', 'Calle 34 N 18 - 14', 'Es el banco que tiene más personas en Colombia, tiene cajeros y sucursales en todas partes, pero tiene cargos en sus cuentas, por movimientos y por cuota de manejo.', '1'),
(7, 'Banco TuBanco', 'example calle example', 'pago de colegiaturas', '0'),
(8, 'Banco Mexico', 'ejemplo', 'hgjhgjh', '1'),
(9, 'Banco Mex', 'dirección de ejemplo', 'banco para el pago de colegiaturas', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fees_transaction`
--

CREATE TABLE `fees_transaction` (
  `id` int(255) NOT NULL,
  `stdid` varchar(255) NOT NULL,
  `paid` int(255) NOT NULL,
  `submitdate` datetime NOT NULL,
  `transcation_remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fees_transaction`
--

INSERT INTO `fees_transaction` (`id`, `stdid`, `paid`, `submitdate`, `transcation_remark`) VALUES
(11, '10', 100000, '2020-08-20 00:00:00', 'Estudiante Generado para posible intercambio con colegio Alemán'),
(12, '10', 100000, '2020-08-20 00:00:00', 'Pagado por adelantado'),
(13, '10', 100000, '2020-08-20 00:00:00', 'Pago adelantado'),
(14, '11', 0, '2020-08-21 00:00:00', 'En la semana que viene el estudiante promete realizar el primer pago.'),
(15, '11', 120000, '2020-08-21 00:00:00', 'Pudo realizar el pago antes de lo acordado.'),
(16, '12', 0, '2021-11-01 00:00:00', 'falta de pago'),
(17, '12', 500, '2021-10-31 00:00:00', 'ninguna'),
(18, '12', 500, '2021-11-09 00:00:00', ''),
(19, '13', 500, '2021-11-30 00:00:00', 'debe 1000 pesos'),
(20, '13', 500, '2021-11-10 00:00:00', 'abonó 500 pesos'),
(21, '13', 500, '2021-11-21 00:00:00', 'abonó últimos 500 pesos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

CREATE TABLE `student` (
  `id` int(255) NOT NULL,
  `emailid` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `joindate` datetime NOT NULL,
  `about` text NOT NULL,
  `contact` varchar(255) NOT NULL,
  `fees` int(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `balance` int(255) NOT NULL,
  `delete_status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `student`
--

INSERT INTO `student` (`id`, `emailid`, `sname`, `joindate`, `about`, `contact`, `fees`, `branch`, `balance`, `delete_status`) VALUES
(10, 'rpelaez@cweb.com', 'Roberto Pelaez', '2020-08-20 00:00:00', 'Excelente estudiante recomendado', '3162345871', 1000000, '2', 700000, '1'),
(11, 'fmendoza@cweb.com', 'Francisco Mendoza', '2020-08-21 00:00:00', 'Estudiante es migrado de otro colegio, noticias excelentes.', '3154678143', 1200000, '1', 1080000, '1'),
(12, 'exam\'ple@example.com', 'Daniel Morales', '2021-11-01 00:00:00', 'grupo A', '64645465', 1000, '7', 0, '0'),
(13, 'example@example.com', 'nuevo estudiante', '2021-11-30 00:00:00', 'inscrito en el grupo de 5A', '8565446', 1500, '9', 0, '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `emailid` varchar(255) NOT NULL,
  `lastlogin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `emailid`, `lastlogin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'ConfiguroWeb', 'hola@cweb.com', '0000-00-00 00:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fees_transaction`
--
ALTER TABLE `fees_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `fees_transaction`
--
ALTER TABLE `fees_transaction`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `student`
--
ALTER TABLE `student`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

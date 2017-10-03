-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2017 a las 14:54:32
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `integracion1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodegas`
--

CREATE TABLE `bodegas` (
  `ID_B` int(11) NOT NULL,
  `Nombre_Bodega` varchar(15) NOT NULL,
  `Pais_Bodega` varchar(15) NOT NULL,
  `Ciudad_Bodega` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bodegas`
--

INSERT INTO `bodegas` (`ID_B`, `Nombre_Bodega`, `Pais_Bodega`, `Ciudad_Bodega`) VALUES
(1, 'Bodega I CH', 'Chile', 'Santiago'),
(2, 'Bodega II ARG', 'Chile', 'Concepcion'),
(3, 'Bodega III COL', 'Chile', 'Osorno'),
(4, 'Bodega IV URU', 'Chile ', 'Temuco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricas`
--

CREATE TABLE `fabricas` (
  `ID_F` int(11) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Pais` varchar(15) NOT NULL,
  `Ciudad` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fabricas`
--

INSERT INTO `fabricas` (`ID_F`, `Nombre`, `Pais`, `Ciudad`) VALUES
(1, 'Intel', 'Estados Unidos', 'Santa Clara'),
(2, 'AMD', 'Estados Unidos', 'Sunnyvale'),
(3, 'NVIDIA', 'Estados Unidos', 'Santa Clara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

CREATE TABLE `seguimiento` (
  `ID_S` int(11) NOT NULL,
  `ID_P` int(11) NOT NULL,
  `Producto` varchar(60) NOT NULL,
  `Ubicaciones` varchar(100) NOT NULL,
  `Transporte` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `ID_P` int(11) NOT NULL,
  `ID_B` int(11) NOT NULL,
  `ID_F` int(11) NOT NULL,
  `Producto` varchar(60) NOT NULL,
  `Clasificacion` varchar(15) NOT NULL,
  `Cantidad` int(15) NOT NULL,
  `Transporte` varchar(50) NOT NULL,
  `Fecha_llegada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`ID_P`, `ID_B`, `ID_F`, `Producto`, `Clasificacion`, `Cantidad`, `Transporte`, `Fecha_llegada`) VALUES
(10, 1, 1, 'Intel® Core™ i7-7700K Processor', 'Procesador', 50, 'Tren', '2017-09-08'),
(11, 1, 2, 'AMD Ryzen 5 1400', 'Procesador', 20, 'Avion', '2017-09-30'),
(12, 1, 1, 'Intel® Core™ i7-6700K Processor', 'Procesador', 15, 'Tren', '2017-10-19'),
(13, 1, 2, 'AMD Ryzen Threadripper 1920X', 'Procesador', 25, 'Avion', '2017-10-01'),
(100, 3, 3, 'GeForce® GTX 1080 Ti', 'Tarjeta Video', 5, 'Tren', '2017-09-15'),
(101, 3, 3, 'GeForce® GTX 1050 Ti', 'Tarjeta Video', 15, 'Avion', '2017-08-01'),
(1000, 2, 1, 'SSD Intel® serie 750', 'SSD', 105, 'Camion', '2017-09-06'),
(1001, 2, 2, 'Radeon ™ R3 120G SSD', 'SSD', 75, 'Camion', '2017-09-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `usuario`, `password`) VALUES
(1, 'gato', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD PRIMARY KEY (`ID_B`);

--
-- Indices de la tabla `fabricas`
--
ALTER TABLE `fabricas`
  ADD PRIMARY KEY (`ID_F`);

--
-- Indices de la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD PRIMARY KEY (`ID_S`),
  ADD KEY `ID_P` (`ID_P`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`ID_P`),
  ADD KEY `ID_B` (`ID_B`),
  ADD KEY `ID_F` (`ID_F`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  MODIFY `ID_B` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `fabricas`
--
ALTER TABLE `fabricas`
  MODIFY `ID_F` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  MODIFY `ID_S` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `ID_P` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD CONSTRAINT `seguimiento_ibfk_1` FOREIGN KEY (`ID_P`) REFERENCES `stock` (`ID_P`);

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`ID_B`) REFERENCES `bodegas` (`ID_B`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`ID_F`) REFERENCES `fabricas` (`ID_F`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

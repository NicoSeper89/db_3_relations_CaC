-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2023 a las 17:09:40
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_3_relations`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellido`) VALUES
('12254684', 'Martin', 'Santillán'),
('15128752', 'Maria Belen', 'Castro'),
('16416557', 'Mariano', 'Garcia'),
('19245384', 'Nicolás', 'Farias'),
('25485247', 'Fernando', 'Gutierrez'),
('28642783', 'Julia', 'Soria'),
('30125887', 'Facundo', 'Perez'),
('34744617', 'Nicolás', 'Sepertino'),
('36335773', 'Rodrigo', 'Gallardo'),
('38542315', 'Tomas', 'Fabiani');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `concepto` varchar(20) NOT NULL,
  `clientes_dni` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `concepto`, `clientes_dni`) VALUES
(1, 'lácteos', '34744617'),
(2, 'panaderia', '19245384'),
(3, 'frutas', '25485247'),
(4, 'lácteos', '30125887'),
(5, 'lácteos', '38542315'),
(6, 'frescos', '36335773'),
(7, 'saludables', '16416557'),
(8, 'frescos', '15128752'),
(9, 'dulces', '12254684'),
(10, 'bebidas', '28642783');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompras`
--

CREATE TABLE `lineascompras` (
  `numero` int(20) NOT NULL,
  `compras_id` int(11) NOT NULL,
  `productos` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineascompras`
--

INSERT INTO `lineascompras` (`numero`, `compras_id`, `productos`, `importe`) VALUES
(1, 1, 'leche', 2.5),
(2, 2, 'pan', 1.8),
(3, 3, 'manzanas', 5),
(4, 4, 'queso', 3.2),
(5, 5, 'yogur', 2),
(6, 6, 'huevos', 4.5),
(7, 7, 'cereal', 3.7),
(8, 8, 'pasta', 1.5),
(9, 9, 'galletas', 2.8),
(10, 10, 'agua', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_dni` (`clientes_dni`);

--
-- Indices de la tabla `lineascompras`
--
ALTER TABLE `lineascompras`
  ADD PRIMARY KEY (`numero`,`compras_id`),
  ADD KEY `compras_id` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `compras` (`clientes_dni`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id`) REFERENCES `lineascompras` (`compras_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

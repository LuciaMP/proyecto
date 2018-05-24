-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2018 a las 17:52:29
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `IDCOMENTARIO` int(4) NOT NULL,
  `IDJUEGO` int(4) NOT NULL,
  `IDUSUARIO` int(4) NOT NULL,
  `COMENTARIO` text NOT NULL,
  `FECHA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `IDJUEGO` int(4) NOT NULL,
  `NOMBRE` varchar(40) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `VOTOS` int(4) NOT NULL,
  `PUNTUACION` int(6) NOT NULL,
  `NOTA` int(2) NOT NULL,
  `CARATULA` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`IDJUEGO`, `NOMBRE`, `DESCRIPCION`, `VOTOS`, `PUNTUACION`, `NOTA`, `CARATULA`) VALUES
(1, 'Mario Kart', 'Prueba', 4, 8, 10, 'media/caratulas/1.png'),
(2, 'Medievil', 'Prueba', 2, 7, 9, '2.jpg'),
(3, 'Fire Emblem Awakening', 'Prueba', 5, 9, 10, '3.jpg'),
(4, 'Fire Emblem Fates', 'Prueba', 4, 9, 8, '4.jpg'),
(5, 'Fire Emblem Echoes', 'Prueba', 9, 5, 9, '5.jpg'),
(6, 'Nioh', 'Prueba', 6, 7, 7, '6.jpg'),
(7, 'Crash Bandicoot', 'Prueba', 3, 6, 7, '7.jpg'),
(8, 'Final Fantasy XV', 'Prueba', 1, 6, 8, '8.jpg'),
(9, 'Injustice 2', 'Prueba', 1, 5, 5, '9.jpg'),
(10, 'Nier Automata', 'Prueba', 11, 10, 10, '10.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `IDMENSAJE` int(4) NOT NULL,
  `ASUNTO` varchar(20) NOT NULL,
  `EMISOR` int(4) NOT NULL,
  `RECEPTOR` int(4) NOT NULL,
  `MENSAJE` text NOT NULL,
  `HILO` int(4) NOT NULL,
  `FECHA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`IDMENSAJE`, `ASUNTO`, `EMISOR`, `RECEPTOR`, `MENSAJE`, `HILO`, `FECHA`) VALUES
(28, 'Prueba', 3, 2, 'Hola', 1, '2018-05-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `IDNOVEDAD` int(4) NOT NULL,
  `TITULO` varchar(40) NOT NULL,
  `CONTENIDO` text NOT NULL,
  `IMAGEN` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`IDNOVEDAD`, `TITULO`, `CONTENIDO`, `IMAGEN`) VALUES
(1, 'Novedad1', 'Prueba', '1.jpg'),
(2, 'Novedad2', 'Prueba', '2.jpg'),
(3, 'Novedad3', 'Prueba', '3.jpg'),
(4, 'Novedad4', 'Prueba', '4.jpg'),
(5, 'Novedad5', 'Prueba', '5.jpg'),
(6, 'Novedad6', 'Prueba', '6.jpg'),
(7, 'Novedad7', 'Prueba', '7.jpg'),
(8, 'Novedad8', 'Prueba', '8.jpg'),
(9, 'Novedad9', 'Prueba', '9.jpg'),
(10, 'Novedad10', 'Prueba', '10.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IDUSUARIO` int(4) NOT NULL,
  `NICK` varchar(20) NOT NULL,
  `PASSWORD` varchar(16) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `FECHAN` date NOT NULL,
  `SEXO` varchar(1) NOT NULL,
  `CIUDAD` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IDUSUARIO`, `NICK`, `PASSWORD`, `EMAIL`, `FECHAN`, `SEXO`, `CIUDAD`) VALUES
(1, 'prueba01@localhost', 'Prueba_01', 'prueba01@gmail.com', '2005-12-31', 'f', 'barcelona'),
(2, 'yangschnee@localhost', 'Shin_jimin1', 'lucia.martinezpimentel@gmail.com', '1998-03-10', 'f', 'madrid'),
(3, 'juanmad1@localhost', 'Juanmad_1', 'juanmad1@gmail.com', '1995-07-17', 'm', 'madrid'),
(4, 'prueba2@localhost', 'Prueba_2', 'prueba2@gmail.com', '1997-07-08', 'm', 'sevilla'),
(5, '@localhost', '', '', '0000-00-00', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`IDCOMENTARIO`),
  ADD KEY `FKJUEGO` (`IDJUEGO`),
  ADD KEY `FKUSUARIO` (`IDUSUARIO`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`IDJUEGO`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`IDMENSAJE`),
  ADD KEY `FKEMISOR` (`EMISOR`),
  ADD KEY `FKRECEPTOR` (`RECEPTOR`);

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD PRIMARY KEY (`IDNOVEDAD`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IDUSUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `IDMENSAJE` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FKJUEGO` FOREIGN KEY (`IDJUEGO`) REFERENCES `juegos` (`IDJUEGO`),
  ADD CONSTRAINT `FKUSUARIO` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuarios` (`IDUSUARIO`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `FKEMISOR` FOREIGN KEY (`EMISOR`) REFERENCES `usuarios` (`IDUSUARIO`),
  ADD CONSTRAINT `FKRECEPTOR` FOREIGN KEY (`RECEPTOR`) REFERENCES `usuarios` (`IDUSUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2018 a las 20:01:13
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
  `COMENTARIO` text COLLATE latin1_spanish_ci NOT NULL,
  `FECHA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`IDCOMENTARIO`, `IDJUEGO`, `IDUSUARIO`, `COMENTARIO`, `FECHA`) VALUES
(1, 1, 3, 'Hola', '2018-05-25'),
(2, 1, 3, 'El juego mola jeje', '2018-05-25'),
(3, 1, 3, 'Lo sÃ© jiji', '2018-05-25'),
(4, 3, 3, 'Es el mejor juego!!!!!!', '2018-05-25'),
(5, 10, 2, 'Prueba', '2018-05-28'),
(6, 10, 2, 'Prueba2', '2018-05-28'),
(7, 1, 3, 'Hola', '2018-05-30'),
(8, 2, 2, 'A ver cuando lo sacan para ps4', '2018-06-01'),
(9, 3, 2, 'Prueba', '2018-06-01'),
(10, 2, 2, 'Prueba', '2018-06-01'),
(11, 9, 2, 'Es como el Mortal Kombat', '2018-06-01'),
(12, 9, 2, 'Pero este es mejor porque tiene superheroes', '2018-06-01'),
(13, 9, 3, 'Jajaja', '2018-06-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `IDJUEGO` int(4) NOT NULL,
  `NOMBRE` varchar(55) COLLATE latin1_spanish_ci NOT NULL,
  `DESCRIPCION` text COLLATE latin1_spanish_ci NOT NULL,
  `VOTOS` int(4) NOT NULL,
  `PUNTUACION` int(6) NOT NULL,
  `NOTA` int(2) NOT NULL,
  `CARATULA` varchar(500) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`IDJUEGO`, `NOMBRE`, `DESCRIPCION`, `VOTOS`, `PUNTUACION`, `NOTA`, `CARATULA`) VALUES
(1, 'Mario Kart 8 Deluxe', 'Mario Kart 8 Deluxe es una remasterizaci&oacute;n para Nintendo Switch de este exitoso y aclamado juego de Wii U. Llegar&aacute; a las tiendas el 28 de abril y, adem&aacute;s de ofrecer mejores gr&aacute;ficos, tambi&eacute;n contar&aacute; con nuevos personajes, ajustes jugables y un renovado Modo Batalla. De esta forma, Mario Kart 8 Deluxe tendr&aacute; 48 circuitos (los 32 del original m&aacute;s los 16 de los DLC) y 40 personajes, cinco de ellos nuevos. Estos son Inkling chico e Inkling chica de Splatoon, el Rey Boo, Huesitos y Bowsy, as&iacute; como nuevas piezas con las que configurar nuestros veh&iacute;culos.', 0, 0, 0, 'media/caratulas/mk8d.jpg'),
(2, 'Playerunknown\'s Battlegrounds', 'Playerunknown\'s Battlegrounds es un videojuego de acci&oacute;n multijugador que nos trasladar&aacute; a una enorme extensi&oacute;n de terreno en el que el objetivo primario ser&aacute; b&aacute;sico: sobrevivir y matar a nuestros competidores. Enmarcado dentro de la modalidad battle royale, en el juego ganar&aacute; el &uacute;ltimo jugador que quede en pie sobre el escenario. Para ello podemos usar cientos de armas que iremos encontrarnos, cooperar con otros jugadores hasta el mismo final o equiparnos con lo que encontremos.', 0, 0, 0, 'media/caratulas/pubg.jpg'),
(3, 'Fire Emblem: Awakening', 'Fire Emblem: Awakening nos presenta un t&iacute;tulo de estrategia por turnos en el que guiaremos un ej&eacute;rcito a trav&eacute;s de grandes batallas. Adem&aacute;s de los combates el juego tambi&eacute;n cuenta con una gran apuesta a nivel relacional en la que deberemos interactuar con el resto de personajes del juego. En el inicio de la historia el jugador se encontrar&aacute; en un estado de amnesia total y abandonado al borde de un camino. A partir de ah&iacute; el protagonista empezar&aacute; a conocer una realidad cargada de misterios mientras ayuda a Chrom y los custodios de Ylisse.', 0, 0, 0, 'media/caratulas/fea.jpg'),
(4, 'Fire Emblem Fates', 'Fire Emblem Fates es la duod&eacute;cima entrega de la serie principal de Fire Emblem - decimocuarta incluyendo los remakes - y la segunda en ser desarrollada para Nintendo 3DS despu&eacute;s de Fire Emblem: Awakening. Dos reinos se encuentran al borde de la guerra y debes decidir de qu&eacute; lado est&aacute;s en \'Fire Emblem Fates\'. Como pr&iacute;ncipe Hoshidan criado por la realeza Nohrian, te encuentras entre dos familias. El camino que elijas determinar&aacute; tu destino y el de tu ej&eacute;rcito. Dirige a tus tropas con precisi&oacute;n experta y establece fuertes relaciones en este ambicioso juego de estrategia por turnos. ', 0, 0, 0, 'media/caratulas/fef.png'),
(5, 'Fire Emblem Echoes: Shadows of Valentia', 'Este t&iacute;tulo llegar&aacute; a Nintendo 3DS con un apartado gr&aacute;fico renovado -adapta una entrega de Dragon Quest in&eacute;dita en Occidente-, un mundo de libre exploraci&oacute;n, exploraci&oacute;n de mazmorras y secuencias de anime para narrar su historia. De este modo, volveremos a tener un juego de rol y estrategia por turnos con todas las caracter&iacute;sticas habituales de la serie, aunque ofrece detalles &uacute;nicos dentro de la misma, como la posibilidad de explorar mazmorras, movernos por las ciudades y recorrer el mundo con algo m&aacute;s de libertad. Junto al juego llegar&aacute; una gama de figuras coleccionables amiibo compatibles con el t&iacute;tulo.', 0, 0, 0, 'media/caratulas/fee.jpg'),
(6, 'Nioh', 'Nioh es un videojuego exclusivo de PlayStation 4, perteneciente al g&eacute;nero de rol y acci&oacute;n, pero con elementos caracter&iacute;sticos del \'Hack and Slash\', desarollado por Team Ninja y fuertemente inspirado en la saga Dark Souls de From Software y Ninja Gaiden. La aventura se ambienta en el Jap&oacute;n feudal y cuenta con la presencia de multitud de demonios y seres sobrenaturales del folclore de dicho pa&iacute;s. Su estilo de lucha y combate ser&aacute; &aacute;rido y dif&iacute;cil, invitando al jugador a prepararse concienzudamente en cada enfrentamiento.', 0, 0, 0, 'media/caratulas/nioh.jpg'),
(7, 'Crash Bandicoot N. Sane Trilogy', 'Crash Bandicoot N Sane Trilogy es un videojuego de plataformas en 3D, desarrollado por el estudio Vicarious Visions y producido y distribuido por activision como videojuego exclusivo de PS4, hasta el momento. Se trata de una remasterizaci&oacute;n de los tres primeros juegos de la serie Crash Bandicoot aparecidos en la consola PlayStation a finales de los 90 y desarrollados por Naughty Dog, pero mejorados con gr&aacute;ficos totalmente renovados, cambios est&eacute;ticos y ciertas novedades jugables.', 0, 0, 0, 'media/caratulas/crash.jpg'),
(8, 'Final Fantasy XV', 'Final Fantasy XV es un videojuego de acci&oacute;n y rol desarrollado por Square Enix, que en etapas tempranas de desarrollo se dio a conocer bajo el nombre de Final Fantasy versus XIII, para posteriormente pasar a formar parte como la decimoquinta entrega numerada de la saga. Adem&aacute;s sus acontecimientos est&aacute;n relacionados con la pel&iacute;cula Final Fantasy XV Kingslaive.', 0, 0, 0, 'media/caratulas/ffxv.jpg'),
(9, 'Injustice 2', 'Injustice 2 para PS4 es el regreso del juego de lucha que enfrenta a todos los h&eacute;roes de DC entre s&iacute;. En esta ocasi&oacute;n vuelven luchadores como Batman, Superman o Wonder Woman, pero hay novedades como Batgirl. Se a&ntilde;aden nuevos supermovimientos y choques, pero la gran novedad es el sistema de subida de niveles y configuraci&oacute;n de los luchadores, que nos reta a seguir avanzando.', 2, 8, 4, 'media/caratulas/injustice.jpg'),
(10, 'NieR: Automata', 'NieR: Automata es un videojuego de acci&oacute;n - rol y aventura en tercera persona, que ha sido producido por Square Enix y desarrollado por Platinum Games para PlayStation 4 y PC. El juego se ambienta en una tierra devastada y mostrar&aacute; los intensos combates que tienen lugar entre las unidades androide Yorha, creadas por los humanos, contra una serie de seres biomec&aacute;nicos alien&iacute;genas que obligan a la humanidad a abandonar la Tierra y huir hacia la luna. El dise&ntilde;o de los personajes corre a cabo del creativo japon&eacute;s Akihiko Yoshida, conocido por haber participado regularmente en las entregas de Final Fantasy.', 0, 0, 0, 'media/caratulas/nier.jpg'),
(11, 'Animal Crossing: New Leaf', 'Una de las sagas m&aacute;s populares de los &uacute;ltimos a&ntilde;os llega a la 3DS dando un giro total en experiencias y jugabilidad. En esta ocasi&oacute;n el jugador se convertir&aacute; en el alcalde y tendr&aacute; en sus manos un gran n&uacute;mero de dise&ntilde;os y posibilidades de personalizaci&oacute;n. Asimismo el t&iacute;tulo cuenta con un espacio jugable mucho mayor, un n&uacute;mero ingente de vecinos y m&aacute;s y mejores comercios. Una experiencia innovadora de juego en comunidad para que el jugador interactue con sus amigos en la vida real.', 0, 0, 0, 'media/caratulas/acnl.jpg'),
(12, 'Pok&eacute;mon Ultrasol / Ultraluna', 'Pok&eacute;mon Ultrasol y Ultraluna, son dos videojuegos RPG ambientados en el mundo de Pok&eacute;mon , desarrollados por el estudio Game Freak y produciodos y distribuidos por Nintendo como juegos exclusivos de sus plataformas Nintendo 3DS y 2DS. Se trata de las revisiones ampliadas de Pok&eacute;mon Sol / Luna, pero contar&aacute;n con una historia totalmente nueva cuyos acontecimientos tambi&eacute;n se desarrollar&aacute;n en Alola, la tierra paradis&iacute;aca de Pok&eacute;mon y tendr&aacute;n que vez con el misterioso Pok&eacute;mon Necrozma y su capacidad de fusionarse con otros Pok&eacute;mon.', 0, 0, 0, 'media/caratulas/pus.jpg'),
(13, 'God of War', 'God of War es la vuelta de Kratos a los videojuegos tras la trilog&iacute;a original. Esta nueva entrega para PlayStation 4, si bien mantendr&aacute; varios de los ingredientes indivisibles de su jugabilidad, apostar&aacute; por un nuevo comienzo para el personaje y una ambientaci&oacute;n n&oacute;rdica, ofreci&eacute;ndonos una perspectiva m&aacute;s madura y realista de la mitolog&iacute;a de dioses y monstruos milenarios habitual en la serie de t&iacute;tulos. En God of War, Kratos ser&aacute; un guerrero m&aacute;s curtido y pasivo, pues tendr&aacute; que desempe&ntilde;ar el rol de padre en un fr&iacute;o y hostil escenario, al que parece haberse retirado para olvidar su pasado.', 0, 0, 0, 'media/caratulas/gow.jpg'),
(14, 'Octopath Traveler', 'Project Octopath Traveler es un videojuego de rol japon&eacute;s de corte cl&aacute;sico dise&ntilde;ado por Square Enix para Nintendo Switch. Ahondando en conceptos habituales dentro del g&eacute;nero, y haciendo acopio de un estilo art&iacute;stico que busca imitar las fortalezas y nost&aacute;lgicas debilidades de los videojuegos propios de la &eacute;poca de las consolas de 32 bits, sus creadores buscan devolver los t&iacute;tulos de rol a sus ra&iacute;ces sin alardes de ning&uacute;n tipo.', 0, 0, 0, 'media/caratulas/ot.jpg'),
(15, 'Azure Striker Gunvolt: Striker Pack', 'Azure Striker Gunvolt: Striker Pack para Nintendo Switch se trata de una compilaci&oacute;n que re&uacute;ne para la consola de Nintendo los juegos Azure Striker Gunvolt y Azure Striker Gunvolt 2. El t&iacute;tulo cuenta con soporte para la vibraci&oacute;n HD, un nuevo tema musical y todos los contenidos de los juegos originarios de Nintendo 3DS, as&iacute; como todos los contenidos adicionales que se fueron lanzando para ellos. Entre las mejoras t&eacute;cnicas estar&aacute;n los gr&aacute;ficos con 60 im&aacute;genes por segundo.', 0, 0, 0, 'media/caratulas/asgs.jpg'),
(16, 'Cuphead', 'Cuphead es un videojuego de plataformas y acci&oacute;n en 2D desarrollado por Studio MDHR y distribuido por Microsoft para las plataformas de Xbox One y PC.Sin lugar a dudas el punto m&aacute;s fuerte de cuphead es su apartado gr&aacute;fico y art&iacute;stico, el cual busca emular el estilo de las pel&iacute;culas y cortos de animaci&oacute;n de hace varias d&eacute;cadas. Este t&iacute;tulo tendr&aacute; un mapa mundi jugable con algunos secretos y misiones secundarias, formado por varios niveles de transici&oacute;n que completar desde un comienzo a un final y 30 jefes finales o bosses a los que tendremos que enfrentarnos, los cuales son el alma, personalidad y raz&oacute;n del t&iacute;tulo.', 0, 0, 0, 'media/caratulas/cuphead.jpg'),
(17, 'Sea of Thieves', 'Sea of Thieves es el nuevo videojuego online multijugador de piratas exclusivo de Microsoft, desarrollado por Rare y producido por Microsoft para las plataformas de Xbox One y PC. En esta ocasi&oacute;n, visitaremos un mundo din&aacute;mico de ambientaci&oacute;n paradisiaca, en el que a trav&eacute;s de un modo multijugador viviremos diferentes aventuras como piratas. Rare ha puesto especial atenci&oacute;n en desatar el esp&iacute;ritu de bucanero del jugador, ofreciendo diversas actividades, desde beber ron a buscar tesoros, navegar o combatir contra otras tripulaciones a lo largo y ancho de un universo alegre y colorido.', 0, 0, 0, 'media/caratulas/sot.jpg'),
(18, 'Spider-Man', 'Spider-Man para PS4 es un videojuego de acci&oacute;n y aventuras con un estilo jugable de mundo abierto, que permite al jugador desplazarse de un lugar a otro con total libertad de movimientos y que tiene por escenario donde se desarrolla la historia, la ciudad de Nueva York. La historia, totalmente original y nunca antes contada, nos pone en la piel de un Peter Parker mucho m&aacute;s experimentado y maduro que deber&aacute; lidiar con los problemas que suponen el tener que salvar a una ciudad entera como Manhattan de las atrocidades de los peores criminales y compatibilizarlo con su vida personal.', 0, 0, 0, 'media/caratulas/spider.png'),
(19, 'Gears of War 4', 'Se trata de la secuela de la reconocida serie de juegos de disparos en tercera persona, esta vez para Xbox One que progresar&aacute; en la jugabilidad de la serie manteniendo el componente emocional de la historia y que sacar&aacute; provecho de el ya popular modo multijugador. El juego nos volver&aacute; a traer las historia de la guerra infinita contra los enemigos que amenazan a la humanidad y la lucha por salvar a los pocos supervivientes de el conflicto iniciado el terrible d&iacute;a D y que cambi&oacute; el rumbo de la historia de la humanidad.', 0, 0, 0, 'media/caratulas/gow4.jpg'),
(20, 'The Legend of Zelda: Breath of the Wild', 'The Legend of Zelda: Breath of the Wild es un videojuego exclusivo de Nintendo, desarrollado, producido y distribuido por la misma compa&ntilde;&iacute;a, para las videoconsolas Wii U y Nintendo Switch. Se trata de la decimo-octava entrega de la saga Zelda, pero tambi&eacute;n es el primer juego de la popular serie para la consola de &uacute;ltima generaci&oacute;n de Nintendo. El t&iacute;tulo promete un estilo visual completamente nuevo con el que desmarcarse de todo lo visto hasta el momento con colores muy vivos y llamativos y unos gr&aacute;ficos que aprovechan a la perfecci&oacute;n la t&eacute;cnica de Cel Shading. De igual forma su director Eiji Anouma prometi&oacute; cambios sustanciales en lo que a jugabilidad se refiere.', 0, 0, 0, 'media/caratulas/tloz.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `IDMENSAJE` int(4) NOT NULL,
  `ASUNTO` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `EMISOR` int(4) NOT NULL,
  `RECEPTOR` int(4) NOT NULL,
  `MENSAJE` text COLLATE latin1_spanish_ci NOT NULL,
  `HILO` int(4) NOT NULL,
  `FECHA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`IDMENSAJE`, `ASUNTO`, `EMISOR`, `RECEPTOR`, `MENSAJE`, `HILO`, `FECHA`) VALUES
(1, 'Prueba', 2, 3, 'Hola', 1, '2018-05-28'),
(2, 'Prueba', 2, 3, 'Prueba', 1, '2018-05-28'),
(3, 'Prueba', 2, 3, 'Hola', 1, '2018-05-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `IDNOVEDAD` int(4) NOT NULL,
  `TITULO` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `CONTENIDO` text COLLATE latin1_spanish_ci NOT NULL,
  `IMAGEN` varchar(10) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
  `NICK` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `PASSWORD` varchar(16) COLLATE latin1_spanish_ci NOT NULL,
  `EMAIL` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `FECHAN` date NOT NULL,
  `SEXO` varchar(1) COLLATE latin1_spanish_ci NOT NULL,
  `CIUDAD` varchar(20) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IDUSUARIO`, `NICK`, `PASSWORD`, `EMAIL`, `FECHAN`, `SEXO`, `CIUDAD`) VALUES
(1, 'prueba01@localhost', 'Prueba_01', 'prueba01@gmail.com', '2005-12-31', 'f', 'barcelona'),
(2, 'yangschnee@localhost', 'Shin_jimin1', 'lucia.martinezpimentel@gmail.com', '1998-03-10', 'f', 'madrid'),
(3, 'juanmad1@localhost', 'Juanmad_1', 'juanmad1@gmail.com', '1995-07-17', 'm', 'madrid'),
(4, 'prueba2@localhost', 'Prueba_2', 'prueba2@gmail.com', '1997-07-08', 'm', 'sevilla'),
(5, '@localhost', '', '', '0000-00-00', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votaciones`
--

CREATE TABLE `votaciones` (
  `IDUSUARIO` int(4) NOT NULL,
  `IDJUEGO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `votaciones`
--

INSERT INTO `votaciones` (`IDUSUARIO`, `IDJUEGO`) VALUES
(2, 1),
(2, 9),
(3, 1),
(3, 9);

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
-- Indices de la tabla `votaciones`
--
ALTER TABLE `votaciones`
  ADD PRIMARY KEY (`IDUSUARIO`,`IDJUEGO`),
  ADD KEY `FK_IDJUEGO` (`IDJUEGO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `IDCOMENTARIO` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `IDMENSAJE` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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

--
-- Filtros para la tabla `votaciones`
--
ALTER TABLE `votaciones`
  ADD CONSTRAINT `FK_IDJUEGO` FOREIGN KEY (`IDJUEGO`) REFERENCES `juegos` (`IDJUEGO`),
  ADD CONSTRAINT `FK_IDUSUARIO` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuarios` (`IDUSUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

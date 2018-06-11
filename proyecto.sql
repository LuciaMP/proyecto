-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2018 a las 00:43:55
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
  `CARATULA` varchar(100) COLLATE latin1_spanish_ci NOT NULL
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
  `TITULO` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `CONTENIDOC` text COLLATE latin1_spanish_ci NOT NULL,
  `CONTENIDO` text COLLATE latin1_spanish_ci NOT NULL,
  `IMAGEN` varchar(100) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`IDNOVEDAD`, `TITULO`, `CONTENIDOC`, `CONTENIDO`, `IMAGEN`) VALUES
(1, 'Divinity: Original Sin II Definitive Edition, el 31 de agosto en PS4 y Xbox One', 'Bandai Namco ser&aacute; la encargada de publicar Divinity: Original Sin 2 los sistemas PlayStation 4 y Xbox One a finales de pr&oacute;ximo mes de agosto.', '\'Divinity: Original Sin II\' es, posiblemente, uno de los mejores RPG de corte occidental que podemos encontrar en la plataforma PC, donde debut&oacute; a mediados de septiembre del a&ntilde;o pasado para ofrecer a sus jugadores una experiencia &uacute;nica y cargada de cientos de horas de juego. Al cargo de esta entrega se ha encontrado el equipo de Larian Studios, quien ha trabajado durante varios a&ntilde;os para ofrecer un t&iacute;tulo m&aacute;s grande que su antecesor y con algunas novedades. Tras su paso por PC, donde ha cosechado cr&iacute;ticas muy positivas, ahora le toca el turno a los usuarios de consolas poder disfrutar de la experiencia que ofrece Divinity: Original Sin II. El mes lanzamiento del t&iacute;tulo de Larian Studios en consolas fue confirmado hace dos meses, pero restaba por conocer el d&iacute;a exacto para su puesta a la venta. <br> Bandai Namco, que ser&aacute; la compa&ntilde;&iacute;a encargada de publicar esta entrega en los sistemas PlayStation 4 y Xbox One, ha confirmado que el d&iacute;a elegido para poner Divinity: Original Sin 2 a la venta es el pr&oacute;ximo 31 de agosto. A partir de este d&iacute;a, los jugadores de las consolas citadas podr&aacute;n adentrarse en un mundo plagado de posibilidades casi infinitas y que podremos recorrer en solitario o en compa&ntilde;&iacute;a de otros usuarios. Esta entrega, cuyo nombre ser&aacute; \'Divinity: Original Sin II Definitive Edition\', contar&aacute; con algunas mejoras para facilitar el acceso a los jugadores, as&iacute; como nuevas actualizaciones. En principio, esta versi&oacute;n deber&iacute;a contar con la traducci&oacute;n al castellano que anunci&oacute; Larian Studios para PC y que lleg&oacute; a finales del mes de abril.', 'media/novedades/1.jpg'),
(2, 'Kingdom Hearts 3 presenta sus diferentes ediciones de lanzamiento', 'El t&iacute;tulo llegar&aacute; a PlayStation 4 y Xbox One el pr&oacute;ximo 29 de enero de 2019.', 'Tras numerosos detalles ofrecidos, \'Kingdom Hearts 3\' ha confirmado en los &uacute;ltimos d&iacute;as su fecha de lanzamiento: el 29 de enero de 2019 en PlayStation 4 y Xbox One. El t&iacute;tulo de Square Enix ha presentado adem&aacute;s en el E3 2018 dos tr&aacute;ilers variando alguna que otra escena, aunque ahora se ha apostado por anunciar un dato muy interesante para los fieles seguidores de la franquicia. \'Kingdom Hearts 3\' contar&aacute; con diferentes ediciones de lanzamiento adem&aacute;s de la est&aacute;ndar y la digital. <br> Por un lado, se ha presentado una edici&oacute;n Deluxe que contar&aacute; con una caja steelbook junto a un libro de arte y un pin exclusivo por un precio de 89,99 &euro;. Por otro lado, la tienda de Square Enix vender&aacute; en exclusiva esta misma edici&oacute;n acompa&ntilde;ada de las figuras Bring Arts de Sora, Donald y Goofy con sus trajes del mundo de Toy Story por un precio de 229,99 &euro;.\r\n', 'media/novedades/2.jpg'),
(3, 'Assassin\'s Creed Odyssey; filtrada su fecha de lanzamiento', 'El t&iacute;tulo podr&iacute;a ser la gran estrella durante la conferencia de Ubisoft en el E32018.', 'Si ha habido un t&iacute;tulo que ha sido filtrado hasta la saciedad hasta el punto de parecer que se estaban ensa&ntilde;ando, ese ha sido \'Assassin\'s Creed Odyssey\', nuevo t&iacute;tulo de la popular franquicia del cual se han podido conocer nuevos detalles recientemente tras una nueva filtraci&oacute;n, en este caso masiva, incluyendo diversos datos sobre el juego como su fecha de lanzamiento, la cual ha sido fijada para el pr&oacute;ximo 5 de octubre en PlayStation 4, Xbox One y PC. Y entre los otros detalles, a modo de introducci&oacute;n, ya se puede confirmar que, emulando lo visto en \'Assassin\'s Creed Syndicate\', el juego contar&aacute; con dos protagonistas, uno femenino y otro masculino. <br> Toda la informaci&oacute;n que os contamos ha surgido a ra&iacute;z de un embargo que se han saltado en Estados Unidos, e cual ha sido r&aacute;pidamente eliminado sin poder evitar que Internet haga de las suyas, de esta forma, ya podemos confirmar que el t&iacute;tulo contar&iacute;a con la opci&oacute;n de elegir entre un protagonista femenino (Kassanda) y otro masculino (Alexios), ambos viviendo la misma historia como un avatar, aunque sin poder personalizarlos. Asimismo, se ha confirmado que existir&aacute;n conexiones con la Primera Civilizaci&oacute;n. En cuanto al mapeado, este es mucho m&aacute;s grande que el de \'Assassin\'s Creed Origins\', llev&aacute;ndonos a Grecia (como ya se sab&iacute;a), aunque incluyendo varias regiones que la conforman. Asimismo, hay un mayor &eacute;nfasis en los combates, llegando a verse placajes y batallas en el mar.', 'media/novedades/3.jpg'),
(4, 'Starlink: Battle for Atlas anuncia colaboraci&oacute;n con Star Fox; llegar&aacute; el 16 de octubre', 'Starlink: Battle for Atlas contar&aacute; con contenido exclusivos en su versi&oacute;n para Nintendo Switch; el juego llegar&aacute; a PC, Ps4, Xbox One y Nintendo Switch en octubre.', 'Starlink: Battle for Atlas, t&iacute;tulo presentado en el E3 del a&ntilde;o pasado, ha vuelto en la edici&oacute;n de este a&ntilde;o con algunas novedades muy interesantes. La primera y m&aacute;s importante de todas es que el t&iacute;tulo de Ubisoft ya tiene fecha de lanzamiento en los sistemas PC, PlayStation 4, Xbox One y Nintendo Switch, siendo la elegida por la compa&ntilde;&iacute;a el pr&oacute;ximo 16 de octubre. A partir de ese d&iacute;a, los jugadores de estas plataformas podr&aacute;n disfrutar de una experiencia donde los grandes protagonistas ser&aacute;n unas figuras f&iacute;sicas en forma de naves que podr&aacute;n interactuar con \'Starlink: Battle for Atlas\'. Gracias a ellas, los usuarios que apuesten por el t&iacute;tulo de Ubisoft podr&aacute;n adentrarse en un Sistema Solar repleto de planetas y cada uno con su propio ecosistema y vida salvaje, as&iacute; como misiones de todo tipo. <br> La segundad novedad revelada por la compa&ntilde;&iacute;a gala est&aacute; directamente relacionada con la versi&oacute;n destinada a Nintendo Switch, y es que contar&aacute; con contenido exclusivo que seguro har&aacute; las delicias de los seguidores de Star Fox. La nave Arwing y Fox McCloud estar&aacute;n disponibles en Starlink: Battle for Atlas para que los jugadores puedan acompa&ntilde;ar al legendario pilotos en esta experiencia. Adem&aacute;s, contar&aacute; con misiones adicionales que no habr&aacute; en otras versiones y que podremos completar no solo con Fox, sino tambi&eacute;n con otros personajes del universo Star Fox. Sin duda, se trata de un anuncio bastante interesante y que la compa&ntilde;&iacute;a ha querido completar con una edici&oacute;n especial que incluye el juego, un modelo del Arwing, una figurita de Fox y otros a&ntilde;adidos adiciones que pod&eacute;is ver en la imagen que os hemos dejado m&aacute;s abajo. ', 'media/novedades/4.jpg'),
(5, 'Mario + Rabbids: Kingdom Battle Donkey Adventure anuncia su fecha de lanzamiento', 'No tendremos que esperar mucho m&aacute;s para poder disfrutar del &uacute;ltimo DLC de Mario + Rabbids.', 'La conferencia de Ubisoft ya lleva unos minutos en marcha y en ella hemos podido ver toda clase de t&iacute;tulos de la compa&ntilde;&iacute;a, tales como \'Beyond: Good & Evil 2\', \'Skull & Bones\', entre otros. Sin embargo, Nintendo Switch tambi&eacute;n ha tenido su cita en el evento con uno de los t&iacute;tulos m&aacute;s aclamados de la consola, \'Mario + Rabbids: Kingdom Battle\', el cual anunci&oacute; en el mes de enero la llegada de una expansi&oacute;n que tendr&iacute;a a Donkey Kong como protagonista. Pues bien, tras meses de espera, y a sabiendas de que la expansi&oacute;n ha sido bautizada como Donkey Kong Adventure, ya tenemos su fecha de lanzamiento final, la cual se ha fijado para el pr&oacute;ximo 26 de junio. <br> En cuanto al contenido del mismo, tal y como se ha revelado, Ubisoft Paris y Ubisoft Milan se habr&iacute;an unido para llevar a cabo este DLC del t&iacute;tulo de Nintendo Switch, el cual contar&iacute;a con hasta tres protagonistas: la ya conocidad Rabbids Peach, el popular Donkey Kong y un nuevo tipo de Rabbids llamado Cranky Rabbids, el cual vendr&iacute;a a cupar el papel de Cranky Kong, el Donkey Kong original (o no seg&uacute;n el canon que se toque).  Asimismo, seg&uacute;n se ha comentado, este Donkey Kong Adventure  de \'Mario + Rabbids: Kingdom Battle\' tendr&iacute;a una duraci&oacute;n de aproximadamente 10 horas, siendo as&iacute; que abarcar&iacute;a la mitad de la duraci&oacute;n del juego base.', 'media/novedades/5.jpg'),
(6, 'The Division 2 detalla su contenido post-lanzamiento: 3 expansiones gratis', 'Ubisoft revela en su conferencia algunas de las novedades que recibir&aacute; Tom Clancy\'s The Division 2 y el contenido post-lanzamiento.', '\'Tom Clancy\'s The Division 2\', nueva entrega de la serie de acci&oacute;n creada por el estudio Ubisoft Massive, ha sido otro de los protagonistas en la conferencia programada por la compa&ntilde;&iacute;a. Tras un mostrar un nuevo tr&aacute;iler de corte CGI, uno de los desarrolladores de Tom Clancy\'s The Division 2 ha entrado en el escenario para tratar algunas de las novedades que est&aacute;n introduciendo en &eacute;l. Una de las nuevas funciones que veremos en el t&iacute;tulo de Ubisoft Massive es la implementaci&oacute;n de Incursiones para que los jugadores tengan la oportunidad de vivir nuevas aventuras en la ciudad de Washington, que es donde tendr&aacute;n lugar los hechos del juego, tras completar la historia principal del juego. Seg&uacute;n el estudio, en ellas podr&aacute;n participar hasta un m&aacute;ximo de ocho jugadores. <br> Con esta medida, el estudio corregir&aacute; uno de los grandes problemas del primer juego y que trajo de cabeza a los jugadores. Adem&aacute;s de esta implementaci&oacute;n, los jugadores de Tom Clancy\'s The Division 2 tendr&aacute;n la oportunidad de acceder a nuevas especializaciones y cada una de ellas tendr&aacute; su propio sistema de progresi&oacute;n con habilidades &uacute;nicas para potenciar la jugabilidad. Por supuesto, esto incluye el poder acceder a nuevas armas, herramientas y m&aacute;s cosas que podremos usar tanto en el PvE como en el PvP. La experiencia original contar&aacute; con contenido adicional post-lanzamiento, entre los cuales podemos destacar tres expansiones gratuitas que llegar&aacute;n en meses posteriores al estreno del t&iacute;tulo de Ubisoft Massive. La compa&ntilde;&iacute;a pondr&aacute; a la venta un pase premium opciones que dar&aacute; acceso a un a&ntilde;o de extras completamente exclusivos.', 'media/novedades/6.jpg'),
(7, 'Final Fantasy XIV Stormblood anuncia una colaboraci&oacute;n con Monster Hunter World', 'Final Fantasy XIV anuncia en el E3 una nueva actualizaci&oacute;n que incluir&aacute; al aclamado t&iacute;tulo de Capcom.', '\'Final Fantasy XIV Online\' es uno de los mayores &eacute;xitos de Square Enix en la actualidad, contando con una comunidad que no falla a su cita. Y de a misma forma, estos nos han faltado a la cita con el E3, siendo as&iacute; que en la conferencia reci&eacute;n celebrada de Square Enix hemos podido ver como el t&iacute;tulo cuenta con una nueva actualizaci&oacute;n anunciada, la cual trae como principal una nueva colaboraci&oacute;n, m&aacute;s concretamente con \'Monster Hunter World\', el aclamado t&iacute;tulo de Capcom lanzado para PS4, Xbox One y PC, aunque esto &uacute;ltimo el pr&oacute;ximo mes de octubre. <br> En cuanto al tr&aacute;iler mostrado, lo primero que se ha podido ver ha sido un adelanto del pr&oacute;ximo parche 4.3 de \'Final Fantasy XIV Stormblood\', el cual ha sido bautizado como Under the Moonlight. Sin embargo, no han tardado demasiado tiempo en mostrar la aut&eacute;ntica chicha del tr&aacute;iler, el cual ven&iacute;a confirmando la colaboraci&oacute;n entre ambos t&iacute;tulos con la inclusi&oacute;n de un Rathalos en el juego, as&iacute; como lo que parecen ser cazadores con la indumentaria de personajes cl&aacute;sicos de la saga como Vivi y Auron. De igual forma, se ha anunciado que dicho crossover con \'Monster Hunter World\' se llevar&aacute; a cabo en verano, aunque sin llegar a concretar una fecha exacta.', 'media/novedades/7.jpg'),
(8, 'FIFA 19 tambi&eacute;n llegar&aacute; a PlayStation 3 y Xbox 360', 'Lo har&aacute; como FIFA 19 Legacy, una edici&oacute;n que se estrenar&aacute; tambi&eacute;n el 29 de septiembre contando con una serie de limites.', 'Tras el anuncio y presentaci&oacute;n de \'FIFA 19\' para PlayStation 4, Xbox One, Nintendo Switch y PC el pasado s&aacute;bado 9 de junio en la conferencia de EA por el E3 2018, las dudas sobre el lanzamiento del t&iacute;tulo en la antigua generaci&oacute;n fueron sembradas, pues ya exist&iacute;a una incertidumbre en los meses anteriores debido a algunos rumores. Sin embargo, EA Sports ha confirmado que \'FIFA 19\' llegar&aacute; a PlayStation 3 y Xbox 360 el pr&oacute;ximo 29 de septiembre como \'FIFA 19 Legacy\', una edici&oacute;n de la que promete compartir m&aacute;s detalles a lo largo de los pr&oacute;ximos meses. Os recordamos que en los &uacute;ltimos a&ntilde;os, la edici&oacute;n Legacy de la saga FIFA ha contado con una gran serie de limitaciones comparado con la versi&oacute;n de actual generaci&oacute;n. Sin embargo, se trata de una buena noticia para aquellos que siguen la entrega deportiva anual en sus antiguas consolas. <br> La gran novedad de \'FIFA 19\' ser&aacute; la llegada de la Champions League. No hay escal&oacute;n m&aacute;s alto a nivel de clubes de f&uacute;tbol que la UEFA Champions League. En este torneo hist&oacute;rico en el que compiten los mejores clubes del mundo se cumplen sue&ntilde;os y se forjan leyendas. El videojuego contar&aacute; con la presentaci&oacute;n de partidos oficiales a las diferentes experiencias de torneos, que incluyen la Europa League y la Supercopa, y al nuevo equipo de comentaristas formado por Derek Rae y Lee Dixon.', 'media/novedades/8.jpg'),
(9, 'Just Cause 4 es oficial; llegar&aacute; a PS4, Xbox One y PC el pr&oacute;ximo 4 de diciembre', 'En Just Cause 4, t&iacute;tulo desarrollado por el estudio Avalanche, tendremos que vernos las caras contra un grupo de mercenarios llamado \'The Black Hand\'.', 'Poco antes del inicio del E3 2018, gracias a una filtraci&oacute;n realizada por Steam para ser un poco m&aacute;s precisos, conocimos que el equipo de Avalanche Studios, adem&aacute;s es estar colaborando en el desarrollo de la segunda entrega Rage, tambi&eacute;n se encuentra en pleno de proceso de elaboraci&oacute;n de una nueva entrega de la serie \'Just Cause\'. Una nueva entrega que tuvimos la ocasi&oacute;n de ver, de forma oficial, durante la conferencia celebrada por Microsoft el pasado 10 de junio. El agente Rico Rodr&iacute;guez volver&aacute; este a&ntilde;o para ofrecer nuevas experiencias a los amantes de esta serie gracias al lanzamiento de \'Just Cause 4\', que estar&aacute; disponible en los sistemas PC, PlayStation 4 y Xbox One. La nueva entrega llegar&aacute; a las tiendas a partir del 4 de diciembre de este mismo a&ntilde;o. <br> En \'Just Cause 4\', t&iacute;tulo desarrollado por el estudio Avalanche, tendremos que vernos las caras contra un grupo de mercenarios llamado \"The Black Hand\" y poner fin a sus actividades. Para ello, el protagonista de la serie contar&aacute; con toda clase de armas y veh&iacute;culos (coches, lanchas, aviones y m&aacute;s) a su servicio, que nos ayudar&aacute;n a recorrer el vasto mundo creado para el juego. Al igual que anteriores entregas, el escenario ser&aacute; uno de los puntos clave para ofrecer a los jugadores una experiencia de lo m&aacute;s completa. Adem&aacute;s de enfrentarse contra un poderoso grupo de mercenarios, el agente Rico Rodr&iacute;guez tendr&aacute; que verse las caras contra las fuerzas de la naturaleza, algo que podemos ver en el tr&aacute;iler compartido por el estudio, entre ellos un devastador tornado.', 'media/novedades/9.jpg'),
(10, 'Dying Light 2 es real; llegar&aacute; a PC, PS4 y Xbox One\r\n', 'Dying Light 2 ofrecer&aacute; a los jugadores la oportunidad de adentrarse en un mundo abierto plagado de zombis y disfrutar de las mismas mec&aacute;nicas del original, junto a otras nuevas.', 'A finales del pasado mes de mayo os informamos sobre la posibilidad de que el E3 2018pudiera ser el marco de presentaci&oacute;n de una segunda entrega de la serie Dying Light, creada por el estudio polaco Techland. Pues as&iacute; ha sido. Ayer, domingo 10 de junio, durante la conferencia celebrada por el gigante norteamericano Microsoft pudimos ver el primer tr&aacute;iler oficial de \'Dying Light 2\'. Tras el &eacute;xito logrado por la primera entrega, que no ha parado de recibir soporte por parte del estudio desde su lanzamiento en 2015, era l&oacute;gico pensar que los chicos de Techland no iban a dejar pasar la oportunidad de hacer crecer a su licencia con nuevas experiencias. El primer t&iacute;tulo cuenta con unas ventas superiores a los 15 millones de unidades, una base muy s&oacute;lida para garantizar una secuela. <br> \'Dying Light 2\' ofrecer&aacute; a los jugadores la oportunidad de adentrarse en un mundo abierto plagado de zombis y disfrutar de las mismas mec&aacute;nicas del original, junto a otras nuevas. El estudio polaco, con el fin de ofrecer una experiencia m&aacute;s completa y compleja, ha implementado una rueda de di&aacute;logo que permitir&aacute; a los jugadores poder profundizar en las conversaciones con los personajes que se encontrar&aacute;n por el camino y as&iacute; forjar su propio camino. Adem&aacute;s, las decisiones que tomemos durante la aventura afectar&aacute; a la historia y eso ofrecer&aacute; diferentes consecuencias. El nuevo t&iacute;tulo de Techland seguir&aacute; apostando por mec&aacute;nicas como el parkour, la personalizaci&oacute;n de armas y, por supuesto, la noche. Salir en este momento del d&iacute;a era muy peligroso y en la secuela ser&aacute; igual, pues los enemigos ser&aacute;n m&aacute;s poderosos.', 'media/novedades/10.jpg');

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

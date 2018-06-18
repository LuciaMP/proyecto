-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2018 a las 00:41:23
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
  `COMENTARIO` longtext NOT NULL,
  `FECHA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `IDJUEGO` int(4) NOT NULL,
  `NOMBRE` varchar(55) NOT NULL,
  `DESCRIPCION` longtext NOT NULL,
  `VOTOS` int(4) NOT NULL,
  `PUNTUACION` int(6) NOT NULL,
  `NOTA` int(2) NOT NULL,
  `CARATULA` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`IDJUEGO`, `NOMBRE`, `DESCRIPCION`, `VOTOS`, `PUNTUACION`, `NOTA`, `CARATULA`) VALUES
(1, 'Mario Kart 8 Deluxe', 'Mario Kart 8 Deluxe es una remasterizaciÃ³n para Nintendo Switch de este exitoso y aclamado juego de Wii U. LlegarÃ¡ a las tiendas el 28 de abril y, ademÃ¡s de ofrecer mejores grÃ¡ficos, tambiÃ©n contarÃ¡ con nuevos personajes, ajustes jugables y un renovado Modo Batalla. De esta forma, Mario Kart 8 Deluxe tendrÃ¡ 48 circuitos (los 32 del original mÃ¡s los 16 de los DLC) y 40 personajes, cinco de ellos nuevos. Estos son Inkling chico e Inkling chica de Splatoon, el Rey Boo, Huesitos y Bowsy, asÃ­ como nuevas piezas con las que configurar nuestros vehÃ­culos.', 1, 4, 4, 'media/caratulas/mk8d.jpg'),
(2, 'Playerunknown\'s Battlegrounds', 'Playerunknown\'s Battlegrounds es un videojuego de acciÃ³n multijugador que nos trasladarÃ¡ a una enorme extensiÃ³n de terreno en el que el objetivo primario serÃ¡ bÃ¡sico: sobrevivir y matar a nuestros competidores. Enmarcado dentro de la modalidad battle royale, en el juego ganarÃ¡ el Ãºltimo jugador que quede en pie sobre el escenario. Para ello podemos usar cientos de armas que iremos encontrarnos, cooperar con otros jugadores hasta el mismo final o equiparnos con lo que encontremos.', 0, 0, 0, 'media/caratulas/pubg.jpg'),
(3, 'Fire Emblem: Awakening', 'Fire Emblem: Awakening nos presenta un tÃ­tulo de estrategia por turnos en el que guiaremos un ejÃ©rcito a travÃ©s de grandes batallas. AdemÃ¡s de los combates el juego tambiÃ©n cuenta con una gran apuesta a nivel relacional en la que deberemos interactuar con el resto de personajes del juego. En el inicio de la historia el jugador se encontrarÃ¡ en un estado de amnesia total y abandonado al borde de un camino. A partir de ahÃ­ el protagonista empezarÃ¡ a conocer una realidad cargada de misterios mientras ayuda a Chrom y los custodios de Ylisse.', 0, 0, 0, 'media/caratulas/fea.png'),
(4, 'Fire Emblem Fates', 'Fire Emblem Fates es la duodÃ©cima entrega de la serie principal de Fire Emblem - decimocuarta incluyendo los remakes - y la segunda en ser desarrollada para Nintendo 3DS despuÃ©s de Fire Emblem: Awakening. Dos reinos se encuentran al borde de la guerra y debes decidir de quÃ© lado estÃ¡s en \'Fire Emblem Fates\'. Como prÃ­ncipe Hoshidan criado por la realeza Nohrian, te encuentras entre dos familias. El camino que elijas determinarÃ¡ tu destino y el de tu ejÃ©rcito. Dirige a tus tropas con precisiÃ³n experta y establece fuertes relaciones en este ambicioso juego de estrategia por turnos. ', 0, 0, 0, 'media/caratulas/fef.png'),
(5, 'Fire Emblem Echoes: Shadows of Valentia', 'Este tÃ­tulo llegarÃ¡ a Nintendo 3DS con un apartado grÃ¡fico renovado -adapta una entrega de Dragon Quest inÃ©dita en Occidente-, un mundo de libre exploraciÃ³n, exploraciÃ³n de mazmorras y secuencias de anime para narrar su historia. De este modo, volveremos a tener un juego de rol y estrategia por turnos con todas las caracterÃ­sticas habituales de la serie, aunque ofrece detalles Ãºnicos dentro de la misma, como la posibilidad de explorar mazmorras, movernos por las ciudades y recorrer el mundo con algo mÃ¡s de libertad. Junto al juego llegarÃ¡ una gama de figuras coleccionables amiibo compatibles con el tÃ­tulo.', 0, 0, 0, 'media/caratulas/fee.jpg'),
(6, 'Nioh', 'Nioh es un videojuego exclusivo de PlayStation 4, perteneciente al gÃ©nero de rol y acciÃ³n, pero con elementos caracterÃ­sticos del \'Hack and Slash\', desarollado por Team Ninja y fuertemente inspirado en la saga Dark Souls de From Software y Ninja Gaiden. La aventura se ambienta en el JapÃ³n feudal y cuenta con la presencia de multitud de demonios y seres sobrenaturales del folclore de dicho paÃ­s. Su estilo de lucha y combate serÃ¡ Ã¡rido y difÃ­cil, invitando al jugador a prepararse concienzudamente en cada enfrentamiento.', 0, 0, 0, 'media/caratulas/nioh.jpg'),
(7, 'Crash Bandicoot N. Sane Trilogy', 'Crash Bandicoot N Sane Trilogy es un videojuego de plataformas en 3D, desarrollado por el estudio Vicarious Visions y producido y distribuido por activision como videojuego exclusivo de PS4, hasta el momento. Se trata de una remasterizaciÃ³n de los tres primeros juegos de la serie Crash Bandicoot aparecidos en la consola PlayStation a finales de los 90 y desarrollados por Naughty Dog, pero mejorados con grÃ¡ficos totalmente renovados, cambios estÃ©ticos y ciertas novedades jugables.', 0, 0, 0, 'media/caratulas/crash.jpg'),
(8, 'Final Fantasy XV', 'Final Fantasy XV es un videojuego de acciÃ³n y rol desarrollado por Square Enix, que en etapas tempranas de desarrollo se dio a conocer bajo el nombre de Final Fantasy versus XIII, para posteriormente pasar a formar parte como la decimoquinta entrega numerada de la saga. AdemÃ¡s sus acontecimientos estÃ¡n relacionados con la pelÃ­cula Final Fantasy XV Kingslaive.', 0, 0, 0, 'media/caratulas/ffxv.jpg'),
(9, 'Injustice 2', 'Injustice 2 para PS4 es el regreso del juego de lucha que enfrenta a todos los hÃ©roes de DC entre sÃ­. En esta ocasiÃ³n vuelven luchadores como Batman, Superman o Wonder Woman, pero hay novedades como Batgirl. Se aÃ±aden nuevos supermovimientos y choques, pero la gran novedad es el sistema de subida de niveles y configuraciÃ³n de los luchadores, que nos reta a seguir avanzando.', 0, 0, 0, 'media/caratulas/injustice.jpg'),
(10, 'NieR: Automata', 'NieR: Automata es un videojuego de acciÃ³n - rol y aventura en tercera persona, que ha sido producido por Square Enix y desarrollado por Platinum Games para PlayStation 4 y PC. El juego se ambienta en una tierra devastada y mostrarÃ¡ los intensos combates que tienen lugar entre las unidades androide Yorha, creadas por los humanos, contra una serie de seres biomecÃ¡nicos alienÃ­genas que obligan a la humanidad a abandonar la Tierra y huir hacia la luna. El diseÃ±o de los personajes corre a cabo del creativo japonÃ©s Akihiko Yoshida, conocido por haber participado regularmente en las entregas de Final Fantasy.', 0, 0, 0, 'media/caratulas/nier.jpg'),
(11, 'Animal Crossing: New Leaf', 'Una de las sagas mÃ¡s populares de los Ãºltimos aÃ±os llega a la 3DS dando un giro total en experiencias y jugabilidad. En esta ocasiÃ³n el jugador se convertirÃ¡ en el alcalde y tendrÃ¡ en sus manos un gran nÃºmero de diseÃ±os y posibilidades de personalizaciÃ³n. Asimismo el tÃ­tulo cuenta con un espacio jugable mucho mayor, un nÃºmero ingente de vecinos y mÃ¡s y mejores comercios. Una experiencia innovadora de juego en comunidad para que el jugador interactue con sus amigos en la vida real.', 0, 0, 0, 'media/caratulas/acnl.jpg'),
(12, 'PokÃ©mon Ultrasol / Ultraluna', 'PokÃ©mon Ultrasol y Ultraluna, son dos videojuegos RPG ambientados en el mundo de PokÃ©mon , desarrollados por el estudio Game Freak y produciodos y distribuidos por Nintendo como juegos exclusivos de sus plataformas Nintendo 3DS y 2DS. Se trata de las revisiones ampliadas de PokÃ©mon Sol / Luna, pero contarÃ¡n con una historia totalmente nueva cuyos acontecimientos tambiÃ©n se desarrollarÃ¡n en Alola, la tierra paradisÃ­aca de PokÃ©mon y tendrÃ¡n que vez con el misterioso PokÃ©mon Necrozma y su capacidad de fusionarse con otros PokÃ©mon.', 0, 0, 0, 'media/caratulas/pus.jpg'),
(13, 'God of War', 'God of War es la vuelta de Kratos a los videojuegos tras la trilogÃ­a original. Esta nueva entrega para PlayStation 4, si bien mantendrÃ¡ varios de los ingredientes indivisibles de su jugabilidad, apostarÃ¡ por un nuevo comienzo para el personaje y una ambientaciÃ³n nÃ³rdica, ofreciÃ©ndonos una perspectiva mÃ¡s madura y realista de la mitologÃ­a de dioses y monstruos milenarios habitual en la serie de tÃ­tulos. En God of War, Kratos serÃ¡ un guerrero mÃ¡s curtido y pasivo, pues tendrÃ¡ que desempeÃ±ar el rol de padre en un frÃ­o y hostil escenario, al que parece haberse retirado para olvidar su pasado.', 0, 0, 0, 'media/caratulas/gow.jpg'),
(14, 'Octopath Traveler', 'Project Octopath Traveler es un videojuego de rol japonÃ©s de corte clÃ¡sico diseÃ±ado por Square Enix para Nintendo Switch. Ahondando en conceptos habituales dentro del gÃ©nero, y haciendo acopio de un estilo artÃ­stico que busca imitar las fortalezas y nostÃ¡lgicas debilidades de los videojuegos propios de la Ã©poca de las consolas de 32 bits, sus creadores buscan devolver los tÃ­tulos de rol a sus raÃ­ces sin alardes de ningÃºn tipo.', 0, 0, 0, 'media/caratulas/ot.jpg'),
(15, 'Azure Striker Gunvolt: Striker Pack', 'Azure Striker Gunvolt: Striker Pack para Nintendo Switch se trata de una compilaciÃ³n que reÃºne para la consola de Nintendo los juegos Azure Striker Gunvolt y Azure Striker Gunvolt 2. El tÃ­tulo cuenta con soporte para la vibraciÃ³n HD, un nuevo tema musical y todos los contenidos de los juegos originarios de Nintendo 3DS, asÃ­ como todos los contenidos adicionales que se fueron lanzando para ellos. Entre las mejoras tÃ©cnicas estarÃ¡n los grÃ¡ficos con 60 imÃ¡genes por segundo.', 0, 0, 0, 'media/caratulas/asgs.jpg'),
(16, 'Cuphead', 'Cuphead es un videojuego de plataformas y acciÃ³n en 2D desarrollado por Studio MDHR y distribuido por Microsoft para las plataformas de Xbox One y PC.Sin lugar a dudas el punto mÃ¡s fuerte de cuphead es su apartado grÃ¡fico y artÃ­stico, el cual busca emular el estilo de las pelÃ­culas y cortos de animaciÃ³n de hace varias dÃ©cadas. Este tÃ­tulo tendrÃ¡ un mapa mundi jugable con algunos secretos y misiones secundarias, formado por varios niveles de transiciÃ³n que completar desde un comienzo a un final y 30 jefes finales o bosses a los que tendremos que enfrentarnos, los cuales son el alma, personalidad y razÃ³n del tÃ­tulo.', 0, 0, 0, 'media/caratulas/cuphead.jpg'),
(17, 'Sea of Thieves', 'Sea of Thieves es el nuevo videojuego online multijugador de piratas exclusivo de Microsoft, desarrollado por Rare y producido por Microsoft para las plataformas de Xbox One y PC. En esta ocasiÃ³n, visitaremos un mundo dinÃ¡mico de ambientaciÃ³n paradisiaca, en el que a travÃ©s de un modo multijugador viviremos diferentes aventuras como piratas. Rare ha puesto especial atenciÃ³n en desatar el espÃ­ritu de bucanero del jugador, ofreciendo diversas actividades, desde beber ron a buscar tesoros, navegar o combatir contra otras tripulaciones a lo largo y ancho de un universo alegre y colorido.', 0, 0, 0, 'media/caratulas/sot.jpg'),
(18, 'Spider-Man', 'Spider-Man para PS4 es un videojuego de acciÃ³n y aventuras con un estilo jugable de mundo abierto, que permite al jugador desplazarse de un lugar a otro con total libertad de movimientos y que tiene por escenario donde se desarrolla la historia, la ciudad de Nueva York. La historia, totalmente original y nunca antes contada, nos pone en la piel de un Peter Parker mucho mÃ¡s experimentado y maduro que deberÃ¡ lidiar con los problemas que suponen el tener que salvar a una ciudad entera como Manhattan de las atrocidades de los peores criminales y compatibilizarlo con su vida personal.', 0, 0, 0, 'media/caratulas/spider.png'),
(19, 'Gears of War 4', 'Se trata de la secuela de la reconocida serie de juegos de disparos en tercera persona, esta vez para Xbox One que progresarÃ¡ en la jugabilidad de la serie manteniendo el componente emocional de la historia y que sacarÃ¡ provecho de el ya popular modo multijugador. El juego nos volverÃ¡ a traer las historia de la guerra infinita contra los enemigos que amenazan a la humanidad y la lucha por salvar a los pocos supervivientes de el conflicto iniciado el terrible dÃ­a D y que cambiÃ³ el rumbo de la historia de la humanidad.', 0, 0, 0, 'media/caratulas/gow4.jpg'),
(20, 'The Legend of Zelda: Breath of the Wild', 'The Legend of Zelda: Breath of the Wild es un videojuego exclusivo de Nintendo, desarrollado, producido y distribuido por la misma compaÃ±Ã­a, para las videoconsolas Wii U y Nintendo Switch. Se trata de la decimo-octava entrega de la saga Zelda, pero tambiÃ©n es el primer juego de la popular serie para la consola de Ãºltima generaciÃ³n de Nintendo. El tÃ­tulo promete un estilo visual completamente nuevo con el que desmarcarse de todo lo visto hasta el momento con colores muy vivos y llamativos y unos grÃ¡ficos que aprovechan a la perfecciÃ³n la tÃ©cnica de Cel Shading. De igual forma su director Eiji Anouma prometiÃ³ cambios sustanciales en lo que a jugabilidad se refiere.', 0, 0, 0, 'media/caratulas/tloz.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `IDMENSAJE` int(4) NOT NULL,
  `ASUNTO` varchar(20) NOT NULL,
  `EMISOR` int(4) NOT NULL,
  `RECEPTOR` int(4) NOT NULL,
  `MENSAJE` longtext NOT NULL,
  `HILO` int(4) NOT NULL,
  `FECHA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `IDNOVEDAD` int(4) NOT NULL,
  `TITULO` varchar(100) NOT NULL,
  `CONTENIDO` longtext NOT NULL,
  `IMAGEN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`IDNOVEDAD`, `TITULO`, `CONTENIDO`, `IMAGEN`) VALUES
(1, 'Divinity: Original Sin II Definitive Edition, el 31 de agosto en PS4 y Xbox One', '\'Divinity: Original Sin II\' es, posiblemente, uno de los mejores RPG de corte occidental que podemos encontrar en la plataforma PC, donde debutÃ³ a mediados de septiembre del aÃ±o pasado para ofrecer a sus jugadores una experiencia Ãºnica y cargada de cientos de horas de juego. Al cargo de esta entrega se ha encontrado el equipo de Larian Studios, quien ha trabajado durante varios aÃ±os para ofrecer un tÃ­tulo mÃ¡s grande que su antecesor y con algunas novedades. Tras su paso por PC, donde ha cosechado crÃ­ticas muy positivas, ahora le toca el turno a los usuarios de consolas poder disfrutar de la experiencia que ofrece Divinity: Original Sin II. El mes lanzamiento del tÃ­tulo de Larian Studios en consolas fue confirmado hace dos meses, pero restaba por conocer el dÃ­a exacto para su puesta a la venta.\r\nBandai Namco, que serÃ¡ la compaÃ±Ã­a encargada de publicar esta entrega en los sistemas PlayStation 4 y Xbox One, ha confirmado que el dÃ­a elegido para poner Divinity: Original Sin 2 a la venta es el prÃ³ximo 31 de agosto. A partir de este dÃ­a, los jugadores de las consolas citadas podrÃ¡n adentrarse en un mundo plagado de posibilidades casi infinitas y que podremos recorrer en solitario o en compaÃ±Ã­a de otros usuarios. Esta entrega, cuyo nombre serÃ¡ \'Divinity: Original Sin II Definitive Edition\', contarÃ¡ con algunas mejoras para facilitar el acceso a los jugadores, asÃ­ como nuevas actualizaciones. En principio, esta versiÃ³n deberÃ­a contar con la traducciÃ³n al castellano que anunciÃ³ Larian Studios para PC y que llegÃ³ a finales del mes de abril.', 'media/novedades/1.jpg'),
(2, 'Kingdom Hearts 3 presenta sus diferentes ediciones de lanzamiento', 'Tras numerosos detalles ofrecidos, \'Kingdom Hearts 3\' ha confirmado en los Ãºltimos dÃ­as su fecha de lanzamiento: el 29 de enero de 2019 en PlayStation 4 y Xbox One. El tÃ­tulo de Square Enix ha presentado ademÃ¡s en el E3 2018 dos trÃ¡ilers variando alguna que otra escena, aunque ahora se ha apostado por anunciar un dato muy interesante para los fieles seguidores de la franquicia. \'Kingdom Hearts 3\' contarÃ¡ con diferentes ediciones de lanzamiento ademÃ¡s de la estÃ¡ndar y la digital. Por un lado, se ha presentado una ediciÃ³n Deluxe que contarÃ¡ con una caja steelbook junto a un libro de arte y un pin exclusivo por un precio de 89,99 â‚¬. Por otro lado, la tienda de Square Enix venderÃ¡ en exclusiva esta misma ediciÃ³n acompaÃ±ada de las figuras Bring Arts de Sora, Donald y Goofy con sus trajes del mundo de Toy Story por un precio de 229,99 â‚¬.\r\n', 'media/novedades/2.jpg'),
(3, 'Assassin\'s Creed Odyssey; filtrada su fecha de lanzamiento', 'Si ha habido un tÃ­tulo que ha sido filtrado hasta la saciedad hasta el punto de parecer que se estaban ensaÃ±ando, ese ha sido \'Assassin\'s Creed Odyssey\', nuevo tÃ­tulo de la popular franquicia del cual se han podido conocer nuevos detalles recientemente tras una nueva filtraciÃ³n, en este caso masiva, incluyendo diversos datos sobre el juego como su fecha de lanzamiento, la cual ha sido fijada para el prÃ³ximo 5 de octubre en PlayStation 4, Xbox One y PC. Y entre los otros detalles, a modo de introducciÃ³n, ya se puede confirmar que, emulando lo visto en \'Assassin\'s Creed Syndicate\', el juego contarÃ¡ con dos protagonistas, uno femenino y otro masculino. Toda la informaciÃ³n que os contamos ha surgido a raÃ­z de un embargo que se han saltado en Estados Unidos, e cual ha sido rÃ¡pidamente eliminado sin poder evitar que Internet haga de las suyas, de esta forma, ya podemos confirmar que el tÃ­tulo contarÃ­a con la opciÃ³n de elegir entre un protagonista femenino (Kassanda) y otro masculino (Alexios), ambos viviendo la misma historia como un avatar, aunque sin poder personalizarlos. Asimismo, se ha confirmado que existirÃ¡n conexiones con la Primera CivilizaciÃ³n. En cuanto al mapeado, este es mucho mÃ¡s grande que el de \'Assassin\'s Creed Origins\', llevÃ¡ndonos a Grecia (como ya se sabÃ­a), aunque incluyendo varias regiones que la conforman. Asimismo, hay un mayor Ã©nfasis en los combates, llegando a verse placajes y batallas en el mar.', 'media/novedades/3.jpg'),
(4, 'Starlink: Battle for Atlas anuncia colaboraciÃ³n con Star Fox; llegarÃ¡ el 16 de octubre', '\'Starlink: Battle for Atlas\', tÃ­tulo presentado en el E3 del aÃ±o pasado, ha vuelto en la ediciÃ³n de este aÃ±o con algunas novedades muy interesantes. La primera y mÃ¡s importante de todas es que el tÃ­tulo de Ubisoft ya tiene fecha de lanzamiento en los sistemas PC, PlayStation 4, Xbox One y Nintendo Switch, siendo la elegida por la compaÃ±Ã­a el prÃ³ximo 16 de octubre. A partir de ese dÃ­a, los jugadores de estas plataformas podrÃ¡n disfrutar de una experiencia donde los grandes protagonistas serÃ¡n unas figuras fÃ­sicas en forma de naves que podrÃ¡n interactuar con Starlink: Battle for Atlas. Gracias a ellas, los usuarios que apuesten por el tÃ­tulo de Ubisoft podrÃ¡n adentrarse en un Sistema Solar repleto de planetas y cada uno con su propio ecosistema y vida salvaje, asÃ­ como misiones de todo tipo. La segundad novedad revelada por la compaÃ±Ã­a gala estÃ¡ directamente relacionada con la versiÃ³n destinada a Nintendo Switch, y es que contarÃ¡ con contenido exclusivo que seguro harÃ¡ las delicias de los seguidores de Star Fox. La nave Arwing y Fox McCloud estarÃ¡n disponibles en Starlink: Battle for Atlas para que los jugadores puedan acompaÃ±ar al legendario pilotos en esta experiencia. AdemÃ¡s, contarÃ¡ con misiones adicionales que no habrÃ¡ en otras versiones y que podremos completar no solo con Fox, sino tambiÃ©n con otros personajes del universo Star Fox. Sin duda, se trata de un anuncio bastante interesante y que la compaÃ±Ã­a ha querido completar con una ediciÃ³n especial que incluye el juego, un modelo del Arwing, una figurita de Fox y otros aÃ±adidos adiciones que podÃ©is ver en la imagen que os hemos dejado mÃ¡s abajo. \r\n', 'media/novedades/4.jpg'),
(5, 'Mario + Rabbids: Kingdom Battle Donkey Adventure anuncia su fecha de lanzamiento', 'La conferencia de Ubisoft ya lleva unos minutos en marcha y en ella hemos podido ver toda clase de tÃ­tulos de la compaÃ±Ã­a, tales como \'Beyond: Good & Evil 2\', \'Skull & Bones\', entre otros. Sin embargo, Nintendo Switch tambiÃ©n ha tenido su cita en el evento con uno de los tÃ­tulos mÃ¡s aclamados de la consola, \'Mario + Rabbids: Kingdom Battle\', el cual anunciÃ³ en el mes de enero la llegada de una expansiÃ³n que tendrÃ­a a Donkey Kong como protagonista. Pues bien, tras meses de espera, y a sabiendas de que la expansiÃ³n ha sido bautizada como \'Donkey Kong Adventure\', ya tenemos su fecha de lanzamiento final, la cual se ha fijado para el prÃ³ximo 26 de junio. En cuanto al contenido del mismo, tal y como se ha revelado, Ubisoft Paris y Ubisoft Milan se habrÃ­an unido para llevar a cabo este DLC del tÃ­tulo de Nintendo Switch, el cual contarÃ­a con hasta tres protagonistas: la ya conocidad Rabbids Peach, el popular Donkey Kong y un nuevo tipo de Rabbids llamado Cranky Rabbids, el cual vendrÃ­a a cupar el papel de Cranky Kong, el Donkey Kong original (o no segÃºn el canon que se toque).  Asimismo, segÃºn se ha comentado, este Donkey Kong Adventure  de \'Mario + Rabbids: Kingdom Battle\' tendrÃ­a una duraciÃ³n de aproximadamente 10 horas, siendo asÃ­ que abarcarÃ­a la mitad de la duraciÃ³n del juego base.\r\n', 'media/novedades/5.jpg'),
(6, 'The Division 2 detalla su contenido post-lanzamiento: 3 expansiones gratis', '\'Tom Clancy\'s The Division 2\', nueva entrega de la serie de acciÃ³n creada por el estudio Ubisoft Massive, ha sido otro de los protagonistas en la conferencia programada por la compaÃ±Ã­a. Tras un mostrar un nuevo trÃ¡iler de corte CGI, uno de los desarrolladores de Tom Clancy\'s The Division 2 ha entrado en el escenario para tratar algunas de las novedades que estÃ¡n introduciendo en Ã©l. Una de las nuevas funciones que veremos en el tÃ­tulo de Ubisoft Massive es la implementaciÃ³n de Incursiones para que los jugadores tengan la oportunidad de vivir nuevas aventuras en la ciudad de Washington, que es donde tendrÃ¡n lugar los hechos del juego, tras completar la historia principal del juego. SegÃºn el estudio, en ellas podrÃ¡n participar hasta un mÃ¡ximo de ocho jugadores. Con esta medida, el estudio corregirÃ¡ uno de los grandes problemas del primer juego y que trajo de cabeza a los jugadores. AdemÃ¡s de esta implementaciÃ³n, los jugadores de Tom Clancy\'s The Division 2 tendrÃ¡n la oportunidad de acceder a nuevas especializaciones y cada una de ellas tendrÃ¡ su propio sistema de progresiÃ³n con habilidades Ãºnicas para potenciar la jugabilidad. Por supuesto, esto incluye el poder acceder a nuevas armas, herramientas y mÃ¡s cosas que podremos usar tanto en el PvE como en el PvP. La experiencia original contarÃ¡ con contenido adicional post-lanzamiento, entre los cuales podemos destacar tres expansiones gratuitas que llegarÃ¡n en meses posteriores al estreno del tÃ­tulo de Ubisoft Massive. La compaÃ±Ã­a pondrÃ¡ a la venta un pase premium opciones que darÃ¡ acceso a un aÃ±o de extras completamente exclusivos.\r\n', 'media/novedades/6.jpg'),
(7, 'Final Fantasy XIV Stormblood anuncia una colaboraciÃ³n con Monster Hunter World', '\'Final Fantasy XIV Online\' es uno de los mayores Ã©xitos de Square Enix en la actualidad, contando con una comunidad que no falla a su cita. Y de a misma forma, estos nos han faltado a la cita con el E3, siendo asÃ­ que en la conferencia reciÃ©n celebrada de Square Enix hemos podido ver como el tÃ­tulo cuenta con una nueva actualizaciÃ³n anunciada, la cual trae como principal una nueva colaboraciÃ³n, mÃ¡s concretamente con \'Monster Hunter World\', el aclamado tÃ­tulo de Capcom lanzado para PS4, Xbox One y PC, aunque esto Ãºltimo el prÃ³ximo mes de octubre. En cuanto al trÃ¡iler mostrado, lo primero que se ha podido ver ha sido un adelanto del prÃ³ximo parche 4.3 de \'Final Fantasy XIV Stormblood\', el cual ha sido bautizado como Under the Moonlight. Sin embargo, no han tardado demasiado tiempo en mostrar la autÃ©ntica chicha del trÃ¡iler, el cual venÃ­a confirmando la colaboraciÃ³n entre ambos tÃ­tulos con la inclusiÃ³n de un Rathalos en el juego, asÃ­ como lo que parecen ser cazadores con la indumentaria de personajes clÃ¡sicos de la saga como Vivi y Auron. De igual forma, se ha anunciado que dicho crossover con \'Monster Hunter World\' se llevarÃ¡ a cabo en verano, aunque sin llegar a concretar una fecha exacta.\r\n', 'media/novedades/7.jpg'),
(8, 'FIFA 19 tambiÃ©n llegarÃ¡ a PlayStation 3 y Xbox 360', 'Tras el anuncio y presentaciÃ³n de \'FIFA 19\' para PlayStation 4, Xbox One, Nintendo Switch y PC el pasado sÃ¡bado 9 de junio en la conferencia de EA por el E3 2018, las dudas sobre el lanzamiento del tÃ­tulo en la antigua generaciÃ³n fueron sembradas, pues ya existÃ­a una incertidumbre en los meses anteriores debido a algunos rumores. Sin embargo, EA Sports ha confirmado que \'FIFA 19\' llegarÃ¡ a PlayStation 3 y Xbox 360 el prÃ³ximo 29 de septiembre como \'FIFA 19 Legacy\', una ediciÃ³n de la que promete compartir mÃ¡s detalles a lo largo de los prÃ³ximos meses. Os recordamos que en los Ãºltimos aÃ±os, la ediciÃ³n Legacy de la saga FIFA ha contado con una gran serie de limitaciones comparado con la versiÃ³n de actual generaciÃ³n. Sin embargo, se trata de una buena noticia para aquellos que siguen la entrega deportiva anual en sus antiguas consolas. La gran novedad de \'FIFA 19\' serÃ¡ la llegada de la Champions League. No hay escalÃ³n mÃ¡s alto a nivel de clubes de fÃºtbol que la UEFA Champions League. En este torneo histÃ³rico en el que compiten los mejores clubes del mundo se cumplen sueÃ±os y se forjan leyendas. El videojuego contarÃ¡ con la presentaciÃ³n de partidos oficiales a las diferentes experiencias de torneos, que incluyen la Europa League y la Supercopa, y al nuevo equipo de comentaristas formado por Derek Rae y Lee Dixon.\r\n', 'media/novedades/8.jpg'),
(9, 'Just Cause 4 es oficial; llegarÃ¡ a PS4, Xbox One y PC el prÃ³ximo 4 de diciembre', 'Poco antes del inicio del E3 2018, gracias a una filtraciÃ³n realizada por Steam para ser un poco mÃ¡s precisos, conocimos que el equipo de Avalanche Studios, ademÃ¡s es estar colaborando en el desarrollo de la segunda entrega Rage, tambiÃ©n se encuentra en pleno de proceso de elaboraciÃ³n de una nueva entrega de la serie \'Just Cause\'. Una nueva entrega que tuvimos la ocasiÃ³n de ver, de forma oficial, durante la conferencia celebrada por Microsoft el pasado 10 de junio. El agente Rico RodrÃ­guez volverÃ¡ este aÃ±o para ofrecer nuevas experiencias a los amantes de esta serie gracias al lanzamiento de \'Just Cause 4\', que estarÃ¡ disponible en los sistemas PC, PlayStation 4 y Xbox One. La nueva entrega llegarÃ¡ a las tiendas a partir del 4 de diciembre de este mismo aÃ±o. En \'Just Cause 4\', tÃ­tulo desarrollado por el estudio Avalanche, tendremos que vernos las caras contra un grupo de mercenarios llamado \"The Black Hand\" y poner fin a sus actividades. Para ello, el protagonista de la serie contarÃ¡ con toda clase de armas y vehÃ­culos (coches, lanchas, aviones y mÃ¡s) a su servicio, que nos ayudarÃ¡n a recorrer el vasto mundo creado para el juego. Al igual que anteriores entregas, el escenario serÃ¡ uno de los puntos clave para ofrecer a los jugadores una experiencia de lo mÃ¡s completa. AdemÃ¡s de enfrentarse contra un poderoso grupo de mercenarios, el agente Rico RodrÃ­guez tendrÃ¡ que verse las caras contra las fuerzas de la naturaleza, algo que podemos ver en el trÃ¡iler compartido por el estudio, entre ellos un devastador tornado.\r\n', 'media/novedades/9.jpg'),
(10, 'Dying Light 2 es real; llegarÃ¡ a PC, PS4 y Xbox One\r\n', 'A finales del pasado mes de mayo os informamos sobre la posibilidad de que el E3 2018 pudiera ser el marco de presentaciÃ³n de una segunda entrega de la serie Dying Light, creada por el estudio polaco Techland. Pues asÃ­ ha sido. Ayer, domingo 10 de junio, durante la conferencia celebrada por el gigante norteamericano Microsoft pudimos ver el primer trÃ¡iler oficial de \'Dying Light 2\'. Tras el Ã©xito logrado por la primera entrega, que no ha parado de recibir soporte por parte del estudio desde su lanzamiento en 2015, era lÃ³gico pensar que los chicos de Techland no iban a dejar pasar la oportunidad de hacer crecer a su licencia con nuevas experiencias. El primer tÃ­tulo cuenta con unas ventas superiores a los 15 millones de unidades, una base muy sÃ³lida para garantizar una secuela. \'Dying Light 2\' ofrecerÃ¡ a los jugadores la oportunidad de adentrarse en un mundo abierto plagado de zombies y disfrutar de las mismas mecÃ¡nicas del original, junto a otras nuevas. El estudio polaco, con el fin de ofrecer una experiencia mÃ¡s completa y compleja, ha implementado una rueda de diÃ¡logo que permitirÃ¡ a los jugadores poder profundizar en las conversaciones con los personajes que se encontrarÃ¡n por el camino y asÃ­ forjar su propio camino. AdemÃ¡s, las decisiones que tomemos durante la aventura afectarÃ¡ a la historia y eso ofrecerÃ¡ diferentes consecuencias. El nuevo tÃ­tulo de Techland seguirÃ¡ apostando por mecÃ¡nicas como el parkour, la personalizaciÃ³n de armas y, por supuesto, la noche. Salir en este momento del dÃ­a era muy peligroso y en la secuela serÃ¡ igual, pues los enemigos serÃ¡n mÃ¡s poderosos.\r\n', 'media/novedades/10.jpg');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votaciones`
--

CREATE TABLE `votaciones` (
  `IDUSUARIO` int(4) NOT NULL,
  `IDJUEGO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `IDCOMENTARIO` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `IDMENSAJE` int(4) NOT NULL AUTO_INCREMENT;

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

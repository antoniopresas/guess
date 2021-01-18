-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-01-2021 a las 19:11:15
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `game`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game`
--

CREATE TABLE `game` (
  `id_game` int(11) NOT NULL,
  `title` char(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `class_game` enum('kid','teenAger','adult') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `gamename_time_nick`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `gamename_time_nick` (
`SUM(score.played_time)` decimal(32,0)
,`nick` char(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `match_game`
--

CREATE TABLE `match_game` (
  `id_match` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `id_game` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `nick_puntuacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `nick_puntuacion` (
`nick` char(50)
,`score` mediumint(9)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player`
--

CREATE TABLE `player` (
  `id_player` int(11) NOT NULL,
  `nick` char(50) NOT NULL,
  `password` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `score`
--

CREATE TABLE `score` (
  `id_score` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  `score` mediumint(9) NOT NULL,
  `played_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `scoremax_player`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `scoremax_player` (
`nick` char(50)
,`MAX(score.score)` mediumint(9)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `gamename_time_nick`
--
DROP TABLE IF EXISTS `gamename_time_nick`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gamename_time_nick`  AS  select sum(`score`.`played_time`) AS `SUM(score.played_time)`,`player`.`nick` AS `nick` from (((`game` join `match_game` on((`id_game` = `match_game`.`id_game`))) join `score` on((`score`.`id_match` = `match_game`.`id_match`))) join `player` on((`player`.`id_player` = `match_game`.`id_player`))) group by `player`.`nick` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `nick_puntuacion`
--
DROP TABLE IF EXISTS `nick_puntuacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nick_puntuacion`  AS  select `player`.`nick` AS `nick`,`score`.`score` AS `score` from ((`player` join `match_game` on((`player`.`id_player` = `match_game`.`id_player`))) join `score` on((`match_game`.`id_match` = `score`.`id_match`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `scoremax_player`
--
DROP TABLE IF EXISTS `scoremax_player`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `scoremax_player`  AS  select `player`.`nick` AS `nick`,max(`score`.`score`) AS `MAX(score.score)` from ((`player` join `match_game` on((`player`.`id_player` = `match_game`.`id_player`))) join `score` on((`match_game`.`id_match` = `score`.`id_match`))) group by `player`.`nick` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id_game`);

--
-- Indices de la tabla `match_game`
--
ALTER TABLE `match_game`
  ADD PRIMARY KEY (`id_match`),
  ADD KEY `id_player` (`id_player`),
  ADD KEY `id_game` (`id_game`);

--
-- Indices de la tabla `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id_player`);

--
-- Indices de la tabla `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id_score`),
  ADD KEY `id_match` (`id_match`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `game`
--
ALTER TABLE `game`
  MODIFY `id_game` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `match_game`
--
ALTER TABLE `match_game`
  MODIFY `id_match` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `player`
--
ALTER TABLE `player`
  MODIFY `id_player` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `score`
--
ALTER TABLE `score`
  MODIFY `id_score` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `match_game`
--
ALTER TABLE `match_game`
  ADD CONSTRAINT `match_game_ibfk_1` FOREIGN KEY (`id_player`) REFERENCES `player` (`id_player`),
  ADD CONSTRAINT `match_game_ibfk_3` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`);

--
-- Filtros para la tabla `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`id_match`) REFERENCES `match_game` (`id_match`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

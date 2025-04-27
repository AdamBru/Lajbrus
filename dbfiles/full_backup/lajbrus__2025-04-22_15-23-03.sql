-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 22, 2025 at 03:23 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lajbrus`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dzien`
--

CREATE TABLE `dzien` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dzien`
--

INSERT INTO `dzien` (`id`, `nazwa`) VALUES
(1, 'Poniedział'),
(2, 'Wtorek'),
(3, 'Środa'),
(4, 'Czwartek'),
(5, 'Piątek');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `godzina`
--

CREATE TABLE `godzina` (
  `id` int(11) NOT NULL,
  `od` time DEFAULT NULL,
  `do` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `godzina`
--

INSERT INTO `godzina` (`id`, `od`, `do`) VALUES
(1, '08:00:00', '08:45:00'),
(2, '08:55:00', '09:40:00'),
(3, '09:50:00', '10:35:00'),
(4, '10:55:00', '11:40:00'),
(5, '11:45:00', '12:30:00'),
(6, '12:35:00', '13:20:00'),
(7, '13:25:00', '14:10:00'),
(8, '14:15:00', '15:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasa`
--

CREATE TABLE `klasa` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(10) DEFAULT NULL,
  `rocznik` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `klasa`
--

INSERT INTO `klasa` (`id`, `nazwa`, `rocznik`) VALUES
(1, '1A', 2025),
(2, '1B', 2025),
(3, '1C', 2025),
(4, '2A', 2025),
(5, '2B', 2025),
(6, '2C', 2025),
(7, '3A', 2025),
(8, '3B', 2025),
(9, '3C', 2025),
(10, '4A', 2025),
(11, '4B', 2025),
(12, '4C', 2025),
(13, '5A', 2025),
(14, '5B', 2025),
(15, '5C', 2025),
(16, '6A', 2025),
(17, '6B', 2025),
(18, '6C', 2025),
(19, '7A', 2025),
(20, '7B', 2025),
(21, '7C', 2025),
(22, '8A', 2025),
(23, '8B', 2025),
(24, '8C', 2025);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekcja`
--

CREATE TABLE `lekcja` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `id_klasy` int(7) NOT NULL,
  `id_przedmiotu` int(7) NOT NULL,
  `id_nauczyciela` int(7) NOT NULL,
  `temat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lekcja`
--

INSERT INTO `lekcja` (`id`, `data`, `id_klasy`, `id_przedmiotu`, `id_nauczyciela`, `temat`) VALUES
(1, '2025-04-22 14:39:46', 12, 2, 9, 'Zapoznanie z PZO i programem nauczania z języka angielskiego w klasie 4');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `plan`
--

CREATE TABLE `plan` (
  `id_klasy` int(11) DEFAULT NULL,
  `id_przedmiotu` int(11) DEFAULT NULL,
  `id_nauczyciela` int(11) DEFAULT NULL,
  `id_pracowni` int(11) DEFAULT NULL,
  `id_dnia` int(11) DEFAULT NULL,
  `id_godziny` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownia`
--

CREATE TABLE `pracownia` (
  `id` int(11) NOT NULL,
  `numer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pracownia`
--

INSERT INTO `pracownia` (`id`, `numer`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 101),
(8, 102),
(9, 103),
(10, 104),
(11, 105),
(12, 106),
(13, 201),
(14, 202),
(15, 203),
(16, 204),
(17, 205),
(18, 206),
(19, 301),
(20, 302),
(21, 303),
(22, 304),
(23, 305),
(24, 306),
(25, 401),
(26, 402),
(27, 403),
(28, 404),
(29, 405),
(30, 406),
(31, 601),
(32, 602),
(33, 603),
(34, 604),
(35, 605),
(36, 606);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `przedmiot`
--

INSERT INTO `przedmiot` (`id`, `nazwa`) VALUES
(1, 'Język polski'),
(2, 'Język angielski'),
(3, 'Język niemiecki'),
(4, 'Matematyka'),
(5, 'Chemia'),
(6, 'Biologia'),
(7, 'Geografia'),
(8, 'Fizyka'),
(9, 'Wychowanie fizyczne'),
(10, 'Religia'),
(11, 'Wiedza o kulturze'),
(12, 'Wiedza o społeczeństwie'),
(13, 'Historia'),
(14, 'Plastyka'),
(15, 'Technika'),
(16, 'Informatyka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rel_nauczyciel_klasy`
--

CREATE TABLE `rel_nauczyciel_klasy` (
  `id_nauczyciela` int(11) DEFAULT NULL,
  `id_klasy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='(id) klas przypisane do (id) nauczyciela';

--
-- Dumping data for table `rel_nauczyciel_klasy`
--

INSERT INTO `rel_nauczyciel_klasy` (`id_nauczyciela`, `id_klasy`) VALUES
(2, 1),
(2, 2),
(2, 3),
(4, 4),
(4, 5),
(4, 6),
(8, 7),
(8, 8),
(8, 9),
(9, 10),
(9, 11),
(9, 12),
(11, 13),
(11, 14),
(11, 15),
(12, 16),
(12, 17),
(12, 18),
(13, 19),
(13, 20),
(13, 21),
(15, 22),
(15, 23),
(15, 24),
(4, 1),
(8, 1),
(9, 2),
(11, 2),
(12, 2),
(13, 3),
(15, 3),
(17, 3),
(20, 4),
(22, 4),
(23, 4),
(24, 5),
(25, 5),
(27, 5),
(28, 6),
(29, 6),
(30, 6),
(31, 7),
(32, 7),
(34, 7),
(35, 8),
(37, 8),
(39, 8),
(40, 9),
(41, 9),
(42, 9),
(43, 10),
(44, 10),
(45, 10),
(46, 11),
(47, 11),
(49, 11),
(50, 12),
(52, 12),
(53, 12),
(55, 13),
(56, 13),
(57, 13),
(58, 14),
(59, 14),
(60, 14),
(61, 15),
(62, 15),
(63, 15),
(64, 16),
(65, 16),
(66, 16),
(67, 17),
(68, 17),
(69, 17),
(70, 18),
(71, 18),
(72, 18),
(73, 19),
(75, 19),
(76, 19),
(77, 20),
(78, 20),
(79, 20),
(80, 21),
(81, 21),
(85, 21),
(86, 22),
(87, 22),
(91, 22),
(95, 23),
(98, 23),
(99, 23),
(100, 24),
(103, 24),
(105, 24);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rel_nauczyciel_pracownia`
--

CREATE TABLE `rel_nauczyciel_pracownia` (
  `id_nauczyciela` int(11) DEFAULT NULL,
  `id_pracowni` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rel_nauczyciel_pracownia`
--

INSERT INTO `rel_nauczyciel_pracownia` (`id_nauczyciela`, `id_pracowni`) VALUES
(62, 1),
(12, 2),
(65, 3),
(73, 4),
(76, 5),
(68, 6),
(70, 7),
(31, 8),
(64, 9),
(45, 10),
(41, 11),
(48, 12),
(13, 13),
(3, 14),
(57, 15),
(77, 16),
(82, 17),
(47, 18),
(59, 19),
(54, 20),
(10, 21),
(9, 22),
(86, 23),
(60, 24),
(72, 25),
(23, 26),
(79, 27),
(63, 28),
(29, 29),
(43, 30),
(78, 31),
(42, 32),
(53, 33),
(16, 34),
(33, 35),
(36, 36),
(2, 18);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rel_nauczyciel_przedmiot`
--

CREATE TABLE `rel_nauczyciel_przedmiot` (
  `id` int(11) NOT NULL,
  `id_nauczyciela` int(11) DEFAULT NULL,
  `id_przedmiotu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rel_nauczyciel_przedmiot`
--

INSERT INTO `rel_nauczyciel_przedmiot` (`id`, `id_nauczyciela`, `id_przedmiotu`) VALUES
(1, 2, 4),
(2, 2, 8),
(3, 4, 1),
(4, 8, 4),
(5, 9, 2),
(6, 11, 8),
(7, 12, 3),
(8, 13, 13),
(9, 15, 6),
(10, 17, 5),
(11, 20, 9),
(12, 22, 10),
(13, 23, 1),
(14, 24, 11),
(15, 25, 12),
(16, 27, 4),
(17, 28, 14),
(18, 29, 15),
(19, 30, 16),
(20, 31, 7),
(21, 32, 2),
(22, 34, 3),
(23, 35, 8),
(24, 37, 9),
(25, 39, 13),
(26, 40, 10),
(27, 41, 1),
(28, 42, 4),
(29, 43, 5),
(30, 44, 11),
(31, 45, 6),
(32, 46, 12),
(33, 47, 7),
(34, 49, 2),
(35, 50, 3),
(36, 52, 8),
(37, 53, 1),
(38, 55, 4),
(39, 56, 9),
(40, 57, 13),
(41, 58, 10),
(42, 59, 14),
(43, 60, 15),
(44, 61, 16),
(45, 62, 6),
(46, 63, 5),
(47, 64, 7),
(48, 65, 2),
(49, 66, 3),
(50, 67, 8),
(51, 68, 1),
(52, 69, 4),
(53, 70, 11),
(54, 71, 12),
(55, 72, 9),
(56, 73, 13),
(57, 75, 10),
(58, 76, 14),
(59, 77, 15),
(60, 78, 16),
(61, 79, 5),
(62, 80, 6),
(63, 81, 7),
(64, 4, 13),
(65, 8, 9),
(66, 23, 11),
(67, 31, 12),
(68, 41, 8),
(69, 42, 6),
(70, 53, 10),
(71, 68, 14),
(72, 72, 5),
(73, 76, 16);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rel_opiekun_uczen`
--

CREATE TABLE `rel_opiekun_uczen` (
  `id_opiekuna` int(11) DEFAULT NULL,
  `id_ucznia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rel_opiekun_uczen`
--

INSERT INTO `rel_opiekun_uczen` (`id_opiekuna`, `id_ucznia`) VALUES
(444, 173),
(444, 254),
(169, 17),
(169, 483),
(434, 242),
(434, 418),
(358, 224),
(358, 413),
(170, 206),
(170, 463),
(129, 210),
(129, 249),
(121, 140),
(121, 335),
(356, 237),
(356, 219),
(128, 318),
(128, 103),
(125, 116),
(125, 168),
(171, 472),
(171, 49),
(367, 205),
(367, 303),
(238, 229),
(238, 203),
(126, 298),
(126, 261),
(252, 84),
(252, 443),
(276, 146),
(276, 337),
(359, 440),
(359, 147),
(166, 188),
(166, 172),
(143, 259),
(143, 85),
(446, 132),
(446, 175),
(158, 27),
(158, 392),
(155, 281),
(155, 326),
(260, 309),
(260, 459),
(153, 102),
(153, 469),
(370, 187),
(370, 354),
(368, 11),
(368, 280),
(142, 456),
(142, 319),
(141, 94),
(141, 89),
(159, 185),
(159, 137),
(135, 111),
(135, 233),
(449, 200),
(449, 501),
(256, 251),
(256, 115),
(164, 52),
(164, 457),
(162, 119),
(162, 355),
(139, 19),
(139, 499),
(364, 304),
(364, 471),
(435, 231),
(435, 302),
(366, 466),
(366, 236),
(393, 182),
(393, 405),
(402, 441),
(402, 221),
(212, 409),
(212, 246),
(211, 165),
(211, 163),
(232, 346),
(232, 460),
(207, 156),
(207, 458),
(407, 208),
(407, 340),
(202, 263),
(202, 55),
(218, 316),
(218, 124),
(401, 500),
(401, 179),
(400, 313),
(400, 265),
(399, 373),
(399, 93),
(226, 386),
(226, 279),
(225, 199),
(225, 388),
(230, 488),
(230, 122),
(223, 157),
(223, 130),
(222, 266),
(222, 454),
(395, 415),
(395, 490),
(396, 196),
(396, 414),
(398, 420),
(398, 445),
(201, 98),
(201, 228),
(384, 176),
(384, 419),
(247, 152),
(247, 406),
(421, 274),
(421, 258),
(248, 376),
(248, 353),
(423, 442),
(423, 439),
(181, 410),
(181, 270),
(178, 432),
(178, 391),
(177, 475),
(177, 277),
(426, 312),
(426, 217),
(245, 113),
(245, 397),
(244, 186),
(244, 197),
(189, 145),
(189, 428),
(198, 287),
(198, 195),
(412, 331),
(412, 290),
(240, 404),
(240, 480),
(383, 493),
(383, 310),
(323, 453),
(323, 7),
(192, 371),
(192, 362),
(191, 22),
(191, 194),
(190, 193),
(190, 83),
(174, 227),
(174, 95),
(334, 161),
(334, 489),
(30, 150),
(30, 478),
(80, 492),
(80, 372),
(81, 215),
(81, 75),
(28, 380),
(28, 112),
(87, 431),
(87, 424),
(88, 20),
(88, 352),
(341, 437),
(341, 496),
(299, 305),
(299, 133),
(92, 377),
(92, 447),
(342, 381),
(342, 220),
(26, 361),
(26, 328),
(25, 403),
(25, 481),
(24, 390),
(24, 253),
(296, 363),
(296, 465),
(32, 235),
(32, 394),
(74, 351),
(74, 144),
(71, 268),
(71, 433),
(44, 167),
(44, 474),
(38, 429),
(38, 450),
(46, 468),
(46, 108),
(308, 204),
(308, 495),
(50, 411),
(50, 317),
(51, 462),
(51, 127),
(307, 90),
(307, 389),
(35, 257),
(35, 464),
(56, 275),
(56, 451),
(58, 501),
(58, 314),
(61, 360),
(61, 91),
(66, 379),
(66, 239),
(67, 105),
(67, 369),
(69, 385),
(69, 375),
(96, 461),
(96, 452),
(344, 269),
(344, 486),
(289, 300),
(289, 288),
(107, 216),
(107, 333),
(320, 184),
(320, 332),
(327, 347),
(327, 183),
(110, 131),
(110, 498),
(336, 425),
(336, 476),
(14, 250),
(14, 149),
(286, 34),
(286, 114),
(324, 213),
(324, 134),
(284, 234),
(284, 271),
(267, 282),
(267, 467),
(118, 427),
(118, 154),
(321, 382),
(321, 39),
(5, 209),
(5, 491),
(18, 243),
(18, 484),
(106, 311),
(106, 241),
(294, 436),
(294, 37),
(101, 283),
(101, 422),
(21, 487),
(21, 285),
(104, 273),
(104, 151),
(291, 8),
(291, 322),
(100, 349),
(100, 325),
(99, 329),
(99, 272),
(330, 455),
(330, 497),
(292, 339),
(292, 306),
(345, 482),
(345, 6),
(359, 387),
(225, 365),
(181, 350),
(191, 348),
(398, 357),
(155, 378),
(166, 338),
(240, 374),
(80, 343),
(58, 470),
(308, 473),
(226, 477),
(139, 479),
(32, 494),
(162, 485),
(336, 501),
(407, 416),
(121, 417),
(284, 408),
(398, 448),
(449, 430),
(248, 438),
(56, 148),
(107, 136),
(46, 138),
(128, 160),
(139, 180),
(28, 4),
(395, 15),
(341, 117),
(190, 120),
(291, 109),
(240, 97),
(50, 123),
(396, 264),
(232, 278),
(32, 293),
(342, 295),
(286, 315),
(396, 297),
(46, 301),
(96, 214),
(320, 255),
(426, 262);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rel_uczen_klasa`
--

CREATE TABLE `rel_uczen_klasa` (
  `id_ucznia` int(11) DEFAULT NULL,
  `id_klasy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rel_uczen_klasa`
--

INSERT INTO `rel_uczen_klasa` (`id_ucznia`, `id_klasy`) VALUES
(1, 1),
(3, 1),
(6, 1),
(7, 1),
(10, 1),
(14, 1),
(16, 1),
(18, 1),
(19, 1),
(26, 1),
(33, 1),
(36, 2),
(38, 2),
(48, 2),
(51, 2),
(54, 2),
(74, 2),
(82, 2),
(85, 2),
(87, 2),
(90, 2),
(92, 2),
(95, 2),
(98, 2),
(100, 3),
(99, 3),
(101, 3),
(104, 3),
(291, 3),
(323, 3),
(8, 4),
(28, 4),
(109, 4),
(120, 4),
(240, 4),
(106, 5),
(285, 5),
(283, 5),
(422, 5),
(114, 6),
(286, 6),
(34, 6),
(134, 6),
(213, 6),
(234, 6),
(271, 6),
(39, 7),
(321, 7),
(382, 7),
(154, 7),
(282, 7),
(160, 8),
(4, 8),
(28, 8),
(180, 8),
(15, 8),
(395, 8),
(117, 9),
(341, 9),
(120, 9),
(109, 9),
(97, 9),
(123, 9),
(50, 9),
(264, 10),
(396, 10),
(278, 10),
(232, 10),
(293, 10),
(32, 10),
(295, 10),
(301, 11),
(46, 11),
(214, 11),
(96, 11),
(255, 11),
(320, 11),
(262, 11),
(138, 12),
(46, 12),
(136, 12),
(107, 12),
(148, 12),
(56, 12),
(438, 12),
(430, 13),
(449, 13),
(416, 13),
(407, 13),
(501, 13),
(336, 13),
(485, 13),
(494, 14),
(32, 14),
(479, 14),
(139, 14),
(477, 14),
(226, 14),
(473, 14),
(470, 15),
(58, 15),
(343, 15),
(80, 15),
(374, 15),
(338, 15),
(378, 16),
(155, 16),
(357, 16),
(398, 16),
(348, 16),
(191, 16),
(350, 17),
(181, 17),
(365, 17),
(225, 17),
(387, 17),
(345, 17),
(306, 18),
(292, 18),
(497, 18),
(330, 18),
(272, 18),
(99, 18),
(325, 19),
(100, 19),
(349, 19),
(322, 19),
(291, 19),
(151, 19),
(285, 20),
(21, 20),
(422, 20),
(37, 20),
(294, 20),
(241, 21),
(106, 21),
(484, 21),
(491, 21),
(5, 21),
(209, 21),
(39, 22),
(382, 22),
(154, 22),
(427, 22),
(467, 22),
(118, 23),
(4, 23),
(28, 23),
(180, 23),
(15, 23),
(395, 23),
(117, 24),
(341, 24),
(120, 24),
(109, 24),
(50, 24),
(83, 1),
(84, 2),
(88, 3),
(89, 4),
(93, 5),
(94, 6),
(102, 7),
(108, 8),
(110, 9),
(111, 10),
(112, 11),
(113, 12),
(115, 13),
(116, 14),
(119, 15),
(121, 16),
(122, 17),
(126, 18),
(129, 19),
(130, 20),
(131, 21),
(132, 22),
(133, 23),
(135, 24),
(137, 1),
(143, 2),
(144, 3),
(145, 4),
(146, 5),
(147, 6),
(149, 7),
(150, 8),
(153, 9),
(156, 10),
(159, 11),
(162, 12),
(164, 13),
(166, 14),
(167, 15),
(171, 16),
(172, 17),
(174, 18),
(175, 19),
(178, 20),
(179, 21),
(182, 22),
(183, 23),
(184, 24),
(185, 1),
(186, 2),
(187, 3),
(192, 4),
(193, 5),
(194, 6),
(195, 7),
(196, 8),
(198, 9),
(199, 10),
(202, 11),
(203, 12),
(204, 13),
(205, 14),
(207, 15),
(208, 16),
(212, 17),
(215, 18),
(216, 19),
(218, 20),
(219, 21),
(220, 22),
(223, 23),
(227, 24),
(228, 1),
(230, 2),
(233, 3),
(235, 4),
(236, 5),
(238, 6),
(242, 7),
(245, 8),
(248, 9),
(249, 10),
(250, 11),
(252, 12),
(253, 13),
(254, 14),
(256, 15),
(257, 16),
(258, 17),
(260, 18),
(261, 19),
(263, 20),
(265, 21),
(267, 22),
(268, 23),
(269, 24),
(270, 1),
(273, 2),
(274, 3),
(276, 4),
(277, 5),
(279, 6),
(280, 7),
(281, 8),
(284, 9),
(287, 10),
(289, 11),
(296, 12),
(297, 13),
(299, 14),
(300, 15),
(302, 16),
(303, 17),
(304, 18),
(305, 19),
(308, 20),
(309, 21),
(310, 22),
(311, 23),
(312, 24),
(313, 1),
(314, 2),
(315, 3),
(316, 4),
(317, 5),
(318, 6),
(324, 7),
(327, 8),
(328, 9),
(331, 10),
(332, 11),
(334, 12),
(337, 13),
(339, 14),
(342, 15),
(346, 16),
(347, 17),
(351, 18),
(352, 19),
(353, 20),
(354, 21),
(356, 22),
(359, 23),
(360, 24),
(361, 1),
(362, 2),
(364, 3),
(368, 4),
(370, 5),
(371, 6),
(372, 7),
(373, 8),
(375, 9),
(376, 10),
(377, 11),
(379, 12),
(380, 13),
(381, 14),
(384, 15),
(385, 16),
(386, 17),
(388, 18),
(389, 19),
(390, 20),
(391, 21),
(393, 22),
(402, 23),
(403, 24),
(404, 1),
(405, 2),
(408, 3),
(409, 4),
(410, 5),
(412, 6),
(413, 7),
(414, 8),
(415, 9),
(417, 10),
(418, 11),
(419, 12),
(421, 13),
(423, 14),
(424, 15),
(426, 16),
(428, 17),
(429, 18),
(431, 19),
(432, 20),
(435, 21),
(436, 22),
(437, 23),
(439, 24),
(440, 1),
(441, 2),
(442, 3),
(444, 4),
(446, 5),
(447, 6),
(450, 7),
(451, 8),
(452, 9),
(453, 10),
(454, 11),
(455, 12),
(456, 13),
(457, 14),
(458, 15),
(459, 16),
(460, 17),
(461, 18),
(462, 19),
(463, 20),
(464, 21),
(465, 22),
(466, 23),
(468, 24),
(469, 1),
(471, 2),
(472, 3),
(474, 4),
(475, 5),
(476, 6),
(478, 7),
(480, 8),
(481, 9),
(482, 10),
(483, 11),
(486, 12),
(487, 13),
(488, 14),
(489, 15),
(490, 16),
(492, 17),
(493, 18),
(495, 19),
(496, 20),
(498, 21),
(499, 22),
(500, 23),
(502, 24);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rel_wychowawca_klasa`
--

CREATE TABLE `rel_wychowawca_klasa` (
  `id_wychowawcy` int(11) DEFAULT NULL,
  `id_klasy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rel_wychowawca_klasa`
--

INSERT INTO `rel_wychowawca_klasa` (`id_wychowawcy`, `id_klasy`) VALUES
(76, 1),
(12, 2),
(10, 3),
(47, 4),
(77, 5),
(64, 6),
(60, 7),
(53, 8),
(72, 9),
(43, 10),
(70, 11),
(9, 12),
(65, 13),
(42, 14),
(48, 15),
(54, 16),
(73, 17),
(3, 18),
(78, 19),
(33, 20),
(40, 21),
(13, 22),
(36, 23),
(68, 24);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rola`
--

CREATE TABLE `rola` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rola`
--

INSERT INTO `rola` (`id`, `nazwa`) VALUES
(1, 'Nauczyciel'),
(2, 'Opiekun'),
(3, 'Uczeń');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szczesliwy_numerek`
--

CREATE TABLE `szczesliwy_numerek` (
  `id` int(11) NOT NULL,
  `numer` int(11) NOT NULL,
  `data_losowania` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `szczesliwy_numerek`
--

INSERT INTO `szczesliwy_numerek` (`id`, `numer`, `data_losowania`) VALUES
(1, 23, '2025-04-14 22:42:56'),
(2, 24, '2025-04-16 17:05:32'),
(3, 28, '2025-04-17 00:28:51'),
(4, 7, '2025-04-18 22:16:04'),
(5, 24, '2025-04-19 00:27:28'),
(6, 2, '2025-04-22 14:07:47');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` int(11) NOT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  `data_urodzenia` date DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `haslo` varchar(40) DEFAULT NULL,
  `id_roli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uzytkownik`
--

INSERT INTO `uzytkownik` (`id`, `imie`, `nazwisko`, `data_urodzenia`, `login`, `haslo`, `id_roli`) VALUES
(1, 'Uczeń', 'Uczniowski', '2006-01-04', 'uczen', '6dc9386844119630c9c595588488efad4cf09424', 3),
(2, 'Nauczyciel', 'Nauczycielski', '1989-12-06', 'nauczyciel', 'ce75851e65e5230efbe367dc5698a4244247cc16', 1),
(3, 'Ignacy', 'Skrzypek', '2012-04-01', 'skrzypekignacy', '4717cafcce9559a1adf0ac387e8999f5c32a1ae3', 3),
(4, 'Kajetan', 'Trzaskowski', '1974-02-27', 'trzaskowskikajetan', '31759e056eb277f93467edfd641b40d149894d74', 1),
(5, 'Rozalia', 'Kurtyka', '2013-02-02', 'kurtykarozalia', '81e11913162499d2073f46f2bc9b2426b35a0490', 3),
(6, 'Eryk', 'Włodarczyk', '2012-11-09', 'wlodarczykeryk', '37f8589a580db646d1f853388a15a31a046c9fc0', 3),
(7, 'Celina', 'Klonowska', '2011-03-08', 'klonowskacelina', 'f5643996b396f8ba078e2a54cc28202d30a834b9', 3),
(8, 'Lena', 'Cupiał', '1973-06-01', 'cupiallena', 'b614aa1f756be655de1864a4d45004686309b501', 1),
(9, 'Tomasz', 'Maciejak', '1993-03-28', 'maciejaktomasz', 'e9b4620fd8ecf76db524e4a42bf63b7e118a0198', 1),
(10, 'Hanna', 'Musiałowska', '2013-03-07', 'musialowskahanna', '81f651132fe143f1bf6d1aa43f111274b71838da', 3),
(11, 'Roman', 'Uzibło', '1982-01-14', 'uzibloroman', '879a4b3385568c33273903575c60ed806e1443bf', 1),
(12, 'Paweł', 'Pogwizd', '1970-06-07', 'pogwizdpaweł', '099370579fd33133ab941a4315e47e140c31bca2', 1),
(13, 'Henryka', 'Pieczarka', '1980-06-08', 'pieczarkahenryka', '9ae02dcdf575633fe99605e24a21d370dfd62b71', 1),
(14, 'Ernest', 'Gamór', '2013-02-17', 'gamorernest', '94d0157ad6df34128ab2e184cc3817e86130b719', 3),
(15, 'Daniela', 'Janecka', '1971-04-19', 'janeckadaniela', '5acdb33a67f73b8cb0775528e5e2e5ce58c08a08', 1),
(16, 'Feliksa', 'Żurawska', '2016-05-15', 'zurawskafeliksa', 'fa15234bdc99ab9e69a416e0453e47dca09d2341', 3),
(17, 'Bogdan', 'Lesiewicz', '1995-03-24', 'lesiewiczbogdan', '01ec35f31b68c98f9e899447a0bf234de2ea75be', 1),
(18, 'Grzegorz', 'Kwaśnik', '2013-04-05', 'kwasnikgrzegorz', '95967956dc03febad45d802ed7013ae23c31ee36', 3),
(19, 'Amelia', 'Starzyk', '2012-02-21', 'starzykamelia', 'f19375e003ed02fe213fb9309f6252d6631f583d', 3),
(20, 'Karina', 'Olender', '1988-10-18', 'olenderkarina', '38e069427a82d59056a4032a14802a67e5d79925', 1),
(21, 'Augustyn', 'Brzezicki', '2016-07-07', 'brzezickiaugustyn', '79f4cf52733b66ca1fbda4526840b96ffb87a7b6', 3),
(22, 'Konstanty', 'Drobny', '1993-11-16', 'drobnykonstanty', '76ffd792ea081daf3f1bc9e90612e762f5bf54c8', 1),
(23, 'Wiktoria', 'Rajczakowska', '1974-03-22', 'rajczakowskawiktoria', 'f40ee88eb6d9929482bb52a5a4521baa07783d42', 1),
(24, 'Adela', 'Fras', '1983-11-01', 'frasadela', '92b345cab95cfa05444fda3bf2060874a366f61f', 1),
(25, 'Igor', 'Bartkowski', '1997-10-02', 'bartkowskiigor', '10729ba0d4368d5a099269e98a8bd886b6126594', 1),
(26, 'Bogumił', 'Gliszczyński', '2016-03-28', 'gliszczynskibogumil', '26eac9e647c1713e9214cc15cc6f3ee8e5d12236', 3),
(27, 'Klaudiusz', 'Golba', '1981-12-19', 'golbaklaudiusz', '73cdc35b2d6747ea30951c2a90f5f5bf81097d43', 1),
(28, 'Karina', 'Przybyliska', '1981-07-25', 'przybyliskakarina', '72c7b38907d4fd6327bc093578e2e10e64e8f0c4', 1),
(29, 'Liliana', 'Chen', '1988-06-06', 'chenliliana', 'affd5d4079b509292b235f2af92a5e0405003082', 1),
(30, 'Wiesława', 'Yakovenko', '1975-12-09', 'yakovenkowieslawa', '65042658ac2dc97b48cdbbb1ab24ef5b3e67abaf', 1),
(31, 'Tadeusz', 'Glazowski', '1971-11-04', 'glazowskitadeusz', '36a94540725f0e21b5e79240554ec16bbf4f85d3', 1),
(32, 'Mieczysława', 'Owczarek', '1989-01-17', 'owczarekmieczyslawa', '065235579efb6b913336de5c202166075de2268e', 1),
(33, 'Blanka', 'Wacawczyk', '2014-04-23', 'wacawczykblanka', '755f99a94e19498ca3b1bdf7d36262de9d05270b', 3),
(34, 'Leon', 'Cedro', '1986-02-26', 'cedroleon', '43da050221ec375f79e7188a45db9f766c5626c5', 1),
(35, 'Maksymilian', 'Oczko', '1973-10-01', 'oczkomaksymilian', 'ff11b512dbdd7b66baf1f69aa3837ce62c1a0892', 1),
(36, 'Krystyna', 'Szkutnik', '2015-03-27', 'szkutnikkrystyna', 'd1353938c1f912f09e6a387be5d9e77e9c98666b', 3),
(37, 'Teresa', 'Bogumił', '1982-05-24', 'bogumilteresa', '3d8fbc6c2f64479c258bedfff1b4e024d385eed8', 1),
(38, 'Liliana', 'Jędrzejczak', '2015-09-26', 'jędrzejczakliliana', '787b1c43a12acef1dd42ca0f7e8cfd53437b7b62', 3),
(39, 'Agata', 'Zdrojewska', '1977-06-28', 'zdrojewskaagata', 'e8ad11817e4ca0864d0803f2f4b495f992ebc882', 1),
(40, 'Maksymilian', 'Pasionek', '1980-01-26', 'pasionekmaksymilian', '4fb41f5ab95f858be99808749bd8ed5bde9ca679', 1),
(41, 'Henryk', 'Jakimowicz', '2000-10-28', 'jakimowiczhenryk', '8df266703e25880be6e3fa5311aa346433b00962', 1),
(42, 'Klaudia', 'Rogula', '1994-11-21', 'rogulaklaudia', '1f378557387ee14e47a64a3cbe310d64a19bff38', 1),
(43, 'Sylwester', 'Arendarski', '1990-09-28', 'arendarskisylwester', '289bf86fa4c235e76e9b5f9091ea59d724dfebf1', 1),
(44, 'Edyta', 'Celuch', '1970-03-10', 'celuchedyta', '0ab4a0eab48c4cfb7a49b8bab9c161097c48a6bb', 1),
(45, 'Roksana', 'Martynenko', '1981-04-15', 'martynenkoroksana', '361b7ce10f8f51e7007e111bac012cf8af07e488', 1),
(46, 'Cezary', 'Magnuszewski', '1989-03-24', 'magnuszewskicezary', '2d26817cd7ec24bf05271467f92348179b2f394d', 1),
(47, 'Eugeniusz', 'Skrzypek', '1974-07-26', 'skrzypekeugeniusz', '71ce1636bba96799150254bbb4b8773d3cda555e', 1),
(48, 'Maksym', 'Stachnik', '2016-02-19', 'stachnikmaksym', '79a8a89d9182c6f16d47311da0487698cb261337', 3),
(49, 'Lidia', 'Matuszak', '1992-11-06', 'matuszaklidia', '425bf8c47eb82ed00313f72be33dbe6554548e34', 1),
(50, 'Krzysztof', 'Jagieła', '1991-03-19', 'jagiełakrzysztof', 'c9247a218a22f6aa0bebe5af112bd0314a5201d0', 1),
(51, 'Leokadia', 'Saienko', '2015-11-22', 'saienkoleokadia', '5bdeec2fc3ebd2b1c19df0f6faa7a83c95b88654', 3),
(52, 'Bronisława', 'Basak', '1980-10-10', 'basakbronisława', '911ef662e21d5cfb5a1eaf20dfffd7882e6ba13a', 1),
(53, 'Marian', 'Wojtowicz', '1992-04-08', 'wojtowiczmarian', '0945a2748c06731698c4e867e7bd110f434df4ff', 1),
(54, 'Milena', 'Maik', '2018-02-21', 'maikmilena', 'abc20fb5913b5bd059d0f724ba3fcc82c8ecc2be', 3),
(55, 'Żaneta', 'Węglarz', '1993-09-27', 'węglarzżaneta', '3cba8da0fefaf6554a9003518e57398cfeebe896', 1),
(56, 'Wioletta', 'Hibner', '1981-07-19', 'hibnerwioletta', 'ad3164d01160ce36eacfeb076c5c5aa4af65766f', 1),
(57, 'Ignacy', 'Bentkowski', '1995-09-24', 'bentkowskiignacy', '6e53e627e1dca22f34a4e016d8a20da1543ef22d', 1),
(58, 'Kornel', 'Ryszkiewicz', '1988-01-15', 'ryszkiewiczkornel', '0ac7b905207d48d79858dfb60de62b3980c73558', 1),
(59, 'Albert', 'Tomkowiak', '1980-05-28', 'tomkowiakalbert', 'db0055cc19658920cd99f844be5c5dc2940aa140', 1),
(60, 'Adela', 'Czubkowska', '1970-10-23', 'czubkowskaadela', '40f3606a67458399216827a1ed859ee0e6c1c4f8', 1),
(61, 'Cezary', 'Fortuna', '2000-03-20', 'fortunacezary', '94d282073635e3b5f79ccbf27bdcb38a66ab84b0', 1),
(62, 'Karina', 'Hartman', '1991-06-19', 'hartmankarina', 'fd6b0d5864313e95c17854dc08270fce5344a1b5', 1),
(63, 'Bolesław', 'Boksa', '1983-03-02', 'boksabolesław', '16281c8cbe413b30290cb3f6c0bc7eec292d5021', 1),
(64, 'Damian', 'Ulewicz', '1975-07-28', 'ulewiczdamian', '3b606b9f732891ab0b1225695ef2ed3cd5efcde1', 1),
(65, 'Ignacy', 'Łokaj', '1996-04-10', 'łokajignacy', '9c591f4ee439eb70e7657913d815a288e71cc28d', 1),
(66, 'Urszula', 'Drost', '2000-04-10', 'drosturszula', '899844bf95b67eaf1fac402d163c9e343e65598b', 1),
(67, 'Aldona', 'Śledzińska', '1993-03-07', 'śledzińskaaldona', '10636f951ee5156f69ed9367bd9296bdc4ac2374', 1),
(68, 'Klara', 'Kamieniarz', '1985-09-19', 'kamieniarzklara', '838fffcbd449fd7583fef64a224c88992eb0f853', 1),
(69, 'Franciszka', 'Kubasik', '1982-06-05', 'kubasikfranciszka', '2ed5e85bbfb860914251bb6bf78f333f21d4e549', 1),
(70, 'Stefan', 'Skupin', '1971-10-22', 'skupinstefan', 'f1b3a6276958483400c276a560be60721d4b39c1', 1),
(71, 'Urszula', 'Lendzion', '1975-06-21', 'lendzionurszula', 'add99589ec589f8da294bd13aa7a6f431203418e', 1),
(72, 'Ludwik', 'Gonciarz', '1982-02-18', 'gonciarzludwik', 'e49209dca65fbf327c4220ee0647b14d2af2ea15', 1),
(73, 'Łukasz', 'Dobrzyński', '1983-01-21', 'dobrzyńskiłukasz', '861f8ce7a0ac1d694d152e66fb64e52b8de4f119', 1),
(74, 'Aleksandra', 'Lutsenko', '2011-09-07', 'lutsenkoaleksandra', 'a63fccdea9fd2d566d21ed611340e789d268615f', 3),
(75, 'Izabela', 'Paprzycka', '1983-08-24', 'paprzyckaizabela', 'cbf551893c7d357025f008e9c8c26175e9e8b62b', 1),
(76, 'Kamil', 'Lato', '1976-06-28', 'latokamil', '1eb1f8e749b8ca17c400b51362d34fdda95e02f7', 1),
(77, 'Michalina', 'Makoś', '1995-08-12', 'makośmichalina', 'b081482e0e506575421a965d230c562ed883eebf', 1),
(78, 'Rudolf', 'Dziamski', '1990-12-24', 'dziamskirudolf', 'b55702d4a9fc21b0b4d410af591f3e075c83978e', 1),
(79, 'Henryk', 'Szabla', '1995-03-26', 'szablahenryk', '0c39519ff6da32db1059057aae7f8f27bf5f69cd', 1),
(80, 'Renata', 'Młodawska', '1999-02-10', 'młodawskarenata', '2cd5ab25911231a46b67a96131af6545da2c4561', 1),
(81, 'Aneta', 'Gałuszka', '1996-11-12', 'gałuszkaaneta', '714d63b1f8d6db922d00d286e3a1439b309c6952', 1),
(82, 'Feliksa', 'Noga', '2013-10-19', 'nogafeliksa', 'ca13739970609eeaf642fc574f742d392c3f05c1', 3),
(83, 'Feliksa', 'Karlikowska', '2015-09-08', 'karlikowskafeliksa', '6043277e88a6d03eed9b26ff53f9a4c7fb320ab0', 3),
(84, 'Bartłomiej', 'Knopek', '2018-07-11', 'knopekbartłomiej', '6a5ad2c2d2f866ba22796e3a34f7445f851f7e4b', 3),
(85, 'Pola', 'Dębiec', '1985-12-18', 'dębiecpola', 'a02e13eb247fac22e49be5b5f13d98a33333d683', 1),
(86, 'Hanna', 'Supińska', '1970-03-14', 'supińskahanna', 'cd79f317be2d6e5c7c51153206b0809f50bbfe70', 1),
(87, 'Paweł', 'Orzechowski', '1984-06-05', 'orzechowskipaweł', '025c973cf9075bf0f92a8ef7d01c6c27c3265ce4', 1),
(88, 'Iryna', 'Zwierz', '2011-10-07', 'zwierziryna', '5607c6886d3d1f0d180e426e8ecd40f3dd632a0e', 3),
(89, 'Olga', 'Sommer', '2011-05-21', 'sommerolga', '03a6783bad7e6c08ab2c208ede1f38700b5b7aaa', 3),
(90, 'Martyna', 'Taranenko', '2012-11-06', 'taranenkomartyna', 'a8e4d2c87a841dcd7595a683d8dfcc7932080f7a', 3),
(91, 'Mariia', 'Lampa', '1984-07-14', 'lampamariia', '4c2e914164fca2a631e1031710ff3100242f9160', 1),
(92, 'Grażyna', 'Staniaszek', '2016-01-02', 'staniaszekgrażyna', '9d2064c52dafbdd49bcd13949db4cfdeb9684c57', 3),
(93, 'Karol', 'Ciechomski', '2015-09-09', 'ciechomskikarol', '0e39b46522490d3b0e69518657b0dfea970b758b', 3),
(94, 'Amelia', 'Grygorcewicz', '2013-09-24', 'grygorcewiczamelia', 'c288c64ace192ccd9e7b9a671dd7e158d06ab969', 3),
(95, 'Romuald', 'Stoliński', '1979-06-27', 'stolińskiromuald', '80b1967566d201d0712fbfb65ed1f644edce8232', 1),
(96, 'Ewelina', 'Luchowska', '2013-06-22', 'luchowskaewelina', 'ffd986ed1538cf0ff5f264a6072e68000c251706', 3),
(97, 'Rudolf', 'Guziak', '2011-01-01', 'guziakrudolf', '1d3345d0e9881f9dc5a6286dec1a5d23c0e6a2d3', 3),
(98, 'Eliza', 'Maron', '1995-05-06', 'maroneliza', 'da8234b8f286d35a7d2afabaf81713bfe17c6c4a', 1),
(99, 'Kuba', 'Jurczyk', '1992-06-07', 'jurczykkuba', '9e1cd3d6636eb8f53306601548f3e67e37d11719', 1),
(100, 'Izabela', 'Pyda', '1990-12-21', 'pydaizabela', 'aa6f88f3bbccdd64f2eea4a9a7d400c9ef28cc8a', 1),
(101, 'Tymon', 'Osik', '2012-07-06', 'osiktymon', '07e6c8078aaa1d6d39f4eda2c671de4c8544bfd8', 3),
(102, 'Włodzimierz', 'Garczyński', '2018-07-01', 'garczyńskiwłodzimier', '61c93acb4c94d18b72613cedf969b92dfd720be8', 3),
(103, 'Angelika', 'Oknińska', '1996-07-21', 'oknińskaangelika', '2b37931d9bd8e7ea87a816248f454e5256eae978', 1),
(104, 'Pelagia', 'Brychcy', '2014-08-04', 'brychcypelagia', 'f78d131a8386d994510aa9c2fa96c002b1dd6136', 3),
(105, 'Krzysztof', 'Domański', '1999-09-10', 'domańskikrzysztof', '4f206a97cc41563297653ff0f29a5df037f1f405', 1),
(106, 'Krystyna', 'Golik', '1976-12-27', 'golikkrystyna', '40196ee1d8bee1ffc39f21c1e7561cfafc194d81', 1),
(107, 'Franciszka', 'Nikolaieva', '2016-03-03', 'nikolaievafranciszka', '689369f24af0127e3b6dc991029fab0b4e6c0546', 3),
(108, 'Julianna', 'Pietrasik', '2015-09-16', 'pietrasikjulianna', '22d02d03088ca660e5244876a1ee95935cf3eafb', 3),
(109, 'Waldemar', 'Mendel', '1987-05-27', 'mendelwaldemar', 'faf9bb1a342b64db437b5d3184112bb4ee22e451', 1),
(110, 'Renata', 'Sitarska', '2017-12-12', 'sitarskarenata', 'e5a68dfc1de9ba80c198f2428541ca2082b5e4d3', 3),
(111, 'Stanisława', 'Brzostek', '2015-02-06', 'brzostekstanisława', 'aab913bdcfe1f06f5e06d597973d833a255793fd', 3),
(112, 'Seweryn', 'Wszoła', '2012-02-07', 'wszołaseweryn', '94ff4f86537c8758857165751d6957670b8dffd8', 3),
(113, 'Jędrzej', 'Soloviov', '2015-04-08', 'soloviovjędrzej', '326e71564dfa896d75d34083e2ffb096c0f5a18e', 3),
(114, 'Zofia', 'Pruska', '2013-06-05', 'pruskazofia', '507f1a50d592ba70921ecca165709cdf7810a7ab', 3),
(115, 'Antoni', 'Lelonek', '2013-11-04', 'lelonekantoni', '7b017f6f5f8bbb4e0400ade24324f56ab13ce946', 3),
(116, 'Pelagia', 'Yefremova', '2015-02-23', 'yefremovapelagia', '33af501b3c05951f1732592179681ad540212b7d', 3),
(117, 'Mariola', 'Karkoszka', '1995-11-27', 'karkoszkamariola', '0874b33640021fbfaaba7d1a674439eb74383831', 1),
(118, 'Kuba', 'Ostojski', '2017-11-20', 'ostojskikuba', 'd93ad72a1f4e430e0f4df004ab516de62d2b194f', 3),
(119, 'Bartosz', 'Owoc', '2012-04-12', 'owocbartosz', '07ba97e7997ec64066e0642bec1d4df926c3abc1', 3),
(120, 'Bohdan', 'Stachów', '1976-02-03', 'stachówbohdan', 'e722b17d354ddb8eeddefe2af26ed48ef1e2867b', 1),
(121, 'Tadeusz', 'Wojak', '2013-07-05', 'wojaktadeusz', 'f8c3a76edcc023623ebb610e09aac99fecc688b1', 3),
(122, 'Albert', 'Sobieraj', '2018-02-14', 'sobierajalbert', '7bbadede7de2cf77f1afe0929f7e00496a619d05', 3),
(123, 'Tadeusz', 'Małczak', '2014-08-06', 'małczaktadeusz', 'a8e662a0cfd28be2706fad5bfe98b32c296802d9', 3),
(124, 'Daniel', 'Wieleba', '1973-06-25', 'wielebadaniel', 'fde3cd0786546f0942c04669d3daf7cb027da385', 1),
(125, 'Eugenia', 'Dębska', '1993-04-18', 'dębskaeugenia', '090aad34b87e07f405a582cb43274fc273080fe1', 1),
(126, 'Damian', 'Baumgart', '2013-02-23', 'baumgartdamian', 'e7f4597a1f084df94192afa096de5d3bbcfecc89', 3),
(127, 'Nataliia', 'Dmoch', '1987-12-03', 'dmochnataliia', '55f9ef821e637b6b4113e7585daba19cfc3ed2a5', 1),
(128, 'Marcelina', 'Choma', '1977-12-01', 'chomamarcelina', 'b03403892852f21c855588b60463b7475e6ba875', 1),
(129, 'Filip', 'Olbryś', '2016-04-18', 'olbryśfilip', '24590d5ecc15a69c20295bbd1c54f384ea5f6a00', 3),
(130, 'Milena', 'Moskal', '2011-07-28', 'moskalmilena', '949d0638ccc6650c7591522820e1b93ddcab1cb0', 3),
(131, 'Pola', 'Brodzińska', '2014-09-24', 'brodzińskapola', 'd489e06be14b3980aa45051cbbd21e1a7a2b5c84', 3),
(132, 'Cyprian', 'Rosłoniec', '2015-12-08', 'rosłonieccyprian', 'c4f8eb38092a338bf4a7e3209aafe939028c9df6', 3),
(133, 'Mirosław', 'Czarniecki', '2018-08-18', 'czarnieckimirosław', '3c88bd64561e58d676c23f26857c3ecc368cc8b9', 3),
(134, 'Bogdan', 'Wysocki', '1994-02-05', 'wysockibogdan', '84dfd53182d8e3b7cd83ea3e772eb7fce209f9da', 1),
(135, 'Paulina', 'Pankowska', '2018-10-21', 'pankowskapaulina', '8d0271413dec1a1f2257afeb9fd11dbbb388ddce', 3),
(136, 'Stefania', 'Biesaga', '2017-06-04', 'biesagastefania', '23ded2a8e343e70323a0a83b202c7ae42f0d27ad', 3),
(137, 'Wanda', 'Chrząstek', '2016-07-26', 'chrząstekwanda', '530213fe26ec606024d8e8368cfcfc0d2b449913', 3),
(138, 'Pola', 'Kuklińska', '1988-10-11', 'kuklińskapola', '80772a768aaf916618467633b98a2f551dae2c6c', 1),
(139, 'Iwona', 'Bodak', '2012-01-11', 'bodakiwona', 'e2abc97d895b3b8a8109f02b007a61dc30891b75', 3),
(140, 'Aniela', 'Krzanowska', '1998-01-19', 'krzanowskaaniela', '52f1cb4567cfd18975b30857ee5737c8cbef74f6', 1),
(141, 'Feliks', 'Przygodzki', '1990-11-13', 'przygodzkifeliks', '36bccde9ead406c56172ba7f5730788741fd08b3', 1),
(142, 'Małgorzata', 'Walus', '1974-12-10', 'walusmałgorzata', '6170f0f34c3b5f02215dca1cf7e3541a235ae7f5', 1),
(143, 'Kajetan', 'Danieluk', '2017-03-21', 'danielukkajetan', '76ea0280b4b4cc27bdbad3c07ad754d33d4c3fd8', 3),
(144, 'Tymon', 'Jokiel', '2015-04-01', 'jokieltymon', 'cb29dc15a452c979d4720c873c8dd756a717279c', 3),
(145, 'Adrianna', 'Myszk', '2018-03-16', 'myszkadrianna', '07eb3561af193a3ee3affe2378284ff180925e1e', 3),
(146, 'Bohdan', 'Sadowy', '2013-12-26', 'sadowybohdan', 'ebb6f8d30cc852b3533a35088f51064604160e9f', 3),
(147, 'Wiesław', 'Grudziński', '2013-05-14', 'grudzińskiwiesław', 'a5e574f23caf64abc6eb01d1088f5ab3e47ab006', 3),
(148, 'Patryk', 'Mieszczak', '2013-03-11', 'mieszczakpatryk', '2fa929c8c7fbc9c4d2e21b4c4dbf6af50f4514de', 3),
(149, 'Dawid', 'Kuźniar', '2017-04-05', 'kuźniardawid', '6b7b2333d03ff08761330ea9e9bffe8f135ace98', 3),
(150, 'Artur', 'Krysa', '2013-08-17', 'krysaartur', '0df29c24ec10117cf1bbc97b5bc2be135baf091c', 3),
(151, 'Jakub', 'Szweda', '2012-05-21', 'szwedajakub', 'faf3bc858c7b857b00a0410745b0676432e14d1d', 3),
(152, 'Daniela', 'Matyjaszek', '1980-05-01', 'matyjaszekdaniela', '5148a3e3367408d45629abda9e653ef9e9903db9', 1),
(153, 'Kuba', 'Wojnar', '2015-01-07', 'wojnarkuba', '2926c6f8171460dbb366b0bcace70a166e0adad8', 3),
(154, 'Albert', 'Katarzyński', '1992-10-12', 'katarzyńskialbert', '856d931cd6489986ce12c637bfa1aba78d2b670a', 1),
(155, 'Ilona', 'Walecka', '2015-10-05', 'waleckailona', 'dbc2c3b4f3075484e7918f597900cf914d36c869', 3),
(156, 'Wiesława', 'Dembińska', '2014-06-19', 'dembińskawiesława', 'f36facdb55cf974638813c114c58790c5f28ba03', 3),
(157, 'Marzena', 'Pruchnik', '1983-09-28', 'pruchnikmarzena', 'c68efe1caa573386d6bfed2050f540e1f1deb4a1', 1),
(158, 'Iga', 'Musioł', '1996-03-15', 'musiołiga', '512e26324500dda3c6e57332b33da80eda044bb6', 1),
(159, 'Edward', 'Skrzypczyk', '2014-11-13', 'skrzypczykedward', '2c429427c804b8a51582d26d24b7c88a36615a6d', 3),
(160, 'Malwina', 'Regulska', '2014-05-28', 'regulskamalwina', '4b78a3a53ef63ba39f061a1ca270da38068f5327', 3),
(161, 'Wioleta', 'Sulińska', '1990-07-10', 'sulińskawioleta', 'eaf1925c94aab4946bc12e6ef24b7901d9883c6b', 1),
(162, 'Hanna', 'Sokal', '2013-04-14', 'sokalhanna', '020c7f303b0a80f703cf1440f6a6bcd65c059066', 3),
(163, 'Lesław', 'Nestorowicz', '1987-02-06', 'nestorowiczlesław', 'b6d324b0a1c8c8148ae4049d0ac3e27c5c3f3d2c', 1),
(164, 'Magdalena', 'Ramotowska', '2011-11-10', 'ramotowskamagdalena', 'a4471211bf5c454754d0d885864a2864889ea623', 3),
(165, 'Andrzej', 'Dul', '1976-06-01', 'dulandrzej', 'afa16feb549462be30a2def56d74e65162a36f90', 1),
(166, 'Marta', 'Szyc', '2011-10-11', 'szycmarta', 'b46a793d4b0c4103ab775f0b6fbe1295287ce720', 3),
(167, 'Emil', 'Wochna', '2018-06-18', 'wochnaemil', 'dc889a55f2e79bb8cac42f5f368788968e1aeb38', 3),
(168, 'Apolonia', 'Małczak', '1980-06-19', 'małczakapolonia', 'e57f032e864b5eef1cc7ce890b83237d9c08952d', 1),
(169, 'Norbert', 'Dorożyński', '1982-01-08', 'dorożyńskinorbert', 'a9899f05c23fb5c961ea515d2c4b31ce35cec9fc', 1),
(170, 'Fabian', 'Jasnowski', '1971-11-07', 'jasnowskifabian', '4798a3e5fb111ae16a522a97074a3357233a0a94', 1),
(171, 'Witold', 'Pabich', '2012-02-16', 'pabichwitold', '3227f35ba5bf58308029a865a3cacfec8e7c45d0', 3),
(172, 'Hanna', 'Jokiel', '2011-03-18', 'jokielhanna', 'f64347ef3093658e0a7aeec7e541b36c7c6a9f2d', 3),
(173, 'Paulina', 'Pasternak', '1974-04-02', 'pasternakpaulina', '59b80ee99faa798c057db5151acd6b3b025873f4', 1),
(174, 'Roman', 'Kupski', '2015-06-09', 'kupskiroman', '96a81acd3540234aedbf07eb6fc2ff7a12cc9532', 3),
(175, 'Artur', 'Kuk', '2015-11-10', 'kukartur', '9a57ab4f2a74576a89a00c10e3352955e81012ff', 3),
(176, 'Alojzy', 'Podleśny', '1994-11-02', 'podleśnyalojzy', '035b631373d6311320a09fa65fa4d8a99ebe2e39', 1),
(177, 'Alojzy', 'Brzoska', '1973-03-09', 'brzoskaalojzy', 'bd5b9cc45c7f24bcf7867ba3f4ebf1348d6371a9', 1),
(178, 'Władysława', 'Gawin', '2013-10-15', 'gawinwładysława', 'e543ad9ed305c4d2840b011959895a3ddc75525c', 3),
(179, 'Mariola', 'Białkowska', '2017-07-21', 'białkowskamariola', '3959444c894b2abe103258b38337f8aa740b4bf2', 3),
(180, 'Żaneta', 'Nowek', '1979-12-13', 'nowekżaneta', '2e4f622587dce0eada40ded7a5cab9794d0052e1', 1),
(181, 'Liliana', 'Tatarczyk', '2011-11-03', 'tatarczykliliana', '893e786b86d23bd444b6971bcbf12acba3d38e7b', 3),
(182, 'Zdzisława', 'Potoczna', '2016-06-10', 'potocznazdzisława', '72210820b9f4421d4271dcf7ac5af8a0bfbd16da', 3),
(183, 'Stanisław', 'Groblewski', '2011-07-06', 'groblewskistanisław', '452c864a4ed7409905029fa7cf92b07aa127c44c', 3),
(184, 'Sylwester', 'Widłak', '2013-04-05', 'widłaksylwester', '0fbb0ee604e15957eab4423f92e7c48f1ab8bd7e', 3),
(185, 'Cecylia', 'Zbróg', '2018-11-15', 'zbrógcecylia', '81c0a0364c50bdd3fa643deee7888aa37c600a4d', 3),
(186, 'Nadiia', 'Marjańska', '2013-12-27', 'marjańskanadiia', '346870f4296a7045c1b95e20a669a1b91ac797b0', 3),
(187, 'Anastazja', 'Fila', '2015-05-13', 'filaanastazja', 'ac58e3a3113dcb9e37fb85dc6267985d1bf3f059', 3),
(188, 'Krystian', 'Śmieja', '1988-02-08', 'śmiejakrystian', '6849634e29487d5135e65c1d04ce76662ba06558', 1),
(189, 'Dagmara', 'Staciwa', '1980-03-06', 'staciwadagmara', '84d6b3b9e73bd484abb70eddcad45e77081b1b5c', 1),
(190, 'Blanka', 'Plizga', '1983-02-27', 'plizgablanka', '6b0ab113130da75cb4f141d340de43517ad532c6', 1),
(191, 'Wioleta', 'Kasztelan', '1971-07-17', 'kasztelanwioleta', 'b5489c14fc1522b9fd0dfe6274f09356ea55d994', 1),
(192, 'Tobiasz', 'Rogal', '2017-06-18', 'rogaltobiasz', '2a8312c11418615e71af3a44258a90f12ada854a', 3),
(193, 'Pelagia', 'Krasa', '2018-07-06', 'krasapelagia', 'c97c6a55f94ce984e354440d4ee5929edc7b2932', 3),
(194, 'Monika', 'Gawrysiak', '2017-09-18', 'gawrysiakmonika', '53f5d9ef3f928b2f624783dab83a40a639ebd041', 3),
(195, 'Janusz', 'Kurpiel', '2013-07-04', 'kurpieljanusz', '6932add8c16cba879a9d0e0d181219a2f5584d28', 3),
(196, 'Miłosz', 'Puzio', '2012-03-09', 'puziomiłosz', '730203747d1328e36e8e90ffaa3b66fa027baf37', 3),
(197, 'Agnieszka', 'Gryboś', '1988-07-07', 'grybośagnieszka', '4e8e9a5baaf4e3cc75d9089757927353aa92914b', 1),
(198, 'Iryna', 'Grodzka', '2011-05-22', 'grodzkairyna', '341af8418110c02bb8cb0db3f0e01d126e99e61b', 3),
(199, 'Oliwia', 'Napieraj', '2012-01-06', 'napierajoliwia', '4374448952f9e47e667c4b7362479d638718714c', 3),
(200, 'Walentyna', 'Jaruga', '1987-04-06', 'jarugawalentyna', '881f66d1f7737482f735636f5a21e65b6b94f17e', 1),
(201, 'Marek', 'Stokowski', '1997-10-13', 'stokowskimarek', '82091075dc2f58ee922a8ee9f6862cc14f39ff88', 1),
(202, 'Paulina', 'Trzeciak', '2016-01-04', 'trzeciakpaulina', 'd29dd61c4ac6022e274e1741b7dc5b6ed0f901af', 3),
(203, 'Roman', 'Ożarowski', '2018-05-16', 'ożarowskiroman', 'e65139c66b2573379e77805c57844e1c935364b0', 3),
(204, 'Sabina', 'Matuszek', '2017-08-20', 'matuszeksabina', '65235a6b203adefb966f6cb8c2d4e43840393977', 3),
(205, 'Bernard', 'Maciejewski', '2017-09-01', 'maciejewskibernard', '7c530df5627d03737ee412b1a995909fd99dd113', 3),
(206, 'Milena', 'Kołacz', '1989-03-28', 'kołaczmilena', 'a1808b7ed0daf2d76bd632da4085389704134b3a', 1),
(207, 'Wacław', 'Kolasiński', '2014-12-09', 'kolasińskiwacław', 'd0430ea9572c5516c00823b92d26f42ebdfdb988', 3),
(208, 'Julianna', 'Gorgol', '2014-01-18', 'gorgoljulianna', '3c093c151345f9e07e3cfe41992f29e8452a03d3', 3),
(209, 'Helena', 'Głąz', '2013-01-16', 'głązhelena', 'fe8fa4b6c2ed0302500e8e144e0cf16eb6f4c313', 3),
(210, 'Mateusz', 'Danielewski', '1989-05-05', 'danielewskimateusz', '337b92602da05bc9b2614ffc86e17bab06838b63', 1),
(211, 'Marlena', 'Marczuk', '2000-12-22', 'marczukmarlena', 'a00b5613c7dee70d63a054ab04e20d969eb9018f', 1),
(212, 'Gabriela', 'Kręgiel', '2015-03-19', 'kręgielgabriela', '01c2f860c0def422dcb6191fafd9de77a812fb55', 3),
(213, 'Laura', 'Błaszczuk', '2011-07-26', 'błaszczuklaura', '1fcc5186a49a9ee45751212b3ed2ae431a8550a5', 3),
(214, 'Bartłomiej', 'Hanke', '2016-06-02', 'hankebartłomiej', '584bffec0cd6a0ed049b3377221585d47ce86fef', 3),
(215, 'Włodzimierz', 'Sapeta', '2012-07-10', 'sapetawłodzimierz', '76d594359276f7ab94273607231d332501738d84', 3),
(216, 'Mateusz', 'Świętochowski', '2011-09-07', 'świętochowskimateusz', '10ecc6ecf64e666ba10199885358e65f5c7a978e', 3),
(217, 'Marcin', 'Stawowy', '1999-04-15', 'stawowymarcin', '9dc39ad8e7c369c44087fe39d0f492e2908ddf17', 1),
(218, 'Aniela', 'Kabała', '2018-09-03', 'kabałaaniela', 'e6040c04080d18b7bf2e8e8b918419bba774c70b', 3),
(219, 'Bogumił', 'Łagocki', '2013-06-03', 'łagockibogumił', '0dd5daf52e22b65486bb58b4915ef6585da9e871', 3),
(220, 'Marian', 'Chomik', '2015-08-08', 'chomikmarian', '2fadef601ac001992c2d170cff9412afc733e49c', 3),
(221, 'Cecylia', 'Sych', '1974-11-01', 'sychcecylia', '44bd4e2a9401ac07fd01a198ad1e50981ada48a2', 1),
(222, 'Henryka', 'Dukat', '1976-09-13', 'dukathenryka', 'e13275891c813a1a4e023b38685307a0f5726380', 1),
(223, 'Bruno', 'Poniedziałek', '2016-06-08', 'poniedziałekbruno', 'e5a41cfc88a94e13bffeff1dd8058e5f2f5bd3be', 3),
(224, 'Bolesław', 'Narewski', '1986-10-10', 'narewskibolesław', '87cac1bc07b54d099327a6f16211226f56fab09e', 1),
(225, 'Nikola', 'Zapart', '1998-06-03', 'zapartnikola', 'b948cca3c3b3bd1a6ae2042f4cb16b508679f8cb', 1),
(226, 'Benedykt', 'Piech', '2011-04-26', 'piechbenedykt', 'e6847e757ce1611910dcc4453fe39dc818b6c1a2', 3),
(227, 'Walenty', 'Kuk', '2018-07-27', 'kukwalenty', 'b349c16e152e1c7b9de72b351887e4311a336d96', 3),
(228, 'Fryderyk', 'Krzosek', '2014-04-19', 'krzosekfryderyk', 'db014eb76b1b09814fd86d3576829a7b7df66707', 3),
(229, 'Ryszard', 'Warych', '1974-02-02', 'warychryszard', 'e08f9b2fde9568cac8ef67206c871e2381ca6822', 1),
(230, 'Tobiasz', 'Dzida', '2013-07-09', 'dzidatobiasz', 'cef6f5413c5f4d82a26c3c887b616d4b33abb83a', 3),
(231, 'Lucjan', 'Pacholak', '1983-08-17', 'pacholaklucjan', '03668b4c705c37e443c6e6e1bfc36ec0bfa56d60', 1),
(232, 'Tomasz', 'Palczewski', '2018-02-28', 'palczewskitomasz', '45090108e5152b328313b55e15a1e69be561c18e', 3),
(233, 'Aurelia', 'Kokocińska', '2017-08-08', 'kokocińskaaurelia', 'fdd3c75297d3454ef1e595c79aeb3cd3d88b99db', 3),
(234, 'Szymon', 'Muchowski', '2017-08-26', 'muchowskiszymon', '95c5aa977429c6353b5b31f50d7afd7a08b68bbc', 3),
(235, 'Róża', 'Furman', '2014-01-05', 'furmanróża', '2e47330f5f6e64f396d72fc45c78158b1ce1cff4', 3),
(236, 'Kamil', 'Ilczuk', '2015-08-22', 'ilczukkamil', '53aae49605f3fe45c42cb6d04b0273f8572e75f1', 3),
(237, 'Daniela', 'Tymoszuk', '1996-08-12', 'tymoszukdaniela', '9498787415d43148742b441b3081e0b10ffec90b', 1),
(238, 'Alicja', 'Błażewicz', '2017-03-09', 'błażewiczalicja', '6bdd6ac6d65630e55f11917c3f3855da1d1b02dc', 3),
(239, 'Leonard', 'Kozieł', '1994-12-11', 'koziełleonard', 'ecb1e8b29e1d9c9da3a51d2c11f6f88d80e98465', 1),
(240, 'Gracjan', 'Demchenko', '2012-12-09', 'demchenkogracjan', '1704bf612dd8519e12ed6482bffd3b5544c11ce4', 3),
(241, 'Feliks', 'Ulman', '2012-07-23', 'ulmanfeliks', '994fd4c902a8a6def3efcf73266038f3db6fc174', 3),
(242, 'Wiesława', 'Zarzeczna', '2014-10-05', 'zarzecznawiesława', 'a1420a16131dc179a7c79affce1da5b12ff89466', 3),
(243, 'Nataliia', 'Jędraszczyk', '1971-11-06', 'jędraszczyknataliia', '6641ec67e0af5b7d47c78215efff1f006460149f', 1),
(244, 'Halina', 'Duch', '1999-01-15', 'duchhalina', 'd45b9b302041f9a332e7eb2f031d17ac42e83bbb', 1),
(245, 'Pelagia', 'Rydel', '2015-02-14', 'rydelpelagia', '743a7c3100f64e8d5ec0c72c90f96ddbac8e9132', 3),
(246, 'Kazimierz', 'Kubieniec', '1985-10-09', 'kubienieckazimierz', '1540ab1914562acd091dc0fc780cf601f8014754', 1),
(247, 'Żaneta', 'Smykla', '1992-03-18', 'smyklażaneta', 'f1887f8bff3f22a615a8d2fd4ba2efa6a99018f1', 1),
(248, 'Maja', 'Wódka', '2015-01-20', 'wódkamaja', 'd0efb3cf40f34e83d4143109f6c65c31c52b3eff', 3),
(249, 'Janina', 'Dorociak', '2018-07-21', 'dorociakjanina', '3cf55a65a712d2758e7cdd4b5c70e2625c5db040', 3),
(250, 'Zygmunt', 'Gołębiewski', '2011-10-25', 'gołębiewskizygmunt', 'ec7b7ae0584bc7517d1aac5b969ebe63c15f7b79', 3),
(251, 'Matylda', 'Puławska', '1997-05-11', 'puławskamatylda', 'c385ddcd500f61877a68279e37037e8d506e77b6', 1),
(252, 'Antoni', 'Stolorz', '2011-03-12', 'stolorzantoni', 'afaedf5b11f742771123566f3f37318e4117681c', 3),
(253, 'Bronisława', 'Ząbek', '2018-06-25', 'ząbekbronisława', 'e5a735b70c14d8932ff19413245a0c446ffebb87', 3),
(254, 'Gertruda', 'Kuzmenko', '2012-05-22', 'kuzmenkogertruda', '9600891fda17b0a6f5ea8d9298a44d9268d09782', 3),
(255, 'Adriana', 'Łuksza', '1970-04-14', 'łukszaadriana', '5288927195bbd7222aafa5c80a2b76c1404ac861', 1),
(256, 'Mirosława', 'Charzyńska', '2016-04-10', 'charzyńskamirosława', 'a3e78224048a5555993bfd0e727dd1e0c29f0fd1', 3),
(257, 'Kornelia', 'Madejska', '2014-05-14', 'madejskakornelia', '1ce9409322cb77b23467255c9f252d2f449a6f25', 3),
(258, 'Alan', 'Kajdas', '2012-02-13', 'kajdasalan', 'a05dec2abfa527d6f3eaf743efbe49dcc2b24363', 3),
(259, 'Maja', 'Majkowska', '1995-11-07', 'majkowskamaja', '721163a77ecfa021768b274ec83164e6bc3a2a6d', 1),
(260, 'Miłosz', 'Bruszewski', '2016-12-05', 'bruszewskimiłosz', 'b067447c5629ba806ca06d156748f137ae9c1aae', 3),
(261, 'Antonina', 'Mazurenko', '2013-01-02', 'mazurenkoantonina', '65ddaeaf04d92de2be346cfcb6da4e018e946d68', 3),
(262, 'Anastazja', 'Lee', '2016-11-06', 'leeanastazja', '73d4d1b706a2a5f173bb775d431657d21681186a', 3),
(263, 'Aniela', 'Juroszek', '2014-05-15', 'juroszekaniela', '34f87a7e3fddb1644c18ab420df060b334f762aa', 3),
(264, 'Zdzisława', 'Mościńska', '2012-09-21', 'mościńskazdzisława', '104e48ffc6e615b3305c7278c85abe7f224e0283', 3),
(265, 'Konrad', 'Lubieniecki', '2013-04-11', 'lubienieckikonrad', '72eb4e4715b8f9f8d9017c40e22707df356b7904', 3),
(266, 'Jadwiga', 'Dubaj', '1986-08-12', 'dubajjadwiga', '8886849ec26914b78d84b81e2d12bbde52223c46', 1),
(267, 'Leopold', 'Olbiński', '2012-07-27', 'olbińskileopold', '354bc53045375b21d3dfc14324fa9fc883e7ecd5', 3),
(268, 'Barbara', 'Pachura', '2014-02-23', 'pachurabarbara', '64acfbcc16f164dfc3764606427cd529ba0808d1', 3),
(269, 'Marcel', 'Sołowiej', '2017-07-25', 'sołowiejmarcel', 'ad39d266f13edda71bb152a2eb7489b9e339c777', 3),
(270, 'Zofia', 'Gomoła', '2011-12-02', 'gomołazofia', '9199571b266f91c13eed2973d0dd00fc04c39110', 3),
(271, 'Bartosz', 'Guziński', '2015-03-17', 'guzińskibartosz', 'd15409430f5755550fd236c729cb41012f041a3c', 3),
(272, 'Rozalia', 'Bojda', '2012-08-09', 'bojdarozalia', '805acd00d09a5db5932d1de2eabc77d163704ad8', 3),
(273, 'Nikodem', 'Trajdos', '2013-04-13', 'trajdosnikodem', '018451b089e8a0717742ee5e223cac5922ba942f', 3),
(274, 'Laura', 'Rupińska', '2015-10-07', 'rupińskalaura', 'b727b38004c21884f02dcc01b3195c3006f78253', 3),
(275, 'Marianna', 'Kożuchowska', '1989-02-08', 'kożuchowskamarianna', '010309ebda7ffdd53f8b608499b195c6b41d6245', 1),
(276, 'Aneta', 'Butryn', '2016-03-18', 'butrynaneta', '409a3548dbe2acb0b250d31fa62f952d350b4949', 3),
(277, 'Bolesław', 'Jarmuła', '2015-02-08', 'jarmułabolesław', '8a0a48f94de74a218ba4b019170f2a33e8937727', 3),
(278, 'Zenon', 'Chomiak', '2015-01-25', 'chomiakzenon', 'a187a4fa5b98352f2d437f6025f35088ab377307', 3),
(279, 'Julia', 'Basiak', '2013-11-26', 'basiakjulia', '26520a8f57a5f7c8a447ef185d7898388fd1d771', 3),
(280, 'Adela', 'Wydmuch', '2013-02-03', 'wydmuchadela', '8333285093aeb7f3ba6fcc9221cbf439f7010505', 3),
(281, 'Ilona', 'Kopania', '2013-10-15', 'kopaniailona', '46fe75f8772e3205b623eff871fc52eafc26abe2', 3),
(282, 'Bruno', 'Gurdak', '2014-05-06', 'gurdakbruno', 'c177ad8346da6c460aba82977cc493c56b50e002', 3),
(283, 'Kornelia', 'Kocjan', '1987-09-16', 'kocjankornelia', 'f4cbba8e8d577f7229f2e2ccb0b693578a6dcb8e', 1),
(284, 'Fabian', 'Trawka', '2015-02-01', 'trawkafabian', '982d755e7fbe24217395bf965c1e42c4486f9b65', 3),
(285, 'Adrianna', 'Pracz', '1999-04-25', 'praczadrianna', '425a00af23d8ab7727b59441e9309bdc74da8c96', 1),
(286, 'Krzysztof', 'Kobza', '2017-06-18', 'kobzakrzysztof', '9626897db0f7bedf31a0baaa0b9797111716841d', 3),
(287, 'Fabian', 'Bieniek', '2011-10-08', 'bieniekfabian', '488a4f9070d2e4376e126408e1ee82a462902fc6', 3),
(288, 'Oliwier', 'Bandurski', '1971-10-18', 'bandurskioliwier', 'd7e8e4095302f53b48ccad8e4496c9ae1c319bbe', 1),
(289, 'Konstanty', 'Kopania', '2017-05-02', 'kopaniakonstanty', '97df00eb72ade9bf5805b815460e52358754d626', 3),
(290, 'Dominik', 'Toś', '1981-08-27', 'tośdominik', '590a59c76d69b0ac205a50cc6914dbfdb8997ce5', 1),
(291, 'Aldona', 'Gronowska', '1978-09-04', 'gronowskaaldona', 'e27b3ec83da95f08a5d475b397ebabcd4e1e8bad', 1),
(292, 'Antonina', 'Gorzka', '2018-05-12', 'gorzkaantonina', 'e410211cf84190a9d5908a9df186e7c628b51ea8', 3),
(293, 'Bożena', 'Burkiewicz', '1988-02-24', 'burkiewiczbożena', 'a23053364401947a3f5dbb4336569e964fb48a1e', 1),
(294, 'Zofia', 'Michalska', '2018-05-15', 'michalskazofia', '285e7f405f874c12f3a37bf98ab3bae278e0fc6d', 3),
(295, 'Marian', 'Włodkowski', '1979-11-22', 'włodkowskimarian', 'd6b091002a8460475ee65dec5992d8aaaee817e3', 1),
(296, 'Wiktor', 'Woch', '2014-06-22', 'wochwiktor', '6760425ad7171fd267df2b8026b5fe4892360101', 3),
(297, 'Dominik', 'Waluś', '2013-06-22', 'waluśdominik', 'bc50f640c9f8660738cb1f3b509e2c985c5aa2dd', 3),
(298, 'Łucja', 'Okońska', '1985-02-01', 'okońskałucja', 'd762e47e458896e0f0bb273c04520e671e01f953', 1),
(299, 'Blanka', 'Burak', '2014-03-13', 'burakblanka', '27696e9a9265639c6e4d64dbc28c939473ef2c02', 3),
(300, 'Honorata', 'Żurawska', '2017-11-07', 'żurawskahonorata', 'a0e03911d022fae2fb0680f64adfd04196c9105c', 3),
(301, 'Laura', 'Karbowniczek', '2013-06-15', 'karbowniczeklaura', 'f9dc4d6f087073f7406d90883d3f31704a2d865b', 3),
(302, 'Romuald', 'Ryszewski', '2013-03-01', 'ryszewskiromuald', '3c7b2bb6e798aebd20179d3f5b393d28d9c7a539', 3),
(303, 'Grzegorz', 'Garbarczyk', '2012-06-02', 'garbarczykgrzegorz', 'aa7649994d12744ca30222646c798d4332de8b3c', 3),
(304, 'Jagoda', 'Jendrysik', '2018-05-28', 'jendrysikjagoda', 'f9424423fdb34a251a177848b2bd5aedbae9d76d', 3),
(305, 'Mariola', 'Sobkowska', '2011-02-23', 'sobkowskamariola', 'cd1349429531d09a76f6665f6313689025876580', 3),
(306, 'Dominik', 'Ostapiuk', '1998-06-23', 'ostapiukdominik', 'b34c9260ceea533c03d9c54368d0b8a7a2bc11cd', 1),
(307, 'Mieczysława', 'Kloskowska', '1988-12-15', 'kloskowskamieczysław', 'e65281bb512074d52172d8c37068756fb0846469', 1),
(308, 'Rudolf', 'Smolik', '2016-11-03', 'smolikrudolf', 'd0192a8b208a0e7dac6471aa6b888e7cf0365a36', 3),
(309, 'Bogdan', 'Ciemiński', '2013-09-01', 'ciemińskibogdan', '20ffead29ccb19e78e19b0e1d1335437554c69c0', 3),
(310, 'Zygmunt', 'Bębenek', '2011-06-06', 'bębenekzygmunt', '550e2ec58486225bfea0aca71bd3ddd00a7c788f', 3),
(311, 'Juliusz', 'Płatek', '2016-09-01', 'płatekjuliusz', 'b8a5690474f35da1876b62c462f47b668b7f9e90', 3),
(312, 'Honorata', 'Mytnik', '2015-12-24', 'mytnikhonorata', '3c77eabd08ad743c684ad35a494630fdb6617eac', 3),
(313, 'Kamil', 'Zdziebło', '2011-10-25', 'zdziebłokamil', '3937473ea2678861e1ce608833ace193c6e3f2f0', 3),
(314, 'Sabina', 'Miziołek', '2017-12-25', 'miziołeksabina', '219aea6c3e6c26216478c166e14b395511bd1150', 3),
(315, 'Mieczysława', 'Konopska', '2012-03-22', 'konopskamieczysława', '65085328cbc27e6b5dfec47c48345f3dfbe2abf6', 3),
(316, 'Róża', 'Bobrowicz', '2011-03-16', 'bobrowiczróża', 'c4c8664c646c5fb3a4feaa3db0337d97a0a04c89', 3),
(317, 'Julita', 'Budzowska', '2011-04-08', 'budzowskajulita', 'e8ead1c024b96bd833c5dd4bd671bd1cd549efa0', 3),
(318, 'Marcin', 'Kręcichwost', '2017-05-03', 'kręcichwostmarcin', '32704022f0aec9ca807ead604cf5662c19febb7c', 3),
(319, 'Norbert', 'Tomsia', '1989-03-24', 'tomsianorbert', '44a797e583cb307a945d3532cc4b90c0cca1bb62', 1),
(320, 'Iryna', 'Olędzka', '1994-02-22', 'olędzkairyna', 'b117adb77ad80e3821492495537af399b2ef0436', 1),
(321, 'Konstanty', 'Pilichowski', '2015-07-14', 'pilichowskikonstanty', '8881e9b73afc65f046ad6cfb480272857760844b', 3),
(322, 'Magdalena', 'Lipnicka', '1988-04-04', 'lipnickamagdalena', '541462428534dc68dc94d4cd18c05612209082c7', 1),
(323, 'Kazimiera', 'Kostrubiec', '1972-12-13', 'kostrubieckazimiera', 'eba49b9c85171209e081b8a286807b453aefb2e6', 1),
(324, 'Maksym', 'Herok', '2018-04-01', 'herokmaksym', '91f4dd90b3b641871e6c5e26bbeb482122312667', 3),
(325, 'Franciszek', 'Krzywda', '2013-02-21', 'krzywdafranciszek', '290c60e032dd11d66c84ca2b3b7591d39e97780e', 3),
(326, 'Marianna', 'Pławska', '1982-03-09', 'pławskamarianna', 'a6acee26ef3181c25f677b9473f70bf91354a2d7', 1),
(327, 'Marcel', 'Pazdan', '2012-07-09', 'pazdanmarcel', '4998658e309c3abe0e766cd29e0d21c6e7061913', 3),
(328, 'Radosław', 'Li', '2013-10-24', 'liradosław', 'a0b1e67d31ee430693ec31ec3b3a2e7064191975', 3),
(329, 'Gracjan', 'Baranov', '1980-04-09', 'baranovgracjan', '19974d5db274a28ad3e0822235f13264b493b7b0', 1),
(330, 'Eryk', 'Fierek', '2011-12-04', 'fierekeryk', '1c0fa3594f6b303082423cad0b500f01079ec76f', 3),
(331, 'Leokadia', 'Rozbicka', '2018-09-02', 'rozbickaleokadia', 'f210d67f076523a974b3a152797f4a17b4cc3950', 3),
(332, 'Adrianna', 'Tymchenko', '2018-06-01', 'tymchenkoadrianna', 'c60abab73a30fef39ae87dfd42af0be93d67f4a7', 3),
(333, 'Aleksandra', 'Malewicz', '1986-05-02', 'malewiczaleksandra', 'fadd62adc581223f9065cc148f86329b076ac646', 1),
(334, 'Jolanta', 'Kłodzińska', '2013-09-26', 'kłodzińskajolanta', '94f89dff82a713abf62112cc8cd27e94374b2a32', 3),
(335, 'Jadwiga', 'Lutyńska', '1979-02-04', 'lutyńskajadwiga', '1f648abe5323fbffc6045fcf86cb68c527fb9623', 1),
(336, 'Aleksandra', 'Nizioł', '2018-04-20', 'niziołaleksandra', '188fee7475e39294559b104a72aabae0f5feba39', 3),
(337, 'Bronisław', 'Ruciński', '2018-06-27', 'rucińskibronisław', '7fa3520c3a9c187414b2df818e33d25722ed2004', 3),
(338, 'Marcin', 'Kiljański', '2017-04-06', 'kiljańskimarcin', 'd6f554b3145b7a3fb12c3b9518c3768667d0a0fa', 3),
(339, 'Ewelina', 'Davydova', '2015-09-20', 'davydovaewelina', '389a69fd1e5a0e3aee325c95d5d735469593a014', 3),
(340, 'Władysław', 'Wojdyła', '1979-01-28', 'wojdyławładysław', 'fbca54f85b160d9a0b9742e49f5e2dd19d2782be', 1),
(341, 'Adela', 'Masztalerz', '1991-12-12', 'masztalerzadela', '3c6097b2b5e79c56a8ea935256337c7f8db37410', 1),
(342, 'Dominika', 'Konieczny', '2013-11-07', 'koniecznydominika', '8567d2f0eca49b1e992be003e3a32756a94ab2e7', 3),
(343, 'Alina', 'Mikulec', '1976-09-19', 'mikulecalina', '6da5712ca97e92c0dcd9945190a031a2e3be587b', 1),
(344, 'Lucjan', 'Matyjasek', '1977-12-26', 'matyjaseklucjan', 'd88865c9de9887a8f4655b9817be743f70bc9c54', 1),
(345, 'Daria', 'Majka', '2016-04-18', 'majkadaria', '5b4d896c4877ae95a7210a8163ad1193bb16a6af', 3),
(346, 'Jacek', 'Bochen', '2016-05-09', 'bochenjacek', '5ad3c4fbfcca6eed0a25e24411056aad083b3869', 3),
(347, 'Paweł', 'Marciniszyn', '2012-12-13', 'marciniszynpaweł', 'f62b399a241dce527bc617b5a783604ef0d6f403', 3),
(348, 'Paulina', 'Lubieniecka', '2013-08-03', 'lubienieckapaulina', 'f2d1a069b1f4622f11c2a5cdbccdfd2620b8fa74', 3),
(349, 'Henryk', 'Najder', '2015-05-24', 'najderhenryk', '809bf77e1320b746db8cc0895445189880675892', 3),
(350, 'Eleonora', 'Demchuk', '2015-09-16', 'demchukeleonora', 'c175129f01cf3337e69d8caa6b2a63463d6c9173', 3),
(351, 'Ludwik', 'Stawowski', '2014-07-02', 'stawowskiludwik', '8e96df7500acd2a23052fc0f6360f2d5cb5812b6', 3),
(352, 'Aleksandra', 'Ciszkowska', '2014-12-12', 'ciszkowskaaleksandra', '528c941845e04b10b0d745cb8a44185fc39347c5', 3),
(353, 'Alan', 'Stańkowski', '2014-05-03', 'stańkowskialan', '1ffe383f52201ad4c91376f53453712e16ddb434', 3),
(354, 'Alojzy', 'Gryz', '2015-10-11', 'gryzalojzy', 'fa7f8b44b8146cdf06974f48e5c5866f326a0146', 3),
(355, 'Pelagia', 'Modelska', '1976-11-16', 'modelskapelagia', 'a498e8d1f6bd608590fe405150a4850034c27c0f', 1),
(356, 'Anita', 'Smyczyńska', '2016-04-03', 'smyczyńskaanita', '026df345ddc2f3bb3e61ae597ba9e4c641e42528', 3),
(357, 'Zuzanna', 'Wrzosek', '1983-12-19', 'wrzosekzuzanna', 'aa3663f10eb32412401f0d0be40a015bedbabe32', 1),
(358, 'Mieczysława', 'Symonowicz', '1980-02-15', 'symonowiczmieczysław', '0f3d0c53cf91fdf671cf9373296053435e741b1e', 1),
(359, 'Remigiusz', 'Nguyen', '2017-01-14', 'nguyenremigiusz', 'f977c54f9cc6261051c27ca8948f7f06ace9c56c', 3),
(360, 'Julita', 'Obrzut', '2015-10-10', 'obrzutjulita', 'b1793fa48ea06302b89de1cd569b498de333e258', 3),
(361, 'Natalia', 'Duś', '2014-07-04', 'duśnatalia', '2e93a43b0e7bd95b08257251973cfbbc07f83098', 3),
(362, 'Władysław', 'Wojtyna', '2011-03-22', 'wojtynawładysław', '33e6dd577ebc928097287f73d6f7d5f7cfcd3da0', 3),
(363, 'Leonard', 'Krakowiak', '1989-03-12', 'krakowiakleonard', 'f6daf2bb475e83acfb8e27b09c75e059b6513593', 1),
(364, 'Hubert', 'Plis', '2013-07-21', 'plishubert', '6b6abceacc2702a4fcfcd00682b1893cd8004281', 3),
(365, 'Benedykt', 'Musiała', '1978-12-16', 'musiałabenedykt', '10313451f3ed8172c3e3526c4c9700e5cbc38cd7', 1),
(366, 'Paweł', 'Matejuk', '1995-08-22', 'matejukpaweł', '7666580bd86b2b36eef026a8be29b1c72b3c61e8', 1),
(367, 'Leszek', 'Komuda', '1984-06-12', 'komudaleszek', 'b3b1692fd60100a42ff5a774d66993fab8abcfff', 1),
(368, 'Mirosława', 'Nawrat', '2012-04-25', 'nawratmirosława', '6d2f1293a060f8dde1f10cfbe7508a269d204aee', 3),
(369, 'Maksym', 'Śliwowski', '1977-10-04', 'śliwowskimaksym', 'dc65866e6ca0f01021d7a4132e5af24aaa872209', 1),
(370, 'Alan', 'Wilkosz', '2013-10-01', 'wilkoszalan', '714c31d9633c58b90c7bd91565e3047ec7f12742', 3),
(371, 'Marcin', 'Duch', '2013-03-05', 'duchmarcin', 'e3d789d7fd836133c96d4f9a118f85a8df487eb1', 3),
(372, 'Katarzyna', 'Kortas', '2017-07-14', 'kortaskatarzyna', '865818aae9d7dcc1b75f15788012352a03782093', 3),
(373, 'Matylda', 'Stanisławek', '2016-11-12', 'stanisławekmatylda', '10760f40c4428561571bf3c0e01651fb8cecef81', 3),
(374, 'Nadiia', 'Sławińska', '2015-10-22', 'sławińskanadiia', '371de907192757e4a31312dc3a175557543c6acc', 3),
(375, 'Czesław', 'Kuszaj', '2015-10-13', 'kuszajczesław', '8914adcebc19b28b533b5c93de288bd0f4881677', 3),
(376, 'Ireneusz', 'Głowa', '2011-10-13', 'głowaireneusz', '8d6032b11f962b8f4abdd56e7d979209e86b4c3c', 3),
(377, 'Nadiia', 'Chorna', '2018-11-08', 'chornanadiia', 'b475baad668016c861e3a00e78b76057c23513a6', 3),
(378, 'Szczepan', 'Kupniewski', '2014-01-03', 'kupniewskiszczepan', '7e9ec5f57ace91978341185a22685c9bb37ac067', 3),
(379, 'Romuald', 'Szelągowski', '2018-09-12', 'szelągowskiromuald', '92913180ebec3cfa54c4da1257c23f921b366818', 3),
(380, 'Emil', 'Dereziński', '2012-01-15', 'derezińskiemil', '8b22558d072b36e6e431d7139b1596888be229d5', 3),
(381, 'Izabella', 'Żołądek', '2017-12-03', 'żołądekizabella', 'b7415279ec5d869b98d982dd3a577bacbb194630', 3),
(382, 'Wioletta', 'Skrzypczyńska', '1971-03-07', 'skrzypczyńskawiolett', 'fdc1efe1fec5b89d4c980f2c88e04fddb9286796', 1),
(383, 'Konrad', 'Tobiasz', '1972-03-19', 'tobiaszkonrad', '16815d4a0991ebf7b8876cdc34dedf1905b840f5', 1),
(384, 'Mirosława', 'Kulczyk', '2015-12-14', 'kulczykmirosława', '0f3cdcd838fa7879329b607e6702a40e1550e334', 3),
(385, 'Teodor', 'Terlecki', '2017-03-04', 'terleckiteodor', '828ec1336dfacb0eea7a80061ece1d5b26256b84', 3),
(386, 'Alicja', 'Szuszkiewicz', '2014-06-17', 'szuszkiewiczalicja', '971b4152209ba9180353c3df8c75945804472bc8', 3),
(387, 'Wincenty', 'Popis', '2016-01-12', 'popiswincenty', '31be090ee2d157fe4ab2e11a90577499cfac30ea', 3),
(388, 'Genowefa', 'Kawka', '2011-07-28', 'kawkagenowefa', '27a2e9e23048ce8b18bb5fe53e9802c0453c957a', 3),
(389, 'Jerzy', 'Spólnik', '2013-06-06', 'spólnikjerzy', '6b7cd5099a3eec26b2f852b81c0e38dabbb82c51', 3),
(390, 'Aneta', 'Karbowiak', '2017-05-10', 'karbowiakaneta', 'e62433f13ae6cb3ad3661a64f88bd444974894ea', 3),
(391, 'Bożena', 'Krzyszczak', '2015-09-12', 'krzyszczakbożena', '003e1243c220d30fb31179809ed32b0d6a06ddb4', 3),
(392, 'Michał', 'Baca', '1971-09-05', 'bacamichał', '94c52da914e55c26bd8ff53baae1782802d514a2', 1),
(393, 'Radosław', 'Trocha', '2013-10-22', 'trocharadosław', 'c0786bb7bb93aa6e0e1f6d82cfc9e52ef5caa630', 3),
(394, 'Ignacy', 'Rzadkowski', '2000-10-07', 'rzadkowskiignacy', '351ffbf17a19f2f580cf0c513773037303e20930', 1),
(395, 'Malwina', 'Nowicka', '1978-01-18', 'nowickamalwina', '84c0c323f57d90a8b0e06619bea96b81f9775b9b', 1),
(396, 'Tadeusz', 'Binkowski', '2011-05-21', 'binkowskitadeusz', 'a26207f2d1766a924fee3679065c8b61533f2686', 3),
(397, 'Szczepan', 'Budnik', '2000-11-16', 'budnikszczepan', 'a59194baf2631d1347f2b1e439fc5996795ec0df', 1),
(398, 'Władysław', 'Lazarek', '1992-01-26', 'lazarekwładysław', 'eaf498cd9ae2932d9db7dd19f01bb10db756ee65', 1),
(399, 'Daniel', 'Urbaś', '1983-07-09', 'urbaśdaniel', 'bde66b965593eda551b7e259e28d5b9b8babaa01', 1),
(400, 'Krystian', 'Czubaszek', '1971-02-12', 'czubaszekkrystian', '864dfb1736dd571cced4329fe0f3b845b64bd085', 1),
(401, 'Bartosz', 'Sumiński', '1972-03-22', 'sumińskibartosz', 'df29b4f85ee7ee75794446dd9e0da73530d865f9', 1),
(402, 'Roman', 'Kulon', '2012-03-02', 'kulonroman', '633d5b0d62ce5f8b26237cab2490d25095a0a7db', 3),
(403, 'Dagmara', 'Perzyna', '2018-07-11', 'perzynadagmara', '2a119c53300fa7ac2455abedc3ba1f95f4092dfc', 3),
(404, 'Rozalia', 'Walter', '2015-02-04', 'walterrozalia', '7b2d31d258a83c590a7d176081407d6a94b60c1e', 3),
(405, 'Amelia', 'Wieteska', '2016-04-20', 'wieteskaamelia', '31233eb7e8173b01336314dd96aaa41806084c4a', 3),
(406, 'Monika', 'Danylenko', '1970-09-08', 'danylenkomonika', 'a9613c7f8d7bf1aae71a2d8f09e0f108a52884bc', 1),
(407, 'Krystian', 'Małków', '2016-08-21', 'małkówkrystian', 'aba5887bb8679744c3ddd97638b91c95835fa996', 3),
(408, 'Pola', 'Filipczak', '2017-03-09', 'filipczakpola', '7abf3d7e9f186490ea5d0d5e53e346726b160c95', 3),
(409, 'Rafał', 'Pleskot', '2011-11-24', 'pleskotrafał', '918a88960f8e0c8e35e2ca8a9fdb6a615632bc98', 3),
(410, 'Fabian', 'Turowski', '2015-11-23', 'turowskifabian', '9acf5cb71d0480cae6d58c05fd6e55994848550c', 3),
(411, 'Ludwik', 'Świerczek', '1997-01-06', 'świerczekludwik', 'b178d116c7a9c1376fec7e846720a3fbd216755c', 1),
(412, 'Irena', 'Opiela', '2017-01-24', 'opielairena', 'd80d154e98cbcf1660423467142435a16c5e9a05', 3),
(413, 'Eliza', 'Pelczarska', '2011-04-11', 'pelczarskaeliza', '4beb49e1ed215c731df198b9446046c42a0a1809', 3),
(414, 'Wiktoria', 'Fabisiak', '2016-11-25', 'fabisiakwiktoria', '25a0add151ea6f0b55cc3ea08e819f34501d7a23', 3),
(415, 'Władysława', 'Dovhan', '2017-09-13', 'dovhanwładysława', 'f2be68aff58ec5f777f02bc2662d58ba66947ec1', 3),
(416, 'Grażyna', 'Macek', '2014-03-10', 'macekgrażyna', 'bab7f29317bdec22ac901a6af19e305628863337', 3),
(417, 'Teodor', 'Grzymski', '2017-12-25', 'grzymskiteodor', '7f76c66baf518698edb7ae042108dfdc846163d6', 3),
(418, 'Teodor', 'Borzymowski', '2012-03-28', 'borzymowskiteodor', '818e0dc630448629592c109f9940a1459154f61d', 3),
(419, 'Sylwester', 'Szumiło', '2012-10-18', 'szumiłosylwester', '90a3d4d92e8b02cdb43e02e9fee5ecd0bca1e993', 3),
(420, 'Stanisław', 'Wikiera', '1991-10-04', 'wikierastanisław', '8b7c2476f91bfcc1a6c088cff8be5be3736af185', 1),
(421, 'Angelika', 'Buksa', '2015-03-20', 'buksaangelika', '1c142b9fc5f26f6ccbb011fa5aa44c64eff1e8ff', 3),
(422, 'Marian', 'Ferfecki', '1978-10-02', 'ferfeckimarian', '24025f344b2142b55020c998a9dd1b5d24786c6d', 1),
(423, 'Sara', 'Łowicka', '2012-05-12', 'łowickasara', '9e2392b9d3190a37e99cfdd662f060e5c8e9073d', 3),
(424, 'Matylda', 'Drożdż', '2015-02-17', 'drożdżmatylda', '532e0e215c52f9ebe4e90f5e630d1fa7ecdd1a61', 3),
(425, 'Rudolf', 'Jarosz', '1990-10-22', 'jaroszrudolf', 'f7a41dd3cd7a9ae19985d04c8c11f7b6d0547458', 1),
(426, 'Karina', 'Adamek', '2017-03-21', 'adamekkarina', '4b447833b4734a8c1fe207a70a28c83abc2dd40c', 3),
(427, 'Kornel', 'Biniek', '2012-03-02', 'biniekkornel', '33e4de82b23cc585bf6ed0145f5c8633a7b7bb97', 3),
(428, 'Grzegorz', 'Kryszkiewicz', '2016-08-18', 'kryszkiewiczgrzegorz', 'a41c208401fa675ff55210c14ea23a270b4f58da', 3),
(429, 'Marta', 'Michalczuk', '2017-01-03', 'michalczukmarta', 'ebd9b50c17f76ef71cbfb5a26b33dfed41120ad4', 3),
(430, 'Teodor', 'Płusa', '2017-07-13', 'płusateodor', 'e3a716c69f804d2aadbcfcab170369e3f23c5f13', 3),
(431, 'Sandra', 'Sozańska', '2015-06-13', 'sozańskasandra', '9d8d5d090ca91a3557e09d103d65b5a4ce814d9c', 3),
(432, 'Kuba', 'Mikusek', '2011-07-10', 'mikusekkuba', 'c1e4869b034d8b989451376e0595594e67116a8c', 3),
(433, 'Marcel', 'Janczuk', '1979-02-26', 'janczukmarcel', '9aaf1d4418d0f4e2536a1280a8189d39479e4904', 1),
(434, 'Emil', 'Maron', '1974-02-15', 'maronemil', 'de635f85850772b884df766d40afd3701f792039', 1),
(435, 'Aneta', 'Gwiżdż', '2012-04-17', 'gwiżdżaneta', '833d662c714b37746ecd8dad759806601c53e701', 3),
(436, 'Zbigniew', 'Możejko', '2012-02-05', 'możejkozbigniew', '24ee1dc00a6f66b8241b24f67d350f6f43756ff0', 3),
(437, 'Daniel', 'Babula', '2012-09-19', 'babuladaniel', '8696c7213d3dd35ad53ca799be3c4e949620d1ed', 3),
(438, 'Lucyna', 'Grela', '2018-03-02', 'grelalucyna', 'c709039c11365f59df1f06d5916977296dc2d620', 3),
(439, 'Kajetan', 'Skupień', '2017-08-07', 'skupieńkajetan', '2aa544732f1a9bade928e5294d9bf75ccad62119', 3),
(440, 'Oskar', 'Świątkowski', '2015-12-21', 'świątkowskioskar', '3fea257efefe6313f88ef019f625e36191ea5279', 3),
(441, 'Nadiia', 'Jaranowska', '2013-12-21', 'jaranowskanadiia', '59813a485b550242544653143bb0bfc240d3a6a1', 3),
(442, 'Bohdan', 'Smoła', '2015-03-06', 'smołabohdan', 'acc4b582523065c6a6366345582def90a41e8a70', 3),
(443, 'Ilona', 'Tylus', '1972-05-24', 'tylusilona', 'fbfdc4e2ba9d3f46cb6ae4f65f0126a08bd854ab', 1),
(444, 'Lucyna', 'Kosecka', '2012-11-08', 'koseckalucyna', 'b05741e22ca6d16c6a6315e87e7857f138f24365', 3),
(445, 'Stefania', 'Jonak', '1998-09-06', 'jonakstefania', '35f42037d918c3de27060bfdc49b970e152716f3', 1),
(446, 'Gabriel', 'Kinowski', '2016-03-23', 'kinowskigabriel', '7d86ff25053f78b75dbc26b721f4d179d947f47b', 3),
(447, 'Kazimierz', 'Lin', '2014-12-05', 'linkazimierz', '7e202f9b4f5da987ea5e0abb140ed856e0402a79', 3),
(448, 'Matylda', 'Kosieradzka', '2000-05-03', 'kosieradzkamatylda', 'bc8bebff040a7dcf1a0a75c588a38db0182d9f26', 1),
(449, 'Leokadia', 'Tlałka', '2013-07-11', 'tlałkaleokadia', 'e66f454d1724b4f20259d0fcc908dc6e481474c1', 3),
(450, 'Sabina', 'Łysiak', '2013-04-02', 'łysiaksabina', '7a2655c1ca525027e23218cebc1ebc6795568c51', 3),
(451, 'Kacper', 'Małysz', '2016-12-11', 'małyszkacper', 'c6849856dd83382ead91b136a0b8f0ac0f29999c', 3),
(452, 'Bogusław', 'Chmal', '2011-12-24', 'chmalbogusław', '06ad2e4059c90632f1b46deae8a1388440652282', 3),
(453, 'Andrzej', 'Ignasiak', '2014-04-17', 'ignasiakandrzej', 'c3bd8512b8c964519048d38dd33411dd0d464909', 3),
(454, 'Filip', 'Żółtkowski', '2018-03-22', 'żółtkowskifilip', 'aa570370d3e93b216a0d0fe53a3a1345b2763d66', 3),
(455, 'Michalina', 'Kulikowska', '2015-01-27', 'kulikowskamichalina', '335f65dcd98390e17fd84f12ec57b09890b9edf5', 3),
(456, 'Gracjan', 'Sternik', '2013-09-19', 'sternikgracjan', '1bd78321db2d8be5f6e085ed58c2bdc39dd1a773', 3),
(457, 'Sławomir', 'Dyczko', '2013-01-18', 'dyczkosławomir', '382e43ab218f435e6c68442c8a13cc8ece06f262', 3),
(458, 'Błażej', 'Okrzesik', '2015-12-02', 'okrzesikbłażej', '390a5994a6cfa665005eb5b541f77ff9177b96c4', 3),
(459, 'Bożena', 'Jacak', '2015-12-02', 'jacakbożena', 'e6237590acce67d7a1f0d5523a61401b4c73de77', 3),
(460, 'Aneta', 'Kardas', '2015-01-11', 'kardasaneta', '687a8ff6de35356981b1825c58f90c44bb334e64', 3),
(461, 'Oliwier', 'Wielgos', '2014-01-05', 'wielgosoliwier', 'b1ab7e878ffdd008fae2d89cd357a7a378df4771', 3),
(462, 'Gertruda', 'Jaglińska', '2017-07-21', 'jaglińskagertruda', '747a91e0164f75cb7b5faba5ea2dc2df0d9aa329', 3),
(463, 'Edyta', 'Rzalska', '2018-06-26', 'rzalskaedyta', 'bc86adf3a6da2e3b5a20982b7d73e0609eb34777', 3),
(464, 'Daria', 'Księżak', '2017-09-07', 'księżakdaria', 'a965237477cfb27440c0ce91189d9149aff726bd', 3),
(465, 'Adriana', 'Kuran', '2014-07-19', 'kuranadriana', '5daf659ac4570bbc638eca87750a8780aca582f4', 3),
(466, 'Honorata', 'Groszkowska', '2015-05-05', 'groszkowskahonorata', '77f3a0e7a6ba4afcc9b57f677bafa41a059694f3', 3),
(467, 'Zygmunt', 'Kacperski', '2011-10-17', 'kacperskizygmunt', '32decd808db6d1461f555bc3e690da0016a9dc1a', 3),
(468, 'Janina', 'Piechna', '2015-12-15', 'piechnajanina', 'a4463b0d600aad4e90292350e025788de98ffc8b', 3),
(469, 'Michał', 'Długajczyk', '2016-10-28', 'długajczykmichał', 'e2435ef0fb35bfd09fc49d01d5da8cdfbb5f4993', 3),
(470, 'Edward', 'Volkov', '2016-11-09', 'volkovedward', '2c7d86ab52bf3e9e589c64e77cb1040396747dca', 3);
INSERT INTO `uzytkownik` (`id`, `imie`, `nazwisko`, `data_urodzenia`, `login`, `haslo`, `id_roli`) VALUES
(471, 'Igor', 'Jaczyński', '2013-03-27', 'jaczyńskiigor', 'd84675172c8e5184f7a3ee1a9ff2faec0f2e18a2', 3),
(472, 'Feliks', 'Matecki', '2015-07-09', 'mateckifeliks', '81a0986293ed0327d0bbce0ddf9e4ef8776a7cf8', 3),
(473, 'Artur', 'Cwynar', '2017-03-11', 'cwynarartur', '0a178ab1bf584616bf5b26c70cb24257ea8bfccf', 3),
(474, 'Jarosław', 'Ciechanowski', '2017-01-18', 'ciechanowskijarosław', 'a47a32de3fc8697e3b4e485a3ebeb0a0f40935b5', 3),
(475, 'Cyprian', 'Sobczyński', '2013-09-25', 'sobczyńskicyprian', '4139d590351f9b18b78c8dde1a60d985f25a1d81', 3),
(476, 'Ludwik', 'Kunka', '2018-02-15', 'kunkaludwik', '00193809ab39bb10c810aca88ed777094a5e8d02', 3),
(477, 'Zdzisława', 'Uryga', '2012-04-02', 'urygazdzisława', 'ff500d570f1e453ad28b445f6175f21850c0630d', 3),
(478, 'Nadiia', 'Parys', '2015-11-08', 'parysnadiia', 'd90036793fbab535b2a9b74c4b62f52974eef1f3', 3),
(479, 'Sabina', 'Rowińska', '2017-11-09', 'rowińskasabina', '579e8182d853e7097b9e793221e9c658d13b1385', 3),
(480, 'Kuba', 'Oliwa', '2017-09-06', 'oliwakuba', 'a1ae5e58c0645010d5e240b61bceb2204895a93b', 3),
(481, 'Justyna', 'Tyborowska', '2012-03-13', 'tyborowskajustyna', '8151b9d0c9e7cbb0a97cb75ab05277a8141b72b1', 3),
(482, 'Oliwier', 'Popielarczyk', '2011-08-09', 'popielarczykoliwier', '644d7e2040716e4680a37d52e0c1f057241fb022', 3),
(483, 'Jarosław', 'Przygocki', '2018-07-07', 'przygockijarosław', 'dde2a04fba9e691bce66f24e4f1815c4008feaab', 3),
(484, 'Marzena', 'Pilch', '2018-02-20', 'pilchmarzena', '7c42931d1e093c88c4f4aa3263e3bfe998f5d2ef', 3),
(485, 'Marzena', 'Wińska', '2014-07-06', 'wińskamarzena', '96d0c9433f5c2a7701b10fd6fa1d3d0da7208caf', 3),
(486, 'Alicja', 'Sacharczuk', '2011-09-09', 'sacharczukalicja', '4fa1eb9a36e0ee9aa6268141f62c9cc5c8665a2d', 3),
(487, 'Klaudia', 'Talarek', '2011-11-02', 'talarekklaudia', 'ff15c7f48feedefdd6042535fd905ff59a35a9aa', 3),
(488, 'Julia', 'Saienko', '2017-05-08', 'saienkojulia', 'c589da7e43461de7ce5b5b2d60b0972feefd69c1', 3),
(489, 'Natalia', 'Wrześniak', '2017-09-10', 'wrześniaknatalia', 'bc10ad8749d74fb810e3fede3f0e7d9cc17c2c6f', 3),
(490, 'Mariusz', 'Labuda', '2018-06-25', 'labudamariusz', '940fe8e654500db059e63d2d1efd5a14edf69fb9', 3),
(491, 'Eleonora', 'Zawadka', '2012-04-06', 'zawadkaeleonora', '5e3986ca759fbb7cc5beea7dc1a09b4cd1207c74', 3),
(492, 'Fryderyk', 'Dyrcz', '2016-04-11', 'dyrczfryderyk', '2e6986cca8ddcf0cdc482cc47641e789e3c2dc41', 3),
(493, 'Amelia', 'Dyczkowska', '2012-07-23', 'dyczkowskaamelia', '1a4227295d78aa04bacab86dc892ede43b875748', 3),
(494, 'Jacek', 'Waloch', '2011-10-08', 'walochjacek', '0deb973490894ed8e4d8fa7d954a1a81d230c9d2', 3),
(495, 'Janusz', 'Job', '2014-08-14', 'jobjanusz', '584fc934d222e5dd73cb90251350dea82d9ecead', 3),
(496, 'Kamila', 'Rzeszut', '2012-11-13', 'rzeszutkamila', '804c11b17fe712d67a168ca9a6c3532fbb95ac03', 3),
(497, 'Alicja', 'Podsiadła', '2017-03-07', 'podsiadłaalicja', '6fa5c38fdab9dc4b127ba63c1ce9a39803e505a9', 3),
(498, 'Krystyna', 'Bondar', '2013-04-19', 'bondarkrystyna', '73051d910139bd105384cc628787d714a9059446', 3),
(499, 'Cecylia', 'Włoch', '2014-03-21', 'włochcecylia', 'b08b9f59305d0029702cff0ec26a6a556b4e87c9', 3),
(500, 'Aneta', 'Jarzębska', '2012-03-15', 'jarzębskaaneta', '69fe157c8244364bdb1c47adcfaaf4331f188fd5', 3),
(501, 'Szczepan', 'Kazberuk', '2013-06-18', 'kazberukszczepan', '3dda193c1857ffc212f92bf8a9c87aa4267bea45', 3),
(502, 'Franciszek', 'Haponiuk', '2011-09-25', 'haponiukfranciszek', 'c72eb4d86d4e0fdc669f7fa7634216e42ef2b17a', 3),
(9999, 'Test', 'Testowy', '2035-04-01', 'test', '4028a0e356acc947fcd2bfbf00cef11e128d484a', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dzien`
--
ALTER TABLE `dzien`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `godzina`
--
ALTER TABLE `godzina`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klasa`
--
ALTER TABLE `klasa`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lekcja`
--
ALTER TABLE `lekcja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_klasy` (`id_klasy`),
  ADD KEY `id_nauczyciela` (`id_nauczyciela`),
  ADD KEY `id_przedmiotu` (`id_przedmiotu`);

--
-- Indeksy dla tabeli `plan`
--
ALTER TABLE `plan`
  ADD KEY `FK_plan_klasa` (`id_klasy`),
  ADD KEY `FK_plan_przedmiot` (`id_przedmiotu`),
  ADD KEY `FK_plan_nauczyciel` (`id_nauczyciela`),
  ADD KEY `FK_plan_pracownik` (`id_pracowni`),
  ADD KEY `FK_plan_dzien` (`id_dnia`),
  ADD KEY `FK_plan_godzina` (`id_godziny`);

--
-- Indeksy dla tabeli `pracownia`
--
ALTER TABLE `pracownia`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rel_nauczyciel_pracownia`
--
ALTER TABLE `rel_nauczyciel_pracownia`
  ADD KEY `FK_nauczyciel_pracownia` (`id_nauczyciela`),
  ADD KEY `FK_pracownia` (`id_pracowni`);

--
-- Indeksy dla tabeli `rel_nauczyciel_przedmiot`
--
ALTER TABLE `rel_nauczyciel_przedmiot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_nauczyciela` (`id_nauczyciela`),
  ADD KEY `FK_przedmiotu` (`id_przedmiotu`);

--
-- Indeksy dla tabeli `rel_opiekun_uczen`
--
ALTER TABLE `rel_opiekun_uczen`
  ADD KEY `FK_opiekun` (`id_opiekuna`),
  ADD KEY `FK_podopieczny` (`id_ucznia`);

--
-- Indeksy dla tabeli `rel_uczen_klasa`
--
ALTER TABLE `rel_uczen_klasa`
  ADD KEY `FK_uczen` (`id_ucznia`),
  ADD KEY `FK_klasa` (`id_klasy`);

--
-- Indeksy dla tabeli `rel_wychowawca_klasa`
--
ALTER TABLE `rel_wychowawca_klasa`
  ADD KEY `FK_wychowawca` (`id_wychowawcy`),
  ADD KEY `FK_wych_klasy` (`id_klasy`);

--
-- Indeksy dla tabeli `rola`
--
ALTER TABLE `rola`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `szczesliwy_numerek`
--
ALTER TABLE `szczesliwy_numerek`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_rola` (`id_roli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dzien`
--
ALTER TABLE `dzien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `godzina`
--
ALTER TABLE `godzina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `klasa`
--
ALTER TABLE `klasa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `lekcja`
--
ALTER TABLE `lekcja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pracownia`
--
ALTER TABLE `pracownia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `przedmiot`
--
ALTER TABLE `przedmiot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `rel_nauczyciel_przedmiot`
--
ALTER TABLE `rel_nauczyciel_przedmiot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `rola`
--
ALTER TABLE `rola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `szczesliwy_numerek`
--
ALTER TABLE `szczesliwy_numerek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lekcja`
--
ALTER TABLE `lekcja`
  ADD CONSTRAINT `lekcja_ibfk_1` FOREIGN KEY (`id_klasy`) REFERENCES `klasa` (`id`),
  ADD CONSTRAINT `lekcja_ibfk_2` FOREIGN KEY (`id_nauczyciela`) REFERENCES `uzytkownik` (`id`),
  ADD CONSTRAINT `lekcja_ibfk_3` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmiot` (`id`);

--
-- Constraints for table `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `FK_plan_dzien` FOREIGN KEY (`id_dnia`) REFERENCES `dzien` (`id`),
  ADD CONSTRAINT `FK_plan_godzina` FOREIGN KEY (`id_godziny`) REFERENCES `godzina` (`id`),
  ADD CONSTRAINT `FK_plan_klasa` FOREIGN KEY (`id_klasy`) REFERENCES `klasa` (`id`),
  ADD CONSTRAINT `FK_plan_nauczyciel` FOREIGN KEY (`id_nauczyciela`) REFERENCES `uzytkownik` (`id`),
  ADD CONSTRAINT `FK_plan_pracownik` FOREIGN KEY (`id_pracowni`) REFERENCES `pracownia` (`id`),
  ADD CONSTRAINT `FK_plan_przedmiot` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmiot` (`id`);

--
-- Constraints for table `rel_nauczyciel_pracownia`
--
ALTER TABLE `rel_nauczyciel_pracownia`
  ADD CONSTRAINT `FK_nauczyciel_pracownia` FOREIGN KEY (`id_nauczyciela`) REFERENCES `uzytkownik` (`id`),
  ADD CONSTRAINT `FK_pracownia` FOREIGN KEY (`id_pracowni`) REFERENCES `pracownia` (`id`);

--
-- Constraints for table `rel_nauczyciel_przedmiot`
--
ALTER TABLE `rel_nauczyciel_przedmiot`
  ADD CONSTRAINT `FK_nauczyciela` FOREIGN KEY (`id_nauczyciela`) REFERENCES `uzytkownik` (`id`),
  ADD CONSTRAINT `FK_przedmiotu` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmiot` (`id`);

--
-- Constraints for table `rel_opiekun_uczen`
--
ALTER TABLE `rel_opiekun_uczen`
  ADD CONSTRAINT `FK_opiekun` FOREIGN KEY (`id_opiekuna`) REFERENCES `uzytkownik` (`id`),
  ADD CONSTRAINT `FK_podopieczny` FOREIGN KEY (`id_ucznia`) REFERENCES `uzytkownik` (`id`);

--
-- Constraints for table `rel_uczen_klasa`
--
ALTER TABLE `rel_uczen_klasa`
  ADD CONSTRAINT `FK_klasa` FOREIGN KEY (`id_klasy`) REFERENCES `klasa` (`id`),
  ADD CONSTRAINT `FK_uczen` FOREIGN KEY (`id_ucznia`) REFERENCES `uzytkownik` (`id`);

--
-- Constraints for table `rel_wychowawca_klasa`
--
ALTER TABLE `rel_wychowawca_klasa`
  ADD CONSTRAINT `FK_wych_klasy` FOREIGN KEY (`id_klasy`) REFERENCES `klasa` (`id`),
  ADD CONSTRAINT `FK_wychowawca` FOREIGN KEY (`id_wychowawcy`) REFERENCES `uzytkownik` (`id`);

--
-- Constraints for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD CONSTRAINT `FK_rola` FOREIGN KEY (`id_roli`) REFERENCES `rola` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

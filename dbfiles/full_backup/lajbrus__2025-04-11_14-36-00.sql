-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 11, 2025 at 02:36 PM
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
  `nazwa` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `przedmiot`
--

INSERT INTO `przedmiot` (`id`, `nazwa`) VALUES
(1, 'Język Polski'),
(2, 'Język Angielski'),
(3, 'Język Niemiecki'),
(4, 'Matematyka'),
(5, 'Chemia'),
(6, 'Biologia'),
(7, 'Geografia'),
(8, 'Fizyka'),
(9, 'Wychowanie fizyczne'),
(10, 'Religia'),
(11, 'Wiedza o kulturze'),
(12, 'Wiedza o społeczeńst'),
(13, 'Historia'),
(14, 'Plastyka'),
(15, 'Technika'),
(16, 'Informatyka');

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
(36, 36);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rel_nauczyciel_przedmiot`
--

CREATE TABLE `rel_nauczyciel_przedmiot` (
  `id` int(11) NOT NULL,
  `id_nauczyciela` int(11) DEFAULT NULL,
  `id_przedmiotu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(57, 12),
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
(3, 'Uczen');

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
(1, 'Uczeń', 'Uczniowski', '2006-01-04', 'uczen', '4c3d2997a31a7dc66252d5b8a4e369ec0e9c35ec', 3),
(2, 'Nauczyciel', 'Nauczycielski', '1989-12-06', 'nauczyciel', '2b59c3dbb7b70cd7bcfe7839e3572e7278d3890d', 1),
(3, 'Ignacy', 'Skrzypek', '2012-04-01', 'skrzypekignacy', 'iwmnqtnfwwxbwohktpncnivnzznzrrueapuvdkpd', 3),
(4, 'Kajetan', 'Trzaskowski', '1974-02-27', 'trzaskowskikajetan', 'yhjkaoxxknrhwkapmchzgeikcmwrmysxcxsbmkll', 1),
(5, 'Rozalia', 'Kurtyka', '2013-02-02', 'kurtykarozalia', 'ndnilbetbodajkzbraetcaovbxasdnlfijnxxyox', 3),
(6, 'Eryk', 'Włodarczyk', '2012-11-09', 'wlodarczykeryk', 'snbiktqpafabsgvwknjvltfegetpwazddbgjmbmc', 3),
(7, 'Celina', 'Klonowska', '2011-03-08', 'klonowskacelina', 'wshicxpwkgbqypnwltgrzenemloyolyypsfdlecv', 3),
(8, 'Lena', 'Cupiał', '1973-06-01', 'cupiallena', 'tqmfehghdezmzchfrofhyibocdpxmrkfhbsywoso', 1),
(9, 'Tomasz', 'Maciejak', '1993-03-28', 'maciejaktomasz', 'tnccynzhflghyeikxzwqunbgkgbbrubpqffipele', 1),
(10, 'Hanna', 'Musiałowska', '2013-03-07', 'musialowskahanna', 'cpupejvsasynyvapajpqvvoidyhrgmdknwpqkwcr', 3),
(11, 'Roman', 'Uzibło', '1982-01-14', 'uzibloroman', 'ddqxfxoehbkyzlboeauqxyhbdxqezpkcafgqmfhv', 1),
(12, 'Paweł', 'Pogwizd', '1970-06-07', 'pogwizdpaweł', 'fpdzxrkhimahttorjcdrsgfyxkxtmrmkpxrflryp', 1),
(13, 'Henryka', 'Pieczarka', '1980-06-08', 'pieczarkahenryka', 'cwznqyrlbahgfxhjhrmzionsnjwqdzyvpudmyjpd', 1),
(14, 'Ernest', 'Gamór', '2013-02-17', 'gamorernest', 'eotjturztrodayzdivnouptozgmvrnfnyydaswcx', 3),
(15, 'Daniela', 'Janecka', '1971-04-19', 'janeckadaniela', 'ckelvhlgcflvxcsuztxdsponsaiprvcefsxfblww', 1),
(16, 'Feliksa', 'Żurawska', '2016-05-15', 'zurawskafeliksa', 'oetyxhwsiilviiqnkhqkiabowkoitlvgyknavbgv', 3),
(17, 'Bogdan', 'Lesiewicz', '1995-03-24', 'lesiewiczbogdan', 'ocnzkctlemeuoaybfjfgvqpvfqxchzvesnmggpdh', 1),
(18, 'Grzegorz', 'Kwaśnik', '2013-04-05', 'kwasnikgrzegorz', 'wpygiowrebeyjyzauxytcxfvwydmjtgrozpcirbd', 3),
(19, 'Amelia', 'Starzyk', '2012-02-21', 'starzykamelia', 'nigxiijkvcizynodxmglzhckwthuyiqwmnwiwbcx', 3),
(20, 'Karina', 'Olender', '1988-10-18', 'olenderkarina', 'clsxwrlohpektwojmxudgpacqufnhcistzbsfbtf', 1),
(21, 'Augustyn', 'Brzezicki', '2016-07-07', 'brzezickiaugustyn', 'qrnqlpyofhdtduvzwqqysxwijxtutzpwzvonkwoj', 3),
(22, 'Konstanty', 'Drobny', '1993-11-16', 'drobnykonstanty', 'dlwiddjcfddepjkzxfvvbyniszgivghectywesva', 1),
(23, 'Wiktoria', 'Rajczakowska', '1974-03-22', 'rajczakowskawiktoria', 'pxmcrxagabuzqkbusvzhakdmduhkztcubrjqmptj', 1),
(24, 'Adela', 'Fras', '1983-11-01', 'frasadela', 'ieylbobopayixhwjwvmenpstpzjdtklpozrrtqwu', 1),
(25, 'Igor', 'Bartkowski', '1997-10-02', 'bartkowskiigor', 'oadvknhhvotesfxkukpodogtprutrvxarvkyxfeq', 1),
(26, 'Bogumił', 'Gliszczyński', '2016-03-28', 'gliszczynskibogumil', 'nujaxcabmlgfootvguupglzzhetbkuzfvvpztind', 3),
(27, 'Klaudiusz', 'Golba', '1981-12-19', 'golbaklaudiusz', 'anwlnsdbzwawqteeogldfmcgozvainomshojyfay', 1),
(28, 'Karina', 'Przybyliska', '1981-07-25', 'przybyliskakarina', 'udilfhqowczrehodigfuinhamqorjimrimtuftjb', 1),
(29, 'Liliana', 'Chen', '1988-06-06', 'chenliliana', 'yxojyuxwamvbroriuxlbfnpcdheoxjsmnlpgnwvr', 1),
(30, 'Wiesława', 'Yakovenko', '1975-12-09', 'yakovenkowieslawa', 'kwnbzdbsgiluaifgmidglszvacslgdgphcbwgjnb', 1),
(31, 'Tadeusz', 'Glazowski', '1971-11-04', 'glazowskitadeusz', 'qadqfiwllnimwjdrzjcqzypwijyyiabywavjndlw', 1),
(32, 'Mieczysława', 'Owczarek', '1989-01-17', 'owczarekmieczyslawa', 'oszmmigzfrtreirthddtjffhkjtlcuofjilgqnar', 1),
(33, 'Blanka', 'Wacawczyk', '2014-04-23', 'wacawczykblanka', 'ngvwgupxceskiaskwgkezpkkradgnqnfgnicybik', 3),
(34, 'Leon', 'Cedro', '1986-02-26', 'cedroleon', 'jeghasrrlzjtavmtrakjwyxdzppnpjlzpxpcfxkh', 1),
(35, 'Maksymilian', 'Oczko', '1973-10-01', 'oczkomaksymilian', 'lidhoydrezpgybfofuwyxmriaszqlqjfaqsapcpj', 1),
(36, 'Krystyna', 'Szkutnik', '2015-03-27', 'szkutnikkrystyna', 'truxuqromrlkmfnoxoxzpawsxtnphpqmskyfakrr', 3),
(37, 'Teresa', 'Bogumił', '1982-05-24', 'bogumilteresa', 'wtnocjwxhldjwsbfdssszvzixffemavtdujlpcnq', 1),
(38, 'Liliana', 'Jędrzejczak', '2015-09-26', 'jędrzejczakliliana', 'tkdwhkjbemaneeudhtepctvbyyertxhoqhowixqu', 3),
(39, 'Agata', 'Zdrojewska', '1977-06-28', 'zdrojewskaagata', 'wmeyhpsoahdbrcrotbbktcbqtwnjubuptqrlezrb', 1),
(40, 'Maksymilian', 'Pasionek', '1980-01-26', 'pasionekmaksymilian', 'xvxjfzrbauupeuembuigqhedgzcwarnfvilqujiv', 1),
(41, 'Henryk', 'Jakimowicz', '2000-10-28', 'jakimowiczhenryk', 'aikmsaidteblijkdikasfwtucyfapimjhantukiv', 1),
(42, 'Klaudia', 'Rogula', '1994-11-21', 'rogulaklaudia', 'ohouaixmadhzqwidiqhkmwhiznscfzwngzlrruco', 1),
(43, 'Sylwester', 'Arendarski', '1990-09-28', 'arendarskisylwester', 'xhhesbofzlundmhsjcaddprcjvrlttjsgfavufuh', 1),
(44, 'Edyta', 'Celuch', '1970-03-10', 'celuchedyta', 'ntbjgnpyceeiropakjxzbnbubxagpxhzgndtwwzq', 1),
(45, 'Roksana', 'Martynenko', '1981-04-15', 'martynenkoroksana', 'tcdcpjoirjwiepgwflgyplqscsutgkilnshgkgee', 1),
(46, 'Cezary', 'Magnuszewski', '1989-03-24', 'magnuszewskicezary', 'vwvpwdylnydffczeyvgoaipovutkmvkgwnytvobo', 1),
(47, 'Eugeniusz', 'Skrzypek', '1974-07-26', 'skrzypekeugeniusz', 'plcrtwbitpflhsxlcebkxsrxxkokctbdgwudyoke', 1),
(48, 'Maksym', 'Stachnik', '2016-02-19', 'stachnikmaksym', 'bhqxshjjmfgzivsytsdenynwblkxnomafjwkblqv', 3),
(49, 'Lidia', 'Matuszak', '1992-11-06', 'matuszaklidia', 'wfuewklroseqhzinmevhhwwnsumjozesjqzortxy', 1),
(50, 'Krzysztof', 'Jagieła', '1991-03-19', 'jagiełakrzysztof', 'scwgowbggobpixlewvxyzfwgoprktlcrmibhzves', 1),
(51, 'Leokadia', 'Saienko', '2015-11-22', 'saienkoleokadia', 'crweiavazzxeaghadfipvmasxnhudhgcjrjxmhbu', 3),
(52, 'Bronisława', 'Basak', '1980-10-10', 'basakbronisława', 'voxunxsdjasbywwousfneditkgmoasvohggjtzsd', 1),
(53, 'Marian', 'Wojtowicz', '1992-04-08', 'wojtowiczmarian', 'wuqbiggfuehjstfvcmrcwzxbfpsohpbpcarxzhzm', 1),
(54, 'Milena', 'Maik', '2018-02-21', 'maikmilena', 'oxirqejixuaywmpunpsbaisediasgycatwrffbwo', 3),
(55, 'Żaneta', 'Węglarz', '1993-09-27', 'węglarzżaneta', 'yqixznyvmdyewgpyagbmlfaowgndkmpuneltyzvm', 1),
(56, 'Wioletta', 'Hibner', '1981-07-19', 'hibnerwioletta', 'lfchoxraaqwxbtecfgdjwsprjodljrfqjalxaofh', 1),
(57, 'Ignacy', 'Bentkowski', '1995-09-24', 'bentkowskiignacy', 'dgfnfoumndieugesaqhlmiogceszdxfqlhbrpdsb', 1),
(58, 'Kornel', 'Ryszkiewicz', '1988-01-15', 'ryszkiewiczkornel', 'mjnajxiijkamqvuuhpqgnkjlhfjpqrfkchuzhhch', 1),
(59, 'Albert', 'Tomkowiak', '1980-05-28', 'tomkowiakalbert', 'efdhrgieyyucwveeyxvgzvtrhhsglnveyxifyxcd', 1),
(60, 'Adela', 'Czubkowska', '1970-10-23', 'czubkowskaadela', 'oksvjcfwpfggrualntyatyuaxzmbfzeogbsstwpq', 1),
(61, 'Cezary', 'Fortuna', '2000-03-20', 'fortunacezary', 'ttgpgidewottsfpurmyzurzszeczkqkncdkhyawo', 1),
(62, 'Karina', 'Hartman', '1991-06-19', 'hartmankarina', 'faaofjsrwzzxzphkmbgtglguteplmhakisbelfhs', 1),
(63, 'Bolesław', 'Boksa', '1983-03-02', 'boksabolesław', 'dffthbhpnqosveghugqbzdnmwglpqqyfaqczogma', 1),
(64, 'Damian', 'Ulewicz', '1975-07-28', 'ulewiczdamian', 'lnsfoqkbfhjbzttpaqrfsinwlrqulvavoeypcwfd', 1),
(65, 'Ignacy', 'Łokaj', '1996-04-10', 'łokajignacy', 'qzuobnecdppekmxcjatcqkuontekkrfsstyizild', 1),
(66, 'Urszula', 'Drost', '2000-04-10', 'drosturszula', 'pykcybclydvucccnzocedwxlpiwdokuhrtpejcts', 1),
(67, 'Aldona', 'Śledzińska', '1993-03-07', 'śledzińskaaldona', 'zxvbvxayojubiymzazasotmiaehndzpeehahcksz', 1),
(68, 'Klara', 'Kamieniarz', '1985-09-19', 'kamieniarzklara', 'puwxygeldovrwjusqwjrluurgqqdytxleedykjol', 1),
(69, 'Franciszka', 'Kubasik', '1982-06-05', 'kubasikfranciszka', 'bmtqoidvyvgyiyqturqxfzrnzkmeutsqqazsqjun', 1),
(70, 'Stefan', 'Skupin', '1971-10-22', 'skupinstefan', 'gqrlzpawwilhsnqkipqtqzgsnbgglejcninzjrgl', 1),
(71, 'Urszula', 'Lendzion', '1975-06-21', 'lendzionurszula', 'hptofoxqkmozaezpqqlsajnvitwwtcvjizbyegbf', 1),
(72, 'Ludwik', 'Gonciarz', '1982-02-18', 'gonciarzludwik', 'eychpyudrlnyzwnfscvetfwybwppymyfglkfdhsh', 1),
(73, 'Łukasz', 'Dobrzyński', '1983-01-21', 'dobrzyńskiłukasz', 'pmygirrfjlqzosogijccemsnnsubdwgeazwfddbp', 1),
(74, 'Aleksandra', 'Lutsenko', '2011-09-07', 'lutsenkoaleksandra', 'qxqwmpnplbaaywdlwbkffeeohdffysffneklivpi', 3),
(75, 'Izabela', 'Paprzycka', '1983-08-24', 'paprzyckaizabela', 'vbdpvyeypvmnuebystddxbonghfuoslmuiuxpmem', 1),
(76, 'Kamil', 'Lato', '1976-06-28', 'latokamil', 'dfyolttqxlkvuvvnwergrvqjyebrrdexouppodly', 1),
(77, 'Michalina', 'Makoś', '1995-08-12', 'makośmichalina', 'bwhwjnvhrjjpfnszbhefwenleonozhkbygvupvxf', 1),
(78, 'Rudolf', 'Dziamski', '1990-12-24', 'dziamskirudolf', 'xsmdvsmwfidmgnoajifbgoyonltywpyuwwokcdoa', 1),
(79, 'Henryk', 'Szabla', '1995-03-26', 'szablahenryk', 'utkrzbqavptqcayiewcrwhdmsvrpvwencdyescku', 1),
(80, 'Renata', 'Młodawska', '1999-02-10', 'młodawskarenata', 'vlqhjcendntkmarhsdujdqybkctxdixfayxjbhev', 1),
(81, 'Aneta', 'Gałuszka', '1996-11-12', 'gałuszkaaneta', 'rhmvngimnxlgsgnoyfxgbomxampuwxniqwdpiziv', 1),
(82, 'Feliksa', 'Noga', '2013-10-19', 'nogafeliksa', 'efymoychynrhwmpctubjfgjcgcbwzmbeslatpknf', 3),
(83, 'Feliksa', 'Karlikowska', '2015-09-08', 'karlikowskafeliksa', 'osbphdivkohzqxafhigehzlzakxodbvpexebipkt', 3),
(84, 'Bartłomiej', 'Knopek', '2018-07-11', 'knopekbartłomiej', 'hbowdvmlgmfwlqvhjqkapmgdzfriyssvqpbkuacz', 3),
(85, 'Pola', 'Dębiec', '1985-12-18', 'dębiecpola', 'twptjnzngyroetdhvdacssggfmowqopycbnezdvi', 1),
(86, 'Hanna', 'Supińska', '1970-03-14', 'supińskahanna', 'lhaefdisxwixjwsopqjxzhqoihsdpmlovaujdetj', 1),
(87, 'Paweł', 'Orzechowski', '1984-06-05', 'orzechowskipaweł', 'rshxhnlmchvfblkfluwlabnpeizbqvsuhqaukyjl', 1),
(88, 'Iryna', 'Zwierz', '2011-10-07', 'zwierziryna', 'kftlfjlmzauyjwmmlrvfurzlqlmnqzlzxtkeldbr', 3),
(89, 'Olga', 'Sommer', '2011-05-21', 'sommerolga', 'fwxikvnapjyneiksltdmnomihiaiqjttakuepebb', 3),
(90, 'Martyna', 'Taranenko', '2012-11-06', 'taranenkomartyna', 'ctpzbtqjluwtsggfduroxwdbwjvxkjsdsabpoyuw', 3),
(91, 'Mariia', 'Lampa', '1984-07-14', 'lampamariia', 'wqojtncznpszpitezsoajvvpzykwnjxmtbzzwlbi', 1),
(92, 'Grażyna', 'Staniaszek', '2016-01-02', 'staniaszekgrażyna', 'ubkonswiehosakstpnmysgnsiypfwyostqrgzqgh', 3),
(93, 'Karol', 'Ciechomski', '2015-09-09', 'ciechomskikarol', 'ynynfuhamnyvebstapnwsmdxwfrqnanflpyiypqg', 3),
(94, 'Amelia', 'Grygorcewicz', '2013-09-24', 'grygorcewiczamelia', 'kupcbgptaqkuyvkynhtuokvtpbubfjtazyesosan', 3),
(95, 'Romuald', 'Stoliński', '1979-06-27', 'stolińskiromuald', 'upskqgqppnkcdyzqclalcpgndqqzfzurfhyudvzb', 1),
(96, 'Ewelina', 'Luchowska', '2013-06-22', 'luchowskaewelina', 'lqkcicrdqenftsetdcjacshwingtalegsdyqbnqn', 3),
(97, 'Rudolf', 'Guziak', '2011-01-01', 'guziakrudolf', 'dqsocfmswexcxwjpioqekpyevsdahtthjrfjpsbh', 3),
(98, 'Eliza', 'Maron', '1995-05-06', 'maroneliza', 'xyxfcxhncikxnfxvkodjrbvvctovtashnbuqyfkh', 1),
(99, 'Kuba', 'Jurczyk', '1992-06-07', 'jurczykkuba', 'erkmeyzwqavzzmguwjkqlluybyvcfdycfxubtfwi', 1),
(100, 'Izabela', 'Pyda', '1990-12-21', 'pydaizabela', 'dygislqujyogshpvogqobzrrmkfozxfipnoquiqt', 1),
(101, 'Tymon', 'Osik', '2012-07-06', 'osiktymon', 'vpfesztjwkilhcwjmpmvggmzkuvxbsfddaflzlnr', 3),
(102, 'Włodzimierz', 'Garczyński', '2018-07-01', 'garczyńskiwłodzimier', 'skwkejwuasmcxtsmvpzjrkfbczzlabvmatgsmfpt', 3),
(103, 'Angelika', 'Oknińska', '1996-07-21', 'oknińskaangelika', 'xshcckugflnylfknadhewlixjsvdfpdkxwvrgult', 1),
(104, 'Pelagia', 'Brychcy', '2014-08-04', 'brychcypelagia', 'tbsoxqjiibpyvppprpjbriiwplfjbydrxwnigeum', 3),
(105, 'Krzysztof', 'Domański', '1999-09-10', 'domańskikrzysztof', 'zqsgdziwploydxhaddvtgggexbrfriiqwkaysjcm', 1),
(106, 'Krystyna', 'Golik', '1976-12-27', 'golikkrystyna', 'iqxvjqylpiufbmwiziwksthudbfnicezsbhlyndj', 1),
(107, 'Franciszka', 'Nikolaieva', '2016-03-03', 'nikolaievafranciszka', 'xjxkwnzvxssjjnakjmkhwfpucuaulhexjgniybsq', 3),
(108, 'Julianna', 'Pietrasik', '2015-09-16', 'pietrasikjulianna', 'iywrdkwkxleokbmpgcuuzsynxuhxbpowvvbubcql', 3),
(109, 'Waldemar', 'Mendel', '1987-05-27', 'mendelwaldemar', 'xlyhoyoifjtxwajvcxeizhaubwxahhdbvhifkfwz', 1),
(110, 'Renata', 'Sitarska', '2017-12-12', 'sitarskarenata', 'pbwmntgemibzotfwvcgnsnywbxtpoehwueolckac', 3),
(111, 'Stanisława', 'Brzostek', '2015-02-06', 'brzostekstanisława', 'qfdqbyygzxikxdjsrrcmuwdnjsdwalkhjfrbclty', 3),
(112, 'Seweryn', 'Wszoła', '2012-02-07', 'wszołaseweryn', 'sbukoutcsamrsyaorsgdtyqsdttijshcwhjcpuxg', 3),
(113, 'Jędrzej', 'Soloviov', '2015-04-08', 'soloviovjędrzej', 'rnlcdfsbdhrvxistrzfjexlmiquomfuyupvjifas', 3),
(114, 'Zofia', 'Pruska', '2013-06-05', 'pruskazofia', 'xwshsktyzyyhigvjujwmajvlnhevsursiiqzfsmg', 3),
(115, 'Antoni', 'Lelonek', '2013-11-04', 'lelonekantoni', 'iqmdjaotqgexkonaxjekheluwenvbaaybrhakcth', 3),
(116, 'Pelagia', 'Yefremova', '2015-02-23', 'yefremovapelagia', 'jujhyksxbbffdflkbosqshkcgehbvsdpijqvtvfk', 3),
(117, 'Mariola', 'Karkoszka', '1995-11-27', 'karkoszkamariola', 'lhxoyzkbmugidbwuwhhclzyxdqrskvvbknzzhasc', 1),
(118, 'Kuba', 'Ostojski', '2017-11-20', 'ostojskikuba', 'hzmuopwandiufhwpudivfxsdjgocrdaaeduyjwrk', 3),
(119, 'Bartosz', 'Owoc', '2012-04-12', 'owocbartosz', 'egbxudaerxchtjkkpdovxepwsmgleonvcelkpwpz', 3),
(120, 'Bohdan', 'Stachów', '1976-02-03', 'stachówbohdan', 'hceetlebgtyhcnggjvukrjgqphclbximmqpsfaoz', 1),
(121, 'Tadeusz', 'Wojak', '2013-07-05', 'wojaktadeusz', 'mzzhgzbqxdvgyoskptientccoybuvogcfwfgdgrz', 3),
(122, 'Albert', 'Sobieraj', '2018-02-14', 'sobierajalbert', 'chjsgbknslyhufattimmrruhckolmhbasfrujhtz', 3),
(123, 'Tadeusz', 'Małczak', '2014-08-06', 'małczaktadeusz', 'ipgwxbvwefplwfhzsyombuxlqbatclvbzmqtaidh', 3),
(124, 'Daniel', 'Wieleba', '1973-06-25', 'wielebadaniel', 'wmkpbdyyqvpolvjgromjdcffkecqpaviglzpitgr', 1),
(125, 'Eugenia', 'Dębska', '1993-04-18', 'dębskaeugenia', 'rdpldpahjboqdnmksspfqfrqvjeevndpunbdspfd', 1),
(126, 'Damian', 'Baumgart', '2013-02-23', 'baumgartdamian', 'klfaamgkbppxpphqwratartokkckxcehskitltnm', 3),
(127, 'Nataliia', 'Dmoch', '1987-12-03', 'dmochnataliia', 'ndoeyxtdiixodaaytcaacdsomaoqirbntgkmprpq', 1),
(128, 'Marcelina', 'Choma', '1977-12-01', 'chomamarcelina', 'uytcggrbyhlybnjwbwtpgiovjypncqjjcmbonkqp', 1),
(129, 'Filip', 'Olbryś', '2016-04-18', 'olbryśfilip', 'hymusavkrjsgmybmkfkurgdhpwwtspwpliyxzvtc', 3),
(130, 'Milena', 'Moskal', '2011-07-28', 'moskalmilena', 'ksqobehjxvonljvrkysynfytuoskxqkwaoekynzd', 3),
(131, 'Pola', 'Brodzińska', '2014-09-24', 'brodzińskapola', 'gjcougnzowyzgotwllgovoudiwomfhdpqqrnykwx', 3),
(132, 'Cyprian', 'Rosłoniec', '2015-12-08', 'rosłonieccyprian', 'exildzhshcxqhsgfaughudqqztqwoihscjcdzaji', 3),
(133, 'Mirosław', 'Czarniecki', '2018-08-18', 'czarnieckimirosław', 'rqxzerbjzyadktxjfotlvtzrtyuxcowqheqqygvv', 3),
(134, 'Bogdan', 'Wysocki', '1994-02-05', 'wysockibogdan', 'bbwnfoqlripwxrqpsdoiqevjwrwdnyhcjchjfdoy', 1),
(135, 'Paulina', 'Pankowska', '2018-10-21', 'pankowskapaulina', 'sihqhvexkbwitnftxwvcobzovkwcuzbwestlihbo', 3),
(136, 'Stefania', 'Biesaga', '2017-06-04', 'biesagastefania', 'lytxeniutmwywcpfhfncqrdzedgcchubuzbhatzt', 3),
(137, 'Wanda', 'Chrząstek', '2016-07-26', 'chrząstekwanda', 'inindzmukxrcfxbbkdtavfkooszcmtmiwtaktdjx', 3),
(138, 'Pola', 'Kuklińska', '1988-10-11', 'kuklińskapola', 'wsvlzbhdhldsarytrvqixabqdggqnzzbkcgjexpt', 1),
(139, 'Iwona', 'Bodak', '2012-01-11', 'bodakiwona', 'hprmlgoifwgvdacihmhlbmehqlkpbkicqhcozriv', 3),
(140, 'Aniela', 'Krzanowska', '1998-01-19', 'krzanowskaaniela', 'gqnyavygadumxahfwlchuortpwpkftbtkojopkme', 1),
(141, 'Feliks', 'Przygodzki', '1990-11-13', 'przygodzkifeliks', 'cobezrzqemlegbzkwubnwccrpjoiqtjrmeteujvg', 1),
(142, 'Małgorzata', 'Walus', '1974-12-10', 'walusmałgorzata', 'flaineirxxltoiyvyqcrwowiekykxcjyhfdxcivs', 1),
(143, 'Kajetan', 'Danieluk', '2017-03-21', 'danielukkajetan', 'dwglwllwtjscrzfkyouswhtkruiyemzgibqkhgsn', 3),
(144, 'Tymon', 'Jokiel', '2015-04-01', 'jokieltymon', 'qlfpexejulfpamiahsritsqyqzhbbccpcxbhwloj', 3),
(145, 'Adrianna', 'Myszk', '2018-03-16', 'myszkadrianna', 'rovrndmvpbxiynlchommzdqcploxvnetjucreniq', 3),
(146, 'Bohdan', 'Sadowy', '2013-12-26', 'sadowybohdan', 'plykflmnkzmivtpolqpxfapdzcjgjdelkuamsjtd', 3),
(147, 'Wiesław', 'Grudziński', '2013-05-14', 'grudzińskiwiesław', 'ykdhrwjhhyrwmqvcbufxbctbsizqlaubprjiuapz', 3),
(148, 'Patryk', 'Mieszczak', '2013-03-11', 'mieszczakpatryk', 'ojvwzftyxhgxaqqlknbbhrfjotawapyvwqvhszdh', 3),
(149, 'Dawid', 'Kuźniar', '2017-04-05', 'kuźniardawid', 'znwbmdkqzzosabxnbjmqmznvyxxbgkyukgulcxmv', 3),
(150, 'Artur', 'Krysa', '2013-08-17', 'krysaartur', 'japgthcutnqycdsikgkgjygfagpursdipcrpwtoa', 3),
(151, 'Jakub', 'Szweda', '2012-05-21', 'szwedajakub', 'mnetamflxkwhdksirzgtqkhqghrhzpxksyufjmkg', 3),
(152, 'Daniela', 'Matyjaszek', '1980-05-01', 'matyjaszekdaniela', 'hlbkbebfhkmryzfakedcfzjswkarnbfqmfujgzgu', 1),
(153, 'Kuba', 'Wojnar', '2015-01-07', 'wojnarkuba', 'qiplfgyroybkcefxnadxgbzmzechnllhfgbrlqpd', 3),
(154, 'Albert', 'Katarzyński', '1992-10-12', 'katarzyńskialbert', 'muvprfprwlkvyewsjzpzzspvsbckmcspqzrqamnl', 1),
(155, 'Ilona', 'Walecka', '2015-10-05', 'waleckailona', 'zcwxtouwnjuargtictcqrzkjwgudjvyskddvbflx', 3),
(156, 'Wiesława', 'Dembińska', '2014-06-19', 'dembińskawiesława', 'hvvkfzuaqlxocxrhxowabzhhhxavinxclpkoihwl', 3),
(157, 'Marzena', 'Pruchnik', '1983-09-28', 'pruchnikmarzena', 'aululjruhwppqxakuxvdnkozpohawwoxclxkwneb', 1),
(158, 'Iga', 'Musioł', '1996-03-15', 'musiołiga', 'vumxfhlonflqtdxqnyioieuveufmkclsidhytluw', 1),
(159, 'Edward', 'Skrzypczyk', '2014-11-13', 'skrzypczykedward', 'pwqcnspoluhvungtbiwaenmwddimednqjrrqrjwt', 3),
(160, 'Malwina', 'Regulska', '2014-05-28', 'regulskamalwina', 'tvaoqewazikfafjffztwxeyrstiaqlbivwcfpjiq', 3),
(161, 'Wioleta', 'Sulińska', '1990-07-10', 'sulińskawioleta', 'gpirrfnbywhmcggkfeptvbftsiqhtopycxkzwhof', 1),
(162, 'Hanna', 'Sokal', '2013-04-14', 'sokalhanna', 'ucnxdaygkvavnbtxpqtimyjgfwimygobocftwgsa', 3),
(163, 'Lesław', 'Nestorowicz', '1987-02-06', 'nestorowiczlesław', 'xfkqqzfbrkwvvwshndojswjljwuthkzkullhaqlh', 1),
(164, 'Magdalena', 'Ramotowska', '2011-11-10', 'ramotowskamagdalena', 'ghxnqyxjhyzjwxzrjddgcxuklfpsinjxykjaogri', 3),
(165, 'Andrzej', 'Dul', '1976-06-01', 'dulandrzej', 'sefzjmprzpcebskbwhwfmaicncaygrvrdwqlmwcd', 1),
(166, 'Marta', 'Szyc', '2011-10-11', 'szycmarta', 'vbjhmwygihkmnuajtzpitnbiqgxhzlxyqskhqnxa', 3),
(167, 'Emil', 'Wochna', '2018-06-18', 'wochnaemil', 'oyztqwtazpneyfbylqseakwotkpngwklpcbejuif', 3),
(168, 'Apolonia', 'Małczak', '1980-06-19', 'małczakapolonia', 'ijxslqqbvbuvxhhsigriuqgorgprzoetmiatoauj', 1),
(169, 'Norbert', 'Dorożyński', '1982-01-08', 'dorożyńskinorbert', 'ybkdxjqommbxtismdblmpzkncigaermhfvzfkvit', 1),
(170, 'Fabian', 'Jasnowski', '1971-11-07', 'jasnowskifabian', 'lrahltuxbjovoleuigwekxbuogwdndmrovdveehx', 1),
(171, 'Witold', 'Pabich', '2012-02-16', 'pabichwitold', 'xjcavphwtkkufrtrjqvbyfpekqgdsgpiqiivumow', 3),
(172, 'Hanna', 'Jokiel', '2011-03-18', 'jokielhanna', 'bgdutxokmymeuuvtofefyyawtpufvegezwzamtef', 3),
(173, 'Paulina', 'Pasternak', '1974-04-02', 'pasternakpaulina', 'mloczrcdezqnyqttdsmpdpocblqscvkjsegidsel', 1),
(174, 'Roman', 'Kupski', '2015-06-09', 'kupskiroman', 'heftxvbbvmpuplvyjeuqozvxzmwbxyljuqrirjrz', 3),
(175, 'Artur', 'Kuk', '2015-11-10', 'kukartur', 'eqmoiqdyrpmghvsxeggmmgicplmntsnouwpbmuul', 3),
(176, 'Alojzy', 'Podleśny', '1994-11-02', 'podleśnyalojzy', 'vyroncdapsqkqsfhtijaetysaestiojchhvuslbg', 1),
(177, 'Alojzy', 'Brzoska', '1973-03-09', 'brzoskaalojzy', 'fqqpceoymzzoqcpqfavvnbxhcatzagazxmbgrmhg', 1),
(178, 'Władysława', 'Gawin', '2013-10-15', 'gawinwładysława', 'asdgvxzejpaairfwlznucbgbkkojzbddklgquzoz', 3),
(179, 'Mariola', 'Białkowska', '2017-07-21', 'białkowskamariola', 'xmgsvwsiobwirpypjvvblrdjjbrrzxzwatznpgah', 3),
(180, 'Żaneta', 'Nowek', '1979-12-13', 'nowekżaneta', 'trbxjogndzpwsxukmleywnbfzsnzgeffqbrytjpj', 1),
(181, 'Liliana', 'Tatarczyk', '2011-11-03', 'tatarczykliliana', 'csnfydszyxccoyuxrfieizgnifmubprtlyzadqjp', 3),
(182, 'Zdzisława', 'Potoczna', '2016-06-10', 'potocznazdzisława', 'cesbshalsccanwiatzpqrqozzvmchgvglqbgicpt', 3),
(183, 'Stanisław', 'Groblewski', '2011-07-06', 'groblewskistanisław', 'cbimfjyvhnwvjrabcolrrmllblwkwvhilkpwabah', 3),
(184, 'Sylwester', 'Widłak', '2013-04-05', 'widłaksylwester', 'wcuejsroqcbxwkuhdrufwkzagefvadzdyzbfysee', 3),
(185, 'Cecylia', 'Zbróg', '2018-11-15', 'zbrógcecylia', 'kwvbqjolnhepcsbtambuulqsmqlekzhyvsjawhqa', 3),
(186, 'Nadiia', 'Marjańska', '2013-12-27', 'marjańskanadiia', 'hdpbtytsididufbroyzjrprmuixgnpzaqajugsor', 3),
(187, 'Anastazja', 'Fila', '2015-05-13', 'filaanastazja', 'cgzocdowwkgdtfrmjfhwrlewdhbryuipxbqbgyti', 3),
(188, 'Krystian', 'Śmieja', '1988-02-08', 'śmiejakrystian', 'telvuxtphdwzjlilrlcppclvsahfberbpmwsfyst', 1),
(189, 'Dagmara', 'Staciwa', '1980-03-06', 'staciwadagmara', 'hvubjdvfrfibxqbdirgggjhslisyexfpkoteatfb', 1),
(190, 'Blanka', 'Plizga', '1983-02-27', 'plizgablanka', 'pycqiqghubzyhcfwfgumkgrvwwumkbkubvdsmeku', 1),
(191, 'Wioleta', 'Kasztelan', '1971-07-17', 'kasztelanwioleta', 'jzprhxyefqvperypnbipvlkrjejrnoqkrqjivglk', 1),
(192, 'Tobiasz', 'Rogal', '2017-06-18', 'rogaltobiasz', 'ubomzviqenwlwyqmgkvqcdpdwmqzombkifxgcyiv', 3),
(193, 'Pelagia', 'Krasa', '2018-07-06', 'krasapelagia', 'lebcemjsoormuitflzmlhcpeoomyqfhcoamtpigo', 3),
(194, 'Monika', 'Gawrysiak', '2017-09-18', 'gawrysiakmonika', 'hccosrwoaawxclueqtibhptxswdbcxncbmgezmek', 3),
(195, 'Janusz', 'Kurpiel', '2013-07-04', 'kurpieljanusz', 'vfbmkiyoderhenefgdrvvvzrwpftjubcriubvxnv', 3),
(196, 'Miłosz', 'Puzio', '2012-03-09', 'puziomiłosz', 'tjmgmjtsswphkdzfwcgdjnejkanxnaeuanmcdkjr', 3),
(197, 'Agnieszka', 'Gryboś', '1988-07-07', 'grybośagnieszka', 'znkefagwbieuhwfzdalftijcsexinnyzilcjlcxc', 1),
(198, 'Iryna', 'Grodzka', '2011-05-22', 'grodzkairyna', 'ypxemzaxbdvruxhkurxalxmvxpnelzftanloqiqd', 3),
(199, 'Oliwia', 'Napieraj', '2012-01-06', 'napierajoliwia', 'igibwrqdblvngntuvcehbhjixqrjacbkiwcqtyer', 3),
(200, 'Walentyna', 'Jaruga', '1987-04-06', 'jarugawalentyna', 'vpwmdqgzmimcdwzqpodbqgcvtjddyroywpunccpn', 1),
(201, 'Marek', 'Stokowski', '1997-10-13', 'stokowskimarek', 'drmmndahsjvzekluahvahmletfjbbpdsubkkemht', 1),
(202, 'Paulina', 'Trzeciak', '2016-01-04', 'trzeciakpaulina', 'aoufqzduwjtonshpilrddndchuqukgzhvzzariku', 3),
(203, 'Roman', 'Ożarowski', '2018-05-16', 'ożarowskiroman', 'ktwcrlmkpqdsdpwnpqsykgwnmgbkkxxakobrvcev', 3),
(204, 'Sabina', 'Matuszek', '2017-08-20', 'matuszeksabina', 'pmgxxcsxiwttuvkjnznrnnaugiyvxeibvxviivgy', 3),
(205, 'Bernard', 'Maciejewski', '2017-09-01', 'maciejewskibernard', 'sezcmsuqgqentufewhsceilcmdrqhnanavxwfszr', 3),
(206, 'Milena', 'Kołacz', '1989-03-28', 'kołaczmilena', 'qyzivudzoorgsvywtfhrpaeptzrkhbmpbviorcxy', 1),
(207, 'Wacław', 'Kolasiński', '2014-12-09', 'kolasińskiwacław', 'wfkcayhdecgpzqsurmquewtswzyhcevqcqbjdfic', 3),
(208, 'Julianna', 'Gorgol', '2014-01-18', 'gorgoljulianna', 'ktyxtnhqiwtdbakwsuzfbmrtjvsyqtcfvkamqhcn', 3),
(209, 'Helena', 'Głąz', '2013-01-16', 'głązhelena', 'rzldrcpkvqsekrodinjvigfuncdyruanhamlgzau', 3),
(210, 'Mateusz', 'Danielewski', '1989-05-05', 'danielewskimateusz', 'bvlbphlokbomrbhmwwysixgrogfztzkdscgunweo', 1),
(211, 'Marlena', 'Marczuk', '2000-12-22', 'marczukmarlena', 'iwmzpagpsirnxmaxdlktzbdoixnylkpgljzmvcjy', 1),
(212, 'Gabriela', 'Kręgiel', '2015-03-19', 'kręgielgabriela', 'mnkxiwccsasxirunqchxwsliolarldjwwrneqxdc', 3),
(213, 'Laura', 'Błaszczuk', '2011-07-26', 'błaszczuklaura', 'oifekvadbeaamdtytjouymdxpbcyuazutjipvmje', 3),
(214, 'Bartłomiej', 'Hanke', '2016-06-02', 'hankebartłomiej', 'pdzgnttnvnegdqjrwuwooxcuvqlasvgzusihkrcd', 3),
(215, 'Włodzimierz', 'Sapeta', '2012-07-10', 'sapetawłodzimierz', 'fhjhfixgrjxbzoulzugqervcygyufoveeznckgik', 3),
(216, 'Mateusz', 'Świętochowski', '2011-09-07', 'świętochowskimateusz', 'qmnugkuvwhaxynvgianzldevdwazfltawrfuvemi', 3),
(217, 'Marcin', 'Stawowy', '1999-04-15', 'stawowymarcin', 'kcakvefwpphevpsjgqwrkecetltbtvwuvwkxbjmb', 1),
(218, 'Aniela', 'Kabała', '2018-09-03', 'kabałaaniela', 'nfjkqgwsyqqivqgffyfyhhwzmxnnzekznnhsqjet', 3),
(219, 'Bogumił', 'Łagocki', '2013-06-03', 'łagockibogumił', 'lruhpatlkrujwzphbqkvfxysdghlrmuxeefsnwls', 3),
(220, 'Marian', 'Chomik', '2015-08-08', 'chomikmarian', 'kulgtregoeefmiaskhgpvaaspindyjhsymsvwztn', 3),
(221, 'Cecylia', 'Sych', '1974-11-01', 'sychcecylia', 'xkmfifqqlybhmtsrxkooeuvrkktkygcioworyalp', 1),
(222, 'Henryka', 'Dukat', '1976-09-13', 'dukathenryka', 'mhraturjhffsqiviqlqycjttpxliotavsqetqzyh', 1),
(223, 'Bruno', 'Poniedziałek', '2016-06-08', 'poniedziałekbruno', 'iuxshdfmvqwssielowsquyvctxqvsnnuazrcvvyd', 3),
(224, 'Bolesław', 'Narewski', '1986-10-10', 'narewskibolesław', 'wmcwwpphavbderexjrzxzqseflxyzlutaedeqrne', 1),
(225, 'Nikola', 'Zapart', '1998-06-03', 'zapartnikola', 'tuweqdwdqpqrhazonuivipymcgltmskhsgkvjjvf', 1),
(226, 'Benedykt', 'Piech', '2011-04-26', 'piechbenedykt', 'rfecintjuxkakptyypvmpxegmlsogkblrxolqjgq', 3),
(227, 'Walenty', 'Kuk', '2018-07-27', 'kukwalenty', 'rqnidjxlbtrfsyjlktfhcthvmafwmwesbxzgamnh', 3),
(228, 'Fryderyk', 'Krzosek', '2014-04-19', 'krzosekfryderyk', 'vkddiazimywectymkjianycpkgnastghltothobi', 3),
(229, 'Ryszard', 'Warych', '1974-02-02', 'warychryszard', 'rzvnumsjtryvedljmwsxuvhpqnbiitdhxudsmqvz', 1),
(230, 'Tobiasz', 'Dzida', '2013-07-09', 'dzidatobiasz', 'lsvalzeldohtxepldduaikeezqqqqpvulyjxlalw', 3),
(231, 'Lucjan', 'Pacholak', '1983-08-17', 'pacholaklucjan', 'zhnhlfinxfbtgavfniziqmyguknjqznyaoqxkljq', 1),
(232, 'Tomasz', 'Palczewski', '2018-02-28', 'palczewskitomasz', 'bvxqzasvgazjacgysdvmvebgebzibtwqbsivcnoa', 3),
(233, 'Aurelia', 'Kokocińska', '2017-08-08', 'kokocińskaaurelia', 'wljgfkfguiievempkqggvivqyiruqptncllghgwm', 3),
(234, 'Szymon', 'Muchowski', '2017-08-26', 'muchowskiszymon', 'ikhyfptiztvzkpbwvuoyjuivsiboflqccaapgvaz', 3),
(235, 'Róża', 'Furman', '2014-01-05', 'furmanróża', 'rknbgnilskggwjvpiulnoevcsresfkxjtseqfwti', 3),
(236, 'Kamil', 'Ilczuk', '2015-08-22', 'ilczukkamil', 'hassfqjfmrcaflzuairuobxaeomqfixquyfernlz', 3),
(237, 'Daniela', 'Tymoszuk', '1996-08-12', 'tymoszukdaniela', 'wmhwyqefdzdfgeelrinpgrznaljmtnydyhlyekts', 1),
(238, 'Alicja', 'Błażewicz', '2017-03-09', 'błażewiczalicja', 'jcrwbckrdjdjwrglsgpabeqnzleukeddpnpvxgqf', 3),
(239, 'Leonard', 'Kozieł', '1994-12-11', 'koziełleonard', 'trmlmvvzmnclxwtbztbkhjobvgnuezxdqjqdlumk', 1),
(240, 'Gracjan', 'Demchenko', '2012-12-09', 'demchenkogracjan', 'rmxvoqpcmoqeqkboxbchjrxaopwnnmunvijqsbcm', 3),
(241, 'Feliks', 'Ulman', '2012-07-23', 'ulmanfeliks', 'brvupswtpbeajhlaaibhjgdbesvxnqfiwxclyamk', 3),
(242, 'Wiesława', 'Zarzeczna', '2014-10-05', 'zarzecznawiesława', 'mxcowmzvulqzbtmgqpowttdorspejtrbbrdeyahm', 3),
(243, 'Nataliia', 'Jędraszczyk', '1971-11-06', 'jędraszczyknataliia', 'ndknvqyuzrytlyuwxiystxhbzznxusvichxeqwyd', 1),
(244, 'Halina', 'Duch', '1999-01-15', 'duchhalina', 'twsemwgfiootieyylqzmxnbrltqtaitldnvgozxc', 1),
(245, 'Pelagia', 'Rydel', '2015-02-14', 'rydelpelagia', 'wrspnxcmvrbtxzjdwpifpzgvygjhhnhzfnxyhkcf', 3),
(246, 'Kazimierz', 'Kubieniec', '1985-10-09', 'kubienieckazimierz', 'cctusfhfpybrrrkociibfuuqdpvxevaftihruymh', 1),
(247, 'Żaneta', 'Smykla', '1992-03-18', 'smyklażaneta', 'sdnpmmwsvirvmwapyxoumcktfkkvvfhxoijnnwcv', 1),
(248, 'Maja', 'Wódka', '2015-01-20', 'wódkamaja', 'rdwxynsrplgtbdbfsyojjcmvanntismlisvqtwzo', 3),
(249, 'Janina', 'Dorociak', '2018-07-21', 'dorociakjanina', 'vjxiwresosyfduvrqznytodfclssjrputqmpiync', 3),
(250, 'Zygmunt', 'Gołębiewski', '2011-10-25', 'gołębiewskizygmunt', 'opqvvphyyziyexfysgoqfbsghcissbfivrgehxhc', 3),
(251, 'Matylda', 'Puławska', '1997-05-11', 'puławskamatylda', 'jsplwcxzdrcdpmlzdeaenqvjwbnpntwnzchnijzr', 1),
(252, 'Antoni', 'Stolorz', '2011-03-12', 'stolorzantoni', 'upvoffcplsegtzodqpyvdnzrgvnlzmyzrrbovdgi', 3),
(253, 'Bronisława', 'Ząbek', '2018-06-25', 'ząbekbronisława', 'jmcudnmotzguuyixziylyryffehukijneyfvfyak', 3),
(254, 'Gertruda', 'Kuzmenko', '2012-05-22', 'kuzmenkogertruda', 'vomhkdqrcwdivjnfpaoghmgieplanjaifkdilwem', 3),
(255, 'Adriana', 'Łuksza', '1970-04-14', 'łukszaadriana', 'jautwdfliziztxhchwvnrfrqgqjdfhquammhswny', 1),
(256, 'Mirosława', 'Charzyńska', '2016-04-10', 'charzyńskamirosława', 'fanhfqjcsyebrjmcpwbwhhqfjddzsmqilzqpusyg', 3),
(257, 'Kornelia', 'Madejska', '2014-05-14', 'madejskakornelia', 'bqchmuimlahwfvjykwwzoccfhrcddzlutinphbek', 3),
(258, 'Alan', 'Kajdas', '2012-02-13', 'kajdasalan', 'eldgkrkcvyhwfolqprmvqjcgukgnjdarzjczssdu', 3),
(259, 'Maja', 'Majkowska', '1995-11-07', 'majkowskamaja', 'djbhxxdvyqtbgkcuuziglblirgkvxndncilkiypo', 1),
(260, 'Miłosz', 'Bruszewski', '2016-12-05', 'bruszewskimiłosz', 'wwoahpqjutttqvpuwoblipxpngfieafkfonggoij', 3),
(261, 'Antonina', 'Mazurenko', '2013-01-02', 'mazurenkoantonina', 'rnduwapyxfwbvowosheudxjxyuivnixythunayxb', 3),
(262, 'Anastazja', 'Lee', '2016-11-06', 'leeanastazja', 'eykdqxbstnumnaxxguofltxymywaznuljtyeydqf', 3),
(263, 'Aniela', 'Juroszek', '2014-05-15', 'juroszekaniela', 'yqcngpktgjveieqejfyotjurtmoobwarsvpizeip', 3),
(264, 'Zdzisława', 'Mościńska', '2012-09-21', 'mościńskazdzisława', 'zniuesmcsqqzfygxdgrguoojbausajoyoelfanfe', 3),
(265, 'Konrad', 'Lubieniecki', '2013-04-11', 'lubienieckikonrad', 'uopocymhweywarsjmdbegxccputtzsjaizedpwox', 3),
(266, 'Jadwiga', 'Dubaj', '1986-08-12', 'dubajjadwiga', 'sybyphooyjdcsbbhkvnnjdykgiyejnzbzarzuucs', 1),
(267, 'Leopold', 'Olbiński', '2012-07-27', 'olbińskileopold', 'feyeetdsgzquihfvhfryvleqkkmqldnuprhpzyfo', 3),
(268, 'Barbara', 'Pachura', '2014-02-23', 'pachurabarbara', 'ukgpjorwhrdeecgtocceqmloulublpnrnzbbixlr', 3),
(269, 'Marcel', 'Sołowiej', '2017-07-25', 'sołowiejmarcel', 'fffjjzoxoihssfrcgvuprvrarxwfuhzebzxviqus', 3),
(270, 'Zofia', 'Gomoła', '2011-12-02', 'gomołazofia', 'clnojfvtkeaeggqjmyslmgffgaycnsgvpzxcwcpa', 3),
(271, 'Bartosz', 'Guziński', '2015-03-17', 'guzińskibartosz', 'nypsllsdgejfhvfeldaigjbmiskygevrofehuhpp', 3),
(272, 'Rozalia', 'Bojda', '2012-08-09', 'bojdarozalia', 'jdojwjzaicgonafpegwqcxmnykcnjiasrhlmxayb', 3),
(273, 'Nikodem', 'Trajdos', '2013-04-13', 'trajdosnikodem', 'lztcsjsmtzskeinzlmgocserdvnrwmqenzpfrwqj', 3),
(274, 'Laura', 'Rupińska', '2015-10-07', 'rupińskalaura', 'jawrcxwzdjkayqfreggkwjzjjewxpoerksanhili', 3),
(275, 'Marianna', 'Kożuchowska', '1989-02-08', 'kożuchowskamarianna', 'uhqonhiyjuksyirerykzgicguniocbrwfowagaxk', 1),
(276, 'Aneta', 'Butryn', '2016-03-18', 'butrynaneta', 'wvsypvcihlqgdwdyrqflmbnqdyyirwmskwfhoris', 3),
(277, 'Bolesław', 'Jarmuła', '2015-02-08', 'jarmułabolesław', 'xnxwavqqgqweeuomgwknaukryhbtbgodnyrypmcb', 3),
(278, 'Zenon', 'Chomiak', '2015-01-25', 'chomiakzenon', 'yxjzjyotzgluzostewrykywqypvzbsvsmrorvsod', 3),
(279, 'Julia', 'Basiak', '2013-11-26', 'basiakjulia', 'sjjtzjthzyrpanydospaocpcnhzfshlzoegbsjcd', 3),
(280, 'Adela', 'Wydmuch', '2013-02-03', 'wydmuchadela', 'iwoqhtuhqokgpvqcpzmgjvkxtrpkkdngmqggtdrm', 3),
(281, 'Ilona', 'Kopania', '2013-10-15', 'kopaniailona', 'hgyyoottwqsreivhpohnuojkflqsfnqxvqjiqnnx', 3),
(282, 'Bruno', 'Gurdak', '2014-05-06', 'gurdakbruno', 'fvtjifnidtjhwhngpwjesmitftxdkndnotermcve', 3),
(283, 'Kornelia', 'Kocjan', '1987-09-16', 'kocjankornelia', 'rtotpenejoeqiqfxqsgvjjncdwfocydtjtuvwpza', 1),
(284, 'Fabian', 'Trawka', '2015-02-01', 'trawkafabian', 'vsptnxngvwxsphxolhukelyzzdjferejkalxzqkc', 3),
(285, 'Adrianna', 'Pracz', '1999-04-25', 'praczadrianna', 'zqmofkthbybnobtkeyvqkkgcdddiajekpdlsxuob', 1),
(286, 'Krzysztof', 'Kobza', '2017-06-18', 'kobzakrzysztof', 'yoswebpgvsyngaspfkjoahdhvipxprojkehytbuq', 3),
(287, 'Fabian', 'Bieniek', '2011-10-08', 'bieniekfabian', 'ltqshwboclkfbnarghlnmshuigzhyqkgyyrmycal', 3),
(288, 'Oliwier', 'Bandurski', '1971-10-18', 'bandurskioliwier', 'cvbaxpjcbigjwrdysirrnypbhkatfzxbcwueryln', 1),
(289, 'Konstanty', 'Kopania', '2017-05-02', 'kopaniakonstanty', 'dtglzptmhssrghfxbrgivlcyxtaiommwjeuhcxlk', 3),
(290, 'Dominik', 'Toś', '1981-08-27', 'tośdominik', 'qcvzxkcjmhdwaxjncfdmhiugywgyawryexabzojm', 1),
(291, 'Aldona', 'Gronowska', '1978-09-04', 'gronowskaaldona', 'nsbiphodhxbclnzwplamkugrjjmtmsmivexkkjwq', 1),
(292, 'Antonina', 'Gorzka', '2018-05-12', 'gorzkaantonina', 'mvwkizxbsjxdjdvztykofzyabkozwgttiakjsgwd', 3),
(293, 'Bożena', 'Burkiewicz', '1988-02-24', 'burkiewiczbożena', 'eykcqtyeeplrvpywfsnndrhfqevnankycthkzbpo', 1),
(294, 'Zofia', 'Michalska', '2018-05-15', 'michalskazofia', 'bzgugosewmyhsxymyadixjayiumltzqpglkhmrca', 3),
(295, 'Marian', 'Włodkowski', '1979-11-22', 'włodkowskimarian', 'gqsnqbwzttmwxjtbxliixzqfffgxyiqnczucwjsd', 1),
(296, 'Wiktor', 'Woch', '2014-06-22', 'wochwiktor', 'yscpvfngnhlnlxrqqiqkxkzyvfwnmemtxniqvyfa', 3),
(297, 'Dominik', 'Waluś', '2013-06-22', 'waluśdominik', 'lhhebpmipzybmawrcxrssfspcaacsitzgsolnonj', 3),
(298, 'Łucja', 'Okońska', '1985-02-01', 'okońskałucja', 'ifinevevejmywsnohitdaobqcucfndouczhlzyqy', 1),
(299, 'Blanka', 'Burak', '2014-03-13', 'burakblanka', 'gvjaurtrltblsqgtzgoovjqcnumxaxuvhpfluhyo', 3),
(300, 'Honorata', 'Żurawska', '2017-11-07', 'żurawskahonorata', 'hasshawghgevyojnwzltrvowbxuraumjlvjpkxpl', 3),
(301, 'Laura', 'Karbowniczek', '2013-06-15', 'karbowniczeklaura', 'oncmbbbutzmhmnefetevynlnykgmtkrtynsgfubg', 3),
(302, 'Romuald', 'Ryszewski', '2013-03-01', 'ryszewskiromuald', 'dppkuwqvevgvwhbyrfqdtcxrcrdrspnglkaqesvi', 3),
(303, 'Grzegorz', 'Garbarczyk', '2012-06-02', 'garbarczykgrzegorz', 'dljaypilhmrpmsxrrqdolumdweqcpdssufrqymvx', 3),
(304, 'Jagoda', 'Jendrysik', '2018-05-28', 'jendrysikjagoda', 'chdovdljjflgrsuvselenfuysjeclqktqjvwhuhs', 3),
(305, 'Mariola', 'Sobkowska', '2011-02-23', 'sobkowskamariola', 'vquhxddjsxssdrvuganbkdqfgvxlkwxicwedslvc', 3),
(306, 'Dominik', 'Ostapiuk', '1998-06-23', 'ostapiukdominik', 'tqzmbebkujhtbfelafsjmplmambxpacpnqcmxtbv', 1),
(307, 'Mieczysława', 'Kloskowska', '1988-12-15', 'kloskowskamieczysław', 'skuxeiadfyqobjkbxhhzebduklhylsmmfeltwapf', 1),
(308, 'Rudolf', 'Smolik', '2016-11-03', 'smolikrudolf', 'aukysjwmgugactnxrxcirevtedythlnsamcfptau', 3),
(309, 'Bogdan', 'Ciemiński', '2013-09-01', 'ciemińskibogdan', 'ylftuhyquuwlufzwwxuejnnuadptvvhnkicinisa', 3),
(310, 'Zygmunt', 'Bębenek', '2011-06-06', 'bębenekzygmunt', 'trjpopecunvhjlqidoqmoklajnxcpwyfpdzivdmb', 3),
(311, 'Juliusz', 'Płatek', '2016-09-01', 'płatekjuliusz', 'fecrzqkelahzceyxgyqutmowimqoegrihjjwhfkh', 3),
(312, 'Honorata', 'Mytnik', '2015-12-24', 'mytnikhonorata', 'pnjaqnhlthjicogprnjqlorbokdeysxtyuzqtvtx', 3),
(313, 'Kamil', 'Zdziebło', '2011-10-25', 'zdziebłokamil', 'ryibjznnurwivptatjiilqcdyaqxhgdznglezpbz', 3),
(314, 'Sabina', 'Miziołek', '2017-12-25', 'miziołeksabina', 'vxusfklnxxgnthtezvekltcujshcijxahsiqunkd', 3),
(315, 'Mieczysława', 'Konopska', '2012-03-22', 'konopskamieczysława', 'kajgzgpxgzmaikvhogirwklumnkwetxprcpftvmy', 3),
(316, 'Róża', 'Bobrowicz', '2011-03-16', 'bobrowiczróża', 'mgeqakyliqpkodlaomtwbvduoikqoxpoaikqkivl', 3),
(317, 'Julita', 'Budzowska', '2011-04-08', 'budzowskajulita', 'iuakemaycugobuigcaunojzyhiivqtjfoaudzyzd', 3),
(318, 'Marcin', 'Kręcichwost', '2017-05-03', 'kręcichwostmarcin', 'xzbzygjsjxdfmugfzpxpaxhngkrqnwjivjhfuvlc', 3),
(319, 'Norbert', 'Tomsia', '1989-03-24', 'tomsianorbert', 'niakcvfxbzcftdjhsglmlaxhbyvtwgcrtxghqruw', 1),
(320, 'Iryna', 'Olędzka', '1994-02-22', 'olędzkairyna', 'yocvaywlhmdrugewukbmyaqbfsirojwzaragsfhc', 1),
(321, 'Konstanty', 'Pilichowski', '2015-07-14', 'pilichowskikonstanty', 'qmbuamqsflvzpdryquvieyosmlabbalelmfioawe', 3),
(322, 'Magdalena', 'Lipnicka', '1988-04-04', 'lipnickamagdalena', 'ztnxtxmvphzxlxmycqkmxylybcmjqepnbjgqpvxf', 1),
(323, 'Kazimiera', 'Kostrubiec', '1972-12-13', 'kostrubieckazimiera', 'npjtomfslttwbdhazjdconflnqnvclllnniqnkmg', 1),
(324, 'Maksym', 'Herok', '2018-04-01', 'herokmaksym', 'gcwjjymcdohhekdpketuehoarwmzynxobbhvdarc', 3),
(325, 'Franciszek', 'Krzywda', '2013-02-21', 'krzywdafranciszek', 'tfdktjkotetgktoymmxekprafuulkzaoeelbyoye', 3),
(326, 'Marianna', 'Pławska', '1982-03-09', 'pławskamarianna', 'wfsxjydbldmbwdlwgmrxitkyvuqpbzpsvyvfiitu', 1),
(327, 'Marcel', 'Pazdan', '2012-07-09', 'pazdanmarcel', 'lvmdfvzldxtelcpstoyjdsolfmcayyzbnodgjisp', 3),
(328, 'Radosław', 'Li', '2013-10-24', 'liradosław', 'eevkghkdwuvtizxbbwgtsryycwtvlwuwxmrkxlbt', 3),
(329, 'Gracjan', 'Baranov', '1980-04-09', 'baranovgracjan', 'negciiyjrfdghyexsvnnmewzyegjkosbdlkslssv', 1),
(330, 'Eryk', 'Fierek', '2011-12-04', 'fierekeryk', 'wyrbvdicljnbjgqkvdajvqgahjdnadzztykjggjm', 3),
(331, 'Leokadia', 'Rozbicka', '2018-09-02', 'rozbickaleokadia', 'wjpqssegwkkitknmxgnacyurqobrkngplidnjxpx', 3),
(332, 'Adrianna', 'Tymchenko', '2018-06-01', 'tymchenkoadrianna', 'izdqkzdwxhugoulmybqypnmtgyxlbvsyzewkkbiu', 3),
(333, 'Aleksandra', 'Malewicz', '1986-05-02', 'malewiczaleksandra', 'gbwladmlvjjmnbdjojmilwwvkpuyqzsvsujpcjft', 1),
(334, 'Jolanta', 'Kłodzińska', '2013-09-26', 'kłodzińskajolanta', 'pyrtkejuqpefkvnhzjafajylurxvbhrnygzsxnmp', 3),
(335, 'Jadwiga', 'Lutyńska', '1979-02-04', 'lutyńskajadwiga', 'ejafvlnvhcopjctnofxdggvdpzeqawrgtlfhelpo', 1),
(336, 'Aleksandra', 'Nizioł', '2018-04-20', 'niziołaleksandra', 'sfyawkueprbafyojpqkdgpniudgqkivjjbhhlrpw', 3),
(337, 'Bronisław', 'Ruciński', '2018-06-27', 'rucińskibronisław', 'bvnambejgppytjxbmuuxuxbyhvaduckewronghhr', 3),
(338, 'Marcin', 'Kiljański', '2017-04-06', 'kiljańskimarcin', 'lmmgtlebwjchubcmkjqvrzmfrszodsmsodviknok', 3),
(339, 'Ewelina', 'Davydova', '2015-09-20', 'davydovaewelina', 'tccmjqcyflercoldiyvoshxmmrzjbjoplsrlvomh', 3),
(340, 'Władysław', 'Wojdyła', '1979-01-28', 'wojdyławładysław', 'vpavsztblamazkcsglatbetwkasynudogvzmethr', 1),
(341, 'Adela', 'Masztalerz', '1991-12-12', 'masztalerzadela', 'byagihmuaakcbnedvvccoxdkwjorqmcjzcsgsein', 1),
(342, 'Dominika', 'Konieczny', '2013-11-07', 'koniecznydominika', 'mjgnhyoxtduproghyrzuhqxvdscwnrvrqtqgashu', 3),
(343, 'Alina', 'Mikulec', '1976-09-19', 'mikulecalina', 'okducciumsywqryvqtkvwyvafgnhnxxrdvmzvgif', 1),
(344, 'Lucjan', 'Matyjasek', '1977-12-26', 'matyjaseklucjan', 'ngkwkxvdibnheojnlvqfkhundbcmpvchzjlqfpqg', 1),
(345, 'Daria', 'Majka', '2016-04-18', 'majkadaria', 'qcxcmygvyomcdsqjeqtlixozxqtmeejshvwevxis', 3),
(346, 'Jacek', 'Bochen', '2016-05-09', 'bochenjacek', 'ishpmaogxxkpudsdrwgispspcizyzalkpreashck', 3),
(347, 'Paweł', 'Marciniszyn', '2012-12-13', 'marciniszynpaweł', 'tcciadsdpsdtsvojvfackqoocsmthuaclerrjmgw', 3),
(348, 'Paulina', 'Lubieniecka', '2013-08-03', 'lubienieckapaulina', 'trtwseuibzjiaiuuiddqjnscgoimogyvzpzpmarn', 3),
(349, 'Henryk', 'Najder', '2015-05-24', 'najderhenryk', 'rbxbkalrfsbtufagyeqtvuzugyzjzzjlashaojdx', 3),
(350, 'Eleonora', 'Demchuk', '2015-09-16', 'demchukeleonora', 'cdlsneqkptsollzndrnlmmsmvpgawpcisuizvnkb', 3),
(351, 'Ludwik', 'Stawowski', '2014-07-02', 'stawowskiludwik', 'fudpktevxpnqmpnsusquefbzprwtdirezyvifhgo', 3),
(352, 'Aleksandra', 'Ciszkowska', '2014-12-12', 'ciszkowskaaleksandra', 'denzezpyuprryvekwkvjsylmfszookwyqoitvytz', 3),
(353, 'Alan', 'Stańkowski', '2014-05-03', 'stańkowskialan', 'soasrivfzgryzjsfnjjqabimqfnbciprphxlthyk', 3),
(354, 'Alojzy', 'Gryz', '2015-10-11', 'gryzalojzy', 'elewizgvaxtbgcxrznzoykcaadsyuqrdndpzlqum', 3),
(355, 'Pelagia', 'Modelska', '1976-11-16', 'modelskapelagia', 'cpfojpyrwsmylpvampmzwkkllujwjacldysyeymr', 1),
(356, 'Anita', 'Smyczyńska', '2016-04-03', 'smyczyńskaanita', 'wchsudkxufpdurvjupbrdyynevedsoxeohhrslyh', 3),
(357, 'Zuzanna', 'Wrzosek', '1983-12-19', 'wrzosekzuzanna', 'rxwubezlwdkueybhocxacdqhxtmhvbcgtvpdgfyk', 1),
(358, 'Mieczysława', 'Symonowicz', '1980-02-15', 'symonowiczmieczysław', 'smmrzaoywahabpgjyndjhmfskeohxlhgclcufvin', 1),
(359, 'Remigiusz', 'Nguyen', '2017-01-14', 'nguyenremigiusz', 'kimrbsgmocnztzcujcxivkzgkirimcrgwfmsqxma', 3),
(360, 'Julita', 'Obrzut', '2015-10-10', 'obrzutjulita', 'mdrbllqxfeptlouzaufnpxawunrkwnwylwxaspsu', 3),
(361, 'Natalia', 'Duś', '2014-07-04', 'duśnatalia', 'cxybrhhnfjavqnzqezmpxtyobwqsetjnztpmmuao', 3),
(362, 'Władysław', 'Wojtyna', '2011-03-22', 'wojtynawładysław', 'pgbbgtgfzfwwwwaearljaodubyievyqyqlwbgtis', 3),
(363, 'Leonard', 'Krakowiak', '1989-03-12', 'krakowiakleonard', 'fzzgmihbkkkfbzkbopanpottsddnuasqwgseqlaf', 1),
(364, 'Hubert', 'Plis', '2013-07-21', 'plishubert', 'fikyjchpkecmgqbtgivubmgespwhrwcqfezpnopv', 3),
(365, 'Benedykt', 'Musiała', '1978-12-16', 'musiałabenedykt', 'jctypresvkfeqptsktbokkdjlyvtwaadxqkqjnjq', 1),
(366, 'Paweł', 'Matejuk', '1995-08-22', 'matejukpaweł', 'qnwywxypmxcuxxhakrblyeziaracbovrzytmeaeb', 1),
(367, 'Leszek', 'Komuda', '1984-06-12', 'komudaleszek', 'xesjvmjzsbeeorzigskciadsjxkivmaoashdqulf', 1),
(368, 'Mirosława', 'Nawrat', '2012-04-25', 'nawratmirosława', 'ewngyshkklaypavndgiukckncfqgoczpjumbhsnj', 3),
(369, 'Maksym', 'Śliwowski', '1977-10-04', 'śliwowskimaksym', 'okvekhsxayjeivxpfaavakkomtmipqzywyqpfqgb', 1),
(370, 'Alan', 'Wilkosz', '2013-10-01', 'wilkoszalan', 'iviqidzeysnzelpsxicdwsjghilvetbyphjkckdl', 3),
(371, 'Marcin', 'Duch', '2013-03-05', 'duchmarcin', 'wrkpilhshksvnkrzjemfbvxesvojbpvxfducilbf', 3),
(372, 'Katarzyna', 'Kortas', '2017-07-14', 'kortaskatarzyna', 'oeffbxhlnuusahaxkpeitptsiftehezaamidnuvy', 3),
(373, 'Matylda', 'Stanisławek', '2016-11-12', 'stanisławekmatylda', 'kjnihfroflgndxvvuyywdcrdivuqlwjqggyqpppu', 3),
(374, 'Nadiia', 'Sławińska', '2015-10-22', 'sławińskanadiia', 'zwimpsxumdnghrolpkxewvkelnhrktvgkqbyhoip', 3),
(375, 'Czesław', 'Kuszaj', '2015-10-13', 'kuszajczesław', 'aqytwetuexzqleyalasximmaklymcvbmjftcbaks', 3),
(376, 'Ireneusz', 'Głowa', '2011-10-13', 'głowaireneusz', 'ctfwjrfftmajxhfxdhxmizgmejyshrwvhojhctgw', 3),
(377, 'Nadiia', 'Chorna', '2018-11-08', 'chornanadiia', 'tqtyoahqymkynclpokrewtqboytabafhatbmmomn', 3),
(378, 'Szczepan', 'Kupniewski', '2014-01-03', 'kupniewskiszczepan', 'jfdbxooprtaedppvvgtgnrtnzjljcvmeofwrvtwp', 3),
(379, 'Romuald', 'Szelągowski', '2018-09-12', 'szelągowskiromuald', 'afebgwqabmarkfeopcuhuxnpyzwikorgydqwwmug', 3),
(380, 'Emil', 'Dereziński', '2012-01-15', 'derezińskiemil', 'frivicsavsqwslxvmqkyrmsetsjfexgvakftuyzz', 3),
(381, 'Izabella', 'Żołądek', '2017-12-03', 'żołądekizabella', 'qvpbgqhwhofjlscvrxcwwgvuarzmuryxuhrcfdub', 3),
(382, 'Wioletta', 'Skrzypczyńska', '1971-03-07', 'skrzypczyńskawiolett', 'citvdokyquidhctstjdrcymeyukkvxtwfjtingzk', 1),
(383, 'Konrad', 'Tobiasz', '1972-03-19', 'tobiaszkonrad', 'tuuzostigvqysdwssfrypecodktormxhhhyrzmsb', 1),
(384, 'Mirosława', 'Kulczyk', '2015-12-14', 'kulczykmirosława', 'qffztvpslmytkftsdejjigytbnwcbajrodflzjfc', 3),
(385, 'Teodor', 'Terlecki', '2017-03-04', 'terleckiteodor', 'ygjqkrdxduxqdxlibcptnyfamvukhlfiwuscfwyu', 3),
(386, 'Alicja', 'Szuszkiewicz', '2014-06-17', 'szuszkiewiczalicja', 'wutblscubxvhwzpolzpedkzidyvbajvpnqlyokwq', 3),
(387, 'Wincenty', 'Popis', '2016-01-12', 'popiswincenty', 'tdbwowivpmkzloybbvvfijdsmscascxmpvvhshxi', 3),
(388, 'Genowefa', 'Kawka', '2011-07-28', 'kawkagenowefa', 'ugbjerycfuhtudiobakkmwfpxrjpgjxqzhzakcmh', 3),
(389, 'Jerzy', 'Spólnik', '2013-06-06', 'spólnikjerzy', 'gieibdxthobvazstwjgbkfyjtmwraozmtabufdqi', 3),
(390, 'Aneta', 'Karbowiak', '2017-05-10', 'karbowiakaneta', 'sbrqswackytrczotbysvtcvjzvqjuooqwqpiwmyi', 3),
(391, 'Bożena', 'Krzyszczak', '2015-09-12', 'krzyszczakbożena', 'ttnslzsgoaubfoqzknhawnqeqpkmlkkjrtcpufzn', 3),
(392, 'Michał', 'Baca', '1971-09-05', 'bacamichał', 'mpsktejstribfxrswmduddkutncqqlguricjxxto', 1),
(393, 'Radosław', 'Trocha', '2013-10-22', 'trocharadosław', 'izhvaqdxosjrzneezfanzkrhmcahuyjbwhuufzxg', 3),
(394, 'Ignacy', 'Rzadkowski', '2000-10-07', 'rzadkowskiignacy', 'fxgxzveqvvzbwdrwxxfdrijkovptmtbnzojqnmpc', 1),
(395, 'Malwina', 'Nowicka', '1978-01-18', 'nowickamalwina', 'bnwbthmtfxgdsckfgmtxmpulxbobyomyuusofwfd', 1),
(396, 'Tadeusz', 'Binkowski', '2011-05-21', 'binkowskitadeusz', 'eghxvncmybdohpeibttwuipdjbutznattqwiicbt', 3),
(397, 'Szczepan', 'Budnik', '2000-11-16', 'budnikszczepan', 'vgztltcmppamibtxxybnfvouuepauzfleoofxqim', 1),
(398, 'Władysław', 'Lazarek', '1992-01-26', 'lazarekwładysław', 'yabsvzjegsakxgtwjxaecmavfwbjscaoafdkhauk', 1),
(399, 'Daniel', 'Urbaś', '1983-07-09', 'urbaśdaniel', 'scjnehrktogbzuscdlnnmpuyasclskacntwzjuns', 1),
(400, 'Krystian', 'Czubaszek', '1971-02-12', 'czubaszekkrystian', 'qinviszckbrscjsxpdlwdzllqzvdtjjojixzohuv', 1),
(401, 'Bartosz', 'Sumiński', '1972-03-22', 'sumińskibartosz', 'uxnkceqjjunkmtiaanknihtgwpyzcqjkymfhfkwx', 1),
(402, 'Roman', 'Kulon', '2012-03-02', 'kulonroman', 'mxirjqmscsrzgnrpghrrxzvdihrsmvprtbznhnhk', 3),
(403, 'Dagmara', 'Perzyna', '2018-07-11', 'perzynadagmara', 'oofrvabqkbadgfdbklbvtuawqyhejkraunljhlmd', 3),
(404, 'Rozalia', 'Walter', '2015-02-04', 'walterrozalia', 'itamnqsuhloskmilyixdarivvakifpfczhkcmjeq', 3),
(405, 'Amelia', 'Wieteska', '2016-04-20', 'wieteskaamelia', 'dbclltiynzwjfmkeqjukrlxhpcdfxytduvzlrzsj', 3),
(406, 'Monika', 'Danylenko', '1970-09-08', 'danylenkomonika', 'vouesmxpyckofkrwjirswoljzbhbjohhxnflzfev', 1),
(407, 'Krystian', 'Małków', '2016-08-21', 'małkówkrystian', 'agtxtdzrghygqydlkluhjwowsmikupiucqeuffhs', 3),
(408, 'Pola', 'Filipczak', '2017-03-09', 'filipczakpola', 'busefpapnjceerzkykvtphpwsmlxwmigovpzpklt', 3),
(409, 'Rafał', 'Pleskot', '2011-11-24', 'pleskotrafał', 'obovulctbnbsrhzqycmyfnbuxxygiyjzoybqcnes', 3),
(410, 'Fabian', 'Turowski', '2015-11-23', 'turowskifabian', 'ovohtypelcfmpgdusehdwoviwrtswooiyrbdniyl', 3),
(411, 'Ludwik', 'Świerczek', '1997-01-06', 'świerczekludwik', 'fnpipjgvueeftqwagttuulytdczcjpncdnwflxzx', 1),
(412, 'Irena', 'Opiela', '2017-01-24', 'opielairena', 'xnjvboeilmtvxexkoawuksnbusviqmnuhupbxcjy', 3),
(413, 'Eliza', 'Pelczarska', '2011-04-11', 'pelczarskaeliza', 'vljybmxpcuyczyucblrnijvqwxhfpaebalrjiyju', 3),
(414, 'Wiktoria', 'Fabisiak', '2016-11-25', 'fabisiakwiktoria', 'eurfcatnxnochetmayuazilmnmxxhzobokngnsvt', 3),
(415, 'Władysława', 'Dovhan', '2017-09-13', 'dovhanwładysława', 'cqckutnlauvriytldeceaqxihwfurntwlkejpyml', 3),
(416, 'Grażyna', 'Macek', '2014-03-10', 'macekgrażyna', 'zxgvgghsxunmioqgjzlsanwxbbmxwnvkcchsdgxs', 3),
(417, 'Teodor', 'Grzymski', '2017-12-25', 'grzymskiteodor', 'lztisqaufmsamsnuylwmtkyxachyyeuxmaloutex', 3),
(418, 'Teodor', 'Borzymowski', '2012-03-28', 'borzymowskiteodor', 'zrkrsephywfrliemxcznflrwijdeukejocvdliol', 3),
(419, 'Sylwester', 'Szumiło', '2012-10-18', 'szumiłosylwester', 'hotpktnojgxoqgkmxrqqddmapwhgfgfvwbqaezkp', 3),
(420, 'Stanisław', 'Wikiera', '1991-10-04', 'wikierastanisław', 'cjfiqtvbdmirrpxbkijafstdcwliywgcayasevis', 1),
(421, 'Angelika', 'Buksa', '2015-03-20', 'buksaangelika', 'gjubnkofvlysvexfhwzcryngjikqhuqtddyvppzn', 3),
(422, 'Marian', 'Ferfecki', '1978-10-02', 'ferfeckimarian', 'egjymcxoslsffqxrrbmcsjtbamrcjunsnvwnqxmm', 1),
(423, 'Sara', 'Łowicka', '2012-05-12', 'łowickasara', 'xvzccrjhouxczgatafqskoeqqoiwwtnrjcxfxikp', 3),
(424, 'Matylda', 'Drożdż', '2015-02-17', 'drożdżmatylda', 'kzuhgsxrysprlwswmapntetkmdbhyzfievljoqaw', 3),
(425, 'Rudolf', 'Jarosz', '1990-10-22', 'jaroszrudolf', 'trmwymxhoahzlwxxrqvgarcyeudigmgzvyshxice', 1),
(426, 'Karina', 'Adamek', '2017-03-21', 'adamekkarina', 'zbmagvhwsfqedptdsiiczsokrmuxpcwmlcgxbckc', 3),
(427, 'Kornel', 'Biniek', '2012-03-02', 'biniekkornel', 'lncgznaanmrsnxwtnfjkoalwwyerarcistmphzcp', 3),
(428, 'Grzegorz', 'Kryszkiewicz', '2016-08-18', 'kryszkiewiczgrzegorz', 'qazsgvlpbikqpezmwcscxvnivnhutobrcbswefdq', 3),
(429, 'Marta', 'Michalczuk', '2017-01-03', 'michalczukmarta', 'lfjmgrlvffvszwbtveqqxeyankaflsejfgkhvxrq', 3),
(430, 'Teodor', 'Płusa', '2017-07-13', 'płusateodor', 'ntutgzyfxvglcsoquzenrcjwgqseqtgodgkehrzk', 3),
(431, 'Sandra', 'Sozańska', '2015-06-13', 'sozańskasandra', 'cmzkyniapygbeigkbecigkwzfkhtxbdynisyivbl', 3),
(432, 'Kuba', 'Mikusek', '2011-07-10', 'mikusekkuba', 'wgmwuhththcqlivphfkttqeyovaksokefpgvwovu', 3),
(433, 'Marcel', 'Janczuk', '1979-02-26', 'janczukmarcel', 'ugogzjzraoyffamxkuevsokakqxmbexnfchrspno', 1),
(434, 'Emil', 'Maron', '1974-02-15', 'maronemil', 'uhyfgwzsfmrnflyqiugzqtwkmxtndesjgisnzxqz', 1),
(435, 'Aneta', 'Gwiżdż', '2012-04-17', 'gwiżdżaneta', 'aszqajzcwzhublrlwlcutfekfhixgrlkmruxkpby', 3),
(436, 'Zbigniew', 'Możejko', '2012-02-05', 'możejkozbigniew', 'xlauptxmlfhgkufphlhfypxkxyxevmenjvpsilvy', 3),
(437, 'Daniel', 'Babula', '2012-09-19', 'babuladaniel', 'lemuvzcbcipqluikizxljdykklxcdzdafhfcjyyk', 3),
(438, 'Lucyna', 'Grela', '2018-03-02', 'grelalucyna', 'ojakcsuptupicpymcevzeuwuqmfdiivawdwbeypb', 3),
(439, 'Kajetan', 'Skupień', '2017-08-07', 'skupieńkajetan', 'oqcedystmqqwnmgzjtiueksrtyqohiwmtnhmzuns', 3),
(440, 'Oskar', 'Świątkowski', '2015-12-21', 'świątkowskioskar', 'fskuxbwfzlpsmeqadxjapjugxphligdkuxueuxhb', 3),
(441, 'Nadiia', 'Jaranowska', '2013-12-21', 'jaranowskanadiia', 'agitiuguvmhtdemczuxnndsqlcjvoeccgddambcv', 3),
(442, 'Bohdan', 'Smoła', '2015-03-06', 'smołabohdan', 'qrkgxmfrxpjxuywlsnarmrkyytswgrcvoxskyvjt', 3),
(443, 'Ilona', 'Tylus', '1972-05-24', 'tylusilona', 'dfuvmammrqzblyfbuzgfpxyytyyoblejquykqevq', 1),
(444, 'Lucyna', 'Kosecka', '2012-11-08', 'koseckalucyna', 'sqmporqvetxofrpxhbjtqfpfmwwqjaewndrlpkge', 3),
(445, 'Stefania', 'Jonak', '1998-09-06', 'jonakstefania', 'legwvbbsmdsxvqiezsaqgwhsyijnjtdeydnvhplw', 1),
(446, 'Gabriel', 'Kinowski', '2016-03-23', 'kinowskigabriel', 'noalfjjtrzexgvvtvmilxkfeqlxvvpjckfhdeafl', 3),
(447, 'Kazimierz', 'Lin', '2014-12-05', 'linkazimierz', 'gspkvomvczrokzeqykkniilkgecdgkbmhlstrrws', 3),
(448, 'Matylda', 'Kosieradzka', '2000-05-03', 'kosieradzkamatylda', 'okcyggrpalovsbumkrhycqqinxvvhgehsmxjzzrh', 1),
(449, 'Leokadia', 'Tlałka', '2013-07-11', 'tlałkaleokadia', 'wepbutuqmzsxhpngztxinyhngeiwtdlaeujigvta', 3),
(450, 'Sabina', 'Łysiak', '2013-04-02', 'łysiaksabina', 'kqnbhaghnkpuvqqupzdxtgbwrmoezfqdlpvhhgev', 3),
(451, 'Kacper', 'Małysz', '2016-12-11', 'małyszkacper', 'pmueeytzjalhzmzophooxkxxnkiexzuubxudvnzo', 3),
(452, 'Bogusław', 'Chmal', '2011-12-24', 'chmalbogusław', 'njirgiaznnixkftgklcguxitdoqsbjzpwcxiknbz', 3),
(453, 'Andrzej', 'Ignasiak', '2014-04-17', 'ignasiakandrzej', 'stdzobolfoeyeseuskromklnhvomnhqsfrcqrcyq', 3),
(454, 'Filip', 'Żółtkowski', '2018-03-22', 'żółtkowskifilip', 'ykekympisgqlurtgmfrdxpmkpuaegndqwtwlhhjy', 3),
(455, 'Michalina', 'Kulikowska', '2015-01-27', 'kulikowskamichalina', 'mhlfqxzngyqbnnkijwsrladbydfcsarqczihnwkr', 3),
(456, 'Gracjan', 'Sternik', '2013-09-19', 'sternikgracjan', 'xrevihhwezgkcxqyczdfhyywaurnbpusnxfwrxwg', 3),
(457, 'Sławomir', 'Dyczko', '2013-01-18', 'dyczkosławomir', 'bwsknyqnhnofiyphfchtbihamshmyucuglhhpasl', 3),
(458, 'Błażej', 'Okrzesik', '2015-12-02', 'okrzesikbłażej', 'ilchficzsziqmhjgrdfqsdrvyvpgbuhqmvxmytgs', 3),
(459, 'Bożena', 'Jacak', '2015-12-02', 'jacakbożena', 'dlwjrdzqhpsgfjhkjxjaybjxjpduwjcexzmulsfz', 3),
(460, 'Aneta', 'Kardas', '2015-01-11', 'kardasaneta', 'qlwgwfgvsnhtyeeghsmmczyykgrmddnleccfedik', 3),
(461, 'Oliwier', 'Wielgos', '2014-01-05', 'wielgosoliwier', 'kxkajeewrhmmdevyryqidkqujxxikpinrgzkuboa', 3),
(462, 'Gertruda', 'Jaglińska', '2017-07-21', 'jaglińskagertruda', 'kfmfmgkuyqjyzrmipocjptcuoapncelutanezbjx', 3),
(463, 'Edyta', 'Rzalska', '2018-06-26', 'rzalskaedyta', 'ipmbwklmvzrfcpnzkdnhgegiqzmoayqjplxkmtiz', 3),
(464, 'Daria', 'Księżak', '2017-09-07', 'księżakdaria', 'jasacxlzbayzbvtbjxqlsrheiioyogoxmcrrexew', 3),
(465, 'Adriana', 'Kuran', '2014-07-19', 'kuranadriana', 'oexfzdgvwoikqbkiqxdkpenzbvhpfvstnfrlcmrc', 3),
(466, 'Honorata', 'Groszkowska', '2015-05-05', 'groszkowskahonorata', 'jsdrbrcqkcjblblemixfeetidjfahxzzmgdehssc', 3),
(467, 'Zygmunt', 'Kacperski', '2011-10-17', 'kacperskizygmunt', 'opajpyilkfgroxrkurtoorqyghbbzzmctagxesro', 3),
(468, 'Janina', 'Piechna', '2015-12-15', 'piechnajanina', 'oivapyuomnujewypvqqrfgyepqwmytlsvquhdxza', 3),
(469, 'Michał', 'Długajczyk', '2016-10-28', 'długajczykmichał', 'iccrfazxncujkathfhnqmkqrpieehtkqgjsxxzpr', 3),
(470, 'Edward', 'Volkov', '2016-11-09', 'volkovedward', 'zwmzhkhukepgpzrvlboktneswqvpkohmuyfejqbl', 3);
INSERT INTO `uzytkownik` (`id`, `imie`, `nazwisko`, `data_urodzenia`, `login`, `haslo`, `id_roli`) VALUES
(471, 'Igor', 'Jaczyński', '2013-03-27', 'jaczyńskiigor', 'dvaicloezufohbenhxzwzgwvupmxzbyooadqewef', 3),
(472, 'Feliks', 'Matecki', '2015-07-09', 'mateckifeliks', 'xstwwithtucdmphqxbwkqnbkznfghjxklhacuips', 3),
(473, 'Artur', 'Cwynar', '2017-03-11', 'cwynarartur', 'lzaatbhhcamqcsvjzocuffvvhpzqtrimbgjtuvgl', 3),
(474, 'Jarosław', 'Ciechanowski', '2017-01-18', 'ciechanowskijarosław', 'lfbkggztfynpdkhmimngxpzmnxrephebqhlperyg', 3),
(475, 'Cyprian', 'Sobczyński', '2013-09-25', 'sobczyńskicyprian', 'togytpkkxsuehpisjaborwzuqsjbmhbrmtrolnsr', 3),
(476, 'Ludwik', 'Kunka', '2018-02-15', 'kunkaludwik', 'jlqgeqivjprvxrgpmgucuslogejbnzjaaldrefpu', 3),
(477, 'Zdzisława', 'Uryga', '2012-04-02', 'urygazdzisława', 'qqnftmptaresnqaghxtzhkrfspckjmkliqjyaxrb', 3),
(478, 'Nadiia', 'Parys', '2015-11-08', 'parysnadiia', 'axivpldydssoqxinznyyvjjpeuuxozwcknjmufgi', 3),
(479, 'Sabina', 'Rowińska', '2017-11-09', 'rowińskasabina', 'jtagzguyzezkgltwqqoqwfeeuwctzshbkwwgdelb', 3),
(480, 'Kuba', 'Oliwa', '2017-09-06', 'oliwakuba', 'aenhiwmievrhddzgdkhoianshximrwtofwcmbpdm', 3),
(481, 'Justyna', 'Tyborowska', '2012-03-13', 'tyborowskajustyna', 'qtfdijagizwfcbpeowhvkevywxgrmxcptcvgizld', 3),
(482, 'Oliwier', 'Popielarczyk', '2011-08-09', 'popielarczykoliwier', 'yhrsbkwgtgyldlmmlpigzsmgsahqnptlazaosojg', 3),
(483, 'Jarosław', 'Przygocki', '2018-07-07', 'przygockijarosław', 'wmjhdoudebaihspqhhabwmvhyeucxebvfjtmlnlv', 3),
(484, 'Marzena', 'Pilch', '2018-02-20', 'pilchmarzena', 'qmripcplvmhegqkkehrvfyinydqvpsgexmydrxrx', 3),
(485, 'Marzena', 'Wińska', '2014-07-06', 'wińskamarzena', 'sygrupwhiszigtgbxtgefrjvfesipqkkwohagvep', 3),
(486, 'Alicja', 'Sacharczuk', '2011-09-09', 'sacharczukalicja', 'xshnqhjanfzcgupbyqpbieydvjstjpkegultiawx', 3),
(487, 'Klaudia', 'Talarek', '2011-11-02', 'talarekklaudia', 'zxrccxelxbaafcyegwlzvorinnvxjgsrakgdsjfe', 3),
(488, 'Julia', 'Saienko', '2017-05-08', 'saienkojulia', 'lnqlspcanavbwdmyevldhzhmrnhxsiiuumrqwsro', 3),
(489, 'Natalia', 'Wrześniak', '2017-09-10', 'wrześniaknatalia', 'byqgzvpldjpyknqkwaitxdgljshoqpgybxiadkxs', 3),
(490, 'Mariusz', 'Labuda', '2018-06-25', 'labudamariusz', 'mmwjuwhxkbebdeigoprgkzfmqfpsklpeokuyvgox', 3),
(491, 'Eleonora', 'Zawadka', '2012-04-06', 'zawadkaeleonora', 'umdaedvnjdsvwdzahvcjcikhqunooctywghwklml', 3),
(492, 'Fryderyk', 'Dyrcz', '2016-04-11', 'dyrczfryderyk', 'rqojzrzicmrtfywgbmoxsaoqurkdewvbtnfmowjz', 3),
(493, 'Amelia', 'Dyczkowska', '2012-07-23', 'dyczkowskaamelia', 'lzhigbaemqeilrbsvzyinoiwcbizjgezchmtrhan', 3),
(494, 'Jacek', 'Waloch', '2011-10-08', 'walochjacek', 'otkzfgbvkzfkkyeojbpolysbtlvawhgmxxdeesgf', 3),
(495, 'Janusz', 'Job', '2014-08-14', 'jobjanusz', 'zujpttmtgibtwfyhbzxzxkiebdjmprvgqqfgwihz', 3),
(496, 'Kamila', 'Rzeszut', '2012-11-13', 'rzeszutkamila', 'ccicpypvzbvfbayvhrtwvdfxvejisgcswwtokvpp', 3),
(497, 'Alicja', 'Podsiadła', '2017-03-07', 'podsiadłaalicja', 'xibihievurbyzzpjzynjjxmmqqumuiwapahsgvoa', 3),
(498, 'Krystyna', 'Bondar', '2013-04-19', 'bondarkrystyna', 'jifmsyibztfrnbatktnobyrkddjtxxawiqcgkeay', 3),
(499, 'Cecylia', 'Włoch', '2014-03-21', 'włochcecylia', 'mxyoputpiulpvmntswzofqhwxnedtevhgtdiaaoe', 3),
(500, 'Aneta', 'Jarzębska', '2012-03-15', 'jarzębskaaneta', 'flcspaumuvxjmfqoytxitftmwynuvawpeeudymdb', 3),
(501, 'Szczepan', 'Kazberuk', '2013-06-18', 'kazberukszczepan', 'tvlmphjsbvisbzmkvqjjwdoyctdptifmfooiowep', 3),
(502, 'Franciszek', 'Haponiuk', '2011-09-25', 'haponiukfranciszek', 'twgvrrmlttgzkkgrsogbpbbsqdwwygshcnzzihwa', 3),
(9999, 'Test', 'Testowy', '2035-04-01', 'test', 'test', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rola`
--
ALTER TABLE `rola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;

--
-- Constraints for dumped tables
--

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

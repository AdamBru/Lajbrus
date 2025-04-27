# USUWANIE TABEL

DROP TABLE IF EXISTS `rel_wychowawca_klasa`;
DROP TABLE IF EXISTS `rel_uczen_klasa`;
DROP TABLE IF EXISTS `rel_nauczyciel_pracownia`;
DROP TABLE IF EXISTS `rel_opiekun_uczen`;
DROP TABLE IF EXISTS `plan`;
DROP TABLE IF EXISTS `uzytkownik`;
DROP TABLE IF EXISTS `rola`;
DROP TABLE IF EXISTS `klasa`;
DROP TABLE IF EXISTS `pracownia`;
DROP TABLE IF EXISTS `przedmiot`;
DROP TABLE IF EXISTS `godzina`;
DROP TABLE IF EXISTS `dzien`;

# TWORZENIE TABEL

CREATE TABLE `rola` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nazwa` VARCHAR( 20 )
);

CREATE TABLE `klasa` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nazwa` VARCHAR( 10 ),
    `rocznik` INT( 4 )
);

CREATE TABLE `pracownia` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `numer` INT
);

CREATE TABLE `przedmiot` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nazwa` VARCHAR( 20 )
);

CREATE TABLE `uzytkownik` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `imie` VARCHAR( 20 ),
    `nazwisko` VARCHAR( 30 ),
    `data_urodzenia` DATE,
    `login` VARCHAR( 20 ),
    `haslo` VARCHAR( 40 ),
    `id_roli` INT,
    CONSTRAINT `FK_rola` FOREIGN KEY ( `id_roli` ) REFERENCES `rola`( `id` )
);

CREATE TABLE `godzina` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `od` TIME,
    `do` TIME
);

CREATE TABLE `dzien` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nazwa` VARCHAR( 10 )
);

CREATE TABLE `plan` (
    `id_klasy` INT,
    `id_przedmiotu` INT,
    `id_nauczyciela` INT,
    `id_pracowni` INT,
    `id_dnia` INT,
    `id_godziny` INT,
    CONSTRAINT `FK_plan_klasa` FOREIGN KEY ( `id_klasy` ) REFERENCES `klasa`( `id` ),
    CONSTRAINT `FK_plan_przedmiot` FOREIGN KEY ( `id_przedmiotu` ) REFERENCES `przedmiot`( `id` ),
    CONSTRAINT `FK_plan_nauczyciel` FOREIGN KEY ( `id_nauczyciela` ) REFERENCES `uzytkownik`( `id` ),
    CONSTRAINT `FK_plan_pracownik` FOREIGN KEY ( `id_pracowni` ) REFERENCES `pracownia`( `id` ),
    CONSTRAINT `FK_plan_dzien` FOREIGN KEY ( `id_dnia` ) REFERENCES `dzien`( `id` ),
    CONSTRAINT `FK_plan_godzina` FOREIGN KEY ( `id_godziny` ) REFERENCES `godzina`( `id` )
);

CREATE TABLE `rel_uczen_klasa` (
    `id_ucznia` INT,
    `id_klasy` INT,
    CONSTRAINT `FK_uczen` FOREIGN KEY ( `id_ucznia` ) REFERENCES `uzytkownik`( `id` ),
    CONSTRAINT `FK_klasa` FOREIGN KEY ( `id_klasy` ) REFERENCES `klasa`( `id` )
);

CREATE TABLE `rel_wychowawca_klasa` (
    `id_wychowawcy` INT,
    `id_klasy` INT,
    CONSTRAINT `FK_wychowawca` FOREIGN KEY ( `id_wychowawcy` ) REFERENCES `uzytkownik`( `id` ),
    CONSTRAINT `FK_wych_klasy` FOREIGN KEY ( `id_klasy` ) REFERENCES `klasa`( `id` )
);

CREATE TABLE `rel_nauczyciel_pracownia` (
    `id_nauczyciela` INT,
    `id_pracowni` INT,
    CONSTRAINT `FK_nauczyciel_pracownia` FOREIGN KEY ( `id_nauczyciela` ) REFERENCES `uzytkownik`( `id` ),
    CONSTRAINT `FK_pracownia` FOREIGN KEY ( `id_pracowni` ) REFERENCES `pracownia`( `id` )
);

CREATE TABLE `rel_opiekun_uczen` (
    `id_opiekuna` INT,
    `id_ucznia` INT,
    CONSTRAINT `FK_opiekun` FOREIGN KEY ( `id_opiekuna` ) REFERENCES `uzytkownik`( `id` ),
    CONSTRAINT `FK_podopieczny` FOREIGN KEY ( `id_ucznia` ) REFERENCES `uzytkownik`( `id` )
);

CREATE TABLE `rel_nauczyciel_przedmiot` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_nauczyciela` INT,
    `id_przedmiotu` INT,
    CONSTRAINT `FK_nauczyciela` FOREIGN KEY ( `id_nauczyciela` ) REFERENCES `uzytkownik`( `id` ),
    CONSTRAINT `FK_przedmiotu` FOREIGN KEY ( `id_przedmiotu` ) REFERENCES `przedmiot`( `id` )
);

# UZUPEŁNIANIE TABEL

INSERT INTO `dzien`
    ( `nazwa` )
VALUES
    ( 'Poniedziałek' ),
    ( 'Wtorek' ),
    ( 'Środa' ),
    ( 'Czwartek' ),
    ( 'Piątek' );

INSERT INTO `godzina`
    ( `od`, `do` )
VALUES
    ( '08:00:00', '08:45:00' ),
    ( '08:55:00', '09:40:00' ),
    ( '09:50:00', '10:35:00' ),
    ( '10:55:00', '11:40:00' ),
    ( '11:45:00', '12:30:00' ),
    ( '12:35:00', '13:20:00' ),
    ( '13:25:00', '14:10:00' ),
    ( '14:15:00', '15:00:00' );

INSERT INTO `rola` VALUES
( NULL, 'Nauczyciel' ),
( NULL, 'Opiekun' ),
( NULL, 'Uczen' );

INSERT INTO `klasa` VALUES
( NULL, '1A', 2025 ),
( NULL, '1B', 2025 ),
( NULL, '1C', 2025 ),
( NULL, '2A', 2025 ),
( NULL, '2B', 2025 ),
( NULL, '2C', 2025 ),
( NULL, '3A', 2025 ),
( NULL, '3B', 2025 ),
( NULL, '3C', 2025 ),
( NULL, '4A', 2025 ),
( NULL, '4B', 2025 ),
( NULL, '4C', 2025 ),
( NULL, '5A', 2025 ),
( NULL, '5B', 2025 ),
( NULL, '5C', 2025 ),
( NULL, '6A', 2025 ),
( NULL, '6B', 2025 ),
( NULL, '6C', 2025 ),
( NULL, '7A', 2025 ),
( NULL, '7B', 2025 ),
( NULL, '7C', 2025 ),
( NULL, '8A', 2025 ),
( NULL, '8B', 2025 ),
( NULL, '8C', 2025 );

INSERT INTO `pracownia` VALUES
( NULL, 1 ),
( NULL, 2 ),
( NULL, 3 ),
( NULL, 4 ),
( NULL, 5 ),
( NULL, 6 ),
( NULL, 101 ),
( NULL, 102 ),
( NULL, 103 ),
( NULL, 104 ),
( NULL, 105 ),
( NULL, 106 ),
( NULL, 201 ),
( NULL, 202 ),
( NULL, 203 ),
( NULL, 204 ),
( NULL, 205 ),
( NULL, 206 ),
( NULL, 301 ),
( NULL, 302 ),
( NULL, 303 ),
( NULL, 304 ),
( NULL, 305 ),
( NULL, 306 ),
( NULL, 401 ),
( NULL, 402 ),
( NULL, 403 ),
( NULL, 404 ),
( NULL, 405 ),
( NULL, 406 ),
( NULL, 601 ),
( NULL, 602 ),
( NULL, 603 ),
( NULL, 604 ),
( NULL, 605 ),
( NULL, 606 );

INSERT INTO `przedmiot`
    ( `nazwa` )
VALUES
    ( 'Język Polski' ),
    ( 'Język Angielski' ),
    ( 'Język Niemiecki' ),
    ( 'Matematyka' ),
    ( 'Chemia' ),
    ( 'Biologia' ),
    ( 'Geografia' ),
    ( 'Fizyka' ),
    ( 'Wychowanie fizyczne' ),
    ( 'Religia' ),
    ( 'Wiedza o kulturze' ),
    ( 'Wiedza o społeczeństwie' ),
    ( 'Historia' ),
    ( 'Plastyka' ),
    ( 'Technika' ),
    ( 'Informatyka' );

INSERT INTO `uzytkownik` VALUES
( NULL, 'Adam', 'Nowak', '1980-01-02', 'adanow', '1234qwerasdfzxc', 1 );
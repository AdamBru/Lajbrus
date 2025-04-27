-- 1. Wyświetl ilość wszystkich użytkowników w bazie danych "szkola". 
SELECT COUNT(*) AS `liczba_uzytkownikow` FROM `uzytkownik`;

-- 2. Wyświetl tylko imiona i nazwiska użytkowników którzy posiadają rolę o nazwie "Nauczyciel". 
SELECT u.`imie`, u.`nazwisko` FROM `uzytkownik` u JOIN `rola` r ON u.`id_roli` = r.`id` WHERE r.`nazwa` = "Nauczyciel";

-- 3. Wyświetl nazwy ról oraz ilość użytkowników posiadających te role. 
SELECT r.`nazwa`, COUNT(*) AS `liczba_uzytkownikow` FROM `uzytkownik` u JOIN `rola` r ON u.`id_roli` = r.`id` GROUP BY r.`nazwa`;

-- 4. Wyświetl imiona i nazwiska opiekunów oraz imiona i nazwiska ich podopiecznych (uczniów) dla wszystkich opiekunów. 
SELECT opiekun.`imie` AS `imie_opiekuna`, opiekun.`nazwisko` AS `nazwisko_opiekuna`, 
       uczen.`imie` AS `imie_ucznia`, uczen.`nazwisko` AS `nazwisko_ucznia` 
FROM `uzytkownik` opiekun 
JOIN `rel_opiekun_uczen` rel ON opiekun.`id` = rel.`id_opiekuna`
JOIN `uzytkownik` uczen ON rel.`id_ucznia` = uczen.`id`;

-- 5. Wyświetl imiona i nazwiska wszystkich opiekunów oraz ilości ich podopiecznych dla każdego opiekuna. 
SELECT opiekun.`imie` AS `imie_opiekuna`, 
       opiekun.`nazwisko` AS `nazwisko_opiekuna`,
       COUNT(rel.`id_ucznia`) AS `liczba_uczniow` 
FROM `uzytkownik` opiekun 
JOIN `rel_opiekun_uczen` rel ON opiekun.`id` = rel.`id_opiekuna`
GROUP BY opiekun.`id`;

-- 6. Wyświetl imiona i nazwiska nauczycieli oraz numer pracowni do której jest przypisany, zapytanie wykonać dla wszystkich nauczycieli. 
SELECT nauczyciel.`imie` AS `imie_nauczyciela`, 
       nauczyciel.`nazwisko` AS `nazwisko_nauczyciela`,
       pracownia.`numer` 
FROM `uzytkownik` nauczyciel 
JOIN `rel_nauczyciel_pracownia` rel ON nauczyciel.`id` = rel.`id_nauczyciela` 
JOIN `pracownia` pracownia ON rel.`id_pracowni` = pracownia.`id`; 

-- 7. Wyświetl imiona i nazwiska wychowawcy oraz nazwę klasy do niego przypisanej, dla każdego wychowawcy. 
SELECT wychowawca.`imie` AS `imie_wychowawcy`, 
       wychowawca.`nazwisko` AS `nazwisko_wychowawy`,
       klasa.`nazwa` 
FROM `uzytkownik` wychowawca 
JOIN `rel_wychowawca_klasa` rel ON wychowawca.`id` = rel.`id_wychowawcy` 
JOIN `klasa` klasa ON rel.`id_klasy` = klasa.`id`;

-- 8. Wyświetl nazwę klasy oraz numer pracowni przypisaną do jej wychowawcy.
SELECT klasa.`nazwa` AS `nazwa_klasy`, 
       pracownia.`numer` AS `numer_pracowni`
FROM `klasa` klasa 
JOIN `rel_wychowawca_klasa` rel_klasa ON klasa.`id` = rel_klasa.`id_klasy`
JOIN `uzytkownik` wychowawca ON rel_klasa.`id_wychowawcy` = wychowawca.`id`
JOIN `rel_nauczyciel_pracownia` rel_pracownia ON wychowawca.`id` = rel_pracownia.`id_nauczyciela`
JOIN `pracownia` pracownia ON rel_pracownia.`id_pracowni` = pracownia.`id`;

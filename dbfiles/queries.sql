-- Wyświetla ID, imię i nazwisko każdego nauczyciela oraz numer przypisanej mu pracowni, jeśli istnieje, jeśli nie ma przypisanej pracowni to NULL.
SELECT u.id, u.imie, u.nazwisko, p.numer AS numer_pracowni
FROM uzytkownik u
LEFT JOIN rel_nauczyciel_pracownia r ON u.id = r.id_nauczyciela
LEFT JOIN pracownia p ON r.id_pracowni = p.id
WHERE u.id_roli = 1;

-- Wyświetl nazwę klasy oraz imię i nazwisko każdego przypisanego do niej ucznia.
SELECT k.nazwa AS klasa, u.imie, u.nazwisko
FROM klasa k
JOIN rel_uczen_klasa ruk ON k.id = ruk.id_klasy
JOIN uzytkownik u ON ruk.id_ucznia = u.id
ORDER BY k.nazwa, u.nazwisko, u.imie;

-- Wyświetl nazwę klasy dla użytkownika o id = 1.
SELECT k.nazwa
FROM klasa k
JOIN rel_uczen_klasa r ON k.id = rel.id_klasy
WHERE ruk.id_ucznia = 1;

-- Wyświetl uczniów, którzy są przypisani do więcej niż 1 klasy.
SELECT u.id, u.imie, u.nazwisko, GROUP_CONCAT(k.nazwa SEPARATOR ', ') AS nazwy_klas 
FROM uzytkownik u 
JOIN rel_uczen_klasa ruk ON u.id = ruk.id_ucznia 
JOIN klasa k ON ruk.id_klasy = k.id 
WHERE u.id_roli = 3 
GROUP BY u.id, u.imie, u.nazwisko 
HAVING COUNT(ruk.id_klasy) > 1;

-- Wyświetl nazwę klasy i liczbę jej uczniów.
SELECT 
    k.nazwa,
    COUNT(ruk.id_ucznia) AS liczba_uczniow
FROM 
    klasa k
LEFT JOIN 
    rel_uczen_klasa ruk ON k.id = ruk.id_klasy
GROUP BY 
    k.nazwa  
ORDER BY `k`.`nazwa` ASC
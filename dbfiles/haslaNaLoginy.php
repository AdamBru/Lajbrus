<?php

// --- Konfiguracja połączenia z bazą danych ---
$dbHost = 'localhost';    // Zazwyczaj 'localhost' dla XAMPP
$dbUser = 'root';         // Domyślny użytkownik XAMPP (zmień w razie potrzeby)
$dbPass = '';             // Domyślne puste hasło XAMPP (zmień w razie potrzeby)
$dbName = 'lajbrus';      // Nazwa Twojej bazy danych

// --- Komunikat ostrzegawczy ---
echo "<h2 style='color: red;'>OSTRZEŻENIE!</h2>";
echo "<p>Ten skrypt trwale nadpisze hasła WSZYSTKICH użytkowników w tabeli 'uzytkownik'.</p>";
echo "<p>Nowe hasło będzie hashem SHA1 z hasha MD5 loginu użytkownika (sha1(md5(login))).</p>";
echo "<p style='font-weight: bold; color: orange;'>Metoda haszowania sha1(md5()) jest przestarzała i NIEBEZPIECZNA. Rozważ użycie password_hash() dla nowych systemów.</p>";
echo "<p><strong>Zdecydowanie zaleca się wykonanie kopii zapasowej bazy danych PRZED kontynuacją.</strong></p>";
echo "<hr>";

// --- Połączenie z bazą danych ---
$conn = new mysqli($dbHost, $dbUser, $dbPass, $dbName);

// Sprawdzenie połączenia
if ($conn->connect_error) {
	die("Błąd połączenia z bazą danych: " . $conn->connect_error);
}
echo "Połączono z bazą danych '$dbName' pomyślnie.<br>";

// Ustawienie kodowania (ważne dla polskich znaków w loginach, jeśli występują)
if (!$conn->set_charset("utf8mb4")) {
	printf("Błąd podczas ładowania zestawu znaków utf8mb4: %s\n<br>", $conn->error);
	// Można spróbować 'utf8', jeśli 'utf8mb4' nie działa
	if (!$conn->set_charset("utf8")) {
		 printf("Błąd podczas ładowania zestawu znaków utf8: %s\n<br>", $conn->error);
	}
}

// --- Pobranie użytkowników ---
$sqlSelect = "SELECT id, login FROM uzytkownik";
$result = $conn->query($sqlSelect);

if ($result === false) {
	die("Błąd podczas wykonywania zapytania SELECT: " . $conn->error);
}

if ($result->num_rows > 0) {
	echo "Znaleziono " . $result->num_rows . " użytkowników. Rozpoczynanie aktualizacji haseł...<br><br>";

	// Przygotowanie zapytania UPDATE (Prepared Statement dla bezpieczeństwa)
	$sqlUpdate = "UPDATE uzytkownik SET haslo = ? WHERE id = ?";
	$stmt = $conn->prepare($sqlUpdate);

	if ($stmt === false) {
		die("Błąd podczas przygotowywania zapytania UPDATE: " . $conn->error);
	}

	// Zmienne do bindowania
	$newHash = null;
	$userId = null;

	// Bindowanie parametrów
	$stmt->bind_param("si", $newHash, $userId); // 's' - string (hash), 'i' - integer (id)

	$updatedCount = 0;
	$errorCount = 0;
	$skippedCount = 0;

	// --- Iteracja przez użytkowników i aktualizacja haseł ---
	while ($row = $result->fetch_assoc()) {
		$userId = $row['id'];
		$login = $row['login'];

		// Sprawdzenie, czy login nie jest pusty
		if (empty($login)) {
			echo "<span style='color: orange;'>Pominięto użytkownika ID: $userId - pusty login.</span><br>";
			$skippedCount++;
			continue; // Przejdź do następnego użytkownika
		}

		// Obliczenie nowego hasha
		$newHash = sha1(md5($login));

		// Wykonanie zapytania UPDATE
		if ($stmt->execute()) {
			echo "<span style='color: green;'>Zaktualizowano hasło dla użytkownika ID: $userId (login: '$login')</span><br>";
			$updatedCount++;
		} else {
			echo "<span style='color: red;'>Błąd podczas aktualizacji hasła dla użytkownika ID: $userId - " . $stmt->error . "</span><br>";
			$errorCount++;
		}
	}

	// Zamknięcie statement
	$stmt->close();

	echo "<br><hr><strong>Zakończono proces aktualizacji.</strong><br>";
	echo "Zaktualizowano pomyślnie: " . $updatedCount . " użytkowników.<br>";
	echo "Pominięto (pusty login): " . $skippedCount . " użytkowników.<br>";
	echo "Wystąpiło błędów: " . $errorCount . ".<br>";

} else {
	echo "Nie znaleziono żadnych użytkowników w tabeli 'uzytkownik'.<br>";
}

// --- Zamknięcie połączenia ---
$conn->close();
echo "Połączenie z bazą danych zostało zamknięte.<br>";

?>

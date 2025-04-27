<?php
session_start();

	// sprawdzenie czy przyszly pola z formlarza i nie są puste
	if (
		// !array_key_exists('id', $_SESSION) && // jeśli nie ma jeszcze sesji (działanie tylko dla niezalogowanych)
		array_key_exists('login', $_POST) && !empty($_POST['login']) &&
		array_key_exists('password', $_POST) && !empty($_POST['password'])
	) {
		// pobranie danych z bazy danych dla loginu
		$loginSql = "SELECT * FROM uzytkownik WHERE login = '".$_POST['login']."'";
		$loginResult = mysqli_query($conn, $loginSql);
		$loginRow = mysqli_fetch_assoc($loginResult);

		if( $loginRow['login'] == $_POST['login'] && $loginRow['haslo'] == sha1(md5($_POST['password'])) ) {
			$_SESSION['id'] = $loginRow['id'];
			$_SESSION['login'] = $loginRow['login'];
			$_SESSION['imie'] = $loginRow['imie'];
			$_SESSION['nazwisko'] = $loginRow['nazwisko'];
			$_SESSION['data'] = $loginRow['data_urodzenia'];

			$rolaSql = "SELECT r.nazwa FROM uzytkownik u JOIN rola r ON u.id_roli = r.id WHERE u.id = " . $_SESSION['id'] . ";";
			$rolaResult = mysqli_query($conn, $rolaSql);
			$rolaRow = mysqli_fetch_assoc($rolaResult);
			$_SESSION['rola'] = $rolaRow['nazwa'];

			if ( $_SESSION['rola'] == 'Nauczyciel' ) {
				$przedmiotySql = "SELECT u.imie, u.nazwisko, p.nazwa AS przedmiot
					FROM uzytkownik u
					JOIN rel_nauczyciel_przedmiot r ON u.id = r.id_nauczyciela
					JOIN przedmiot p ON r.id_przedmiotu = p.id
					WHERE u.id = " . $_SESSION['id'] . ";";
				$przedmiotyResult = mysqli_query($conn, $przedmiotySql);
				$przedmiotyRows = mysqli_fetch_all($przedmiotyResult, MYSQLI_ASSOC);
				$_SESSION['przedmioty'] = [];
				foreach ($przedmiotyRows as $przedmiot) {
					$_SESSION['przedmioty'][] = $przedmiot['przedmiot'];
				} 
			}

			header('Location: ../app/dashboard.php?view=home');
			
		} else {
			echo "<p class='error'>Błędne dane logowania</p>";
			session_unset();
			session_destroy();
		}
	} 
?>
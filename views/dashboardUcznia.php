<div class="dashboard-container">
	<aside>
		<table>
			<tr> <th>Mój wychowawca:</th> </tr>
			<tr> <td> <?php 
				$wychowawcaSql = "SELECT u.nazwisko, u.imie
					FROM rel_uczen_klasa ruk
					JOIN rel_wychowawca_klasa rwk ON ruk.id_klasy = rwk.id_klasy
					JOIN uzytkownik u ON rwk.id_wychowawcy = u.id
					WHERE ruk.id_ucznia = " . $_SESSION['id'] . ";";
				$wychowawcaResult = mysqli_query($conn, $wychowawcaSql);
				$wychowawcaRow = mysqli_fetch_assoc($wychowawcaResult);
				if (!empty($wychowawcaRow)) {
					echo $wychowawcaRow['nazwisko']; echo " "; echo $wychowawcaRow['imie'];
				} else {
					echo "Brak wychowawcy";
				}
			?> </td>

			<tr> <th>Moja klasa:</th> </tr>
			<tr> <td> <?php 
				$klasaSql = "SELECT k.nazwa
					FROM rel_uczen_klasa r
					JOIN klasa k ON r.id_klasy = k.id
					WHERE r.id_ucznia = " . $_SESSION['id'] . ";";
				$klasaResult = mysqli_query($conn, $klasaSql);
				$klasaRow = mysqli_fetch_assoc($klasaResult);
				if (mysqli_num_rows($klasaResult) > 0) {
					echo $klasaRow['nazwa'];
					$_SESSION['klasa'] = $klasaRow['nazwa'];
				} else {
					echo "Nie przypisano klasy";
				}
			?> </td>

			<tr> <th>Sala mojego wychowawcy:</th> </tr>
			<tr> <td> <?php 
				$salaWychSql = "SELECT p.numer AS numer_pracowni
					FROM rel_uczen_klasa ruk
					JOIN rel_wychowawca_klasa rwk ON ruk.id_klasy = rwk.id_klasy
					JOIN rel_nauczyciel_pracownia rnp ON rwk.id_wychowawcy = rnp.id_nauczyciela
					JOIN pracownia p ON rnp.id_pracowni = p.id
					WHERE ruk.id_ucznia = " .  $_SESSION['id'] . ";";
				$salaWychResult = mysqli_query($conn, $salaWychSql);
				$salaWychRow = mysqli_fetch_assoc($salaWychResult);
				if (mysqli_num_rows($salaWychResult) > 0) {
					echo $salaWychRow['numer_pracowni'];
				} else {
					echo "Nie przypisano sali";
				}
			?> </td>

			<tr> <th>Szczęśliwy numerek:</th> </tr>
			<tr> <td> <?php
				$sql = "SELECT numer, data_losowania FROM szczesliwy_numerek ORDER BY data_losowania DESC LIMIT 1";
				$result = mysqli_query($conn, $sql);
				$today = date("Y-m-d");

				if ($row = mysqli_fetch_assoc($result)) {
					if (date("Y-m-d", strtotime($row['data_losowania'])) == $today) {
						$numer = $row['numer']; // użyj istniejącego
					} else { // jeśli nie ma losowanego, wylosuj nowy
						$numer = rand(1, 30);
						$insert = "INSERT INTO szczesliwy_numerek (numer, data_losowania) VALUES ($numer, NOW())";
						mysqli_query($conn, $insert);
					}
				} else {
					// jeśli pierwszy raz w ogóle
					$numer = rand(1, 30);
					$insert = "INSERT INTO szczesliwy_numerek (numer, data_losowania) VALUES ($numer, NOW())";
					mysqli_query($conn, $insert);
				}

				echo $numer;
			?> </td>
		</table>
	</aside>

	<div class="blocks-container">

		<a href="?view=lesson" class="block btn unavilable">
			<img src="../assets/images/whiteboard.svg" alt="Whiteboard">
			<p>Lekcje</p>
		</a>
		
		<a href="?view=attendance" class="block btn unavilable">
			<img src="../assets/images/list.svg" alt="List">
			<p>Frekwecja</p>
		</a>

		<a href="?view=grades" class="block btn unavilable">
			<img src="../assets/images/numbers.svg" alt="Numbers">
			<p>Oceny</p>
		</a>
		
		<a href="?view=timetable" class="block btn unavilable">
			<img src="../assets/images/table.svg" alt="Table">
			<p>Plan zajęć</p>
		</a>
		
		<a href="?view=messages" class="block btn unavilable">
			<img src="../assets/images/mail.svg" alt="Mail">
			<p>Wiadomości</p>
		</a>
		
		<a href="?view=personal" class="block btn">
			<img src="../assets/images/id-card.svg" alt="ID Card">
			<p>Moje dane</p>
		</a>

		<a href="?view=changePassword" class="block btn">
			<img src="../assets/images/password.svg" alt="">
			<p>Zmiana hasła</p>
		</a>

	</div>
</div>
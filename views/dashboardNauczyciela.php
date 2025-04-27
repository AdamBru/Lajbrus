<div class="dashboard-container">
	<aside>
		<table>
			<tr> <th>Mój przedmiot:</th> </tr>
			<tr> <td> <?php 
				if ($_SESSION['przedmioty'] != null) {
					echo htmlspecialchars(implode(', ', $_SESSION['przedmioty'])); 
				} else {
					echo 'Brak przypisanych przedmiotów';
				}		
			?> </td>

			<tr> <th>Moje klasy:</th> </tr>
			<tr> <td> <?php 
				$klasySql = "SELECT k.nazwa
					FROM rel_nauczyciel_klasy r
					JOIN klasa k ON r.id_klasy = k.id
					WHERE r.id_nauczyciela = " . $_SESSION['id'] . ";";
				$klasyResult = mysqli_query($conn, $klasySql);
				$klasaStr = "";
				if (mysqli_num_rows($klasyResult) > 0) {
					while ($klasaRow = mysqli_fetch_assoc($klasyResult)) {
						$klasaStr .= $klasaRow['nazwa'] . ", ";
					}
					echo trim($klasaStr, ", ");
				} else {
					echo "Brak przypisanych klas";
				}
			?> </td>

			<tr> <th>Moja klasa:</th> </tr>
			<tr> <td> <?php 
				$mojaKlasaSql = "SELECT k.nazwa
					FROM rel_wychowawca_klasa rwk
					JOIN klasa k ON rwk.id_klasy = k.id
					WHERE rwk.id_wychowawcy = " . $_SESSION['id'] . ";";
				$mojaKlasaResult = mysqli_query($conn, $mojaKlasaSql);
				$mojaKlasaRow = mysqli_fetch_assoc($mojaKlasaResult);
				if ($mojaKlasaRow > 0) {
					echo $mojaKlasaRow['nazwa'];
				} else {
					echo "Brak przypisanej klasy";
				}
			?> </td>

			<tr> <th>Moja sala:</th> </tr>
			<tr> <td> <?php 
				$pracowniaSql = "SELECT p.numer 
					FROM pracownia p 
					JOIN rel_nauczyciel_pracownia rel ON p.id = rel.id_pracowni 
					WHERE id_nauczyciela = " . $_SESSION['id'] . ";";
				$pracowniaResult = mysqli_query($conn, $pracowniaSql);
				$pracowniaRow = mysqli_fetch_assoc($pracowniaResult);
				if ($pracowniaRow > 0) {
					echo $pracowniaRow['numer'];
				} else {
					echo "Brak przypisanej sali";
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
		
		<a href="?view=students" class="block btn">
			<img src="../assets/images/people.svg" alt="People">
			<p>Uczniowie</p>
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
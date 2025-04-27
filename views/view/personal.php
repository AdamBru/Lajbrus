<div class="dashboard-container">
	
		<?php if($_SESSION['rola'] == "Nauczyciel") { ?>
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

		<?php } else if($_SESSION['rola'] == "Uczeń") { ?>
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
		<?php } ?>

	<div class="blocks-container">
				
		<?php if($_SESSION['rola'] == "Nauczyciel") { ?>
			<div class="personal">
				<table>
					<tr> <th>Imię</th> <td> <?php echo $_SESSION['imie']; ?> </td> </tr>
					<tr> <th>Nazwisko</th> <td> <?php echo $_SESSION['nazwisko']; ?> </td> </tr>
					<tr> <th>Rola</th> <td> <?php echo $_SESSION['rola']; ?> </td> </tr>
					<tr> <th>Nauczany przedmiot</th> <td> <?php echo htmlspecialchars(implode(', ', $_SESSION['przedmioty'])); ?> </td> </tr>
					<tr> <th>Data urodzenia</th> <td> <?php echo $_SESSION['data']; ?> </td> </tr>
					<tr> <th>Nazwa użytkownika</th> <td> <?php echo $_SESSION['login']; ?> </td> </tr>
				</table>
			</div>
		<?php } else if($_SESSION['rola'] == "Uczeń") { ?>
			<div class="personal">
				<table>
					<tr> <th>Imię</th> <td> <?php echo $_SESSION['imie']; ?> </td> </tr>
					<tr> <th>Nazwisko</th> <td> <?php echo $_SESSION['nazwisko']; ?> </td> </tr>
					<tr> <th>Rola</th> <td> <?php echo $_SESSION['rola']; ?> </td> </tr>
					<tr> <th>Klasa</th> <td> <?php echo $_SESSION['klasa']; ?> </td> </tr>
					<tr> <th>Data urodzenia</th> <td> <?php echo $_SESSION['data']; ?> </td> </tr>
					<tr> <th>Nazwa użytkownika</th> <td> <?php echo $_SESSION['login']; ?> </td> </tr>
				</table>
			</div>
		<?php } ?>


	</div>
</div>
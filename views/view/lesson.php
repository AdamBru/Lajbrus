<div class="dashboard-container nopadding">
	
	<aside class="menu" style="width: 50%">
		<p>Moje ostatnie lekcje:</p>
		<label for="limit">Limit</label>
		<select name="limit" id="limit">
			<option value="5">10</option>
			<option value="10">25</option>
			<option value="30">50</option>
		</select>
		<div class="table-container">
			<!-- Srypt PHP generujący tabelę z ostatnimmi lekcjami tego nauczyciela -->
			<table><tr class="header"> <th>ID</th> <th>Data</th> <th>Klasa</th> <th>Przedmiot</th> <th>Nauczyciel</th> <th>Temat</th> </tr></table>
			<table>
			<?php 
				$sql = "SELECT 
						l.id,
						l.data,
						k.nazwa AS nazwa_klasy,
						p.nazwa AS nazwa_przedmiotu,
						u.nazwisko,
						u.imie,
						l.temat
					FROM lekcja l
					JOIN klasa k ON l.id_klasy = k.id
					JOIN przedmiot p ON l.id_przedmiotu = p.id
					JOIN uzytkownik u ON l.id_nauczyciela = u.id
					ORDER BY l.id DESC
					LIMIT 10;
					";
				$result = mysqli_query($conn, $sql);
				if (mysqli_num_rows($result) > 0) {
					while ($row = mysqli_fetch_assoc($result)) {
						echo '<tr>';
							echo '<td>' . $row['id'] . '</td>';
							$formatted_date = date('Y-m-d H:i', strtotime($row['data']));
							echo '<td>' . $formatted_date . '</td>';
							echo '<td>' . $row['nazwa_klasy'] . '</td>';
							echo '<td>' . $row['nazwa_przedmiotu'] . '</td>';
							echo '<td>' . $row['nazwisko'] . ' ' . $row['imie'] . '</td>';
							$temat = htmlspecialchars($row['temat']);
							if (mb_strlen($temat) > 30) { // Użyj mb_strlen dla UTF-8
								$temat = mb_substr($temat, 0, 27) . '...';
							}
							echo '<td>' . $temat . '</td>';
						echo '</tr>';
					}
					mysqli_free_result($result);
				}
			?>
			</table>
		</div>

		<p>Pozostałe ostatnie lekcje:</p>
		<label for="limit">Limit</label>
		<select name="limit" id="limit">
			<option value="5">10</option>
			<option value="10">25</option>
			<option value="30">50</option>
		</select>
		<div class="table-container">
			<!-- Srypt PHP generujący tabelę z ostatnimmi lekcjami pozostałych nauczycieli -->
		</div>
	</aside>

	<div class="dashboard-container usunPaddingMobile">
		<form action="" method="post" id="nowa-lekcja">
		<!-- ID lekcji -->
			<label for="id_lekcji"> ID lekcji:</label>
			<input type="text" name="id_lekcji" id="id_lekcji" disabled value=" <?php 
					// Pobieranie ID ostatniej lekcji z bazy danych i inkrementacja o 1
					$sql = "SELECT id FROM lekcja ORDER BY id DESC LIMIT 1;";
					$result = mysqli_query($conn, $sql);
					$row = mysqli_fetch_assoc($result);
					echo ($row['id'] + 1);
			?>">

		<!-- Data -->
			<label for="data">Data:</label>
			<input type="datetime-local" name="data" id="data" value="2025-04-19T10:55">

		<!-- Klasa -->
			<label for="klasa">Klasa:</label>
			<select name="klasa" id="klasa">
				<optgroup label="Moje klasy">
					<?php
						$nauczyciel_id = $_SESSION['id'];

						$sql = "SELECT k.id AS class_id, k.nazwa AS class_name
								FROM klasa k
								JOIN rel_nauczyciel_klasy rnk ON k.id = rnk.id_klasy
								WHERE rnk.id_nauczyciela = $nauczyciel_id";
						
						$listaKlasResult = mysqli_query($conn, $sql);
						
						if ($listaKlasResult) {
							if (mysqli_num_rows($listaKlasResult) > 0) {
								while ($row = mysqli_fetch_assoc($listaKlasResult)) {
									$class_id = $row['class_id'];
									$class_name = $row['class_name'];
									echo '<option value="' . htmlspecialchars($class_id) . '">' . htmlspecialchars($class_name) . '</option>';
								}
								mysqli_free_result($listaKlasResult);
							} else {
								echo '<option value="">Brak przypisanych klas</option>';
							}
						} else {
							error_log("Błąd zapytania SQL (lista klas nauczyciela - option): " . mysqli_error($conn));
							echo '<option value="">Błąd pobierania klas</option>';
						}
					?>
				</optgroup>

				<optgroup label="Pozostałe klasy">
					<?php
						$nauczyciel_id = $_SESSION['id'];

						$sql = "SELECT k.id AS class_id, k.nazwa AS class_name
								FROM klasa k
								WHERE k.id NOT IN (SELECT id_klasy FROM rel_nauczyciel_klasy WHERE id_nauczyciela = $nauczyciel_id)";

						$listaKlasResult = mysqli_query($conn, $sql);

						if ($listaKlasResult) {
							if (mysqli_num_rows($listaKlasResult) > 0) {
								while ($row = mysqli_fetch_assoc($listaKlasResult)) {
									$class_id = $row['class_id'];
									$class_name = $row['class_name'];
									echo '<option value="' . htmlspecialchars($class_id) . '">' . htmlspecialchars($class_name) . '</option>';
								}
								mysqli_free_result($listaKlasResult);
							} else {
								echo '<option value="">Wszystkie klasy są przypisane</option>'; // Zmieniony komunikat
							}
						} else {
							error_log("Błąd zapytania SQL (lista klas nieuczone - option): " . mysqli_error($conn));
							echo '<option value="">Błąd pobierania klas</option>';
						}
					?>
				</optgroup>
			</select>

		<!-- Przedmiot -->
			<label for="przedmiot">Przedmiot:</label>
			<select name="przedmiot" id="przedmiot">
				<optgroup label="Moje przedmioty">
					<?php
						$nauczyciel_id = $_SESSION['id'];

						$sql = "SELECT 
									p.id AS przedmiot_id,
									p.nazwa AS nazwa_przedmiotu
								FROM 
									przedmiot p
								JOIN 
									rel_nauczyciel_przedmiot rnp ON p.id = rnp.id_przedmiotu
								WHERE 
									rnp.id_nauczyciela = $nauczyciel_id";
						
						$listaPrzedmiotowResult = mysqli_query($conn, $sql);
						
						if ($listaPrzedmiotowResult) {
							if (mysqli_num_rows($listaPrzedmiotowResult) > 0) {
								while ($row = mysqli_fetch_assoc($listaPrzedmiotowResult)) {
									$przedmiot_id = $row['przedmiot_id'];
									$nazwa_przedmiotu = $row['nazwa_przedmiotu'];
									echo '<option value="' . htmlspecialchars($przedmiot_id) . '">' . htmlspecialchars($nazwa_przedmiotu) . '</option>';
								}
								mysqli_free_result($listaPrzedmiotowResult);
							} else {
								echo '<option value="">Brak przypisanych przedmiotów</option>';
							}
						} else {
							error_log("Błąd zapytania SQL (lista przedmiotów nauczyciela - option): " . mysqli_error($conn));
							echo '<option value="">Błąd pobierania przedmiotów</option>';
						}
					?>
				</optgroup>

				<optgroup label="Pozostałe przedmioty">
					<?php
						$nauczyciel_id = $_SESSION['id'];
						
						$sql = "SELECT 
									p.id AS przedmiot_id,
									p.nazwa AS nazwa_przedmiotu
								FROM 
									przedmiot p
								WHERE 
									p.id NOT IN (SELECT id_przedmiotu FROM rel_nauczyciel_przedmiot WHERE id_nauczyciela = $nauczyciel_id)";
						
						$listaPrzedmiotowResult = mysqli_query($conn, $sql);
						
						if ($listaPrzedmiotowResult) {
							if (mysqli_num_rows($listaPrzedmiotowResult) > 0) {
								while ($row = mysqli_fetch_assoc($listaPrzedmiotowResult)) {
									$przedmiot_id = $row['przedmiot_id'];
									$nazwa_przedmiotu = $row['nazwa_przedmiotu'];
									echo '<option value="' . htmlspecialchars($przedmiot_id) . '">' . htmlspecialchars($nazwa_przedmiotu) . '</option>';
								}
								mysqli_free_result($listaPrzedmiotowResult);
							} else {
								echo '<option value="">Wszystkie przedmioty są przypisane</option>'; // Zmieniony komunikat
							}
						} else {
							error_log("Błąd zapytania SQL (lista pozostałych przedmiotów - option): " . mysqli_error($conn));
							echo '<option value="">Błąd pobierania przedmiotów</option>';
						}
					?>
				</optgroup>
			</select>

		<!-- Nauczuciel -->
			<label for="nauczyciel">Nauczyciel:</label>
			<input type="text" name="nauczyciel" id="nauczyciel" disabled value="<?php echo $_SESSION['nazwisko'] . ' ' . $_SESSION['imie']; ?>">

		<!-- Temat -->
			<label for="temat">Temat:</label>
			<textarea name="temat" id="temat" cols="20" rows="2" wrap="hard" maxlength="70"></textarea>

		<!-- Utwórz lekcję -->
			<input type="submit" name="utworz" class="btn" value="Utwórz lekcję">

		<!-- Anuluj -->
			<input type="button" name="anuluj" class="btn" style="background-color: #f00a;" value="Anuluj" onclick="cancelModal()">
			<script>
				function cancelModal() {
					modal('Anulować tworzenie lekcji?', 
						`Spowoduje to usunięcie wszystkich niezapisanych danych. 

						<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-around; margin-top: 1.3rem">
							<button class="btn" style="color: #fff; padding: 5px 40px; height: fit-content; border: 1px solid #333; cursor:pointer; background-color: #f00a;" onclick="location.reload()"> Tak </button>
							<button class="btn" style="color: #fff; padding: 5px 40px; height: fit-content; border: 1px solid #333; cursor:pointer;" onclick="zamknijModal()"> Nie </button>
						</div>
						`
					);
				}
			</script>
		
		</form>
	</div>
</div>
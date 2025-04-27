<div class="dashboard-container nopadding">
	<aside class="menu">
		<table>
			<tr> <th>Moje klasy:</th> </tr>
			<?php 
				$nauczyciel_id = $_SESSION['id'];

				$listaKlasSql = "SELECT 
							k.id AS class_id, 
							k.nazwa AS class_name, 
							COUNT(ruk.id_ucznia) AS student_count
						FROM klasa k
						LEFT JOIN rel_uczen_klasa ruk ON k.id = ruk.id_klasy
						JOIN rel_nauczyciel_klasy rnk ON k.id = rnk.id_klasy 
						WHERE rnk.id_nauczyciela = $nauczyciel_id 
						GROUP BY k.id, k.nazwa";

				$listaKlasResult = mysqli_query($conn, $listaKlasSql);

				if ($listaKlasResult) {
					if (mysqli_num_rows($listaKlasResult) > 0) {
						while ($row = mysqli_fetch_assoc($listaKlasResult)) {
							$class_id = $row['class_id'];
							$class_name = $row['class_name'];
							$student_count = $row['student_count'];

							echo '<tr>';
								echo '<td>';
									echo '<a class="link" href="?view=students&class_id=' . htmlspecialchars($class_id) . '">';
										echo htmlspecialchars($class_name);
										echo ' (' . $student_count . ')';
									echo '</a>';
								echo '</td>';
							echo '</tr>';
						}
						mysqli_free_result($listaKlasResult);
					} else {
						echo '<tr><td>Brak przypisanych klas</td></tr>';
					}
				} else {
					error_log("Błąd zapytania SQL (lista klas nauczyciela - mysqli_query): " . mysqli_error($conn));
					echo '<tr><td>Błąd pobierania danych z bazy. Sprawdź logi serwera.</td></tr>';
				}
			?>

			<tr> <th>Pozostałe klasy:</th> </tr>
			<?php
				$nauczyciel_id = $_SESSION['id'];

				$sql = "SELECT 
							k.id AS class_id, 
							k.nazwa AS class_name, 
							COUNT(ruk.id_ucznia) AS student_count
						FROM klasa k
						LEFT JOIN rel_uczen_klasa ruk ON k.id = ruk.id_klasy
						WHERE k.id NOT IN (SELECT id_klasy FROM rel_nauczyciel_klasy WHERE id_nauczyciela = $nauczyciel_id)
						GROUP BY k.id, k.nazwa";

				$listaKlasResult = mysqli_query($conn, $sql);

				if ($listaKlasResult) {
					if (mysqli_num_rows($listaKlasResult) > 0) {
						while ($row = mysqli_fetch_assoc($listaKlasResult)) {
							$class_id = $row['class_id'];
							$class_name = $row['class_name'];
							$student_count = $row['student_count'];

							echo '<tr>';
								echo '<td>';
									echo '<a class="link" href="?view=students&class_id=' . htmlspecialchars($class_id) . '">';
										echo htmlspecialchars($class_name);
										echo ' (' . $student_count . ')';
									echo '</a>';
								echo '</td>';
							echo '</tr>';
						}

						mysqli_free_result($listaKlasResult);
					} else {
						echo '<tr><td>Brak klas</td></tr>';
					}
				} else {
					error_log("Błąd zapytania SQL (lista klas - mysqli_query): " . mysqli_error($conn));
					echo '<tr><td>Błąd pobierania danych z bazy. Sprawdź logi serwera.</td></tr>';
				}
				?>
		</table>
	</aside>

	<div class="dashboard-container">
		<div class="table-container">
			<table class="students">
			<tr>
				<th>Lp.</th>
				<th>Uczeń</th>
				<th>Klasa</th>
			</tr>
			<?php
				if (isset($_GET['class_id'])) {
					$class_id = $_GET['class_id'];

					$sql = "SELECT u.id AS uczen_id,
								u.imie,
								u.nazwisko,
								k.nazwa AS nazwa_klasy
							FROM uzytkownik u
							JOIN rel_uczen_klasa ruk ON u.id = ruk.id_ucznia
							JOIN klasa k ON ruk.id_klasy = k.id
							WHERE ruk.id_klasy = $class_id
							ORDER BY u.nazwisko, u.imie ASC
							;";

					$result = mysqli_query($conn, $sql);

					if ($result) {
						if (mysqli_num_rows($result) > 0) {
							$lp = 1;
							while ($row = mysqli_fetch_assoc($result)) {
								echo '<tr>';
								echo '<td>' . $lp++ . '.</td>';
								echo '<td>' . htmlspecialchars($row['nazwisko'] . ' ' . $row['imie']) . '</td>';
								echo '<td>' . htmlspecialchars($row['nazwa_klasy']) . '</td>';
								echo '</tr>';
							}
							mysqli_free_result($result);
						} else {
							echo '<tr><td colspan="3">Brak uczniów w tej klasie.</td></tr>';
						}
					} else {
						error_log("Błąd zapytania SQL: " . mysqli_error($conn));
						echo '<tr><td colspan="3">Błąd pobierania danych. Sprawdź logi serwera.</td></tr>';
					}
				} else {
					echo '<tr><td colspan="3">Nie wybrano klasy.</td></tr>';
				}
				?>
			</table>
		</div>

	</div>



</div>
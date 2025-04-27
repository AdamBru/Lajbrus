<div class="content _center">

<?php
	 if (isset($_POST['oldPassword']) && isset($_POST['newPassword']) && isset($_POST['repeatPassword'])) {
		$oldPassword = sha1(md5($_POST['oldPassword']));
		$newPassword = sha1(md5($_POST['newPassword']));
		$repeatPassword = sha1(md5($_POST['repeatPassword']));

		$oldPasswordSql = "SELECT haslo FROM uzytkownik WHERE id = '".$_SESSION['id']."'";
		$oldPasswordResult = mysqli_query($conn, $oldPasswordSql);
		$oldPasswordRow = mysqli_fetch_assoc($oldPasswordResult);
		$oldPasswordDb = $oldPasswordRow['haslo'];

		if ($oldPassword != $oldPasswordDb) {
			echo '<p class="error">Błędne stare hasło</p>';
		} else if ($_POST['newPassword'] != $_POST['repeatPassword']) {
			echo '<p class="error">Nowe hasło nie zgadza się z powtórzeniem</p>';
		} else if ($newPassword == $oldPasswordDb) {
			echo '<p class="error">Nowe hasło nie może być takie samo jak stare</p>';
		} else {
			$newPasswordSql = "UPDATE uzytkownik SET haslo = '" . $newPassword . "' WHERE id = '" . $_SESSION['id'] . "'";
			
			if (mysqli_query($conn, $newPasswordSql)) {
				echo '<p class="success">Hasło zostało zmienione.<br>Za chwilę zostaniesz wylogowany(-a).</p>';

				echo '<script> setTimeout(function() {window.location.href = "../helper/logout.php";}, 3000); </script>';
			} else {
				echo '<p class="error">Wystąpił błąd podczas aktualizacji hasła: ' . mysqli_error($conn) . '</p>';
			}
		}
	 }
?>

	<form action="" method="post" class="loginForm">
		<label for="oldPassword">Stare hasło</label>
		<input type="password" name="oldPassword" required>

		<label for="newPassword">Nowe hasło</label>
		<input type="password" name="newPassword" required>

		<label for="repeatPassword">Powtórz nowe hasło</label>
		<input type="password" name="repeatPassword" required>

		<br>
		<input type="submit" class="btn" value="Zmień hasło">
	</form>
</div>
<form method="POST" action="login.php?loginForm" class="loginForm">
	<label for="login">Nazwa użytkownika:</label>
	<input type="text" name="login" id="login" required>

	<label for="password">Hasło:</label>
	<input type="password" name="password" id="password" required>

	<br>
	<input type="submit" class="btn" value="Zaloguj się">

	<a href="login.php?registerForm" class="link" style="text-align: center; margin-top: 1rem">Załóż konto</a>
</form>
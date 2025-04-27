<form action="post" class="loginForm">
	<label for="name">Imię:</label>
	<input type="text" name="name" id="name"> 

	<label for="surname">Nazwisko:</label>
	<input type="text" name="surname" id="surname">

	<label for="date">Data urodzenia:</label>
	<input type="date" name="date" id="date">

	<label for="role">Rola:</label>
	<select name="role" id="role">
		<option value="student">Uczeń</option>
		<option value="teacher">Nauczyciel</option>
	</select>

	<label for="login">Nazwa użytkownika:</label>
	<input type="text" name="login" id="login">

	<label for="haslo">Hasło:</label>
	<input type="password" name="password" id="password">
	<br>
	<input type="submit" value="Zarejestruj się">

	<a href="login.php?loginForm" class="link" style="text-align: center; margin-top: 1rem">Zaloguj się</a>
</form>
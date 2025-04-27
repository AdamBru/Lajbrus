<form action="" method="post">
	<label for="haslo">Password:</label>
	<input type="text" name="haslo">
	<input type="submit" value="Encrypt">
</form>

<?php 
if (isset($_POST['haslo'])) {
	echo 'sha1(md5(' . $_POST['haslo'] . ')) = ' . sha1(md5($_POST['haslo'])) . '</br>'; 
	echo 'sha1(' . $_POST['haslo'] . ') = ' . sha1($_POST['haslo']) . '</br>'; 
	echo 'md5(' . $_POST['haslo'] . ') = ' . md5($_POST['haslo']) . '</br>'; 
}
?>
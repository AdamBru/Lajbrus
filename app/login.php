<?php $documentTitle = "Logowanie - Lajbrus"; ?>
<?php require_once dirname(__DIR__) . '/views/htmlBegin.php'; ?>
<?php require_once dirname(__DIR__) . '/views/header.php' ?>

<?php
// jeśli użytkownik jest zalogowany to nie daj mu się zalogować ponownie i przenieś do dashboarda
if (isset($_SESSION['id'])) {
	echo "<script> alert('sesja jest aktywna')</script>";
	header('Location: dashboard.php');
} 
?>

	<div class="loginPage" style="height: 20%; display: flex; justify-content: center; align-items: center;">
		<h1>Lajbrus</h1>
	</div>

	<div class="content _center loginPage" style="height: 80%;">
		<a href="login.php?loginForm" class="btn" id="remove">Zaloguj się</a>
		<a href="login.php?registerForm" class="link" id="remove1">Załóż konto</a>

		<?php
			if (isset($_GET['loginForm'])) {
				echo '<script> document.getElementById("remove").style.display = "none";
							   document.getElementById("remove1").style.display = "none";</script>';
				require_once dirname(__DIR__) . '/helper/login.php';
				require_once dirname(__DIR__) . '/views/loginForm.php';

			} elseif (isset($_GET['registerForm'])) {
				echo '<script> document.getElementById("remove").style.display = "none";
							   document.getElementById("remove1").style.display = "none";</script>';
				require_once dirname(__DIR__) . '/views/registerForm.php';
			}
		?>

	</div>

<?php require_once dirname(__DIR__) . '/views/footer.php'; ?>
<?php require_once dirname(__DIR__) . '/views/htmlEnd.php'; ?>


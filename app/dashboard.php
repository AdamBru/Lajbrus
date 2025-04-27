<?php session_start(); ?>

<?php if($_SESSION['rola'] == "Nauczyciel") {
	$documentTitle = "Panel Nauczyciela - Lajbrus";
} else if ($_SESSION['rola'] == "Uczeń") {
	$documentTitle = "Panel Ucznia - Lajbrus";
} ?>

<?php require_once dirname(__DIR__) . '/views/htmlBegin.php'; ?>
<?php require_once dirname(__DIR__) . '/views/header.php' ?>


	<?php 
		// adresy URL dla nauczyciela
		if($_SESSION['rola']=="Nauczyciel"){
			if 
				(isset($_GET['view']) && $_GET['view'] == 'home') {
				require_once dirname(__DIR__) . '/views/dashboardNauczyciela.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'personal') {
				require_once dirname(__DIR__) . '/views/view/personal.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'attendance') {
				require_once dirname(__DIR__) . '/views/view/attendanceNauczyciela.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'changePassword') {
				require_once dirname(__DIR__) . '/views/view/changePassword.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'students') {
				require_once dirname(__DIR__) . '/views/view/students.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'lesson') {
				require_once dirname(__DIR__) . '/views/view/lesson.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'xxxxx') {
				require_once dirname(__DIR__) . '/views/view/xxxxx.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'xxxxx') {
				require_once dirname(__DIR__) . '/views/view/xxxxx.php';


			} else if
				(!isset($_GET['view']) ) {
				require_once dirname(__DIR__) . '/views/dashboardNauczyciela.php';
			} else {
				require_once dirname(__DIR__) . '/views/view/unavilable.php';
			}
		}

		// adresy URL dla ucznia
		else if($_SESSION['rola']=="Uczeń"){
			if 
				(isset($_GET['view']) && $_GET['view'] == 'home') {
				require_once dirname(__DIR__) . '/views/dashboardUcznia.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'personal') {
				require_once dirname(__DIR__) . '/views/view/personal.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'changePassword') {
				require_once dirname(__DIR__) . '/views/view/changePassword.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'xxxxx') {
				require_once dirname(__DIR__) . '/views/view/xxxxx.php';
			} else if 
				(isset($_GET['view']) && $_GET['view'] == 'xxxxx') {
				require_once dirname(__DIR__) . '/views/view/xxxxx.php';


			} else if ( !isset($_GET['view']) ) {
				require_once dirname(__DIR__) . '/views/dashboardUcznia.php';
			} else {
				require_once dirname(__DIR__) . '/views/view/unavilable.php';
			}
			
		}
	?>



<?php require_once dirname(__DIR__) . '/views/footer.php'; ?>
<?php require_once dirname(__DIR__) . '/views/htmlEnd.php'; ?>
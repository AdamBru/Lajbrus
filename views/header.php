<header>

	<?php if(isset($_SESSION['id'])) { ?>
		<a href="dashboard.php?view=home"><img src="../assets/images/icon-white.svg" alt="Lajbrus logo"> <span class="link">Strona główna</span> </a>
	<?php } else { ?>
		<a href="login.php"><img src="../assets/images/icon-white.svg" alt="Lajbrus logo"></a>
	<?php } ?>

	<?php
		if(isset($_SESSION['id'])) {
			echo '<p> <span>' . $_SESSION['imie'] . ' ' . $_SESSION['nazwisko'] . '</span> <span>&nbsp;(' . $_SESSION['rola'] . ') &nbsp;| &nbsp;<a href="../helper/logout.php" class="link">Wyloguj</a></span> </p>';
		}
	?>
</header>

<div class="current-view-title" id="current-view-title">
	<?php
		if(isset($_GET['view']) && $_GET['view'] == 'home' ) {
			echo '<span class="cvt-text">Panel</span> <span class="spacer"></span> <span class="cvt-text">Strona główna</span>';
		} else if(isset($_GET['view']) && $_GET['view'] == 'lesson') {
			echo '<span class="cvt-text">Panel</span> <span class="spacer"></span> <span class="cvt-text">Lekcje</span>';
			// $documentTitle = 'Lekcje - Lajbrus';
		} else if(isset($_GET['view']) && $_GET['view'] == 'attendance') {
			echo '<span class="cvt-text">Panel</span> <span class="spacer"></span> <span class="cvt-text">Frekwencja</span>';
			// $documentTitle = 'Frekwencja - Lajbrus';
		} else if(isset($_GET['view']) && $_GET['view'] == 'students') {
			echo '<span class="cvt-text">Panel</span> <span class="spacer"></span> <span class="cvt-text">Uczniowie</span>';
			// $documentTitle = 'Uczniowie - Lajbrus';
		} else if(isset($_GET['view']) && $_GET['view'] == 'timetable') {
			echo '<span class="cvt-text">Panel</span> <span class="spacer"></span> <span class="cvt-text">Plan zajęć</span>';
			// $documentTitle = 'Plan zajęć - Lajbrus';
		} else if(isset($_GET['view']) && $_GET['view'] == 'messages') {
			echo '<span class="cvt-text">Panel</span> <span class="spacer"></span> <span class="cvt-text">Wiadmości</span>';
			// $documentTitle = 'Wiadmości - Lajbrus';
		} else if(isset($_GET['view']) && $_GET['view'] == 'grades') {
			echo '<span class="cvt-text">Panel</span> <span class="spacer"></span> <span class="cvt-text">Oceny</span>';
			// $documentTitle = 'Oceny - Lajbrus';
		} else if(isset($_GET['view']) && $_GET['view'] == 'personal') {
			echo '<span class="cvt-text">Panel</span> <span class="spacer"></span> <span class="cvt-text">Moje dane</span>'; 
			// $documentTitle = 'Moje dane - Lajbrus';
		} else if(isset($_GET['view']) && $_GET['view'] == 'changePassword') {
			echo '<span class="cvt-text">Panel</span> <span class="spacer"></span> <span class="cvt-text">Zmiana hasła</span>';
			// $documentTitle = 'Zmiana hasła - Lajbrus';
		} 
		else if((basename($_SERVER['PHP_SELF']) != 'dashboard.php')) {
			echo '<script> document.getElementById("current-view-title").style.display = "none"; </script>';
		} 
		else if (!isset($_GET['view'])) {
			echo '<span class="cvt-text">Panel</span> <span class="spacer"></span> <span class="cvt-text">Strona główna</span>';
		}
	?>
</div>
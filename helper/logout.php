<?php
// skrypt zamykania i czyszczenia sesji
session_start();

session_unset();
session_destroy();
echo "sesja zamknięta";
header('Location: ../app/login.php');
exit;

?>
<?php 
	session_start();

	$conn = mysqli_connect('localhost', 'root', '', 'lajbrus');
	if($conn -> connect_error){
		die("Connection failed" . $conn -> connect_error);
	}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="../assets/images/favicon.ico">
	<link rel="stylesheet" href="../style/main.css">
	<title><?php echo $documentTitle; ?></title>
</head>
<body>
<!doctype html>
<html>
<head> 
<meta charset="UTF-8">
<title>Hello World</title>

<?php
/*
 * @Author Taylor Shipley
 * CSIS2440
 * CE01 Hello World
 */
$name="Taylor Shipley";
$age= 23; 
$male= true;
$superHero="Batman";
$imageFile="img/batSignal.jpeg"
?>
</head>

<body>
	<div>
<?php
	echo "<p style = 'font:tahoma; color:red;'> Hello World, this is my first PHP Page!</p>";
	print("<p>My names: " .$name. ", who is $age years old, and whose favorite superhero is $superHero.</p>");
	print('<p>We are using variables $name, $age, $superHero</p>');
	print("<img scr='$imageFile' height='100'>");
?>
	</div>
</body>
</html>
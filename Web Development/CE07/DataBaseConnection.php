<?php

$host = "localhost"; //127.0.0.1
$user = "root";
$password = "DBAdmin"; //if you are using my instance this should work for you, if not you need to kn
$dbname = "CSIS2440";
$con = new mysqli($host, $user, $password, $dbname)
        or die('Could not connect to the database server.   ' . mysqli_connect_error($con));

//———————————————————
if ($con->connect_error == FALSE) {
   // echo "<h2>We Connected </h2>";
} else {
    echo $con->connect_error;
}
//print_r($con);


?>
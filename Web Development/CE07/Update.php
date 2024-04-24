<?php

$update = "UPDATE `CSIS2440`.`Planets` SET `Active` = 'Y' ";//write the update statment
if ($desc != "A short description of the planet") {
    $update .= "";//add the description
}
$update .= "WHERE (`PlanetName` = '" . $name . "')";//add the where clause
$success = $con->query($update);
if ($success == FALSE) {
    $failmess = "Whole query" . $update."<br>";
    echo $failmess;
    die('Invalid query: ' . mysqli_error_($con));
} else {
    echo $name . " Was given a space station<br>";
}
?>
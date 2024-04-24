<?php

$update = "UPDATE `CSIS2440`.`Products` SET "; //write the update statment
if ($desc != "") {
    $update .= "`ProductsDesc` ='" . $desc . "'";   //add the description

    if ($price > 0 && $price !="") {
        $update .= ",";
    }
}

if ($price > 0 && $price !="") {
    $update .= " `ProductsPrice` = " . $price;
}
$update .= " WHERE `ProductsName` = '" . $name . "'";  //add the where clause
$success = $con->query($update);
if ($success == FALSE) {
    //$failmess = "Whole query" . $update . "<br>";
    //echo $failmess;
    Print('Unable to update Product in database, please try again.');
    die('Invalid query: ' . mysqli_error_($con));
} else {
    echo $name . " Was updated<br><br>";
    include 'Search.php';
}
?>
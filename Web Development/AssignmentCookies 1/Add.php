<?php

$insert = "INSERT INTO `CSIS2440`.`Products`(`ProductsName`, `ProductsPrice`,`ProductsDesc`,`ProductsImage`) "
        . "VALUES ('$name', '$price', '$desc', '$url');";
//echo $insert. "<br><br>";
$success = $con->query($insert);

if ($success == FALSE) {
    //$failmess = "Whole query " . $insert . "<br>";
    //echo $failmess;
    print('Invalid query: ' . mysqli_error($con) . "<br>");
    Print('Unable to add Product to database, please try again.');
} else {
    echo $name . " was added <br><br>";
    echo '<table style="width:100%"><th>Name</th><th>Price $</th><th>Description</th><th>Image</th>';

    echo '<tr><td style="text-align:left; vertical-align:top">' . $name
    . '</td><td style="text-align:left; vertical-align:top"> $' . $price
    . '</td><td style="text-align:left; vertical-align:top">' . $desc
    . '</td><td style="text-align:left; vertical-align:top">' . '<img src= "' . $url . '" style="width:auto;height:256px;"></td></tr>';
    echo "</table>";
}
?>
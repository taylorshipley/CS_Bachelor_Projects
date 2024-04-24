<?php

$search = "SELECT * FROM `CSIS2440`.`Products` WHERE ProductsName LIKE '%$name%'"
        . "ORDER BY ProductsName";
$return = $con->query($search);

if (!$return) {
    //$message = "Whole query " . $search;
    //echo $message;
    Print('Unable to find Product in database, please try again.');
    die('Invalid query: ' . mysqli_error($con));
}
echo '<table style="width:100%"><th>Name</th><th>Price</th><th>Description</th><th>Image</th>';
while ($row = $return->fetch_assoc()) {
    echo '<tr><td style="text-align:left; vertical-align:top">' . $row['ProductsName']
    . '</td><td style="text-align:left; vertical-align:top"> $' . $row['ProductsPrice']
    . '</td><td style="text-align:left; vertical-align:top">' . $row['ProductsDesc']
    . '</td><td style="text-align:left; vertical-align:top">' . '<img src= "' . $row['ProductsImage'] . '" style="width:auto;height:256px;"></td></tr>';
}
echo "</table>";
?>
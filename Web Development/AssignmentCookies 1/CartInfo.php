<?php
require_once 'DataBaseConnection.php';
$infonum = $_GET['info'];
if ($infonum > 0) {
    $sql = "SELECT ProductsName,ProductsPrice,ProductsDesc,ProductsImage FROM CSIS2440.Products where idProducts= '" . $infonum. "'";
    //echo $sql;
    echo "<table align = 'left' width='100%'><tr><th>Name</th><th>Price</th><th>Description</th></tr>";
    $result = $con->query($sql);
    //Only display the row if there is a product (though there should always be as we have already checked)
    if (mysqli_num_rows($result) > 0) {
        list($infoname, $infoprice, $infodesc, $infoimage) = mysqli_fetch_row($result);
        echo "<tr>";
        //show this information in table cells
        echo "<td align=\"left\" width=\"250px\">$infoname</td>";
        echo "<td align=\"left\" width=\"125px\">" . money_format('%(#8n', $infoprice) . " </td>";
        echo "<td align=\"center\">$infodesc</td>";
        echo "<td align=\"left\"><img src='$infoimage' height=\"160\" width=\"160\"></td>";
        echo "</td>";
    }
    echo "</table>";
}
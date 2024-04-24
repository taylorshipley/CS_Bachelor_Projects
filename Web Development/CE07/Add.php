<?php

$insert = "INSERT INTO `CSIS2440`.`Planets`(`PlanetName`, `PosX`,`PosY`,`PosZ`, `Desc`, `Faction`) "
        ."VALUES ('$name', '$posx', '$posy', '$posz', '$desc', '$faction')";
echo $insert. "<br><br>";
$success = $con->query($insert);

if ($success == FALSE) {
    $failmess = "Whole query " . $insert . "<br>";
    echo $failmess;
    print('Invalid query: ' . mysqli_error($con) . "<br>");
} else {
    echo $name . " was added <br>";
}
?>
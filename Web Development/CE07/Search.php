<?php
$search = "SELECT * FROM `CSIS2440`.`Planets` WHERE PlanetName LIKE '%$name%'"
    ."ORDER BY PlanetName";
$return = $con->query($search);

if (!$return) {
    $message = "Whole query " . $search;
    echo $message;
    die('Invalid query: ' . mysqli_error($con));
}
echo "<table><th>Name</th><th width='10%'>X,Y,Z</th><th>Description</th><th>Faction</th>"
 . "<th>Station</th>";
while ($row = $return->fetch_assoc()) {
    echo "<tr><td>" . $row['PlanetName']
    . "</td><td>" . $row['PosX'] . ", " . $row['PosY'] . ", " . $row['PosZ']
    . "</td><td>" . $row['Desc']
    . "</td><td>" . $row['Faction']
    . " </td><td>" . $row['Active'] . "</td></tr>";
}
echo "</table>";
?>
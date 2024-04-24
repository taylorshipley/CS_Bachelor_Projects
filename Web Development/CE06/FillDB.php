
<?php

require_once 'DataBaseConnection.php';
$planets = array(
    array("name" => "Ares",
        "x" => 335,
        "y" => 345,
        "z" => 262,
        "description" => "A moon of Boros, the third planet orbiting Georgia. It is named after the Greek god of war."),
    array("name" => "Ariel",
        "x" => 105,
        "y" => 276,
        "z" => 393,
        "description" => "Ariel is a central planet of the Union of Allied Planets. It is the eleventh planet orbiting White Sun. It is home to a major medical center (named Saint Lucy&apos;s) of the Alliance&apos;s solar system. Ariel is home to a bioluminescent lake that is a popular swimming spot. Ariel could be named after one of Uranus&apos; moons in the stellar system of &apos;Earth that was&apos; which gets its name from Ariel the sprite in William Shakespeare&apos;s The Tempest."),
    array("name" => "Beaumonde",
        "x" => 274,
        "y" => 596,
        "z" => 254,
        "description" => "Beaumonde, the fifteenth planet orbiting the star Kalidasa, is a fairly wealthy planet. The planet is known to have factories and ranches. Beaumonde roughly translated from French means &apos;beautiful world.&apos;"),
    array("name" => "Bellerophon",
        "x" => 704,
        "y" => 73,
        "z" => 2,
        "description" => "Bellerophon is a technologically advanced Alliance world, and home to the wealthy. It is the tenth planet orbiting the White Sun. It has both a large ocean and an empty area of desert climate, complete with canyons, rocks and sand. Isis Canyon is pointed out as the most deserted spot on the world. Bellerophon Estates, large self-contained estates that hover with anti-gravity above the moon&apos;s ocean, are described as having &apos;gracious living, ocean views and state-of-the-art security.&apos; The planet is named after a hero in Greek mythology. Bellerophon is also the name of an interstellar spacecraft referred to in the movie Forbidden Planet, as well as the unofficial name of 51 Pegasi b, the first extrasolar planet around Sun-like star to be discovered."),
    array("name" => "Haven",
        "x" => 619,
        "y" => 246,
        "z" => 325,
        "description" => "Haven, a moon of Deadwood, the seventh planet orbiting the Blue Sun. Haven is a mining planet which is often used as a hiding place for those running from the law (for a fee) and is where some smugglers or criminals decide to settle down."),
    array("name" => "Hera",
        "x" => 870,
        "y" => 900,
        "z" => 706,
        "description" => "Hera is an Earth-like planet with important significance to the Unification War (according to the &apos;Core and Border Worlds&apos; database, it was one of the three leading planets for the Independents&apos; side). It orbits the protostar Murphy, which is the fourteenth planet orbiting the star Georgia. Serenity Valley is located here, where the Independent Faction experienced a crushing defeat at the hands of the Alliance. Hera is named after a goddess in Greek mythology, Zeus&apos; wife and sister."),
    array("name" => "Higgins&apos; Moon",
        "x" => 76,
        "y" => 569,
        "z" => 354,
        "description" => "Higgins&apos; Moon orbits Harvest, the fourth planet orbiting the Red Sun, where the primary commercial activity is mud mining which is performed by indentured workers called &apos;mudders&apos;. The mud is exported offworld and used in the manufacturing of ceramic components. The bulk of the population are impoverished and/or indentured workers. The moon appears to be owned by a magistrate named Higgins."),
    array("name" => "Jiangyin",
        "x" => 293,
        "y" => 983,
        "z" => 37,
        "description" => "Jiangyin is a border planet located three weeks away from Persephone, and also nearby Greenleaf. It is the first planet orbiting the Red Sun and is the capital world of that system. Alliance law is known to be upheld here. The planet is most likely named after a city in China&apos;s Jiangsu province along the Yangtze River."),
    array("name" => "Lilac",
        "x" => 578,
        "y" => 521,
        "z" => 341,
        "description" => "Lilac is a moon of New Canaan, the second planet orbiting the Blue Sun (the &apos;Core and Border Worlds&apos; database refers to Lilac as a &apos;border planet&apos;). It is near Reaver territory. From space it appears to have a &apos;lilac&apos; (or purple-ish) color, which presumably it was named for."),
    array("name" => "Miranda",
        "x" => 419,
        "y" => 257,
        "z" => 171,
        "description" => "Miranda is the name of a planet located beyond Reaver territory. It orbits the protostar Burnham, the eighth and final planet in the Blue Sun system. It was home to an Alliance colony with a population of 30 million. The colony was lost due to failure of the terraforming process. Like Ariel, Miranda shares its name both with a character from The Tempest and a moon of Uranus."),
    array("name" => "Osiris",
        "x" => 797,
        "y" => 472,
        "z" => 279,
        "description" => "Osiris, the seventh world orbiting the White Sun, is a wealthy core planet. Named after the Ancient Egyptian god of life, death, and fertility, &apos;Osiris&apos; is also the unofficial name of HD 209458 b, the first extrasolar planet to be discovered by the transit method."),
    array("name" => "Persephone",
        "x" => 283,
        "y" => 141,
        "z" => 712,
        "description" => "Persephone is a civilized planet with heavily stratified societal structure. According to the &apos;Core and Border Worlds&apos; database, it was one of the three leading planets for the Independents&apos; side of the Unification War. Persephone orbits the protostar Lux which is the last planet in the White Star system. The Eavesdown Docks are located here, a commercial port and base of operations. Persephone&apos;s name comes from Greek mythology as the name of the &apos;Queen of the Underworld&apos; and was an early name for a proposed tenth planet."),
    array("name" => "Regina",
        "x" => 412,
        "y" => 671,
        "z" => 25,
        "description" => "Second planet orbiting Georgia. It is a mining world upon which many people are suffering from &apos;Bowden&apos;s malady&apos;, a degenerative disease. Its name is Latin for &apos;queen&apos;."),
    array("name" => "Santo",
        "x" => 852,
        "y" => 492,
        "z" => 876,
        "description" => "An unsophisticated planet near Persephone. It is a moon of Qin Shi Huang, a protostar orbiting the White Sun, which itself is the eighth planetary body in the system. From space, Santo has a bluish-gray color. Its name is Spanish for &apos;saint&apos;."),
    array("name" => "St. Albans",
        "x" => 258,
        "y" => 485,
        "z" => 95,
        "description" => "St. Albans, the fifth planet orbiting the Red Sun, is an icy world. Located at times about two days away from the Space Bazaar Sky Plex. It is named after the city of St Albans in Hertfordshire, England."),
    array("name" => "Triumph",
        "x" => 93,
        "y" => 905,
        "z" => 132,
        "description" => "Triumph orbits the brown dwarf Heinlein, itself ninth body orbiting the Red Sun. Triumph is a primitive and poor world, apparently self-governed with rather unusual customs and traditions."),
    array("name" => "Whitefall",
        "x" => 146,
        "y" => 543,
        "z" => 718,
        "description" => "Whitefall is the fourth moon of Athens, the ninth planet orbiting the star Georgia. A large percentage of the world is owned by a woman named Patience. Whitefall is said to not be civilization &apos;in the strictest sense.&apos;")
);

$ships = array(
    array("name" => "Crate",
        "speed" => 1.8),
    array("name" => "Lightening",
        "speed" => 4.3),
    array("name" => "Starliner",
        "speed" => 2.4),
    array("name" => "VD Tug",
        "speed" => 1.4),
    array("name" => "Biel-Corp II",
        "speed" => 1.3),
    array("name" => "VD Behemoth",
        "speed" => 0.5)
);

//Insert
//Create the insert sql statements
//INSERT INTO `CSIS2440`.`Planets` (`PlanetName`, `PosX`,`PosY`,`PosZ`, `Desc`)
//Values ('joe', '1', '1', '1', 'planets')

    foreach ($planets as $Newplanets) {
    $insert = "INSERT INTO `CSIS2440`.`Planets` (`PlanetName`, `PosX`,`PosY`,`PosZ`, `Desc`) "
            . "VALUES ('" . $Newplanets['name'] . "', '" . $Newplanets['x'] . "', '" . $Newplanets['Y']
            . "', '" . $Newplanets['z'] . "', '" . $Newplanets['description'] . "');";
    echo $insert;
    $success = $con->query($insert);

    if ($success == FALSE) {
        $failmess = "Whole query " . $insert . "<br>";
        echo $failmess;
        print('Invalid query: ' . mysqli_error($con) . "<br>");
        continue;
    } else {
        echo $Newplanets['name'] . " was added <br>";
    }
}

//update
echo"<br><h2>Making some vistable</h2><br><hr>";
for ($i = 0; $i < sizeof($planets); $i += 2) {
    $update = "UPDATE `CSIS2440`.`Planets` SET `Active` = 'Y' "
            . "WHERE (`PlanetName` = '" . $planets[$i]['name'] . "');";
    print($update."<br>");
    $success = $con->query($update);
    if ($succes == FALSE) {
        $failmess = "Whole query " . $update . "<hr>";
    }
}

//search
echo "<br>This is a table of all the planets<hr>";
$search = "SELECT * FROM `CSIS2440`.`Planets`;";
$return = $con->query($search);

if (!$return) {
    $message = "Whole query" . $search;
    echo $message;
    die('Invalid query: ' . mysqli_error_($con));
}
echo "<table><th>Name</th><th width='108'>X, Y, Z</th><th>Description</th><th>Station</th>";
while ($row = $return->fetch_assoc()) {
    print "<tr><td>" . $row['PlanetName']."</td><td style= 'text-align:center; '>" . $row['PosX'] . ", " . $row['PosY'] . ", " . $row['PosZ']
    . "</td><td>" . $row['Desc']
    . " </td><td>" . $row['Active'] . "</td></tr>";
}
echo "</table>";
mysqli_close($con);
?>
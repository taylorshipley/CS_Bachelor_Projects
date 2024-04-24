<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php
include "IncludeMe.php";
print_r($_POST);
$theShip = $_POST['ship'];
$Departure = $_POST['departure'];
$Arrival = $_POST['arrival'];
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Results</title>
        <!-- Custom fonts for this theme -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- Theme CSS -->

        <link href="../../../css/freelancer.min.css" rel="stylesheet" type="text/css"/>
        <style>
            img {
                height: 250px;
                padding: 3pt;
            }
            p{
                margin-left: 8px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-3">
                    <h3>Leaving From:
                    <?php
                    print($planets[$Departure]["name"]."</h3>");
                    print("<img src='imgs/$Departure.jpg' alt=''/");
                    ?>
                </div>
                <div class="col-3">
                    <h3>Arriving At:
                    <?php
                    print($planets[$Arrival]["name"]."</h3>");
                    print("<img src='imgs/$Arrival.jpg' alt=''/");
                    ?>
                </div>
                <div class="col-6">
                    <h3>Information</h3>
                    <?php
                    print("<p>You picked the :".$ships[$theShip]['name']."</p>");
                    $dist= PlanetDistance($planets[$Departure]["x"],$planets[$Departure]["y"], $planets[$Departure]["z"], 
                            $planets[$Arrival]["x"], $planets[$Arrival]["y"], $planets[$Arrival]["z"]);
                    printf("<p>The distance is; %2f</p>", $dist);
                    printf("The time it should take is: %2f cycles</p>",($dist/$ships[$theShip]['speed']));
                    ?>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript -->
        <script src="../../../vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../../../vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>

        <!-- Plugin JavaScript -->
        <script src="../../../vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>

        <!-- Contact Form JavaScript -->
        <script src="../../../js/jqBootstrapValidation.min.js" type="text/javascript"></script>
        <script src="../../../js/contact_me.min.js" type="text/javascript"></script>

        <!-- Custom scripts for this template -->
        <script src="../../../js/freelancer.min.js" type="text/javascript"></script>
    </body>
</html>

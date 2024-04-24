<!DOCTYPE html>
<?php
//get post and connect to DB
require_once 'DataBaseConnection.php';
//print_r($_POST);
$name = $_POST['ProductsName'];
$price = $_POST['ProductsPrice'];
$desc = $_POST['ProductsDesc'];
$url = $_POST['ProductsImage'];
$action = $_POST['Action'];
?>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Results</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <style type="text/css">
            body {
                background-color: rgb(65,65,65);
            }
        </style>
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>
    <div class="container">
        <header>
            <div class="primary_header">
                <h1 class="title">Results</h1>
            </div>
            <nav class="secondary_header" id="menu">
                <ul style= "align-content: center">
                    <li><a style="text-decoration: none" href="index.html">HOME</a></li>
                    <li><a style="text-decoration: none" href="login.php">LOGIN</a></li>
                    <li><a style="text-decoration: none" href="productinfo.php">ORDER</a></li>
                    <li><a style="text-decoration: none" href="cart.php">CART</a></li>
                    <li><a style="text-decoration: none" href="contact.html">CONTACT</a></li>
                </ul>
            </nav>
        </header>
        <body>
            <?php
            switch ($action) {
                case "Insert":
                    include 'Add.php';
                    break;
                case"Update":
                    include 'Update.php';
                    break;
                case"Search":
                    include 'Search.php';
                    break;
                default: print("Something is wrong");
            }
            ?>
            <div class="row blockDisplay">
                <div class="column_half left_half">
                    <h2 class="column_title"></h2>
                </div>
                <div style= "background-color: rgb(82,186,213)" class="column_half right_half">
                    <h2 class="column_title"></h2>
                </div>
            </div>
            <div class="social"><br></div>
    </div>
</body>
</html>

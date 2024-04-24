<!DOCTYPE html>
<?php
$fname = $_POST['fname'];
$lname = $_POST['lname'];
$phone = $_POST['phone_1'] . "-" . $_POST['phone_2'] . "-" . $_POST['phone_3'];
$usename = $_POST['email'];
$pword = $_POST['pword'];
$address = $_POST['address'];
$state = $_POST['state'];
$zip = $_POST['zip'];
$city = $_POST['city'];
$birthday = $_POST['year'] . '-' . $_POST['month'] . '-' . $_POST['day'];

require_once "DataBaseConnection.php";
?>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Client Completed Page</title>
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
                <h1 class="title">Craft Cookie Cottage</h1>
            </div>
            <nav class="secondary_header" id="menu">
                <ul style= "align-content: center">
                    <li><a style="text-decoration: none" href="index.html">HOME</a></li>
                    <li><a style="text-decoration: none" href="login.php">LOGIN</a></li>
                    <li><a style="text-decoration: none" href="productinfo.php">ORDER</a></li>
                    <li><a style="text-decoration: none" href="cart.php">CART</a></li>
                    <li><a style="text-decoration: none" href="clientform.php">CONTACT</a></li>
                </ul>
            </nav>
        </header>
        <body>
            <?php
            $insert = "Insert into CSIS2440.Clients(`fname`, `lname`, `phone`, `address`, `city`, `state`, `zip`, "
                    . "`birthday`, `email`, `thepassword`, `createdate`) "
                    . "values ('" . $fname . "', '" . $lname . "', '" . $phone . "', '" . $address . "', '" . $city . "', '"
                    . $state . "', '" . $zip . "', '" . $birthday . "', '" . $usename . "', '" . hash("ripemd128", $pword)
                    . "', CURRENT_DATE())";
            if ($con->query($insert) == TRUE) {
                $search = "SELECT * FROM CSIS2440.Clients Where email ='" . $usename . "'";
                $message = "Whole query:  ".$search;
                //echo $message;
                $return = $con->query($search);
                //print_r($return);

                echo "<table><tr><th>Firstname</th><th>Lastname</th><th>Address</th><th>City</th><th>State</th><th>Zip</th><th>Phone</th></tr>";
                while ($row = $return->fetch_assoc()) {
                    echo "<tr><td> " . $row['fname'] . "</td>";
                    echo "<td> " . $row['lname'] . "</td>";
                    echo "<td>" . $row['address'] . "</td>";
                    echo "<td> " . $row['city'] . "</td>";
                    echo "<td> " . $row['state'] . "</td>";
                    echo "<td> " . $row['zip'] . "</td>";
                    echo "<td> " . $row['phone'] . "</td></tr>";
                }
                echo "</table>";
            } else {
                echo "\nError updating record: " . $con->error;
            }
            $con->close();
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

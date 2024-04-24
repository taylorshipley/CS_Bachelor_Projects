<!DOCTYPE html>
<?php
session_start();
setlocale(LC_Monetary, 'en_US');
$product_id = $_POST['Select_Product']; //the product id from dropdown
$action = $_POST['action']; //the action from the URL
switch ($action) { //decide what to do
    case "Add":
        //echo "Adding";
        $_SESSION['cart'][$product_id]++; //add one to the quatity of the product with id $product_id
        break;
    case "Remove":
        //echo "Removing";
        $_SESSION['cart'][$product_id]--;
        if ($_SESSION['cart'][$product_id] <= 0) {
            unset($_SESSION['cart'][$product_id]);
        }
//completely (using the 'unset' function) - otherwise in will show zero.
        //then -1, -2 etc when the user keeps removing items.
        break;
    case "Empty":
        unset($_SESSION['cart']); //unset the whole cart, i.e. empty the cart.
        break;
}
//print_r($_SESSION);
require_once 'DataBaseConnection.php';
?>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product Form</title>
        <script>
            function productInfo(key) {
                console.log(key);
                //creates the datafile with query string
                var data_file = "CartInfo.php?info=" + key;
                //this is making the http request
                var http_request = new XMLHttpRequest();
                try {
                    // Opera 8.0+, Firefox, Chrome, Safari
                    http_request = new XMLHttpRequest();
                } catch (e) {
                    // Internet Explorer Browsers
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (e) {
                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                            // Something went wrong
                            alert("Your browser broke!");
                            return false;
                        }
                    }
                }
                http_request.onreadystatechange = function () {
                    if (http_request.readyState == 4)
                    {
                        var text = http_request.responseText;

                        //this is adding the elements to the HTML in the page
                        document.getElementById("productInformation").innerHTML = text;
                    }
                };
                http_request.open("GET", data_file, true);
                http_request.send();
            }
        </script>
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
                <h1 class="title">Craft Cookie Cottage</h1>
            </div>
            <nav class="secondary_header" id="menu">
                <ul style= "align-content: center">
                    <li><a style="text-decoration: none" href="index.html">HOME</a></li>
                    <li><a style="text-decoration: none" href="login.php">LOGIN</a></li>
                    <li><a style="text-decoration: none" href="productinfo.php">ORDER</a></li>
                    <li><a style="text-decoration: none" href="cart.php">CART</a></li>
                    <li><a style="text-decoration: none" href="NewAccount.php">SIGN-UP</a></li>
                </ul>
            </nav>
        </header>
        <body>
            <?php
            if (isset($_SESSION['fname'])) {
                ?>
                Welcome <?php echo $_SESSION['fname']; ?>.
                <?php
            } else
                echo '<h5>To access the shopping cart you must  <a href="login.php">Login</a>. </h5>';
            ?>
            <?php
            if (isset($_SESSION['fname'])) {
                echo '<div style= "align:left;">Click here to <a href="logout.php" title="Logout">Logout</a>.</div><br>';
            }
            ?>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-2">
                        <div>
                        </div></div>
                    <div class="col-sm-8">
                        <form action="cart.php" method="Post">
                            <div >
                                <?php
                                if (isset($_SESSION['fname'])) {
                                    echo '<p><span class="text">Please Select a product:</span>' .
                                    '<select id="Select_Product" name="Select_Product" class="select">';
                                    //setting the select statement and running it
                                    $search = "SELECT ProductsName, idProducts FROM CSIS2440.Products order by ProductsName";
                                    $return = $con->query($search);
                                    if (!$return) {
                                        $message = "Whole query: " . $search;
                                        //echo $message;
                                        die('Invalid query: ' . mysqli_error());
                                    }
                                    while ($row = mysqli_fetch_array($return)) {
                                        if ($row['idProducts'] == $product_id) {
                                            echo "<option value = " . $row['idProducts'] . " selected = 'selected'>" . $row['ProductsName'] . "</option>\n";
                                        } else {
                                            echo "<option value = " . $row['idProducts'] . ">" . $row['ProductsName'] . "</option>\n";
                                        }
                                    }
                                    echo '</select></p>'
                                    . '<table>'
                                    . '<tr>'
                                    . '<td>'
                                    . '<input id="button_Add" type="submit" value="Add" name="action" class="button"/>'
                                    . '</td>'
                                    . '<td>'
                                    . '<input name="action" type="submit" class="button" id="button_Remove" value="Remove"/>'
                                    . '</td>'
                                    . '<td>'
                                    . '<input name="action" type="submit" class="button" id="button_empty" value="Empty"/>'
                                    . '</td>'
                                    . '<td>'
                                    . '<input name="action" type="button" class="button" id="button_Info" value="Info" onclick="productInfo(document.getElementById(';
                                    echo "'Select_Product'";
                                    echo ').value)"/>'
                                    .'</td>'
                                    .'</tr> '
                                    .'</table>';
                                }
                                ?>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12" id="productInformation">

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2"></div>
                    <div id="Display_cart" class="col-sm-8">
                        <?php
                        if ($_SESSION['cart']) {//if the cart isn't empty
                            //show the cart
                            echo "<table border = \"1\" padding=\"3\" width=\"640px\"><tr><th>Name</th><th>Quantity</th><th>Price</th>"
                            . "<th width=\"80px\">Line Cost</th></tr>"; //format the cart using a HTML table
                            //iterate throught the cart, the $product_id is the key and $quantity is the value
                            foreach ($_SESSION['cart'] as $product_id => $quantity) {
                                $sql = "SELECT ProductsName, ProductsPrice FROM CSIS2440.Products where idProducts= " . $product_id;
                                //echo $sql;
                                $result = $con->query($sql);
                                //Only display the row if there is a product (though there should always be as we have already checked)
                                if (mysqli_num_rows($result) > 0) {
                                    list($name, $price) = mysqli_fetch_row($result);
                                    $line_cost = $price * $quantity; //work out the line cost
                                    $total = $total + $line_cost; //add to the total cost
                                    echo "<tr>";
                                    //show this information in table cells
                                    echo "<td align=\"left\" width=\"450px\">$name</td>";
                                    echo "<td align=\"center\" width=\"75px\">$quantity </td>";
                                    echo "<td align=\"left\" width=\"125px\">" . money_format('%(#8n', $line_cost) . "</td";
                                    echo "</td>";
                                }
                            }
                            //show the total
                            echo "<tr>";
                            echo "<td align=\"right\" colspan=3>Total</td>";
                            echo "<td align=\"right\">" . money_format('%(#8n', $total) . "</td>";
                            echo "</tr>";
                            echo "</table>";
                        } else {
                            echo "You have no items in your shopping cart.";
                        }
                        ?>

                    </div>
                </div>
            </div>    
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

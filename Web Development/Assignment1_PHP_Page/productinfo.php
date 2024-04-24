<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <title>Check Us Out</title>
        <style type="text/css">
body {
    background-color: rgb(65,65,65);
}
        </style>
    </head>
    <body>
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
                        <li><a style="text-decoration: none" href="contact.html">CONTACT</a></li>
                    </ul>
                </nav>
            </header>
            <?php
            $states_str = file_get_contents('./text/states.txt');
            $states_arr = explode(",", $states_str);
            ?>
            <form class = "container" action="response.php" method="post">
                <table width="300">
                    <tr>
                        <td><h1>Ordering Form</h1></td>
                    </tr>
                    <tr>
                        <td ><label>
                                <input type="radio" name="Products" value="Cookies" id="Cookies">
                                Cookies</label></td>
                    </tr>
                    <tr>
                        <td><label>
                                <input type="radio" name="Products" value="Bread" id="Bread">
                                Bread</label></td>
                    </tr>
                    <tr>
                        <td><label>
                                <input type="radio" name="Products" value="BirthdayCake" id="BirthdayCake">
                                Birthday Cake</label></td>
                    </tr>
                    <tr>
                        <td><label>
                                <input type="radio" name="Products" value="PartyBox" id="PartyBox">
                                Party Box</label>
                        </td>
                    </tr>
                    <tr><td>
                            <label>Name  <input type="text" id="Username" name="Username"></label>
                        </td></tr>
                    <tr><td>
                            <label for="Location">State </label>
                            <select id="Location" name="Location">
                                <option value="--">--</option>
                                <?php
                                for ($i = 0; $i < sizeof($states_arr); $i++) {
                                    print("<option value=" . $i . ">" . $states_arr[$i] . "</option>");
                                }
                                ?>
                            </select>
                        </td></tr>
                    <tr><td><br>
                            <input type="submit" value="Submit">
                        </td></tr>
                </table>
            </form>
            <br>
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

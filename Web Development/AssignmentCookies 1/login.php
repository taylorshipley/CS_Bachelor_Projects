<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product Form</title>
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
                <h1 class="title">Login</h1>
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
            <div>
                <p> If you do not have an account please <a style="text-decoration: none" href="NewAccount.php">create one here</a>!</p>
            </div>
                <div>
                    <form name="form1" method="post" action="logincheck.php" >
                        <table align = "center" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
                            <tr>
                                <td colspan="3"><strong>Member Login </strong></td>
                            </tr>
                            <tr>
                                <td width="78">Username</td>
                                <td width="6">:</td>
                                <td width="294"><input name="myusername" type="text" id="myusername" class="error"></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td>:</td>
                                <td><input name="mypassword" type="textarea" id="mypassword"></td>
                                <?php
                                if (isset($_SESSION['badPass'])) {
                                    echo "<br> Username or password do not match";
                                }
                                ?>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td><input type="submit" name="Submit" value="Login"></td>
                            </tr>
                        </table>
                    </form>
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

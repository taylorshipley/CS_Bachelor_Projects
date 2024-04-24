<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <title>Response</title>
        <style type="text/css">
            body {
                background-color: rgb(65,65,65);
            }
        </style>
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
            <h1>Response</h1>
            <?php
            //Creates an array of state locations from text file
            $servicearea_str = file_get_contents('./text/servicearea.txt');
            $servicearea_arr = explode(",", $servicearea_str);
            $states_str = file_get_contents('./text/states.txt');
            $states_arr = explode(",", $states_str);
            ?>
            <?php
            //Creates variables posted from form in productinfo.php
            $Product = $_POST['Products'];
            $Username = $_POST['Username'];
            $Location = $states_arr[$_POST['Location']];
            ?>
            <div class="container-fluid">

                <div>
                    <h4>Welcome to Craft Cookie Cottage
                        <?php
                        print($Username . "!</h4>");
                        ?>
                </div> 
                <div>
                    <h4>
                        <?php
                        $WithinRange = false;
                        for ($i = 0; $i < sizeof($servicearea_arr); $i++) {
                            if ($Location == $servicearea_arr[$i]) {
                                $WithinRange = true;
                            }
                        }
                        if ($WithinRange) {
                            print("Horray, " . $Location . " is within our service area!</h4>");
                        } else {
                            print("Sorry, " . $Location . " isn't within our service area.</h4>");
                        }
                        ?>
                </div>
                <div>
                    <h4>Selected Product: 
                        <?php
                        print($Product . "</h4>");
                        print("<img src='./img/$Product.jpg' alt='Image goes here'/");
                        ?>
                </div>
                <p>
                    <?php
                    switch ($Product) {
                        case Cookies:
                            Print("Cookies and Brownies- Share a homestyle cookie gift of delicious goodies made using only the finest ingredients."
                                    . "Whether you’re sending a cookie basket or box, any cookie delivery is a delightful surprise.</p>");
                            break;
                        case Bread:
                            Print("Breads and Pastries- Give a thoughtful gift of premium baked goods or gourmet bread. "
                                    . "Bread gifts and bakery treats are sure to brighten someone’s day.</p>");
                            break;
                        case BirthdayCake:
                            Print("Cakes and Pies- Sweeten every occasion with gourmet cakes, one-of-a-kind pies, and other indulgent treats.</p>");
                            break;
                        case PartyBox:
                            Print("Party Box- These are sampler boxes of a variety of cookies, cakes, or other treats that can be ordered for any occasion.</p>");
                            break;

                        default:
                            print("</p>");
                            break;
                    }
                    ?>
            </div>
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


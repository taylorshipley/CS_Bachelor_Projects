<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Client Form Page</title>
        <style type="text/css">
            body {
                background-color: rgb(65,65,65);
            }
        </style>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script>
            function validAccount() {
                var error = false;
                var nameExpression = /^[a-zA-Z]+$/;
                var emailExpression = /^\w + ([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                var passwordExpression = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
                var numberExpression = /^[0-9]/;
                console.log("Validating");
                document.getElementById('errorlog').innerHTML = "";
                if (document.getElementById("fname").value == "" ||
                        !document.getElementById("fname").value.match(nameExpression))
                {
                    console.log("Firstname has an error");
                    document.getElementById('errorlog').innerHTML += "<p><button type=\"button\" class=\"btn btn-danger\">Name issue</button></p>";
                    error = true;
                }
                if (document.getElementById("lname").value == "" ||
                        !document.getElementById("lname").value.match(nameExpression))
                {
                    console.log("Lastname has an error");
                    document.getElementById('errorlog').innerHTML += "<p><button type=\"button\" class=\"btn btn-danger\">Name issue</button></p>";
                    error = true;
                }
                if (document.getElementById("email").value == "" ||
                        emailExpression.test(document.getElementById("email").value))
                {
                    console.log("Email has error");
                    document.getElementById('errorlog').innerHTML += "<p><button type=\"button\" class=\"btn btn-danger\">Email issue</button></p>";
                    error = true;
                }

                if (document.getElementById("phone_1").value == "" ||
                        !numberExpression.test(document.getElementById("phone_1").value))
                {
                    console.log("Phone1 has error");
                    document.getElementById('errorlog').innerHTML += "<p><button type=\"button\" class=\"btn btn-danger\">Phone Number issue</button></p>";
                    error = true;
                }
                if (document.getElementById("phone_2").value == "" ||
                        !numberExpression.test(document.getElementById("phone_2").value))
                {
                    console.log("Phone2 has error");
                    document.getElementById('errorlog').innerHTML += "<p><button type=\"button\" class=\"btn btn-danger\">Phone Number issue</button></p>";
                    error = true;
                }
                if (document.getElementById("phone_3").value == "" ||
                        !numberExpression.test(document.getElementById("phone_3").value))
                {
                    console.log("Phone3 has error");
                    document.getElementById('errorlog').innerHTML += "<p><button type=\"button\" class=\"btn btn-danger\">Phone Number issue</button></p>";
                    error = true;
                }
                if (document.getElementById("pword").value == "" ||
                        !document.getElementById("pword").value.match(passwordExpression))
                {
                    console.log("Password");
                    document.getElementById('errorlog').innerHTML += "<p><button type=\"button\" class=\"btn btn-danger\">Password issue</button></p>";
                    error = true;
                }

                if (error == true)
                {
                    return false;
                }
            }
        </script>
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
            <form id="form_11683" class="appnitro"  method="post" action="completed.php">
                <div class="form_description">
                    <h2>New Client</h2>
                    <p>Sign up for our services</p>
                </div>						
                <ul style="list-style: none; margin: 0; padding: 0;">
                    <li id="li_1" >
                        <label class="description" for="fname">First Name
                        </label>
                        <div>
                            <input id="fname" name="fname" class="element text medium" type="text" maxlength="255" value="" required=""/> 
                        </div> 
                    </li>		
                    <li id="li_2" >
                        <label class="description" for="lname">Last Name
                        </label>
                        <div>
                            <input id="lname" name="lname" class="element text medium" type="text" maxlength="255" value="" required=""/> 
                        </div> 
                    </li>		
                    <li id="li_3" >
                        <label class="description" for="email">E-mail
                        </label>
                        <div>
                            <input id="email" name="email" class="element text medium" type="text" maxlength="255" value="" required=""/> 
                        </div> 
                    </li>		
                    <li id="li_5" >
                        <label class="description" for="pword">Password
                        </label>
                        <div>
                            <input id="pword" name="pword" class="element text medium" type="text" maxlength="255" value="" required=""/> 
                        </div> 
                    </li>	
                    <li id="li_4" >
                        <label class="description" for="phone">Phone </label>
                        <span>
                            <input id="phone_1" name="phone_1" class="element text" size="3" maxlength="3" value="" type="text" required=""> -
                            <label for="phone_1">(###) </label>
                        </span>
                        <span>
                            <input id="phone_2" name="phone_2" class="element text" size="3" maxlength="3" value="" type="text" required=""> -
                            <label for="phone_2">###</label>
                        </span>
                        <span>
                            <input id="phone_3" name="phone_3" class="element text" size="4" maxlength="4" value="" type="text" required="">
                            <label for="phone_3">####</label>
                        </span>
                    </li>
                    <li id="li_6" >
                        <label class="description" for="address">Street Address</label>
                        <div>
                            <input id="address" name="address" class="element text medium" type="text" maxlength="255" value="" required=""/> 
                        </div> 
                    </li>		
                    <li id="li_7" >
                        <label class="description" for="city">City</label>
                        <div>
                            <input id="city" name="city" class="element text medium" type="text" maxlength="255" value="" required=""/> 
                        </div> 
                    </li>		
                    <li id="li_10" >
                        <label class="description" for="state">State</label>
                        <div>
                            <select class="element select medium" id="state" name="state" required=""> 
                                <option value="AL">Alabama</option>
                                <option value="AK">Alaska</option>
                                <option value="AZ">Arizona</option>
                                <option value="CA">California</option>
                                <option value="CO">Colorado</option>
                                <option value="ID">Idaho</option>
                                <option value="MT">Montana</option>
                                <option value="NV">Nevada</option>
                                <option value="NM">New Mexico</option>
                                <option value="OR">Oregon</option>
                                <option value="UT">Utah</option>
                                <option value="WA">Washington</option>
                                <option value="WY">Wyoming</option>
                            </select>
                        </div> 
                    </li>		
                    <li id="li_8" >
                        <label class="description" for="zip">Zip Code</label>
                        <div>
                            <input id="zip" name="zip" class="element text medium" type="text" maxlength="255" value="" required=""/> 
                        </div> 
                    </li>		
                    <li id="li_9" >
                        <label class="description" for="bday">Birthday</label>
                        <span>
                            <input id="bday_1" name="month" class="element text" size="2" maxlength="2" value="" type="text" required=""> /
                            <label for="bday_1">MM</label>
                        </span>
                        <span>
                            <input id="bday_2" name="day" class="element text" size="2" maxlength="2" value="" type="text" required=""> /
                            <label for="bday_2">DD</label>
                        </span>
                        <span>
                            <input id="bday_3" name="year" class="element text" size="4" maxlength="4" value="" type="text" required="">
                            <label for="bday_3">YYYY</label>
                        </span>
                    </li>
                    <li class="buttons">
                        <input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" onclick="return validAccount();">
                    </li>
                </ul>
            </form>
            <div id='errorlog'>
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

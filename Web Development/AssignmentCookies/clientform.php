<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Client Form Page</title>
    </head>
    <body>
        <form id="form_11683" class="appnitro"  method="post" action="completed.php">
            <div class="form_description">
                <h2>New Client</h2>
                <p>Sign up for our services</p>
            </div>						
            <ul >

                <li id="li_1" >
                    <label class="description" for="fname">First Name
                    </label>
                    <div>
                        <input id="fname" name="fname" class="element text medium" type="text" maxlength="255" value=""/> 
                    </div> 
                </li>		
                <li id="li_2" >
                    <label class="description" for="lname">Last Name
                    </label>
                    <div>
                        <input id="lname" name="lname" class="element text medium" type="text" maxlength="255" value=""/> 
                    </div> 
                </li>		
                <li id="li_3" >
                    <label class="description" for="email">E-mail
                    </label>
                    <div>
                        <input id="email" name="email" class="element text medium" type="text" maxlength="255" value=""/> 
                    </div> 
                </li>		
                <li id="li_5" >
                    <label class="description" for="pword">Password
                    </label>
                    <div>
                        <input id="pword" name="pword" class="element text medium" type="text" maxlength="255" value=""/> 
                    </div> 
                </li>	
                <li id="li_4" >
                    <label class="description" for="phone">Phone </label>
                    <span>
                        <input id="phone_1" name="phone_1" class="element text" size="3" maxlength="3" value="" type="text"> -
                        <label for="phone_1">(###)</label>
                    </span>
                    <span>
                        <input id="phone_2" name="phone_2" class="element text" size="3" maxlength="3" value="" type="text"> -
                        <label for="phone_2">###</label>
                    </span>
                    <span>
                        <input id="phone_3" name="phone_3" class="element text" size="4" maxlength="4" value="" type="text">
                        <label for="phone_3">####</label>
                    </span>
                </li>
                <li id="li_6" >
                    <label class="description" for="address">Street Address</label>
                    <div>
                        <input id="address" name="address" class="element text medium" type="text" maxlength="255" value=""/> 
                    </div> 
                </li>		
                <li id="li_7" >
                    <label class="description" for="city">City</label>
                    <div>
                        <input id="city" name="city" class="element text medium" type="text" maxlength="255" value=""/> 
                    </div> 
                </li>		
                <li id="li_10" >
                    <label class="description" for="state">State </label>
                    <div>
                        <select class="element select medium" id="state" name="state"> 
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
                        <input id="zip" name="zip" class="element text medium" type="text" maxlength="255" value=""/> 
                    </div> 
                </li>		
                <li id="li_9" >
                    <label class="description" for="bday">Birthday</label>
                    <span>
                        <input id="bday_1" name="month" class="element text" size="2" maxlength="2" value="" type="text"> /
                        <label for="bday_1">MM</label>
                    </span>
                    <span>
                        <input id="bday_2" name="day" class="element text" size="2" maxlength="2" value="" type="text"> /
                        <label for="bday_2">DD</label>
                    </span>
                    <span>
                        <input id="bday_3" name="year" class="element text" size="4" maxlength="4" value="" type="text">
                        <label for="bday_3">YYYY</label>
                    </span>
                </li>
                <li class="buttons">
                    <input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />
                </li>
            </ul>
        </form>	
    </body>
</html>

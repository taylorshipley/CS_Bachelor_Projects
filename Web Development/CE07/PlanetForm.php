<!DOCTYPE html>
<?php
//get post and connect to DB
require_once 'DataBaseConnection.php';
//print_r($_POST);
$sneaky=$_POST['sneaky'];
$name=$_POST['PlanetName'];
$posx=$_POST['PosX'];
$posy=$_POST['PosY'];
$posz=$_POST['PosZ'];
$desc=$_POST['Desc'];
$faction=$_POST['Alignment'];
$action=$_POST['Action'];
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Planet Form</title>
        <!-- Custom fonts for this theme -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!--<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- Theme CSS -->
        <link href="../../../css/freelancer.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8"><header class="h2">Make a New Planet</header></div>
                <div class="col-sm-2"></div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    Planets currently in DB
                    <?php
                    //this should work if the database is connected properly
                    $search = "SELECT PlanetName FROM CSIS2440.Planets Order By PlanetName";

                    $return = $con->query($search);

                    if (!$return) {
                        $message = "Whole query " . $search;
                        echo $message;
                        die('Invalid query: ' . mysqli_error($con));
                    }
                    echo "<table><th>Name</th>";
                    while ($row = $return->fetch_assoc()) {
                        echo "<tr><td>" . $row['PlanetName'] . "</td></tr>";
                    }
                    echo "</table>";
                    ?>
                </div>
                <div class="col-sm-8">
                    <form method = "post" action = "PlanetForm.php" class="form-horizontal">
                        <div class="form-group">
                            <?php
                            if (isset($_POST['Submit']) || $sneaky == 1) {
                                //do the task we need to do using a switch
                                print("<fieldset>");
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
                                print<<<HTML
                                <!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="UnSubmit">Submit</label>
  <div class="col-md-4">
    <input id="submit" name="UnSubmit" class="btn btn-primary" type="submit"></input>
  </div>
</div>
    <input type='hidden' value=0 name='sneaky'></input></fieldset>
HTML;
                            } else {
                                //show the form
                                print <<<HTML
<fieldset>

<!-- Form Name -->
<legend>Planet Form</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="PlanetName">Planet Name</label>  
  <div class="col-md-4">
  <input id="PlanetName" name="PlanetName" type="text" placeholder="Earth" class="form-control input-md" required="">
  <span class="help-block">Name of the planets need to be unique</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="PosX">X Position</label>  
  <div class="col-md-4">
  <input id="PosX" name="PosX" type="text" placeholder="0" class="form-control input-md" required="">
  <span class="help-block">A positive integer</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="PosY">Y Position</label>  
  <div class="col-md-4">
  <input id="PosY" name="PosY" type="text" placeholder="0" class="form-control input-md" required="">
  <span class="help-block">Must Be a positive integer</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="PosZ">Z Position</label>  
  <div class="col-md-4">
  <input id="PosZ" name="PosZ" type="text" placeholder="0" class="form-control input-md" required="">
  <span class="help-block">Must be a positive integer</span>  
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Desc">Planet Description</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="Desc" name="Desc">A short description of the planet</textarea>
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Alignment">Faction Alignment</label>
  <div class="col-md-4">
    <select id="Alignment" name="Alignment" class="form-control">
      <option value="Alliance">Alliance</option>
      <option value="Pirates">Pirates</option>
      <option value="Rebels">Rebels</option>
      <option value="Imperial">Imperial</option>
      <option value="Free Worlds">Free Worlds</option>
    </select>
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Action">Select One</label>
  <div class="col-md-4">
    <select id="Action" name="Action" class="form-control">
      <option value="Search">Search</option>
      <option value="Insert">Add</option>
      <option value="Update">Update</option>
    </select>
  </div>
</div>
<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Submit">Submit</label>
  <div class="col-md-4">
    <input id="submit" name="Submit" class="btn btn-primary" type="submit"></input>
  </div>
</div>                                
<input type="hidden" value=1 name="sneaky"></input>
</fieldset>
HTML;
                            }
                            ?>
                        </div>
                    </form>
                    <div class="col-sm-2"></div>
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

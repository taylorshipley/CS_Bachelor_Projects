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
                <h1 class="title">Product Form</h1>
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
            <form method = "post" action = "results.php" class="form-horizontal">
                <div class="form-group">
                    <?php
                    print <<<HTML
                                   <fieldset>

<!-- Form Name -->
<legend>Product Form</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ProducttName">Product Name</label>  
  <div class="col-md-4">
  <input id="ProductsName" name="ProductsName" type="text" placeholder="Cake" class="form-control input-md" required=""> 
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ProductsPrice">Product Price $</label>  
  <div class="col-md-4">
  <input id="ProductsPrice" name="ProductsPrice" type="text" placeholder="0" class="form-control input-md">
  </div>
</div>


<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="ProductsDesc">Product Description</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="ProductsDesc" name="ProductsDesc" placeholder="A short description of the product"></textarea>
  </div>
</div>
<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="ProductsImage">Product Image</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="ProductsDesc" name="ProductsImage" placeholder= "URL of product image"></textarea>
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
</fieldset>
HTML;
                    ?>
                </div>
            </form>
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

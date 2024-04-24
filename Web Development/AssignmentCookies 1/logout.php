<?php
session_start();
session_destroy(); //Destroys all the variables associated with the session
header("Location:login.php");
?>
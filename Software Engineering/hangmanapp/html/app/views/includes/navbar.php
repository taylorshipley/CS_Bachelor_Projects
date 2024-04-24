<nav class="navbar navbar-expand-sm navbar-light bg-light">
    <div class="container">
        <a href="<?php echo URLROOT;?>" class="navbar-brand">Alex's Website</a>
        <ul class="navbar-nav ">
            <li class="nav-item">
                <a href="/Assignments/A1" class="nav-link">Assignment 1</a>
            </li>
            <li class="nav-item">
                <a href="/Assignments/A2" class="nav-link">Assignment 2</a>
            </li>
            <li class="nav-item">
                <a href="/Assignments/A3" class="nav-link">Assignment 3</a>
            </li>
            <li class="nav-item">
                <a href="/ECommerce/Login" class="nav-link">E-Commerce Site</a>
            </li>
            <li class="nav-item">
                <div class="dropdown">
                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Class Exercises
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="/Classexercises/CE01">CE01</a>
                        <a class="dropdown-item" href="/Classexercises/CE02">CE02</a>
                        <a class="dropdown-item" href="/Classexercises/CE03">CE03</a>
                        <a class="dropdown-item" href="/Classexercises/CE04">CE04</a>
                        <a class="dropdown-item" href="/Classexercises/CE06">CE06</a>
                        <a class="dropdown-item" href="/Classexercises/CE07">CE07</a>
                        <a class="dropdown-item" href="/Classexercises/CE08">CE08</a>
                        <a class="dropdown-item" href="/Classexercises/CE09">CE09</a>
                        <a class="dropdown-item" href="/Classexercises/CE10">CE10</a>
                        <a class="dropdown-item" href="/Classexercises/CE11">CE11</a>
                        <a class="dropdown-item" href="/Classexercises/CE12">CE12</a>
                        <a class="dropdown-item" href="/Classexercises/CE13">CE13</a>
                        <a class="dropdown-item" href="/Classexercises/CE14">CE14</a>
                    </div>
                </div>
            </li>
            <?php
            // Conditional logout button based on whatever the heck you're logged into.
            if(isset($_SESSION['CE08user'])){
                print '<li class="nav-item"><a href="/Classexercises/CE08/Logout"><button type="button" class="btn btn-secondary:wqg">Logout</button></li></a>';
            }
            if(isset($_SESSION['idUser'])){
                print '<li class="nav-item"><a href="/ECommerce/Logout"><button type="button" class="btn btn-primary:wqg">Logout</button></li></a>';
            }
            ?>

        </ul>
    </div>
</nav>
<br>
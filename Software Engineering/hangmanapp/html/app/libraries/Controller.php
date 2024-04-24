<?php
/**************************************
 * Master Controller Class
 * Loads models and views
 *************************************/
class Controller{
    // Load the model
    public function model($model){
        // Require model files
        if(file_exists('../app/models/' .$model. '.php')){
            require_once '../app/models/' .$model. '.php';
            return new $model();
        } else {
            die('Model not found');
        }


        // Instantiate the model which is what we'll use to connect to the database

    }

    // Load view
    public function view($view, $data = []){
        // Check for the view file
        if(file_exists('../app/views/'.$view.'.php')){
            require_once '../app/views/'.$view.'.php';
        } else {
            die("IT'S NOT REAL");
        }
    }
}
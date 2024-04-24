<?php
/*********************************************
 * App Core Class
 * Handles URLS and does other stuff
 * URL FORMAT - /controller/method/params
**********************************************/
class Core {
    protected $currentController = 'Pages';
    protected $currentMethod = 'index';
    protected $params = [];

    public function __construct()
    {
        // Create the Core Class
        $url = $this->getUrl();

        // Look in controllers for a controller
        if(file_exists('../app/controllers/' . ucwords($url[0]). '.php')){
            // set this URL's controller
            $this->currentController = ucwords($url[0]);
            // Unset the 0 Index
            unset($url[0]);
        }

        // pulls in the controller
        require_once '../app/controllers/' . $this -> currentController . '.php';

        // Instantiate the controller class, creates a new class defined by the name of the instance variable.
        $this->currentController = new $this->currentController;

        // Check the second chunk of the URL
        if(isset($url[1])){
            // see if there's a method in the controller
            if(method_exists($this->currentController, $url[1])){
                $this->currentMethod = $url[1];
                // Unset 1 index
                unset($url[1]);
            }
        }

        // Get parameters
        $this->params = $url ? array_values($url) : [];

        // Call a callback with array of params
        call_user_func_array([$this->currentController,
            $this->currentMethod], $this->params);

    }

    public function getUrl(){
        // if we have a URL
        if(isset($_GET['url'])){
            // Get the URL, filter and convert to array
            $url = rtrim($_GET['url'], '/');
            $url = filter_var($url, FILTER_SANITIZE_URL);
            $url = explode('/', $url);
            return $url;
        }
    }
}
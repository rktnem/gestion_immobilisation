<?php 

if(!function_exists("isRoute")) {

    function isRoute($pattern, $route) {
        $is = preg_match($pattern, $route);
        if($is === 1) {
            $response = "active";
        }
        else {
            $response = "";
        }
        return $response;
    }
}

?>
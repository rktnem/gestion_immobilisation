<?php 

if(!function_exists("formatPrix")) {

    function formatPrix($prix) {

        $prix_format = number_format($prix, 2, ',', ' ');

        return $prix_format;
    }

}

?>
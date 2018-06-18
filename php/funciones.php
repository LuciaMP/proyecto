<?php

    // Función en la que se inicia la sesión.
    function logueado() {

        // Iniciamos la sesión.
        session_start();

        // Si existe nick.
        if(isset($_SESSION['nick'])){

            // Hacemos un explode del nombre para obtener solo el nombre de usuario sin "@localhost".
            $nombre = explode('@',$_SESSION['nick']);

            // Llamamos a la función revelar y agregamos un mensaje de bienvenida.
            echo '<script>$(document).ready(function (){
                revelar();
                let aux = "<p id=log>Hola, '.$nombre[0].'</p>";
                $("#user_zona").append(aux);
            });</script>';
        } 
    }

?>
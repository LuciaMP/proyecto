<?php
    function logueado() {
       session_start();
        if(isset($_SESSION['nick'])){
            $nombre = explode('@',$_SESSION['nick']);
            echo '<script>$(document).ready(function (){
                revelar();
                let aux = "<p id=log>Hola, '.$nombre[0].'</p>";
                $("#user_zona").append(aux);
            });</script>';
        } 
    } 
?>
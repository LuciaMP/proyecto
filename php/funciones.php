<?php
    function logueado() {
       session_start();
        if(isset($_SESSION['nick'])){
            echo '<script>$(document).ready(function (){
                revelar();
                let aux = "<p id=log>'.$_SESSION["nick"].'</p>";
                $("#user_zona").append(aux);
            });</script>';
        } 
    } 
?>
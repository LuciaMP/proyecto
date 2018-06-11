<?php
    function logueado() {
       session_start();
        if(isset($_SESSION['nick'])){
            echo '<script>$(document).ready(function (){
                revelar();
                let aux = "<input type=text id=log hidden/>";
                $("head").append(aux);
            });</script>';
        } 
    } 
?>
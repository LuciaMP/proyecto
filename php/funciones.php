<?php
    function logueado() {
       session_start();
        if(isset($_SESSION['nick'])){
            echo '<script>$(document).ready(function (){
                ocultar();
            });</script>';
        } 
    }
    
?>
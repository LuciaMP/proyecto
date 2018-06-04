<?php
    session_start();
    if (isset($_SESSION['nick'])) {
        $usuario = $_SESSION['nick'];
        $idjuego = $_POST["idjuego"];
        $voto = $_POST["voto"];

        include('C:\xampp\seguridad\mysql.inc.php');
        mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

        $sql = "SELECT * FROM VOTACIONES WHERE IDUSUARIO = (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$usuario') AND IDJUEGO = '$idjuego'";
        $resultado = mysqli_query($conexion,$sql);
        if(mysqli_num_rows($resultado) == 0){
            $sql = "INSERT INTO VOTACIONES (IDUSUARIO, IDJUEGO) VALUES ((SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$usuario'), '$idjuego')";
            mysqli_query($conexion,$sql);

            $sql = "UPDATE JUEGOS SET VOTOS = VOTOS+1, PUNTUACION = PUNTUACION+'$voto', NOTA = PUNTUACION/VOTOS WHERE IDJUEGO = '$idjuego'";
            mysqli_query($conexion,$sql);
            if (mysqli_errno($conexion) == 0){
                echo 'Voto contabilizado.';
            }
            else {
                echo 'Error al votar. Error número: '.mysqli_errno($conexion).'.';
            }   
        }
        else{
            echo 'Ya has votado este juego.';
        }
    }
    else {
        echo "Debes iniciar sesión para poder votar.";
    }
?>
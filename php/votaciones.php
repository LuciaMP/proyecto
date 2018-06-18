<?php
    
    // Reanudamos la sesión.
    session_start();

    // Si existe nick.
    if (isset($_SESSION['nick'])) {

        // Recogemos los datos enviados.
        $usuario = $_SESSION['nick'];
        $idjuego = $_POST["idjuego"];
        $voto = $_POST["voto"];

        // Cadena de conexión.
        include('C:\xampp\seguridad\mysql.inc.php');
        mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

        // Creamos la sentencia seleccionando de la tabla VOTACIONES la votación que coincida con el IDUSUARIO e IDJUEGO para comprobar si ya ha votado ese juego.
        $sql = "SELECT * FROM VOTACIONES WHERE IDUSUARIO = (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$usuario') AND IDJUEGO = '$idjuego'";
        
        // Guardamos el resultado que devuelve la sentencia.
        $resultado = mysqli_query($conexion,$sql);

        // Si la sentencia devuelve 0 resultados, significa que no ha votado a ese juego.
        if(mysqli_num_rows($resultado) == 0){

            // Creamos la sentencia para insertar en la tabla VOTACIONES el IDUSUARIO y el IDJUEGO para llevar un recuento de los juegos que ha votado cada usuario.
            $sql = "INSERT INTO VOTACIONES (IDUSUARIO, IDJUEGO) VALUES ((SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$usuario'), '$idjuego')";
            
            // Ejecutamos la sentencia.
            mysqli_query($conexion,$sql);


            // Creamos la sentencia para modificar en la tabla JUEGOS el número de VOTOS, la PUNTUACION y la NOTA del juego que se está votando.
            $sql = "UPDATE JUEGOS SET VOTOS = VOTOS+1, PUNTUACION = PUNTUACION+'$voto', NOTA = PUNTUACION/VOTOS WHERE IDJUEGO = '$idjuego'";
            
            // Ejecutamos la sentencia.
            mysqli_query($conexion,$sql);

            // Si se ejecuta correctamente mostramos un mensaje indicándolo.
            if (mysqli_errno($conexion) == 0){
                echo 'Voto contabilizado.';
            }
            // Si no se ejecuta correctamente, mostramos un mensaje de error.
            else {
                echo 'Error al votar. Error número: '.mysqli_errno($conexion).'.';
            }   
        }
        // Si no, se indica que ya se ha votado.
        else{
            echo 'Ya has votado este juego.';
        }
    }
    // Si no existe, significa que no se ha iniciado sesión y se indica con un mensaje.
    else {
        echo "Debes iniciar sesión para poder votar.";
    }

    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
<?php

    // Recogemos los datos enviados.
    $idjuego = $_POST['id'];

    // Cadena de conexión.
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    // Creamos la sentencia para seleccionar los datos del juego de la tabla JUEGOS.
    $sql = "SELECT * FROM JUEGOS WHERE IDJUEGO = '$idjuego'";
    
    // Guardamos el resultado que devuelve la sentencia.
	$resultado = mysqli_query($conexion,$sql);

    // Creamos un objeto donde almacenaremos los datos del usuario.
    $datos = new stdClass();
    $registro = mysqli_fetch_assoc($resultado);
    $datos = $registro;
    
    // Devolvemos un objeto JSON.
    echo json_encode($datos);

    // Cerramos la conexión.
	mysqli_close($conexion);
    
?>
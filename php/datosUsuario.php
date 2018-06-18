<?php

    // Reanudamos la sesión.
    session_start();

    // Recogemos los datos enviados.
    $usuario = $_SESSION['nick'];

    // Cadena de conexión.
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    // Creamos la sentencia para seleccionar los datos del usuario de la tabla USUARIOS.
    $sql = "SELECT * FROM USUARIOS WHERE NICK = '$usuario'";

    // Guardamos el resultado que devuelve la sentencia.
    $resultado = mysqli_query($conexion,$sql) or die ('<p>Error al consultar la Tabla Usuarios.</p>');

    // Creamos un objeto donde almacenaremos los datos del usuario.
    $datos = new stdClass();
    $registro = mysqli_fetch_assoc($resultado);
    $datos = $registro;

    // Devolvemos un objeto JSON.
    echo json_encode($datos);

    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
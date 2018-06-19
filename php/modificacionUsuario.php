<?php

    // Recogemos los datos enviados.
    $nick = strtolower($_REQUEST['nick'])."@localhost";
	$password = $_REQUEST['password'];
	$correo = strtolower($_REQUEST['correo']);
	$sexo = strtolower($_REQUEST['sexo']);
	$ciudad = strtolower($_REQUEST['ciudad']);

    // Cadena de conexión.
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    // Creamos la sentencia para modificar las tabla USUARIOS con los datos del usuario.
    $sql = "UPDATE USUARIOS SET PASSWORD ='$password', EMAIL='$correo', SEXO ='$sexo', CIUDAD='$ciudad' WHERE NICK = '$nick'";

	// Ejecutamos la consulta.
    mysqli_query($conexion,$sql) or die('<p>Error al ejecutar sentencia SQL.</p>');

    // Si se ejecuta correctamente mostramos un mensaje indicando que se han modificado los datos.
    if (mysqli_errno($conexion) == 0) {
        echo 'Datos de usuario modificados con éxito.';
    }
    // Si no se ejecuta correctamente, mostramos un mensaje de error.
    else {
        echo '<p>Error al Modificar Registro. N# de error '.mysqli_errno($conexion).'</p>';
        echo '<p>Mensaje del Servidor: '.mysqli_error($conexion).'</p>';
	}
    
    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
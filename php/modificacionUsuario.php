<?php
    $nick = strtolower($_REQUEST['nick'])."@localhost";
	$password = $_REQUEST['password'];
	$correo = strtolower($_REQUEST['correo']);
	$sexo = strtolower($_REQUEST['sexo']);
	$ciudad = strtolower($_REQUEST['ciudad']);
    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
    //DEBO PREPARAR LOS TEXTOS QUE VOY A BUSCAR si la cadena existe 
    $sql = "UPDATE usuarios SET 'PASSWORD' ='$password', EMAIL='$correo', SEXO ='$sexo', CIUDAD='$ciudad' WHERE NICK = '$nick'";
	// Ejecutamos la consulta
    mysqli_query($conexion,$sql) or die('<p>Error al ejecutar sentencia SQL</p>');
    if (mysqli_errno($conexion)==0) {
        echo '<p>Registro Modificado';
    }
    else {
        echo '<p>Error al Modificar Registro. N# de error '.mysqli_errno($conexion).'</p>';
        echo '<p>Mensaje del Servidor: '.mysqli_error($conexion).'</p>';
	}
	mysqli_close($conexion);
?>
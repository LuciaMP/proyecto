<?php

	// Recogemos los datos enviados.
	$nick = strtolower($_REQUEST['nick']).'@localhost';
	$password = $_REQUEST['password'];

	// Cadena de conexión.
	include('C:\xampp\seguridad\mysql.inc.php');
	mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

	// Creamos la sentencia para seleccionar la contraseña del usuario.
	$sql = "SELECT PASSWORD FROM USUARIOS WHERE NICK = '$nick'";

	// Guardamos el resultado que devuelve la sentencia.
	$resultado = mysqli_query($conexion,$sql) or die ('<p>Error al consultar la Tabla de Usuarios.</p>');

	// Si la sentencia devuelve 0 resultados, el usuario es incorrecto y lo indicamos con un mensaje.
	if(mysqli_num_rows($resultado) == 0){
		echo '<script>
            alert("Usuario incorrecto.");
            window.location.href = "../html/estructura_login.html";
            </script>';
	}
	// Si no devuelve cero.
	else{
		// Guardamos el resultado como un array asociativo.
		$registro = mysqli_fetch_assoc($resultado);
		// Si la contraseña no coincide se lo indicaremos al usuario con un mensaje y le redirigiremos a la página de login.
		if($registro['PASSWORD'] != $password){
			echo '<script>
            alert("Contraseña incorrecta.");
            window.location.href = "../html/estructura_login.html";
            </script>';
		}
		// Si la contraseña coincide.
		else{
			// Iniciaremos y crearemos la sesión.
			session_start();
			session_name($nick);
			$_SESSION['nick'] = $nick;
			$_SESSION['password'] = $password;
			header('location:..\estructura_principal.html');
		}
	}
	
    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
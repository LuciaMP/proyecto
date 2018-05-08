<?php
	$nick = strtolower($_REQUEST['nick']).'@localhost';
	$password = $_REQUEST['password'];
	include('C:\xampp\seguridad\mysql.inc.php');
	mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
	$sql = "SELECT PASSWORD FROM USUARIOS WHERE NICK = '$nick'";
	$resultado = mysqli_query($conexion,$sql) or die ('<p>Error al consultar la Tabla de Usuarios.</p>');
	if(mysqli_num_rows($resultado) == 0){
		echo '<script>
            alert("Usuario incorrecto.");
            window.location.href = "../html/estructura_login.html";
            </script>';
	}
	else{
		$registro = mysqli_fetch_assoc($resultado);
		if($registro['PASSWORD'] != $password){
			echo '<script>
            alert("Contraseña incorrecta.");
            window.location.href = "../html/estructura_login.html";
            </script>';
		}
		else{
			session_start();
			session_name($nick);
			$_SESSION['nick'] = $nick;
			$_SESSION['password'] = $password;
			header('location:..\estructura_principal.html');
		}
	}
?>
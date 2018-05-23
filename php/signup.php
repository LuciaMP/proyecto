<?php
	$nick = strtolower($_REQUEST['nick'])."@localhost";
	$password = $_REQUEST['password'];
	$correo = strtolower($_REQUEST['correo']);
	$fechan = $_REQUEST['fechan'];
	$sexo = strtolower($_REQUEST['sexo']);
	$ciudad = strtolower($_REQUEST['ciudad']);
	include('c:\xampp\seguridad\mysql.inc.php');
	mysqli_select_db($conexion,'proyecto') or die('<p>Imposible conectar con Base de Datos.</p>');
	$sql = "SELECT * FROM USUARIOS WHERE NICK = '$nick'";
	$resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla USUARIOS.</p>');
	if (mysqli_num_rows($resultado) != 0) {
		echo '<script>
                alert("Ya existe el usuario '.strtolower($_REQUEST['nick']).'.");
                window.location.href = "../html/estructura_login.html";
                </script>';
	}
	else{
        $sql = "SELECT IFNULL(MAX(IDUSUARIO),0)+1 FROM USUARIOS";
        $resultado = mysqli_query($conexion,$sql);
        $registro = mysqli_fetch_array($resultado);
        $idusuario = $registro[0];
        $sql = "INSERT INTO USUARIOS VALUES ('$idusuario', '$nick', '$password', '$correo', '$fechan', '$sexo', '$ciudad')";
        mysqli_query($conexion,$sql);
        $sql = "CREATE USER ".$nick." IDENTIFIED BY '".$password."'";
        mysqli_query($conexion,$sql);
        if (mysqli_errno($conexion) == 0) {
            $sql = "GRANT PERMISOS_USUARIOS TO " .$nick;
            mysqli_query($conexion,$sql);
            $sql = "SET DEFAULT ROLE PERMISOS_USUARIOS FOR " .$nick;
            mysqli_query($conexion,$sql);
            if (mysqli_errno($conexion) == 0){
                echo '<script>
                    alert("Usuario '.strtolower($_REQUEST['nick']).' creado con éxito.");
                    window.location.href = "../html/estructura_login.html";
                    </script>';
            }
            else{
                echo '<script>
                    alert("Error al conceder privilegios.");
                    window.location.href = "../html/estructura_login.html";
                    </script>';
            }
        }
        else {
            echo '<script>
                alert("Error al crear el usuario. Error número: '.mysqli_errno($conexion).'");
                window.location.href = "../html/estructura_login.html";
                </script>';
        }	
    }

	// Cerramos la conexion.
	mysqli_close($conexion);
?>
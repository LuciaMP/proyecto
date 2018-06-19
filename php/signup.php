<?php

    // Recogemos los datos enviados.
	$nick = strtolower($_REQUEST['nick'])."@localhost";
	$password = $_REQUEST['password'];
	$correo = strtolower($_REQUEST['correo']);
	$fechan = $_REQUEST['fechan'];
	$sexo = strtolower($_REQUEST['sexo']);
	$ciudad = strtolower($_REQUEST['ciudad']);

    // Cadena de conexión.
	include('c:\xampp\seguridad\mysql.inc.php');
	mysqli_select_db($conexion,'proyecto') or die('<p>Imposible conectar con Base de Datos.</p>');

    // Creamos la sentencia para seleccionar de la tabla USUARIOS los datos del usuario.
	$sql = "SELECT * FROM USUARIOS WHERE NICK = '$nick'";

    // Guardamos el resultado que devuelve la sentencia.
	$resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla Usuarios.</p>');

    // Si la sentencia no devuelve 0 resultados, significa que el usuario ya existe, por lo tanto le redirigimos de nuevo a la página.
	if (mysqli_num_rows($resultado) != 0) {
		echo '<script>
                alert("Ya existe el usuario '.strtolower($_REQUEST['nick']).'.");
                window.location.href = "../html/estructura_login.html";
                </script>';
	}
    // Si no, procedemos a crear el usuario.
	else{
        // Creamos una sentencia para calcular el IDUSUARIO.
        $sql = "SELECT IFNULL(MAX(IDUSUARIO),0)+1 FROM USUARIOS";
        $resultado = mysqli_query($conexion,$sql);
        $registro = mysqli_fetch_array($resultado);

        // Almacenamos en una variable el nuevo IDUSUARIO.
        $idusuario = $registro[0];

        // Creamos una sentencia para insertar en la tabla USUARIOS el nuevo usuario.
        $sql = "INSERT INTO USUARIOS VALUES ('$idusuario', '$nick', '$password', '$correo', '$fechan', '$sexo', '$ciudad')";

        // Ejecutamos la sentencia.
        mysqli_query($conexion,$sql);

        // Creamos una sentencia para crear el usuario con su contraseña.
        $sql = "CREATE USER ".$nick." IDENTIFIED BY '".$password."'";

        // Ejecutamos la sentencia.
        mysqli_query($conexion,$sql);

        // Si se ejecuta correctamente seguimos con el procedimiento.
        if (mysqli_errno($conexion) == 0) {

            // Creamos una sentencia para otorgarle permisos.
            $sql = "GRANT PERMISOS_USUARIOS TO " .$nick;

            // Ejecutamos la sentencia.
            mysqli_query($conexion,$sql);

            // Creamos una sentencia para asignarle el role PERMISOS_USUARIOS al usuario.
            $sql = "SET DEFAULT ROLE PERMISOS_USUARIOS FOR " .$nick;
            
            // Ejecutamos la sentencia.
            mysqli_query($conexion,$sql);

             // Si se ejecuta correctamente el usuario se habrá creado correctamente y le redirigimos a la página de login.
            if (mysqli_errno($conexion) == 0){
                echo '<script>
                    alert("Usuario '.strtolower($_REQUEST['nick']).' creado con éxito.");
                    window.location.href = "../html/estructura_login.html";
                    </script>';
            }
            // Si no se ejecuta correctamente, se mostrará un mensaje y se redirigirá a la página.
            else{
                echo '<script>
                    alert("Error al conceder privilegios.");
                    window.location.href = "../html/estructura_login.html";
                    </script>';
            }
        }
        // Si no se ejecuta correctamente, se mostrará un mensaje y se redirigirá a la página.
        else {
            echo '<script>
                alert("Error al crear el usuario. Error número: '.mysqli_errno($conexion).'");
                window.location.href = "../html/estructura_login.html";
                </script>';
        }	
    }

    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
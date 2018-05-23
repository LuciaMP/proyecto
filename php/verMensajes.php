<?php
    session_start();
    $emisor = $_SESSION['nick'];
    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
	if(!isset($_POST['hilo'])){

        $sql = "SELECT * FROM MENSAJES WHERE EMISOR = (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$emisor') AND FECHA = (SELECT MAX(FECHA) FROM MENSAJES) GROUP BY HILO";
       
    	$resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla.</p>');

      	if(mysqli_num_rows($resultado) == 0){
            $datos[] = "No hay mensajes.";
        } 
        else{
            while ($registro = mysqli_fetch_assoc($resultado)) { 
                $datos[] = $registro;
            }
        }
    }
    else{
        $hilo = $_POST['hilo'];

        $sql = "SELECT * FROM MENSAJES WHERE HILO = '$hilo'";
       
        $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla.</p>');

        if(mysqli_num_rows($resultado) == 0){
            $datos[] = "No hay mensajes.";
        } 
        else{
            while ($registro = mysqli_fetch_assoc($resultado)) { 
                $datos[] = $registro;
            }
        }
    }

    echo json_encode($datos);

	mysqli_close($conexion);
?>
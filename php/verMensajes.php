<?php
    session_start();
    $usuario = $_SESSION['nick'];
    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
	if(!isset($_POST['hilo'])){

        $sql = "SELECT IDMENSAJE,ASUNTO,(SELECT DISTINCT USUARIOS.NICK FROM USUARIOS,MENSAJES WHERE USUARIOS.IDUSUARIO=MENSAJES.EMISOR) AS EMISOR,(SELECT DISTINCT USUARIOS.NICK FROM USUARIOS,MENSAJES WHERE USUARIOS.IDUSUARIO=MENSAJES.RECEPTOR) AS RECEPTOR,MENSAJE,HILO,DATE_FORMAT(FECHA, '%d-%m-%Y') AS FECHA FROM MENSAJES WHERE EMISOR = (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$usuario') OR RECEPTOR = (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$usuario') GROUP BY HILO ORDER BY FECHA DESC";
       
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

        $sql = "SELECT IDMENSAJE,ASUNTO,(SELECT DISTINCT USUARIOS.NICK FROM USUARIOS,MENSAJES WHERE USUARIOS.IDUSUARIO=MENSAJES.EMISOR) AS EMISOR,(SELECT DISTINCT USUARIOS.NICK FROM USUARIOS,MENSAJES WHERE USUARIOS.IDUSUARIO=MENSAJES.RECEPTOR) AS RECEPTOR,MENSAJE,HILO,DATE_FORMAT(FECHA, '%d-%m-%Y') AS FECHA FROM MENSAJES WHERE HILO = '$hilo' ORDER BY FECHA DESC";
       
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
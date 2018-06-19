<?php

    // Reanudamos la sesión.
    session_start();

    // Recogemos los datos enviados.
    $usuario = $_SESSION['nick'];

    // Cadena de conexión.
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') OR DIE ('<p>Imposible conectar con la Base de Datos.</p>');

    // Si no existe hilo.
	if(!isset($_POST['hilo'])){

        // Creamos la sentencia para seleccionar de la tabla MENSAJES las conversaciones ("hilos") en las que aparezca el usuario, siendo tanto emisor como receptor, agrupados por el hilo y ordenados por fecha descendentemente.
        $sql = "SELECT IDMENSAJE,ASUNTO,(SELECT NICK FROM USUARIOS WHERE USUARIOS.IDUSUARIO = MENSAJES.EMISOR) AS EMISOR,(SELECT NICK FROM USUARIOS WHERE USUARIOS.IDUSUARIO=MENSAJES.RECEPTOR != '$usuario') AS RECEPTOR,MENSAJE,HILO,DATE_FORMAT(FECHA, '%d-%m-%Y %H:%i') AS FECHA FROM MENSAJES WHERE EMISOR = (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$usuario') OR RECEPTOR = (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$usuario') GROUP BY HILO ORDER BY FECHA DESC";
           
        // Guardamos el resultado que devuelve la sentencia.
    	$resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla Mensajes.</p>');

        // Si la sentencia devuelve 0 resultados, indicamos que no hay ningún mensaje.
      	if(mysqli_num_rows($resultado) == 0){
            $datos[] = "No hay mensajes.";
        } 
        // Si no devuelve 0, almacenamos las conversaciones ("hilos") en un array.
        else{
            while ($registro = mysqli_fetch_assoc($resultado)) { 
                $datos[] = $registro;
            }
        }
    }
    // Si existe hilo.
    else{
        
        // Recogemos los datos enviados.
        $hilo = $_POST['hilo'];

        // Creamos la sentencia para seleccionar de la tabla MENSAJES los mensajes del mismo hilo ordenados por fecha.
        $sql = "SELECT IDMENSAJE,ASUNTO,(SELECT NICK FROM USUARIOS WHERE USUARIOS.IDUSUARIO = MENSAJES.EMISOR) AS EMISOR,(SELECT NICK FROM USUARIOS WHERE USUARIOS.IDUSUARIO=MENSAJES.RECEPTOR != '$usuario') AS RECEPTOR,MENSAJE,HILO,DATE_FORMAT(FECHA, '%d-%m-%Y %H:%i') AS FECHA FROM MENSAJES WHERE HILO = '$hilo' ORDER BY FECHA";
        
        // Guardamos el resultado que devuelve la sentencia.
        $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla Mensajes.</p>');

        // Si la sentencia devuelve 0 resultados, indicamos que no hay ningún mensaje.
        if(mysqli_num_rows($resultado) == 0){
            $datos[] = "No hay mensajes.";
        } 
        // Si no devuelve 0, almacenamos los mensajes en un array.
        else{
            while ($registro = mysqli_fetch_assoc($resultado)) { 
                $datos[] = $registro;
            }
        }
    }

    // Devolvemos un objeto JSON.
    echo json_encode($datos);

    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
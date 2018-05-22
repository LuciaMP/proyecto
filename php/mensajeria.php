<?php
    session_start();
    $emisor = $_SESSION['nick'];
    $receptor = $_REQUEST['receptor'];
    $asunto = $_REQUEST['asunto'];
    $mensaje = $_REQUEST['mensaje'];
    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
    
    $sql = "SELECT IFNULL(MAX(IDMENSAJE),0)+1 FROM MENSAJES";
    $resultado = mysqli_query($conexion,$sql);
    $registro = mysqli_fetch_array($resultado);
    $idmensaje = $registro[0];
    echo $idmensaje;
    echo $asunto;
    echo $emisor;
    echo $receptor;
    echo $mensaje;

    $sql = "INSERT INTO MENSAJES VALUES ('$idmensaje', '$asunto', (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$emisor'), (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$receptor'), '$mensaje')";
    mysqli_query($conexion,$sql) or die('<p>Error al ejecutar sentencia SQL</p>');
    if (mysqli_errno($conexion)==0) {
        echo '<script>
                alert("El mensaje se envio exitosamente a '.$_REQUEST['receptor'].');
                window.location.href = "../html/estructura_mensajes.html";
                </script>';
    }
    else {
        echo '<script>
                alert("Error al enviar el mensaje. Error número: '.mysqli_errno($conexion).'");
                window.location.href = "../html/estructura_mensajes.html";
                </script>';
	}
	mysqli_close($conexion);
?>
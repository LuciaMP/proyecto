<?php
    session_start();
    $emisor = $_SESSION['nick'];
    $receptor = $_POST['receptor']."@localhost";
    $asunto = $_POST['asunto'];
    $mensaje = $_POST['mensaje'];

    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
    
    if(!isset($_POST['hilo'])){
        $sql = "SELECT IFNULL(MAX(IDMENSAJE),0)+1 FROM MENSAJES";
        $resultado = mysqli_query($conexion,$sql);
        $registro = mysqli_fetch_array($resultado);
        $idmensaje = $registro[0];

        $sql = "SELECT IFNULL(MAX(HILO),0)+1 FROM MENSAJES";
        $resultado = mysqli_query($conexion,$sql);
        $registro = mysqli_fetch_array($resultado);
        $hilo = $registro[0];

        $sql = "INSERT INTO MENSAJES VALUES ('$idmensaje', '$asunto', (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$emisor'), (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$receptor'), '$mensaje', '$hilo', CURDATE())";
        mysqli_query($conexion,$sql);
        if (mysqli_errno($conexion) == 0){
            echo '<script>
                alert("El mensaje se envió exitosamente a '.$receptor.'.");
                window.location.href = "../html/estructura_mensajes.html";
                </script>';
        }
        else {
            echo '<script>
                alert("Error al enviar el mensaje. Error número: '.mysqli_errno($conexion).'");
                window.location.href = "../html/estructura_mensajes.html";
                </script>';
        }   
    }
    else{
        $hilo = $_POST['hilo'];

        $sql = "INSERT INTO MENSAJES VALUES ('$idmensaje', '$asunto', (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$emisor'), (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$receptor'), '$mensaje', '$hilo', CURDATE())";


    }
	mysqli_close($conexion);
?>
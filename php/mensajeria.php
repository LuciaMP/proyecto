<?php
    session_start();
    $emisor = $_SESSION['nick'];
    $mensaje = $_POST['mensaje'];

    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
    

    if(!isset($_POST['hilo'])){
        $receptor = $_POST['receptor']."@localhost";
        $asunto = $_POST['asunto'];

        $sql = "SELECT IFNULL(MAX(HILO),0)+1 FROM MENSAJES";
        $resultado = mysqli_query($conexion,$sql);
        $registro = mysqli_fetch_array($resultado);
        $hilo = $registro[0];

        $sql = "INSERT INTO MENSAJES (ASUNTO, EMISOR, RECEPTOR, MENSAJE, HILO, FECHA) VALUES ('$asunto', (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$emisor'), (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$receptor'), '$mensaje', '$hilo', CURDATE())";
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

        $sql = "INSERT INTO MENSAJES (ASUNTO, EMISOR, RECEPTOR, MENSAJE, HILO, FECHA) SELECT ASUNTO, EMISOR, RECEPTOR, '$mensaje', '$hilo', CURDATE() FROM MENSAJES WHERE HILO = '$hilo'";

        mysqli_query($conexion,$sql);
        if (mysqli_errno($conexion) == 0){
            echo '<script>
                alert("El mensaje se envió exitosamente.");
                window.location.href = "../html/estructura_mensajes.html";
                </script>';
            //echo $hilo;
        }
        else {
            echo '<script>
                alert("Error al enviar el mensaje. Error número: '.mysqli_errno($conexion).'");
                window.location.href = "../html/estructura_mensajes.html";
                </script>';
        }   
    }
	mysqli_close($conexion);
?>
<?php

    // Reanudamos la sesión.
    session_start();

    // Recogemos los datos enviados.
    $emisor = $_SESSION['nick'];
    $mensaje = $_POST['mensaje'];

    // Cadena de conexión.
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
    
    // Si no existe hilo.
    if(!isset($_POST['hilo'])){
        // Recogemos los datos enviados.        
        $receptor = $_POST['receptor']."@localhost";
        $asunto = $_POST['asunto'];

        // Creamos una sentencia para calcular el HILO.
        $sql = "SELECT IFNULL(MAX(HILO),0)+1 FROM MENSAJES";
        $resultado = mysqli_query($conexion,$sql);
        $registro = mysqli_fetch_array($resultado);

        // Almacenamos en una variable el nuevo HILO.
        $hilo = $registro[0];

        // Creamos una sentencia para insertar en la tabla MENSAJES el nuevo mensaje.
        $sql = "INSERT INTO MENSAJES (ASUNTO, EMISOR, RECEPTOR, MENSAJE, HILO, FECHA) VALUES ('$asunto', (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$emisor'), (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$receptor'), '$mensaje', '$hilo', NOW())";

        // Ejecutamos la sentencia.
        mysqli_query($conexion,$sql);

        // Si se ejecuta correctamente indicamos que se ha inviado el mensaje.
        if (mysqli_errno($conexion) == 0){
            echo 'El mensaje se envió exitosamente a '.$_POST['receptor'].'.';
        }
        else {
            // Si el número de error es 1048, es que el usuario al que se ha enviado el mensaje no existe, por lo que lo indicaremos con un mensaje.
            if(mysqli_errno($conexion) == 1048){
                echo 'Error al enviar el mensaje. El usuario no existe.';
            }
            // Si no se ejecuta correctamente, mostramos un mensaje de error.
            else{
                echo 'Error al enviar el mensaje. Error número: '.mysqli_errno($conexion).'.';
            }
        }   
    }
    // Si existe hilo.
    else{
        // Recogemos los datos enviados.
        $hilo = $_POST['hilo'];

        // Creamos una sentencia para comprobar si hay otro emisor distinto del que inició el hilo de mensajes.
        $sql = "SELECT DISTINCT EMISOR FROM MENSAJES WHERE EMISOR != (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$emisor') AND HILO = '$hilo'";

        // Guardamos el resultado que devuelve la sentencia.
        $resultado = mysqli_query($conexion,$sql);
        
        // Si la sentencia devuelve 0 resultados, significa que no hay otro emisor distinto al que inicio el hilo de mensajes.
        if(mysqli_num_rows($resultado) == 0){
            // Creamos una sentencia para insertar en la tabla MENSAJES un nuevo mensaje en el mismo hilo, en el que el emisor será el mismo que inició el hilo y el receptor será distinto al emisor.
            $sql = "INSERT INTO MENSAJES (ASUNTO, EMISOR, RECEPTOR, MENSAJE, HILO, FECHA) SELECT DISTINCT ASUNTO, (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$emisor') AS EMISOR, (SELECT DISTINCT RECEPTOR FROM MENSAJES WHERE HILO = '$hilo') AS RECEPTOR, '$mensaje', '$hilo', NOW() FROM MENSAJES WHERE HILO = '$hilo'";
        } 
        // Si no devuelve cero.
        else{
            // Creamos una sentencia para insertar en la tabla MENSAJES un nuevo mensaje en el mismo hilo, en el que el emisor será el usuario que manda el mensaje y el receptor será el otro usuario que pertenece al hilo y es distinto al emisor.
            $sql = "INSERT INTO MENSAJES (ASUNTO, EMISOR, RECEPTOR, MENSAJE, HILO, FECHA) SELECT DISTINCT ASUNTO, (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$emisor') AS EMISOR, (SELECT DISTINCT EMISOR FROM MENSAJES WHERE EMISOR != (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$emisor') AND HILO = '$hilo') AS RECEPTOR, '$mensaje', '$hilo', NOW() FROM MENSAJES WHERE HILO = '$hilo'";
        }

        // Ejecutamos la sentencia.
        mysqli_query($conexion,$sql);

        // Si se ejecuta correctamente indicamos que se ha inviado el mensaje.
        if (mysqli_errno($conexion) == 0){
            echo 'El mensaje se envió exitosamente.';
        }
        // Si no se ejecuta correctamente, mostramos un mensaje de error.
        else {
            echo 'Error al enviar el mensaje. Error número: '.mysqli_errno($conexion).'.';
        }   
    }

    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
<?php
    
    // Reanudamos la sesión.
    session_start();

    // Recogemos los datos enviados.
    $usuario = $_SESSION['nick'];
    $comentario = $_POST['nuevo_comentario'];
    $idjuego = $_POST['id'];

    // Cadena de conexión.
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    // Creamos la sentencia para insertar en la tabla COMENTARIOS el nuevo comentario.
    $sql = "INSERT INTO COMENTARIOS (IDJUEGO, IDUSUARIO, COMENTARIO, FECHA) VALUES ('$idjuego', (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$usuario'), '$comentario', NOW())";

    // Ejecutamos la sentencia.
    mysqli_query($conexion,$sql);

    // Si se ejecuta correctamente mostramos un mensaje indicándolo.
    if (mysqli_errno($conexion) == 0){
        echo 'El comentario se publicó correctamente.';
    }
    // Si no se ejecuta correctamente, mostramos un mensaje de error.
    else {
        echo 'Error al publicar el comentario. Error número: '.mysqli_errno($conexion).'.';
    }   
    
    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
<?php
    session_start();
    $usuario = $_SESSION['nick'];
    $comentario = $_POST['nuevo_comentario'];
    $idjuego = $_POST['id'];

    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    $sql = "INSERT INTO COMENTARIOS (IDJUEGO, IDUSUARIO, COMENTARIO, FECHA) VALUES ('$idjuego', (SELECT IDUSUARIO FROM USUARIOS WHERE NICK = '$usuario'), '$comentario', CURDATE())";

    mysqli_query($conexion,$sql);
    if (mysqli_errno($conexion) == 0){
        echo 'El comentario se publicó correctamente.';
    }
    else {
        echo 'Error al publicar el comentario. Error número: '.mysqli_errno($conexion).'.';
    }   
    
	mysqli_close($conexion);
?>
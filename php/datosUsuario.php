<?php
    session_start();
    $usuario = $_SESSION['nick'];
    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
    //DEBO PREPARAR LOS TEXTOS QUE VOY A BUSCAR si la cadena existe 
    $sql = "SELECT * FROM USUARIOS WHERE NICK = '$usuario'";
    $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla juegos.</p>');
    $datos = new stdClass();
    $registro = mysqli_fetch_assoc($resultado);
    $datos = $registro;
    echo json_encode($datos);
?>
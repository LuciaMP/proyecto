<?php
    $idjuego = $_POST['id'];

    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    $sql = "SELECT * FROM JUEGOS WHERE IDJUEGO = '$idjuego'";
       
	$resultado = mysqli_query($conexion,$sql);
    $datos = new stdClass();
    $registro = mysqli_fetch_assoc($resultado);
    $datos = $registro;
    
    echo json_encode($datos);

	mysqli_close($conexion);
?>
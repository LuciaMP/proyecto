<?php 
    $busqueda = $_POST["buscador"];
    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
    //DEBO PREPARAR LOS TEXTOS QUE VOY A BUSCAR si la cadena existe 
    if ($busqueda != ''){ 
        $sql = "SELECT NOMBRE FROM JUEGOS WHERE NOMBRE LIKE '%$busqueda%' LIMIT 20";
        $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla juegos.</p>'); 
        $datos = array();
        while ($registro = mysqli_fetch_assoc($resultado)) { 
            //Mostramos los titulos de los juegos o lo que deseemos... 
            $datos[] = $registro["NOMBRE"];
        }
        echo json_encode($datos);
    }
?>
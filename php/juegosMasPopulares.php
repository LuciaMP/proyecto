<?php 
    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    $sql = "SELECT * FROM JUEGOS ORDER BY NOTA DESC LIMIT 5";
    $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla.</p>');
    $datos = array();
    if(mysqli_num_rows($resultado) == 0){
        $datos[] = "No se han encontrado coincidencias.";
    } 
    else{
        while ($registro = mysqli_fetch_assoc($resultado)) { 
            $datos[] = $registro;
        }
    }
    echo json_encode($datos);
    
?>
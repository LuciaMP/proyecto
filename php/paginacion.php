<?php
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    $tamanio_paginas = 3;

    if(isset($_POST["pagina"])){
        $pagina = $_POST["pagina"];
    }
    else{
        $pagina = 1;
    }

    $empezar_desde = ($pagina-1)*$tamanio_paginas;

    $sql = "SELECT NOMBRE FROM JUEGOS";
    
    $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla juegos.</p>');

    $num_filas = mysqli_num_rows($resultado);

    $total_paginas = ceil($num_filas/$tamanio_paginas);

    $sql = "SELECT NOMBRE FROM JUEGOS LIMIT $empezar_desde, $tamanio_paginas";

    $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla juegos.</p>');

    $datos = array(); 

    $datos['paginas'] = array();
    $datos['juegos'] = array();

    for($i = 1; $i <= $total_paginas; $i++){
        $datos['paginas'][] = "<button value='". $i . "'>" . $i . "</button>";
    }

    if(mysqli_num_rows($resultado) == 0){
        $datos['juegos'][] = "No se han encontrado coincidencias.";
    } 
    else{
        while ($registro = mysqli_fetch_assoc($resultado)) { 
            $datos['juegos'][] = $registro["NOMBRE"];
        }
    }

    echo json_encode($datos);
?>
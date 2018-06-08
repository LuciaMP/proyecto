<?php
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    $tamanio_paginas = 3;

    $tabla = $_POST["tabla"];

    if(isset($_POST["pagina"])){
        $pagina = $_POST["pagina"];
    }
    else{
        $pagina = 1;
    }

    $empezar_desde = ($pagina-1)*$tamanio_paginas;
    $sql = "SELECT * FROM $tabla";
    $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla.</p>');
    $datos = array();
    $datos['datos'] = array();
    if ($pagina == 0) {
        while ($registro = mysqli_fetch_assoc($resultado)) { 
            $datos['datos'][] = $registro;
        }
    }
    else {

        $num_filas = mysqli_num_rows($resultado);

        $total_paginas = ceil($num_filas/$tamanio_paginas);

        $sql = "SELECT * FROM $tabla LIMIT $empezar_desde, $tamanio_paginas";

        $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla.</p>');
 

        $datos['paginas'] = array();

        for($i = 1; $i <= $total_paginas; $i++){
            $datos['paginas'][] = "<button value='". $i . "'>" . $i . "</button>";
        }

        if(mysqli_num_rows($resultado) == 0){
            $datos['datos'][] = "No hay datos.";
        } 
        else{
            while ($registro = mysqli_fetch_assoc($resultado)) { 
                $datos['datos'][] = $registro;
            }
        }
    }
    

    echo json_encode($datos);
?>
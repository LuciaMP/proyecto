<?php

    // Cadena de conexión.
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    // Definimos una variable con el tamaño de las páginas.
    $tamanio_paginas = 4;

    // Recogemos los datos enviados.
    $tabla = $_POST["tabla"];

    // Si existe pagina.
    if(isset($_POST["pagina"])){
        // Almacenamos en una variable la 'pagina'.
        $pagina = $_POST["pagina"];
    }
    // Si no existe pagina.
    else{
        // Almacenamos en una variable la pagina como 1 por defecto.
        $pagina = 1;
    }

    // Almacenamos en una variable desde donde debe empezar el límite.
    $empezar_desde = ($pagina-1)*$tamanio_paginas;

    // Creamos una sentencia seleccionando los datos de la tabla. 
    $sql = "SELECT * FROM $tabla";

    // Guardamos el resultado que devuelve la sentencia.
    $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla.</p>');

    // Creamos un array en el que almacenaremos los datos de los juegos.
    $datos = array();

    // Creamos dentro del array otro array en el que guardaremos los datos.
    $datos['datos'] = array();

    // Si la página es igual a 0.
    if ($pagina == 0) {
        // Guardamos dentro del array los datos de la sentencia.
        while ($registro = mysqli_fetch_assoc($resultado)) { 
            $datos['datos'][] = $registro;
        }
    }
    else {
        // Almacenamos en una variable el número de filas (registros).
        $num_filas = mysqli_num_rows($resultado);

        // Almacenamos en una variable el número total de páginas (utilizando la función ceil para redondear el resultado).
        $total_paginas = ceil($num_filas/$tamanio_paginas);

        // Creamos una sentencia seleccionando de la tabla los datos con el límite desde $empezar_desde hasta $tamanio_paginas.
        $sql = "SELECT * FROM $tabla LIMIT $empezar_desde, $tamanio_paginas";

        // Guardamos el resultado que devuelve la sentencia.
        $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla.</p>');
 
        // Creamos dentro del array otro array en el que guardaremos las páginas.
        $datos['paginas'] = array();

        // Guardamos dentro del array las páginas.
        for($i = 1; $i <= $total_paginas; $i++){
            $datos['paginas'][] = "<button value='". $i . "'>" . $i . "</button>";
        }

        // Si la sentencia devuelve 0 resultados, indicamos que no hay datos.
        if(mysqli_num_rows($resultado) == 0){
            $datos['datos'][] = "No hay datos.";
        }
        // Si no devuelve 0, almacenamos los datos en el array.
        else{
            while ($registro = mysqli_fetch_assoc($resultado)) { 
                $datos['datos'][] = $registro;
            }
        }
    }
    
    // Devolvemos un objeto JSON.
    echo json_encode($datos);
    
    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
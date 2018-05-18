<?php
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    $tamanio_paginas = 3;

    if(isset($_GET["pagina"])){
        if($_GET["pagina"] == 1){
            header("Location:paginacion.php");
        }
        else{
            $pagina = $_GET["pagina"];
        }
    }
    else{
        $pagina = 1;
    }

    $empezar_desde = ($pagina-1)*$tamanio_paginas;

    $sql = "SELECT NOMBRE FROM JUEGOS";
    
    $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla juegos.</p>');

    $num_filas = mysqli_num_rows($resultado);

    $total_paginas = ceil($num_filas/$tamanio_paginas);

    echo "Número de registros de la consulta: ".$num_filas."<br>";
    echo "Mostramos ".$tamanio_paginas." registro por página <br>";
    echo "Mostrando la página ".$pagina." de ".$total_paginas."<br>";

    $sql = "SELECT NOMBRE FROM JUEGOS LIMIT $empezar_desde, $tamanio_paginas";

    $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla juegos.</p>');

    while($registro = mysqli_fetch_assoc($resultado)){
        echo $registro['NOMBRE'].'<br>';
    }

    for($i = 1; $i <= $total_paginas; $i++){
        echo "<a href='?pagina=" . $i . "'>" . $i . "</a> ";
    }
?>
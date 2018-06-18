<?php 
    // Cadena de conexión.
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    // Creamos la sentencia para seleccionar los juegos ordenados por nota descendentemente con un límite de 5.
    $sql = "SELECT * FROM JUEGOS ORDER BY NOTA DESC LIMIT 5";

    // Guardamos el resultado que devuelve la sentencia.
    $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla Juegos.</p>');

    // Creamos un array en el que almacenaremos los datos de los juegos.
    $datos = array();

    // Si la sentencia devuelve 0 resultados, indicamos que no se han encontrado coincidencias.
    if(mysqli_num_rows($resultado) == 0){
        $datos[] = "No se han encontrado coincidencias.";
    }
    // Si no devuelve 0, almacenamos los datos en el array.
    else{
        while ($registro = mysqli_fetch_assoc($resultado)) { 
            $datos[] = $registro;
        }
    }

    // Devolvemos un objeto JSON.
    echo json_encode($datos);

    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
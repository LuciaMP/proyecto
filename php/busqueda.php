
<?php 
    // Cadena de conexión.
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    // Si existe buscador.
    if(isset($_POST["buscador"])){
        // Almacenamos en una variable el 'buscador'.
        $busqueda = $_POST["buscador"];
    }
    // Si no existe buscador.
    else {
        // Almacenamos en una variable el 'id'.
        $busqueda = $_POST["id"];
        // Almacenamos en una variable la 'tabla'.
        $tabla = $_POST["tabla"];
    }

    // Si la variable busqueda no está vacía.
    if ($busqueda != ''){ 
        // Si existe buscador.
        if (isset($_POST["buscador"])) {
            // Creamos una sentencia seleccionando de la tabla JUEGOS los juegos en los que su nombre sea como los de la variable busqueda con límite de 20.
            $sql = "SELECT * FROM JUEGOS WHERE NOMBRE LIKE '%$busqueda%' LIMIT 20";
        }
        // Si no existe buscador, si la tabla es JUEGOS.
        else if($tabla == "JUEGOS"){
            // Creamos una sentencia seleccionando de la tabla JUEGOS el juego igual a la variable busqueda (id).
            $sql = "SELECT * FROM JUEGOS WHERE IDJUEGO = '$busqueda'";
        }
        // Si no (la tabla sería NOVEDADES).
        else{
            // Creamos una sentencia seleccionando de la tabla NOVEDADES la novedad igual a la variable busqueda (id).
            $sql = "SELECT * FROM NOVEDADES WHERE IDNOVEDAD = '$busqueda'";
        }

        // Guardamos el resultado que devuelve la sentencia.
        $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla.</p>');

        // Creamos un array en el que almacenaremos los datos de los juegos.
        $datos = array();

        // Si la sentencia devuelve 0 resultados, indicamos que no se han encontrado coincidencias.
        if(mysqli_num_rows($resultado) == 0){
            $datos[] = "No se han encontrado coincidencias.";
        } 
        // Si no, almacenamos los datos en el array.
        else{
            while ($registro = mysqli_fetch_assoc($resultado)) { 
                $datos[] = $registro;
            }
        }

        // Devolvemos un objeto JSON.
        echo json_encode($datos);
    }
    
    // Cerramos la conexión.
    mysqli_close($conexion);
    
?>
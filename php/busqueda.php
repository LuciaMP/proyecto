<?php 
    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    if(isset($_POST["buscador"])){
        $busqueda = $_POST["buscador"];
    }
    else {
        $busqueda = $_POST["id"];
        $tabla = $_POST["tabla"];
    }

    //DEBO PREPARAR LOS TEXTOS QUE VOY A BUSCAR si la cadena existe 
    if ($busqueda != ''){ 
        if (isset($_POST["buscador"])) {
            $sql = "SELECT * FROM JUEGOS WHERE NOMBRE LIKE '%$busqueda%' LIMIT 20";
        }
        else if($tabla == "JUEGOS"){
            $sql = "SELECT * FROM JUEGOS WHERE IDJUEGO = '$busqueda'";
        }
        else{
            $sql = "SELECT * FROM NOVEDADES WHERE IDNOVEDAD = '$busqueda'";
        }
        $resultado = mysqli_query($conexion,$sql) OR DIE ('<p>Error al Consultar la Tabla.</p>');
        $datos = array();
        if(mysqli_num_rows($resultado) == 0){
            $datos[] = "No se han encontrado coincidencias.";
        } 
        else{
            while ($registro = mysqli_fetch_assoc($resultado)) { 
                //Mostramos los titulos de los juegos o lo que deseemos... 
                $datos[] = $registro;
            }
        }
        echo json_encode($datos);
    }
?>
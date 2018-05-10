<?php 
    $busqueda = $_POST["buscador"];
    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');
    //DEBO PREPARAR LOS TEXTOS QUE VOY A BUSCAR si la cadena existe 
    if ($busqueda != ''){ 
        //CUENTA EL NUMERO DE PALABRAS 
        $palabras=explode(" ",$busqueda); 
        $numero=count($palabras); 
        if ($numero == 1) { 
            //SI SOLO HAY UNA PALABRA DE BUSQUEDA SE ESTABLECE UNA INSTRUCION CON LIKE 
            $sql="SELECT TITULO FROM JUEGOS WHERE TITULO LIKE '%$busqueda%' LIMIT 10"; 
        } 
        else { 
            //SI HAY UNA FRASE SE UTILIZA EL ALGORTIMO DE BUSQUEDA AVANZADO DE MATCH AGAINST 
            //busqueda de frases con mas de una palabra y un algoritmo especializado 
            $sql="SELECT TITULO MATCH (TITULO) AGAINST ( '$busqueda' ) AS Score FROM JUEGOS WHERE MATCH (TITULO) AGAINST ('$busqueda') ORDER BY Score DESC LIMIT 10"; 
        } 
        $resultado = mysqli_query($conexion,$sql); 
        $registro=mysqli_fetch_assoc($resultado);
        $datos = array();
        foreach($registro as $indice => $titulo) { 
            //Mostramos los titulos de los juegos o lo que deseemos... 
            $datos[] = $titulo;
        }
        echo json_encode($datos);
    }
?>
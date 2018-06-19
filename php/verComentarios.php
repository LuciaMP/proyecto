<?php
    
    // Recogemos los datos enviados.
    $idjuego = $_POST['id'];

    // Cadena de conexión.
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    // Creamos la sentencia para seleccionar de la tabla COMENTARIOS los comentarios del juego.
    $sql = "SELECT IDCOMENTARIO,IDJUEGO,(SELECT NICK FROM USUARIOS WHERE USUARIOS.IDUSUARIO = COMENTARIOS.IDUSUARIO) AS IDUSUARIO,COMENTARIO,DATE_FORMAT(FECHA, '%d-%m-%Y %H:%i') AS FECHA FROM COMENTARIOS WHERE IDJUEGO = '$idjuego'";
    
    // Guardamos el resultado que devuelve la sentencia.
	$resultado = mysqli_query($conexion,$sql);

    // Si la sentencia devuelve 0 resultados, indicamos que no hay ningún comentario.
  	if(mysqli_num_rows($resultado) == 0){
        $datos[] = "No hay comentarios.";
    } 
    // Si no devuelve 0, almacenamos los comentarios en un array.
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
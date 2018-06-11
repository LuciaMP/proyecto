<?php
    $idjuego = $_POST['id'];

    //cadena de conexion 
    include('C:\xampp\seguridad\mysql.inc.php');
    mysqli_select_db($conexion,'proyecto') or die ('<p>Imposible conectar con la Base de Datos.</p>');

    $sql = "SELECT IDCOMENTARIO,IDJUEGO,(SELECT DISTINCT USUARIOS.NICK FROM USUARIOS,COMENTARIOS WHERE USUARIOS.IDUSUARIO=COMENTARIOS.IDUSUARIO) AS IDUSUARIO,COMENTARIO,DATE_FORMAT(FECHA, '%d-%m-%Y') AS FECHA FROM COMENTARIOS WHERE IDJUEGO = '$idjuego'";
       
	$resultado = mysqli_query($conexion,$sql);

  	if(mysqli_num_rows($resultado) == 0){
        $datos[] = "No hay comentarios.";
    } 
    else{
        while ($registro = mysqli_fetch_assoc($resultado)) { 
            $datos[] = $registro;
        }
    }

    echo json_encode($datos);

	mysqli_close($conexion);
?>
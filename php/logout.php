<?php

	// Obtenemos el limitador de caché actual.
	session_cache_limiter('nocache,private');

	// Reanudamos la sesión.
	session_start();

	// Destruimos la sesión.
	session_destroy();

	// Redirigimos a la página principal.
	header('location:..\estructura_principal.html');

?>

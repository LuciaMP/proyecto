<?php
	session_cache_limiter('nocache,private');
	session_start();

	session_destroy();

	header('location:..\estructura_principal.html');
?>

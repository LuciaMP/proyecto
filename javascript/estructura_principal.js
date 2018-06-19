// Almacena el estado de carga del DOM de la página
document.addEventListener('readystatechange', inicializar, false);
function inicializar() {
	// Cuando se hayan cargado todo el DOM del HTML, ejecuta las funciones indicadas
	if (document.readyState == 'complete') {
		asignarEventoMenu();
        crearDesplegable();
        buscar();
        contenidoLayout();
        // Controla el tamaño de la ventana para ajustar el menú principal
        window.onresize = function(){
		  crearDesplegable();
        }
	}
}
// Asigna los colores y los eventos para los elementos del menú principal
function asignarEventoMenu(){
    var x=document.getElementById('menu').getElementsByTagName('li');
    for(i=0;i<x.length;i++){
        if (i == 0) {
            x[i].style.backgroundColor = '#E0A92C';    
        }
        else {
        	x[i].style.backgroundColor = '#EEEEEE';
        }
		x[i].addEventListener('click',cambiarFondo,false);
		x[i].addEventListener('click',accionPestanas,false);
	}
	// Al inciar carga novedades.html
	cargarDiv('#principal','html/novedades.html');	
}
// Cuando se dispara el evento click, en los elementos del menú principal o con referencia directa
// esta función cambia los colores de los elementos, para distinguir la referencia
function cambiarFondo(evento){
	var x=document.getElementById('menu').getElementsByTagName('li');
    for(i=0;i<x.length;i++){
        x[i].style.backgroundColor = '#EEEEEE';
    }
    if (typeof(evento) == "object") {
    	evento.target.style.backgroundColor = '#E0A92C';
    }
    else {
    	$("#"+evento).css("background-color","#E0A92C");
    }
}
// Cuando se dispara el evento click, en los elementos del menú principal
// esta función carga los elementos correspondientes en el contenedor
function accionPestanas(evento){
	var x=document.getElementById('menu').getElementsByTagName('li');
	evento.preventDefault();
    for(i=0;i<x.length;i++){
        if (x[i].id == evento.target.id) {
            pos = i;
        }
    }
    cargarDiv('#principal',evento.target.parentNode.getAttribute('href'));
}
// Funcionalidad del buscador
function buscar(){
	// Carga todo los elementos en un array al poner el foco sobre el buscador
	$('#buscador').focus(function(e) {
		var parametros = {"pagina" : 0, "tabla" : "JUEGOS"};
    	var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php'));
    	var juegos = new Array(dato_objeto.datos.length);
    	for (var i = 0; i < dato_objeto.datos.length; i++) {
    		juegos[i] = dato_objeto.datos[i].NOMBRE;
		}
		// Se carga el array de elementos con la función que proporciona la libreria de Jquery
		$('#buscador').autocomplete({
			source: juegos
		})
	});
	// Al pulsar "ENTER" visualiza los datos que ha devuelto busqueda.php
	$('#buscador').keypress(function(e) {
		if (e.keyCode == 13) {
			cambiarFondo("menu_juegos");
			$('#principal').empty();
			var dato_objeto2 = JSON.parse(llamarAjax($("#buscador").serialize(),'php/busqueda.php'));
			if (typeof dato_objeto2[0].IDJUEGO == "undefined") {
	            var html = '<h2>'+dato_objeto2[0]+'</h2>';
	            $('#principal').append(html);
	        }else{
	        	for (var i = 0; i < dato_objeto2.length; i++) {
					var div = '<div id="' + dato_objeto2[i].IDJUEGO + '" class="listas" onclick="verJuego(event)">';
					div +='<h2 class="titulo">'+ dato_objeto2[i].NOMBRE + '</h2>';
	                div += '<img src="' + dato_objeto2[i].CARATULA + '" class="caratula">';
	                div += '<div class="descripcion">'+textoCortado(dato_objeto2[i].DESCRIPCION)+'</div></div>';
	                $('#principal').append(div);
				}
	        }
		}
	});
}
// Visualiza los elementos mas populares en el Layout
function contenidoLayout () {
	var dato_objeto = JSON.parse(llamarAjax($("#buscador").serialize(),'php/juegosMasPopulares.php'));
	var contenedor = $('#layout div');
	for (var i = 0; i < dato_objeto.length; i++) {
		var div = '<h3>'+ dato_objeto[i].NOMBRE + '</h3>';
		div +='<div id="' + dato_objeto[i].IDJUEGO + '">';
        div += '<p>'+textoCortado(dato_objeto[i].DESCRIPCION)+'<span class="leerMas" id="'+dato_objeto[i].IDJUEGO+'" onclick=cargarDiv("#principal","html/juegos.html");verJuego(event);cambiarFondo("menu_juegos");>Leer más</span></p></div>';
        contenedor.append(div);
	}
	var iconos = {
	   	header: "ui-icon-circle-arrow-e",
	    activeHeader: "ui-icon-circle-arrow-s"
	 };
	 // Uso de la librería Jquery para efecto acordeon
	contenedor.accordion({
	    icons: iconos,
		collapsible: true,
		animate: 'swing',
		heightStyle: "content",
		classes: {
			
		}
	});
}
// Teniendo en cuenta el tamaño de la venta, contrae el menú en 
// un desplegable, o lo despliega de una forma normal
function crearDesplegable(){
	if(window.innerWidth <= 600 && document.getElementById("desplegable") == null){
		var desplegable = document.createElement('ul');
		desplegable.setAttribute("id","desplegable");
		var lista = document.createElement('li');
		var texto = document.createTextNode('MENÚ');
		lista.appendChild(texto);
		desplegable.appendChild(lista);
		var padre = document.getElementById("nav");
		padre.appendChild(desplegable);
		var hijo = document.getElementById("menu");
		hijo.style.display = "none";
		lista.appendChild(hijo);
		$(lista).click(function() {
			$(hijo).toggle();
		});
	}
	else if(window.innerWidth > 600 && document.getElementById("desplegable") != null){
		var nav = document.getElementById("nav");
		var menu = document.getElementById("menu");
		menu.style.display = "block";
		var desplegable = document.getElementById("desplegable");
		nav.appendChild(menu);
		nav.removeChild(desplegable);
	}
}

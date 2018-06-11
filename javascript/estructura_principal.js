
document.addEventListener('readystatechange', inicializar, false);
function inicializar() {
	if (document.readyState == 'complete') {
		asignarEventoMenu();
        crearDesplegable();
        buscar();
        contenidoLayout();
        window.onresize = function(){
		  crearDesplegable();
        }
	}
}

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
	cargarDiv('#principal','html/novedades.html');	
}

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

function buscar(){
	$('#buscador').focusin(function(e) {
		var parametros = {"pagina" : 0, "tabla" : "JUEGOS"};
    	var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php'));
    	var juegos = new Array(dato_objeto.datos.length);
    	for (var i = 0; i < dato_objeto.datos.length; i++) {
    		juegos[i] = dato_objeto.datos[i].NOMBRE;
		}
		$('#buscador').autocomplete({
			source: juegos
		})
		$('#buscador').keyup(function(e) {
			if (e.keyCode == 13) {
				cambiarFondo("menu_juegos");
				$('#principal').empty();
				cargarDiv('#principal','html/juegos.html');
				var dato_objeto2 = JSON.parse(llamarAjax($("#buscador").serialize(),'php/busqueda.php'));
				if (typeof dato_objeto2[0].IDJUEGO == "undefined") {
		            html = '<h3>'+dato_objeto2[0]+'<h3>';
		            $('#principal').append(html);
		        }else{
		        	for (var i = 0; i < dato_objeto2.length; i++) {
						var div = '<div id="' + dato_objeto2[i].IDJUEGO + '" class="listas" onclick="verJuego(event)">';
						div +='<h2>'+ dato_objeto2[i].NOMBRE + '</h2>';
		                div += '<img src="' + dato_objeto2[i].CARATULA + '""></div>';
		                $('#principal').append(div);
					}
		        }
			}
		});
	});
}

function contenidoLayout () {
	var dato_objeto = JSON.parse(llamarAjax($("#buscador").serialize(),'php/juegosMasPopulares.php'));
	var contenedor = $('#layout div');
	for (var i = 0; i < dato_objeto.length; i++) {
		var div = '<h3>'+ dato_objeto[i].NOMBRE + '</h3>';
		div +='<div id="' + dato_objeto[i].IDJUEGO + '">';
        div += '<p>'+dato_objeto[i].DESCRIPCION+'</p></div>';
        contenedor.append(div);
	}
	var iconos = {
	   	header: "ui-icon-circle-arrow-e",
	    activeHeader: "ui-icon-circle-arrow-s"
	 };
	contenedor.accordion({
	    icons: iconos,
		collapsible: true,
		animate: 'swing',
		classes: {
			
		}
	});
}

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

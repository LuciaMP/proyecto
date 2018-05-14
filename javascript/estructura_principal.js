document.addEventListener('readystatechange', inicializar, false);
function inicializar() {
	if (document.readyState == 'complete') {
		asignarOyentesEvento();
        menu();
        buscar();
        activarPestanas();
        window.onresize = function(){
		  menu();
        }
	}
}

function asignarOyentesEvento(){
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
		cargarDiv('#principal','html/novedades.html');
	}	
}

function cambiarFondo(evento){
	var x=document.getElementById('menu').getElementsByTagName('li');
    for(i=0;i<x.length;i++){
        x[i].style.backgroundColor = '#EEEEEE';
    }
    evento.target.style.backgroundColor = '#E0A92C'
}

function accionPestanas(evento){
	var x=document.getElementById('menu').getElementsByTagName('li');
    for(i=0;i<x.length;i++){
        if (x[i].id == evento.target.id) {
            pos = i;
        }
    }
    switch (pos) {
        case 0:
            cargarDiv('#principal','html/novedades.html');
            break;
        case 1:
            cargarDiv('#principal','html/juegos.html');
            break;
    	case 2:
            cargarDiv('#principal','html/cuenta.html');
            break;
        case 3:
            cargarDiv('#principal','html/conocenos.html');
            break;
    }
}

function buscar(){
	$('#buscador').keyup(function(e) {
		if(e.keyCode == 13) {
			cargarDiv("#principal","html/busqueda.html");
			$.post("php/busqueda.php",$('#buscador').serialize(),function(datos) {
                var dato_objeto = JSON.parse(datos);
				var $ul = $('#busqueda');
				for (var i = 0; i < dato_objeto.length; i++) {
					var $li = $('<li>'+ dato_objeto[i] +'</li>');
					$ul.append($li);
				}
			});
		}
	});
}

function ocultar(){
	$('#login').hide();
	$('.ocultar').show();
}

function menu(){
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
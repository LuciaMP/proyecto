document.addEventListener('readystatechange', inicializar, false);
function inicializar() {
	if (document.readyState == 'complete') {
		asignarEventoMenu();
        crearDesplegable();
        buscar();
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
		cargarDiv('#principal','html/novedades.html');
	}	
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
	$('#buscador').keyup(function(e) {
		if(e.keyCode == 13) {
			cargarDiv("#principal","html/juegos.html");
			cambiarFondo("menu_juegos");
			//var dato_objeto = getData("php/busqueda.php",$('#buscador').serialize());
			$.post("php/busqueda.php",$('#buscador').serialize(),function(datos) {
                var dato_objeto = JSON.parse(datos);
				var $ul = $('#juegos');
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

function modificarUsuario(evento){
	evento.preventDefault();
	var texto = $("#guardar").val();
	var parametros = {
            "nick" : $('#nick').val(),
            "password" : $('#password').val(),
            "correo" : $('#correo').val(),
            "sexo" : $('#sexo').val(),
            "ciudad" : $('#ciudad').val(),
    };
    $.ajax({
            data:  parametros,
            url:   'php/modificacionUsuario.php',
            type:  'post',
            beforeSend: function () {
                $("#guardar").val("Procesando...");
                $("#nick").removeAttr("disabled");
       	 		$("#fechan").removeAttr("disabled");
            },
            success:  function (respuesta) {
                alert(respuesta);
                $("#nick").attr("disabled","disabled");
       	 		$("#fechan").attr("disabled","disabled");
                $("#guardar").val(texto);
            }
    });
}
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
	$('#buscador').keyup(function(e) {
		if(e.keyCode == 13) {
			cambiarFondo("menu_juegos");
			var dato_objeto = JSON.parse(llamarAjax($("#buscador").serialize(),'php/busqueda.php'))
			var contenedor = $('#principal');
			$(contenedor).empty();
			if (typeof dato_objeto[0].IDJUEGO == "undefined") {
	            html = '<h3>'+dato_objeto[0]+'<h3>';
	            contenedor.append(html);
	        }else{
	        	for (var i = 0; i < dato_objeto.length; i++) {
					var div = '<div id="' + dato_objeto[i].IDJUEGO + '">';
					div +='<h2>'+ dato_objeto[i].NOMBRE + '</h2>';
	                div += '<img src="' + dato_objeto[i].CARATULA + '"">';
	                contenedor.append(div);
				}
	        }
			$("#principal div").css({
                "cursor": "pointer",
                "cursor": "hand",
                "margin": "15px 0px 15px 0px",
                "background-color": "#BDBDBD"
            });
            $("#principal div").css(
                "cursor","pointer");
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

    var respuesta = llamarAjax(parametros,'php/modificacionUsuario.php');
    alert(respuesta);
    $("#nick").attr("disabled","disabled");
	$("#fechan").attr("disabled","disabled");
    $("#guardar").val(texto);
    /*
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
    */
}
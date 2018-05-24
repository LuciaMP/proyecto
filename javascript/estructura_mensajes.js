document.addEventListener('readystatechange', inicializar, false);
function inicializar() {
	if (document.readyState == 'complete') {
		activarPestanas();
        cargarDiv('#datos','mensajes.html');
        mostrarMensajes();
	}
}

function activarPestanas(){
    x=document.getElementById('contenedor').getElementsByTagName('button');
    for(i=0;i<x.length;i++){
        if (i == 0) {
            x[i].style.backgroundColor = '#E0A92C';    
        }
        x[i].addEventListener('click',accionPestanas,false);
    }   
}

function accionPestanas(evento){
    for(i=0;i<x.length;i++){
        x[i].style.backgroundColor = '#EEEEEE';
        if (x[i].id == evento.target.id) {
            pos = i;
        }
    }
    evento.target.style.backgroundColor = '#E0A92C';
    switch (pos) {
        case 0:
            cargarDiv('#datos','mensajes.html');
            mostrarMensajes();
            break;
        case 1:
            cargarDiv('#datos','mensaje_nuevo.html');
            break;
        default:
            cargarDiv('#datos','mensajes.html');
    }
}

function enviarMensaje(evento) {
    var hilo = evento.target.id;
    evento.preventDefault();
    if(hilo == 'formulario_mensajes_nuevos'){
        var parametros = {
            "receptor" : $('#receptor').val(),
            "asunto" : $('#asunto').val(),
            "mensaje" : $('#mensaje').val()
        };
    }
    else{
        var parametros = {
            "mensaje" : $('#mensaje').val(),
            "hilo" : hilo
        };
    }

    $.ajax({
            data:  parametros,
            url:   '../php/mensajeria.php',
            type:  'post',
            success:  function (respuesta) {
                alert(respuesta);
            }
    });
    
}

function mostrarMensajes() {
    $.post("../php/verMensajes.php",function(datos) {
        var datos_mensajes = JSON.parse(datos);
        var div = $('#mensajes');
        var html;
        if (typeof datos_mensajes[0].HILO == "undefined") {
            html = '<h3>'+datos_mensajes[0]+'<h3>';
            div.append(html);
        }
        else {
            for(var i = 0; i < datos_mensajes.length; i++) {
                html = '<div id="'+ datos_mensajes[i].HILO + '">';
                html += '<p>'+ datos_mensajes[i].ASUNTO + '</p>';
                html += '<p>'+ datos_mensajes[i].RECEPTOR + '</p></div>';
                div.append(html);
            }
            var mensajes = $("#mensajes div");
            for (var i = 0; i < mensajes.length; i++) {
                mensajes[i].addEventListener('click',verMensaje,false);
            }
        }
    });
}

function verMensaje(evento) {
    var hilo = evento.target.id || evento.target.parentElement.id;
    $('#mensajes').empty();

    $.ajax({
        data:  {"hilo" : hilo},
        url:   '../php/verMensajes.php',
        type:  'post',
        success:  function (respuesta) {
            var mensajes = JSON.parse(respuesta);
            var div = $('#mensajes');
            var html = '<p>'+ mensajes[0].ASUNTO + '</p><hr>';
            div.append(html);
            for(var i = 0; i < mensajes.length; i++) {
                html = '<p>'+ mensajes[i].EMISOR + '</p>';
                html += '<p>'+ mensajes[i].RECEPTOR + '</p>';
                html += '<p>'+ mensajes[i].MENSAJE + '</p>';
                html += '<hr>';
                div.append(html);
            }

            html = '<form action="#" method="POST" id="'+hilo+'" onsubmit="enviarMensaje(event);verMensaje(event)">';
            html += '<textarea name="mensaje" id="mensaje" cols="45" rows="5"></textarea>';
            html += '<input type="submit" name="enviar" id="enviar" value="Enviar"></form>';
            div.append(html);
        }
    });
    
}

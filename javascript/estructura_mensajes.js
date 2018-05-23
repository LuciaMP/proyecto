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

function enviarMensaje() {
    var parametros = {
            "receptor" : $('#receptor').val(),
            "asunto" : $('#asunto').val(),
            "mensaje" : $('#mensaje').val()
    };
    $.ajax({
            data:  parametros,
            url:   '../php/mensajeria.php',
            type:  'post',
    });
}

function mostrarMensajes() {
    $.post("../php/verMensajes.php",function(datos) {
        var datos_mensajes = JSON.parse(datos);
        var div = $('#mensajes');
        for(var i = 0; i < datos_mensajes.length; i++) {
            var html = '<div id="'+ datos_mensajes[i].IDMENSAJE + '">';
            html += '<p>'+ datos_mensajes[i].RECEPTOR + '</p>';
            html += '<p>'+ datos_mensajes[i].ASUNTO + '</p>';
            html += '<input id="hilo" value="' + datos_mensajes[i].HILO + '" hidden />';
            div.append(html);
        }

        var mensajes = $("#mensajes div");
        for (var i = 0; i < mensajes.length; i++) {
            mensajes[i].addEventListener('click',verMensaje,false);
        }
    });
}

// MISMO ID, CAMBIAR VAR HILO
function verMensaje() {
    var hilo = $('#hilo').val();
    alert(hilo);
    $('#mensajes').empty();

    $.ajax({
        data:  {"hilo" : hilo},
        url:   '../php/verMensajes.php',
        type:  'post',
        success:  function (respuesta) {
            var mensajes = JSON.parse(respuesta);
            var div = $('#mensaje_nuevo');
            html += '<hr>';
            for(var i = 0; i < mensajes.length; i++) {
                var html = '<p>'+ mensajes[i].ASUNTO + '</p>';
                html += '<p>'+ mensajes[i].EMISOR + '</p>';
                html += '<p>'+ mensajes[i].RECEPTOR + '</p>';
                html += '<p>'+ mensajes[i].MENSAJE + '</p>';
                html += '<hr>';
                div.append(html);
            }


            html = '<form action="#" method="POST" onsubmit="enviarMensaje()">';
            html += '<textarea name="mensaje" id="mensaje" cols="45" rows="5"></textarea>';
            html += '<input id="hilo" value="' + hilo + '" hidden />';
            html += '<input type="submit" name="enviar" id="enviar" value="Enviar"></form>';
            div.append(html);
        }
    });
    
}

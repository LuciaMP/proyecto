// Almacena el estado de carga del DOM de la página
document.addEventListener('readystatechange', inicializar, false);
function inicializar() {
    // Cuando se hayan cargado todo el DOM del HTML, ejecuta la función indicada
	if (document.readyState == 'complete') {
		activarPestanas();
        cargarDiv('#datos','mensajes.html');
        mostrarMensajes();
	}
}
// Agrega un evento click a cada elemento del menú principal y pinta el primero de ellos
function activarPestanas(){
    x=document.getElementById('contenedor').getElementsByTagName('button');
    for(i=0;i<x.length;i++){
        if (i == 0) {
            x[i].style.backgroundColor = '#E0A92C';    
        }
        x[i].addEventListener('click',accionPestanas,false);
    }   
}
// Recoge el click de los elementos del menú, les cambia el color para que quede clara la referencia
// y carga en el contenedor principal, el contenido al que hace referencia el elemento
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
// Registra el mensaje en la BBDD
function enviarMensaje(evento) {
    var hilo = evento.target.id;
    evento.preventDefault();
    // El mensaje abre un hilo nuevo o es la respuesta de un hilo ya creado
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

    var respuesta = llamarAjax(parametros,'../php/mensajeria.php');
    alert(respuesta);
    $('form').trigger("reset");
}
// Visualiza los mensajes del usuario
function mostrarMensajes() {
    var datos_mensajes = JSON.parse(llamarAjax(null,'../php/verMensajes.php'));
    var div = $('#mensajes');
    var html;
    html = '<h3 class="center">Conversaciones</h3>';
    div.append(html);
    if (typeof datos_mensajes[0].HILO == "undefined") {
        html = '<h3>'+datos_mensajes[0]+'<h3>';
        div.append(html);
    }
    else {
        for(var i = 0; i < datos_mensajes.length; i++) {
            html = '<div id="'+ datos_mensajes[i].HILO + '" style="cursor:hand;cursor:pointer;"><hr>';
            html += '<p>Conversación iniciada por '+ datos_mensajes[i].EMISOR.slice(0, datos_mensajes[i].EMISOR.indexOf("@")) + ' el día '+ datos_mensajes[i].FECHA +'</p>';
            html += '<p>Asunto: '+ datos_mensajes[i].ASUNTO + '</p></div>';
            div.append(html);
        }
        var mensajes = $("#mensajes div");
        for (var i = 0; i < mensajes.length; i++) {
            mensajes[i].addEventListener('click',verMensaje,false);
        }
    }
}
// Visualiza todos los mensajes que tiene el hilo al que se hace referencia por medio del ID
// que devuelve el evento
function verMensaje(evento) {
    var hilo = evento.target.id || evento.target.parentElement.id;
    $('#mensajes').empty();

    var parametros = {"hilo" : hilo};

    var datos_mensajes = JSON.parse(llamarAjax(parametros,'../php/verMensajes.php'));

    var div = $('#mensajes');
    var html = '<h3>Asunto: '+ datos_mensajes[0].ASUNTO + '  | '+ datos_mensajes[0].FECHA +'</h3><hr>';
    div.append(html);
    for(var i = 0; i < datos_mensajes.length; i++) {
        html = '<div id="'+ datos_mensajes[i].IDMENSAJE + '">';
        html += '<p>DE: '+ datos_mensajes[i].EMISOR.slice(0, datos_mensajes[i].EMISOR.indexOf("@")) + '  | '+ datos_mensajes[i].FECHA +'</p>';
        html += '<p>'+ datos_mensajes[i].MENSAJE + '</p></div>';
        html += '<hr>';
        div.append(html);
    }

    html = '<form action="#" method="POST" id="'+hilo+'" onsubmit="enviarMensaje(event);verMensaje(event)">';
    html += '<textarea name="mensaje" id="mensaje" class="datos_largos" rows="10"></textarea>';
    html += '<input type="submit" name="enviar" id="enviar" class="cajas_datos botones" value="Enviar"></form>';
    div.append(html);
}
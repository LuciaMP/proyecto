$(function() {
    if ($("#principal div").length == 0) {
        mostrarJuegosPrimeraVez();
    }
});

function mostrarJuegosPrimeraVez() {
    var parametros = {"pagina" : 1, "tabla" : "JUEGOS"};
    var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php'));
    crearLista(dato_objeto);
}

function mostrarJuegos(event){
    var parametros = {"pagina" : event.target.value, "tabla" : "JUEGOS"};
    var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php'));
    crearLista(dato_objeto);
}

function crearLista(dato_objeto){
    var contenedor = $('#principal');
    contenedor.empty();
    for (var i = 0; i < dato_objeto.datos.length; i++) {
        var div = '<div id="' + dato_objeto.datos[i].IDJUEGO + '" class="listas" onclick="verJuego(event)">';
        div +='<h2>'+ dato_objeto.datos[i].NOMBRE + '</h2>';
        div += '<img src="' + dato_objeto.datos[i].CARATULA + '" class="caratula">';  
        div += '<div class="descripcion">'+dato_objeto.datos[i].DESCRIPCION+'<div>';
        contenedor.append(div);
    }
    for (var i = 0; i < dato_objeto.paginas.length; i++) {
        var button = $(dato_objeto.paginas[i]);
        contenedor.append(button);
    }
    var botones = $("#principal button");
    for (var i = 0; i < botones.length; i++) {
        botones[i].addEventListener('click', mostrarJuegos, false);
    }
}

function verJuego (evento) {
    cargarDiv('#principal','html/juego.html');
    var id = evento.target.id || evento.target.parentElement.id;
    var parametros = {"id" : id, "tabla" : "JUEGOS"};
    var datos_juegos = JSON.parse(llamarAjax(parametros,'php/busqueda.php'));
    
    $("form").attr("id",datos_juegos[0].IDJUEGO);
    $("#imagen_juego").attr("src",datos_juegos[0].CARATULA);
    $("#titulo_juego").text(datos_juegos[0].NOMBRE);
    $("#desc_juego").text(datos_juegos[0].DESCRIPCION);
    
    votar();

    verVotaciones(id);
    verComentarios(evento);
}

function enviarComentario(evento) {
    var id = evento.target.id;
    evento.preventDefault();
    var parametros = {
        "id" : id,
        "comentario" : $('#comentario').val()
    };

    var respuesta = llamarAjax(parametros,'php/comentarios.php');
    alert(respuesta);
    $('form').trigger("reset");
}

function verComentarios(evento) {
    var id = evento.target.id || evento.target.parentElement.id;

    var datos_comentarios = JSON.parse(llamarAjax({"id" : id},'php/verComentarios.php'));

    var div = $('#comentarios');
    div.empty();
    if (typeof datos_comentarios[0].IDJUEGO == "undefined") {
        html = '<h3>' + datos_comentarios[0] + '<h3>';
        div.append(html);
    }
    else{
        for(var i = 0; i < datos_comentarios.length; i++) {
            html = '<p>'+ datos_comentarios[i].IDUSUARIO + '</p>';
            html += '<p>'+ datos_comentarios[i].FECHA + '</p>';
            html += '<p>'+ datos_comentarios[i].COMENTARIO + '</p>';
            html += '<hr>';
            div.append(html);
        }
    }
}

function votar(){
    $('.ratings').rating(function(vote,event){
        var parametros = {
            "idjuego" : $('form').attr('id'),
            "voto" : vote
        }

        var respuesta = llamarAjax(parametros,'php/votaciones.php');
        alert(respuesta);
        verVotaciones($('form').attr('id'));
    });
}

function verVotaciones(id) {
    var votaciones = JSON.parse(llamarAjax({"id" : id},'php/verVotaciones.php'));

    var div = $('#puntuaciones');
    div.empty();
    
    var html = '<p>Votos: ' + votaciones.VOTOS + '</p>';
    html += '<p>Nota: ' + votaciones.NOTA + '</p>';
    div.append(html);
}
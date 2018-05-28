$(function() {
    if ($("#principal div").length == 0) {
        mostrarJuegosPrimeraVez();
    }
});

function mostrarJuegosPrimeraVez() {
    var parametros = {"pagina" : 1, "tabla" : "JUEGOS"};
    var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php',false));
    crearLista(dato_objeto);
}

function mostrarJuegos(event){
    var parametros = {"pagina" : event.target.value, "tabla" : "JUEGOS"};
    var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php',false));
    crearLista(dato_objeto);
}

function crearLista(dato_objeto){
    var contenedor = $('#principal');
    contenedor.empty();
    for (var i = 0; i < dato_objeto.datos.length; i++) {
        var div = '<div id="' + dato_objeto.datos[i].IDJUEGO + '">';
        div +='<h2>'+ dato_objeto.datos[i].NOMBRE + '</h2>';
        div += '<img src="' + dato_objeto.datos[i].CARATULA + '"">';  
        contenedor.append(div);
    }
    var juegos = $("#principal div");
    for (var i = 0; i < juegos.length; i++) {
        juegos[i].addEventListener('click',verJuego,false);
        $(juegos[i]).addClass("listas");
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
    var datos_juegos = JSON.parse(llamarAjax(parametros,'php/busqueda.php',true));

    $("form").attr("id",datos_juegos[0].IDJUEGO);
    $("#imagen_juego").attr("src",datos_juegos[0].CARATULA);
    $("#titulo_juego").text(datos_juegos[0].NOMBRE);
    $("#desc_juego").text(datos_juegos[0].DESCRIPCION);
    verComentarios(evento);
}

function enviarComentario(evento) {
    var id = evento.target.id;
    evento.preventDefault();
    var parametros = {
        "id" : id,
        "comentario" : $('#comentario').val()
    };

    var respuesta = llamarAjax(parametros,'php/comentarios.php',false);
    alert(respuesta);
    $('form').trigger("reset");
}

// Al pulsar en el div, solo se ejecuta una vez, pero al pulsar en la imagen o en el h2, se ejecuta dos veces
function verComentarios(evento) {
    var id = evento.target.id || evento.target.parentElement.id;
    var parametros = {"id" : id};

    var datos_comentarios = JSON.parse(llamarAjax(parametros,'php/verComentarios.php'));

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
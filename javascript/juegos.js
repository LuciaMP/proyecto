$(function() {
    //if ($("#juegos li").length == 0) {
        mostrarJuegosPrimeraVez();
    //}
});

function mostrarJuegosPrimeraVez() {
    var parametros = {"pagina" : 1, "tabla" : "JUEGOS"};
    crearLista(parametros);
}

function mostrarJuegos(event){
    var parametros = {"pagina" : event.target.value, "tabla" : "JUEGOS"};
    crearLista(parametros);
}

function crearLista(parametros){
    $.ajax({
        data:  parametros,
        url:   'php/paginacion.php',
        type:  'post',
        success:  function (respuesta) {
            var dato_objeto = JSON.parse(respuesta);
            var section = $('section');
            section.empty();
            for (var i = 0; i < dato_objeto.datos.length; i++) {
                var div = '<div id="' + dato_objeto.datos[i].IDJUEGO + '">';
                div += '<img src="' + dato_objeto.datos[i].CARATULA + '"">';
                div +='<h2>'+ dato_objeto.datos[i].NOMBRE + '</h2>';
                section.append(div);
            }
            $("#principal div").css({
                "cursor": "pointer",
                "cursor": "hand",
                "margin": "15px 0px 15px 0px",
                "background-color": "#BDBDBD"
            });
            $("#principal div").css(
                "cursor","pointer");
            var juegos = $("#principal *:nth-child(n)");
            for (var i = 0; i < juegos.length; i++) {
                juegos[i].addEventListener('click',verJuego,false);
            }

            for (var i = 0; i < dato_objeto.paginas.length; i++) {
                var button = $(dato_objeto.paginas[i]);
                section.append(button);
            }

            var botones = $("#principal button");
            for (var i = 0; i < botones.length; i++) {
                botones[i].addEventListener('click', mostrarJuegos, false);
            }
        }
    });
}

function verJuego (evento) {
    cargarDiv('#principal','html/juego.html');
    var id = evento.target.id || evento.target.parentElement.id;
    $.ajax({
        data:  {"id" : id, "tabla" : "JUEGOS"},
        url:   'php/busqueda.php',
        type:  'post',
        beforeSend: function () {
            
        },
        success:  function (respuesta) {
            var datos_juegos = JSON.parse(respuesta);
            $("form").attr("id",datos_juegos[0].IDJUEGO);
            $("#imagen_juego").attr("src",datos_juegos[0].CARATULA);
            $("#titulo_juego").text(datos_juegos[0].NOMBRE);
            $("#desc_juego").text(datos_juegos[0].DESCRIPCION);
            verComentarios(evento);
        }
    });

}

function enviarComentario(evento) {
    var id = evento.target.id;
    evento.preventDefault();
    var parametros = {
        "id" : id,
        "comentario" : $('#comentario').val()
    };

    $.ajax({
        data:  parametros,
        url:   'php/comentarios.php',
        type:  'post',
        success:  function (respuesta) {
            alert(respuesta);
            $('form').trigger("reset");
        }
    });
}

// Al pulsar en el div, solo se ejecuta una vez, pero al pulsar en la imagen o en el h2, se ejecuta dos veces
function verComentarios(evento) {
    var id = evento.target.id || evento.target.parentElement.id;
    $.ajax({
        data:  {"id" : id},
        url:   'php/verComentarios.php',
        type:  'post',
        success:  function (respuesta) {
            var datos_comentarios = JSON.parse(respuesta);
            var div = $('#comentarios');
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
    });
}
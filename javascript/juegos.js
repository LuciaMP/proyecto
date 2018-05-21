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
            var $section = $('section');
            $section.empty();
            for (var i = 0; i < dato_objeto.datos.length; i++) {
                var $div = $('<div id="'+dato_objeto.datos[i].NOMBRE+'">');
                $section.append($div);
                var $img = $('<img src="'+dato_objeto.datos[i].CARATULA+'"">');
                $div.append($img);
                var $h2 = $('<h2>'+dato_objeto.datos[i].NOMBRE+'</h2>');
                $div.append($h2);
            }
            $("#principal div").css({
                "cursor": "pointer",
                "cursor": "hand",
                "margin": "15px 0px 15px 0px",
                "background-color": "#BDBDBD",
                "list-style": "none"
            });
            $("#principal div").css(
                "cursor","pointer");
            var juegos = $("#principal div");
            for (var i = 0; i < juegos.length; i++) {
                juegos[i].addEventListener('click',verJuego,false);
            }

            for (var i = 0; i < dato_objeto.paginas.length; i++) {
                var $button = $(dato_objeto.paginas[i]);
                $section.append($button);
            }

            var botones = $("section button");
            for (var i = 0; i < botones.length; i++) {
                botones[i].addEventListener('click', mostrarJuegos, false);
            }
        }
    });
}

function verJuego (evento) {
    cargarDiv('#principal','html/juego.html');
    $.ajax({
            data:  {"nombre" : evento.target.id},
            url:   'php/busqueda.php',
            type:  'post',
            beforeSend: function () {
                
            },
            success:  function (respuesta) {
                var datos_juegos = JSON.parse(respuesta);
                $("#imagen_juego").attr("src",datos_juegos[0].CARATULA);
                $("#titulo_juego").text(datos_juegos[0].NOMBRE);
                $("#desc_juego").text(datos_juegos[0].DESCRIPCION);
            }
    });
}
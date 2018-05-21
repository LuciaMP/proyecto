$(function() {
    mostrarNovedadPrimeraVez();
});

function mostrarNovedadPrimeraVez() {
    var parametros = {"pagina" : 1, "tabla" : "NOVEDADES"};
    crearLista(parametros);
}

function mostrarNovedades(event){
    var parametros = {"pagina" : event.target.value, "tabla" : "NOVEDADES"};
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
                var $div = $('<div id="'+dato_objeto.datos[i].IDNOVEDAD+'">');
                $section.append($div);
                var $img = $('<img src="'+dato_objeto.datos[i].IMAGEN+'"">');
                $div.append($img);
                var $h2 = $('<h2>'+dato_objeto.datos[i].TITULO+'</h2>');
                $div.append($h2);
                var $p = $('<p>'+dato_objeto.datos[i].CONTENIDO+'</p>');
                $div.append($p);
            }
            /*$("#novedades li").css({
                "cursor": "pointer",
                "cursor": "hand",
                "margin": "15px 0px 15px 0px",
                "background-color": "#BDBDBD",
                "list-style": "none"
            });*/

            for (var i = 0; i < dato_objeto.paginas.length; i++) {
                var $button = $(dato_objeto.paginas[i]);
                $section.append($button);
            }

            var botones = $("section button");
            for (var i = 0; i < botones.length; i++) {
                botones[i].addEventListener('click', mostrarNovedades, false);
            }
        }
    });
}

/*function verNovedad (evento) {
    cargarDiv('#principal','html/juego.html');
    $.ajax({
            data:  {"nombre" : evento.id},
            url:   'php/busqueda.php',
            type:  'post',
            beforeSend: function () {
                
            },
            success:  function (respuesta) {
                var datos_juegos = JSON.parse(respuesta);
                $("#imagen_juego").attr("src",datos_juegos.caratula);
                $("titulo_juego").text(datos_juegos.nombre);
                $("desc_juego").text(datos_juegos.descripcion);
            }
    });
}*/
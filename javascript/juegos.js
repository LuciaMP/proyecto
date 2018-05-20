$(function() {
    if ($("#juegos li").length == 0) {
        mostrarJuegosPrimeraVez();
    }
});

function mostrarJuegosPrimeraVez() {
    var parametros = {"pagina" : 1};
    crearLista(parametros);
}

function mostrarJuegos(event){
    var parametros = {"pagina" : event.target.value};
    crearLista(parametros);
}

function crearLista(parametros){
    $.ajax({
        data:  parametros,
        url:   'php/paginacion.php',
        type:  'post',
        success:  function (respuesta) {
            var dato_objeto = JSON.parse(respuesta);
            var $ul = $('#juegos');
            $ul.empty();
            for (var i = 0; i < dato_objeto.juegos.length; i++) {
                var $li = $('<li id="'+dato_objeto.juegos[i]+'">'+ dato_objeto.juegos[i] +'</li>');
                $li.addEventListener('click',verJuego,false);
                $ul.append($li);
            }
            for (var i = 0; i < dato_objeto.paginas.length; i++) {
                var $button = $(dato_objeto.paginas[i]);
                $ul.append($button);
            }

            var botones = document.getElementsByTagName("button");
            for (var i = 0; i < botones.length; i++) {
                botones[i].addEventListener('click', mostrarJuegos, false);
            }
        }
    });
}

function verJuego (evento) {
    cargarDiv('#principal','html/juego.html');
    $.ajax({
            data:  {"juego" : evento.id},
            url:   'php/detallesJuego.php',
            type:  'post',
            beforeSend: function () {
                $("#guardar").val("Procesando...");
                $("#nick").removeAttr("disabled");
                $("#fechan").removeAttr("disabled");
            },
            success:  function (respuesta) {
                var datos_juegos = JSON.parse(respuesta);
                $("#imagen_juego").attr("src",datos_juegos);
                $("titulo_juego").text(datos_juegos.nombre);
                $("desc_juego").text(datos_juegos.descripcion);
            }
    });
}
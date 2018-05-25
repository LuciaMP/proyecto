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
            var section = $('section');
            section.empty();
            for (var i = 0; i < dato_objeto.datos.length; i++) {
                var div = '<div id="' + dato_objeto.datos[i].IDNOVEDAD + '">';
                div += '<img src="' + dato_objeto.datos[i].IMAGEN + '"">';
                div +='<h2>'+ dato_objeto.datos[i].TITULO + '</h2>';
                div +='<p>'+ dato_objeto.datos[i].CONTENIDO + '</p>';
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
            var novedad = $("#principal *:nth-child(n)");
            for (var i = 0; i < novedad.length; i++) {
                novedad[i].addEventListener('click',verNovedad,false);
            }

            for (var i = 0; i < dato_objeto.paginas.length; i++) {
                var button = $(dato_objeto.paginas[i]);
                section.append(button);
            }

            var botones = $("#principal button");
            for (var i = 0; i < botones.length; i++) {
                botones[i].addEventListener('click', mostrarNovedades, false);
            }
        }
    });
}

function verNovedad (evento) {
    cargarDiv('#principal','html/novedad.html');
    var id = evento.target.id || evento.target.parentElement.id;
    $.ajax({
        data:  {"id" : id, "tabla" : "NOVEDADES"},
        url:   'php/busqueda.php',
        type:  'post',
        beforeSend: function () {
            
        },
        success:  function (respuesta) {
            var datos_novedades = JSON.parse(respuesta);
            $("#imagen_novedad").attr("src",datos_novedades[0].IMAGEN);
            $("#titulo_novedad").text(datos_novedades[0].TITULO);
            $("#cont_novedad").text(datos_novedades[0].CONTENIDO);
        }
    });
}
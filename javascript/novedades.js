$(function() {
    mostrarNovedadPrimeraVez();
});

function mostrarNovedadPrimeraVez() {
    var parametros = {"pagina" : 1, "tabla" : "NOVEDADES"};
    var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php'));
    crearLista(dato_objeto);
}

function mostrarNovedades(event){
    var parametros = {"pagina" : event.target.value, "tabla" : "NOVEDADES"};
    var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php'));
    crearLista(dato_objeto);
}

function crearLista(dato_objeto){
    var contenedor = $('#principal');
    contenedor.empty();
    for (var i = 0; i < dato_objeto.datos.length; i++) {
        var div = '<div id="' + dato_objeto.datos[i].IDNOVEDAD + '" class="listas" onclick="verNovedad(event)">';
        div +='<h2>'+ dato_objeto.datos[i].TITULO + '</h2>';
        div += '<img src="' + dato_objeto.datos[i].IMAGEN + '" class="caratula">'; 
        div += '<div class="contenido">'+textoCortado(dato_objeto.datos[i].CONTENIDO)+'<div>';
        contenedor.append(div);
    }

    for (var i = 0; i < dato_objeto.paginas.length; i++) {
        var button = $(dato_objeto.paginas[i]);
        contenedor.append(button);
    }

    var botones = $("#principal button");
    for (var i = 0; i < botones.length; i++) {
        botones[i].addEventListener('click', mostrarNovedades, false);
    }
}

function verNovedad (evento) {
    cargarDiv('#principal','html/novedad.html');
    var id = evento.target.id || evento.target.parentElement.id;
    var parametros = {"id" : id, "tabla" : "NOVEDADES"};
    var datos_novedades = JSON.parse(llamarAjax(parametros,'php/busqueda.php'));

    $("#imagen_novedad").attr("src",datos_novedades[0].IMAGEN);
    $("#imagen_novedad").attr("class","imagen");
    $("#titulo_novedad").text(datos_novedades[0].TITULO);
    $("#cont_novedad").text(datos_novedades[0].CONTENIDO);
}
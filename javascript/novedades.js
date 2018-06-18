// Lo primero que se ejecuta cuando recibe la llamada del HTML
$(function() {
    mostrarNovedadPrimeraVez();
});
// Recoge la primera página de novedades
function mostrarNovedadPrimeraVez() {
    var parametros = {"pagina" : 1, "tabla" : "NOVEDADES"};
    var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php'));
    crearLista(dato_objeto);
}
// Recoge la página indicada al llamar a la función, usado al pulsar el botón y cambiar de página
function mostrarNovedades(event){
    var parametros = {"pagina" : event.target.value, "tabla" : "NOVEDADES"};
    var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php'));
    crearLista(dato_objeto);
}
// Genera el DOM con los datos del JSON que recibe
function crearLista(dato_objeto){
    var contenedor = $('#principal');
    contenedor.empty();
    for (var i = 0; i < dato_objeto.datos.length; i++) {
        var div = '<div id="' + dato_objeto.datos[i].IDNOVEDAD + '" class="listas" onclick="verNovedad(event)">';
        div +='<h2 class="titulo">'+ dato_objeto.datos[i].TITULO + '</h2>';
        div += '<img src="' + dato_objeto.datos[i].IMAGEN + '" class="imagen_novedad">'; 
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
// Recoge el ID del elemento que es pasado por parámetro al ejecutarse un evento.
// El ID coincide con el ID de la novedad al que hace referencia, y visualiza sus datos.
function verNovedad (evento) {
    cargarDiv('#principal','html/novedad.html');
    var id = evento.target.id || evento.target.parentElement.id;
    var parametros = {"id" : id, "tabla" : "NOVEDADES"};
    var datos_novedades = JSON.parse(llamarAjax(parametros,'php/busqueda.php'));

    $("#imagen_principal").attr("src",datos_novedades[0].IMAGEN);
    $("#imagen_principal").attr("class","imagen");
    $("#titulo_novedad").text(datos_novedades[0].TITULO);
    $("#cont_novedad").text(datos_novedades[0].CONTENIDO);
}
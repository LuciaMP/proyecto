// Lo primero que se ejecuta cuando recibe la llamada del HTML
$(function() {
    // Comprobar si el contenedor principal contiene datos, ya que el HTML
    // es llamado en ocasiones en las que no interesa ejecutar ciertas funciones.
    if ($("#principal div").length == 0) {
        mostrarJuegosPrimeraVez();
    }
});
// Recoge la primera página de juegos
function mostrarJuegosPrimeraVez() {
    var parametros = {"pagina" : 1, "tabla" : "JUEGOS"};
    var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php'));
    crearLista(dato_objeto);
}
// Recoge la página indicada al llamar a la función, usado al pulsar el botón y cambiar de página
function mostrarJuegos(event){
    var parametros = {"pagina" : event.target.value, "tabla" : "JUEGOS"};
    var dato_objeto = JSON.parse(llamarAjax(parametros,'php/paginacion.php'));
    crearLista(dato_objeto);
}
// Genera el DOM con los datos del JSON que recibe
function crearLista(dato_objeto){
    var contenedor = $('#principal');
    contenedor.empty();
    for (var i = 0; i < dato_objeto.datos.length; i++) {
        var div = '<div id="' + dato_objeto.datos[i].IDJUEGO + '" class="listas" onclick="verJuego(event)">';
        div +='<h2 class="titulo">'+ dato_objeto.datos[i].NOMBRE + '</h2>';
        div += '<img src="' + dato_objeto.datos[i].CARATULA + '" class="caratula">';  
        div += '<div class="descripcion">'+textoCortado(dato_objeto.datos[i].DESCRIPCION)+'</div></div>';
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
// Recoge el ID del elemento que es pasado por parámetro al ejecutarse un evento.
// El ID coincide con el ID del juego al que hace referencia, y visualiza sus datos.
function verJuego (evento) {
    cargarDiv('#principal','html/juego.html');
    var id = evento.target.id || evento.target.parentElement.id;
    var parametros = {"id" : id, "tabla" : "JUEGOS"};
    var datos_juegos = JSON.parse(llamarAjax(parametros,'php/busqueda.php'));
    $("form").attr("id",datos_juegos[0].IDJUEGO);
    $("#imagen_principal").attr("src",datos_juegos[0].CARATULA);
    $("#titulo_juego").text(datos_juegos[0].NOMBRE);
    $("#desc_juego").text(datos_juegos[0].DESCRIPCION);
    votar();
    verVotaciones(id);
    verComentarios(evento);
    // Si el usuario hace login, se visualizan los elementos que están ocultos.
    if ($("#log").length > 0) {
        revelar();
    }
}
// Se registra el comentario en la BBDD y se vulven a visualizar todos.
function enviarComentario(evento) {
    var id = evento.target.id;
    evento.preventDefault();
    var parametros = {
        "id" : id,
        "nuevo_comentario" : $('#nuevo_comentario').val()
    };

    var respuesta = llamarAjax(parametros,'php/comentarios.php');
    alert(respuesta);
    $('form').trigger("reset");
}
// Visualiza los comentarios pertenecientes al juego que se pase por parámetro (ID)
function verComentarios(evento) {
    var id = evento.target.id || evento.target.parentElement.id;

    var datos_comentarios = JSON.parse(llamarAjax({"id" : id},'php/verComentarios.php'));

    var div = $('#comentarios');
    $('.comentario').remove();
    if (typeof datos_comentarios[0].IDJUEGO == "undefined") {
        html = '<div class="comentario"><h3>' + datos_comentarios[0] + '<h3></div>';
        $(html).insertBefore("#nuevo_comentario");
    }
    else{
        for(var i = 0; i < datos_comentarios.length; i++) {
            html = '<div id="'+datos_comentarios[i].IDCOMENTARIO+'" class="comentario">';
            html += '<p>'+ datos_comentarios[i].IDUSUARIO.slice(0, datos_comentarios[i].IDUSUARIO.indexOf("@")) +'  | '+ datos_comentarios[i].FECHA +'</p>';
            html += '<p>'+ datos_comentarios[i].COMENTARIO + '</p></div>';
            $(html).insertBefore("#nuevo_comentario");
        }
    }
}
// Registra la votación
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
// Visualiza las votaciones referentes a un juego, pasando su ID.
function verVotaciones(id) {
    var votaciones = JSON.parse(llamarAjax({"id" : id},'php/verVotaciones.php'));
    var div = $('#puntuaciones');
    div.empty();
    var html = '<p>Votos: ' + votaciones.VOTOS + '</p>';
    html += '<p>Nota: ' + votaciones.NOTA + '</p>';
    div.append(html);
}
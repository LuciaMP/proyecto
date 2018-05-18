$(document).ready(function() {
    alert($('#juegos').has('li').length);
    if($('#juegos').has('li').length == 0){
        $('#buscador').keyup(function(e) {
            if(e.keyCode != 13){
                mostrarJuegosPrimeraVez();
            }
        });
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
                var $li = $('<li>'+ dato_objeto.juegos[i] +'</li>');
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
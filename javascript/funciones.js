
function cargarDiv(div,url) {
	$.ajax({
		data:  {},
        url:   url,
        type:  'post',
        async: false,
        success:  function (respuesta) { 
        	$(div).html(respuesta);
        }
    });
    /*var php = '<?php include("../php/funciones.php"); logueado(); ?>';
	$('#principal').append(php);*/
}

function validarVacio(evento) {
	var formulario = evento.target.id;
    $(formulario+':input').change(function(){
	    $(this).css("background-color","white");
	    if ($(this).attr("type") == "checkbox" || $(this).attr("type") == "radio") {
	    	$(this).siblings("#requerido").remove();
	    }
    });
	var empty = true;
	$("#"+formulario+' input,'+"#"+formulario+' select').each(function() {
		if ($(this).attr('type') != "submit" && $(this).attr('type') != "reset") {
			if ($(this).val().length == 0 || $(this).val() == "") {
				empty = false;
				$(this).css("background-color","#fc9f9f");
			}
			if ($(this).attr("type") == "checkbox" || $(this).attr("type") == "radio") {
				var nombre = $(this).prop("name");
				if (!$("input[name='"+nombre+"']").is(":checked")) {
					empty = false;
					if (!$(this).siblings("#requerido").length) {
						$(this).parent().append("<span id='requerido' style='color:red;font-size:10px;'>Campo requerido</span>");
					}
				}
			}
		}
	});
	return empty;
}

function llamarAjax (parametros,url){
    var datos;
    $.ajax({
        data:  parametros,
        url:   url,
        type:  'post',
        async: false,
        success:  function (respuesta) {
            datos = respuesta;
        }
    });
    return datos;
}

function revelar(){
	$('#login').hide();
	$('.ocultar').show();
}
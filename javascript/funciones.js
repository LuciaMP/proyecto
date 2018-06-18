// Documento con funciones globales que se pueden usar en cualquier parte

// Carga un documento HTML pasado por parámetro, usando AJAX, en un elemento del DOM, también, pasado por parámentro
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
}
// Valida que los campos de un form no estén vacios
function validarVacio(evento) {
	var formulario = evento.target.id;
    $("#"+formulario+' input,'+"#"+formulario+' select').change(function(){
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
// Retorna datos que devuelve un méetodo AJAX. Por medio de parámentro se indica de donde debe
// recoger los datos y que parámetros debe pasar, si fueran necesarios
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
// Revela elementos ocultos
function revelar(){
	$('#login').hide();
	$('.ocultar').show();
}
// Recorta texto demasiado largo para visualizar de una mejor forma. Se pasa el texto por
// parámetro para después ser retornado, acortado, si fuera necesario
function textoCortado(texto) {
	let textoArray = texto.split(" ");
	if (textoArray.length > 60) {
		textoArray.splice(60);
		textoArray[61] = "..."
		return textoArray.join(" ");
	}
	return texto;
}
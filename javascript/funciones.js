
function cargarDiv(div,url) {
	$(div).load(url);
}

function validarDatos(evento){
	if(!validarVacio(evento)){
		if(!$('#nick').val().match(/^[A-Za-z0-9_-]{5,20}$/)){
			alert("Nombre de Usuario inválido.");
			evento.preventDefault();
		}
		if(!$('#password').val().match(/((?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[_-]).{8,16})/)){
		//if(!$('#password').val().match(/^[A-Za-z0-9_-]{5,20}$/)){
			alert("Contraseña inválida.");
			evento.preventDefault();
			if($('#v_password').length != 0){
				if($('#password').val() != $('#v_password').val()){
					alert("Las contraseñas no coinciden.");
					evento.preventDefault();
				}
			}
		}
	}
	else{
		alert("Todos los campos son obligatorios.");
		evento.preventDefault();
	}
}

function validarVacio(evento) {
	var formulario = evento.target.id;
    $(formulario+':input').change(function(){
	    $(this).css("background-color","white");
	    if ($(this).attr("type") == "checkbox" || $(this).attr("type") == "radio") {
	    	$(this).siblings("#requerido").remove();
	    }
    });
	var empty = false;
	$("#"+formulario+' input,'+"#"+formulario+' select').each(function() {
		if ($(this).attr('type') != "submit" && $(this).attr('type') != "reset") {
			if ($(this).val().length == 0 || $(this).val() == "") {
				empty = true;
				$(this).css("background-color","#fc9f9f");
			}
			if ($(this).attr("type") == "checkbox" || $(this).attr("type") == "radio") {
				var nombre = $(this).prop("name");
				if (!$("input[name='"+nombre+"']").is(":checked")) {
					empty = true;
					if (!$(this).siblings("#requerido").length) {
						$(this).parent().append("<span id='requerido' style='color:red;font-size:10px;'>Campo requerido</span>");
					}
				}
			}
		}
	});
	return empty;
}

function llamarAjax (parametros,url,async){
    var datos;
    $.ajax({
        data:  parametros,
        url:   url,
        type:  'post',
        async: async,
        success:  function (respuesta) {
            datos = respuesta;   
        }
    });
    return datos;
}
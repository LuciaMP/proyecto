/*
var formulario;

document.addEventListener('readystatechange', inicializar, false);

function inicializar(){
    if (document.readyState == 'complete') {
	formulario = document.getElementById("formulario");
        formulario.addEventListener('submit',validarFormulario,false);
    }
}

function validarFormulario(evento){
	var campo_vacio = false;
	for(var i = 0; i < formulario.elements.length; i++) {
		var elemento = formulario.elements[i];
		if(elemento.type == "text" && elemento.value == ""){
			alert('El campo ' + elemento.id + ' no puede estar vacio.');
			evento.preventDefault();
			break;
		}
		else if(elemento.type == "checkbox" && !elemento.checked){
			alert('El campo ' + elemento.id + ' debe estar seleccionado.');
			evento.preventDefault();
			break;
		}
		else if(elemento.type == "radio"){
			var seleccionado = false;
			for(var j = 0; j < document.getElementsByName(elemento.name).length; j++){
				if(document.getElementsByName(elemento.name)[j].checked){
					seleccionado = true;
					break;
				}
			}
			if(seleccionado == false){
				alert('El campo ' + elemento.id + ' debe estar seleccionado.');
				evento.preventDefault();
				break;
			}
			else{
				i += document.getElementsByName(elemento.name).length -1;
			}   
		}
		else if(elemento.selectedIndex == 0){
			alert('Debe seleccionar una opción del campo ' + elemento.id + '.');
			evento.preventDefault();
			break;
		}
	}
}
*/
function validar() {
    $('#formulario :input').change(function(){
	    $(this).css("background-color","white");
	    if ($(this).attr("type") == "checkbox" || $(this).attr("type") == "radio") {
	    	$(this).siblings("#requerido").remove();
	    }
    });
	var empty = false;
	$('#formulario input,#formulario select').each(function() {
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

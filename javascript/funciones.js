
function cargarDiv(div,url) {
	$(div).load(url);
}

function getData(url,dato) {
	var dato_objeto;
	if (dato == undefined) {
		$.post(url,function(datos) {
	        dato_objeto = JSON.parse(datos);
	    });
	}
	else {
		$.post(url,dato,function(datos) {
	        dato_objeto = JSON.parse(datos);
	    });
	}
	return dato_objeto;
}
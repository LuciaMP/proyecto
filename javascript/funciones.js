
function cargarDiv(div,url) {
	$(div).load(url);
}

function getData(url,dato) {
	var dato_objeto = new Object();
	var entra = false;
	if (dato == undefined) {
		$.post(url,function(datos) {
	        dato_objeto = JSON.parse(datos);
	        //alert(dato_objeto.nick);
	        entra = true;
	    });
	}
	else {
		$.post(url,dato,function(datos) {
	        dato_objeto = JSON.parse(datos);
	        //alert(dato_objeto[0]);
	        entra = true;
	    });
	}
	//alert(entra);
	return dato_objeto;
}
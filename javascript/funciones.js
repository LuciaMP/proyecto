
function cargarDiv(div,url) {
	$(div).load(url);
}

function getData(url,dato) {
	if (dato == undefined) {
		$.post(url,function(datos) {
	        return datos;
	    });
	}
	else {
		$.post(url,dato,function(datos) {
	        return datos;
	    });
	}
}
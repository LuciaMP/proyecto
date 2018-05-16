document.addEventListener('readystatechange', inicializar, false);
function inicializar() {
	if (document.readyState == 'complete') {
		activarPestanas();
        cargarDiv('#datos','login.html');
	}
}

function activarPestanas(){
    x=document.getElementById('contenedor').getElementsByTagName('button');
    for(i=0;i<x.length;i++){
        if (i == 0) {
            x[i].style.backgroundColor = '#E0A92C';    
        }
        x[i].addEventListener('click',accionPestanas,false);
    }   
}

function accionPestanas(evento){
    for(i=0;i<x.length;i++){
        x[i].style.backgroundColor = '#EEEEEE';
        if (x[i].id == evento.target.id) {
            pos = i;
        }
    }
    evento.target.style.backgroundColor = '#E0A92C';
    switch (pos) {
        case 0:
            cargarDiv('#datos','login.html');
            break;
        case 1:
            cargarDiv('#datos','signup.html');
            break;
        default:
            cargarDiv('#datos','login.html');
    }
}

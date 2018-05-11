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

function validarDatos(evento){
	if(!validar()){
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
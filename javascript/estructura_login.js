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

function validarDatos_signup(evento){
    if(validarVacio(evento)){
        if(!$('#nick').val().match(/^[A-Za-z0-9_-]{5,20}$/)){
            alert("El nombre de usuario debe contener entre 5 y 20 caracteres alfanuméricos, incluidos '-' y '_'");
            return false;
        }
        else if(!$('#password').val().match(/((?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[_-]).{8,16})/)){
            alert("La contraseña debe contener entre 8 y 16 caracteres, incluidos '-' y '_', comenzando por un número o una letra ");
            return false;
        }
        else if($('#password').val() != $('#v_password').val()) {
            alert("Las contraseñas no coinciden.");
            return false;
        }
        else {
            return true;
        }
    }
    else{
        alert("Todos los campos son obligatorios.");
        return false;
    }
}

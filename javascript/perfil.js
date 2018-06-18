// Cuando el DOM este totalmente cargado
$(document).ready(function() {
    rellenarDatos();
    $("input, select").change(function () {   
        $("#guardar").removeAttr("disabled");
	});
    $("#formulario_cuenta").submit(function(evento) {
        evento.preventDefault();
        if (validarDatos_perfil(evento)) {
            modificarUsuario(evento);
            $("#guardar").attr("disabled","disabled");
        }
    });
});
// Asigna valores a los elementos del formulario, para visualizarlo
function rellenarDatos() {
    var dato = JSON.parse(llamarAjax(null,'php/datosUsuario.php'));
    $("#nick").val(dato.NICK.slice(0, dato.NICK.indexOf("@")));
    $("#password").val(dato.PASSWORD);
    $("#correo").val(dato.EMAIL);
    $("#fechan").val(dato.FECHAN.split("-").reverse().join("-"));
    $("#sexo").val(dato.SEXO.toUpperCase());
    $("#ciudad").val(dato.CIUDAD.charAt(0).toUpperCase() + dato.CIUDAD.slice(1));
}
// Al pulsar el botón "guardar", recoge los datos de los elementos del
// formulario, y los actualiza en la BBDD
function modificarUsuario(evento){
    var texto = $("#guardar").val();
    var parametros = {
            "nick" : $('#nick').val(),
            "password" : $('#password').val(),
            "correo" : $('#correo').val(),
            "sexo" : $('#sexo').val(),
            "ciudad" : $('#ciudad').val(),
    };

    var respuesta = llamarAjax(parametros,'php/modificacionUsuario.php');
    alert(respuesta);
    $("#nick").attr("disabled","disabled");
    $("#fechan").attr("disabled","disabled");
    $("#guardar").val(texto);
}
// Valida los datos del formulario, comprobando si no esta vacío,
// o si son datos incorrectos
function validarDatos_perfil(evento){
    if(validarVacio(evento)){
        if(!$('#nick').val().match(/^[A-Za-z0-9_-]{5,20}$/)){
            alert("El nombre de usuario debe contener entre 5 y 20 caracteres alfanuméricos, incluidos '-' y '_'");
            return false;
        }
        else if(!$('#password').val().match(/((?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[_-]).{8,16})/)){
            alert("La contraseña debe contener entre 8 y 16 caracteres, incluidos '-' y '_', comenzando por un número o una letra ");
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
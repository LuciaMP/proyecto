$(document).ready(function() {
    rellenarDatos();
    $("input, select").change(function () {   
        $("#guardar").removeAttr("disabled");
	});
});

function rellenarDatos() {
    var dato = JSON.parse(llamarAjax(null,'php/datosUsuario.php'));
    $("#nick").val(dato.NICK.slice(0, dato.NICK.indexOf("@")));
    $("#password").val(dato.PASSWORD);
    $("#correo").val(dato.EMAIL);
    $("#fechan").val(dato.FECHAN.split("-").reverse().join("-"));
    $("#sexo").val(dato.SEXO.toUpperCase());
    $("#ciudad").val(dato.CIUDAD.charAt(0).toUpperCase() + dato.CIUDAD.slice(1));
}
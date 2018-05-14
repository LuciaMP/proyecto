$(document).ready(function() {
    rellenarDatos();
    $("input, select").change(function () {   
        $("#guardar").removeAttr("disabled");
	});
});

function rellenarDatos() {
    var dato = getData("php/datosUsuario.php");
    $("#nick").val(dato.nick);
    $("#password").val(dato.password);
    $("#correo").val(dato.email);
    $("#fechan").val(dato.fechan);
    $("#sexo").val(dato.sexo);
    $("#ciudad").val(dato.ciudad);
}
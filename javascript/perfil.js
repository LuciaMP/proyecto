$(document).ready(function() {
    rellenarDatos();
    $("input, select").change(function () {   
        $("#guardar").removeAttr("disabled");
	});
});

function rellenarDatos() {
    //var dato = getData("php/datosUsuario.php");
    $.post("php/datosUsuario.php",function(datos) {
        var dato = JSON.parse(datos);
        $("#nick").val(dato.nick.slice(0, dato.nick.indexOf("@")));
        $("#password").val(dato.password);
        $("#correo").val(dato.email);
        $("#fechan").val(dato.fechan.split("-").reverse().join("-"));
        $("#sexo").val(dato.sexo.toUpperCase());
        $("#ciudad").val(dato.ciudad.charAt(0).toUpperCase() + dato.ciudad.slice(1));
    });
}
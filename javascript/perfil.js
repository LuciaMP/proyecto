$(document).ready(function() {
    rellenarDatos();
    $("input, select").change(function () {   
        $("#guardar").removeAttr("disabled");
	});
});

function getData() {
    $.post("php/datosUsuario.php",function(datos) {
        var dato_objeto = JSON.parse(datos);
        return dato_objeto;
    });
}

function rellenarDatos() {
    var dato = getData();
    $("#nick").val(dato.nick);
    $("#password").val(dato.password);
    $("#correo").val(dato.email);
    $("#fechan").val(dato.fechan);
    $("#sexo").val(dato.sexo);
    $("#ciudads").val(dato.ciudad);
}
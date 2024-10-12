
function SeleccionarSalones() {

    var clave = $("#matriculaInput").val();

    //console.log(clave);

    verSalonesDeClaveProfe(clave);
}

function verSalonesDeClaveProfe(clave) {

    $.ajax({
        type: "GET", 
        url: '../../phpindustrial/controladores/horario.controlador.php',  
        data: { clave: clave },
        dataType: "json",
        success: function (response) {
            console.log(response);
            
            $("#ClaveSalon").empty(); //limpiar el <select> antes de agregar por clave del profe

            // Agregar nuevas opciones al select
            $.each(response.clavesSalon, function (index, value) {
                $("#ClaveSalon").append('<option value="' + value + '">' + value + '</option>');
            });
        },
        error: function (error) {
            // console.error("Error en la solicitud AJAX: " + error.responseText);
        }
    });
}

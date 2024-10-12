//En este JS se verifica el value del select ClaveSalon, si el value es igual a Otro, entonces de la db se extrae la info de todos los salones
//
function listarSalones() {
    $.ajax({
        url: '../../phpindustrial/controladores/salones.controlador.php?op=listarsalones',
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            var selectContent = '';
            selectContent += '<select name="OtrosSalones" id="OtroSalon">';
            for (let i = 0; i < response.length; i++) {
                selectContent += '<option value="'+response[i].Clave+'">'+response[i].Clave+'</option>' ;
            }
            selectContent += '</select>';

            $('#otros-container').html(selectContent);
        },
        error: function (xhr, status, error) {
            console.log("Error en la solicitud AJAX:");
            console.log("Estado: " + status);
            console.log("Error: " + error);
            console.log(xhr.responseText);
        }
    });
}

$(document).ready(function () {
    $(document).on('change', '#nuevoPedidoForm select[name=ClaveSalon]', function () {
        let opcion = $('#ClaveSalon').val();
        if(opcion==="Otro"){
            listarSalones();
        }else{
            $('#otros-container').empty();
        }
    });
});

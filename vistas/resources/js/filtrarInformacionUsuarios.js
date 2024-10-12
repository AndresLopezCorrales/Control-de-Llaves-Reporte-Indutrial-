//Este JS se encarga de realizar las acciones necesarias para filtrar la información de la tabla de personal
$(document).ready(function() {

    $('#FiltroForm').submit(function(event) {
        
        event.preventDefault();

        var formData = $(this).serialize();

        $.ajax({
            url: '../../phpindustrial/controladores/usuario.controlador.php?op=filtrar',
            type: 'POST',
            data: formData,
            dataType: 'json',
            success: function (response) {

                if (response && response.data && response.data.length > 0) {
                    var tableContent = '';
                    for (var i = 0; i < response.data.length; i++) {
                        let pertece = (response.data[i].Departamento==null || response.data[i].Departamento=="") ? response.data[i].Carrera : response.data[i].Departamento ;
                        tableContent += '<tr class="registro">';
                        tableContent += '<td>' + response.data[i].IDPersonal + '</td>';
                        tableContent += '<td>' + response.data[i].Nombre + '</td>';
                        tableContent += '<td>' + response.data[i].ApellidoPaterno + '</td>';
                        tableContent += '<td>' + response.data[i].ApellidoMaterno + '</td>';
                        tableContent += '<td>' + pertece + '</td>';
    
                        tableContent += '<td><button class="btn-editar" data-id="' + response.data[i].IDPersonal+'"><img src="vistas/resources/img/editar.png" alt="Editar"></button></td>';
                        tableContent += '</tr>';
                    }
                    $('#usuario_data tbody').html(tableContent);
                } else {
                    $('#usuario_data tbody').empty();
                }
            },
            error: function (xhr, status, error) {
                console.log("Error en la solicitud AJAX:");
                // console.log("Estado: " + status);
                // console.log("Error: " + error);
                // console.log(xhr.responseText);
            }
        });
    });
});

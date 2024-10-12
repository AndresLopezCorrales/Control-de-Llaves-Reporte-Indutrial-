//Este JS se encarga de mostrar todos los usuarios que están registrados en la DB
function tablaUsuarios(){
    $.ajax({
        url: '../../phpindustrial/controladores/usuario.controlador.php?op=listar', 
        type: 'GET',  
        dataType: 'json',
        success: function(response) {
            if (response && response.data && response.data.length > 0) {
                var tableContent = '';
                for (var i = 0; i < response.data.length; i++) {
                    let pertece = (response.data[i].Departamento==null) ? response.data[i].Carrera : response.data[i].Departamento ;
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
        error: function(error) {
            console.log("Error");
            // console.log(error.responseText);
        }
    });
}

$(document).ready(function() {
    tablaUsuarios();
});

//Este JS tiene la funcionalidad de siempre mostrar la información de los pedidos que se tienen registrados/activos
var tabla;

function init() {
}

function cargarTabla() {
    $.ajax({
        url: '../../phpindustrial/controladores/pedidos.controlador.php?op=listar',
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            //console.log(response);
            if (response && response.data && response.data.length > 0) {
                var tableContent = '';
                for (var i = 0; i < response.data.length; i++) {
                    tableContent += '<tr class="registro">';
                    tableContent += '<td style="width: 12%;">' +  '<p>' +
                                        response.data[i].ClaveSalon +  '</p><p>' + response.data[i].IDSalon +  '</p>' +
                                        '</td>';
                        tableContent += '<td style="width: 15%;">' +  '<p>' +
                                        response.data[i].Nombre+" "+ response.data[i].ApellidoPaterno + " " +
                                        response.data[i].ApellidoMaterno + '</p><p>' +response.data[i].IDPersonal +  '</p>' +
                                        '</td>';
                    tableContent += '<td style="width: 31%;">' + response.data[i].Llave+" "+ response.data[i].Objetos + '</td>';
                    tableContent += '<td style="width: 15%;">' + response.data[i].FechaHoraCreacion + '</td>';
                    tableContent += '<td style="width: 10%;"><button class="eliminar-btn" data-id="' + response.data[i].IDPedidosActivo + '"><img src="vistas/resources/img/eliminar.png" alt="eliminar" class="" ></button></td>';
                    tableContent += '</tr>';
                }
                $('#pedido_data tbody').html(tableContent);
            } else {
                $('#pedido_data tbody').empty();
            }
        },
        error: function (xhr, status, error) {
            // console.log("Error en la solicitud AJAX:");
            // console.log("Estado: " + status);
            // console.log("Error: " + error);
            // console.log(xhr.responseText);
        }
    });
}


$(document).ready(function () {
    cargarTabla();
});
init();

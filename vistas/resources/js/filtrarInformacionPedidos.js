//Si se selecciona alguna opcion de filtrado: Nombre o Edificio, este js estra en juego
$(document).ready(function() {
    $('#FiltroForm').submit(function(event) {
        event.preventDefault();
        var formData = $(this).serialize();
        $.ajax({
            url: '../../phpindustrial/controladores/pedidos.controlador.php?op=filtrar',
            type: 'POST',
            data: formData,
            dataType: 'json',
            success: function (response) {
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
                    Swal.fire({
                        icon: 'info',
                        title: 'Aviso',
                        text: 'No hay información de este Maestro/Alumno Y/O Edificio.',
                        toast: true,
                        position: 'center',
                        showConfirmButton: false,
                        timer: 4000
                    });
                    $('#pedido_data tbody').empty();
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

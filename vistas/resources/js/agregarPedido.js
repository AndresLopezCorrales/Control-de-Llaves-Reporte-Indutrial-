//Este JS hace la parte inicial para crear un registro de llaves.
//Se obtiene la información del form y se envía al Back.

var tabla;

function init() {

}

$(document).ready(function() {

    $('#nuevoPedidoForm').submit(function(event) {
        event.preventDefault();

        var formData = $(this).serialize();

        // console.log(formData);
        $.ajax({
            url: '../../phpindustrial/controladores/pedidos.controlador.php?op=agregar',
            type: 'POST',
            data: formData,
            dataType: 'json',
            success: function(response) {
                // console.log(response);
                cargarTabla();
                Swal.fire({
                    icon: 'success',
                    title: 'Exito',
                    text: 'La información se ha registrado correctamente.',
                    toast: true,
                    position: 'center',
                    showConfirmButton: false,
                    timer: 4000
                });
            },
            error: function(xhr, status, error) {
        //         console.log("estado: "+status);
		// console.log("Error: "+error);
		// console.log(xhr.responseText);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'No se ha podido registrar la información',
                    toast: 'true',
                    position: 'center',
                    showConfirmButton: false,
                    timer: 4000
                });
            }
        });
    });
});

init();

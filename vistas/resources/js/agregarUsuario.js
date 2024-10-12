$(document).ready(function() {

    $('#usuariosForm').submit(function(event) {
        event.preventDefault();

        var formData = $(this).serialize();

        $.ajax({
            url: '../../phpindustrial/controladores/usuario.controlador.php?op=agregar',
            type: 'POST',
            data: formData,
            dataType: 'json',
            success: function(response) {
                tablaUsuarios();
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
            error: function(error) {
                // console.log(error.responseText);
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

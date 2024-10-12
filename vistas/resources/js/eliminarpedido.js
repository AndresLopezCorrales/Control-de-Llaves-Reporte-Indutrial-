//Este JS funciona cada vez que se da click al botón de eliminar de la tabla de registros
function eliminarPedido(IDPedidosActivo) {
    Swal.fire({
        title: '¿Seguro?',
        text: 'Esta acción eliminará el registro de forma permanente',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Eliminar'
    }).then((result)=>{
        if(result.isConfirmed){
            $.ajax({
                url: '../../phpindustrial/controladores/pedidos.controlador.php?op=eliminar',
                type: 'POST',
                data: { IDPedidosActivo: IDPedidosActivo },
                dataType: 'json',
                success: function (response) {
                    // console.log(response);
                    cargarTabla();
                    Swal.fire({
                        icon: 'success',
                        title: 'Exito',
                        text: 'El registro se elimino correctamente.',
                        toast: true,
                        position: 'center',
                        showConfirmButton: false,
                        timer: 4000
                    });
                },
                error:function(xhr, status, error){
                    console.log("Error en la solicitud AJAX:");
                    // console.log("Estado: " + status);
                    // console.log("Error: " + error);
                    // console.log(xhr.responseText);
                    // console.log(error.responseText);
                    cargarTabla();
                    Swal.fire({
                        icon: 'success',
                        title: 'Exito',
                        text: 'El registro no se elimino correctamente.',
                        toast: true,
                        position: 'center',
                        showConfirmButton: false,
                        timer: 4000
                    });
                }
            });
        }
    });
}
$(document).on('click', '.eliminar-btn', function () {
    var idPedido = $(this).data('id');
    eliminarPedido(idPedido);
});

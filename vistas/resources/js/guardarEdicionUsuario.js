$(document).ready(function () {

    $(document).on('submit', '#editar', function(e){
        e.preventDefault();
        var $form = $(this);

        var formData = $form.serialize();
        $.ajax({
            type: "POST",
            url: "../../phpindustrial/controladores/usuario.controlador.php?op=editar",
            data: formData,
            dataType: "json",
            contentType: 'application/x-www-form-urlencoded',
            success: function (response) {
                console.log(response);

                Swal.fire({
                    icon: 'success',
                    title: 'Exito',
                    text: 'La información se ha editado correctamente.',
                    toast: true,
                    position: 'bottom',
                    showConfirmButton: false,
                    timer: 1500
                }).then((result)=>{
                    if(result.dismiss === Swal.DismissReason.timer){
                        window.location.href = 'paginausuarios.php';
                    }
                });
            },
            error:function(error){
                // console.log(error.responseText);

                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'No se ha podido editar la información',
                    toast: 'true',
                    position: 'bottom',
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        });
    });
});

//JS para el login xD
$(document).ready(function(){
    $('#login').click(function(){
        var formData = $('#loginform').serialize();
        
        console.log("hola");
        $.ajax({
            type: "POST",
            url: "../../phpindustrial/controladores/login.php?op=login",
            data: formData,
            dataType: "json",
            success: function (response) {
                
                if(response.success){
                    window.location.href = 'index.php';
                }else{
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Usuario y/o contraseña incorrectos',
                        toast: true,
                        position: 'center',
                        showConfirmButton: false,
                        timer: 3000
                    });
                }
            },
            error: function(xhr, status, error) {
                //console.log("Error en la solicitud AJAX:");
                //console.log("Estado: " + status);
                //console.log("Error: " + error);
                console.log(xhr.responseText);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Usuario y/o contraseña incorrectos',
                    toast: true,
                    position: 'center',
                    showConfirmButton: false,
                    timer: 3000
                });
            }
        });
    });
});

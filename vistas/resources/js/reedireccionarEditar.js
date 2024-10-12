//Este JS se encarga de pasar de paginausuarios.php-editarusuario.php y viceversa
$(document).ready(function () {
    $(document).on('click', '.btn-editar', function(){
        let id = $(this).data('id');
        window.location.href = 'editarusuario.php?id='+id;
    });
    $(document).on('click', '.float-button', function(){
        window.location.href = 'paginausuarios.php';
    });
});
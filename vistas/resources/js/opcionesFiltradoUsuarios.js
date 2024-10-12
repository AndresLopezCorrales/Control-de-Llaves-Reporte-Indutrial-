//Para habilitar/deshabilitar los Select del Form de filtrado de paginausaurio.php
$(document).ready(function(){
    $('#ckbTipo, #ckbCarrera').change(function(){
        var targetId = $(this).data('target');
        var targetElement = $(targetId);

        targetElement.prop('disabled', !$(this).prop('checked'));

        $('.send-info').prop('disabled', $('#slcTipo, #slcCarrera').filter(':enabled').length ===0);

    });

}); 
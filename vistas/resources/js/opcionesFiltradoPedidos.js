//Para habilitar/deshabilitar los Select del Form de filtrado de index.php
$(document).ready(function(){
    $('#ckbNombre, #ckbEdificio').change(function(){
        var targetId = $(this).data('target');
        var targetElement = $(targetId);

        targetElement.prop('disabled', !$(this).prop('checked'));

        $('.send-info').prop('disabled', $('#slcNombre, #slcEdificio').filter(':enabled').length ===0);

    });

}); 
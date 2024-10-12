$(document).ready(function () {
    $('#buscarNombre').on('input', function () {
        let textoIngresado = $(this).val().toLowerCase();
        // console.log(textoIngresado);
        $('#slcNombre option').each(function(){
            let opcionTexto = $(this).text().toLowerCase();
            let opcionValue = $(this).val();
            if(opcionTexto.indexOf(textoIngresado)!==-1 || opcionValue.indexOf(textoIngresado)!==-1){
                $(this).prop('selected', true);
                return false;
            }
        });
    });
});
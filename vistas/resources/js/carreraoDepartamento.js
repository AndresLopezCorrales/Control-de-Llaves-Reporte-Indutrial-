$(document).ready(function () {
    $('#ckbTipo, #ckbCarrera').on('change',function(){
        var isCheckedT = $('#ckbTipo').prop('checked');
        var isCheckedC = $('#ckbCarrera').prop('checked');
        // var slcCarrera = $('#slcCarrera');

        if (!isCheckedT && isCheckedC) {
            let selectContent = '';
            selectContent +='<option value="ISI">ISI</option>';
            selectContent +='<option value="IIS">IIS</option>';
            selectContent +='<option value="IME">IME</option>';
            selectContent +='<option value="DII">DII</option>';
            selectContent +='<option value="otro">Otro</option>';
            $('#slcCarrera').html(selectContent);
        } else {
            $('#slcTipo').change();
        }
    });
    $('#slcTipo').change(function () { 
        let opcion = $(this).val();
        let slcCarrera= $('#slcCarrera');

        slcCarrera.empty();
        if(opcion=="Alumno"){
            let selectContent = '';
            selectContent +='<option value="ISI">ISI</option>';
            selectContent +='<option value="IIS">IIS</option>';
            selectContent +='<option value="IME">IME</option>';
            $('#slcCarrera').html(selectContent);
        }else if(opcion=="Maestro"){
            let selectContent = '';
            selectContent +='<option value="DII">DII</option>';
            selectContent +='<option value="otro">Otro</option>';
            $('#slcCarrera').html(selectContent);
        }
    });
});
//Cada vez que se cambie la opción del select de tipo de usuario en el form de registro de usuarios, este JS se encarga de cambiar las opciones
//de otro Select, si es Maestro muestra los departamentos,si es alumno muestra las carreras
$('#usuariosForm select[name=TipoUsuario]').ready(function () {
    cambiar();
});
function cambiar(){
    $(document).on('change', '#usuariosForm select[name=TipoUsuario]', function () {
        let opcion = $('#IDTipoUsuario').val();
        var selectPertece = '';
        if(opcion=="Maestro"){
            selectPertece += '<select name="Departamento" id="IDDepartamento">'+
                            '<option value="DII">Departamento de Ingeniería Industrial</option>'+
                            '<option value="1">1</option>'+
                            '<option value="2">2</option></select>';
            $('#opcion').html(selectPertece);
        }else if(opcion=="Alumno"){
            selectPertece += '<select name="Carrera" id="IDCarrera">'+
                            '<option value="ISI">Sistemas</option>'+
                            '<option value="IME">Mecatrónica</option>'+
                            '<option value="IIS">Industrial</option></select>';
            $('#opcion').html(selectPertece);
        }
    });
}

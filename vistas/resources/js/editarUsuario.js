$(document).ready(function(){
    var url = new URL(window.location.href);
    var id = url.searchParams.get("id");
    $.ajax({
        url: '../../phpindustrial/controladores/usuario.controlador.php?op=listarporid',
        type: 'POST',
        data: {id : id},
        dataType: 'json',
        success: function (response) {
            if (response && response.data && response.data.length > 0) {
                var formularioContent = '<form action="" method="POST" id="editar">';
                formularioContent += '<label for="IDPersonal">Clave del registro: </label>';
                formularioContent += '<input type="text" name="IDPersonal" value="' + response.data[0].IDPersonal+'" readonly>';

                formularioContent += '<label for="Nombre">Nombre: </label>';
                formularioContent += '<input type="text" name="Nombre" value="' + response.data[0].Nombre+'">';
                formularioContent += '<input type="text" name="ApellidoPaterno" value="'+response.data[0].ApellidoPaterno+'">';
                formularioContent += '<input type="text" name="ApellidoMaterno" value="'+response.data[0].ApellidoMaterno+'">';
                
                formularioContent += '<label for="Tipo">Tipo de usuario: </label>';
                formularioContent += '<select name="Tipo" id="tipo_usuario">';
                formularioContent += '<option value="Maestro">Maestro</option>';
                formularioContent += '<option value="Alumno">Alumno</option>';
                formularioContent += '</select>';
                
                formularioContent += '<label for="Carrera" id="label_carrera">Área: </label>';
                formularioContent += '<select name="Carrera" id="select_carrera">';
                formularioContent += '</select>';

                formularioContent += '<button type="submit" class="btn-guardar-editar" data-id="'+response.data[0].IDPersonal+'"><img src="vistas/resources/img/salvar.png" alt="guardar"></button>';

                formularioContent += '</form>';
                
                $('#formulario_editar').html(formularioContent);
                
                // Evento change para el select de Tipo
                $('#tipo_usuario').change(function() {
                    var tipoSeleccionado = $(this).val();

                    var opcionesCarrera;
                    if (tipoSeleccionado === 'Maestro') {
                        opcionesCarrera = '<option value="Departamento de Ingeniería Industrial">Departamento de ingeniería industrial</option>'+
                                         '<option value="Departamento de matemáticas">Departamento de matemáticas</option>'+
                                         '<option value="Departamento de física">Departamento de física</option>';
                    } else if (tipoSeleccionado === 'Alumno') {
                        opcionesCarrera = '<option value="ISI">Sistemas</option>'+
                                         '<option value="IME">Mecatrónica</option>'+
                                         '<option value="IIS">Industrial</option>';
                    }

                    $('#select_carrera').html(opcionesCarrera);
                });
                
                // Llamar al evento change para el select de Tipo
                $('#tipo_usuario').trigger('change');
                
            } else {
                $('#formulario_editar').empty();
            }
        },
        error: function (xhr, status, error) {
            console.log("Error en la solicitud AJAX:");
            console.log("Estado: " + status);
            console.log("Error: " + error);
            console.log(xhr.responseText);
        }
    });
});

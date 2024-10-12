$(document).ready(function () {
//Al ingresaar una clave de personal en el primer form, se usa este JS para buscar la info del maestro/alumno que tiene la clave que se ingreso
    $('#nuevoPedidoForm :input').prop('disabled', true);

    $('#BuscarUsuario').submit(function (e) { 
        e.preventDefault();
        FormData = $(this).serialize();

        $.ajax({
            type: "POST",
            url: "../../phpindustrial/controladores/usuario.controlador.php?op=buscar",
            data: FormData,
            dataType: "json",
            success: function (response) {
                if (response && response.data) {
                    // console.log(response.data);
                    $('#nuevoPedidoForm :input').prop('disabled', false);
                    //Con esto se obtiene la cantidad de elementos del json response
                    //console.log(Object.keys(response).length);
                    // console.log(response);
                    var infoContent = '';
                    //dependiendo del tipo de usuario se pueden recibir dos opciones del json response: 1: data. 2: data y salones
                    //En esta línea se maneja esa situación para asignarle info a las etiquetas del nomvre del personal 
                    let nombre = (Object.keys(response).length==1)? response.data[0].Nombre +" "+ response.data[0].ApellidoPaterno +" "+ response.data[0].ApellidoMaterno : response.data.Nombre +" "+ response.data.ApellidoPaterno +" "+ response.data.ApellidoMaterno;
                    let pertenece = (Object.keys(response).length==1)? response.data[0].Departamento : response.data.Carrera;
                    let tipo = (Object.keys(response).length==1)? response.data[0].Tipo : response.data.Tipo;
                    
                    
                    infoContent += '<label for="Nombre">Empleado: </label>';
                    infoContent += '<input type="text" name="Nombre" value="' + nombre +'" readonly>';
                    infoContent += '<label for="Lugar">Carrera: </label>';
                    infoContent += '<input type="text" name="Carrera" value="' +pertenece + '" readonly>';
                    infoContent += '<label for="Lugar">Tipo: </label>';
                    infoContent += '<input type="text" name="Tipo" value="' + tipo + '" readonly>';
                    infoContent += '<label for="ClaveSalon">'+"Salón: "+'</label>';
                    infoContent += '<select name="ClaveSalon" id="ClaveSalon">';
                    let opcionesSalones = {};
                    if(Object.keys(response).length==1){
                        if(response.data[0].Clave !== null){
                            for(var i = 0; i < response.data.length; i++){
                                let clave = response.data[i].Clave;
                                if(!opcionesSalones[clave]){
                                    opcionesSalones[clave]=true;
                                    infoContent += '<option value="'+clave+'">'+clave+'</option>';
                                }
                            }
                        } else{
                            infoContent += '<option value="">No hay horario disponible</option>';
                        }
                        infoContent += '<option value="Otro">Otro</option>';
                        infoContent += '</select>';
                        infoContent += '<div name="otros-div" id="otros-container"></div>';
                    }else {
                        for(var i = 0; i < response.salon.length; i++){
                            infoContent += '<option value="'+response.salon[i].Clave+'">'+response.salon[i].Clave+'</option>';
                        }
                        infoContent += '</select>';
                    }

                    infoContent += '<div>';
                    infoContent += '<label for="Llave">Llave:</label>'+
                    '<input type="checkbox" id="Llave" name="Llave" value="Llave" checked>'+
                    '<label for="Aire">Aire:</label>'+
                    '<input type="checkbox" id="Aire" name="Aire" value="Aire">'+
                    '<br><br>'+
                    '<label for="Mouse">Mouse:</label>'+
                    '<input type="checkbox" id="Mouse" name="Mouse" value="Mouse">'+
                    '<label for="Bocina">Bocina:</label>'+
                    '<input type="checkbox" id="Bocina" name="Bocina" value="Bocina">'+
                    '<br><br>'+
                    '<label for="Proyector">Proyector:</label>'+
                    '<input type="checkbox" id="Proyector" name="Proyector" value="Proyector">'+
                    '<label for="Teclado">Teclado:</label>'+
                    '<input type="checkbox" id="Teclado" name="Teclado" value="Teclado">'+
                    '<br><br>';
                    infoContent += '<div>';
                    infoContent += '<label id="otroId" for="Otro">Otro: </label>';
                    infoContent += '<input class="textFiles" type="text" name="Otro" placeholder="Opcional">';
                    infoContent += '<br><br>';
                    infoContent += '<button type="submit">Agregar Registro</button>';
                    infoContent += '<br><br>';

                    
                    $('#nuevoPedidoForm').html(infoContent);

                } else if(response && response.error){
                    $('#nuevoPedidoForm :input').prop('disabled', true);
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'No se ha encontrado un usuario con esa clave',
                        toast: 'true',
                        position: 'center',
                        showConfirmButton: false,
                        timer: 2500
                    });
                    $('#info-user').empty();
                }else{
                    $('#nuevoPedidoForm :input').prop('disabled', true);
                    $('#nuevoPedidoForm :button').prop('disabled', true);
                }
            },
            error: function (xhr, status, error) {
                $('#nuevoPedidoForm :input').prop('disabled', true);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'No se ha encontrado un usuario con esa clave',
                    toast: 'true',
                    position: 'center',
                    showConfirmButton: false,
                    timer: 2500
                });
                $('#nuevoPedidoForm :input').prop('disabled', true);
                $('#nuevoPedidoForm :button').prop('disabled', true);
                console.log("Error en la solicitud AJAX:");
                // console.log("Estado: " + status);
                // console.log("Error: " + error);
                // console.log(xhr.responseText);
            }
        });
    });
});

$(document).ready(function () {
    $('#filtrarinfo').submit(function (e) { 
        e.preventDefault();
        var formData = $(this).serialize();
        // console.log(formData);
        $.ajax({
            url: '../../../phpindustrial/controladores/todospedidos.controlador.php?op=filtrar',
            type: 'POST',
            data: formData,
            dataType: 'json',
            success: function(response) {
                // console.log(response.data);
                if(response.horario && response.horario.length>0){
                    let fechaActual = new Date(response.horario[0].Fecha);
                    let diaSemana = fechaActual.getDay();
                    let horarioContent = '<table id="horario_data"><thead><tr><th>Lunes</th><th>Martes</th><th>Miercoles</th>'+
                        '<th>Jueves</th><th>Viernes</th><th>Sabado</th></tr></thead><tbody>';
                        for (let i = 0; i < response.horario.length; i++) {
                            let lunes = (response.horario[i].Lunes!=null)? [response.horario[i].Salon, response.horario[i].Lunes] : ["",""];
                            let martes = (response.horario[i].Martes!=null)? [response.horario[i].Salon, response.horario[i].Martes] : ["",""];
                            let miercoles = (response.horario[i].Miercoles!=null)? [response.horario[i].Salon, response.horario[i].Miercoles] : ["",""];
                            let jueves = (response.horario[i].Jueves!=null)? [response.horario[i].Salon, response.horario[i].Jueves] : ["",""];
                            let viernes = (response.horario[i].Viernes!=null)? [response.horario[i].Salon, response.horario[i].Viernes] : ["",""];
                            let sabado = (response.horario[i].Sabado!=null)? [response.horario[i].Salon, response.horario[i].Sabado] : ["",""];
                            horarioContent += '<tr>';
                            horarioContent += '<td class="' + (diaSemana === 0 ? 'color-column' : '') + '"><p>' + lunes[0] + '</p><p>' + lunes[1] + '</p></td>';
                            horarioContent += '<td class="' + (diaSemana === 1 ? 'color-column' : '') + '"><p>' + martes[0] + '</p><p>' + martes[1] + '</p></td>';
                            horarioContent += '<td class="' + (diaSemana === 2 ? 'color-column' : '') + '"><p>' + miercoles[0] + '</p><p>' + miercoles[1] + '</p></td>';
                            horarioContent += '<td class="' + (diaSemana === 3 ? 'color-column' : '') + '"><p>' + jueves[0] + '</p><p>' + jueves[1] + '</p></td>';
                            horarioContent += '<td class="' + (diaSemana === 4 ? 'color-column' : '') + '"><p>' + viernes[0] + '</p><p>' + viernes[1] + '</p></td>';
                            horarioContent += '<td class="' + (diaSemana === 5 ? 'color-column' : '') + '"><p>' + sabado[0] + '</p><p>' + sabado[1] + '</p></td>';
                            horarioContent += '</tr>';
                        }
                        horarioContent += '</tbody></table>';
                        $('#horarios').html(horarioContent);
                }else{
                    $('#horarios').empty();
                }

                if(response.data && response.data.length>0){
                    let edificios={};
                    for (let i = 0; i < response.data.length; i++) {
                        let edificio  = response.data[i].Salon.substring(0,2);
                        if(!edificios[edificio]){
                            edificios[edificio]=[];
                        }
                        edificios[edificio].push(response.data[i]);
                    }    
                    let edificiosOrdenados = Object.keys(edificios).sort();


                    let tablaContent = '<table id="tabla_data"><thead><tr><th>Empleado</th><th >Registro</th></tr></thead><tbody>';
                    edificiosOrdenados.forEach(edificio => {
                        tablaContent += '<tr class="edificio-header"><td colspan="2">' + edificio + '</td></tr>';
                        edificios[edificio].forEach(item => {
                            tablaContent += '<tr>';
                            tablaContent += '<td><p>' + item.Nombre + " " + item.ApellidoP + " " + item.ApellidoM + '</p></td>';
                            tablaContent += '<td>';
                            tablaContent += '<p>Los objetos pedidos fueron: ' + item.Objetos + '</p>';
                            tablaContent += '<p>del salon:' + item.Salon + '</p>';
                            tablaContent += '</td>';
                            tablaContent += '</tr>';
                        });
                    });
                    tablaContent += '</tbody></table>';

                    $('#resultados').html(tablaContent);
                }else{
                    Swal.fire({
                        icon: 'info',
                        title: 'Aviso',
                        text: 'No hay información de este Maestro/Alumno.',
                        toast: true,
                        position: 'center',
                        showConfirmButton: false,
                        timer: 4000
                    });
                    $('#resultados').empty();
                }
            },
            error: function(xhr, status, error) {
                console.log("estado: "+status);
                console.log("Error: "+error);
                console.log(xhr.responseText);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Ha ocurrido un error al buscar la información. Intente más tarde.',
                    toast: 'true',
                    position: 'center',
                    showConfirmButton: false,
                    timer: 4000
                });
            }
        });
    });
});
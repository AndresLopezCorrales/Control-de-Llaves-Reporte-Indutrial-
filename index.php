<?php
    session_start();

    if(!isset($_SESSION['user_authenticated'])){
        header('Location: login.html');
        exit();
    }

    require_once("modelos/usuario.modelo.php");
    $modeloUsuario = new ModeloUsuario();
    $nombres = $modeloUsuario->verIDNombre_Usuarios();
?> 


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:th="http://www.thymeleaf.org"
    xmlns:sec="http://www.thymeleaf.org/extras/spring-security"
    xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">

<head>
    <link rel="stylesheet" href="vistas/resources/lib/sweetalert2.min.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="vistas/resources/css/style.css?v=<?php echo time(); ?>">
    <title>Reporte Industrial</title>
</head>

<body>
<header class="float-header fixed w-100 top-0" id="cabecera" >
    <nav class="centrar-div ">
        <div class="up">
            <img src="vistas/resources/img/logo2_unison.png" alt="logo unison" class="img-unison" >
        </div>
        <div class="centrar-div">
            <a href="index.php" class="pdg-href text-header">Inicio</a>
            <a href="verinformacion.php" class="pdg-href text-header">Movimientos</a>
            <a href="paginausuarios.php" class="pdg-href text-header">Usuarios</a>
        </div>
        <div class="centrado mg-left">
            <a href="conexion/logout.php" class="nav-a"><img src="vistas/resources/img/cerrar.png" class="img-logout" alt="logout"></a>
        </div>
    </nav>
</header>

<main class="mg-top-main">
    <div class="left h-100">
            <div class="">
                <form action="" method="POST" id="BuscarUsuario">
                    <label for="Matricula">Matrícula:</label>
                    <input id="matriculaInput" type="number" name="Matricula" placeholder="Ingrese credenciales" required>
                    <button type="submit" id="btn-Buscar">Buscar</button>
                </form>
                <div id="info-user">
                </div>
                <div id="todossalones">
                </div>
                <form method="POST" id="nuevoPedidoForm">
                    <label for="claveSalon">Clave del Salón:</label>
                    <select name="ClaveSalon" id="ClaveSalon">
                    </select>
                    <div >
                        <label for="Llave">Llave:</label>
                        <input type="checkbox" id="Llave" name="Llave" value="LLave" checked>
                        <label for="Aire">Aire:</label>
                        <input type="checkbox" id="Aire" name="Aire" value="Aire">
                        <br><br>
                        <label for="Mouse">Mouse:</label>
                        <input type="checkbox" id="Mouse" name="Mouse" value="Mouse">
                        <label for="Bocina">Bocina:</label>
                        <input type="checkbox" id="Bocina" name="Bocina" value="Bocina">
                        <br><br>
                        <label for="Proyector">Proyector:</label>
                        <input type="checkbox" id="Proyector" name="Proyector" value="Proyector">
                        <label for="Teclado">Teclado:</label>
                        <input type="checkbox" id="Teclado" name="Teclado" value="Otro">
                    

                        <br><br>
                    </div>
                    <label id="otroId" for="Otro">Otro:</label>
                    <input class="textFiles" type="text" name="Otro" placeholder="Opcional">
                    <button type="submit">Agregar Pedido</button>
                </form>
            </div>
    </div>

    <div class="centrado right h-100"> 
        <div class="centrado">
            <form action="" method="POST" id="FiltroForm">
                <div class="border-div">
                    <label for="PorNombre">Buscar por Nombre: </label>
                    <input type="checkbox" name="PorNombre" id="ckbNombre" value="si" data-target="#slcNombre">
                    <input type="text" name="opcionBuscarNombre" id="buscarNombre" placeholder="Ingrese el No.Empleado O Nombre">
                    <Select name="Nombre" id="slcNombre" disabled>
                        <?php foreach ($nombres as $nombre): ?>
                            <option value="<?php echo $nombre['IDPersonal'] ?>"><?php echo $nombre['Nombre']." ". $nombre['ApellidoPaterno']." ".$nombre['ApellidoMaterno']; ?></option>
                        <?php endforeach; ?>
                    </Select>
                </div>
                <label for="PorEdificio">Buscar por Edificio: </label>
                <input type="checkbox" name="PorEdificio" id="ckbEdificio" value="si" data-target="#slcEdificio">
                <select name="Edificio" id="slcEdificio" disabled>
                    <option value="5G">5G</option>
                    <option value="5J">5J</option>
                    <option value="5K">5K</option>
                    <option value="5M">5M</option>
                    <option value="5O">5O</option>
                    <option value="5R">5R</option>
                    <option value="8B">8B</option>
                    <option value="8D">8D</option>
                    <option value="Otro">Otro</option>
                </select>
                <button type="submit" class="send-info" disabled>Buscar</button>
            </form>
            <form action="" method="POST" id="buscarTodo">
                <label for="porTodo">Buscar todos los registros:  </label>
                <button type="submit" class="Todo" id="btn-buscar" onclick="cargarTabla()">Mostrar Todo</button>
            </form>
        </div>
        <div class="w-100">
            <table class="table" id="pedido_data">
                <thead class="thead__maestro">
                    <tr>
                        <th>Salón</th>
                        <th>Matrícula</th>
                        <th>Objetos</th>
                        <th>Fecha</th>
                        <th>Opción</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</main>
<!-- <footer class="w-100 centrado">
    <h3>Desarrollado por:</h3>
    <div class="centrar-div">
        <img src="vistas/resources/img/logo_csti.jpg" alt="logo csti" width="64px" height="64px" class="pdg-img" id="img-csti">
        <br>
        <p>Centro de Servicios de Tecnologías de la Información</p>
    </div>
</footer> -->
    <script src="vistas/resources/lib/sweetalert2.min.js?v=<?php echo time(); ?>"></script>
    <script src="vistas/resources/lib/jquery-3.7.1.min.js?v=<?php echo time(); ?>"></script>
    <script src="vistas/resources/js/opcionesFiltradoPedidos.js?v=<?php echo time(); ?>"></script><!--a-->
    <script src="vistas/resources/js/filtrarInformacionPedidos.js?v=<?php echo time(); ?>"></script><!--a-->
    <script src="vistas/resources/js/verinfo/obtenerOpcionSelect.js?v=<?php echo time(); ?>"></script>
    <script src="vistas/resources/js/buscarUsuario.js?v=<?php echo time(); ?>"></script><!--a-->
    <script src="vistas/resources/js/listarSalones.js?v=<?php echo time(); ?>"></script><!--a-->
    <script src="vistas/resources/js/verPedidos.js?v=<?php echo time(); ?>"></script><!--a-->
    <script src="vistas/resources/js/eliminarpedido.js?v=<?php echo time(); ?>"></script><!--a-->
    <script src="vistas/resources/js/agregarPedido.js?v=<?php echo time(); ?>"></script><!--a-->
    <script src="vistas/resources/js/elaboradoPor.js?v=<?php echo time(); ?>"></script><!--a-->
    </body>
</html>

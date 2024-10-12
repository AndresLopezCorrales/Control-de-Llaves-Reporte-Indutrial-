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
<html lang="en">
<head>
    <link rel="stylesheet" href="vistas/resources/lib/sweetalert2.min.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="vistas/resources/css/style2.css?v=<?php echo time(); ?>">
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
<main class="mg-top-main h-auto w-100">
        <div class="centrar-filtro">
            <div class="container-filtros w-100">
                <form action="" method="POST" id="filtrarinfo" class="columns">
                    <div class="h-auto w-200 container-pdg">
                        <label for="fecha">Seleccione una fecha<span>*</span></label>
                        <input type="date" name="fecha" required>
                    </div>
                    <div class="h-auto w-200 container-pdg border-div">
                        <label for="opcionBuscarNombre">Buscar Empleado</label>
                        <input type="text" name="opcionBuscarNombre" id="buscarNombre" placeholder="Ingrese el No.Empleado O Nombre">
                        
                        <label for="personal">Maestro/Alumno<span>*</span></label>
                        <select name="personal" id="slcNombre">
                        <?php foreach ($nombres as $nombre): ?>
                            <option value="<?php echo $nombre['IDPersonal'] ?>"><?php echo $nombre['Nombre']." ". $nombre['ApellidoPaterno']." ".$nombre['ApellidoMaterno']; ?></option>
                        <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="w-200 container-pdg">
                        <label for="" class="ckb">Filtrar por edificio</label>
                        <input type="checkbox" name="ckbedificio" id="idEdificio" data-target="#slcEdificio" value="si">
                        <select name="edificio" id="slcEdificio" disabled>
                            <option value="5G">5G</option>
                            <option value="5J">5J</option>
                            <option value="5K">5K</option>
                            <option value="5M">5M</option>
                            <option value="5O">5O</option>
                            <option value="5R">5R</option>
                            <option value="8B">8B</option>
                            <option value="8D">8D</option>
                        </select>
                    </div>
                    <div class="h-auto w-200 container-pdg">
                        <button>Buscar</button>
                    </div>
                </form>
            </div> 
        </div>
        <div class="centrar-filtro">
            <div id="horarios" class="centrado">
                
            </div>
        </div>
        <div class="centrar-filtro w-100">
            <div id="resultados" class="centrado">
                
            </div>
        </div>
    </main>
    <script src="vistas/resources/lib/sweetalert2.min.js?v=<?php echo time(); ?>"></script>
    <script src="vistas/resources/lib/jquery-3.7.1.min.js?v=<?php echo time(); ?>"></script>
    <script src="vistas/resources/js/verinfo/enabled_slcEdificio.js?v=<?php echo time(); ?>"></script>
    <script src="vistas/resources/js/verinfo/obtenerOpcionSelect.js?v=<?php echo time(); ?>"></script>
    <script src="vistas/resources/js/verinfo/verInfoRegistros.js?v=<?php echo time(); ?>"></script>
</body>
</html>

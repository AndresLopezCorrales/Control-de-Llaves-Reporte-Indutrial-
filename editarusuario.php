<?php
    session_start();

    if(!isset($_SESSION['user_authenticated'])){
        header('Location: login.html');
        exit();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="vistas/resources/css/style.css?v=<?php echo time(); ?>">
    <!-- <link rel="stylesheet" href="vistas/resources/css/tabla.css?v=<?php echo time(); ?>"> -->
    <link rel="stylesheet" href="vistas/resources/lib/sweetalert2.min.css?v=<?php echo time(); ?>">
    <title>Editar Registro</title>
</head>
<body>
<header class="cabecera">
    <nav class="centrar-div">
        <div class="">
            <img src="vistas/resources/img/logo2_unison.png" alt="logo unison" class="img-unison" >
        </div>
        <div class="centrar-div">
        </div>
    </nav>
</header>

<main class="mg-top-main centrado">
    <div class="centrado w-100 mg-btm">
    </div> 
    <div class="w-100 mg-top">
        <div id="formulario_editar">

        </div>
    </div>
</main>

<footer class="w-100 centrado">
    <h3>Desarrollado por:</h3>
    <div class="centrar-div">
        <img src="vistas/resources/img/logo_csti.jpg" alt="logo csti" class="logoCSTI">
        <p class="pdg-img">Centro de Servicios de Tecnologías de la Información</p>
    </div>
    <button type="submit" class="float-button">
        <img src="vistas/resources/img/devolver.png" width="auto" height="auto" alt="regresar">
    </button>
</footer>
<script src="vistas/resources/lib/sweetalert2.min.js?v=<?php echo time(); ?>"></script>
<script src="vistas/resources/lib/jquery-3.7.1.min.js?v=<?php echo time(); ?>"></script>
<!-- <script src="vistas/resources/js/mostrarEditar.js?v=<?php echo time(); ?>"></script> -->
<script src="vistas/resources/js/editarUsuario.js?v=<?php echo time(); ?>"></script>
<script src="vistas/resources/js/guardarEdicionUsuario.js?v=<?php echo time(); ?>"></script>
<script src="vistas/resources/js/reedireccionarEditar.js?v=<?php echo time(); ?>"></script><!--a-->
</body>
</html>
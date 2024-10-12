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
    <title>Document</title>
    <link rel="stylesheet" href="vistas/resources/css/style.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="vistas/resources/lib/sweetalert2.min.css?v=<?php echo time(); ?>">
</head>
<body>

<!-- <header class="float-header fixed w-100 top-0" id="cabecera" >
  <nav class="centrar-div ">
    <div class="up">
      <img src="vistas/resources/img/logo2_unison.png" alt="logo unison" class="img-unison" >
    </div>
    <div class="right centrar-div">
      <a href="index.php" class="pdg-href text-header">Inicio</a>
      <a href="#" class="pdg-href text-header">Movimientos</a>
      <a href="paginausuarios.php" class="pdg-href text-header">Usuarios</a>
    </div>
    <div class="centrado">
      <a href="conexion/logout.php" class="nav-a"><img src="vistas/resources/img/cerrar.png" class="img-logout" alt="logout"></a>
    </div>
  </nav>
</header> -->
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
  <div class="left">
    <form id="usuariosForm">
      <label for="TipoUsuario">Tipo de Usuario:</label>
      <select name="TipoUsuario" id="IDTipoUsuario">
        <option value="Maestro">Maestro</option>
        <option value="Alumno">Alumno</option>
      </select>
      <label id="claveID" for="Clave">Clave:</label>
      <input id="claveInput" class="textFiles" type="number" name="Clave" placeholder="Ingrese solo números" required>
      <label id="nombreID" for="Nombre">Nombre:</label>
      <input id="nombreInput" type="text" name="Nombre" required>
      <label id="apellidoPaternoID" for="ApellidoPaterno">Apellido Paterno:</label>
      <input id="apellidoPaternoInput" type="text" name="ApellidoPaterno" required>
      <label id="apellidoMaternoID" for="ApellidoMaterno">Apellido Materno:</label>
      <input id="apellidoMaternoInput" type="text" name="ApellidoMaterno" required>
      <label for="Carrera">Carrera:</label>
      <div id="opcion">
        <select name="Departamento" id="IDDepartamento">
          <option value="DII">Departamento de Ingeniería Industrial</option>
          <option value="2">más opciones</option>
        </select>
      </div>
      <button type="submit">Registrar Usuario</button>
    </form>
  </div>
<div class="centrado right h-100">
  <div class="centrado">
    <form action="" method="POST" id="FiltroForm">
      <label for="porTipo">Buscar por tipo: </label>
      <input type="checkbox" name="porTipo" id="ckbTipo" value="si" data-target="#slcTipo">
      <Select name="Tipo" id="slcTipo" disabled>
        <option value="Alumno">Alumno</option>
        <option value="Maestro">Maestro</option>
      </Select>
      <label for="porCarrera">Buscar por carrera: </label>
      <input type="checkbox" name="porCarrera" id="ckbCarrera" value="si" data-target="#slcCarrera">
      <select name="Carrera" id="slcCarrera" disabled>
        <option value="ISI">ISI</option>
        <option value="IME">IME</option>
        <option value="IIS">IIS</option>
      </select>
      <button type="submit" class="send-info" disabled>Buscar</button>
    </form>
    <form action="" method="POST" id="buscarTodo">
      <label for="porTodo">Mostrar todos los usuarios:  </label>
      <button type="submit" class="Todo" id="btn-buscar" onclick="tablaUsuarios()">Mostrar Todo</button>
    </form>
  </div>

  <div class="w-100 centrado">
    <table id="usuario_data" class="table">
      <thead>
        <tr>
          <th>Clave</th>
          <th>Nombre</th>
          <th>Apellido Paterno</th>
          <th>Apellido Materno</th>
          <th>Carrera</th>
          <th>Editar</th>
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
    <br>
</footer> -->
  <script src="vistas/resources/lib/sweetalert2.min.js?v=<?php echo time(); ?>"></script>
  <script src="vistas/resources/lib/jquery-3.7.1.min.js?v=<?php echo time(); ?>"></script>
  <script src="vistas/resources/js/mostrarSalones.paraMaestros.js?v=<?php echo time(); ?>"></script><!--a-->
  <script src="vistas/resources/js/verUsuarios.js?v=<?php echo time(); ?>"></script><!--a-->
  <script src="vistas/resources/js/agregarUsuario.js?v=<?php echo time(); ?>"></script>
  <script src="vistas/resources/js/carreraoDepartamento.js?v=<?php echo time(); ?>"></script><!--a-->
  <script src="vistas/resources/js/reedireccionarEditar.js?v=<?php echo time(); ?>"></script><!--a-->
  <script src="vistas/resources/js/opcionesFiltradoUsuarios.js?v=<?php echo time(); ?>"></script><!--a-->
  <script src="vistas/resources/js/filtrarInformacionUsuarios.js?v=<?php echo time(); ?>"></script><!--a-->

  <script src="vistas/resources/js/elaboradoPor.js?v=<?php echo time(); ?>"></script><!--a-->
</body>
</html>
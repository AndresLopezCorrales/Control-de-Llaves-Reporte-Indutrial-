<?php

require_once(__DIR__ . '/../conexion/conexion.php');
require_once __DIR__ . '/../modelos/usuario.modelo.php';
require_once(__DIR__ . "/../modelos/salon.modelo.php");


$usuarios = new ModeloUsuario(); 
$salon = new ModeloSalon();

date_default_timezone_set('America/Hermosillo');
$rutaArchivoLog = "../storage/logs.txt";


//buscarUsuario.js
if($_SERVER["REQUEST_METHOD"]=== "POST" && isset($_GET["op"]) && $_GET["op"]==="buscar"){
    $clave = isset($_POST["Matricula"])? $_POST["Matricula"] : "";

    $tipo = $usuarios->verTipo($clave);

    if($tipo["Tipo"] == "Maestro"){
        $datos = $usuarios->verMaestroPorClave($clave);

        if(isset($datos["error"])){
            echo json_encode(array("error" => $datos["error"]));
        }else{
            $data = Array();
            foreach ($datos as $row) {
                $sub_array = array(
                    "Nombre" => $row["Nombre"],
                    "ApellidoPaterno" => $row["ApellidoPaterno"],
                    "ApellidoMaterno" => $row["ApellidoMaterno"],
                    "Departamento" => $row["Departamento"],
                    "Tipo" => $row["Tipo"],
                    "Clave" => $row["Clave"]
                );
            $data[] = $sub_array;
            }
            echo json_encode(array("data" => $data));

        }
    }else if($tipo["Tipo"]=="Alumno"){
        $datos = $usuarios->verAlumnoPorClave($clave);

        if(isset($datos["error"])){
            echo json_encode(array("error" => $datos["error"]));
        }else{
            $data = Array();
            
            $salones = $salon->getIDSalonClave();
            $data2 = Array();
            foreach ($salones as $row) {
                $sub_array = array(
                    "IDSalon" => $row["IDSalon"],
                    "Clave" => $row["Clave"]
                );
                $data2[] = $sub_array;
            }
            echo json_encode(array("data" => $datos, "salon"=>$data2));
        }
    }
}
//verUsuarios.js
if($_SERVER["REQUEST_METHOD"]=== "GET" && isset($_GET["op"]) && $_GET["op"]==="listar"){
    $datos = $usuarios->verUsuarios();
    $data = infoParaListarPersonal($datos);

    echo json_encode(array("data" => $data));
}
//agregarUsuario.js
if($_SERVER["REQUEST_METHOD"]==="POST" && isset($_GET["op"]) && $_GET["op"]==="agregar"){
    $resultado = array("success" => false, "mensaje" => "Error al registrar al usuario");
    
    $tipo = isset($_POST["TipoUsuario"])? $_POST["TipoUsuario"] : "";
    $clave = isset($_POST["Clave"])? $_POST["Clave"] : null;
    $nombre = isset($_POST["Nombre"])? $_POST["Nombre"] : "";
    $apellidopaterno = isset($_POST["ApellidoPaterno"])? $_POST["ApellidoPaterno"] : "";
    $apellidomaterno = isset($_POST["ApellidoMaterno"])? $_POST["ApellidoMaterno"] : "";
    $pertenece = isset($_POST["Carrera"])? $_POST["Carrera"] : $_POST["Departamento"];

    if ($usuarios->insertarUsuario($clave, $nombre, $apellidopaterno, $apellidomaterno, $pertenece, $tipo)) {

        // Si la inserción es exitosa, registrar en el archivo de log

        $fechaHora = date("Y-m-d H:i:s");

        $logInsertar = "[$fechaHora] INSERT INTO personal (IDPersonal, Nombre, ApellidoPaterno, ApellidoMaterno, Carrera, Tipo)
                        VALUES ($clave, $nombre, $apellidopaterno, $apellidomaterno, $pertenece, $tipo)" . PHP_EOL;

        $archivo = fopen($rutaArchivoLog, "a");

        if ($archivo) {
            fwrite($archivo, $logInsertar);
            fclose($archivo);
            // $resultado = array("success" => true, "mensaje" => "Registro agregado correctamente");
            $resultado["success"] = true;
            $resultado["mensaje"] = "Usuario agregado correctamente";
        } else {
            $resultado["mensaje"] = "Error al escribir en el archivo de log";
        }
    } else {
        $resultado["mensaje"] = "Error al insertar el usuario en la base de datos";
    }

    echo json_encode($resultado);
}
//editarUsuario.js
if($_SERVER["REQUEST_METHOD"]==="POST" && isset($_GET["op"]) && $_GET["op"]==="listarporid"){
    $id = isset($_POST["id"])? $_POST["id"]: 0;
    
    $datos = $usuarios->verUsuarioPorClave($id);
    $data = infoParaListarPersonal($datos);

    echo json_encode(array("data"=>$data));
}
//guardarEdicionUsuario.js
if($_SERVER["REQUEST_METHOD"] ==="POST" && isset($_GET["op"]) &&$_GET["op"]==="editar"){

    $resultado = array("success" => false, "mensaje" => "Error al editar el registro");

    $nombre = isset($_POST["Nombre"])? $_POST["Nombre"] : "";
    $apellidopaterno = isset($_POST["ApellidoPaterno"])? $_POST["ApellidoPaterno"]: "";
    $apellidomaterno = isset($_POST["ApellidoMaterno"])? $_POST["ApellidoMaterno"]: "";    
    $carrera = isset($_POST["Carrera"])? $_POST["Carrera"]: "";
    $tipo = isset($_POST["Tipo"]) ? $_POST["Tipo"] : "";
    $idpersonal = isset($_POST["IDPersonal"])? $_POST["IDPersonal"]: 0;


    if ($usuarios->editarRegistro($idpersonal , $nombre, $apellidopaterno, $apellidomaterno, $carrera, $tipo)) {
        // Si la inserción es exitosa, registrar en el archivo de log

        $fechaHora = date("Y-m-d H:i:s");

        $logEditar = "[$fechaHora] UPDATE personal SET idpersonal = $idpersonal, nombre = $nombre, apellidopaterno = $apellidopaterno,
                                    apellidomaterno = $apellidomaterno, carrera = $carrera, tipo = $tipo WHERE idpersonal = $idpersonal" . PHP_EOL;

        $archivo = fopen($rutaArchivoLog, "a");

        if ($archivo) {
            fwrite($archivo, $logEditar);
            fclose($archivo);
            $resultado["success"] = true;
            $resultado["mensaje"] = "Registro agregado correctamente";
        } else {
            $resultado["mensaje"] = "Error al escribir en el archivo de log";
        }
    } else {
        $resultado["mensaje"] = "Error al editar el usuario en la base de datos";
    }

    echo json_encode($resultado);
}
//filtrarInformacionUsuarios.js
if($_SERVER["REQUEST_METHOD"] === "POST" && isset( $_GET["op"]) && $_GET["op"]==="filtrar"){
    if(count($_POST)==4){
        $tipo = isset($_POST["Tipo"])? $_POST["Tipo"] : null;
        
        $carrera = isset($_POST["Carrera"]) ? $_POST["Carrera"]: null;

        $datos = $usuarios->filtrarPorTipoyCarrera($tipo, $carrera);
        $data = infoParaListarPersonal($datos);

        echo json_encode(array("data" => $data));
    }
    if(count($_POST)==2 && isset($_POST["Tipo"])){
        $tipo = isset($_POST["Tipo"])? $_POST["Tipo"] : null;
        
        $datos = $usuarios->filtrarPorTipo($tipo);
        $data = infoParaListarPersonal($datos);
        
        echo json_encode(array("data" => $data));
    }
    if(count($_POST)==2 && isset($_POST["Carrera"])){
        $carrera = isset($_POST["Carrera"]) ? $_POST["Carrera"]: null;

        $datos = $usuarios->filtrarPorCarrera($carrera);
        $data = infoParaListarPersonal($datos);
        
        echo json_encode(array("data" => $data));
    }
}

function infoParaListarPersonal($datos){
    $data = Array();
    foreach ($datos as $row) {
        $sub_array = array(
            "IDPersonal" => $row["IDPersonal"],
            "Nombre" => $row["Nombre"],
            "ApellidoPaterno" => $row["ApellidoPaterno"],
            "ApellidoMaterno" => $row["ApellidoMaterno"],
            "Departamento" => $row["Departamento"],
            "Carrera" => $row["Carrera"],
            "Tipo" => $row["Tipo"]
        );
        $data[] = $sub_array;
    }
    return $data;
}

?>

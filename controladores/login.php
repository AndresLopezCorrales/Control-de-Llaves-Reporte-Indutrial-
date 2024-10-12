<?php
session_start();

require_once(__DIR__ . '/../conexion/conexion.php');
require_once(__DIR__ . '/../modelos/loginM.php');

$credenciales = new User();
if(isset($_GET["op"]) && $_GET["op"] === "login"){

    $resultado = array("success" => false, "mensaje" => "Error al ingresar");

    $user = isset($_POST["user"]) ? $_POST["user"] : null;
    $password = isset($_POST["password"]) ? $_POST["password"] : null;

    //print("Datos del formulario recibidos: Usuario: " . $_POST["user"] . ", Contraseña: " . $_POST["password"]);

    $datos = $credenciales->verUsuarios();
  
    //var_dump($datos);


    // Verificar si hay resultados de la base de datos
    if ($datos) {
        foreach ($datos as $row) {
            // Imprimir cada conjunto de datos
            //print_r($row);
            // O var_dump($row); // Para una salida más detallada

            if($user === $row["user"] && $password === $row["password"]){
                $_SESSION['usuario'] = $user;
                $_SESSION['user_authenticated'] = true;
                $resultado = array("success" => true, "mensaje" => "Inicio exitoso");
                break;
            }
        }
    }

    echo json_encode($resultado);

}

?>
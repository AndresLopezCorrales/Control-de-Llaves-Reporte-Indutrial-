<?php
require_once(__DIR__ . "/../modelos/todospedidos.modelo.php");
require_once(__DIR__ . "/../modelos/horario.modelo.php");
date_default_timezone_set('America/Hermosillo');
$todospedidos = new ModeloTodosPedidos();
$horarios=new ModeloHorario();

if($_SERVER["REQUEST_METHOD"] === "POST" && isset( $_GET["op"]) && $_GET["op"]==="filtrar"){
    $fecha= isset($_POST["fecha"])? $_POST["fecha"]: "";
    $id= isset($_POST["personal"])? $_POST["personal"]: "";

    $datos ="";
    if(isset($_POST["edificio"])){        
        $edificio = $_POST["edificio"];
        $datos = $todospedidos->filtrarTodoslosPedidos_Edificio($id, $fecha, $edificio);
    }else{
        $datos = $todospedidos->filtrarTodoslosPedidos($id, $fecha);
    }
    $data = Array();
    foreach ($datos as $row) {
        $sub_array = array(
            "Salon" => $row["Salon"],
            "IDPersonal" => $row["IDPersonal"],
            "Nombre"=>$row["Nombre"],
            "ApellidoP" => $row["ApellidoP"],
            "ApellidoM"=>$row["ApellidoM"],
            "Objetos"=>$row["Objetos"],
            "FHCreacion"=>$row["FHCreacion"],
            "FHFinal" => $row["FHFinal"]
        );
        $data[] = $sub_array;
    }
    $datos2=$horarios->verHorarios($id);
    $data2 = Array();
    foreach ($datos2 as $row) {
        $sub_array = array(
            "Lunes" => $row["Lunes"],
            "Martes" => $row["Martes"],
            "Miercoles" => $row["Miercoles"],
            "Jueves" => $row["Jueves"],
            "Viernes" => $row["Viernes"],
            "Sabado" => $row["Sabado"],
            "Salon" => $row["Salon"],
            "Fecha" => $fecha
        );
        $data2[] = $sub_array;
    }
    echo json_encode(array("horario" => $data2, "data" => $data));
}
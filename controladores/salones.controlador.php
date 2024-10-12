<?php

    require_once(__DIR__ . '/../conexion/conexion.php');
    require_once(__DIR__ . "/../modelos/salon.modelo.php");

    $salon = new ModeloSalon();

    //listarSalones.js
    if ($_SERVER["REQUEST_METHOD"] === "GET" && isset($_GET["op"]) && $_GET["op"] === "listarsalones") {
        try {
            $salones = $salon->getIDSalonClave();
            echo json_encode($salones);
        } catch (PDOException $e) {
            echo json_encode(array("error" => "Error al conectar con la base de datos: " . $e->getMessage()));
        } catch (Exception $e) {
            echo json_encode(array("error" => "Error: " . $e->getMessage()));
        }
    }



?>
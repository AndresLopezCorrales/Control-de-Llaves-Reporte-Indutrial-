<?php

require_once(__DIR__ . '/../conexion/conexion.php');

class User extends Conexion{    

    public function verUsuarios() {
        try {
            $conectar = parent::conectar();
            parent::set_names();
            //$stmt = ; statement
            $stmt = $conectar->prepare("SELECT L.User as user, L.Password as password FROM usuarios as L");
            $stmt->execute();

            
            //echo "miau<br>";
            //var_dump($usuarios);
            //echo "miau<br>";


            return $stmt->fetchAll();
        } catch (PDOException $e) {
            error_log("Error: ".$e->getMessage(), 0);
            throw new Exception("Error");
        }
    }
}
?>
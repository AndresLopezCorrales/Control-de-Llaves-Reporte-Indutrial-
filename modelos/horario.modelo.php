<?php
require_once(__DIR__ . '/../conexion/conexion.php');

class ModeloHorario extends Conexion{
    public function verHorarios($id) {
        try{
            $conectar = parent::conectar();
            parent::set_names();

            $stmt = "SELECT H.Lunes as Lunes, H.Martes as Martes, H.Miercoles as Miercoles, H.Jueves as Jueves, H.Viernes as Viernes, 
                    H.Sabado as Sabado, S.Clave as Salon
                    FROM Horario H
                    INNER JOIN Salon S ON S.IDSalon=H.IDSalon
                    WHERE H.IDPersonal=?";
            $stmt = $conectar->prepare($stmt);
            $stmt->bindValue(1, $id);
            $stmt->execute();
            return $returnValue = $stmt->fetchAll();
        } catch (PDOException $e) {
            return array();
        }
    }
}


?>
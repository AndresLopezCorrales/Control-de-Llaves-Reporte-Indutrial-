<?php


require_once(__DIR__ . '/../conexion/conexion.php');

class ModeloTodosPedidos extends Conexion{

    //Esta función recibe la información de la tabla pedidosactivos, porque un registro será eliminado y al final será conservado en todospedidos
    //pedidos.controlador.php?op=eliminar
    public function agregaraTodoslosPedidos($IDSalon, $matricula,$objetos, $horapedido){
        $conectar = parent::conectar();
        parent::set_names();
        
        $stmt = "INSERT INTO todospedidos(IDSalon, IDPersonal, Objetos, FechaHoraCreacion, FechaHoraFinal) 
                VALUES (?, ?, ?, ?, now())";
        $stmt = $conectar->prepare($stmt);
        $stmt->bindValue(1, $IDSalon);
        $stmt->bindValue(2, $matricula);
        $stmt->bindValue(3, $objetos);
        $stmt->bindValue(4, $horapedido);

        try {
            $stmt->execute();
            return true;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function filtrarTodoslosPedidos_Edificio($id, $fecha, $edificio) {
        try{
            $conectar = parent::conectar();
            parent::set_names();

            $stmt = "SELECT S.Clave as Salon, P.IDPersonal as IDPersonal, 
                    P.Nombre as Nombre, P.ApellidoPaterno as ApellidoP, P.ApellidoMaterno as ApellidoM,
                    TP.Objetos as Objetos, TP.FechaHoraCreacion as FHCreacion, TP.FechaHoraFinal as FHFinal
                    FROM todospedidos as TP
                    INNER JOIN salon as S ON S.IDSalon=TP.IDSalon
                    INNER JOIN personal as P ON P.IDPersonal=TP.IDPersonal
                    WHERE P.IDPersonal=? AND TP.FechaHoraFinal LIKE ? AND S.Clave LIKE ?";
            $stmt = $conectar->prepare($stmt);
            $stmt->bindValue(1, $id);
            $stmt->bindValue(2, $fecha.'%');
            $stmt->bindValue(3, $edificio.'%');
            $stmt->execute();
            return $returnValue = $stmt->fetchAll();
        } catch (PDOException $e) {
            return array();
        }
    }
    public function filtrarTodoslosPedidos($id, $fecha) {
        try{
            $conectar = parent::conectar();
            parent::set_names();

            $stmt = "SELECT S.Clave as Salon, P.IDPersonal as IDPersonal, 
                    P.Nombre as Nombre, P.ApellidoPaterno as ApellidoP, P.ApellidoMaterno as ApellidoM,
                    TP.Objetos as Objetos, TP.FechaHoraCreacion as FHCreacion, TP.FechaHoraFinal as FHFinal
                    FROM todospedidos as TP
                    INNER JOIN salon as S ON S.IDSalon=TP.IDSalon
                    INNER JOIN personal as P ON P.IDPersonal=TP.IDPersonal
                    WHERE P.IDPersonal=? AND TP.FechaHoraFinal LIKE ? ";
            $stmt = $conectar->prepare($stmt);
            $stmt->bindValue(1, $id);
            $stmt->bindValue(2, $fecha.'%');
            $stmt->execute();
            return $returnValue = $stmt->fetchAll();
        } catch (PDOException $e) {
            return array();
        }
    }
}


?>
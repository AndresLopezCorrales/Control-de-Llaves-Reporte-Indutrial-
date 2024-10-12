<?php

require_once(__DIR__ . '/../conexion/conexion.php');

class ModeloPedidoActivo extends Conexion{    

    //función usada para mostrar la información importante del registro en la tabla de registros de la página
    //pedidos.controlador.php?op=listar
    public function verPedidos() {
        $conectar = parent::conectar();
        parent::set_names();

        $stmt = "SELECT * FROM vista_pedidosactivos_salones_personal";
        $stmt = $conectar->prepare($stmt);
        $stmt->execute();
        return $returnValue = $stmt->fetchAll();
    }

    //se usa esta función para extraer la info de un registro y almacenarla en otra tabla porque dicho registro se va a eliminar
    //pedidos.controlador.php?op=eliminar
    public function verPedidoporID($idPedido) {
        try {
            $conectar = parent::conectar();
            parent::set_names();
    
            $statement = $conectar->prepare("SELECT * FROM vista_pedidosactivos_registroporid WHERE IDPedidosActivo = ?");
            $statement->bindValue(1, $idPedido);
            $statement->execute();
    
            return $statement->fetch();
        } catch (PDOException $e) {
            return array();
        }
    }

    //funcion para mostrar los registros de la tabla pedidosactivos, pero solamente por el nombre y edificio
    //pedidos.controlador.php?op=filtrar 
    public function filtrarPorNombreyEdificio($edificio, $idpersonal) {
        $conectar = parent::conectar();
        parent::set_names();

        $stmt = "SELECT * FROM vista_pedidosactivos_filtrarnombreyedificio WHERE ClaveSalon LIKE ? AND IDPersonal = ? ";
        $stmt = $conectar->prepare($stmt);
        $stmt->bindValue(1, '%'.$edificio.'%');
        $stmt->bindValue(2, $idpersonal);
        $stmt->execute();
        return $returnValue = $stmt->fetchAll();
    }

    //Función para obtener los registros de pedidosactivos en base al nombre y apellido
    //pedidos.controlador.php?op=filtrar 
    public function filtrarPorNombre($idpersonal) {
        $conectar = parent::conectar();
        parent::set_names();

        $stmt = "SELECT * FROM vista_pedidosactivos_filtrarnombreyedificio WHERE IDPersonal = ?";
        $stmt = $conectar->prepare($stmt);
        $stmt->bindValue(1, $idpersonal);
        $stmt->execute();
        return $returnValue = $stmt->fetchAll();
    }

    //Función para filtrar por edificio, con esto se obtienen los registros de pedidosactivos en base al edificio
    //pedidos.controlador.php?op=filtrar 
    public function filtrarPorEdificio($edificio) {
        $conectar = parent::conectar();
        parent::set_names();

        $stmt = "SELECT * FROM vista_pedidosactivos_filtrarnombreyedificio WHERE ClaveSalon LIKE ?";
        $stmt = $conectar->prepare($stmt);
        $stmt->bindValue(1, '%'.$edificio.'%');
        $stmt->execute();
        return $returnValue = $stmt->fetchAll();
    }

    //cada que se quiera eliminar un pedido, esta función es la importante
    //pedidos.controlador.php?op=eliminar
    public function eliminarPedidos($idPedido) {
    
        try {
            $conectar = parent::conectar();
            parent::set_names();
    
            // Obtener información del pedido antes de eliminarlo
            // $stmtPedido = $conectar->prepare("SELECT IDSalon FROM pedidosactivos WHERE IDPedidosActivo = ?");
            // $stmtPedido->bindValue(1, $idPedido);
            // $stmtPedido->execute();
            // $idSalon = $stmtPedido->fetchColumn();
            // $stmtPedido->closeCursor();
    
            // Eliminar el pedido
            $stmtEliminar = $conectar->prepare("DELETE FROM pedidosactivos WHERE IDPedidosActivo = ?");
            $stmtEliminar->bindValue(1, $idPedido);
            $stmtEliminar->execute();
    
            // Obtener el número actual de llaves en la tabla salon
            // $stmtSalon = $conectar->prepare("SELECT NumLlaves FROM salon WHERE IDSalon = ?");
            // $stmtSalon->bindValue(1, $idSalon);
            // $stmtSalon->execute();
            // $numLlaves = $stmtSalon->fetchColumn();
    
            // if ($numLlaves < 2){
            //     // Actualizar el número de llaves en la tabla salon (sumar una llave)
            // $stmtUpdate = $conectar->prepare("UPDATE salon SET NumLlaves = ? WHERE IDSalon = ?");
            // $stmtUpdate->bindValue(1, $numLlaves + 1);
            // $stmtUpdate->bindValue(2, $idSalon);
            // $stmtUpdate->execute();
            // }else{
            //     throw new Exception("Ya estan todas las llaves");
            // }
            
    
            return true;
        } catch (Exception $e) {
            throw new Exception("Error al eliminar el pedido: " . $e->getMessage());
        }
    }

    //función que sirve para agregar registros en la tabla todospedidos
    //pedidos.controlador.php?op=agregar
    public function agregarPedidos($idsalon, $clave, $llave, $aire, $proyector, $bocina, $mouse, $teclado, $otro){
        $conectar = parent::conectar();
        //parent::set_names();
        
        $matriculaa = $clave["IDPersonal"];
        $idsal = $idsalon["IDSalon"];
        
        $objetos = $aire.",".$proyector.",".$bocina.",".$mouse.",".$teclado.",".$otro;
        //quitar comas repetidas
        $objetos = preg_replace('/,{2,}/', ',', $objetos);
        //quitar ultima coma
        if (substr($objetos, -1) === ',') {
            $objetos = rtrim($objetos, ',');
        }
        try {
    
            // Obtener el número actual de llaves en la tabla salon
            if($llave!="Llave"){
                $stmt = "INSERT INTO pedidosactivos(IDSalon, IDPersonal, Llave, Objetos, FechaHoraCreacion)
                VALUES(?,?,?,?, now())";
                $stmt = $conectar->prepare($stmt);
                $stmt->bindValue(1, $idsal);
		        $stmt->bindValue(2, $matriculaa);
		        $stmt->bindValue(3, $llave);
                $stmt->bindValue(4, $objetos);

                $stmt->execute();
		        return true;
            }else{
                $statementSalon = $conectar->prepare("SELECT NumLlaves FROM salon WHERE IDSalon = ?");
                $statementSalon->bindValue(1, $idsal);
                $statementSalon->execute();
                $numeroDeLlaves = $statementSalon->fetchColumn();
        
                if ($numeroDeLlaves > 0) {
            //var_dump($llave);
                    $stmt = "INSERT INTO pedidosactivos(IDSalon, IDPersonal, Llave, Objetos, FechaHoraCreacion)
                    VALUES(?,?,?,?, now())";
                    $stmt = $conectar->prepare($stmt);
                    $stmt->bindValue(1, $idsal);
                    $stmt->bindValue(2, $matriculaa);
                    $stmt->bindValue(3, $llave);
                    $stmt->bindValue(4, $objetos);
    
                    $stmt->execute();
    
                    // Actualizar el número de llaves en la tabla salon (restar una llave)
                    $statementUpdate = $conectar->prepare("UPDATE salon SET NumLlaves = ? WHERE IDSalon = ?");
                    $statementUpdate->bindValue(1, $numeroDeLlaves - 1);
                    $statementUpdate->bindValue(2, $idsal);
                    $statementUpdate->execute();
    
                    return true;
                } else {
                    // No hay suficientes llaves, puedes manejar esto según tus necesidades
                    throw new Exception("No hay suficientes llaves disponibles.");
                    return false;
                }
            }

            //return true;
        } catch (PDOException $e) {
            return false;
        }
    }
}


?>

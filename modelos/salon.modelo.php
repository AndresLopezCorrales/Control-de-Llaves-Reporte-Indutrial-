<?php


require_once(__DIR__ . '/../conexion/conexion.php');
    //require_once("../conexion/conexion.php");

    class ModeloSalon extends Conexion{

        //Función para obtener el ID del salon a partir de la clave de este, este valor se almacenará dentro de pedidosactivos porque se hizo un registro
        public function getSalonporClave($clave) {
            $conectar = parent::conectar();
            parent::set_names();

            $stmt = "SELECT IDSalon FROM salon where Clave = ?";
            $stmt = $conectar->prepare($stmt);
            $stmt->bindValue(1, $clave);
            $stmt->execute();
            return $returnValue = $stmt->fetch();
        }

        //se obtiene el ID y la clave de todos los salones, para mostrarlo en el formulario de registro de llaves (se usa en la parte de filtrar y listar)
        //tambien se usa en el controlador de salones
        //salones.controlador.php?op=listarsalones
        public function getIDSalonClave (){
            try {
                $conectar = parent::conectar();
                parent::set_names();
                $stmt = "SELECT IDSalon as IDSalon, Clave as Clave FROM salon";
                $stmt = $conectar->prepare($stmt);
                $stmt->execute();
                $returnValue = $stmt->fetchAll();
                return $returnValue;
            } catch (PDOException $e) {
                echo "Error al conectar con la base de datos: " . $e->getMessage();
            } catch (Exception $e) {
                echo "Error: " . $e->getMessage();
            }

        }

        //Cada que se elimine un registro de pedidosactivos, el campo NumLlaves incrementa UNA unidad. Porque al hacer un registro en la tabla
        //el campo disminuye UNA unidad
        public function agregarLlave($idsalon){
            try{
                $conectar = parent::conectar();
                parent::set_names();
                $stmt = "UPDATE salon SET NumLlaves = NumLlaves+1 WHERE IDSalon = ?";
                $stmt = $conectar->prepare($stmt);
                $stmt->bindValue(1, $idsalon);
                $stmt->execute();
            }catch(PDOException $e){
                echo "Error al conectar con la base de datos: ".$e->getMessage();
            }catch(Exception $e){
                echo "Error: ".$e->getMessage();
            }
        }
    }

?>

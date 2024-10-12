<?php

require_once(__DIR__ . '/../conexion/conexion.php');

class ModeloUsuario extends Conexion{

    public function verIDNombre_Usuarios(){
        $conectar = parent::conectar();
        parent::set_names();

        $stmt = "SELECT P.IDPersonal as IDPersonal, P.Nombre as Nombre, P.ApellidoPaterno as ApellidoPaterno, P.ApellidoMaterno as ApellidoMaterno 
                FROM personal as P";
        $stmt = $conectar->prepare($stmt);
        $stmt->execute();
        return $returnValue = $stmt->fetchAll();
    }


    //Función para mostrar toda la información de la tabla personal (Maestros y Alumnos), esta info irá en la tabla principal de usuarios
    //usuario.controlador.php?op=listar
    public function verUsuarios(){
        $conectar = parent::conectar();
        parent::set_names();

        $stmt = "SELECT * FROM vista_personal_verusuarios_y_filtrartipoycarrera";
        $stmt = $conectar->prepare($stmt);
        $stmt->execute();
        return $returnValue = $stmt->fetchAll();
    }

    //Función para ver el nombre complleto del personal/alumnado, esto va directo a index.php
    public function verNombresUsuarios(){
        $conectar = parent::conectar();
        parent::set_names();

        $stmt = "SELECT  P.Nombre as Nombre, P.ApellidoPaterno as ApellidoPaterno, P.ApellidoMaterno as ApellidoMaterno 
                FROM personal as P";
        $stmt = $conectar->prepare($stmt);
        $stmt->execute();
        return $returnValue = $stmt->fetchAll();
    }

    //Función para ver el ID del personal/alumno porque se realizo un registro y este valor se almacenará en la tabla pedidosactivos
    public function verClave($nombre, $apellido){
        try {
            $conectar = parent::conectar();
            parent::set_names();
            
            $statement ="SELECT P.IDPersonal as IDPersonal
                        FROM personal as P
                        WHERE P.Nombre = ? AND P.ApellidoPaterno = ?";

            $statement = $conectar->prepare($statement);
            $statement->bindValue(1, $nombre);
            $statement->bindValue(2, $apellido);
            $statement->execute();

            $resultado = $statement->fetch();

            if($resultado){
                return $resultado;
            }else{
                return array("error" => "No se encontraron datos para la clave proporcionada");
            }
        } catch (PDOException $e) {
            error_log("Error en la inserción: " . $e->getMessage(), 0);
            return array();
        }
    }
    
    //función para ver la información del maestro/alumno para mostrarlo en el form de editar
    //usuario.controlador.php?op=listarporid
    public function verUsuarioPorClave($clave){
        try {
            $conectar = parent::conectar();
            parent::set_names();
            
            $statement ="SELECT * FROM vista_personal_verusuarios_y_filtrartipoycarrera WHERE IDPersonal = ?";

            $statement = $conectar->prepare($statement);
            $statement->bindValue(1, $clave);
            $statement->execute();

            $resultado = $statement->fetchAll();

            if($resultado){
                return $resultado;
            }else{
                return array("error" => "No se encontraron datos para la clave proporcionada");
            }
        } catch (PDOException $e) {
            error_log("Error en la inserción: " . $e->getMessage(), 0);
            return array();
        }
    }

    //Esta función muestra la información del maestro (incluyendo salones) para mostrarlo en el form de registro de llaves
    //usuario.controlador.php?op=buscar
    public function verMaestroPorClave($clave){ 
        try {
            $conectar = parent::conectar();
            parent::set_names();
            
            $statement ="SELECT * FROM vista_personal_maestroporclave WHERE IDPersonal = ?";

            $statement = $conectar->prepare($statement);
            $statement->bindValue(1, $clave);
            $statement->execute();

            $resultado = $statement->fetchAll();

            if($resultado){
                return $resultado;
            }else{
                return array("error" => "No se encontraron datos para la clave proporcionada");
            }
        } catch (PDOException $e) {
            error_log("Error en la busqueda: " . $e->getMessage(), 0);
            return array();
        }
    }

    //Esta función solo muestra la información básica de los alumnos
    //usuario.controlador.php?op=buscar
    public function verAlumnoPorClave($clave){ 
        try {
            $conectar = parent::conectar();
            parent::set_names();
            
            $statement ="SELECT * FROM vista_personal_alumnoporclave WHERE IDPersonal = ?";

            $statement = $conectar->prepare($statement);
            $statement->bindValue(1, $clave);
            $statement->execute();

            $resultado = $statement->fetch();

            if($resultado){
                return $resultado;
            }else{
                return array("error" => "No se encontraron datos para la clave proporcionada");
            }
        } catch (PDOException $e) {
            error_log("Error en la busqueda: " . $e->getMessage(), 0);
            return array();
        }
    }

    //Esta función muestra el tipo de usuario de la persona (Maestro o alumno)
    //usuario.controlador.php?op=buscar
    public function verTipo($clave){
        try {
            $conectar = parent::conectar();
            parent::set_names();
            
            $statement ="SELECT P.Tipo as Tipo
                        FROM personal as P
                        WHERE P.IDPersonal = ?";

            $statement = $conectar->prepare($statement);
            $statement->bindValue(1, $clave);
            $statement->execute();

            $resultado = $statement->fetch();

            if($resultado){
                return $resultado;
            }else{
                return array("error" => "No se encontraron datos para la clave proporcionada");
            }
        } catch (PDOException $e) {
            error_log("Error en la busqueda: " . $e->getMessage(), 0);
            return array();
        }
    }

    //Función para filtrar todos los registros de Personal de acuerdo al tipo y la carrera/departamento del usuario
    //usuario.controlador.php?op=listar
    public function filtrarPorTipoyCarrera($tipo,$carrera){
        $conectar = parent::conectar();
        parent::set_names();

        $stmt="";
        if($tipo=="Maestro"){
            $stmt = "SELECT * FROM vista_personal_verusuarios_y_filtrartipoycarrera WHERE Tipo = ? AND Departamento = ?";
        }else if($tipo=="Alumno"){
            $stmt = "SELECT * FROM vista_personal_verusuarios_y_filtrartipoycarrera WHERE Tipo = ? AND Carrera = ?";
        }
        $stmt = $conectar->prepare($stmt);
        $stmt->bindValue(1, $tipo);
        $stmt->bindValue(2, $carrera);
        $stmt->execute();
        return $returnValue = $stmt->fetchAll();
    }

    //Función usada para filtrar toda la información de los usuarios por el tipo: Maestro o Alumno
    //usuario.controlador.php?op=listar
    public function filtrarPorTipo($tipo){ 
        $conectar = parent::conectar();
        parent::set_names();

        $stmt = "SELECT * FROM vista_personal_verusuarios_y_filtrartipoycarrera WHERE Tipo = ?";
        $stmt = $conectar->prepare($stmt);
        $stmt->bindValue(1, $tipo);
        $stmt->execute();
        return $returnValue = $stmt->fetchAll();
    }

    //Función usada para filtrar toda la información del personal/alumnado de acuerdo a la carrera/departamento
    //usuario.controlador.php?op=listar
    public function filtrarPorCarrera($carrera){
        $conectar = parent::conectar();
        parent::set_names();

        $stmt="";
        if($carrera!=="ISI" && $carrera!=="IIS" && $carrera!=="IME"){
            $stmt = "SELECT * FROM vista_personal_verusuarios_y_filtrartipoycarrera WHERE Departamento = ?";
        }else{
            $stmt = "SELECT * FROM vista_personal_verusuarios_y_filtrartipoycarrera WHERE Carrera = ?";
        }
        $stmt = $conectar->prepare($stmt);
        $stmt->bindValue(1, $carrera);
        $stmt->execute();
        return $returnValue = $stmt->fetchAll();
    }

    //SIN USAR
    public function eliminarUsuario($clave){ //eliminar usuarios por clave 

        try {
            $conectar = parent::conectar();
            parent::set_names();
    
            $stmt = "DELETE FROM personal WHERE IDPersonal = ?";
            $stmt = $conectar->prepare($stmt);
            $stmt->bindValue(1, $clave);
            $stmt->execute();
    
            $rowCount = $stmt->rowCount();
            $stmt->closeCursor();
            return $rowCount;
        } catch (Exception $e) {
            throw new Exception("Error al eliminar el usuario: " . $e->getMessage());
        }

    }
    
    //insertar usuarios a la BD
    //usuario.controlador.php?op=agregar
    public function insertarUsuario ($clave, $nombre, $apellidoPaterno, $apellidoMaterno, $carrera, $tipo){ 
        $conectar = parent::conectar();
        parent::set_names();

        if($tipo=="Maestro"){
            $stmt = "INSERT INTO personal (IDPersonal, Nombre, ApellidoPaterno, ApellidoMaterno, Departamento, Tipo)
            VALUES (?, ?, ?, ?, ?, ?)";
    
            $stmt = $conectar->prepare($stmt);
            $stmt->bindValue(1, $clave);
            $stmt->bindValue(2, $nombre);
            $stmt->bindValue(3, $apellidoPaterno);
            $stmt->bindValue(4, $apellidoMaterno);
            $stmt->bindValue(5, $carrera);
            $stmt->bindValue(6, $tipo);
    
            try {
                $stmt->execute();
                return true;
            
            } catch (PDOException $e) {
                return false;
            }
        }else if($tipo=="Alumno"){
            $stmt = "INSERT INTO personal (IDPersonal, Nombre, ApellidoPaterno, ApellidoMaterno, Carrera, Tipo)
            VALUES (?, ?, ?, ?, ?, ?)";
    
            $stmt = $conectar->prepare($stmt);
            $stmt->bindValue(1, $clave);
            $stmt->bindValue(2, $nombre);
            $stmt->bindValue(3, $apellidoPaterno);
            $stmt->bindValue(4, $apellidoMaterno);
            $stmt->bindValue(5, $carrera);
            $stmt->bindValue(6, $tipo);
    
            try {
                $stmt->execute();
                return true;
            
            } catch (PDOException $e) {
                return false;
            }
        }
        
    }

    //usuario.controlador.php?op=editar
    public function editarRegistro($idpersonal, $nombre, $apellidopaterno, $apellidomaterno, $carrera, $tipo){
        $conectar = parent::conectar();
        parent::set_names();
        
        if($tipo=="Maestro"){
            $stmt = "UPDATE personal
            SET Nombre=?, ApellidoPaterno=?, ApellidoMaterno=?, Tipo=?, Departamento=?, Carrera=null
            WHERE IDPersonal = ?";

            $stmt = $conectar->prepare($stmt);
            $stmt->bindValue(1, $nombre);
            $stmt->bindValue(2, $apellidopaterno);
            $stmt->bindValue(3, $apellidomaterno);
            $stmt->bindValue(4, $tipo);
            $stmt->bindValue(5, $carrera); //hace la funcion de departamento
            $stmt->bindValue(6, $idpersonal);

            try {
                $stmt->execute();
                return true;
            } catch (PDOException $e) {
                error_log("Error en la edición: " . $e->getMessage(), 0);
                return false;
            }

        }else if($tipo=="Alumno"){

            $stmt = "UPDATE personal
            SET Nombre=?, ApellidoPaterno=?, ApellidoMaterno=?, Carrera=?, Tipo=?,Departamento=null
            WHERE IDPersonal = ?";
            $stmt = $conectar->prepare($stmt);
            $stmt->bindValue(1, $nombre);
            $stmt->bindValue(2, $apellidopaterno);
            $stmt->bindValue(3, $apellidomaterno);
            $stmt->bindValue(4, $carrera);
            $stmt->bindValue(5, $tipo);
            $stmt->bindValue(6, $idpersonal);

            try {
                $stmt->execute();
                return true;
            } catch (PDOException $e) {
                error_log("Error en la edición: " . $e->getMessage(), 0);
                return false;
            }
        }
    
    }

}

?>
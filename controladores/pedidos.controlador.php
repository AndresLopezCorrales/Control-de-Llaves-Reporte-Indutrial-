<?php

    require_once(__DIR__ . '/../conexion/conexion.php');
    require_once __DIR__ . '/../modelos/pedidosactivos.modelo.php';
    require_once(__DIR__ . "/../modelos/todospedidos.modelo.php");
    require_once(__DIR__ . "/../modelos/salon.modelo.php");
    require_once(__DIR__ . "/../modelos/usuario.modelo.php");

    
    $pedido = new ModeloPedidoActivo();
    $todospedido = new ModeloTodosPedidos();
    $salon = new ModeloSalon();
    $user = new ModeloUsuario();

    date_default_timezone_set('America/Hermosillo');
    $rutaArchivoLog = "../storage/logs.txt";

    //eliminarpedido.js
    if ($_SERVER["REQUEST_METHOD"]==="POST" && isset($_GET["op"]) && $_GET["op"] === "eliminar") {
        $resultado = array(
            "success" => false,
            "mensaje_agregar" => "",
            "mensaje_eliminar" => ""
        );
        $idPedidos = isset($_POST["IDPedidosActivo"]) ? $_POST["IDPedidosActivo"] : null;
        $registroPedido = $pedido->verPedidoporID($idPedidos);

        $idsalon = $registroPedido["IDSalon"];
        $idpersonal = $registroPedido["IDPersonal"];
        $llaves = $registroPedido["Llave"];
        $obj = $registroPedido["Objetos"];
        $fechaHoraCreacion = $registroPedido["FechaHoraCreacion"];
        $objetos = $llaves.",".$obj;

        if($todospedido->agregaraTodoslosPedidos($idsalon,$idpersonal,$objetos, $fechaHoraCreacion)){
            $fechaHora = date("Y-m-d H:i:s");

            $logInsert = "[$fechaHora] INSERT INTO todospedidos(IDSalon, IDPersonal, Objetos, FechaHoraCreacion, FechaHoraFinal) 
                            VALUES ($idsalon, $idpersonal, $objetos, $fechaHoraCreacion, $fechaHora)". PHP_EOL;

            $archivo = fopen($rutaArchivoLog, "a");

            if($archivo){
                fwrite($archivo, $logInsert);
                fclose($archivo);
                $resultado["success"] = true;
                $resultado["mensaje_agregar"] = "Pedido agregado correctamente en la tabla final";
            }else{
                $resultado["mensaje_agregar"] = "Error al escribir el registro de inserción en el archivo de log";
            }  
        }else{
            $resultado["mensaje_agregar"] = "Error al agregar el pedido en la tabla final";
        }

        if($llaves=="Llave"){
            $salon-> agregarLlave($idsalon);
        }
        $filasAfectadas = $pedido->eliminarPedidos($idPedidos);
        if ($filasAfectadas > 0) {
            $fechaHora = date("Y-m-d H:i:s");

            $logDelete = "[$fechaHora] DELETE FROM pedidosactivos WHERE IDPedidosActivo = $idPedidos". PHP_EOL;

            $archivo = fopen($rutaArchivoLog, "a");

            if($archivo){
                fwrite($archivo, $logDelete);
                fclose($archivo);
                $resultado["success"] = true;
                $resultado["mensaje_eliminar"] = "Pedido eliminado correctamente";
            }else{
                $resultado["mensaje_eliminar"] = "Error al escribir la eliminación del pedido en el archivo";
            }
        } else {
            $resultado["mensaje_eliminar"] = "No se encontró el pedido para eliminar";
        }

        echo json_encode($resultado);
    }
    //verPedidos.js
    if($_SERVER["REQUEST_METHOD"] === "GET" && isset( $_GET["op"]) && $_GET["op"]==="listar"){
        $datos = $pedido->verPedidos();
        $data = infoParaListar($datos);

        echo json_encode(array("data" => $data));
    }
    //agregarPedido.js
    if($_SERVER["REQUEST_METHOD"] === "POST" && isset( $_GET["op"]) && $_GET["op"]==="agregar") {
        $resultado = array("success" => false, "mensaje" => "Error al agregar el pedido");

        $empleado = isset($_POST["Nombre"]) ? $_POST["Nombre"] : null;
        $nombres = obtenerNombre($empleado);

        $matricula = $user->verClave($nombres["Nombre"], $nombres["Apellido"]);

        $claveSalon = isset($_POST["ClaveSalon"]) ? $_POST["ClaveSalon"] : null;

        $idsalon;
        if($claveSalon=="Otro"){
            $otrosalones = isset($_POST["OtrosSalones"])? $_POST["OtrosSalones"]:null;
            $idsalon = $salon->getSalonporClave($otrosalones);
        }else{
            $idsalon = $salon->getSalonporClave($claveSalon);
        }

        $llave = isset($_POST["Llave"]) ? $_POST["Llave"] : null;
        $aire = isset($_POST["Aire"]) ? $_POST["Aire"] : null;
        $proyector = isset($_POST["Proyector"]) ? $_POST["Proyector"] : null;
        $bocina = isset($_POST["Bocina"]) ? $_POST["Bocina"] : null;
        $mouse = isset($_POST["Mouse"]) ? $_POST["Mouse"] : null;
        $teclado = isset($_POST["Teclado"]) ? $_POST["Teclado"] : null;
        $otro = isset($_POST["Otro"]) ? $_POST["Otro"] : null;
        
        if ($pedido->agregarPedidos($idsalon, $matricula, $llave, $aire, $proyector, $bocina, $mouse, $teclado, $otro)) {
            $matriculaa = $matricula["IDPersonal"];
            $idsal = $idsalon["IDSalon"];
            
            $objetos = $aire.",".$proyector.",".$bocina.",".$mouse.",".$teclado.",".$otro;
            //quitar comas repetidas
            $objetos = preg_replace('/,{2,}/', ',', $objetos);
            //quitar ultima coma
            if (substr($objetos, -1) === ',') {
                $objetos = rtrim($objetos, ',');
            }
            $fechaHora = date("Y-m-d H:i:s");
            $logInsert = "[$fechaHora] INSERT INTO pedidosactivos(IDSalon, IDPersonal, Llave, Objetos, FechaHoraCreacion)
                            VALUES ($idsal, $matriculaa, $llave, $objetos, $fechaHora)". PHP_EOL;
            $archivo = fopen($rutaArchivoLog, "a");
            if($archivo){
                fwrite($archivo, $logInsert);
                fclose($archivo);
                $resultado["success"] = true;
                $resultado["mensaje"] = "Pedido agregado correctamente";
            }else{
                $resultado["mensaje"] = "Error al escribir en el archivo de log";
            }
        }        
        echo json_encode($resultado);
    }
    //filtrarInformacionPedidos.js
    if($_SERVER["REQUEST_METHOD"] === "POST" && isset( $_GET["op"]) && $_GET["op"]==="filtrar"){
        
	    if(count($_POST)===5){
            $nombre = isset($_POST["Nombre"])? $_POST["Nombre"] : null;
            // $nombres = obtenerNombre($nombre);
            $edificio = isset($_POST["Edificio"]) ? $_POST["Edificio"]: null;
            $datos = $pedido->filtrarPorNombreyEdificio($edificio, $nombre);
            $data = infoParaListar($datos);
            echo json_encode(array("data" => $data));
        }
        if(count($_POST)===3 && isset($_POST["Nombre"])){
            $nombre = isset($_POST["Nombre"])? $_POST["Nombre"] : null;
            // $nombres = obtenerNombre($nombre);
            $datos = $pedido->filtrarPorNombre($nombre);
            $data = infoParaListar($datos);
            echo json_encode(array("data" => $data));
        }
        if(count($_POST)===3 && isset($_POST["Edificio"])){
            $edificio = isset($_POST["Edificio"]) ? $_POST["Edificio"]: null;

            $datos = $pedido->filtrarporEdificio($edificio);
            $data = infoParaListar($datos);

            echo json_encode(array("data" => $data));
        }
    }

    //Se creo este método porque se repite en varias partes
    function infoParaListar($datos){
        $data = Array();
        foreach ($datos as $row) {
            $sub_array = array(
                "IDPedidosActivo" => $row["IDPedidosActivo"],
                "IDSalon" => $row["IDSalon"],
                "ClaveSalon"=>$row["ClaveSalon"],
                "IDPersonal" => $row["IDPersonal"],
                "Nombre"=>$row["Nombre"],
                "ApellidoPaterno"=>$row["ApellidoPaterno"],
                "ApellidoMaterno"=>$row["ApellidoMaterno"],
                "Llave" => $row["Llave"],
                "Objetos" => $row["Objetos"],
                "FechaHoraCreacion" => $row["FechaHoraCreacion"]
            );
            $data[] = $sub_array;
        }
        return $data;
    }
    
    //Se creo este método porque la lógica de este bloque se repite en varías partes del archivo
    function obtenerNombre($persona){
        $nombres = explode(" ", $persona);
        $array = array("Nombre"=>"", "Apellido"=>"");

        if(count($nombres)===4){
            $array["Nombre"] = $nombres[0]." ".$nombres[1];
            $array["Apellido"] = $nombres[2];
        }else{
            $array["Nombre"] = $nombres[0];
            $array["Apellido"] = $nombres[1];
        }
        return $array;
    }
?>

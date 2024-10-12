<?php

class Conexion{
    protected $db;
    protected function conectar(){
        try{
            //cambiar segun sus credenciales y su puerto
            $link = $this->db =new PDO("mysql:host=localhost:3306;dbname=reporteindustrial","root","");
            return $link;
        }catch(Exception $e){
            print "ERROR BD:    ->". $e->getMessage() ."<br>";
            die();
        }
    }
    
    public function set_names(){
        return $this->db->query("set names 'utf8'");
    }
    
}

?>

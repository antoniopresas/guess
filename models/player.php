<?php 

class Player extends Connection
{
    public $id;
    public $nick_name;
    public $email;
    public $password;

    public $db;

    public function __contructor(){
        $this->db = Connection::connect();
    
    }

    public function create_player($name, $email, $pas) {

        $consulta = "INSERT INTO `player` ( `nick_name`, `password`, `email`) VALUES ('". $name ."', '". $password ."', '". $email ."')";

        $query = $this->db->query($consulta);
        echo $query;        
        $respuesta = "Jugador creado";

        return $respuesta;

    }

    

}

?>
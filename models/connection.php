<?php 

class Connection
{
    private $host = "Localhost";
    private $user = "root";
    private $password = "";
    private $data_base = "guess";

    public function conect() {
        $conn = new mysqli( 
            $this->host, 
            $this->user, 
            $this->password, 
            $this->data_base);

        return $conn;
    }

}

?>
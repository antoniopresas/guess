<?php 

class Connection
{
    private $host = "Localhost";
    private $user = "root";
    private $password = "";
    private $data_base = "guess";

    public function connect() {
        $conn = new mysqli( 
            $this->host, 
            $this->user, 
            $this->password, 
            $this->data_base);
        
        if ($conn->connect_errno) {
                printf("Conexión fallida: %s\n", $conn->connect_error);
                exit();
            }

        return $conn;
    }

}

?>
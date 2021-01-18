<?php 
require_once('../models/connection.php');
require_once('../models/player.php');

$player = new Player();

$name = $_POST['name'];

$email = $_POST['email'];

$rePassword = $_POST['password'];

if ($rePassword === $_POST['password']) {
    $pass = $rePassword;
    $player -> create_player($name, $email, $pass);

} else {
    echo "contraseña es diferente";
}

require('views/sign_up.php');


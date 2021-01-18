<?php
if(isset($_POST['number'])) {
   $number = $_POST['number'];
   $intentos = $_POST['intentos'] + 1;
} else {
   $intentos = 1;
   $number = rand(1,100);
}
echo $number;
?>

<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Adivina</title>
      <script type="text/javascript">
          function FocusOnInput()
          {
             document.getElementById("guess").focus();
          }
      </script>
   </head>

<body onload="FocusOnInput()">
<h1>Adivina!</h1>

<p>Intenta adivinar un numero entre 1 y 100.</p>
<form action="<?=$_SERVER['PHP_SELF'] ?>" method="post" name="guess-a-number">
    <label>Ingresa un numero:</label><br/ >
    <input type="text" id="guess" name="guess" />
    <input name="number" type="hidden" value="<?= $number ?>" />
    <input name="intentos" type="hidden" value="<?= $intentos ?>" />
    <input name="submit" type="submit" value="Prueba suerte!" />
</form>

<form action="<?=$_SERVER['PHP_SELF'] ?>" method="post" name="new-number">
    <input name="submit" type="submit" value="Nuevo Juego" />
</form>

<?php
if(isset($_POST['guess'])) {

    $guess  = $_POST['guess'];
    $number  = $_POST['number'];
    $intentos = $_POST['intentos'];


	if (!is_numeric($guess)) {
		echo "Ey! Lo que ingresaste no es un numero.";
	}
	else
	{
		if ($guess > 100){ 
    		echo "El numero es mayor que 100";
		}elseif ($guess < 1){ 
    		echo "El numero es menor que 1";
		}elseif ($guess < $number){ 
    		echo "Intenta con un numero numero alto.";
		}elseif($guess > $number){       
    		echo "Intenta con un numero numero bajo.";
		}elseif($guess == $number){      
    		echo "<p>Excelente!! Lo adivinaste!!</p>";
			echo "<p>Obtuviste ",$puntos = round(1000/$intentos), " puntos!.</p>";
		}
	}
}
?>

</body>
</html>
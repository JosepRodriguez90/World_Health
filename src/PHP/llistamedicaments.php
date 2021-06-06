<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

   $db_host = "localhost";
    $db_user = "root";
    $db_password = "usbw";
    $db_name = "kummonapps";

    $conexion = mysqli_connect($db_host, $db_user, $db_password, $db_name) or die(mysql_error());

    if (!$conexion)
    {
        die("No se ha podido realizar la corrección ERROR:" . mysqli_connect_error() . "<br>");
    }
    else
    {
        mysqli_set_charset ($conexion, "utf8");
    }


  $headers = apache_request_headers();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata);

  $x=0;

  $cesta="SELECT id_medicament, nom, codi_barres FROM medicaments ORDER BY codi_barres";

  $resultados=mysqli_query($conexion, $cesta);

  while ($valores = mysqli_fetch_array($resultados)) {
    $array[$x][0]=$valores[0];
    $array[$x][1]=$valores[1];
    $array[$x][2]=$valores[2];

    $x++;

  }


// echo "<div>" .  $valor. "</div>";
// echo "<div>" .   $fila['nom'] . "</div>";
echo json_encode($array);

?>

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

  $cesta="DELETE FROM medicaments where id_medicament=$request";


  $resultados=mysqli_query($conexion, $cesta);


  header('Content-Type: application/json');
  echo json_encode($request);


  ?>

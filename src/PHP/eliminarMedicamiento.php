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
        $funcioneconex=1;
    }
    else
    {
        mysqli_set_charset ($conexion, "utf8");
        $funcioneconex=0;
    }


  $headers = apache_request_headers();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata);


  $cesta4="DELETE FROM simptomatologia where id_medicament=$request";

  $resultados=mysqli_query($conexion, $cesta4);

  $cesta3="DELETE FROM patologia where id_medicament=$request";

  $resultados=mysqli_query($conexion, $cesta3);

  $cesta7="DELETE FROM laboratori where id_medicament=$request";

  $resultados=mysqli_query($conexion, $cesta7);

  $cesta1="DELETE FROM efectes_secundaris where id_medicament=$request";

  $resultados=mysqli_query($conexion, $cesta1);

  $cesta2="DELETE FROM forma_farmaceutica where id_medicament=$request";

  $resultados=mysqli_query($conexion, $cesta2);

  $cesta="DELETE FROM medicaments where id_medicament=$request";

  $resultados=mysqli_query($conexion, $cesta);



  header('Content-Type: application/json');
  echo json_encode($funcioneconex);


  ?>

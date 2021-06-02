<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept');
header('Content-Type: text/html; charset=UTF-8');

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

// Get the posted data.

$postdata = file_get_contents("php://input");

//print_r($postdata);

if(isset($postdata) && !empty($postdata))
{

  $boleana=true;
  // Extract the data.
  $request = json_decode($postdata);

  $password = mysqli_real_escape_string($conexion, trim($request->password));   //guarda  del request el username a la nova variable $username.
  $firstname = mysqli_real_escape_string($conexion, trim($request->firstName));  // "
  $lastname = mysqli_real_escape_string($conexion, trim($request->lastName));  // "
  $email = mysqli_real_escape_string($conexion, trim($request->email));  // "
  $telefon = mysqli_real_escape_string($conexion, trim($request->telefon));  // "
  $dni = mysqli_real_escape_string($conexion, trim($request->dni));  // "
  $num_colegiat = mysqli_real_escape_string($conexion, trim($request->numero_colegiado));  // "
  $especialidad = mysqli_real_escape_string($conexion, trim($request->especialidad));  // "


  $inserta="SELECT id FROM proves";


  $resultados=mysqli_query($conexion, $inserta);
  $resultadoid = mysqli_fetch_assoc($resultados);
  $final=$resultadoid['id'];



  // Update.
   $sql = "UPDATE `usuari` SET
   `contrasenya`='$password',
   `nom`='$firstname',
   `cognom`='$lastname',
   `email`='$email',
   `telefon`='$telefon',
   `dni`='$dni',
   `num_colegiat`='$num_colegiat',
   `altres`='$especialidad'
    WHERE `id_usuari` = '{$final}'";

  $delete="DELETE FROM proves";

  $resultados1=mysqli_query($conexion, $delete);



  echo json_encode(array("result" => true));

  if(mysqli_query($conexion, $sql))
  {
    http_response_code(204);
  }
  else
  {
    // return http_response_code(422);
  }
}

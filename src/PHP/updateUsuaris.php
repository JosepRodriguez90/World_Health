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
    die("No se ha podido realizar la correcciÃ³n ERROR:" . mysqli_connect_error() . "<br>");
}
else
{
    mysqli_set_charset ($conexion, "utf8");
}

// Get the posted data.

$postdata = file_get_contents("php://input");
$entrar = true;
//print_r($postdata);

if(isset($postdata) && !empty($postdata))
{

  $boleana=true;
  // Extract the data.
  $request = json_decode($postdata);

  $id = mysqli_real_escape_string($conexion, trim($request->id));
  $password = mysqli_real_escape_string($conexion, trim($request->password));   //guarda  del request el username a la nova variable $username.
  $firstname = mysqli_real_escape_string($conexion, trim($request->firstName));  // "
  $lastname = mysqli_real_escape_string($conexion, trim($request->lastName));  // "
  $email = mysqli_real_escape_string($conexion, trim($request->email));  // "
  $telefon = mysqli_real_escape_string($conexion, trim($request->telefon));  // "
  $dni = mysqli_real_escape_string($conexion, trim($request->dni));  // "
  $num_colegiat = mysqli_real_escape_string($conexion, trim($request->numero_colegiado));  // "
  $especialidad = mysqli_real_escape_string($conexion, trim($request->especialidad));  // "

  $userExistSelect = "select count(*) as cuantos from usuari where num_colegiat = '$num_colegiat'"; //busca l'usuari existeix.
  $consultaUserExistSelect = mysqli_query($conexion, $userExistSelect);
  $resultadoUserExistSelect = mysqli_fetch_assoc($consultaUserExistSelect);

  $inserta="SELECT id FROM proves";


  $resultados=mysqli_query($conexion, $inserta);
  $resultadoid = mysqli_fetch_assoc($resultados);
  $final=$resultadoid['id'];


  if($resultadoUserExistSelect['cuantos'] == 1){  //si el resultat es 1 voldra dir que ja existeix l'usuari.
    $entrar = false;
  }

  if($entrar == true){ //si es true fa el insert i afegeix l'usuari.
    // Store.

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


  if(mysqli_query($conexion,$sql)){
    http_response_code(201); //obte el codi de resposta.
  }
  else{
    http_response_code(422);
  }
  echo json_encode(array("resultat" => true));
}
else{
  echo json_encode(array("message" => "Error al registrar, el usuario ya existe", "resultat" => false));
}
}

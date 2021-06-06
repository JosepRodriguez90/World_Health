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

  $nom = mysqli_real_escape_string($conexion, trim($request->Nombre));
  $composicio = mysqli_real_escape_string($conexion, trim($request->composicion));  // "
  $codi_barres = mysqli_real_escape_string($conexion, trim($request->codigo));  // ""
  $comentaris = mysqli_real_escape_string($conexion, trim($request->comentarios));  // ""


  $userExistSelect = "select count(*) as cuantosmedica from medicaments where codi_barres = '$codi_barres'";
  $consultaUserExistSelect = mysqli_query($conexion, $userExistSelect);
  $resultadoUserExistSelect = mysqli_fetch_assoc($consultaUserExistSelect);

  if($resultadoUserExistSelect['cuantosmedica'] == 1){
    $entrar = false;
  }


  if($entrar == true){

  $inserta="SELECT id FROM proves";


  $resultados=mysqli_query($conexion, $inserta);
  $resultadoid = mysqli_fetch_assoc($resultados);
  $final=$resultadoid['id'];



  // Update.
   $sql = "UPDATE `medicaments` SET
   `nom`='$nom',
   `composicio`='$composicio',
   `codi_barres`='$codi_barres',
   `comentaris`='$comentaris'
    WHERE `id_medicament` = '{$final}'";

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
  echo json_encode(array("message" => "Error al registrar, el medicamento ya existe", "resultat" => false));
}
}

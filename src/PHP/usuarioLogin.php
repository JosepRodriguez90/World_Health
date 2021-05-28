<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

require 'BD.php';

$headers = apache_request_headers();
$postdata = file_get_contents("php://input");
$entrar = false;
$BDcon = new BD();
$con = $BDcon->conexio();
$request = json_decode($postdata);

if(isset($postdata) && !empty($postdata)) {
  $request = json_decode($postdata);

  $correu = $request->correu;
  $contrasenya = $request->contrasenya;

  $userExistSelect = "select count(*) as cuantos from usuari where email = '$correu'";
  $passwordExistSelect = "select contrasenya from usuari where email = '$correu' having contrasenya = '$contrasenya'";
  $consultaUserExistSelect = mysqli_query($con, $userExistSelect);
  $consultaPasswordExistSelect = mysqli_query($con, $passwordExistSelect);
  $resultadoUserExistSelect = mysqli_fetch_assoc($consultaUserExistSelect);
  $resultadoPasswordExistSelect = mysqli_fetch_assoc($consultaPasswordExistSelect);

  if($resultadoUserExistSelect['cuantos'] == 1){
      if($resultadoPasswordExistSelect !== null){
        echo json_encode(array(
          "missatge" => "Login Correcto",
          "correu" => $correu
        ));
      }
      else{
        echo json_encode(array(
          "missatge" => "Contraseña Incorrecta",
        ));
      }
  }
  else{
    echo json_encode(array(
      "missatge" => "Usuario Inexistente"
    ));
  }
}
?>

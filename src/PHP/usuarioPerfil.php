<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Origin, x-Requested-With, Content-Type, Accept');
header('Content-Type: application/json');

require 'BD.php';

$postdata = file_get_contents("php://input");
$BDcon = new BD();
$con = $BDcon->conexio();

if(isset($postdata) && !empty($postdata)) {

  // $correu = json_decode($postdata);

  // $query = "SELECT nom, cognom, telefon, email, dni, num_colegiat, altres FROM usuari WHERE email = '$correu'";
  // $resultat = mysqli_query($con, $query);

  // $datos[];

  // while($row = mysqli_fetch_assoc($resultat)){

  //   $datos[] = $row;
  //   $con->close();
  //   echo json_encode($datos);
  // }

  // ************************************SEGUNDO EJEMPLO*************************************************

  $correu = json_decode($postdata);

  $selectNom = "select nom from usuari where email = '$correu'";
  $selectCognom = "select cognom from usuari where email = '$correu'";
  $selectTelefon = "select telefon from usuari where email = '$correu'";
  $selectEmail = "select email from usuari where email = '$correu'";
  $selectDni = "select dni from usuari where email = '$correu'";
  $selectNumColegiat = "select num_colegiat from usuari where email = '$correu'";
  $selectAltres = "select altres from usuari where email = '$correu'";

  $consultaNom = mysqli_query($con, $selectNom);
  $consultaCognom = mysqli_query($con, $selectCognom);
  $consultaTelefon = mysqli_query($con, $selectTelefon);
  $consultaEmail = mysqli_query($con, $selectEmail);
  $consultaDni = mysqli_query($con, $selectDni);
  $consultaNumColegiat = mysqli_query($con, $selectNumColegiat);
  $consultaAltres = mysqli_query($con, $selectAltres);

  $resultadoNom = mysqli_fetch_assoc($consultaNom);
  $resultadoCognom = mysqli_fetch_assoc($consultaCognom);
  $resultadoTelefon = mysqli_fetch_assoc($consultaTelefon);
  $resultadoEmail = mysqli_fetch_assoc($consultaEmail);
  $resultadoDni = mysqli_fetch_assoc($consultaDni);
  $resultadoNumColegiat = mysqli_fetch_assoc($consultaNumColegiat);
  $resultadoAltres = mysqli_fetch_assoc($consultaAltres);


  echo json_encode(
    array(
      "nom" => $resultadoNom["nom"],
      "cognom" => $resultadoCognom["cognom"],
      "telefon" => $resultadoTelefon["telefon"],
      "email" => $correu,
      "dni" => $resultadoDni["dni"],
      "num_colegiat" => $resultadoNumColegiat["num_colegiat"],
      "altres" => $resultadoAltres["altres"]
    )
  );
}

?>

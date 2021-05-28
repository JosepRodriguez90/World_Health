<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

require 'BD.php';

$headers = apache_request_headers();
$postdata = file_get_contents("php://input");
$BDcon = new BD();
$con = $BDcon->conexio();

// $correu = json_decode($postdata);

// $query = "SELECT * FROM usuari WHERE email = '$correu'";
// $resultat = mysqli_query($con, $query);

// $datos[];

// while($row = mysqli_fetch_assoc($resultado)){
//   $datos[] = $row;


// $con->close();

// echo json_encode($datos);
// }

if(isset($postdata) && !empty($postdata)) {

  $correu = json_decode($postdata);

  $selectNom = "select nom from usuari where email = '$correu'";
  $selectCognom = "select cognom from usuari where email = '$correu'";
  $selectTelefon = "select telefon from usuari where email = '$correu'";
  $selectDni = "select dni from usuari where email = '$correu'";
  $selectNumColegiat = "select num_colegiat from usuari where email = '$correu'";
  $selectAltres = "select altres from usuari where email = '$correu'";

  $consultaNom = mysqli_query($con, $selectNom);
  $consultaCognom = mysqli_query($con, $selectCognom);
  $consultaTelefon = mysqli_query($con, $selectTelefon);
  $consultaDni = mysqli_query($con, $selectDni);
  $consultaNumColegiat = mysqli_query($con, $selectNumColegiat);
  $consultaAltres = mysqli_query($con, $selectAltres);

  $resultadoNom = mysqli_fetch_assoc($consultaNom);
  $resultadoCognom = mysqli_fetch_assoc($consultaCognom);
  $resultadoTelefon = mysqli_fetch_assoc($consultaTelefon);
  $resultadoDni = mysqli_fetch_assoc($consultaDni);
  $resultadoNumColegiat = mysqli_fetch_assoc($consultaNumColegiat);
  $resultadoAltres = mysqli_fetch_assoc($consultaAltres);

  echo json_encode(array(
    "nom" => $resultadoNom,
    "cognom" => $resultadoCognom,
    "telefon" => $resultadoTelefon,
    "email" => $correu,
    "dni" => $resultadoDni,
    "num_colegiat" => $resultadoNumColegiat,
    "altres" => $resultadoAltres
  ));
}

?>

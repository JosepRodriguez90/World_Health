<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Origin, x-Requested-With, Content-Type, Accept');
header('Content-Type: application/json');
header("Content-Type: text/html;charset=utf-8");

require 'BD.php';

$postdata = file_get_contents("php://input");
$BDcon = new BD();
$con = $BDcon->conexio();
$con->set_charset("utf8");

if(isset($postdata) && !empty($postdata)) {

  $x=0;

  $idMedicament = json_decode($postdata);

  $selectNom = "SELECT nom AS 'nombre' FROM medicaments WHERE id_medicament = $idMedicament";
  $selectCB = "SELECT codi_barres AS 'codi' FROM medicaments WHERE id_medicament = $idMedicament";
  $selectCompo = "SELECT composicio AS 'compo' FROM medicaments WHERE id_medicament = $idMedicament";
  $selectComen = "SELECT comentaris AS 'comen' FROM medicaments WHERE id_medicament = $idMedicament";
  $selectEfect = "SELECT descripcio AS 'efect' FROM efectes_secundaris WHERE id_medicament = $idMedicament";
  $selectNomLab = "SELECT nom AS 'nomlab' FROM laboratori WHERE id_medicament = $idMedicament";
  $selectDirLab = "SELECT descripcio AS 'dirlab' FROM laboratori WHERE id_medicament = $idMedicament";
  $selectSimp = "SELECT descripcio AS 'simp' FROM simptomatologia WHERE id_medicament = $idMedicament";

  $consulta01 = mysqli_query($con, $selectNom);
  $consulta02 = mysqli_query($con, $selectCB);
  $consulta03 = mysqli_query($con, $selectCompo);
  $consulta04 = mysqli_query($con, $selectComen);
  $consulta05 = mysqli_query($con, $selectEfect);
  $consulta06 = mysqli_query($con, $selectNomLab);
  $consulta07 = mysqli_query($con, $selectDirLab);
  $consulta08 = mysqli_query($con, $selectSimp);

  $valores01 = mysqli_fetch_assoc($consulta01);
  $valores02 = mysqli_fetch_assoc($consulta02);
  $valores03 = mysqli_fetch_assoc($consulta03);
  $valores04 = mysqli_fetch_assoc($consulta04);
  $valores05 = mysqli_fetch_assoc($consulta05);
  $valores06 = mysqli_fetch_assoc($consulta06);
  $valores07 = mysqli_fetch_assoc($consulta07);
  $valores08 = mysqli_fetch_assoc($consulta08);

  echo json_encode(
    array(
      "nomMed" => $valores01["nombre"],
      "codi" => $valores02["codi"],
      "compo" => $valores03["compo"],
      "comen" => $valores04["comen"],
      "efect" => $valores05["efect"],
      "nomlab" => $valores06["nomlab"],
      "dirlab" => $valores07["dirlab"],
      "simp" => $valores08["simp"]
    )
  );




}



?>

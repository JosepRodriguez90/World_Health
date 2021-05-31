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
  $entrar = true;

 if(isset($postdata) && !empty($postdata)) {

   $request = json_decode($postdata);

   // Sanitize.

   $nom = mysqli_real_escape_string($conexion, trim($request->Nombre));   //guarda  del request el username a la nova variable $username.
   $composicio = mysqli_real_escape_string($conexion, trim($request->composicion));  // "
   $codi_barres = mysqli_real_escape_string($conexion, trim($request->codigo));  // ""
   $comentaris = mysqli_real_escape_string($conexion, trim($request->comentarios));  // ""

   $userExistSelect = "select count(*) as cuantosmedica from medicaments where codi_barres = '$codi_barres'";
   $consultaUserExistSelect = mysqli_query($conexion, $userExistSelect);
   $resultadoUserExistSelect = mysqli_fetch_assoc($consultaUserExistSelect);

   if($resultadoUserExistSelect['cuantosmedica'] == 1){
     $entrar = false;
   }

   if($entrar == true){ //si es true fa el insert i afegeix l'usuari.
     // Store.
     $sql = "INSERT INTO `medicaments`(
       `nom`,
       `composicio`,
       `codi_barres`,
       `comentaris`
       ) VALUES
     ('{$nom}',
      '{$composicio}',
      '{$codi_barres}',
      '{$comentaris}'
     )";
     if(mysqli_query($conexion,$sql)){
       http_response_code(201); //obte el codi de resposta.
     }
     else{
       http_response_code(422);
     }
     echo json_encode(array("result" => true));
   }
   else{
     echo json_encode(array("message" => "Error al registrar, el usuario ya existe", "result" => false));
   }
 }

 ?>

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
   // $id = "select id from alumne where username = '$username'";
   // $consultaId = mysqli_query($con, $id);
   // $resultatConsultaId = mysqli_fetch_assoc($consultaId);

   if($resultadoUserExistSelect['cuantos'] == 1){  //si el resultat es 1 voldra dir que ja existeix l'usuari.
     $entrar = false;
   }

   if($entrar == true){ //si es true fa el insert i afegeix l'usuari.
     // Store.
     $sql = "INSERT INTO `usuari`(
       `contrasenya`,
       `nom`,
       `cognom`,
       `email`,
       `telefon`,
       `dni`,
       `num_colegiat`,
       `altres`
       ) VALUES
     ('{$password}',
      '{$firstname}',
      '{$lastname}',
      '{$email}',
      '{$telefon}',
      '{$dni}',
      '{$num_colegiat}',
      '{$especialidad}'
     )";
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

 ?>

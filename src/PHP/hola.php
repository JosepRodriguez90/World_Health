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


echo json_encode(array("message" => "Login OK."));

?>

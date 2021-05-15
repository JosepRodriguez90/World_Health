<?php

    $mysql_host = "localhost";
    $mysql_usuario = "root";
    $mysql_passwd = "usbw";
    $mysql_db = "kummonapps";
        
    $con = mysqli_connect($mysql_host, $mysql_usuario, $mysql_passwd, $mysql_db);

    if(!$con){
        die("ERROR - No se ha podido conectar a la Base de Datos"."<br>".mysqli_connect_error()."<br>");
    }
    else{
        $_SESSION["conexion"] = $con;
    }   
    
?>
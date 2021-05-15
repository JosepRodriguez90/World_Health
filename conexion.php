<?php

$mysql_host = "localhost";
$mysql_usuario = "root";
$mysql_passwd = "usbw";
$mysql_db = "daw2_jscjm";

$enlace = mysqli_connect($mysql_host, $mysql_usuario, $mysql_passwd, $mysql_db);

/* Comprobar conexion*/

if (mysqli_connect_errno()) {
    printf("Fallo la conexion %s\n", mysqli_connect_errno());
    exit();
} 

/* Para que se vea con la codificacion adecuada*/
mysqli_set_charset($enlace, 'utf8');
?>
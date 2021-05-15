<?php
require 'conexion.php';
$nodo = $_POST['nodo'];
$nombre = $_POST['nombre'];
$nombreAnt = $_POST['nombreAnt'];
$caracteristicas = $_POST['caracteristicas'];
/*echo "Nodo :" . $nodo;
echo "<br>";
echo "caracteristicas: " . $caracteristicas;
echo "<br>";
echo "nombre :" . $nodo;
echo "nombreAnt :" . $nombreAnt;*/


//nuevos nodos
$numHijoI = $nodo * 2;
$numHijoD = $nodo * 2 + 1;

//textos
$nombreHijoI = $nombre;
$nombreHijoD = $nombreAnt;
//pregunta
$pregunta = $caracteristicas;
//guardar la info a la bd

$consulta = "INSERT INTO arbol (nodo,texto,pregunta) VALUES('".$NumHijoI."','".$nombre."',FALSE);";
mysqli_query($enlace, $consulta);

$consulta = "INSERT INTO arbol (nodo,texto,pregunta) VALUES('".$NumHijoD."','".$nombreAnterior."',FALSE);";
mysqli_query($enlace, $consulta);

$consulta = "UPDATE arbol SET texto = '".$caracteristicas."',pregunta = TRUE WHERE nodo = '".$nodo."';";
mysqli_query($enlace, $consulta);


//----------------------------------------------
//GUARDAMOS EL LOG DE LA PARTIDA
$consulta = "INSERT INTO partida (personaje,acierto) VALUES('".$nombre."',FALSE);";
mysqli_query($enlace, $consulta);


//VOLVEMOS A LA PÁGINA PRINCIPAL
header("Location:index.php?n=1&r=0");?>
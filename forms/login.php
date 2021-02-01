<?php
    //Llamada al archivo php de BD.php para llamar los metodos de dicha clase
    require_once "../assets/php/BD.php";

    //Parametros del FORMULARIO
    $user = $_POST["user"];
    $password = $_POST["password"];
    $validation = false;
    $conexion;
    $BBDD;

    //Creacion de un objeto tipo Base para llamar metodos
    $BBDD = new Base();

    //Guardamos la conexion en esta variable
    //$conexion = $conexion->ConectarBD(); esta sentencia es invalida, siempre hay que tener un nombre diferente el que recibe el retorno y el que llama el metodo
    $conexion = $BBDD->ConectarBD();

    //Guardamos el boolean de validado
    $validation = $BBDD->UserValidator($user, $password, $conexion);

    //Si el boolean es FALSE nos retorna a login si es correcto nos envia a HOME
    if(!$validation){
        include("../login.html");
    }
    else{
        session_start();
        $_SESSION["user"] = $user;
        include_once("../home.html");
    }		
?> 
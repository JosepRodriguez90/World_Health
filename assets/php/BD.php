<?php
    class Base{
        //Atributos de CONEXION
        public $BDservidor = "localhost";
        public $BDusuario = "root";
        public $BDcontrasenya = "usbw";
        public $BDnombre = "projecte";

        //Funcion que devuelve la conexion si se puede conectar, sino envia un mensaje de error
        public function ConectarBD(){
            $conexion = mysqli_connect($this->BDservidor, $this->BDusuario, $this->BDcontrasenya, $this->BDnombre);
            if(!$conexion){
                die("ERROR - No se ha podido conectar a la Base de Datos".mysqli_connect_error()."<br>");
            }
            else{
                return $conexion;
            }
        }

        //Funcion para comprobar que el usuario existe y la contraseña es correcta, se le pasa como parametros el usuario, la contraseña i la conexion.
        //Devuelve un boolean para validar y los respectivos mensajes por si los datos no encajan. Por defecto el boolean sera FALSE
        public function UserValidator($user, $password, $conexion){
            $validation = false;
            $userExistSelect = "select count(*) as cuantos from usuario where user = '$user'";
            $passwordExistSelect = "select password from usuario where user = '$user' having password = '$password'";
            $consultaUserExistSelect = mysqli_query($conexion, $userExistSelect);
            $consultaPasswordExistSelect = mysqli_query($conexion, $passwordExistSelect);
            $resultadoUserExistSelect = mysqli_fetch_assoc($consultaUserExistSelect);
            $resultadoPasswordExistSelect = mysqli_fetch_assoc($consultaPasswordExistSelect);

            if($resultadoUserExistSelect['cuantos'] == 0){
                echo "<script>alert('ERROR - El usuario no existe');</script>";
                return $validation;
            }
            else if(!$resultadoPasswordExistSelect){
                echo "<script>alert('ERROR - Usuario o contraseña incorrectos');</script>";
                return $validation;
            }
            else{
                echo "<script>alert('Login correcto');</script>";
                $validation = true;
                return $validation;
            }
        }
    }
    
?>
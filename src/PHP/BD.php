<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, x-Requested-With, Content-Type, Accept");
header('Content-Type: application/json');

class BD{
  private $db_host = "localhost";
  private $db_user = "root";
  private $db_password = "usbw";
  private $db_name = "kummonapps";
  private $con = false;

  public function conexio(){
    $this->con = new mysqli($this->db_host, $this->db_user, $this->db_password, $this->db_name);
    return $this->con;
  }

}

?>

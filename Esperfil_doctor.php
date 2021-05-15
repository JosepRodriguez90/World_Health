<?php

@session_start();
$nickLog=$_SESSION["nick_logueado"];

header("Content-Type: text/html;charset=utf-8");

	$servidor="localhost";
	$usuario="root";
	$contraseña="usbw";
	$bd="kummonapps";	

    $value=1;
    $c=1;

	$conexion = mysqli_connect($servidor, $usuario, $contraseña, $bd) or die(mysql_error());
	
	if (!$conexion)
	{
		die("No se ha podido realizar la corrección ERROR:" . mysqli_connect_error() . "<br>");
	}
	else
	{
		mysqli_set_charset ($conexion, "utf8");
		//echo "Se ha conectado a la base de datos" . "<br>";
  }


$instruccion = "select * from usuari where email = '". $nickLog . "'";
$resultados = mysqli_query($conexion, $instruccion);
$fila=mysqli_fetch_row($resultados);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Perfil</title>
  
  <!--  Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>
  <!-- ======= Header logfejat ======= -->
<header id="header" >
  <div class="container d-flex align-items-center" style="margin-top: 25px;">
    <a href="Esperfil_doctor.php">
    <img class="me-auto" src="assets/img/logo_wh.jpg" width="300">
    </a>
    <!-- <h1 class="logo me-auto"><a href="index.html"><img src="assets/img/logo_wh.jpg"></a></h1> -->
    <!-- Uncomment below if you prefer to use an image logo -->
    <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

    <nav id="navbar" class="navbar order-last order-lg-0" style="padding-left: 350px;">
      <ul>
        <li><a class="nav-link scrollto active" href="Esperfil_doctor.php">Perfil</a> </li>

        <li><a class="nav-link scrollto " href="Esinformacion.html">Informacion</a></li>
        <li><a class="nav-link scrollto" href="Esbuscador.html">Buscar Medicamentso</a></li>
           
        <li><a class="nav-link scrollto" href="Espregunta1.html">I.A. </a></li>
      </ul>
      <i class="bi bi-list mobile-nav-toggle"></i>
    </nav><!-- .navbar -->
    <ul>      <li style="display: none;"><a class="nav-link scrollto" style="display: none;"></a></li>


    </ul>
    <a href="Esindex.html"><span class="btn btn-danger">Cerrar sesion</span></a>

  </div>
</header><!-- End Header -->

  <div class="container p-4" style="margin-top: -50px;"> 
    <!-- <div *ngIf="token" class="float-right" ><button class="btn btn-light"(click)="logOut()" >Logout</button></div> -->
    <br>
    <br>
    <div class="main-body" *ngFor="let user of this.users">
      <!-- style="position: relative; left: 100%;" -->
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="assets/img/doctors/doctors-1.jpg" class="rounded-circle" alt="fotoDoctor" width="150">
                    <div class="mt-3">
                    <?php 
                      echo("<form class='form-inline' action='Esperfil_doctor.php' method = 'GET'>" .$fila[8] ."</form>");
                       ?>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <a href=""><h6 class="mb-0"><i class="far fa-star"></i>  Cetirizina </h6></a>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <a href=""><h6 class="mb-0"><i class="far fa-star"></i>  Desloratadina </h6></a>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <a href=""><h6 class="mb-0"><i class="far fa-star"></i>  Loratadina </h6></a>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <a href=""><h6 class="mb-0"><i class="fas fa-search"></i>  Buscado recientemente: Levocetirizina </h6></a>
                  </li>
                </ul>
              </div>
            </div>
          
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Nombre</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <?php 
                      echo("<form class='form-inline' action='Esperfil_doctor.php' method = 'GET'>" .$fila[1] ."</form>");
                       ?>

                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Apellidos</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                    <?php 
                      echo("<form class='form-inline' action='miCuenta1.php' method = 'GET'>" .$fila[2] ."</form>");
                       ?>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                    <?php 
                      echo("<form class='form-inline' action='miCuenta1.php' method = 'GET'>" .$fila[4] ."</form>");
                       ?>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Telefono</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                    <?php 
                      echo("<form class='form-inline' action='miCuenta1.php' method = 'GET'>" .$fila[3] ."</form>");
                       ?>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-9 text-secondary">
                  </div>
                  </div>
                </div>
                
              </div>
                <a href="Essoporte.html" style="margin-left: 625px;"><span  class="btn btn-warning">Soporte</span></a>

            </div>
          </div>
        </div>
    </div>
    <!-- Footer -->

<div class="container d-md-flex py-4">

  <div class="me-md-auto text-center text-md-start">
    <div class="copyright">
      &copy; Copyright <strong><span>Health World</span></strong>. <br>All Rights Reserved
    
     Designed by <a href="https://kummonapps.github.io/Castellano.html">KummonApps</a>
    </div>
  </div>
  <div class="social-links text-center text-md-right pt-3 pt-md-0">
    <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
    <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
    <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
    <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
    <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
  </div>
</div>
</footer><!-- End Footer -->
</body>

</html>
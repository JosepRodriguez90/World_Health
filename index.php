<html>

<header>
    <title>   HealthWorld </title>
    <link rel="stylesheet" type="text/css" href="css/  HealthWorld.css">
</header>

<body>

    <head>
        <h1>  HealthWorld</h1>
    </head>
    <main>
    <?php
    //conectar con la bd
    require 'conexion.php';
    //RECOGER EL NUMERO DEL NODO DE LA URL (PARAMETRO)
    $nodo = 1; //valor por defecto del nodo
    $nodoRepuesto = 0;
    $numPregunta = 1;
    $proxPregunta = 2;

    if (isset($_GET['n'])) {
        $nodo = $_GET['n'];
    }
    if(isset($_GET['r'])) {
        $nodoRepuesto = $_GET["r"];
    }
    
    if(isset($_GET['np'])) {
        $numPregunta = $_GET["np"];
        $proxPregunta = $numPregunta+1;
    }


//------------------------------------------------------
//SI HAY UN NODO DE REPUESTO SE AÑADE A LA LISTA (ARRAY)
if($nodoRepuesto!=0){

	session_start();	//iniciamos la sesión
	$nodosRepuesto =array();	//creamos el array
 

	//COMPROBAMOS SI EXISTE LA VARIABLE DE SESIÓN (ES DECIR, SI HEMOS GUARDADO ALGÚN NODO EN EL QUE DUDÁSEMOS)
	if(isset($_SESSION['nodosRepuesto'])){
		
		$nodosRepuesto = $_SESSION['nodosRepuesto'];	//Guardamos el array de la sesión en el array vacío
		array_push($nodosRepuesto,$nodoRepuesto);		//añadimos el nodo a la lista
		$_SESSION['nodosRepuesto']=$nodosRepuesto;		//Volvemos a guardar el array de la sesión, actualizado
		
	}
	
	
	else{
		array_push($nodosRepuesto,$nodoRepuesto);		//añadimos el nodo a la lista
		$_SESSION['nodosRepuesto']=$nodosRepuesto;
	}
	
	
}




    //calculamos los nodos si -no
    $nodoSi = $nodo * 2;
    $nodoNo = $nodo * 2 + 1;
    $nodoProbablementeSi = $nodoSi;
    $nodoProbablementeNo = $nodoNo;
    // echo 'nodo actual: ' . $nodo;
    //-----------------------------------------------------
//OBTENEMOS UN NÚMERO AL AZAR ENTRE CERO Y UNO
//lo hacemos para evitar que tenga una tendencia a recorrer siempre el mismo camino

$aleatrio = rand(0,1);

$nodoAleatorio 	  = 0;	//EL QUE ELEGIMOS
$nodoAleatorioAlt = 0;	//EL CONTRARIO

if($aleatrio==0){
	$nodoAleatorio = $nodoNo;
	$nodoAleatorioAlt = $nodoSi;
}

else{
	$nodoAleatorio = $nodoSi;
	$nodoAleatorioAlt = $nodoNo;
}
//-----------------------------------------------------


$consulta = "SELECT texto,pregunta FROM arbol WHERE nodo = ".$nodo.";";

$texto = '';
$pregunta = true;
 
if ($resultado = mysqli_query($enlace, $consulta)) {
 
	if($resultado->num_rows === 0)
    {

        echo 'No existe el nodo';
		
    }

	else{
		while ($fila = mysqli_fetch_row($resultado)) {
			$texto 	  = $fila[0];
			$pregunta = $fila[1];
		}
		
		
		//SI NO ES UNA PREGUNTA ES UN RESULTADO FINAL
		
		echo "<h2>PREGUNTA #".$numPregunta."</h2>";
		
		if($pregunta == 0){
			
			echo "<div class='contenedorPregunta'>";
			echo "<h2>¿Tienes  ". $texto . "?</h2>";
			echo "</div>";
			
			
			echo "<div class='contenedorRespuestas'>";
			echo "<a class='boton' href='respuesta.php?r=1&n=".$nodo."&p=".$texto."&np=".$proxPregunta."'>SÍ</a>";
			echo "<a class='boton' href='respuesta.php?r=0&n=".$nodo."&p=".$texto."&np=".$proxPregunta."'>NO</a>";
			echo "</div>";
		
		}
		
		//SI ES UNA PREGUNTA, PREGUNTAMOS (SI DUDAMOS, EN EL PARÁMETRO "R" GUARDAMOS LA RAMA ALTERNATIVA, SINO VALE CERO)
		else{
			echo "<div class='contenedorPregunta'>";
			echo "<h2>¿Tienes ". $texto . "?</h2>";
			echo "</div>";
			
			echo "<div class='contenedorRespuestas'>";
			
			echo "<a class='boton' href='index.php?n=".$nodoSi."&r=0&np=".$proxPregunta."'>SÍ</a>";
			echo "<a class='boton' href='index.php?n=".$nodoNo."&r=0&np=".$proxPregunta."'>NO</a>";
			echo "<a class='boton' href='index.php?n=".$nodoProbablementeSi."&r=".$nodoProbablementeNo."&np=".$proxPregunta."'>A VECES</a>";
			echo "<a class='boton' href='index.php?n=".$nodoProbablementeNo."&r=".$nodoProbablementeSi."&np=".$proxPregunta."'>RARA VEZ</a>";
			echo "<a class='boton' href='index.php?n=".$nodoAleatorio."&r=".$nodoAleatorioAlt."&np=".$proxPregunta."'>NO LO SÉ</a>";
		
			echo "<div class='limpiar'></div>";
		
			echo "</div>";
		}
		
	}

    mysqli_free_result($resultado);
}


    ?>



 
        


    </main>
    <br>
    <br>
    <footer>

<?php
	echo "<a href='index.php?n=1&r=0'>Volver a probar</a>";
	//	echo "<a href='index.php?n=1&r=0'>Volver a probar</a>";

?>

</footer>


</body>

</html>
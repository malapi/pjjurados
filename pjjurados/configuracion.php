<?php header('Content-Type: text/html; charset=utf-8'); 
header ("Cache-Control: no-cache, must-revalidate ");
//ini_set('display_errors', 'On');
//error_reporting(E_ALL);
//error_reporting(E_ALL & ~E_NOTICE);

$HOST = 'localhost';
$BBDD = 'pruebajur';
$USUARIO ='root';
$PASS = 'eelcdr';
/////////////////////////////
// CONFIGURACION APP//
/////////////////////////////

$PROYECTO ='pjjurados';

//variable que almacena el directorio del proyecto
$ROOT =$_SERVER['DOCUMENT_ROOT']."/git/pjjurados/".$PROYECTO."/";
//$ROOT =$_SERVER['DOCUMENT_ROOT']."/".$PROYECTO."/";

include_once($ROOT.'libs/funciones.php');


// Variable que define la pagina de autenticacion del proyecto

//$INICIO = "Location:http://".$_SERVER['HTTP_HOST']."/$PROYECTO/index.php";

// variable que define la pagina principal del proyecto (menu principal)
//$PRINCIPAL = "Location:http://".$_SERVER['HTTP_HOST']."/$PROYECTO/lot_listadoLotesActivos.php";

//$objSesion =   new Session();
//$objSesion->session_started();

// configuracion de la cuenta desde la que se envian los mail automaticos de la APP
$_SESSION['MAILNOREPLY'] = "From:no-responder@malapi.com.ar";
$_SESSION['ROOT']=$ROOT;

?>

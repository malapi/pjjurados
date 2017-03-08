<?php
include_once('../../../configuracion.php');
$datos = data_submitted();
$resp = true;
$datos['accion'] = $datos['personaseleccion_accion'];
$objws = new C_personaseleccion();
$tipoMensaje='info';
if($objws->abm($datos)){
	$respuesta =true;
	$salida = " La accion".$datos['accion']." se realizo  correctamente ";
}else {
	$salida =  " La accion". $datos['accion']." no pudo concretarse ";
	$respuesta =false;
}
$objresp = array ('mensaje'=>$salida ,'veralert'=>true, 'respuesta'=>$respuesta,"msgtipo"=>$tipoMensaje,"ocultarForm"=>true);
echo json_encode($objresp);


?>


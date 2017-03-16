<?php
include_once('../configuracion.php');
$datos = data_submitted();
$resp = true;
print_object($datos);
//$datos['accion'] = $datos['juicio_accion'];
$objws = new C_seleccion();
$tipoMensaje='info';
if(isset($datos['accion']) && $datos['accion'] =='consultar'){
	$respuesta = $objws->buscarInformacionCompleta($datos);
	echo $respuesta;
} else {
	if($objws->abm($datos)){
		$respuesta =true;
		$salida = " La accion ".$datos['accion']." se realizo  correctamente ";
	}else {
		$salida =  " La accion ". $datos['accion']." no pudo concretarse ";
		$respuesta =false;
	}
	$objresp = array ('mensaje'=>$salida ,'veralert'=>true, 'respuesta'=>$respuesta,"msgtipo"=>$tipoMensaje,"ocultarForm"=>true);
	echo json_encode($objresp);
	
}
?>
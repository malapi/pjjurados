<?php 
include_once('../configuracion.php');
require_once dirname(__FILE__) . '/../libs/PHPExcel-1.8/Classes/PHPExcel.php';
$datos = data_submitted();


$objws = new C_juicio();
$tipoMensaje='info';
//echo "dsdsd";
if(isset($datos['accion']) && $datos['accion'] =='consultar'){
	//echo "dsdsd 2";
	$respuesta = $objws->buscarInformacionCompleta($datos);
	echo $respuesta;
} else {
	$retorna = $objws->abm($datos);
	//print_object($retorna);
	//echo "retorna ".($retorna === true);
	if($retorna === true || $retorna['exito']==1){
		$respuesta =true;
		$salida = " La accion ".$datos['accion']." se realizo  correctamente ";
	}else {
		$salida =  " La accion ". $datos['accion']." no pudo concretarse ".$retorna['comentario'];
		$respuesta =false;
	}
	$objresp = array ('mensaje'=>$salida ,'veralert'=>true, 'respuesta'=>$respuesta,"msgtipo"=>$tipoMensaje,"ocultarForm"=>true,"retorna"=>$retorna['comentario']);
	echo json_encode($objresp);

}

?>

<?php
include_once('../configuracion.php');
$datos = data_submitted();
//$datos['accion'] = $datos[$datos['control'].'_accion'];
//print_object($datos);

$control = "C_".$datos['control'];
$objws = new $control();

//$combohtml="";
$datos[$datos['campotabla']]=$datos['filtro'];
$resultado = $objws->buscar($datos);
//print_object($datos);
/*$combohtml="<option value='-1'>Seleccionar</option>";
foreach ($resultado as $uno){
	$combohtml.="<option value='".$uno[$datos['clavetabla']]."'>".$uno[$datos['campotablamostrar']]."</option>";
}*/

//$combohtml="<b>lala<b>";
//echo $combohtml;
// header('Cache-Control: no-cache, must-revalidate');
// header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
// header('Content-type: application/json');
echo $datos['callback']."(".json_encode($resultado).")";
?>
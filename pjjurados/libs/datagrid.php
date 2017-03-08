<?php 
//echo "lala";
/*include_once('../configuracion.php');
echo "lala";
$datos = data_submitted();
if (isset($datos['filterRules'])){
	$arreglo = json_decode($datos['filterRules']);
 	$datosBuscar = array();
	for ($i=0; $i<count($arreglo);$i++){
		$datos[$arreglo[$i]->field]=$arreglo[$i]->value;
	}
}
print_object($datos);
$resp = true;
//$control = "C_".$datos['control'];
$control = "C_"."juicio";
$obj = new $control();
$data_grid = $obj->buscar($datos);
echo json_encode($data_grid);
*/

$obj = (object) array('iTotalRecords' => '30', 'iTotalDisplayRecords' => '10','sEcho' => 'lala', 'aaData' => array(
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1'),
		array('id' => '1','productId' => '1','serialNumber' => '1','sONumber' => '1','partNumber' => '1','desc' => '1','shippedDate' => '1','soldDate' => '1','status' => '1')
		
));
//$data_grid = '{"iTotalRecords":12,"iTotalDisplayRecords":12,"sEcho":"","aaData":[{"productId":47209009,"serialNumber":"0909090","sONumber":"dev35001484_","partNumber":"987654KP-GL","desc":"TEST MEC","shippedDate":null,"soldDate":null,"status":"Awaiting Validation"}}';
echo json_encode($obj);

?>

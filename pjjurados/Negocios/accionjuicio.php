<?php
include_once('../configuracion.php');

$datos = data_submitted();
// $resp = true;
// //print_object($datos);
// //$datos['accion'] = $datos['juicio_accion'];
// $objws = new C_juicio();
// $tipoMensaje='info';
// if($objws->abm($datos)){
// 		$respuesta =true;
// 		$salida = " La accion ".$datos['accion']." se realizo  correctamente ";
// 	}else {
// 		$salida =  " La accion ". $datos['accion']." no pudo concretarse ";
// 		$respuesta =false;
// 	}
// 	$objresp = array ('mensaje'=>$salida ,'veralert'=>true, 'respuesta'=>$respuesta,"msgtipo"=>$tipoMensaje,"ocultarForm"=>true);
// 	echo json_encode($objresp);


/** Error reporting */
error_reporting(E_ALL);


// Create new PHPExcel object
echo date('H:i:s') . " Create new PHPExcel object\n <br>";
$objPHPExcel = new PHPExcel();

// Set properties
echo date('H:i:s') . " Set properties\n <br>";
$objPHPExcel->getProperties()->setCreator("Maarten Balliauw");
$objPHPExcel->getProperties()->setLastModifiedBy("Maarten Balliauw");
$objPHPExcel->getProperties()->setTitle("Office 2007 XLSX Test Document");
$objPHPExcel->getProperties()->setSubject("Office 2007 XLSX Test Document");
$objPHPExcel->getProperties()->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.");


// Add some data
echo date('H:i:s') . " Add some data\n <br>";
$objPHPExcel->setActiveSheetIndex(0);
$objPHPExcel->getActiveSheet()->SetCellValue('A1', 'Hello');
$objPHPExcel->getActiveSheet()->SetCellValue('B2', 'world!');
$objPHPExcel->getActiveSheet()->SetCellValue('C1', 'Hello');
$objPHPExcel->getActiveSheet()->SetCellValue('D2', 'world!');

// Rename sheet
echo date('H:i:s') . " Rename sheet\n <br>";
$objPHPExcel->getActiveSheet()->setTitle('Simple');


// Save Excel 2007 file
echo date('H:i:s') . " Write to Excel2007 format\n <br>";
$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
//$objWriter->save(str_replace('.php', '.xlsx', __FILE__));
$objWriter->save("/var/www/html/git/pjjurados/pjjurados/uploads/lala/lala.xlsx");

// Echo done
echo date('H:i:s') . " Done writing file.\r\n <br>";
?>
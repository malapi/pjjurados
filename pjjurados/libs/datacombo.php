<?php
include_once('../../configuracion.php');
$datos = data_submitted();
$control = "C_".$datos['control'];
$obj = new $control();
$data = $obj->buscar($datos);
echo json_encode($data);
?>
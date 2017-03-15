<?php
include_once('../configuracion.php');
$datos = data_submitted();
$datos['accion'] = $datos[$datos['control'].'_accion'];
$control = "C_".$datos['control'];
$objws = new $control();
if(isset($datos['dataForm']) && $datos['dataForm']!=''){
	$dataForm = data_submitted_cadena($datos['dataForm']);
	unset($datos['dataForm']);
	$datos = array_merge($dataForm, $datos);
	//print_object($datos);
}
$table = "";
if($datos['accion'] == 'verTabla'){
	$resultado = $objws->buscar($datos);
	$tabla = "  <div class='table-overflow'>
                        <table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>";
	$configtabla = explode("#",$datos['tabla']);
	//print_object($configtabla);
	$index = 0;
	$arraycampos = array();
	foreach ($configtabla as $columnas){
		$unaColumna = explode(":",$columnas);
		//print_object($unaColumna);
		$arraycampos[$index] = $unaColumna[1];
		$index = $index + 1;
		$tabla .=" <th>".$unaColumna[0]."</th>";
		//echo tab
	}
	$tabla .=" <th>"."Acciones"."</th>";
		
	$tabla .="</tr> </thead>  <tbody>";
	//json_decode(json_encode($nested_object), true);
	foreach ($resultado as $uno){
		$tabla .="<tr>";
		foreach ($arraycampos as $campo){
			if(is_Date($uno[$campo])){
				$tabla .="<td>".convertir_Fecha($uno[$campo]). "</td>";
			} else {
				$tabla .="<td>" . $uno[$campo] . "</td>";
			}
			
		}
		if($datos['eventos'] != ''){
			$tabla .= "	<td class='tac'>
						<ul class='table-controls'>";
			foreach ($datos['eventos'] as $un){
				$cadena = generarParametrosParaSubmit($uno,$un['accion']);
				$tabla .= "<li><a class='btn tip' title='".$un['titulo']."' href='#' data-original-title='Edit entry' onclick=\"submit('".$un['href']."', 'POST',".$cadena.")\">
					";
				if($un['icono']!=""){
					$tabla .="<i class='".$un['icono']."'></i></a></li>";
				}
			}
			$tabla .= "	<ul> </td>";
			
		}
		
		
		
		$tabla .="</tr>";
		//print_object($uno);
	}
	
	
	
	
	$tabla .= "</tbody></table></div>";
	//echo $objws->abm($datos);

}

echo $tabla;
?>
<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../libs/PDOConfig.php');
require_once 'utilidades.php';


function combo($selected, $default) {
	try {
		$base = new PDOConfig ();
		
		$sql = "SELECT idTipoRespuesta,TipoRespuesta
				FROM tiporespuestas
				ORDER BY TipoRespuesta ";
		
		$res = $base->query ( $sql );
		
		$Listcombo = "<option value=''>$default</option>";
		
		foreach ( $res as $row ) {
			if ($selected == $row ["idTipoRespuesta"]) {
				$Listcombo .= "<option value='" . $row ["idTipoRespuesta"] . "' selected='selected'>" . $row ["TipoRespuesta"] . "</option>";
			} else {
				$Listcombo .= "<option value='" . $row ["idTipoRespuesta"] . "' >" . $row ["TipoRespuesta"] . "</option>";
			}
		}
		echo $Listcombo;
	} catch ( Exception $e ) {
		return "Error al consultar los datos";
	}
}


if ($_POST) {
	$rta = "";
	try {
		$oper = $_POST ['oper'];
				
		switch ($oper) {
			case 'combo' :
				$default = $_POST ['vdefaul'];
				$selected =$_POST ["selected"];
				$rta = combo( $selected, $default );
				break;			
		}
	} catch ( Exception $e ) {
		echo " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        	Ha ocurrido al ejecutar la acci&oacute;n solicitada
                    	</div>";
	}
	
	echo $rta;
}

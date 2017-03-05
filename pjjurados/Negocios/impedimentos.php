<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../libs/PDOConfig.php');
require_once 'utilidades.php';
require_once("../libs/Login.php"); $oLogin=new Login(); if(!$oLogin->activa()){ exit(); }

function add($descripcion) {
	try {
		$base = new PDOConfig ();
		$descripcion = $base->filtrar ( $descripcion );
		$sql = "INSERT INTO tipoimpedimentos(Descripcion,Sistema) VALUES ('$descripcion',0)";
		// echo $sql;

		if ($base->query ( $sql )) {
			return "1";
		} else {
			return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}

function update($idImp,$descripcion) {
	try {
		$base = new PDOConfig ();

		$descripcion = $base->filtrar ( $descripcion );
		$idImp = $base->filtrar ( $idImp );

		$sql = "UPDATE tipoimpedimentos
		SET Descripcion = '$descripcion'
		WHERE idTipoImpedimento =" . $idImp;

		if ($base->query($sql)) {
		return "1";
		} else {
		return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
		}
	} catch ( Exception $e ) {
	return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}



function combo($selected, $default) {
try {
$base = new PDOConfig ();

$sql = "SELECT idTipoImpedimento,Descripcion
				FROM tipoimpedimentos
				ORDER BY Descripcion ";

		$res = $base->query ( $sql );

		$Listcombo = "<option value=''>$default</option>";

		foreach ( $res as $row ) {
if ($selected == $row ["idTipoImpedimento"]) {
$Listcombo .= "<option value='" . $row ["idTipoImpedimento"] . "' selected='selected'>" . $row ["Descripcion"] . "</option>";
			} else {
			$Listcombo .= "<option value='" . $row ["idTipoImpedimento"] . "' >" . $row ["Descripcion"] . "</option>";
}
		}
		echo $Listcombo;
} catch ( Exception $e ) {
return "Error al consultar los datos";
}
}

function table() {
	try {
$base = new PDOConfig ();

$sql = "SELECT idTipoImpedimento,Descripcion
FROM tipoimpedimentos WHERE Sistema = 0
				ORDER BY Descripcion ";
		// echo $sql;
		$res = $base->query ( $sql );
if ($res) {
$tabla = "<div class='navbar'><div class='navbar-inner'><h6>Listado de Impedimentos</h6></div></div>
                    <div class='table-overflow'>
                        <table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
					        <th>Impedimento</th>
							<th>Acciones</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
				$tabla .= "<tr>
<td>" . $row ["Descripcion"] . "</td>
		<td class='tac'>
								<ul class='table-controls'>
								<li><a class='btn tip' title='Modificar' href='#' data-original-title='Edit entry' onclick=\"editar('". $row ["idTipoImpedimento"] ."','".$row ["Descripcion"]."')\">
										<i class='icon-edit'></i></a></li>
										<ul>
										</td>

												</tr>";
			}
			$tabla .= "</tbody</table></div>";
			return $tabla;
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
					<button type='button' class='close' data-dismiss='alert'>×</button>
                        	Error al consultar los datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}

if ($_POST) {
	$rta = "";
	try {
		$oper = $_POST ['oper'];
		$Usuario = $oLogin->getUsuario();

		switch ($oper) {
			case 'combo' :
					$default = $_POST ['vdefaul'];
					$selected =$_POST ["selected"];
					$rta = combo( $selected, $default );
				break;
		case 'add' :
				$descipcion = $_POST ["txtDescripcion"];
				$rta = add ( $descipcion);
				break;
		case 'modif' :
				$id = $_POST ["hfIdImp"];
				$descipcion = $_POST ["txtDescripcionM"];
				$rta = update($id,$descipcion);
				break;
		case 'tabla' :
				$rta = table ();
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
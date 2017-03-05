<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../libs/PDOConfig.php');
require_once 'utilidades.php';


function combo($selected, $default) {
	try {
		$base = new PDOConfig ();
		
		$sql = "SELECT idCircuito,Nombre
				FROM circuitos
				ORDER BY Nombre ";
		
		$res = $base->query ( $sql );
		
		$Listcombo = "<option value=''>$default</option>";
		
		foreach ( $res as $row ) {
			if ($selected == $row ["idCircuito"]) {
				$Listcombo .= "<option value='" . $row ["idCircuito"] . "' selected='selected'>" . $row ["Nombre"] . "</option>";
			} else {
				$Listcombo .= "<option value='" . $row ["idCircuito"] . "' >" . $row ["Nombre"] . "</option>";
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

		$sql = "SELECT C.idCircuito,C.Nombre,C.idLocalidad,L.Descripcion AS localidad
				FROM circuitos C
				INNER JOIN localidades L ON C.idLocalidad = L.idLocalidad
				ORDER BY L.Descripcion, C.Nombre ";

		$res = $base->query ( $sql );

		if($res)
		{
			$tabla = "
                    <div class='table-overflow'>
                        <table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
					        <th>Localidad</th>
							<th>Circuito</th>
							<th>Acciones</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
				$tabla .= "<tr>
							<td>" . $row ["localidad"] . "</td>
							<td>" . $row ["Nombre"] . "</td>		
							<td class='tac'>
								<ul class='table-controls'>
								<li><a class='btn tip' title='Modificar' href='#' data-original-title='Edit entry' onclick=\"editar('". $row ["idCircuito"] ."','".$row ["Nombre"]."','". $row ["idLocalidad"] ."')\">
									<i class='icon-edit'></i></a></li>
								<ul>
							</td>
							</tr>";
			}
			$tabla .= "</tbody</table></div>";
			return $tabla;
		}else{
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        	Ha ocurrido al consultar los datos
                    	</div>";
		}
	
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}

function add($descripcion,$idLocalidad) {
	try {
		$base = new PDOConfig ();
		$descripcion = $base->filtrar ($descripcion);
		$sql = "INSERT INTO circuitos(idLocalidad,Nombre,Circunscripcion) VALUES ($idLocalidad,'$descripcion',1)";
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

function update($idCircuito,$idLoc,$descripcion) {
	try {
		$base = new PDOConfig ();

		$descripcion = $base->filtrar ( $descripcion );
		$idLoc = $base->filtrar ( $idLoc );

		$sql = "UPDATE circuitos
				SET Nombre = '$descripcion',idLocalidad = $idLoc
				WHERE idCircuito =" . $idCircuito;
		
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
			case 'add' :
				$descipcion = $_POST ["txtDescripcion"];
				$idLoc = $_POST ["cbLocalidad"];
				$rta = add ( $descipcion,$idLoc);
				break;
			case 'modif' :
				$id = $_POST ["hfId"];
				$idLoc = $_POST ["cbLocalidadM"];
				$descipcion = $_POST ["txtDescripcionM"];
				$rta = update($id,$idLoc,$descipcion);
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


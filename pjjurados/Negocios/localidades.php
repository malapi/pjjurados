<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../libs/PDOConfig.php');
require_once 'utilidades.php';


function combo($selected, $default) {
	try {
		$base = new PDOConfig ();
		
		$sql = "SELECT idLocalidad,Descripcion
				FROM localidades
				ORDER BY Descripcion ";
		
		$res = $base->query ( $sql );
		
		$Listcombo = "<option value=''>$default</option>";
		
		foreach ( $res as $row ) {
			if ($selected == $row ["idLocalidad"]) {
				$Listcombo .= "<option value='" . $row ["idLocalidad"] . "' selected='selected'>" . $row ["Descripcion"] . "</option>";
			} else {
				$Listcombo .= "<option value='" . $row ["idLocalidad"] . "' >" . $row ["Descripcion"] . "</option>";
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

		$sql = "SELECT idLocalidad,Descripcion
				FROM localidades
				ORDER BY Descripcion ";

		$res = $base->query ( $sql );

		if($res)
		{
			$tabla = "
                    <div class='table-overflow'>
                        <table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
					        <th>Localidad</th>
							<th>Acciones</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
				$tabla .= "<tr>
							<td>" . $row ["Descripcion"] . "</td>
							<td class='tac'>
								<ul class='table-controls'>
								<li><a class='btn tip' title='Modificar' href='#' data-original-title='Edit entry' onclick=\"editar('". $row ["idLocalidad"] ."','".$row ["Descripcion"]."')\">
										<i class='icon-edit'></i></a></li>
								<ul>
							</td>
							</tr>";
			}
			$tabla .= "</tbody</table></div>";
			return $tabla;
		}else{
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>x</button>
                        	Ha ocurrido al consultar los datos
                    	</div>";
		}
	
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>x</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}

function add($descripcion) {
	try {
		$base = new PDOConfig ();
		$descripcion = $base->filtrar ( $descripcion );
		$sql = "INSERT INTO localidades(Descripcion) VALUES ('$descripcion')";
		// echo $sql;

		if ($base->query ( $sql )) {
			return "1";
		} else {
			return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>x</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>x</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}

function update($idLoc,$descripcion) {
	try {
		$base = new PDOConfig ();

		$descripcion = $base->filtrar ( $descripcion );
		$idLoc = $base->filtrar ( $idLoc );

		$sql = "UPDATE localidades
				SET Descripcion = '$descripcion'
				WHERE idLocalidad =" . $idLoc;
		
		if ($base->query($sql)) {
			return "1";
		} else {
			return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>x</button>
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
				$rta = add ( $descipcion);
				break;
			case 'modif' :
				$id = $_POST ["hfIdLoc"];
				$descipcion = $_POST ["txtDescripcionM"];
				$rta = update($id,$descipcion);
				break;
			case 'tabla' :
				$rta = table ();
				break;
				
		}
	} catch ( Exception $e ) {
		echo " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>x</button>
                        	Ha ocurrido al ejecutar la acci&oacute;n solicitada
                    	</div>";
	}
	
	echo $rta;
}

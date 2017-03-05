<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../libs/PDOConfig.php');
require_once 'utilidades.php';
require_once("../libs/Login.php"); $oLogin=new Login(); if(!$oLogin->activa()){ exit(); }

function add($descripcion, $orden, $usu) {
	try {
		$base = new PDOConfig ();
		$descripcion = $base->filtrar ( $descripcion );
		$orden = $base->filtrar ( $orden );
		$sql = "INSERT INTO categorias(Descripcion,Orden,FHAlta,Login) VALUES ('$descripcion',$orden,NOW(),'$usu')";
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

function update($idCategoria,$descripcion, $orden, $Usuario) {
	try {
		$base = new PDOConfig ();
		
		$descripcion = $base->filtrar ( $descripcion );
		$orden = $base->filtrar ( $orden );
		$idCategoria = $base->filtrar ( $idCategoria );
		
		$sql = "UPDATE categorias
				 SET Descripcion = '$descripcion',Orden=$orden
			   WHERE idCategoria=" . $idCategoria;
		
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
		
		$sql = "SELECT idCategoria,Descripcion
				FROM categorias 
				ORDER BY Descripcion ";
		
		$res = $base->query ( $sql );
		
		$Listcombo = "<option value=''>$default</option>";
		
		foreach ( $res as $row ) {
			if ($selected == $row ["idCategoria"]) {
				$Listcombo .= "<option value='" . $row ["idCategoria"] . "' selected='selected'>" . $row ["Descripcion"] . "</option>";
			} else {
				$Listcombo .= "<option value='" . $row ["idCategoria"] . "' >" . $row ["Descripcion"] . "</option>";
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
		
		$sql = "SELECT idCategoria,Descripcion, Orden
				FROM categorias
				ORDER BY Orden ";
		// echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			$tabla = "<div class='navbar'><div class='navbar-inner'><h6>Listado de Categorias</h6></div></div>
                    <div class='table-overflow'>
                        <table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
					        <th>Categoria</th>
							<th>Orden</th>
							<th>Acciones</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
				$tabla .= "<tr>
							<td>" . $row ["Descripcion"] . "</td>
							<td class='tac'>" .$row ["Orden"] . "</td>
                            <td class='tac'>
								<ul class='table-controls'>		
	                               <li><a class='btn tip' title='Modificar' href='#' data-original-title='Edit entry' onclick=\"editarCategoria('". $row ["idCategoria"] ."','".$row ["Descripcion"]."','".$row ["Orden"]."')\">
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
				$orden = $_POST ["txtOrden"];
				$rta = add ( $descipcion, $orden, $Usuario );
				break;
			case 'modif' :
				$idCategoria = $_POST ["hfIdCat"];
				$descipcion = $_POST ["txtDescripcionM"];
				$orden = $_POST ["txtOrdenM"];
				$rta = update($idCategoria,$descipcion, $orden, $Usuario);
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
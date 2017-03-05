<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../libs/PDOConfig.php');
require_once 'utilidades.php';
require_once("../libs/Login.php"); $oLogin=new Login(); if(!$oLogin->activa()){ exit(); }


function add($pregunta, $tipo, $categoria, $usu) {
	try {
		$base = new PDOConfig ();
		$pregunta = $base->filtrar ( $pregunta );
		$tipo = $base->filtrar ( $tipo );
		$categoria = $base->filtrar ( $categoria );
				
		$sql = "INSERT INTO preguntas(idCategoria,Descripcion,idTipoRespuesta,FHAlta,Login)
		        VALUES ($categoria,'$pregunta',$tipo,NOW(),'$usu')";
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

function modificar ($id,$pregunta, $tipo, $categoria, $Usuario){
	try {
		$base = new PDOConfig ();
		$pregunta = $base->filtrar ( $pregunta );
		$tipo = $base->filtrar ( $tipo );
		$categoria = $base->filtrar ( $categoria );
		
		
		if(!puedeModificar($id)){
			$sql = "INSERT INTO preguntas(idCategoria,Descripcion,idTipoRespuesta,FHAlta,Login)
			VALUES ($categoria,'$pregunta',$tipo,NOW(),'$usu')";
			// echo $sql;
		
			if ($base->query ( $sql )) {
					
				return "1";
			} else {
				return "<div class='alert alert-error' style='margin-top: 16px;'>
	                        <button type='button' class='close' data-dismiss='alert'>×</button>
	                        Ha ocurrido un error al intentar cargar lo datos
	                    	</div>";
			}
		}else{
			$sql = "UPDATE preguntas SET idCategoria=$categoria,Descripcion='$pregunta',idTipoRespuesta='$tipo'
					WHERE idPregunta = $id";
			
			if ($base->query ( $sql )) {			
				return "1";
			} else {
				return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
			}
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}

function del($id) {
	try {
		$base = new PDOConfig ();	
	
		if(puedeModificar($id)){
			$sql = "DELETE FROM preguntas WHERE idPregunta = $id";
			// echo $sql;
	
			if ($base->query ( $sql )) {
					
				return "1";
			} else {
				return "<div class='alert alert-error' style='margin-top: 16px;'>
	                        <button type='button' class='close' data-dismiss='alert'>×</button>
	                        Ha ocurrido un error al intentar cargar lo datos
	                    	</div>";
			}
		}else{
		return "<div class='alert alert-error' style='margin-top: 16px;'>
	                        <button type='button' class='close' data-dismiss='alert'>×</button>
	                       No es posible eliminar la pregunta debido a que ha sido utilizada en una plantilla.
	                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>×</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}
function combo($selected, $default,$categoria) {
	try {
		$wehre = "";
		if($categoria != ""){
			$where = " AND idCategoria = $categoria";
		}
		
		$base = new PDOConfig ();		
		$sql = "SELECT idPregunta,idCategoria,Descripcion
				FROM preguntas WHERE 1=1 $where
				ORDER BY Descripcion ";
		
		$res = $base->query ( $sql );
		
		$Listcombo = "<option value=''>$default</option>";
		
		foreach ( $res as $row ) {
			if ($selected == $row ["idPregunta"]) {
				$Listcombo .= "<option value='" . $row ["idPregunta"] . "' selected='selected'>" . $row ["Descripcion"] . "</option>";
			} else {
				$Listcombo .= "<option value='" . $row ["idPregunta"] . "' >" . $row ["Descripcion"] . "</option>";
			}
		}
		return $Listcombo;
	} catch ( Exception $e ) {
		return "Error al consultar los datos";
	}
}

function table($tipo,$categoria) {
	try {
		$where = "";
		$base = new PDOConfig ();
		
		$tipo = $base->filtrar ( $tipo );
		$categoria = $base->filtrar ( $categoria );		
		
		if($tipo != "" && $tipo != "-1")
		{
			$where .= " AND P.idTipoRespuesta = $tipo";
		}
		
		if($categoria != "" && $categoria != "-1")
		{
			$where .= " AND P.idCategoria = $categoria";
		}
		
		$sql = "SELECT P.idPregunta, P.idCategoria,P.Descripcion AS pregunta, P.idTipoRespuesta,P.FHAlta, 
				         C.Descripcion AS categoria, T.TipoRespuesta
				FROM preguntas P
				INNER JOIN categorias C ON P.idCategoria = C.idCategoria
				INNER JOIN tiporespuestas T ON P.idTipoRespuesta = T.idTipoRespuesta
				WHERE 1=1 $where
				ORDER BY P.idCategoria, P.FHAlta ";
		// echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			$tabla = "<div class='navbar'><div class='navbar-inner'><h6>Listado de Preguntas</h6></div></div>
                    <div class='table-overflow'>
                        <table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>							
					        <th>Categoria</th>
							<th>Pregunta</th>
							<th>Tipo</th>
							<th>Acciones</th>
					    </tr>
					    </thead>
					    <tbody>";
			
			foreach ( $res as $row ) {
				$tabla .= "<tr>
							<td>" .$row["categoria"]. "</td>
							<td>" .$row ["pregunta"] . "</td>
							<td>" .$row ["TipoRespuesta"] . "</td>
                            <td>&nbsp;";
							if(puedeModificar($row["idPregunta"]))
							{		
									
							$tabla .= "<ul class='table-controls'>		
	                               <li><a class='btn tip' title='Modificar' href='preg_modificarPregunta.php?id=".$row["idPregunta"]."' data-original-title='Edit entry'>
										<i class='icon-edit'></i></a></li>
									<li><a class='btn tip' title='Eliminar' href='#' data-original-title='Del entry' onclick=\"eliminarPregunta('".$row["idPregunta"]."')\">
										<i class='icon-trash'></i></a></li>
								<ul>";		
							}
				$tabla .= "</td></tr>";
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

function ver($id) {
	try {
		$where = "";
		$base = new PDOConfig ();
		
		$sql = "SELECT P.idCategoria,P.Descripcion, P.idTipoRespuesta, P.FHAlta		
		FROM preguntas P
		WHERE idPregunta = $id ";
		// echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			$salida = $res->fetch(PDO::FETCH_ASSOC);
			$resultado = json_encode($salida) ;
		return $resultado;
		} else {
			return "0";
		}
	} catch ( Exception $e ) {
		return "0";
	}
}

function puedeModificar($id) {

		$where = "";
		$base = new PDOConfig ();

		$sql = "SELECT P.idCategoria,P.Descripcion AS pregunta, P.idTipoRespuesta, P.FHAlta
		FROM preguntas P
		INNER JOIN plantillas_preguntas A ON P.idPregunta = A.idPregunta 
		INNER JOIN lotes L ON A.idPlantilla = L.idPlantilla
		INNER JOIN lotespersonas LP ON L.idLote = LP.idLote
		WHERE P.idPregunta = $id AND LP.idEstadoDDJJ >= 2 ";
		//echo $sql;
		$res = $base->query ( $sql );
		if ($res->rowCount() > 0) {
			return false;
		}else{
			return true;
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
				$categoria =$_POST ["categoria"];
				$rta = combo( $selected, $default,$categoria);
				break;
			case 'add' :
				$tipo = $_POST ["cbTipoPregunta"];
				$pregunta = $_POST ["txtPregunta"];
				$categoria = $_POST ["cbCategoria"];
				$rta = add ($pregunta, $tipo, $categoria, $Usuario);
				break;

			case 'modificar' :
					$id = $_POST ["hfIdPreg"];
					$tipo = $_POST ["cbTipoPregunta"];
					$pregunta = $_POST ["txtPregunta"];
					$categoria = $_POST ["cbCategoria"];
					$rta = modificar ($id,$pregunta, $tipo, $categoria, $Usuario);
					break;
				
			case 'ver' :
				$id = $_POST ['idPregunta'];
				$rta = ver($id);
				break;
			
			case 'del' :
					$id = $_POST ['idPregunta'];
					$rta = del($id);
					break;
				
			case 'tabla' :
				$tipo = $_POST ["tipo"];
				$categoria = $_POST ["categoria"];
				$rta = table ($tipo,$categoria);
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

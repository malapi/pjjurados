<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../libs/PDOConfig.php');
require_once 'utilidades.php';
require_once("../libs/Login.php"); $oLogin=new Login(); if(!$oLogin->activa()){ exit(); }

function add($descripcion, $usu) {
	try {
		$base = new PDOConfig ();
		$descripcion = $base->filtrar ( $descripcion );
		
		$sql = "INSERT INTO plantillas(Descripcion,FHAlta,Login)
		        VALUES ('$descripcion',NOW(),'$usu')";
		// echo $sql;
		
		if ($base->query ( $sql )) {
			return $base->lastInsertId ();
		} else {
			return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>X</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}
function addPregunta($idPlantilla, $idPregunta) {
	try {
		$base = new PDOConfig ();
		$idPlantilla = $base->filtrar ( $idPlantilla );
		$idPregunta = $base->filtrar ( $idPregunta );
		$orden = "13";
		
		$gid = $base->prepare ( "SELECT MAX(Orden) as maxOrden FROM plantillas_preguntas WHERE idPlantilla = $idPlantilla" );
		$gid->execute ();
		$test = $gid->fetch ( PDO::FETCH_ASSOC );
		if ($test ['maxOrden'] != "") {
			$orden = $test ['maxOrden'] + 1;
		}
		
		$sql = "INSERT INTO plantillas_preguntas(idPlantilla,idPregunta,Orden)
		VALUES ($idPlantilla,$idPregunta,$orden)";
		// echo $sql;
		
		if ($base->query ( $sql )) {
			return $base->lastInsertId ();
		} else {
			return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>X</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>X</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}
function delPregunta($idPlantilla, $idPregunta) {
	try {
		$base = new PDOConfig ();
		$idPlantilla = $base->filtrar ( $idPlantilla );
		$idPregunta = $base->filtrar ( $idPregunta );
		
		$sql = "DELETE FROM plantillas_preguntas WHERE idPlantilla= $idPlantilla AND idPregunta = $idPregunta";
		// echo $sql;
		if ($base->query ( $sql )) {
			return "1";
		} else {
			return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar eliminar los datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}
function verPreguntasXPlantillas($idPlantilla) {
	try {
		$where = "";
		$base = new PDOConfig ();
		
		$sql = "SELECT DISTINCT C.idCategoria,C.Descripcion 
		FROM plantillas_preguntas PP
		INNER JOIN preguntas E ON PP.idPregunta = E.idPregunta
		INNER JOIN categorias C ON E.idCategoria = C.idCategoria
		WHERE PP.idPlantilla = $idPlantilla
		ORDER BY C.Orden";
		// echo $sql;
		$tabla = "";
		$res = $base->query ( $sql );
		if ($res) {
			foreach ( $res as $row ) {
				$tabla .= "<h5 class='widget-name'><i class='icon-align-justify'></i> " . $row ["Descripcion"] . "</h5>
					<div class='widget row-fluid'>
					<div class='well'><ul class='sortable'>";
				
				$sqlP = "SELECT PP.idPlantilla, PP.idPregunta,PP.Orden, E.Descripcion AS Pregunta, E.idTipoRespuesta
						FROM plantillas_preguntas PP
						INNER JOIN preguntas E ON PP.idPregunta = E.idPregunta						
						WHERE PP.idPlantilla = $idPlantilla AND E.idCategoria = " . $row ["idCategoria"] . " ORDER BY PP.Orden";
				// echo $sqlP;
				$resP = $base->query ( $sqlP );
				if ($resP) {
					foreach ( $resP as $rowP ) {
						$tabla .= "<li id='" . $rowP ["idPregunta"] . "' class='ui-state-default'> <div class='control-group'>
							<label class='control-label'>
								<strong class='subtitle'><span id='s" . $rowP ["idPregunta"] . "'>" . $rowP ["Orden"] . "</span> - " . $rowP ["Pregunta"] . "
								<a class='btn btn-small btn-danger pull-right' href='#' title='Eliminar Pregunta' onclick=\"EliminarPregunta('" . $rowP ["idPregunta"] . "','" . $rowP ["idPlantilla"] . "')\"><i class='icon-remove'></i></a></strong></label>
							<div class='controls'>";
						
						switch ($rowP ["idTipoRespuesta"]) {
							case "1" :
								$tabla .= "<label class='radio'><input value='option1' type='radio'>Si</label>
										   <label class='radio'><input value='option2' type='radio'>No</label>";
								break;
							case "2" :
								$tabla .= "<input type='text' class='span12 respuesta' />";
								break;
						}
						
						$tabla .= "</div></div></li>";
					}
					$tabla .= "</ul></div></div>";
				} else {
					return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Error al consultar los datos
                    	</div>";
				}
			}
			return $tabla;
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Error al consultar los datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}
function ordenarPreguntas($idPlantilla, $lista) {
	try {
		$base = new PDOConfig ();
		$idPlantilla = $base->filtrar ( $idPlantilla );
		$lista = $base->filtrar ( $lista );
		$base->beginTransaction ();
		
		$preguntas = explode ( ",", $lista );
		foreach ( $preguntas as $i => $p ) {
			if ($p != "") {
				$orden = $i + 12;
				$sql = "UPDATE plantillas_preguntas SET Orden = $orden WHERE idPlantilla= $idPlantilla AND idPregunta = $p";
				// echo $sql;
				if (! $base->query ( $sql )) {
					
					$base->rollBack ();
					return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar actualizar los datos
                    	</div>";
				}
			}
		}
		$base->commit ();
		return "1";
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}
function ver($idPlantilla) {
	try {
		$resultado = 0;
		$base = new PDOConfig ();
		
		$sql = "SELECT PP.idPlantilla, PP.Descripcion, PP.FHAlta 
				FROM plantillas PP
				WHERE idPlantilla = $idPlantilla";
		// echo $sql;
		$res = $base->query ( $sql );
		if ($res) {			
			$resultado = $res->fetch (PDO::FETCH_ASSOC);
			if(puedeModificar($idPlantilla)){
				$resultado["modificar"] = "1";
			}else{
				$resultado["modificar"] = "0";
			}
			$resultado = json_encode($resultado);
			return $resultado;
		}
	} catch ( Exception $e ) {
		return 0;
	}
}

function puedeModificar($idPlantilla) {
	try {
		$resultado = 0;
		$base = new PDOConfig ();

		$sql = "SELECT L.*
		FROM lotes L
		INNER JOIN lotespersonas LP ON L.idLote = LP.idLote
		WHERE idPlantilla = $idPlantilla AND LP.idEstadoDDJJ >= 2";
		// echo $sql;
		$res = $base->query ( $sql );
		if ($res->rowCount() > 0) {
			return false;
		}else{
			return true;
		}
	} catch ( Exception $e ) {
		return 0;
	}
}

function combo($selected, $default) {
	try {
		$base = new PDOConfig ();
		
		$sql = "SELECT idPlantilla,Descripcion
		FROM plantillas 
		ORDER BY Descripcion ";
		echo $sql;
		$res = $base->query ( $sql );
		
		$Listcombo = "<option value=''>$default</option>";
		
		foreach ( $res as $row ) {
			if ($selected == $row ["idPlantilla"]) {
				$Listcombo .= "<option value='" . $row ["idPlantilla"] . "' selected='selected'> (".$row ["idPlantilla"].") ". $row ["Descripcion"] . "</option>";
			} else {
				$Listcombo .= "<option value='" . $row ["idPlantilla"] . "' > (".$row ["idPlantilla"].")" . $row ["Descripcion"] . "</option>";
			}
		}
		echo $Listcombo;
	} catch ( Exception $e ) {
		return "Error al consultar los datos";
	}
}
function table() {
	try {
		$where = "";
		$base = new PDOConfig ();
		
		$sql = "SELECT PP.idPlantilla, PP.Descripcion, PP.FHAlta
				FROM plantillas PP
				WHERE 1=1 $where
				ORDER BY PP.FHAlta DESC ";
		// echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			$tabla = "<div class='navbar'><div class='navbar-inner'><h6>Listado de Plantillas</h6></div></div>
                    <div class='table-overflow'>
                        <table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>							
					        <th>#</th>
							<th>Titulo</th>
							<th>Generaci&oacute;n</th>
							<th>Acciones</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
				$modif = true;
				$sqllote = "SELECT * FROM lotes WHERE idPlantilla = " . $row ["idPlantilla"];
				// echo $sql;
				$resL = $base->query ( $sqllote );
				if ($resL->rowCount () > 0) {
					$modif = false;
				}
				$tabla .= "<tr>
							<td>" . $row ["idPlantilla"] . "</td>
							<td>" . $row ["Descripcion"] . "</td>
							<td>" . formatFechaHora ( $row ["FHAlta"] ) . "</td>
                            <td>
								<ul class='table-controls'>		
								   <li><a class='btn tip' title='Ver' href='preg_generarPlantilla.php?id=" . $row ["idPlantilla"] . "&op=1' data-original-title='Edit entry'>
										<i class='icon-search'></i></a></li>";
				if ($modif) {
					$tabla .= "  <li><a class='btn tip' title='Modificar' href='preg_generarPlantilla.php?id=" . $row ["idPlantilla"] . "' data-original-title='Edit entry'>
										<i class='icon-edit'></i></a></li>";
				}
				$tabla .= "	<ul>		
							</td>

                           </tr>";
			}
			$tabla .= "</tbody</table></div>";
			return $tabla;
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Error al consultar los datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}
function verPlantillaParaCompletar($idLote) {
	try {
		$where = "";
		$base = new PDOConfig ();
		
		$gid = $base->prepare ( "SELECT idPlantilla FROM lotes WHERE idLote = $idLote" );
		$gid->execute ();
		$test = $gid->fetch ( PDO::FETCH_ASSOC );
		$idPlantilla = $test['idPlantilla'];
		if ($idPlantilla != "") {
			
			$sql = "SELECT DISTINCT C.idCategoria,C.Descripcion
			FROM plantillas_preguntas PP
			INNER JOIN preguntas E ON PP.idPregunta = E.idPregunta
			INNER JOIN categorias C ON E.idCategoria = C.idCategoria
			WHERE PP.idPlantilla = $idPlantilla
			ORDER BY C.Orden";
			// echo $sql;
			$tabla = "";
			$cant = 0;
			$res = $base->query ( $sql );
			if ($res) {
				
				foreach ( $res as $row ) {
					$tabla .= "<div class='widget row-fluid'>
										
						<div class='navbar'>
							<div class='navbar-inner'>
								<h6><i class='icon-align-justify'></i>  " . $row ["Descripcion"] . "</h6>
							</div>
						</div>				
					<div class='well'>";
					
					$sqlP = "SELECT PP.idPlantilla, PP.idPregunta,PP.Orden, E.Descripcion AS Pregunta, E.idTipoRespuesta
							FROM plantillas_preguntas PP
							INNER JOIN preguntas E ON PP.idPregunta = E.idPregunta
							WHERE PP.idPlantilla = $idPlantilla AND E.idCategoria = " . $row ["idCategoria"] . " ORDER BY PP.Orden";
					// echo $sqlP;
					$resP = $base->query ( $sqlP );
					if ($resP) {
						$cant = $cant + $resP->rowCount();
						foreach ( $resP as $rowP ) {
							$tabla .= "<div class='control-group'>
							<label class='control-label'>
								<strong class='subtitle'><span id='s" . $rowP["idPregunta"] . "'>" . $rowP ["Orden"] . "</span> - " . $rowP ["Pregunta"] . "</strong></label>
							<div class='controls'>";
							
							switch ($rowP ["idTipoRespuesta"]) {
								case "1" :
									$tabla .= "<label class='radio'><input name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' value='1' type='radio'>Si</label>
											   <label class='radio'><input name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' value='0' type='radio'>No</label>";
									break;
								case "2" :
									$tabla .= "<input type='text' name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' class='span12' />";
									break;
							}
							
							$tabla .= "</div></div>";
						}
						$tabla .= "</div></div>";
						
					} else {
						return " <div class='alert alert-error' style='margin-top: 16px;'>
				<button type='button' class='close' data-dismiss='alert'>�</button>
                        	Error al consultar los datos
                    	</div>";
					}
				}
				$tabla .= "<input type='hidden' name='hfCantPreg' id='hfIdLote' value='$cant' />";
				return $tabla;
			} else {
				return " <div class='alert alert-error' style='margin-top: 16px;'>
						<button type='button' class='close' data-dismiss='alert'>�</button>
                        	Error al consultar los datos
                    	</div>";
			}
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
						<button type='button' class='close' data-dismiss='alert'>�</button>
                        	Error al consultar los datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}


function verPlantillaCompleta($idLote, $idPersona){
    
  try {
		$where = "";
		$base = new PDOConfig ();
		
                $pid = $base->prepare ( "SELECT idLP FROM lotespersonas WHERE idLote = $idLote AND idPersona = $idPersona");
		$pid->execute ();
		$pidRes = $pid->fetch( PDO::FETCH_ASSOC );
		$idPL = $pidRes['idLP'];
                
                
		$gid = $base->prepare ( "SELECT idPlantilla FROM lotes WHERE idLote = $idLote" );
		$gid->execute ();
		$test = $gid->fetch ( PDO::FETCH_ASSOC );
		$idPlantilla = $test['idPlantilla'];
		if ($idPlantilla != "") {
			
			$sql = "SELECT DISTINCT C.idCategoria,C.Descripcion
			FROM plantillas_preguntas PP
			INNER JOIN preguntas E ON PP.idPregunta = E.idPregunta
			INNER JOIN categorias C ON E.idCategoria = C.idCategoria
			WHERE PP.idPlantilla = $idPlantilla
			ORDER BY C.Orden";
			// echo $sql;
			$tabla = "";
			$cant = 0;
			$res = $base->query ( $sql );
			if ($res) {
				
				foreach ( $res as $row ) {
					$tabla .= "<div class='widget row-fluid'>
										
						<div class='navbar'>
							<div class='navbar-inner'>
								<h6><i class='icon-align-justify'></i>  " . $row ["Descripcion"] . "</h6>
							</div>
						</div>				
					<div class='well'>";
					
					$sqlP = "SELECT PP.idPlantilla, PP.idPregunta,PP.Orden, E.Descripcion AS Pregunta, E.idTipoRespuesta
							FROM plantillas_preguntas PP
							INNER JOIN preguntas E ON PP.idPregunta = E.idPregunta
							WHERE PP.idPlantilla = $idPlantilla AND E.idCategoria = " . $row ["idCategoria"] . " ORDER BY PP.Orden";
					// echo $sqlP;
					$resP = $base->query ( $sqlP );
					if ($resP) {
						$cant = $cant + $resP->rowCount();
						foreach ( $resP as $rowP ) {
                                                        $respuesta="";
                                                        $sqlResp = " SELECT idRespuesta,idLP,idPregunta,Respuesta FROM respuestas WHERE idLP = $idPL AND idPregunta = ".$rowP["idPregunta"];
                                                        $sal = $base->query($sqlResp);
                                                        $testRes = $sal->fetch ( PDO::FETCH_ASSOC );
                                                        $respuesta = $testRes['Respuesta'];
                                                    
							$tabla .= "<div class='control-group'>
							<label class='control-label'>
								<strong class='subtitle'><span id='s" . $rowP["idPregunta"] . "'>" . $rowP ["Orden"] . "</span> - " . $rowP ["Pregunta"] . "</strong></label>
							<div class='controls'>";
							
							switch ($rowP ["idTipoRespuesta"]) {
								case "1" :
                                                                            if($respuesta == "Si")
                                                                            {
                                                                                $tabla .= "<label class='radio'><input name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' value='1' checked='checked' type='radio'>Si</label>
										<label class='radio'><input name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' value='0' type='radio'>No</label>";
                                                                            }else{
                                                                                if($respuesta == "No")
                                                                                {
                                                                                    $tabla .= "<label class='radio'><input name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' value='1' type='radio'>Si</label>
                                                                                    <label class='radio'><input name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' checked='checked' value='0' type='radio'>No</label>";
                                                                                }else{
                                                                                   $tabla .= "<label class='radio'><input name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' value='1' type='radio'>Si</label>
                                                                                    <label class='radio'><input name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' value='0' type='radio'>No</label>"; 
                                                                                }
                                                                                
                                                                            }
									break;
								case "2" :
									$tabla .= "<input type='text' name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' class='span12' value='".$respuesta."' />";
									break;
							}
							
							$tabla .= "</div></div>";
						}
						$tabla .= "</div></div>";
						
					} else {
						return " <div class='alert alert-error' style='margin-top: 16px;'>
				<button type='button' class='close' data-dismiss='alert'>X</button>
                        	Error al consultar los datos
                    	</div>";
					}
				}
				$tabla .= "<input type='hidden' name='hfCantPreg' id='hfIdLote' value='$cant' />";
				return $tabla;
			} else {
				return " <div class='alert alert-error' style='margin-top: 16px;'>
						<button type='button' class='close' data-dismiss='alert'>X</button>
                        	Error al consultar los datos
                    	</div>";
			}
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
						<button type='button' class='close' data-dismiss='alert'>X</button>
                        	Error al consultar los datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
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
			case 'add' :
				$titulo = $_POST ["txtTitulo"];
				$rta = add ( $titulo, $Usuario );
				break;
			case 'addPreg' :
				$idPlantilla = $_POST ["hfIdPlantilla"];
				$idPregunta = $_POST ["cbPregunta"];
				$rta = addPregunta ( $idPlantilla, $idPregunta );
				break;
			case 'delPregunta' :
				$idPlantilla = $_POST ["idPlantilla"];
				$idPregunta = $_POST ["idPregunta"];
				$rta = delPregunta ( $idPlantilla, $idPregunta );
				break;
			case 'verPreguntas' :
				$idPlantilla = $_POST ["idPlantilla"];
				$rta = verPreguntasXPlantillas ( $idPlantilla );
				break;
			case 'tabla' :
				$rta = table ();
				break;
			case 'ver' :
				$idPlantilla = $_POST ["idPlantilla"];
				$rta = ver ( $idPlantilla );
				break;
			case 'ordenarPreguntas' :
				$lista = $_POST ["lista"];
				$idPlantilla = $_POST ["idPlantilla"];
				$rta = ordenarPreguntas ( $idPlantilla, $lista );
				break;
			
			case 'combo' :
				$default = $_POST ['vdefaul'];
				$selected = $_POST ["selected"];
				$rta = combo ( $selected, $default );
				break;
			
			case 'plantXLote' :
				$idLote = $_POST ["idLote"];
				$rta = verPlantillaParaCompletar ( $idLote );
				break;
                            
                         case 'planillaXPersona' :
				$idLote = $_POST ["idLote"];
                                $idPersona = $_POST ["idPersona"];
				$rta = verPlantillaCompleta($idLote, $idPersona);
				break;   
                            
		}
	} catch ( Exception $e ) {
		echo " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al ejecutar la acci&oacute;n solicitada
                    	</div>";
	}
	
	echo $rta;
}


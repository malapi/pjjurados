<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../libs/PDOConfig.php');
require_once 'utilidades.php';
require_once '../libs/PHPExcel.php';
require_once("../libs/Login.php");
$oLogin=new Login();
if(!$oLogin->activa()){ exit(); }

if ($_POST) {
	$rta = "";
	try {
		$oper = $_POST ['oper'];
		$Usuario = $oLogin->getUsuario();

		switch ($oper) {
			case 'add' :
				$descripcion = $_POST ["descripcion"];
				$fechaDesde = $_POST ["fechaDesde"];
				$fechaHasta = $_POST ["fechaHasta"];
				$observaciones = $_POST ["observaciones"];
				$archivos = $_POST ["archivos"];

				$rta = generarLote ( $descripcion, $fechaDesde, $fechaHasta, $observaciones, $archivos, $Usuario );
				break;
					

			case 'modificar' :
				$idLote = $_POST ["idLote"];
				$descripcion = $_POST ["descripcion"];
				$fechaDesde = $_POST ["fechaDesde"];
				$fechaHasta = $_POST ["fechaHasta"];
				$observaciones = $_POST ["observaciones"];
				$archivos = $_POST ["archivos"];

				$rta = actualizarLote ($idLote, $descripcion, $fechaDesde, $fechaHasta, $observaciones, $archivos, $Usuario );
				break;
			case 'tabla' :
				$descripcion = $_POST ["txtDescripcion"];
				$fechaDesde = $_POST ["txtFechaDesde"];
				$fechaHasta = $_POST ["txtFechaHasta"];
				$todo = $_POST ["todo"];
				$rta = listado($descripcion, $fechaDesde, $fechaHasta,$todo);
				break;
					
			case 'ver' :
				$id = $_POST ["idLote"];
				$rta = ver($id);
				break;

			case 'asocPlantilla' :
				$idLote = $_POST ["hfIdSorteoP"];
				$idPlantilla = $_POST ["cbPlantillas"];
				$rta = asociarPlantilla($idLote,$idPlantilla);
				break;
					
			case 'listParaDoc' :
				$rta = listadoParaDoc();
				break;

			case 'combo' :
				$default = $_POST ['vdefaul'];
				$selected =$_POST ["selected"];
				$rta = combo( $selected, $default);
				break;
					
			case 'comboAC' :
				$default = $_POST ['vdefaul'];
				$selected =$_POST ["selected"];
				$rta = comboActivos( $selected, $default);
				break;

			case 'ChekearPlantilla':
				$id = $_POST ["idLote"];
				$rta = LotePlantilla($id);
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



function devolverTDoc($base, $tipoDoc) {
	try {
		
		$sql = "SELECT idTipoDocumento,Descripcion FROM tipodocumentos WHERE Descripcion = '" . trim ( $tipoDoc ) . "'";
		
		if ($resp = $base->query ( $sql )) {
			if ($resp->rowCount () > 0) {
				$row = $resp->fetch ( PDO::FETCH_ASSOC );
				return $row ["idTipoDocumento"];
			} else {
				$sql = "INSERT INTO tipodocumentos(Descripcion) VALUES('" . trim ( $tipoDoc ) . "')";
				
				if ($resp = $base->query ( $sql )) {
					return $base->lastInsertId ();
				} else {
					return false;
				}
			}
		} else {
			return false;
		}
	} catch ( Exception $e ) {
		return false;
	}
}

function devolverLocXCircuito( $base, $circuito){
	try {	
		
		$sql = "SELECT idLocalidad FROM circuitos WHERE Nombre = '" . trim ( $circuito ) . "'";
	
		if ($resp = $base->query ( $sql )) {
			if ($resp->rowCount () > 0) {
				$row = $resp->fetch (PDO::FETCH_ASSOC );
				return $row ["idLocalidad"];
		} else {				
				return false;
			}
		} else {
			return false;
		}
	} catch ( Exception $e ) {
		return false;
	}
}


function leerPersonasLote($idL, $ar, &$personas) {
	$inputFileName = "../uploads/$ar";
	// Read your Excel workbook
	try {
		$inputFileType = PHPExcel_IOFactory::identify ( $inputFileName );
		$objReader = PHPExcel_IOFactory::createReader ( $inputFileType );
		$objPHPExcel = $objReader->load ( $inputFileName );
	} catch ( Exception $e ) {
		// echo $e->getMessage();
		return false;
	}
	
	$sheet = $objPHPExcel->getSheet ( 0 ); // Obtengo la primer hoja
	$uFila = $sheet->getHighestRow (); // obtener ultima fila
	$uColumna = $sheet->getHighestColumn (); // obtener ultima columna
	
	$salida = "";
	// Loop through each row of the worksheet in turn
	for($row = 2; $row <= $uFila; $row ++) {
		
		// leer los datos de cada fila
		$p ["id_reg"] = $sheet->getCell ( 'A' . $row )->getValue ();
		$p ["nroDoc"] = $sheet->getCell ( 'B' . $row )->getValue ();
		$p ["tipoDoc"] = $sheet->getCell ( 'C' . $row )->getValue ();
		$p ["sexo"] = $sheet->getCell ( 'D' . $row )->getValue ();
		$p ["nombre"] = $sheet->getCell ( 'E' . $row )->getValue ();
		$p ["apellido"] = $sheet->getCell ( 'F' . $row )->getValue ();
		$p ["circunscripcion"] = $sheet->getCell ( 'G' . $row )->getValue ();
		$p ["profesion"] = $sheet->getCell ( 'H' . $row )->getValue ();
		$p ["domicilio"] = $sheet->getCell ( 'I' . $row )->getValue ();
		$p ["numero"] = $sheet->getCell ( 'J' . $row )->getValue ();
		$p ["puerta"] = $sheet->getCell ( 'K' . $row )->getValue ();
		$p ["circuito"] = $sheet->getCell ( 'L' . $row )->getValue ();
		
		$personas [] = $p;
	}
	/*
	 * echo "<pre>"; print_r($personas); echo "</pre>"; echo "<br />";
	 */
	return $personas;
}




function cargarPersonasLote($base, $idL, $personas) {
	try {
		
		$salida = "";
		// Loop through each row of the worksheet in turn
		foreach ( $personas as $p ) {
			
			if (strpos( $p ["tipoDoc"], 'DNI' ) !== false) {
				$tipoDoc = "1";
			} else {
				if ($td = devolverTDoc ( $base, $p ["tipoDoc"] )) {
					$tipoDoc = $td;
				} else {
					return false;
				}
			}
			
			
			$locPersona = 'NULL';
			if($p["circuito"] != ""){
				if ($loc = devolverLocXCircuito( $base, $p["circuito"])) {
					$locPersona = $loc;
				}
			}
			
			$domicilio = $p ["domicilio"];
			
			if (trim($p ["numero"]) != "") {
				$domicilio .= " Nro " . $p ["numero"];
			}
			if (trim($p ["puerta"]) != "") {
				$domicilio .= " - Puerta: " . $p ["puerta"];
			}
			
			$sqlCo = "SELECT idPersona FROM personas WHERE idTipoDocumento = $tipoDoc AND DNI = " . $base->filtrar ($p["nroDoc"] );
			
			if ($resp = $base->query ( $sqlCo )) {
				if ($resp->rowCount () > 0) {
					$row = $resp->fetch ( PDO::FETCH_ASSOC );
					$idPers = $row ["idPersona"];
					$sqlIn = "UPDATE personas SET Apellido = '" . $base->filtrar ( $p ["apellido"] ) . "',Nombre = '" . $base->filtrar ( $p ["nombre"] ) . "',
						                  Sexo = '" . $base->filtrar ( $p ["sexo"] ) . "',Domicilio = '" . $base->filtrar ( $domicilio ) . "',
						                  Circuito = '" . $base->filtrar ( $p ["circuito"] ) . "',Profesion = '" . $base->filtrar ( $p ["profesion"] ) . "',
						                  idLocalidad = $locPersona
						  WHERE idPersona = $idPers";
					//echo $sqlIn;
					if (! $base->query ( $sqlIn )) {
						return false;
					}
				} else {
					$sqlIn = "INSERT INTO personas (Apellido,Nombre,idTipoDocumento,DNI,Sexo,Domicilio,Circuito,idLocalidad,Profesion) VALUES 
					  ('" . $base->filtrar ( $p ["apellido"] ) . "','" . $base->filtrar ( $p ["nombre"] ) . "'," . $base->filtrar ( $tipoDoc ) . "," . $base->filtrar ( $p ["nroDoc"] ) . ",'" . $base->filtrar ( $p ["sexo"] ) . "','" . $base->filtrar ( $domicilio ) . "','" . $base->filtrar ( $p ["circuito"] ) . "',$locPersona,'" . $base->filtrar ( $p ["profesion"] ) . "')";
					//echo $sqlIn;
					if ($base->query ( $sqlIn )) {
						$idPers = $base->lastInsertId ();
					} else {
						return false;
					}
				}
				
				$sqlCo = "SELECT * FROM lotespersonas WHERE idLote = $idL AND idPersona = " . $idPers;
				
				if ($resp = $base->query ( $sqlCo )) {
					if ($resp->rowCount () <= 0) {
						$sqlIn = "INSERT INTO lotespersonas (idLote,idPersona,id_reg,FechaCarga,idEstadoDDJJ) VALUES
				  			($idL,$idPers," . $base->filtrar($p ["id_reg"]) . ",'".date("Y-m-d")."',1)";
						if (!$base->query ( $sqlIn )) {
							return false;
						}
					}
				} else {
					return false;
				}
			} else {
				return false;
			}
		}
		return true;
	} catch ( Exception $e ) {
		return false;
	}
}

function eliminarArchivos($archivos){
	foreach ($archivos as $ar){
		$inputFileName = "../uploads/$ar";
		unlink($inputFileName);
	}
}


function generarLote($descripcion, $fechaDesde, $fechaHasta, $observaciones, $archivos, $Usuario) {
	try {
		$base = new PDOConfig ();
		$descripcion = $base->filtrar ( $descripcion );
		$fechaDesde = $base->filtrar ( $fechaDesde );
		$fechaHasta = $base->filtrar ( $fechaHasta );
		$observaciones = $base->filtrar ( $observaciones );
		$archivos = $base->filtrar ( $archivos );
		$idL = 0;
		
		$sql = "INSERT INTO lotes(FechaDesde,FechaHasta,Descripcion,Observaciones,FHAlta,Login)
		VALUES ('" . formatFecha ( $fechaDesde ) . "','" . formatFecha ( $fechaHasta ) . "','$descripcion','$observaciones',
		       NOW(),'$Usuario')";
		// echo $sql;
		if ($base->beginTransaction ()) {
			if ($base->query ( $sql )) {
				$idL = $base->lastInsertId ();
				if ($idL > 0) {
					$personas = array ();
					$arr_archivos = explode ( "||", $archivos );
					foreach ( $arr_archivos as $ar ) {
						if (! leerPersonasLote ( $idL, $ar, $personas )) {
							$base->rollBack ();
							return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido un error al intentar leer el archivo $ar
                    	</div>";
						}
					}
					
					if (count ( $personas ) <= 0) {
						$base->rollBack ();
						return "<div class='alert alert-error' style='margin-top: 16px;'>
					<button type='button' class='close' data-dismiss='alert'>�</button>
					Ha ocurrido un error al intentar leer las personas de los archivos
					</div>";
					}
					
					if (! cargarPersonasLote ( $base, $idL, $personas )) {
						$base->rollBack ();
						return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido un error al intentar cargar las personas sorteadas
                    	</div>";
					} else {
						
						$sqlUp = "UPDATE lotes SET CantidadSorteados = (SELECT COUNT(*) FROM lotespersonas WHERE idLote = $idL) WHERE idLote = $idL";
					    if ($base->query ( $sqlUp )) {
					    	eliminarArchivos($arr_archivos);
					    	$base->commit ();
					    	return $idL;
					    }else{
					    	$base->rollBack ();
					    	return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar actualizar el lote
                    	</div>";
					    }
					}
				} else {
					$base->rollBack ();
					return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
				}
			} else {
				$base->rollBack ();
				return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
			}
		} else {
			return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}


function actualizarLote ($idLote, $descripcion, $fechaDesde, $fechaHasta, $observaciones, $archivos, $Usuario ) {
	try {
		$base = new PDOConfig ();
		$descripcion = $base->filtrar ( $descripcion );
		$fechaDesde = $base->filtrar ( $fechaDesde );
		$fechaHasta = $base->filtrar ( $fechaHasta );
		$observaciones = $base->filtrar ( $observaciones );
		$archivos = $base->filtrar ( $archivos );
		
		$sql = "UPDATE lotes SET FechaDesde='" . formatFecha ( $fechaDesde ) . "',
							  FechaHasta = '" . formatFecha ( $fechaHasta ) . "',
							  Descripcion = '$descripcion',
							  Observaciones='$observaciones'
				WHERE idLote = $idLote";
				
		//echo $sql;
		if ($base->beginTransaction ()) {
			if ($base->query ( $sql )) {				
				if ($archivos != "") 
				{
					$personas = array ();
					$arr_archivos = explode ( "||", $archivos );
					foreach ( $arr_archivos as $ar ) {
						if (! leerPersonasLote ( $idLote, $ar, $personas )) {
							$base->rollBack ();
							return "<div class='alert alert-error' style='margin-top: 16px;'>
							<button type='button' class='close' data-dismiss='alert'>�</button>
							Ha ocurrido un error al intentar leer el archivo $ar
							</div>";
						}
						}
							
						if (count ( $personas ) <= 0) {
						$base->rollBack ();
						return "<div class='alert alert-error' style='margin-top: 16px;'>
					<button type='button' class='close' data-dismiss='alert'>�</button>
					Ha ocurrido un error al intentar leer las personas de los archivos
					</div>";
					}
			
					if (!cargarPersonasLote ( $base, $idLote, $personas )) {
					$base->rollBack ();
					return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido un error al intentar cargar las personas sorteadas
                    	</div>";
					}
                                    if(count($arr_archivos) > 0){
                                        eliminarArchivos($arr_archivos);
                                    } 
				}
				
				$sqlUp = "UPDATE lotes SET CantidadSorteados = (SELECT COUNT(*) FROM lotespersonas WHERE idLote = $idLote) WHERE idLote = $idLote";
				if ($base->query ( $sqlUp )) {
                                   
                                    $base->commit ();
				return "1";
				}else{
					$base->rollBack ();
					return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar actualizar el lote
                    	</div>";
				}
				
			
			} else {
					$base->rollBack ();
					return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar actualizar los datos
                    	</div>";
			}
		} else {
					return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar iniciar la transacci&oacute;n
                    	</div>";
		}
	} catch ( Exception $e ) {
	return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}


function asociarPlantilla($idLote,$idPlantilla) {
	try {
		$base = new PDOConfig ();
		$idLote = $base->filtrar ( $idLote );
		$idPlantilla = $base->filtrar ( $idPlantilla );

		$sql = "UPDATE lotes SET idPlantilla=$idPlantilla  WHERE idLote = $idLote";
		// echo $sql;		
		if ($base->query ( $sql )) {
			return "1";
		}else{
			return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        Ha ocurrido un error al intentar asociar los datos
                    	</div>";
		}
	} catch ( Exception $e ) {
	return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}


function LotePlantilla($idLote) {
	try {
		$base = new PDOConfig ();
		$idLote = $base->filtrar ( $idLote );
		$idPlantilla = $base->filtrar ( $idPlantilla );

		$sql = "SELECT idPlantilla FROM lotes WHERE idLote = $idLote";
		//echo $sql;		
		if ($res = $base->query ( $sql )) {
                    $row = $res->fetch(PDO::FETCH_ASSOC);
                    //return print_r($row);
                    if($row["idPlantilla"] != ""){
                        return "1";
                        }
                    else{
                      return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>X</button>
                           No es posible generar las c&eacute;dulas porque el lote no 
                           tiene una plantilla de DDJJ asociada. <a href='lot_modificarLote.php?id=$idLote'> Asociar Plantilla</a>
                    	</div>";  
                    }
		}else{
			return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>X</button>
                        Ha ocurrido un error al intentar consultar los datos
                    	</div>";
		}
	} catch ( Exception $e ) {
	return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>X</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}


function listado($descripcion, $fechaDesde, $fechaHasta, $todo) {
	try {
		$where = "";
		$base = new PDOConfig ();

		$descripcion = $base->filtrar ( $descripcion );
		$fechaDesde = $base->filtrar ( $fechaDesde );
		$fechaHasta = $base->filtrar ( $fechaHasta );

		if($todo <= 0)
		{
			$where .= " AND L.FechaHasta > '".date("Y-m-d")."'";
		}else{
		
		if($descripcion != "")
		{
			$where .= " AND L.Descripcion LIKE '%$descripcion%'";
		}

		if($fechaDesde != "")
		{
			$where .= " AND L.FechaDesde >= '".$fechaDesde."'";
		}
		
		if($fechaHasta != "")
		{
			$where .= " AND L.FechaDesde <= '".$fechaHasta."'";
		}
		}
		
		
		
		$sql = "SELECT L.idLote,L.FechaDesde, L.FechaHasta,L.Descripcion,L.CantidadSorteados
				FROM lotes L
				WHERE 1=1 $where
				ORDER BY L.FechaDesde DESC ";
		// echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
		$tabla = "<div class='navbar'><div class='navbar-inner'><h6>Listado de Sorteos</h6></div></div>
                    <div class='table-overflow'>
                        <table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
					        <th>Descripci&oacute;n</th>
							<th>Fecha Inicio</th>
							<th>Fecha Finalizaci&oacute;n</th>
							<th>Sorteados</th>
							<th>Acciones</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
			$tabla .= "<tr>
				<td>" .$row["Descripcion"]. "</td>
				<td>" .formatFecha($row["FechaDesde"]). "</td>
				<td>" .formatFecha($row["FechaHasta"]). "</td>
				<td>" .$row["CantidadSorteados"]. "</td>
				<td>
					<ul class='table-controls'>";
			
				if($todo <= 0)
				{
	                  $tabla .= "<li><a class='btn tip' title='Modificar' href='lot_modificarLote.php?id=".$row["idLote"]."' data-original-title='modificar lote'>
								<i class='icon-edit'></i></a></li>
	                  			<li><a class='btn tip' title='Asociar Centro de Distribucion' href='lot_asociarCentroDistribucion.php?id=".$row["idLote"]."' data-original-title='Asociar Centro de Distribucion'>
								<i class='icon-rss'></i></a></li>
	                  			<li><a class='btn tip' title='Cargar Notificaciones' href='lot_cargarFechaNotificacion.php?id=".$row["idLote"]."' data-original-title='Cargar Notificaciones'>
								<i class='icon-envelope-alt'></i></a></li>";
				}
			 	
			 	$tabla .= "<li><a class='btn tip' title='Personas por Lote' href='lot_personasXLote.php?id=".$row["idLote"]."' href='#' data-original-title='Personas Por Lote'>
							<i class='icon-group'></i></a></li>
					<ul>
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

function ver($id) {
	try {
		$salida = 0;
		$base = new PDOConfig ();

		$id = $base->filtrar ( $id );
		
		$sql = "SELECT L.idLote,L.FechaDesde, L.FechaHasta,L.Descripcion, L.CantidadSorteados,
				L.Observaciones,L.idPlantilla,L.FHAlta
				FROM lotes L
				WHERE L.idLote = $id";
		// echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			if($row = $res->fetch(PDO::FETCH_ASSOC)){
				$fechaDesde = date_create($row ["FechaDesde"]);
				$fechaHasta = date_create($row ["FechaHasta"]);
				$row["FechaDesde"] = date_format ( $fechaDesde, 'd/m/Y' );
				$row["FechaHasta"] = date_format ( $fechaHasta, 'd/m/Y' );
				$salida = json_encode($row);
				
			}else{
				return 0;
			}
			
			
			return $salida;
		}
		else {
			return 0;
		}
	} catch ( Exception $e ) {
		return 0;
	}
}

function listadoParaDoc() {
	try {
		$where = "";
		$base = new PDOConfig ();

	    $where .= " AND L.FechaHasta > '".date("Y-m-d")."'";
		

		$sql = "SELECT L.idLote,L.FechaDesde, L.FechaHasta,
		               L.Descripcion,L.CantidadSorteados,N.idNotificacion,N.PlantillaNotificacion,
		               N.ArchivoNotificaciones,
		               N.PlantillaSobres,N.ArchivoSobres,N.PlantillaIntimacion, N.ArchivoIntimacion
		FROM lotes L
		LEFT JOIN notificaciones N ON L.idLote = N.idLote
		WHERE 1=1 $where
		ORDER BY L.FechaDesde DESC ";
		//echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
		$tabla = "<div class='navbar'><div class='navbar-inner'><h6>Listado de Sorteos</h6></div></div>
                    <div class='table-overflow'>
                        <table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
					        <th>Descripci&oacute;n</th>
							<th>Per&iacute;odo</th>".							
//							<th>Noficaciones</th>
							"<th>Sobres</th>".
							//<th>DD JJ</th>
							//<th>Sobre Dev.</th>
							//<th>Intimaci&oacute;n</th>
							"<th>&nbsp;</th>
					    </tr>
					    </thead>
					    <tbody>";
					    foreach ($res as $row ) {
					    	
					    	$plantillaNot= "";
					    	$plantillaSob= "";
					    	$plantillaInt= "";
					    	$tabla .= "<tr>
					    	<td>" .$row["Descripcion"]. "</td>
					    	<td>" .formatFecha($row["FechaDesde"]). " AL ".formatFecha($row["FechaHasta"])."</td>";
					    						    	
					    	if($row["idNotificacion"] != "")
					    	{
// 						    	if($row["PlantillaNotificacion"] != "")
// 						    	{
// 						    		$plantillaNot .= "<a href='uploads/plantillas/".$row["PlantillaNotificacion"]."' target='_blank' alt='Plantilla Notificaci&oacute;n'>Modelo de Notificaciones</a>";
// 						    	}
						    	
						    	if($row["PlantillaSobres"] != "")
						    	{
						    		$plantillaSob .= "<a href='uploads/plantillas/".$row["PlantillaSobres"]."' target='_blank' alt='Plantilla Sobre'>Modelo de Sobres</a>";
						    	}
						    	
// 						    	$tabla .= "<td> $plantillaNot <br />";
// 						    	if($row["ArchivoNotificaciones"] != "")
// 						    	{
// 						    		$tabla .= "<a href='uploads/archivosrtf/".$row["ArchivoNotificaciones"]."' target='_blank' alt='RTF de Notificaciones'>Ver RTF</a>";
// 						    	}
						    	
// 						    	$tabla .= "<a class='btn tip' title='Vover a Generar RTF ' href='doc_imprimirCedulasNot.php?id=".$row["idLote"]."' data-original-title='Imprimir Cedulas'>
// 										Generar RTF Notificaciones</a>
// 						    			</td>";
						    	
						    	$tabla .= "<td> $plantillaSob <br />";
						    	if($row["ArchivoSobres"] != "")
						    	{
						    		$tabla .= "<a href='uploads/archivosrtf/".$row["ArchivoSobres"]."' target='_blank' alt='RTF Sobres'>Ver RTF</a>";
						    	}
						    	
						    	$tabla .= "<a class='btn tip' title='Vover a Generar RTF ' href='doc_imprimirSobresNot.php?id=".$row["idLote"]."' data-original-title='Imprimir Sobres'>
											Generar RTF Sobres</a>
						    			</td>";
						    	
// 						    	$tabla .= "<td><a class='btn tip' title='Imprimir DDJJ' href='doc_imprimirDDJJ.php?id=".$row["idLote"]."' target='_blank' data-original-title='Imprimir DDJJ'>
// 											Imprimir DD JJ</a></td>";
// 						    	$tabla .= "<td><a class='btn tip' title='Imprimir Sobre DDJJ' href='doc_imprimirSobreChico.php' target='_blank' data-original-title='Imprimir DDJJ'>
// 											Imprimir Sobre Peq.</a></td>";
						    	
						    	
// 						    	if($row["PlantillaIntimacion"] != "")
// 						    	{
// 						    		$plantillaInt= "<a href='uploads/plantillas/".$row["PlantillaIntimacion"]."' target='_blank' alt='Plantilla Intimaciones'>Ver Plantilla</a> ";
// 						    	}
						    	
// 						    	$tabla .= "<td> $plantillaInt <br />";
// 						    	if($row["ArchivoIntimacion"] != "")
// 						    	{
						    		
// 						    		$tabla .= "<a href='uploads/archivosrtf/".$row["ArchivoIntimacion"]."' target='_blank' alt='RTF Intimaciones'>Ver RTF</a>";
// 						    	}
// 						    	$tabla .= "</td>";
					    	}else{
					    		$tabla .= "	<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
					    				<td>&nbsp;</td>
					    				<td>&nbsp;</td>";
					    	}
							$tabla .= "<td>
								<ul class='table-controls'><li><a class='btn tip' title='Generar Cedulas' href='doc_generarCedulas.php?id=".$row["idLote"]."' data-original-title='Generar Cedulas'>
									  <i class='icon-edit'></i></a></li>
								<ul>
				 	 		</td>
				 	 		</tr>";
			}
			$tabla .= "</tbody</table></div>";
			return $tabla;
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'> </button>
                        	Error al consultar los datos
			</div>";
}
} catch ( Exception $e ) {
return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'></button>
                        	Ha ocurrido al intentar conectarse a la base
		</div>";
	}
}


function combo($selected, $default) {
	
	try {
		
		$base = new PDOConfig ();
				
		$sql = "SELECT L.idLote,L.FechaDesde, L.FechaHasta,L.Descripcion
		        FROM lotes L ORDER BY L.FechaDesde DESC ";
	
		$res = $base->query ( $sql );
	
		$Listcombo = "<option value=''>$default</option>";
	
		foreach ( $res as $row ) {
		if ($selected == $row ["idLote"]) {
				$Listcombo .= "<option value='" . $row ["idLote"] . "' selected='selected'>" . $row ["Descripcion"] . "</option>";
			} else {
		$Listcombo .= "<option value='" . $row ["idLote"] . "' >" . $row ["Descripcion"] . "</option>";
		}
		}
		
	  return $Listcombo;
	  
	} catch ( Exception $e ) {
	return "Error al consultar los datos";
	}
	
	
}


function comboActivos($selected, $default) {

	try {

		$base = new PDOConfig ();

		$sql = "SELECT L.idLote,L.FechaDesde,L.FechaHasta,L.Descripcion
		        FROM lotes L WHERE L.FechaHasta > '".date("Y-m-d")."' ORDER BY L.FechaDesde DESC ";

		$res = $base->query ( $sql );

		$Listcombo = "<option value=''>$default</option>";

		foreach ( $res as $row ) {
			if ($selected == $row ["idLote"]) {
				$Listcombo .= "<option value='" . $row ["idLote"] . "' selected='selected'>" . $row ["Descripcion"] . "</option>";
			} else {
				$Listcombo .= "<option value='" . $row ["idLote"] . "' >" . $row ["Descripcion"] . "</option>";
			}
		}

		return $Listcombo;
		 
	} catch ( Exception $e ) {
		return "Error al consultar los datos";
	}


}




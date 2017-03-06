<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../libs/PDOConfig.php');
require_once 'utilidades.php';
require_once 'parametros.php';
require_once("../libs/Login.php"); 
$oLogin=new Login();
if(!$oLogin->activa()){ exit(); }

function listarXLote($idLote,$apellido,$nombre,$nroDoc,$tipoDoc) {
	try {
		$where = "";
		global $ESTADOSDDJJ;
		$base = new PDOConfig ();
		$apellido = $base->filtrar($apellido);
		$nombre = $base->filtrar($nombre);
		$nroDoc = $base->filtrar($nroDoc);
		$tipoDoc = $base->filtrar($tipoDoc);
		
		if(($tipoDoc != "") && ($tipoDoc != "-1"))
		{
			$where .= " AND P.idTipoDocumento = $tipoDoc";
		}
		
		if($nroDoc != "")
		{
			$where .= " AND P.DNI = $nroDoc";
		}
		
		if($apellido != "")
		{
			$where .= " AND P.Apellido LIKE '%$apellido%'";
		}
		
		if($nombre != "")
		{
			$where .= " AND P.Nombre LIKE '%$nombre%'";
		}
		
		$sql = "SELECT P.idPersona,P.Apellido,P.Nombre,P.idTipoDocumento,P.DNI, TD.Descripcion AS tipoDoc,P.Sexo, P.idCentroDistribucion,
		        LP.NroCedula,LP.idEstadoDDJJ, E.Descripcion AS estadoDDJJ, L.FechaHasta AS VencLote,LP.FechaNotificacion,LP.ObservacionesEstado,LP.idLP
				FROM personas P
				INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona
				INNER JOIN lotes L ON LP.idLote = L.idLote
				INNER JOIN tipodocumentos TD ON P.idTipoDocumento = TD.idTipoDocumento
				INNER JOIN estadosddjj E ON LP.idEstadoDDJJ = E.idEstadoDDJJ
				WHERE LP.idLote = $idLote $where
				ORDER BY P.Apellido,P.Nombre ";
		//echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			$tabla = "<table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>							
					        <th>Nro Cedula</th>
							<th>Apellido</th>
							<th>Nombre</th>
							<th>Documento</th>
							<th>Sexo</th>
							<th>Estado DDJJ</th>
							<th>&nbsp;</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
				$modif = true;
				
				$tabla .= "<tr>
							<td>" . $row ["NroCedula"] . "</td>
							<td>" . $row ["Apellido"] . "</td>
							<td>" . $row ["Nombre"] . "</td>
							<td>" . $row ["tipoDoc"] . " - " . $row ["DNI"] . "</td>
							<td>" . $row ["Sexo"] . "</td>
							<td>" . $row ["estadoDDJJ"] . "</td>
                            <td>
							<ul class='table-controls'>	
							<li><a class='btn tip' title='Ver Datos' href='pers_verDatosPersonas.php?id=" . $row ["idPersona"] . "&idL=$idLote' data-original-title='Actualizar Datos'>
						   	<i class='icon-info-sign'></i></a></li>";

						if($row["FechaNotificacion"] != "")
						{
							$FechaNotificacion = date_create($row ["FechaNotificacion"]);
							$row["FechaNotificacion"] = date_format( $FechaNotificacion, 'd/m/Y' );
						}
						  if(compara_fechas($row["VencLote"], date("Y-m-d")) > 0) 		
						  {	
						   		
							$tabla .= "<li><a class='btn tip' title='Actualizar Datos' href='pers_actualizarDatosPersonas.php?id=" . $row ["idPersona"] . "&idL=$idLote' data-original-title='Actualizar Datos'>
									<i class='icon-edit'></i></a></li>";
				
								if($row["idEstadoDDJJ"] >= $ESTADOSDDJJ["ENVIADA"])
								{
									$tabla .= "<li><a class='btn tip' title='Completar Declaraci&oacute;n Jurada' href='pers_completarDDJJ.php?id=" . $row ["idPersona"] . "&idL=$idLote' data-original-title='Completar Declaraci&oacute;n Jurada'>
														<i class='icon-check'></i></a></li>";
								}
								if(true)
								{
									$tabla .= "<li><a class='btn tip' title='Cargar Notificaci&oacute;n' href='#' onclick=\"cargarNotificacionUnPersona('".$row ["idLP"]."','".$row["FechaNotificacion"]."','".$row["ObservacionesEstado"]."','".$row["idCentroDistribucion"]."','".$row ["idPersona"]."');\">
									<i class='icon-envelope-alt'></i></a></li>";
								}
								if($row["idEstadoDDJJ"] >= $ESTADOSDDJJ["NOTIFICADA"])
								{
									$tabla .= "<li><a class='btn tip' title='Generar Intimaci&oacute;n' href='pers_completarDDJJ.php?id=" . $row ["idPersona"] . "&idL=$idLote' data-original-title='Generar Intimaci&oacute;n'>
									<i class='icon-paste'></i></a></li>";
								}
						  }
				
                $tabla .= "</ul></td></tr>";
			}
			
			$tabla .= "</tbody</table>";
			return $tabla;
			
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>&ensp;</button>
                        	Error al consultar los datos
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>&ensp;</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}


function comboTD($selected, $default) {
	try {
		$base = new PDOConfig ();
		
		$sql = "SELECT idTipoDocumento,Descripcion
				FROM tipodocumentos
				ORDER BY Descripcion ";
		
		$res = $base->query ( $sql );
		
		$Listcombo = "<option value=''>$default</option>";
		
		foreach ( $res as $row ) {
			if ($selected == $row ["idTipoDocumento"]) {
				$Listcombo .= "<option value='" . $row ["idTipoDocumento"] . "' selected='selected'>" . $row ["Descripcion"] . "</option>";
			} else {
				$Listcombo .= "<option value='" . $row ["idTipoDocumento"] . "' >" . $row ["Descripcion"] . "</option>";
			}
		}
		echo $Listcombo;
	} catch ( Exception $e ) {
		return "Error al consultar los datos";
	}
}
function verPersona($idPersona, $idLote) {
	try {
		$base = new PDOConfig ();
		
		$sql = "SELECT P.idPersona,P.Apellido,P.Nombre,P.idTipoDocumento,P.DNI,P.Sexo,P.CUIL,P.FechaNacimiento,P.Nacionalidad,P.LugarNacimiento,
		               P.Domicilio,P.idLocalidad,P.idCentroDistribucion,P.Circuito,P.CaracteristicaFijo,P.TelefonoFijo,
		               P.CaracteristicaCelu,P.TelefonoCelular,P.CorreoElectronico,P.Profesion,P.Ocupacion,P.Observaciones,
		               LP.idLP,LP.NroCedula,LP.FechaNotificacion,LP.ObservacionesEstado,LP.idEstadoDDJJ,LP.FechaIntimacion
				FROM personas P
				INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona AND LP.idLote = $idLote
				WHERE P.idPersona = $idPersona ";
		// echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			if ($row = $res->fetch ( PDO::FETCH_ASSOC )) {
				if ($row ["FechaNacimiento"] != "") {
					$fechaNac = date_create ( $row ["FechaNacimiento"] );
					$row ["FechaNacimiento"] = date_format ( $fechaNac, 'd/m/Y' );
				} else {
					$row ["FechaNacimiento"] = "";
				}
				
				if ($row ["FechaNotificacion"] != "") {
					$fechaNot = date_create ( $row ["FechaNotificacion"] );
					$row ["FechaNotificacion"] = date_format ( $fechaNot, 'd/m/Y' );
				} else {
					$row ["FechaNotificacion"] = "";
				}
				
				if ($row ["FechaIntimacion"] != "") {
					$fechaInt = date_create ( $row ["FechaIntimacion"] );
					$row ["FechaIntimacion"] = date_format ( $fechaInt, 'd/m/Y' );
				} else {
					$row ["FechaIntimacion"] = "";
				}
				
				return json_encode ( $row );
			} else {
				return "0";
			}
		} else {
			return "0";
		}
	} catch ( Exception $e ) {
		return "0";
	}
}
function actualizarPersona($idPers, $idLote, $apellido, $nombre, $nroDoc, $tipoDoc, $sexo, $cuil, 
		$fechaNac, $domicilio, $profesion, $ocupacion, $carTF, $telFijo, $carTC, $telCelu, $email, $nacionalidad, $lugarNac, $localidad) {
	try {
		
		$salida = "";
		$base = new PDOConfig ();
		$idPers = $base->filtrar ( $idPers );
		$idLote = $base->filtrar ( $idLote );
		$apellido = $base->filtrar ( $apellido );
		$nombre = $base->filtrar ( $nombre );
		$nroDoc = $base->filtrar ( $nroDoc );
		$tipoDoc = $base->filtrar ( $tipoDoc );
		$sexo = $base->filtrar ( $sexo );
		$cuil = $base->filtrar ( $cuil );
		$fechaNac = $base->filtrar ( $fechaNac );
		$domicilio = $base->filtrar ( $domicilio );
		$profesion = $base->filtrar ( $profesion );
		$ocupacion = $base->filtrar ( $ocupacion );
		$carTF = $base->filtrar ( $carTF );
		$telFijo = $base->filtrar ( $telFijo );
		$carTC = $base->filtrar ( $carTC );
		$telCelu = $base->filtrar ( $telCelu );
		$email = $base->filtrar ( $email );
		$nacionalidad = $base->filtrar ( $nacionalidad );
		$lugarNac = $base->filtrar ( $lugarNac );
		$localidad = $base->filtrar ( $localidad );
		
		if (($localidad == "") || ($localidad == "-1")) {
			$localidad = "NULL";
		}
			
		
		if (($carTF == "")) {
			$carTF = "NULL";
		}
		
		if (($carTC == "")) {
			$carTC = "NULL";
		}
		
		if (($fechaNac == "")) {
			$fechaNac = "NULL";
                }else{
                    $fechaNac = "'".formatFecha($fechaNac)."'";
                }
		
		$sql = "UPDATE personas SET Apellido = '$apellido',Nombre = '$nombre',
		                            idTipoDocumento = $tipoDoc,DNI = $nroDoc,
		                            Sexo ='$sexo',CUIL = '$cuil',FechaNacimiento =$fechaNac,
		                            Nacionalidad = '$nacionalidad',LugarNacimiento = '$lugarNac',
									Domicilio = '$domicilio',idLocalidad=$localidad,
									CaracteristicaFijo=$carTF,TelefonoFijo ='$telFijo',
									CaracteristicaCelu = $carTC,TelefonoCelular='$telCelu',
									CorreoElectronico= '$email',Profesion='$profesion',
									Ocupacion = '$ocupacion'					
					WHERE idPersona = $idPers ";
		//echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			return "1";
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar Actulizar los datos de la persona
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}


function completarDDJJ($idPers, $idLote, $idLP, $apellido, $nombre, $nroDoc, $tipoDoc, $sexo, $cuil, $fechaNac, $domicilio, $profesion, 
		$ocupacion, $carTF, $telFijo, $carTC, $telCelu, $email, $nacionalidad, $lugarNac, $localidad, $cbResultado, $FcNotif, 
		$FcRecep, $ObsEstado, $Apto, $Impedimento, $ObsImpedimiento, $respuestas, $usu, $FcInt,$cargaWeb) {
	
	global $ESTADOSDDJJ;
        global $IMPEDIMENTOS;
	$respAct = actualizarPersona ( $idPers, $idLote, $apellido, $nombre, $nroDoc, $tipoDoc, $sexo, $cuil, $fechaNac, $domicilio, $profesion, $ocupacion, $carTF, $telFijo, $carTC, $telCelu, $email, $nacionalidad, $lugarNac, $localidad );
	if ($respAct == "1") {
		$base = new PDOConfig ();
		$cbResultado = $base->filtrar ( $cbResultado );
		$FcNotif = $base->filtrar ( $FcNotif );
		$FcRecep = $base->filtrar ( $FcRecep );
		$ObsEstado = $base->filtrar ( $ObsEstado );
		$Apto = $base->filtrar ( $Apto );
		$Impedimento = $base->filtrar ( $Impedimento );
		$ObsImpedimiento = $base->filtrar ( $ObsImpedimiento );
		
                if ($Impedimento == "") {
			$Impedimento = "NULL";
		}
                
		if ($FcNotif == "") {
			$FcNotif = "NULL";
		}else{
			$FcNotif = "'".formatFecha($FcNotif )."'";
		}
		
		if ($FcRecep == "") {
			$FcRecep = "NULL";
		}else{
			$FcRecep = "'".formatFecha($FcRecep )."'";
		}
		
		if ($FcInt == "") {
			$FcInt = "NULL";
		}else{
			$FcInt = "'".formatFecha($FcInt)."'";
		}
		
		if (($cbResultado == $ESTADOSDDJJ ["SINNOTIFICAR"])) {
			$Apto = "0";
			$Impedimento = $IMPEDIMENTOS["SINNOTIFICAR"];
		}
                
                 if($cbResultado == $ESTADOSDDJJ ["NOTIFICADA"]){
                    $Apto = "0";
                    $Impedimento = $IMPEDIMENTOS["SINRECEPCION"];
                 }
                 
                 if($cbResultado == $ESTADOSDDJJ ["INTIMADA"]){
                    $Apto = "0";
                    $Impedimento = $IMPEDIMENTOS["SINRECEPCION"];
                 }
				                
		if (($cbResultado == $ESTADOSDDJJ ["COMPLETA"]) && $Impedimento == "") {			
			$Impedimento = "NULL";
		}
		
		try {
			$sqlUp = "UPDATE lotespersonas SET FechaNotificacion = $FcNotif,FechaRecepcionDDJJ=$FcRecep,FechaIntimacion=$FcInt,AptoJurado = $Apto,
		               idTipoImpedimento=$Impedimento,ObservacionesImpedimento='$ObsImpedimiento',
		               idEstadoDDJJ = $cbResultado,ObservacionesEstado='$ObsEstado', CargaWeb=$cargaWeb 
				WHERE idLP = $idLP";
			//echo $sqlUp;
			$base->beginTransaction ();
			if ($base->query ( $sqlUp )) {
				if ($cbResultado == $ESTADOSDDJJ ["COMPLETA"]) {
					foreach ($respuestas as $idP => $resp ) {
						
						if($resp == "1"){
							$resp = "Si";
						}else{
							if($resp == "0"){
							$resp = "No";
							}
						}
						
						$sql = "SELECT * FROM respuestas WHERE  idLP = $idLP AND idPregunta = $idP";
						if ($resSELECT = $base->query ( $sql )) {
							if($resSELECT->rowCount() <= 0)
							{
								$sqlIn = "INSERT INTO respuestas(idLP,idPregunta,Respuesta,FH,Login) VALUES
								($idLP,$idP,'$resp',NOW(),'$usu')";
							}else{
								$sqlIn = "UPDATE respuestas SET Respuesta='$resp', FH=NOW(),Login = '$usu' WHERE idLP = $idLP AND idPregunta = $idP";
							}
							//echo $sqlIn;
							if (!$base->query ($sqlIn)) {
								$base->rollBack ();
								return " <div class='alert alert-error' style='margin-top: 16px;'>
                                                                        <button type='button' class='close' data-dismiss='alert'>�</button>
                                                                                Ha ocurrido un error al intentar completar las respuestas de la DDJJ 1
                                                                        </div>";
							}
							
						}else{
							$base->rollBack ();
							return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido un error al intentar completar las respuestas de la DDJJ
                    	</div>";
						}
						
						
						
						
					}
				}
			} else {
				$base->rollBack ();
				return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido un error al intentar completar la DDJJ
                    	</div>";
			}
			$base->commit ();
			return "1";
		} catch ( Exception $e ) {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
		}
	} else {
		return $respAct;
	}
}


function busquedaXLote($idL,$tipoDoc,$nroDoc,$apellido,$nombre,$soloAptos,$idEstado) {
	try {
		global $ESTADOSDDJJ;
		$where = "";
		$base = new PDOConfig ();

		if(($tipoDoc != "") && ($tipoDoc != "-1"))
		{
			$where .= " AND P.idTipoDocumento = $tipoDoc"; 
		}
		
		if($nroDoc != "")
		{
			$where .= " AND P.DNI = $nroDoc";
		}
		
		if($apellido != "")
		{
			$where .= " AND P.Apellido LIKE '%$apellido%'";
		}
		
		if($nombre != "")
		{
			$where .= " AND P.Nombre LIKE '%$nombre%'";
		}
		
		if($soloAptos == "1")
		{
			$where .= " AND LP.AptoJurado = 1";
		}else{
			if($soloAptos == "0")
			{
				$where .= " AND LP.AptoJurado = 0";
			}
		}
		
		if($idEstado != "")
		{
			$where .= " AND LP.idEstadoDDJJ = ".$idEstado;
		}
		
		
		$sql = "SELECT P.idPersona,P.Apellido,P.Nombre,P.idTipoDocumento,P.DNI, TD.Descripcion AS tipoDoc,P.Sexo,
		LP.NroCedula,LP.idEstadoDDJJ, E.Descripcion AS estadoDDJJ, L.FechaHasta AS VencLote, LP.AptoJurado
		FROM personas P
		INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona
		INNER JOIN lotes L ON LP.idLote = L.idLote
		INNER JOIN tipodocumentos TD ON P.idTipoDocumento = TD.idTipoDocumento
		INNER JOIN estadosddjj E ON LP.idEstadoDDJJ = E.idEstadoDDJJ
		WHERE LP.idLote = $idL $where
		ORDER BY P.Apellido,P.Nombre ";
		
		//echo $sql;
		
		$res = $base->query ( $sql );
		if ($res) {
		$tabla = "<table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
					        <th>Nro Cedula</th>
							<th>Apellido</th>
							<th>Nombre</th>
							<th>Documento</th>
							<th>Sexo</th>
							<th>Estado DDJJ</th>
							<th>Apto P/Jurado</th>
							<th>&nbsp;</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
			$modif = true;

			$tabla .= "<tr>
						<td>" . $row ["NroCedula"] . "</td>
						<td>" . $row ["Apellido"] . "</td>
						<td>" . $row ["Nombre"] . "</td>
						<td>" . $row ["tipoDoc"] . " - " . $row ["DNI"] . "</td>
						<td>" . $row ["Sexo"] . "</td>
						<td>" . $row ["estadoDDJJ"] . "</td>";
						if(($row["AptoJurado"] == ""))								
							$tabla .= "<td>&nbsp;</td>";
						else 
							if($row["AptoJurado"] == "0")
								$tabla .= "<td>NO</td>";
						else
							$tabla .= "<td>SI</td>";
			$tabla .= "<td>
						<ul class='table-controls'>
						   <li><a class='btn tip' title='Ver Datos' href='pers_verDatosPersonas.php?id=".$row ["idPersona"]."&idL=$idL' data-original-title='Ver Datos'>
						   <i class='ico-info-sign'></i></a></li>
						</ul>
						</td></tr>";
		}
			
		$tabla .= "</tbody</table>";
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

function resultadosXLote ($idLote,$idPersona){
	try {
		$base = new PDOConfig ();
		$sqlUp = "SELECT idLote, idPersona, FechaNotificacion, FechaRecepcionDDJJ,AptoJurado,idTipoImpedimento,
		           ObservacionesImpedimento,idEstadoDDJJ,ObservacionesEstado,FechaIntimacion
				FROM lotespersonas	WHERE idLote = $idLote AND idPersona = $idPersona";
		//echo $sqlUp;
		if ($resp = $base->query ( $sqlUp )) {
			if($row = $resp->fetch(PDO::FETCH_ASSOC)){
				
				if($row["FechaNotificacion"] != ""){				
					$FechaNotificacion = date_create($row ["FechaNotificacion"]);
					$row["FechaNotificacion"] = date_format ( $FechaNotificacion, 'd/m/Y' );
				}else{
					$row["FechaNotificacion"] = "";
				}
                                
                                if($row["FechaIntimacion"] != ""){				
					$FechaNotificacion = date_create($row ["FechaIntimacion"]);
					$row["FechaIntimacion"] = date_format ( $FechaNotificacion, 'd/m/Y' );
				}else{
					$row["FechaIntimacion"] = "";
				}
				
				if($row["FechaRecepcionDDJJ"] != ""){
				$FechaRecepcionDDJJ = date_create($row ["FechaRecepcionDDJJ"]);				
				$row["FechaRecepcionDDJJ"] = date_format ( $FechaRecepcionDDJJ, 'd/m/Y' );
				
				}else{
					$row["FechaRecepcionDDJJ"]= "";
				}
				
				$salida = json_encode($row);
				return $salida;
			}else{
				return "0";
			}
		}else{
			return "0";
		}
		
	} catch ( Exception $e ) {
		return "0";
	}
}


function  DDJJCompleta($idLote,$idPersona){

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
			
					$sqlP = "SELECT PP.idPlantilla, PP.idPregunta,PP.Orden, E.Descripcion AS Pregunta, 
							E.idTipoRespuesta, R.Respuesta
						FROM plantillas_preguntas PP
						INNER JOIN preguntas E ON PP.idPregunta = E.idPregunta
						INNER JOIN respuestas R ON R.idPregunta = E.idPregunta
						WHERE R.idLP=$idPL AND PP.idPlantilla = $idPlantilla AND E.idCategoria = " . $row ["idCategoria"] . 
					              " ORDER BY PP.Orden";
					//echo $sqlP;
					$resP = $base->query ( $sqlP );
			if ($resP) {
			$cant = $cant + $resP->rowCount();
				foreach ( $resP as $rowP ) {
				$tabla .= "<div class='control-group'>
					<label class='control-label'>
								<strong class='subtitle'><span id='s" . $rowP["idPregunta"] . "'>" . $rowP ["Orden"] . "</span> - " . $rowP ["Pregunta"] . "</strong></label>
											<div class='controls'>";
							$tabla .= "<input type='text' name='respuestas[".$rowP["idPregunta"]."]' id='respuestas[".$rowP["idPregunta"]."]' class='span12' value='".$rowP["Respuesta"]."' />";
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


function listarXLoteYLocalidad($idlote, $idLocalidad)
{
	try {
		$where = "";
		global $ESTADOSDDJJ;
		$base = new PDOConfig ();
	
		$sql = "SELECT P.idPersona,P.Apellido,P.Nombre,P.idTipoDocumento,P.DNI, TD.Descripcion AS tipoDoc,P.Sexo,
		LP.NroCedula,LP.idEstadoDDJJ, LOC.Descripcion AS Localidad,C.Nombre AS centro
		FROM personas P
		INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona		
		INNER JOIN tipodocumentos TD ON P.idTipoDocumento = TD.idTipoDocumento
		INNER JOIN localidades LOC ON P.idLocalidad = LOC.idLocalidad
		LEFT JOIN centrodistribucion C ON P.idCentroDistribucion = C.idCentroDistribucion
		WHERE LP.idLote = $idlote AND P.idLocalidad = $idLocalidad
		ORDER BY P.Apellido,P.Nombre ";
		//echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
		$tabla = "<table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
							<th>Apellido</th>
							<th>Nombre</th>
							<th>Documento</th>
							<th>Localidad</th>
							<th>Centro Dist.</th>
							<th>&nbsp;</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
				$modif = true;
	
				$tabla .= "<tr>
				<td>" . $row ["Apellido"] . "</td>
				<td>" . $row ["Nombre"] . "</td>
				<td>" . $row ["tipoDoc"] . " - " . $row ["DNI"] . "</td>
				<td>" . $row ["Localidad"] . "</td>
				<td>" . $row ["centro"] . "</td>
				<td><input class='selCk' type='checkbox' value='".$row ["idPersona"]."' name='personas[".$row ["idPersona"]."]' id='personas[".$row ["idPersona"]."]' checked='checked' />
				</td></tr>";
				}
					
				$tabla .= "</tbody</table>";
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


function asociarCentroDist($idCentro,$personas){
	
	try {
	
		$salida = "";
		$base = new PDOConfig ();
		$lista = "(";
		foreach ($personas as $p) 
		{
			$lista .= "$p,";
		}
		$lista = substr($lista,0,strlen($lista)-1);
		$lista .= ")";
		
		
		$sql = "UPDATE personas SET idCentroDistribucion = $idCentro
				WHERE idPersona IN $lista ";
		//echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			return "1";
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar Actulizar los datos de la persona
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}



function listarXCentro($idlote, $idCentro)
{
	try {
		$where = "";
		$base = new PDOConfig ();

		$sql = "SELECT P.idPersona,P.Apellido,P.Nombre,P.idTipoDocumento,P.DNI, TD.Descripcion AS tipoDoc,P.Sexo,
		LP.idLP,LP.NroCedula,LP.idEstadoDDJJ,LP.FechaNotificacion,LP.ObservacionesEstado, LOC.Descripcion AS Localidad,C.Nombre AS centro
		FROM personas P
		INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona
		INNER JOIN tipodocumentos TD ON P.idTipoDocumento = TD.idTipoDocumento
		INNER JOIN localidades LOC ON P.idLocalidad = LOC.idLocalidad
		LEFT JOIN centrodistribucion C ON P.idCentroDistribucion = C.idCentroDistribucion
		WHERE LP.idLote = $idlote AND P.idCentroDistribucion = $idCentro
		ORDER BY P.Apellido,P.Nombre ";
		//echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			$tabla = "<table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
							<th>Apellido</th>
							<th>Nombre</th>
							<th>Documento</th>
							<th>Localidad</th>
							<th>Centro Dist.</th>
							<th>Notificaci&oacute;n</th>
							<th>&nbsp;</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
				$modif = true;
				if($row["FechaNotificacion"] != "")
				{
					$FechaNotificacion = date_create($row ["FechaNotificacion"]);
					$row["FechaNotificacion"] = date_format( $FechaNotificacion, 'd/m/Y' );
				}
				
				$tabla .= "<tr>
				<td>" . $row ["Apellido"]."</td>
				<td>" . $row ["Nombre"]."</td>
				<td>" . $row ["tipoDoc"] . " - " . $row ["DNI"] . "</td>
				<td>" . $row ["Localidad"] . "</td>
				<td>" . $row ["centro"] . "</td>
				<td>" . $row["FechaNotificacion"]. "</td>
				<td>
					<ul class='table-controls'>
					 <li><a class='btn tip' title='Cargar Notificaci&oacute;n' href='#' onclick=\"cargarNotificacion('".$row ["idLP"]."','".$row["FechaNotificacion"]."','".$row["ObservacionesEstado"]."');\" 
					     data-original-title='Cargar Notificaci&oacute;n'>
					     <i class='icon-edit'></i></a></li>	
					</ul>	
				</td></tr>";
			}
				
			$tabla .= "</tbody</table>";
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



function  cargarNotificacion ($idPL,$notificacion,$observaciones,$idPersona){

	try {
		global $ESTADOSDDJJ;
		$salida = "";
		$base = new PDOConfig ();
		$idPL = $base->filtrar ( $idPL );
		$notificacion = $base->filtrar ( $notificacion );
		$observaciones = $base->filtrar ( $observaciones );
		$idPersona = $base->filtrar ( $idPersona );
	
		$sql = "UPDATE lotespersonas SET FechaNotificacion = '".formatFecha($notificacion)."',
		        ObservacionesEstado = '".$observaciones."', idEstadoDDJJ=".$ESTADOSDDJJ["NOTIFICADA"]." WHERE idLP = $idPL";
		if($idPersona != ""){
			$sql .=" AND idPersona = ".$idPersona;
		}
		echo $sql;
		$res = $base->query ( $sql );
		if ($res) {
			return "1";
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar Actulizar los datos de la persona
                    	</div>";
		}
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}


function personasParaIntimacion($idL,$tipoDoc,$nroDoc,$apellido,$nombre){
	try {
		global $ESTADOSDDJJ;
		$where = "";
		$base = new PDOConfig ();
	
		if(($tipoDoc != "") && ($tipoDoc != "-1"))
		{
			$where .= " AND P.idTipoDocumento = $tipoDoc";
		}
	
		if($nroDoc != "")
		{
		$where .= " AND P.DNI = $nroDoc";
		}
	
		if($apellido != "")
		{
		$where .= " AND P.Apellido LIKE '%$apellido%'";
		}
	
		if($nombre != "")
		{
		$where .= " AND P.Nombre LIKE '%$nombre%'";
		}
	
		$where .= " AND LP.idEstadoDDJJ = ".$ESTADOSDDJJ["NOTIFICADA"];
	
	
		$sql = "SELECT P.idPersona,P.Apellido,P.Nombre,P.idTipoDocumento,P.DNI, TD.Descripcion AS tipoDoc,P.Sexo,
			LP.NroCedula,LP.idEstadoDDJJ, E.Descripcion AS estadoDDJJ, L.FechaHasta AS VencLote, LP.AptoJurado,
			LP.FechaNotificacion
			FROM personas P
			INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona
			INNER JOIN lotes L ON LP.idLote = L.idLote
			INNER JOIN tipodocumentos TD ON P.idTipoDocumento = TD.idTipoDocumento
			INNER JOIN estadosddjj E ON LP.idEstadoDDJJ = E.idEstadoDDJJ
			WHERE LP.idLote = $idL $where
			ORDER BY P.Apellido,P.Nombre ";
	
			//echo $sql;
	
			$res = $base->query ( $sql );
					if ($res) {
					$tabla = "<table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
					        <th>Nro Cedula</th>
							<th>Apellido</th>
							<th>Nombre</th>
							<th>Documento</th>
							<th>Sexo</th>
							<th>Estado DDJJ</th>
							<th>Notificaci&oacute;n</th>
							<th>&nbsp;</th>
					    </tr>
					    </thead>
					    <tbody>";
			foreach ( $res as $row ) {
					$modif = true;
	
					$tabla .= "<tr>
					<td>" . $row ["NroCedula"] . "</td>
					<td>" . $row ["Apellido"] . "</td>
					<td>" . $row ["Nombre"] . "</td>
					<td>" . $row ["tipoDoc"] . " - " . $row ["DNI"] . "</td>
					<td>" . $row ["Sexo"] . "</td>
					<td>" . $row ["estadoDDJJ"] . "</td>
					<td>" .formatFechaHora($row ["FechaNotificacion"]). "</td>
					<td><input class='selCk' type='checkbox' value='".$row ["idPersona"]."' name='personas[".$row ["idPersona"]."]' id='personas[".$row ["idPersona"]."]' checked='checked' />
					</td></tr>";
			}
						
					$tabla .= "</tbody</table>";
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

function generarIntimaciones($idLote,$personas,$arplantilla){
	try {
		global $ESTADOSDDJJ;
	$base = new PDOConfig ();
	$inPer = "(";
	foreach ($personas as $p)
	{
		$inPer .= $p.",";
	}
	$inPer = substr($inPer, 0, (strlen($inPer) - 1));
	$inPer .= ")";
		
		
			$fnombre =$idLote."_intimaciones.rtf";
			$fsalida = "../uploads/archivosrtf/".$fnombre;
			$plantilla = leerArchivo("../uploads/plantillas/$arplantilla");
				
			$matriz=explode("sectd", $plantilla);
			$cabecera=$matriz[0]."sectd";
			$inicio=strlen($cabecera);
			$final=strrpos($plantilla,"}");
			$largo=$final-$inicio;
			$cuerpo=substr($plantilla, $inicio, $largo);
			//Paso no.3 Escribo el fichero
			$punt = fopen($fsalida, "w");
			fputs($punt, $cabecera);
				
			
			
			$salida = "";
			$sqlSe = "SELECT P.idPersona,P.Apellido,P.Nombre,P.idTipoDocumento,P.DNI,TD.Descripcion AS tipoDoc,P.Sexo,
			LP.NroCedula, P.Domicilio, P.idLocalidad,LOC.Descripcion AS localidad,DI.Nombre AS CentroDist FROM personas P
			INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona
			INNER JOIN localidades LOC ON P.idLocalidad = LOC.idLocalidad
			INNER JOIN tipodocumentos TD ON P.idTipoDocumento = TD.idTipoDocumento
                        LEFT JOIN centrodistribucion DI ON P.idCentroDistribucion = DI.idCentroDistribucion
			WHERE LP.idLote = $idLote AND P.idPersona IN $inPer
			ORDER BY P.Apellido,P.Nombre ";
			// echo $sql;
			$res = $base->query ( $sqlSe );
			if ($res) {
	
				foreach ( $res as $row ) {
                                    if($row["CentroDist"] == null || $row["CentroDist"] == "NULL")
                                    {
                                        $row["CentroDist"] = "";
                                    }
                                    
					$despues=$cuerpo;
					$despues=str_replace("#NROCEDULA#",$row["NroCedula"],$despues);
					$despues=str_replace("#ANIOCEDULA#",date("Y"),$despues);
					$despues=str_replace("#NOMBRE#", utf8_decode($row["Nombre"]),$despues);
					$despues=str_replace("#APELLIDO#", utf8_decode($row["Apellido"]),$despues);
					$despues=str_replace("#DNI#",$row["tipoDoc"]." ".$row["DNI"],$despues);
					$despues=str_replace("#DOMICILIO#",utf8_decode($row["Domicilio"]),$despues);
					$despues=str_replace("#LOCALIDAD#",utf8_decode($row["localidad"]),$despues);
					$despues=str_replace("#DIA#",date('d'),$despues);
					$despues=str_replace("#MES#",date('m'),$despues);
					$despues=str_replace("#ANIO#",date('Y'),$despues);
                                        $despues=str_replace("#CENTRODISTRIBUCION#",utf8_decode($row["CentroDist"]),$despues);
					fputs($punt,$despues);
					$saltopag="\n\\page \\par \n";
					fputs($punt,$saltopag);
	
					
				}
					
				fputs($punt,"}");
				fclose ($punt);
					
			}
	
	
		$zip = new ZipArchive();
	
		$filename = $fsalida.".zip";
	
		if($zip->open($filename,ZIPARCHIVE::CREATE)===true) {
			$zip->addFile($fsalida,$fnombre);
			$zip->close();
			$inputFileName = $fsalida;
			unlink($inputFileName);
		}
		else {
			echo "0";
		}
	
		$sql = "UPDATE notificaciones SET PlantillaIntimacion='$arplantilla', ArchivoIntimacion = '$fnombre.zip'
				WHERE idLote = $idLote";
		//echo $sql;
		if ($base->query ($sql))
		{
			$sql = "UPDATE lotespersonas SET idEstadoDDJJ = ".$ESTADOSDDJJ["INTIMADA"].", FechaIntimacion='".date('Y-m-d')."'
				WHERE idLote = $idLote AND idPersona IN $inPer";
	
			if ($base->query ($sql))
			{
				echo "<a href='uploads/archivosrtf/".$fnombre.".zip"."'>$fnombre.zip</a>";				
			}else{
				echo "0";
			}
		}else{
				echo "0";
			}	
	} catch ( Exception $e ) {
		return "0";
	}
}

if ($_POST) {
	$rta = "";
	try {
		$oper = $_POST ['oper'];
		$Usuario = $oLogin->getUsuario();
		
		switch ($oper) {
			
			case 'listarXLote' :
				$idL = $_POST ["idLote"];
				$apellido = $_POST ["txtApellido"];
				$nombre = $_POST ["txtNombre"];
				$nroDoc = $_POST ["txtNroDoc"];
				$tipoDoc = $_POST ["cbTipoDoc"];
				$rta = listarXLote( $idL,$apellido,$nombre,$nroDoc,$tipoDoc);
				break;
			
			case 'comboTD' :
				$default = $_POST ['vdefaul'];
				$selected = $_POST ["selected"];
				$rta = comboTD ( $selected, $default );
				break;
			
			case 'ver' :
				$idPers = $_POST ["idPersona"];
				$idLote = $_POST ["idLote"];
				$rta = verPersona ( $idPers, $idLote );
				break;
			
			case 'modificar' :
				$idPers = $_POST ["hfIdPer"];
				$idLote = $_POST ["hfIdLote"];
				$apellido = $_POST ["txtApellido"];
				$nombre = $_POST ["txtNombre"];
				$nroDoc = $_POST ["txtNroDoc"];
				$tipoDoc = $_POST ["cbTipoDoc"];
				$sexo = $_POST ["cbSexo"];
				$cuil = $_POST ["txtCUIL"];
				$fechaNac = $_POST ["txtFechaNac"];
				$domicilio = $_POST ["txtDomicilio"];
				$profesion = $_POST ["txtProfesion"];
				$ocupacion = $_POST ["txtOcupacion"];
				$carTF = $_POST ["txtCarTF"];
				$telFijo = $_POST ["txtTelFijo"];
				$carTC = $_POST ["txtCarTC"];
				$telCelu = $_POST ["txtTelCelu"];
				$email = $_POST ["txtEmail"];
				$nacionalidad = $_POST ["txtNacionalidad"];
				$lugarNac = $_POST ["txtLugarNac"];
				$localidad = $_POST ["cbLocalidad"];
				
				$rta = actualizarPersona ( $idPers, $idLote, $apellido, $nombre, $nroDoc, $tipoDoc, $sexo, $cuil, $fechaNac, $domicilio, $profesion, $ocupacion, $carTF, $telFijo, $carTC, $telCelu, $email, $nacionalidad, $lugarNac, $localidad );
				break;
			
			case 'completarDDJJ' :
				$idPers = $_POST ["hfIdPer"];
				$idLote = $_POST ["hfIdLote"];
				$idLP = $_POST ["hfIdLP"];
				$apellido = $_POST ["txtApellido"];
				$nombre = $_POST ["txtNombre"];
				$nroDoc = $_POST ["txtNroDoc"];
				$tipoDoc = $_POST ["cbTipoDoc"];
				$sexo = $_POST ["cbSexo"];
				$cuil = $_POST ["txtCUIL"];
				$fechaNac = $_POST ["txtFechaNac"];
				$domicilio = $_POST ["txtDomicilio"];
				$localidad = $_POST ["cbLocalidad"];
				$profesion = $_POST ["txtProfesion"];
				$ocupacion = $_POST ["txtOcupacion"];
				$carTF = $_POST ["txtCarTF"];
				$telFijo = $_POST ["txtTelFijo"];
				$carTC = $_POST ["txtCarTC"];
				$telCelu = $_POST ["txtTelCelu"];
				$email = $_POST ["txtEmail"];
				$nacionalidad = $_POST ["txtNacionalidad"];
				$lugarNac = $_POST ["txtLugarNac"];
				$cbResultado = $_POST ["cbResultado"];
				$FcNotif = $_POST ["txtNotificacion"];
				$FcRecep = $_POST ["txtRecepcion"];
				$FcInt = $_POST ["txtIntimacion"];
				$ObsEstado = $_POST ["txtObservacionesEst"];
				
				if (isset( $_POST ["rbApto"] )) {
					$Apto = $_POST ["rbApto"];
				} else {
					$Apto = "0";
				}
				
				if (isset ( $_POST ["ckCargaWeb"] )) {
					$cargaWeb = $_POST ["ckCargaWeb"];
				} else {
					$cargaWeb = "0";
				}
				
				$Impedimento = $_POST ["cbImpedimento"];
				$ObsImpedimiento = $_POST ["txtObservacionesImp"];
				$respuestas = $_POST ["respuestas"];
				$cantResp = $_POST ["hfCantPreg"];
				
				if ($cbResultado == $ESTADOSDDJJ ["COMPLETA"] && $cantResp > count ( $respuestas )) {
					$rta = "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	No se ha completado la Declaraci�n Jurada
                    	</div>";
				} else {
					
					$rta = completarDDJJ ( $idPers, $idLote, $idLP, $apellido, $nombre, $nroDoc, $tipoDoc, $sexo, $cuil, $fechaNac, $domicilio, $profesion, $ocupacion, $carTF, $telFijo, $carTC, $telCelu, $email, $nacionalidad, $lugarNac, $localidad, $cbResultado, $FcNotif, $FcRecep, $ObsEstado, $Apto, $Impedimento, $ObsImpedimiento,
							              $respuestas, $Usuario, $FcInt,$cargaWeb);
				}				
				break;
				
		case 'verPersonas' :
					$idL = $_POST ["cbLote"];
					$tipoDoc = $_POST["cbTipoDocB"];
					$nroDoc = $_POST["txtNroDocB"];
					$apellido = $_POST["txtApellidoB"];
					$nombre = $_POST["txtNombreB"];
					$idEstado = $_POST["cbResultado"];
					$soloAptos = "";
					
					if(isset($_POST["ckAptos"]))
					{
						$soloAptos = $_POST["ckAptos"];
					}
					
					$rta = busquedaXLote($idL,$tipoDoc,$nroDoc,$apellido,$nombre,$soloAptos,$idEstado);
					break;
				
		case "resultadoDDJJ":	
			$idLote = $_POST ["idLote"];
			$idPersona = $_POST ["idPersona"];
			$rta = resultadosXLote ($idLote,$idPersona);
			break;
				
		case "plantXLoteCompleto":	
			$idLote = $_POST ["idLote"];
			$idPersona = $_POST ["idPersona"];
			$rta = DDJJCompleta($idLote,$idPersona);
			break;
			
			
		case "listarXLoteYLoc":
			$idLote = $_POST ["idLote"];
			$idLocalidad = $_POST ["idLocalidad"];
			$rta = listarXLoteYLocalidad ($idLote,$idLocalidad);
			break;
			
		case "asociarCentro": 	
			$idCentro = $_POST ["cbCentro"];
			$personas = $_POST ["personas"];
			//print_r($personas);
			$rta = asociarCentroDist($idCentro,$personas);
			break;
			
		case "listarXCentro":
			$idLote = $_POST ["idLote"];
			$idCentro = $_POST ["idCentro"];
			$rta = listarXCentro ($idLote,$idCentro);
			break;

		case 'cargaNotificacion' :
				$idPL = $_POST ["hfIdLP"];
				$notificacion = $_POST ["txtNotificacion"];
				$observaciones = $_POST ["txtObservacionesEst"];
				$idPersona = $_POST ["hfIdPersona"];
							
				$rta = cargarNotificacion ($idPL,$notificacion,$observaciones,$idPersona);
				break;

		case 'verPersXIntimacion':
			$idL = $_POST ["cbLote"];
			$tipoDoc = $_POST["cbTipoDocB"];
			$nroDoc = $_POST["txtNroDocB"];
			$apellido = $_POST["txtApellidoB"];
			$nombre = $_POST["txtNombreB"];
						
			$rta = personasParaIntimacion($idL,$tipoDoc,$nroDoc,$apellido,$nombre);
			break;
			
		case "generarIntimacion":
				$idLote = $_POST["hfIdLote"];
				$personas = $_POST["personas"];
				$plantilla = $_POST["hfArchiCedula"];				
				//print_r($personas);
				$rta = generarIntimaciones($idLote,$personas,$plantilla);
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



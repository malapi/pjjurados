<?php 

class personaseleccion extends BaseDatos{ 

		private $nombreTabla='personaseleccion';

		private $prefijo= array("id","completar");

		private $textoCombo = "'completartexto'";

				
		public function  cadenaWhereSql($data,$prefijo){

		$where = parent::cadenaWhereSql($data,$prefijo);

		return  $where;

	}

	function insertar($data){

	  $id =  parent::insertar(parent::generaInsert($this->nombreTabla, $data));

		return $id;

	}

	
	/**
	 * funcion que edita un registro de la bd
	 * @param unknown $data
	 * @return la cantidad de filas actualizadas
	 */
	 

	function editar($data){
		if($data['psasiste'] != "null"){
			$data['psasiste']=$data['psasiste'] - 1;
		}
			 
		return parent::actualizar(parent::generaUpdate($this->nombreTabla, $data));

	}

	

	/**
	 * funcion que permite eliminar un elemento
	 * @param unknown $data
	 * @return la cantidad de filas eliminadas
	 */

	function eliminar($data){

		return   parent::eliminar(parent::generaDelete($this->nombreTabla, $data));

	}

	
	function seleccionarPaginado($sql=null,$data){

		$where =$this->cadenaWhereSql($data,$this->prefijo);

		$sql = "SELECT *,".$this->textoCombo." as textocombo FROM ".$this->nombreTabla." WHERE true ";

		if($where!="")

			$sql.=$where;

		$sql.="";
		return parent::seleccionarPaginado($sql, $data);

	}

	

	public function  seleccionar($data){

		$where =$this->cadenaWhereSql($data,$this->prefijo);

		$sql = "SELECT *,DATE_FORMAT(psfechaexcusacion,'%d/%m/%Y') as psfechaexcusaciondisplay,".$this->textoCombo." as textocombo 
				 FROM ".$this->nombreTabla."
				 natural join seleccion
				 natural join lotes
				 natural join juicio
				 join personas  USING(idPersona)
				 LEFT JOIN tiposeleccionrecusacion USING(idtiposeleccionrecusacion)
				 LEFT JOIN personaseleccionresultadotipos USING(idpersonaseleccionresultadotipos) 
				 WHERE true ".$where;
        // echo $sql;
		return parent::selecionar($sql) ;

	}

	public function sortear($data) {
		//echo "Lala";
		$sql = "SELECT *,lp.idLote as idLotePersona, TIMESTAMPDIFF(YEAR, FechaNacimiento, CURDATE()) as edad
			FROM personas as p
			NATURAL JOIN lotespersonas as lp
			LEFT JOIN personaseleccion as ps USING(idPersona)
			LEFT JOIN juicio as j on j.idjuicio = ".$data['idjuicio']."
			WHERE aptojurado
			AND TIMESTAMPDIFF(YEAR, FechaNacimiento, CURDATE()) < 75 ";
		$where = "	";
		
		if ($data ['seleccionprevia'] == 1) {
			//-- Si se quiere usar otra seleccion, hay que verificar que no haya sido jurado
			$where .= "	AND (ps.idseleccion is null OR ps.psnrojurado is null) 
			";
		} else {
			// -- Si no se quiere usar otra seleccion
			$where .= "	AND (ps.idseleccion is null)  ";
		}
		$sql .= $where;
		// echo "ff".$data['selmujeres'];
		$seleccionados = array ();
		if ($data ['selmujeres'] > 0) {
			$where = "	AND Sexo = 'F'";
			$sqlF = $sql.$where;
			 //echo $sqlF;
			$resultado = parent::selecionar ($sqlF);
			if (count ( $resultado ) > 0 && count ( $resultado ) >= $data ['selmujeres']) {
				for($i = 0; $i <= $data ['selmujeres'] - 1; $i ++) {
					
					$indSeleccionar = rand ( 0, count ( $resultado ) - 1 );
					//echo "<br> sel F " . $indSeleccionar ." <br>";
					$un = $resultado[$indSeleccionar];
					$un['psnrobolilla']=$indSeleccionar;
					$seleccionados[count($seleccionados )] = $un;
					array_splice ( $resultado, $indSeleccionar, 1 ); // Elimino el elemento del resultado
				}
			}
		}
		
		if ($data ['selhombres'] > 0) {
			$where = "	AND Sexo = 'M' ";
			$sqlM = $sql.$where;
			//echo $sqlM;
			$resultado = parent::selecionar ( $sqlM );
			// echo $sql;
			if (count ( $resultado ) > 0 && count ( $resultado ) >= $data ['selhombres']) {
				for($i = 0; $i <= $data ['selhombres'] - 1; $i ++) {
					$indSeleccionar = rand ( 0, count ( $resultado ) - 1 );
					//echo "<br> sel M " . $indSeleccionar ." <br> ";
					$un['psnrobolilla']=$indSeleccionar;
					$seleccionados[count($seleccionados )] = $un;
					array_splice ( $resultado, $indSeleccionar, 1 ); // Elimino el elemento del resultado
				}
			}
		}
		return $seleccionados;
	}
	
	
	public function guardarSorteo($data) {
		$sorteo = $data['seleccionados'];
		$i=0;
		if(count($sorteo)>0){
			$obj = new seleccion();
			foreach($sorteo as $un){
				if($i==0){
					$un['sefecha']='now()';
					$idseleccion = $obj->insertar($un);
				}
				$i++;
				$un['psnroordenseleccion']=$i;
				$un['idjuicio']=$un['idjuicio'];
				$un['idLote']=$un['idLotePersona'];
				$un['psfechaseleccion']='CURRENT_TIMESTAMP';
				$un['psfechafinseleccion']='DATE_ADD(CURDATE(),INTERVAL 3 YEAR)';
				$un['idseleccion'] = $idseleccion;
				$this->insertar($un);
				
			}	
		}
		
		
		return $seleccionados;
	}
	
	public function consultar($dato){
		//print_object($dato);
		$sql = "SELECT idPersona,Nombre,Apellido,DNI,
				GROUP_CONCAT(DISTINCT CASE WHEN psnroordenseleccion is null THEN '' ELSE psnroordenseleccion END ORDER BY psnroordenseleccion DESC SEPARATOR ' ') as psnroordenseleccion,
				GROUP_CONCAT(DISTINCT CASE WHEN psnrobolilla is null THEN '' ELSE psnrobolilla END ORDER BY psnrobolilla DESC SEPARATOR ' ') as psnrobolilla,
				GROUP_CONCAT(DISTINCT CASE WHEN psnrojurado is null THEN 0 ELSE psnrojurado END ORDER BY psnrojurado DESC SEPARATOR ' ') as psnrojurado,
				GROUP_CONCAT(DISTINCT CASE WHEN lp.idLote is null THEN '' ELSE lp.idLote END ORDER BY lp.idLote DESC SEPARATOR ' ') as idLote
			FROM personas as p
			NATURAL JOIN lotespersonas as lp
			LEFT JOIN personaseleccion as ps USING(idPersona)
			LEFT JOIN juicio as j using(idjuicio)
			WHERE ";
		$where = " true ";
		$sqlFinal =" GROUP BY idPersona,Nombre,Apellido,DNI"; 
		
		if(isset($dato['Nombre']) && $dato['Nombre'] != '' && $dato['Nombre'] != 'null'){
			$where .=" AND Nombre like '%".$dato['Nombre']."%'";
		}
		if(isset($dato['Apellido']) && $dato['Apellido'] != '' && $dato['Apellido'] != 'null'){
			$where .=" AND Apellido like '%".$dato['Apellido']."%'";
		}
		if(isset($dato['DNI']) && $dato['DNI'] != '' && $dato['DNI'] != 'null'){
			$where .=" AND DNI = ".$dato['Apellido']."";
		}
		
		if(isset($dato['fueseleccionada']) && $dato['fueseleccionada'] != '' && $dato['fueseleccionada'] != 'null'){
			if($dato['fueseleccionada'] == 'si') 
					$where .=" AND psnrobolilla is not null ";
			else 
				$where .=" AND psnrobolilla is null ";
		}
		if(isset($dato['psasiste']) && $dato['psasiste'] != '' && $dato['psasiste'] != 'null'){
			$where .=" AND psasiste = ".$dato['psasiste']."";
		}
		if(isset($dato['idtiposeleccionrecusacion']) && $dato['idtiposeleccionrecusacion'] != '' && $dato['idtiposeleccionrecusacion'] != 'null'){
			$where .=" AND idtiposeleccionrecusacion = ".$dato['idtiposeleccionrecusacion']."";
		}
		if(isset($dato['pscaracter']) && $dato['pscaracter'] != '' && $dato['pscaracter'] != 'null'){
			$where .=" AND pscaracter like '%".$dato['pscaracter']."%'";
		}
		if(isset($dato['fueJurado']) && $dato['fueJurado'] != '' && $dato['fueJurado'] != 'null'){
			if($dato['fueJurado'] == 'si')
				$where .=" AND psnrojurado is not null ";
			else
				$where .=" AND psnrojurado is null ";
		}
		if(isset($dato['sinnrojurado']) && $dato['sinnrojurado'] != '' && $dato['sinnrojurado'] != 'null'){//Fue desingado pero quedo sin nro de Jurado
			if($dato['sinnrojurado'] == 'si') //Fue desingado
				$where .=" AND pscaracter is not null AND psnrojurado is not null ";
			else
				$where .=" AND pscaracter is not null AND  psnrojurado is null ";
		}
		$sql = $sql.$where.$sqlFinal;
		//echo $sql;
		return parent::selecionar($sql) ;
		
	}
	
	public function mostrarInformacionPersona($dato){
		$html ="";
		$html = $this->mostrarInformacionPersonaLote($dato);
		
		$html .= $this->mostrarInformacionPersonaNotificaciones($dato);
		
		$html .=$this->mostrarInformacionPersonaSeleccion($dato);
		return $html;
	}
	public function mostrarInformacionPersonaLote($dato){
		//print_object($dato);
		$sql = "SELECT P.idPersona,P.Apellido,P.Nombre,P.idTipoDocumento,TD.Descripcion as TipoDoc,P.DNI,P.Sexo,P.CUIL,DATE_FORMAT(P.FechaNacimiento,'%d/%m/%Y') as FechaNacimiento
				,P.Nacionalidad,P.LugarNacimiento,
		P.Domicilio,P.idLocalidad,L.Descripcion as localidad,P.idCentroDistribucion,P.Circuito,P.CaracteristicaFijo,P.TelefonoFijo,
		P.CaracteristicaCelu,P.TelefonoCelular,P.CorreoElectronico,P.Profesion,P.Ocupacion,P.Observaciones,
		LP.idLP,LP.NroCedula,LP.idEstadoDDJJ,DATE_FORMAT(LP.FechaIntimacion,'%d/%m/%Y') as FechaIntimacion ,LP.AptoJurado,LP.idTipoResultado
		,LP.ObservacionesImpedimento, TI.Descripcion as Impedimiento
		,lo.Descripcion, lo.CantidadSorteados, lo.Observaciones
		FROM personas P
		INNER JOIN tipodocumentos TD ON P.idTipoDocumento = TD.idTipoDocumento
		INNER JOIN localidades L ON P.idLocalidad = L.idLocalidad
		INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona
		INNER JOIN lotes lo ON lo.idLote = LP.idLote
		LEFT JOIN tipoimpedimentos TI ON TI.idTipoImpedimento = LP.idTipoImpedimento
		WHERE P.idPersona = ".$dato['idPersona'] ;
		// echo $sql;
		$html = "<H1> Informacion Personal </H1>";
		$res = parent::selecionar($sql);
		//if($res) {
			$i=0;	
		
		foreach($res as $row){
			if($i==0){
				$html .= "<div class='row'>
  							<div class='col'><b>Nombre y Apellido :</b> ".$row ["Nombre"]." ".$row ["Apellido"]."</div>
							<div class='col'><b>Documento :</b> ".$row ["TipoDoc"]." ".$row ["DNI"]." </div>
							<div class='col'><b>Ciul :</b> ".$row ["CUIL"]." </div>
							<div class='col'><b>Nacionalidad :</b> ".$row ["Nacionalidad"]." </div>
						</div>";
				$html .= "<div class='row'>
  							<div class='col'><b>Lugar Nacimiento :</b> ".$row ["LugarNacimiento"]."</div>
							<div class='col'><b>Fecha de Nacimiento :</b> ".$row ["FechaNacimiento"]." </div>
							<div class='col'><b>Domicilio :</b> ".$row ["Domicilio"]." ". $row ["localidad"]." </div>
							<div class='col'><b>Telefonos :</b> ".$row ["CaracteristicaFijo"]."-".$row ["TelefonoFijo"]. " " .$row ["CaracteristicaCelu"]."-".$row ["TelefonoCelular"]. " </div>
						</div>";
				$html .= "<div class='row'>
  							<div class='col'><b>Correo Electronico :</b> ".$row ["CorreoElectronico"]."</div>
							<div class='col'><b>Profesion :</b> ".$row ["Profesion"]." </div>
							<div class='col'><b>Ocupacion :</b> ".$row ["Ocupacion"]." </div>
							<div class='col'><b>Nro.Cedula :</b> ".$row ["NroCedula"]. " </div>
						</div>";
				$html .= "<div class='row'>
  							<div class='col'><b>Es Apto? :</b> ".($row ["AptoJurado"] == "0" ? "No" : "Si")."</div>
							<div class='col'><b>Resultado :</b> ".($row ["idTipoResultado"] == null ? "Sin Calificar" : "")." </div>
							<div class='col'><b>Impedimiento :</b> ".$row ["Impedimiento"]." </div>
							<div class='col'><b>Obs. Impedimiento :</b> ".$row ["ObservacionesImpedimento"]. " </div>
						</div>";
				$html .= "<div class='row'>
  							<div class='col'><b>Fecha Intimacion :</b> ".$row ["FechaIntimacion"]."</div>
							<div class='col'> </div>
							<div class='col'> </div>
							<div class='col'> </div>
						</div>";
			} $i++;
			
			$html .= "<div class='row'>
  							<div class='col'><b>Lote :</b> ".$row ["Descripcion"]."</div>
							<div class='col'><b>Cant.Sorteados :</b> ".$row ["CantidadSorteados"]." </div>
							<div class='col'><b>Lote Observacion:</b> ".$row ["Observaciones"]." </div>
							<div class='col'> </div>
						</div>";
				
				
		//}
		}
		return $html;
		}
		
		public function mostrarInformacionPersonaNotificaciones($dato){
			
		
				$sql = "SELECT P.idPersona,P.Apellido,P.Nombre,P.idTipoDocumento,P.DNI, TD.Descripcion AS tipoDoc,P.Sexo,
				LP.idLP,LP.NroCedula,LP.idEstadoDDJJ,DATE_FORMAT(LPN.lpnfecha,'%d/%m/%Y') as FechaNotificacion,LPN.lpnobservacion as ObservacionesEstado, LOC.Descripcion AS Localidad,C.Nombre AS centro
				FROM personas P
				INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona
				INNER JOIN lotespersonanotificacion LPN ON LPN.idLP = LP.idLP
				INNER JOIN tipodocumentos TD ON P.idTipoDocumento = TD.idTipoDocumento
				INNER JOIN localidades LOC ON P.idLocalidad = LOC.idLocalidad
				LEFT JOIN centrodistribucion C ON P.idCentroDistribucion = C.idCentroDistribucion
				WHERE LP.idPersona = ".$dato['idPersona']."
				ORDER BY P.Apellido,P.Nombre,LPN.idlotespersonanotificacion ";
				//echo $sql;
				$res = parent::selecionar($sql);
				
				$html="";
				//print_object($res);
				if($res){
					$html = "<h1>Notificaciones</h1>";
					
				foreach($res as $row){
					$html .= "<div class='row'>
			  							<div class='col'><b>Fecha :</b> ".$row ["FechaNotificacion"]."</div>
					  									<div class='col'><b>Localidad :</b> ".$row ["Localidad"]." </div>
					  											<div class='col'><b>Centro :</b> ".$row ["centro"]." </div>
										<div class='col'><b>Observación :</b> ".$row ["ObservacionesEstado"]."</div>
							 </div>";
								
					
				}
				}
			return $html;
		
	}
	
	
	public function mostrarInformacionPersonaSeleccion($dato){
			
	
		$sql = "SELECT idjuicio, DATE_FORMAT(jufecha,'%d/%m/%Y') as jufecha, jujueces, judescripcion, juobservacion
				,idseleccion
				,psnroordenseleccion
				,psexcusacion,psrecusacioncausa,pscaracter,CASE WHEN psasiste is null THEN 'No' ELSE 'SI' END as psasiste
				,CASE WHEN psasisteobservacion is Null THEN '' ELSE psasisteobservacion END as psasisteobservacion
				,CASE WHEN psobservacion is Null THEN '' ELSE psobservacion END as psobservacion
				,idtiposeleccionrecusacion,CASE WHEN trsdescripcion is null THEN '' ELSE trsdescripcion END as trsdescripcion
				,idpersonaseleccionresultadotipos, CASE WHEN psrtdescripcion is null THEN '' ELSE psrtdescripcion END as psrtdescripcion
				,psnrojurado,DATE_FORMAT(psfechaexcusacion,'%d/%m/%Y') as psfechaexcusacion,DATE_FORMAT(psfechaseleccion,'%d/%m/%Y') as psfechaseleccion,psfechafinseleccion
				,psnrobolilla
				FROM personas P
				NATURAL JOIN lotespersonas as lp
				NATURAL JOIN personaseleccion as ps
				NATURAL JOIN seleccion as s
				NATURAL JOIN juicio as j 
				LEFT JOIN  personaseleccionresultadotipos psrt USING(idpersonaseleccionresultadotipos)
				LEFT JOIN  tiposeleccionrecusacion tsr USING(idtiposeleccionrecusacion)
				WHERE LP.idPersona = ".$dato['idPersona']."
				ORDER BY ps.idseleccion";
		//echo $sql;
		//echo $sql;
		$res = parent::selecionar($sql);
	
		$html="";
		if($res){
			$html = "<h1>Selecciones para Juicios</h1>";
			foreach($res as $row){
				$html .= "<div class='row'>
			  							<div class='col'><b>Juicio :</b> ".$row ["judescripcion"]."</div>
					  					<div class='col'><b>Fecha del Juicio :</b> ".$row ["jufecha"]." </div>
					  					<div class='col'><b>Jueces :</b> ".$row ["jujueces"]." </div>
										<div class='col'><b>Observaciones :</b> ".$row ["juobservacion"]."</div>
							</div>";
				$html .= "<h4>Audiencia</h4>";
				$html .= "<div class='row'>
			  							<div class='col'><b>Nro.Seleccion :</b> ".$row ["psnroordenseleccion"]."</div>
					  					<div class='col'><b>Nro.Bolilla :</b> ".$row ["psnrobolilla"]." </div>
					  					<div class='col'><b>Asistio? :</b> ".$row ["psasiste"]." </div>
					  					<div class='col'><b>Obs.Asistencia :</b> ".$row ["psasisteobservacion"]." </div>
					  					<div class='col'><b>Resultado :</b> ".$row ["psrtdescripcion"]." </div>
					  	</div>";
				$html .= "<h4>Excusacion y Recusacion</h4>";
				$html .= "<div class='row'>
			  							<div class='col'><b>Excusacion :</b> ".$row ["psexcusacion"]."</div>
					  					<div class='col'><b>Fecha Vto. Excusacion :</b> ".$row ["psfechaexcusacion"]." </div>
			  							<div class='col'><bRecusacion :</b> ".$row ["trsdescripcion"]." </div>
					  					<div class='col'><b>Causa Recusacion :</b> ".$row ["psrecusacioncausa"]." </div>
					  					
					  	</div>";
				$html .= "<div class='row'>	  							
					  					<div class='col'><b>Nro. Jurado :</b> ".$row ["psnrojurado"]." </div>
										<div class='col'><b>Caracter :</b> ".$row ["pscaracter"]."</div>
							</div>";
				
				$sql = "SELECT psdtdescripcion,idpersonaselecciondocumento,psddescripcion, CASE WHEN psdfechafin is null THEN '' ELSE DATE_FORMAT(psdfechafin,'%d/%m/%Y') END as psdfechafin, psdarchivo, idpersonaselecciondocumentotipos
				FROM personas P
				NATURAL JOIN personaseleccion as ps
				NATURAL JOIN personaselecciondocumento as psd 
				LEFT JOIN personaselecciondocumentotipos as psdt USING(idpersonaselecciondocumentotipos)
				WHERE idPersona = ".$dato['idPersona']." AND idseleccion = ".$row['idseleccion']."
				ORDER BY ps.idseleccion";
				//echo $sql;
				$resD = parent::selecionar($sql);
				if($resD){
					$html .= "<h1>Documentos Presentados durante la Seleccion</h1>";
					foreach($resD as $rowD){
						$html .= "<div class='row'>
			  							<div class='col'><b>Descripcion :</b> ".$rowD ["psddescripcion"]."</div>
					  					<div class='col'><b>Fecha Vto. :</b> ".$rowD ["psdfechafin"]." </div>
					  					<div class='col'><b>Tipo documento :</b> ".$rowD ["psdtdescripcion"]." </div>
										<div class='col'><b>Descarga :</b> <a href='#' >".$rowD ["psdarchivo"]."</a></div>
												</div>";
					}
				}
					
			}
		}
		return $html;
	
	}
	

	}

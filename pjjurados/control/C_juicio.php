<?php include_once ('../libs/GeneraExcel.php');

class C_juicio extends Session{

	

	public function abm($data){

		$resp =false;

		$obj= new juicio();

		if ($data['accion']=='nuevo')
			$resp = $obj->insertar($data);

		if ($data['accion']=='editar')
			$resp = $obj->editar($data);

		if ($data['accion']=='eliminar')
			$resp = $obj->eliminar($data);
		
		if ($data['accion']=='sortear')
			$resp = $this->sortear($data);
		if ($data['accion']=='listados')
			$resp = $this->generarListados($data);
		if ($data['accion']=='juradoDefinitivo')
			$resp = $this->generarListadoNotificacionAudienciaSeleccion($data);
		if ($data['accion']=='listadosPersona')
				$resp = $this->generarListadosPersona($data);

   

		return $resp ;

	}

	public function generarListadosCedulas($data){
		//print_object($data);
		$objSel = new personaseleccion();
		$resultado = $objSel->seleccionar($data);
	
		$unmapeo['tagplantilla']="#NOMBRE";
		$unmapeo['tagvalor']="Nombre";
		$mapeo[0] = $unmapeo;
		$unmapeo['tagplantilla']="#APELLIDO";
		$unmapeo['tagvalor']="Apellido";
		$mapeo[1] = $unmapeo;
		$unmapeo['tagplantilla']="#DNI";
		$unmapeo['tagvalor']="DNI";
		$mapeo[2] = $unmapeo;
	
		$nombrePlantilla = "plantilla_cedulas.rtf";
		$nombreArchivo = $data['idPersona']."_".$data['idjuicio']."_".$nombrePlantilla;
		$archivo = generarArchivoRTF($resultado,$mapeo,$nombrePlantilla,$nombreArchivo);
		// 		//echo "<a href='".$archivo."' > Descargar </a>";
	
			
		$un['idjuicio'] = $data['idjuicio'];
		$un['idPersona'] = $data['idPersona'];
		$un['jnfechageneracion'] = "now()";
		$un['jndescripcion'] = "cedulas de citacion";
		$un['jnnombrearchivo'] = "<a href=\"".$archivo."\" > ".$nombreArchivo.".zip </a>";
		$un['jnnombreplantilla'] = "<a href=\"uploads/plantillas/".$nombrePlantilla."\" >".$nombrePlantilla." </a>";
		$un['jncamino']=$archivo;
		$obj= new juicionotificaciones();
		$respuesta = $obj->insertar($un);
	
		$respuesta = true;
		return $respuesta;
	
	}
	
	public function generarListadoNotificacionAudienciaSeleccion($data){
		//print_object($data);
 		$objSel = new personaseleccion();
		$resultado = $objSel->seleccionar($data);
		$i=0;
		
		$unmapeo['tagplantilla']="#NROCEDULA";
		$unmapeo['tagvalor']="NroCedula";
		$mapeo[$i] = $unmapeo;$i++;
		$unmapeo['tagplantilla']="#ANIO";
		$unmapeo['tagvalor']="aniocedula";
		$mapeo[$i] = $unmapeo;$i++;
		$unmapeo['tagplantilla']="#CEDULAGRANDE";
		$unmapeo['tagvalor']="NroCedula";
		$mapeo[$i] = $unmapeo;$i++;
		
		$unmapeo['tagplantilla']="#NROCONVOCATORIA";
		$unmapeo['tagvalor']="junroconvocatoria";
		$mapeo[$i] = $unmapeo;$i++;
		$unmapeo['tagplantilla']="#LOCALIDAD";
		$unmapeo['tagvalor']="Localidad";
		$mapeo[$i] = $unmapeo;$i++;
		
		$unmapeo['tagplantilla']="#NOMBRE";
		$unmapeo['tagvalor']="Nombre";
		$mapeo[$i] = $unmapeo;$i++;
		$unmapeo['tagplantilla']="#APELLIDO";
		$unmapeo['tagvalor']="Apellido";
		$mapeo[$i] = $unmapeo;$i++;
		$unmapeo['tagplantilla']="#DNI";
		$unmapeo['tagvalor']="DNI";
		$mapeo[$i] = $unmapeo;$i++;
		
		$unmapeo['tagplantilla']="#FECHAAUDIENCIA";
		$unmapeo['tagvalor']="jufechaaudiencia";
		$mapeo[$i] = $unmapeo;$i++;
		
		$unmapeo['tagplantilla']="#DIRECCIONAUDIENCIA";
		$unmapeo['tagvalor']="judireccionaudiencia";
		$mapeo[$i] = $unmapeo;$i++;
		$unmapeo['tagplantilla']="#FECHAINICIOJUICIO";
		$unmapeo['tagvalor']="jufechainicio";
		$mapeo[$i] = $unmapeo;$i++;
		$unmapeo['tagplantilla']="#FECHAFINJUICIO";
		$unmapeo['tagvalor']="jufechafin";
		$mapeo[$i] = $unmapeo;$i++;
		$nombrePlantilla = "30032017NotificacionAudienciaSeleccion.rtf";
		
		$obj= new juicionotificaciones();
		//Primero elimino los archivos para el juicio
		
		
		foreach ($resultado as $uno){
			$lista[0] = $uno;
			$nombreArchivo = $uno['idPersona']."_".$uno['idjuicio']."_".$nombrePlantilla;
			$archivo = generarArchivoRTF($lista,$mapeo,$nombrePlantilla,$nombreArchivo);
			// 		//echo "<a href='".$archivo."' > Descargar </a>";
				
			$un = array();
			$un['idjuicio'] = $uno['idjuicio'];
			$un['idPersona'] = $uno['idPersona'];
			$obj->eliminar($un);
			$un['jnfechageneracion'] = "now()";
			$un['jndescripcion'] = "cedulas de notificacion audiencia";
			$un['jnnombrearchivo'] = "<a href=\"".$archivo."\" > ".$nombreArchivo.".zip </a>";
			$un['jnnombreplantilla'] = "<a href=\"uploads/plantillas/".$nombrePlantilla."\" >".$nombrePlantilla." </a>";
			$un['jncamino']=$archivo;
			
			$respuesta = $obj->insertar($un);
		}
		
		
		
		
		
 		
 		
		
		$respuesta = true;
		return $respuesta;
	
	}

	public function generarListados($data){
		$obj= new juicionotificaciones();
 		//Primero elimino los archivos para el juicio
 		$obj->eliminar($data);
		$respuesta = $this->generarListadosCedulas($data);
		$respuesta = $this->generarListadoPartes($data);
		$respuesta = true;
		return $respuesta;
	
	}
	
	
	public function generarListadosPersona($data){
		$obj= new juicionotificaciones();
		//Primero elimino los archivos para el juicio
		$obj->eliminar($data);
		$respuesta = $this->generarListadosCedulas($data);
		//$respuesta = $this->generarListadoPartes($data);
		$respuesta = true;
		return $respuesta;
	
	}
	public function generarListadoPartes($data){
		
		$objSel = new personaseleccion();
		$resultado = $objSel->seleccionarListadoPartes($data);
 		$objExcel = new GeneraExcel();
 		//print_object($resultado);
 		$datos['nombreArchivo']= $data['idjuicio']."_partes";
 		$datos['datos']= $resultado;
 		$objExcel->generar($datos);
 		$archivo = "uploads/archivosrtf/".$datos['nombreArchivo'].".xlsx";
 		$un['idjuicio'] = $data['idjuicio'];
 		$un['jnfechageneracion'] = "now()";
 		$un['jndescripcion'] = "Listado de Partes";
 		$un['jnnombrearchivo'] = "<a href=\"$archivo\" > ".$datos['nombreArchivo'].".xlsx </a>";
 		$un['jnnombreplantilla'] = "Sin Plantilla";
 		$un['jncamino']=$archivo;
 		$obj= new juicionotificaciones();
 		$obj->insertar($un);
 		$respuesta = true;
                return $respuesta;
		
	}
	
	
	public function sortear($data){
		$resp = false;
		//print_object($data);
		$obj= new personaseleccion();
		//$obj= new juicio();
		//print_object($data);
		$respuesta = $obj->sortear($data);
		if(count($respuesta)>0){
			$data['seleccionados']=$respuesta;
			$resp = $obj->guardarSorteo($data);
			//print_object($respuesta);
		}
		return $resp;
		
	}

	

	public function buscar($data){

		$obj= new juicio();
		if (isset($data['page'])){
			return $obj->seleccionarPaginado(null,$data);
		} else {
			$resultado = array();
			if(isset($data['operacion']) && $data['operacion'] =='listados'){
				$resultado = $obj->seleccionar($data);
			} else {
				$resultado =$obj->seleccionar($data); 
			}
			return $resultado;
		}

	
	
	}

	
	
	}

?>

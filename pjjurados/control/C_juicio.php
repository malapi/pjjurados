<?php

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

		return $resp ;

	}

	public function generarListados($data){
		//print_object($data);
 		$obj= new juicionotificaciones();
 		//Primero elimino los archivos para el juicio
 		$obj->eliminar($data);
		
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
		$nombreArchivo = $data['idjuicio']."_".$nombrePlantilla;
		$archivo = generarArchivoRTF($resultado,$mapeo,$nombrePlantilla,$nombreArchivo);
		//echo "<a href='".$archivo."' > Descargar </a>";
		
 		
 		$un['idjuicio'] = $data['idjuicio'];
 		$un['jnfechageneracion'] = "now()";
 		$un['jndescripcion'] = "cedulas de citacion";
 		$un['jnnombrearchivo'] = "<a href=\"".$archivo."\" > ".$nombreArchivo.".zip </a>";
 		$un['jnnombreplantilla'] = "<a href=\"uploads/plantillas/".$nombrePlantilla."\" >".$nombrePlantilla." </a>";
 		$un['jncamino']=$archivo;
 		$respuesta = $obj->insertar($un);
		
//  		$un['jndescripcion'] = "Listado de Partes";
//  		$un['jnnombrearchivo'] = "10_partes.xls.zip";
//  		//$un['jnnombreplantilla'] = "plantilla_cedulas.rtf";
 		//$obj->insertar($un);
		
		
		
		
		return $respuesta;
	
	}
	
	
	public function sortear($data){
		//print_object($data);
		$obj= new personaseleccion();
		//$obj= new juicio();
		//print_object($data);
		$respuesta = $obj->sortear($data);
		if(count($respuesta)>0){
			$data['seleccionados']=$respuesta;
			$obj->guardarSorteo($data);
			//print_object($respuesta);
		}
		
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

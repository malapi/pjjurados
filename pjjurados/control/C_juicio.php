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
		
		
		$un['idjuicio'] = $data['idjuicio'];
		
		
		$un['jnfechageneracion'] = "now()";
		$un['jndescripcion'] = "cédulas de citación";
		$un['jnnombrearchivo'] = "10_cedula.rtf.zip";
		$un['jnnombreplantilla'] = "plantilla_cedulas.rtf";
		$obj->insertar($un);
		
		$un['jndescripcion'] = "Listado de Partes";
		$un['jnnombrearchivo'] = "10_partes.xls.zip";
		//$un['jnnombreplantilla'] = "plantilla_cedulas.rtf";
		$obj->insertar($un);
		return true;
	
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

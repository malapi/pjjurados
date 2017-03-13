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

		return $resp ;

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

			return $obj->seleccionar($data);

		}

	
	
	}

	
	
	}

?>

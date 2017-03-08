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
		print_object($data);
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

<?php

class C_personaselecciondocumentotipos extends Session{

	

	public function abm($data){

		$resp =false;

		$obj= new personaselecciondocumentotipos();

		if ($data['accion']=='nuevo')

			$resp = $obj->insertar($data);

		if ($data['accion']=='editar')

			$resp = $obj->editar($data);

		if ($data['accion']=='eliminar')

			$resp = $obj->eliminar($data);

		return $resp ;

	}

	

	

	public function buscar($data){

		$obj= new personaselecciondocumentotipos();

		if (isset($data['page'])){

			return $obj->seleccionarPaginado(null,$data);

		} else {

			return $obj->seleccionar($data);

		}

	
	
	}

	
	
	}

?>

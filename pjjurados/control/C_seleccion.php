<?php

class C_seleccion extends Session{

	

	public function abm($data){

		$resp =false;

		$obj= new seleccion();

		if ($data['accion']=='nuevo')

			$resp = $obj->insertar($data);

		if ($data['accion']=='editar')

			$resp = $obj->editar($data);

		if ($data['accion']=='eliminar')

			$resp = $obj->eliminar($data);
		
		if ($data['accion']=='guardarDocumento')
			
			$resp = $this->guardarDocumento($data);

		return $resp ;

	}

	
	public function guardarDocumento($data){
		$obj = new personaselecciondocumento();
		$resp = $obj->insertar($data);
		return $resp;
	}
	

	public function buscar($data){

		$obj= new seleccion();

		if (isset($data['page'])){

			return $obj->seleccionarPaginado(null,$data);

		} else {

			return $obj->seleccionar($data);

		}

	
	
	}

	
	
	}

?>

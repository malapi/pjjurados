<?php

class C_tiposeleccionrecusacion extends Session{

	

	public function abm($data){

		$resp =false;

		$obj= new tiposeleccionrecusacion();

		if ($data['accion']=='nuevo')

			$resp = $obj->insertar($data);

		if ($data['accion']=='editar')

			$resp = $obj->editar($data);

		if ($data['accion']=='eliminar')

			$resp = $obj->eliminar($data);

		return $resp ;

	}

	

	

	public function buscar($data){

		$obj= new tiposeleccionrecusacion();

		if (isset($data['page'])){

			return $obj->seleccionarPaginado(null,$data);

		} else {

			return $obj->seleccionar($data);

		}

	
	
	}

	
	
	}

?>

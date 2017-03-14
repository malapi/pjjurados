<?php

class C_juicionotificaciones extends Session{

	

	public function abm($data){

		$resp =false;

		$obj= new juicionotificaciones();

		if ($data['accion']=='nuevo')
			$resp = $obj->insertar($data);

		if ($data['accion']=='editar')
			$resp = $obj->editar($data);

		if ($data['accion']=='eliminar')
			$resp = $obj->eliminar($data);
		
		

		return $resp ;

	}

		public function buscar($data){

		$obj= new juicionotificaciones();
		if (isset($data['page'])){
			return $obj->seleccionarPaginado(null,$data);
		} else {
			$resultado = array();
			if(isset($data['operacion']) && $data['operacion'] =='listados'){
				//$resultado = $obj->seleccionar($data);
			} else {
				$resultado =$obj->seleccionar($data); 
			}
			return $resultado;
		}

	
	
	}

	
	
	}

?>

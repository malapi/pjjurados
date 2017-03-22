<?php 

class C_lotes extends Session{

	

	public function abm($data){

		$resp =false;

		$obj= new lotes();

		if ($data['accion']=='nuevo')
			$resp = $obj->insertar($data);

		if ($data['accion']=='editar')
			$resp = $obj->editar($data);

		if ($data['accion']=='eliminar')
			$resp = $obj->eliminar($data);
		
		return $resp ;

	}

		public function buscar($data){

		$obj= new lotes();
		if (isset($data['page'])){
			return $obj->seleccionarPaginado(null,$data);
		} else {
			$resultado =$obj->seleccionar($data); 
		}
			return $resultado;
		}

	
	
	

	
	
	}

?>

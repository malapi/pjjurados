<?php

class C_fichapersona extends Session{

	

	public function abm($data){

		$resp =false;

		$obj= new personaseleccion();

	/*	if ($data['accion']=='nuevo')
			$resp = $obj->insertar($data);

		if ($data['accion']=='editar')
			$resp = $obj->editar($data);

		if ($data['accion']=='eliminar')
			$resp = $obj->eliminar($data);
		
		if ($data['accion']=='sortear')
			$resp = $this->sortear($data);*/
		if ($data['accion']=='ver')
			$resp = $obj->mostrarInformacionPersona($data);

		return $resp ;

	}
    
	
	public function buscar($data){
		//print_object($data);
		$obj = new personaseleccion();
		
		$resultado = array();
		/*$obj= new juicio();
		if (isset($data['page'])){
			return $obj->seleccionarPaginado(null,$data);
		} else {
			$resultado = array();
			if(isset($data['operacion']) && $data['operacion'] =='listados'){
				$resultado = $obj->seleccionar($data);
			} else {
				$resultado =$obj->seleccionar($data); 
			}*/
			$resultado = $obj->consultar($data);
		
			return $resultado;
		}

	
	
	

	
	
	}

?>

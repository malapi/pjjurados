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
		if ($data['accion']=='desvincular')
				$resp = $this->desvincularjurado($data);
		if ($data['accion']=='consultar') {
			$obj = new personaseleccion();
			$resp = $obj->mostrarInformacionPersona($data);
		}
		
			

		return $resp ;

	}

	
	public function guardarDocumento($data){
		$obj = new personaselecciondocumento();
		$resp = $obj->insertar($data);
		return $resp;
	}
	
	public function desvincularjurado($data){
		//Blanquelo el Nro de Jurado y lo pongo con Resultado Desvinculado
		$obj = new personaseleccion();
		$data['idpersonaseleccionresultadotipos']="6";
		$data['psnrojurado']="null";
		$resp = $obj->editar($data);
		//guardo el Documento
		$obj = new personaselecciondocumento();
		$resp = $obj->insertar($data);
		return $resp;
	}
	public function buscarInformacionCompleta($data){
	
		$html ="";
		if ($data['accion']=='consultar') {
			$obj = new personaseleccion();
			$html = $obj->mostrarInformacionPersona($data);
		}
	
			
	
		return $html ;
	
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

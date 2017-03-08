<?php 

class juicio extends BaseDatos{ 

		private $nombreTabla='juicio';

		private $prefijo= array("id","completar");

		private $textoCombo = "'completartexto'";

				
		public function  cadenaWhereSql($data,$prefijo){

		$where = parent::cadenaWhereSql($data,$prefijo);

		return  $where;

	}

	function insertar($data){

	  $id =  parent::insertar(parent::generaInsert($this->nombreTabla, $data));

		return $id;

	}

	
	/**
	 * funcion que edita un registro de la bd
	 * @param unknown $data
	 * @return la cantidad de filas actualizadas
	 */
	 

	function editar($data){

		return parent::actualizar(parent::generaUpdate($this->nombreTabla, $data));

	}

	

	/**
	 * funcion que permite eliminar un elemento
	 * @param unknown $data
	 * @return la cantidad de filas eliminadas
	 */

	function eliminar($data){

		return   parent::eliminar(parent::generaDelete($this->nombreTabla, $data));

	}

	
	function seleccionarPaginado($sql=null,$data){

		$where =$this->cadenaWhereSql($data,$this->prefijo);

		$sql = "SELECT *,".$this->textoCombo." as textocombo FROM ".$this->nombreTabla." WHERE true ";

		if($where!="")

			$sql.=$where;

		$sql.="";
		return parent::seleccionarPaginado($sql, $data);

	}

	

	public function  seleccionar($data){
		$where =$this->cadenaWhereSql($data,$this->prefijo);
		$sql = "SELECT *,".$this->textoCombo." as textocombo FROM ".$this->nombreTabla." WHERE true ".$where;
		return parent::selecionar($sql) ;

	}
	
	public function  verTabla($data){
		$where =$this->cadenaWhereSql($data,$this->prefijo);
		$sql = "SELECT *,".$this->textoCombo." as textocombo FROM ".$this->nombreTabla." WHERE true ".$where;
		$resultado =parent::selecionar($sql);
		$tabla = ""; 
		$tabla = "  <div class='table-overflow'>
                        <table class='table table-striped table-bordered' id='data-table'>
					    <thead>
					    <tr>
					        <th>Localidad</th>
							<th>Acciones</th>
					    </tr>
					    </thead>
					    <tbody>";
		//foreach ( $res as $row ) {
			$tabla .= "<tr>
							<td>" . "Lala" . "</td>
							<td class='tac'>
								<ul class='table-controls'>
								<li><a class='btn tip' title='Modificar' href='#' data-original-title='Edit entry' onclick=\"editar('". "Lala" ."','"."Lala2"."')\">
										<i class='icon-edit'></i></a></li>
								<ul>
							</td>
							</tr>";
		//}
		$tabla .= "</tbody</table></div>";
		return  $tabla;
	
	}

	}

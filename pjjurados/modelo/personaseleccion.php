<?php 

class personaseleccion extends BaseDatos{ 

		private $nombreTabla='personaseleccion';

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

		$sql = "SELECT *,".$this->textoCombo." as textocombo 
				 FROM ".$this->nombreTabla."
				 natural join seleccion
				 natural join lotes
				 natural join juicio
				 join personas  USING(idPersona)
				 WHERE true ".$where;
         //echo $sql;
		return parent::selecionar($sql) ;

	}

	public function sortear($data) {
		//echo "Lala";
		$sql = "SELECT *,lp.idLote as idLotePersona, TIMESTAMPDIFF(YEAR, FechaNacimiento, CURDATE()) as edad
			FROM personas as p
			NATURAL JOIN lotespersonas as lp
			LEFT JOIN personaseleccion as ps USING(idPersona)
			LEFT JOIN juicio as j on j.idjuicio = ".$data['idjuicio']."
			WHERE aptojurado
			AND TIMESTAMPDIFF(YEAR, FechaNacimiento, CURDATE()) < 75 ";
		$where = "	";
		
		if ($data ['seleccionprevia'] == 1) {
			//-- Si se quiere usar otra seleccion, hay que verificar que no haya sido jurado
			$where .= "	AND (ps.idseleccion is null OR ps.psnrojurado is null) 
			";
		} else {
			// -- Si no se quiere usar otra seleccion
			$where .= "	AND (ps.idseleccion is null)  ";
		}
		$sql .= $where;
		// echo "ff".$data['selmujeres'];
		$seleccionados = array ();
		if ($data ['selmujeres'] > 0) {
			$where = "	AND Sexo = 'F'";
			$sqlF = $sql.$where;
			 //echo $sqlF;
			$resultado = parent::selecionar ($sqlF);
			if (count ( $resultado ) > 0 && count ( $resultado ) >= $data ['selmujeres']) {
				for($i = 0; $i <= $data ['selmujeres'] - 1; $i ++) {
					
					$indSeleccionar = rand ( 0, count ( $resultado ) - 1 );
					//echo "<br> sel F " . $indSeleccionar ." <br>";
					$un = $resultado[$indSeleccionar];
					$un['psnrobolilla']=$indSeleccionar;
					$seleccionados[count($seleccionados )] = $un;
					array_splice ( $resultado, $indSeleccionar, 1 ); // Elimino el elemento del resultado
				}
			}
		}
		
		if ($data ['selhombres'] > 0) {
			$where = "	AND Sexo = 'M' ";
			$sqlM = $sql.$where;
			//echo $sqlM;
			$resultado = parent::selecionar ( $sqlM );
			// echo $sql;
			if (count ( $resultado ) > 0 && count ( $resultado ) >= $data ['selhombres']) {
				for($i = 0; $i <= $data ['selhombres'] - 1; $i ++) {
					$indSeleccionar = rand ( 0, count ( $resultado ) - 1 );
					//echo "<br> sel M " . $indSeleccionar ." <br> ";
					$un['psnrobolilla']=$indSeleccionar;
					$seleccionados[count($seleccionados )] = $un;
					array_splice ( $resultado, $indSeleccionar, 1 ); // Elimino el elemento del resultado
				}
			}
		}
		return $seleccionados;
	}
	
	
	public function guardarSorteo($data) {
		$sorteo = $data['seleccionados'];
		$i=0;
		if(count($sorteo)>0){
			$obj = new seleccion();
			foreach($sorteo as $un){
				if($i==0){
					$un['sefecha']='now()';
					$idseleccion = $obj->insertar($un);
				}
				$i++;
				$un['psnroordenseleccion']=$i;
				$un['idjuicio']=$un['idjuicio'];
				$un['idLote']=$un['idLotePersona'];
				$un['psfechaseleccion']='CURRENT_TIMESTAMP';
				$un['psfechafinseleccion']='DATE_ADD(CURDATE(),INTERVAL 3 YEAR)';
				$un['idseleccion'] = $idseleccion;
				$this->insertar($un);
				
			}	
		}
		
		
		return $seleccionados;
	}
	

	}

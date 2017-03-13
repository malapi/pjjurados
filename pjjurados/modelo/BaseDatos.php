<?php 
///http://php.net/manual/es/ref.pdo-pgsql.php


class BaseDatos extends PDO { 
	 private $dbname = "pruebajur";
	 private $host = "localhost";
	 //private $host = "192.9.200.230";
	 private $dbuser = "root";
	 //private $dbpass = "";
	 private $dbpass = "eelcdr";
	 private $tipo_de_base = "mysql";

	
	

	 
	 public function __construct() {
	 	//Sobreescribo el método constructor de la clase PDO.
	 	try{
	 		parent::__construct($this->tipo_de_base.':host='.$this->host.';dbname='.$this->dbname, $this->dbuser, 
	 				$this->dbpass);
	 		 
	 		
	 	}catch(PDOException $e){	 		 
	 		echo " Ha surgido un error y no se puede conectar a la base de datos. Detalle: " . $e->getMessage();
	 		
	 	}
	 }
	 
	 public function darBaseDatos(){
	 	return $this->dbname;
	 }
  
  
/**  public function iniciar(){
  	try {
  		$salida = false;
  		$this = new PDO("pgsql:dbname=$this->dbname;host=$this->host", $this->dbuser, $this->dbpass);
		if ($this)
			$salida = true;
        return $salida;
  	}catch(PDOException $e) {
		echo " Ha surgido un error. Detalle: " .$e->getMessage();
	}
  }
*/
    
   
  function cerrar(){
    //$this = null;
  }
   
  /**
   * Esta funcion ejecuta una consulta SELECT sobre la base de datos. El resultado es un arreglo donde
    cada elemento $arreglo_datos[$i] contiene una tupla del resultado (que tambien se guarda como
    un arreglo). */

  function selecionar($consulta){
  	try {
  		$resultado = array();
		$sentencia = $this->prepare($consulta);
		
		if ($sentencia->execute()) {
  			$resultado = $sentencia->fetchAll();
		}
		$this->cerrar();
		return $resultado;

  	}catch(PDOException $e) {
		echo " Ha surgido un error. Detalle: " .$e->getMessage();
		}
    }

    function seleccionarPaginado($sql,$data){
    	$resultado = $this->selecionar($sql);
    	$total = count($resultado);
    	if (isset($data['page'])){
    		$sql.=" LIMIT ".$data['rows']*($data['page']-1)." , ".$data['rows']." ";
    		//echo $sql;
    		$resultado = $this->selecionar($sql);
    	}
    	$data_grid["total"]=$total;
    	$data_grid["rows"]=$resultado;
    	return $data_grid;
    }
 /* Actualizar */

 public function actualizar($consulta){
 	try {
		$sentencia = $this->prepare($consulta);
		$cant = $sentencia->execute();
		$this->cerrar();
		return $cant;
	}catch(PDOException $e) {
		echo " Ha surgido un error. Detalle: " .$e->getMessage();
	}
   }
/* Eliminar */

public function eliminar($consulta){
	try {
		$sentencia = $this->prepare($consulta);
		$cant = $sentencia->execute();
		$this->cerrar();
		return $cant;
	}catch(PDOException $e) {
		echo " Ha surgido un error. Detalle: " .$e->getMessage();
	}
   }

 
  

  private function tieneSequencia($consulta){ 
  	/*try {
		$nombre_seq = "";
		$aux = str_replace('"','',str_replace('\'','',$consulta));
		$consultaSeq = "SELECT  table_schema, table_name, substring(column_default FROM E'\\\(\'([a-z_.]+)') AS secuencia
FROM information_schema.columns
WHERE column_default ~ '_seq' and table_name  = trim ( split_part( replace( replace('$aux','INTO','') , 'INSERT',''),'(',1) )";
		echo $consultaSeq;
		$result = $this->selecionar($consultaSeq);
        if (count($result)>0 ) //	Es una tabla que tiene vinculada una secuencia	
			$nombre_seq =  $result[0][2];
        $this->cerrar();
		return $nombre_seq;
	}catch(PDOException $e) {
		echo " Ha surgido un error. Detalle: " .$e->getMessage();
	}*/
  	try {
  		
  		
  	$sql=" SELECT  COLUMN_NAME, DATA_TYPE,COLUMN_KEY,EXTRA,TABLE_NAME
  	FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA = '".$this->dbname."'";
  	if($tabla!=null){
  		$sql .=" AND TABLE_NAME = trim(SUBSTRING_INDEX(SUBSTRING_INDEX('".$consulta."', '(', 1),'INSERT INTO',-1)) AND EXTRA = 'auto_increment'";
  	}
  	$result = $this->selecionar($sql);
  	if (count($result)>0 ) //	Es una tabla que tiene vinculada una secuencia
  		$nombre_seq =  $result[0][4];
  	$this->cerrar();
  	return $nombre_seq;
  	
  	}catch(PDOException $e) {
  		echo " Ha surgido un error. Detalle: " .$e->getMessage();
  	}
  	}

  
  public function darReferenciasForaneas($tabla,$columna){
  	$sql = "SELECT  REFERENCED_TABLE_NAME as tablareferenciada,	REFERENCED_COLUMN_NAME as columnareferenciada
   			FROM information_schema.KEY_COLUMN_USAGE
   			WHERE TABLE_SCHEMA = '".$this->dbname."' 
  				AND REFERENCED_TABLE_NAME is not null";
  	if($tabla!=null){
  		$sql.="	AND TABLE_NAME = '".$tabla."'";
  	}
  	if($columna!=null){
  		$sql.=" AND COLUMN_NAME = '".$columna."'";
  	}
  	echo $sql;
  	return $this->selecionar($sql);
  	
  }
  public function darMetaData($tabla){
  	$sql=" SELECT  COLUMN_NAME, DATA_TYPE,COLUMN_KEY,EXTRA
  	FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA = '".$this->dbname."'";
  	if($tabla!=null){
  		$sql .=" AND TABLE_NAME = '".$tabla."'"; 
  	}
  	
  	return $this->selecionar($sql);
  }
  
 /* public function darTablasMetaData($dato){
  	$sql ="SELECT TABLE_NAME as nombretabla, count( * ) AS cantidadcolumnas, GROUP_CONCAT( COLUMN_NAME ORDER BY COLUMN_NAME ASC SEPARATOR ',' ) AS columnas
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_SCHEMA = 'eu_carrito'
			GROUP BY TABLE_NAME";
  	
  	//echo $sql;
  	return $this->selecionar($sql);
  }*/
  
  public function generaInsert($tabla,$dato){
  	$resultado =$this->darMetaData($tabla);
  	//print_object($resultado);
  	$stsql=" INSERT INTO ".$tabla." (";
  	$stvalues="(";
  	foreach ($resultado as $clave => $arrValor){
  		//Por cada columna
  		if($arrValor['EXTRA']!='auto_increment'){
  			$stsql .=$arrValor['COLUMN_NAME'].",";
  			//echo $arrValor['DATA_TYPE'];
  			if($arrValor['DATA_TYPE']!='tinyint' && $arrValor['DATA_TYPE']!='int'){
  				if($arrValor['DATA_TYPE']=='date' || $arrValor['DATA_TYPE']=='timestamp'){
  					if($dato[$arrValor['COLUMN_NAME']] == ''){
  						//Verifico que si es una Fecha, el nulo es el valor null
  						$stvalues.="null,";
  					}else {
  						//Si es de tipo DATE verifico que venga una fecha y no una funcion MySQL
  						if(strpos($dato[$arrValor['COLUMN_NAME']], "/") === false
  								|| strpos($dato[$arrValor['COLUMN_NAME']], "-") === false){
  							//Estoy enviando una funcion, pues no envio ni el - ni el /
  							$stvalues.="".$dato[$arrValor['COLUMN_NAME']].",";
  						} else {
  							$stvalues.="'".$dato[$arrValor['COLUMN_NAME']]."',";
  						}
  					}
  					
  					
  				} else {
  					$stvalues.="'".$dato[$arrValor['COLUMN_NAME']]."',";
  				}
  				
  			}else{
  				//Verifico que si es un Nro, el nulo es el valor null
  				if($dato[$arrValor['COLUMN_NAME']] == ''){
  					$stvalues.="null,";
  				} else {
  					$stvalues.="".$dato[$arrValor['COLUMN_NAME']].",";
  				}
  				
  			}
  			
  		}
  	}
  	$stsql =substr_replace($stsql," ",-1);
  	$stsql .=") VALUES ";
  	$stvalues =substr_replace($stvalues," ",-1);
  	$stvalues .="); ";
  	$sqlInsert=$stsql." ".$stvalues;
  	//echo "<br>".$sqlInsert."<br>";
  	return  $sqlInsert;
  }
  public function generaUpdate($tabla,$dato){
  	
  	$resultado =$this->darMetaData($tabla);
  	//print_object($resultado);
  	$stsql=" UPDATE ".$tabla." SET ";
  	$stwhere=" WHERE ";
  	foreach ($resultado as $clave => $arrValor){
  		//Por cada columna
  		if($arrValor['COLUMN_KEY']!='PRI'){
  			$stsql .=$arrValor['COLUMN_NAME']."=";
  			if($arrValor['DATA_TYPE']!='tinyint' && $arrValor['DATA_TYPE']!='int'){
  				$stsql.="'".$dato[$arrValor['COLUMN_NAME']]."',";
  			}else{
  				$stsql.="".$dato[$arrValor['COLUMN_NAME']].",";
  			}
  				
  		} else{
  			$stwhere .=$arrValor['COLUMN_NAME']."=";
  			if($arrValor['DATA_TYPE']!='tinyint' && $arrValor['DATA_TYPE']!='int'){
  				$stwhere.="'".$dato[$arrValor['COLUMN_NAME']]."' AND ";
  			}else{
  				$stwhere.="".$dato[$arrValor['COLUMN_NAME']]." AND ";
  			}
  		}
  	}
  	$stsql =substr_replace($stsql," ",-1);
  	//$stsql .=") VALUES ";
  	$stwhere .=" true ";
  	$stwhere .="; ";
  	$sqlUpdate=$stsql." ".$stwhere;
  	//echo $sqlUpdate;
  	return  $sqlUpdate;
  	 
  	 
  }
  
  public function generaDelete($tabla,$dato){
  	$resultado =$this->darMetaData($tabla);
  	//print_object($resultado);
  	$stsql=" DELETE FROM ".$tabla." WHERE ";
  	$stwhere="";
  	foreach ($resultado as $clave => $arrValor){
  		//Por cada columna
  		if($arrValor['COLUMN_KEY']=='PRI'){
  			
  			$stwhere .=$arrValor['COLUMN_NAME']."=";
  			if($arrValor['DATA_TYPE']!='tinyint' && $arrValor['DATA_TYPE']!='int'){
  				$stwhere.="'".$dato[$arrValor['COLUMN_NAME']]."' AND ";
  			}else{
  				$stwhere.="".$dato[$arrValor['COLUMN_NAME']]." AND ";
  			}
  		}
  	}
  	$stwhere .=" true ";
  	$stwhere .="; ";
  	$sqlDelete=$stsql." ".$stwhere;
  	//echo $sqlDelete;
  	return  $sqlDelete;
  
  
  }
  

/**
 * Inserta un registro en una tabla de la base de datos 
 * Si la tabla tiene una secuencia retorna el valor con el que se inserto el registro
 * @param $consulta string que contiene una consulta sql INSERT ....
 * */
 public function insertar($consulta){
 	try {
 		$id = -1;
		$sentencia = $this->prepare($consulta);
		if ($sentencia->execute()) {
			// verifico si la tabla en la que se desea insertar tiene vinculada una secuencia
			//$nombre_seq = $this->tieneSequencia($consulta);
  			//if ($nombre_seq!=""){
  				//$id = $this->lastInsertId($nombre_seq);
  				$id =  $this->lastInsertId();
  			//}
				
		
		}
		$this->cerrar();
		//echo $sql." ".$id;
		return $id;
	}catch(PDOException $e) {
		echo " Ha surgido un error. Detalle: " .$e->getMessage();
	}

	}
	
	
	private function esCampo($arreglo,$campo){
		//print_object($arreglo);
		$resp = false;
		for ($i = 0; ($i < count($arreglo)and $resp==false); $i++) {
			$pos = strpos($campo,$arreglo[$i]  );
			//echo "<br>la posicion de ".$arreglo[$i]. " en :".$campo." es:".$pos;
			if ($pos !== false and $pos==0) {
				$resp=true;
			
		}
		}
	//	echo "<br> retorna ".$resp;
		return $resp;
		
	}

	
	
	
	/**
	 * retorna una cadena para utilizar en el WHERE de una consulta SQL.
	 * Como claves el arreglo asiciativo debe contener el nombre de la columna de la tabla y
	 * como valor el que se desea en la comparacion
	 * @param unknown $arreglo
	 */
	 public function  cadenaWhereSql($arreglo,$prefijocampo){
	// 	print_object($arreglo);
		$where ="";
		foreach ($arreglo as $key => $valor){
			$key = str_replace("b_", "", $key); // reemplaza en el nombre del campo b_ por "" ya que puede ser un campo de un formulario de busqueda
			if ($this->esCampo($prefijocampo,$key)and $valor<>"null"){
				if(startsWith($key, "id") || $valor == "true" || $valor == "false")
					$where .="  AND ".  $key."=". $valor;
				else
					$where .="  AND ".  $key." like '%". $valor."%'";
			}
				
		}
		return $where;
	}
	
}

?>

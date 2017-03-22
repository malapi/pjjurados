<?php header('Content-type: text/html; charset=utf-8');


class GeneraExcel {
	
	private $objPHPExcel;
	
	public function __construct() {
		$this->objPHPExcel = new PHPExcel();
	}
	
	public function generaCabecera($data){
		// Set document properties
		$nombre = "lala";
		$this->objPHPExcel->getProperties()->setTitle($nombre)->setDescription("none");
		$this->objPHPExcel->setActiveSheetIndex(0);
		$type = PHPExcel_Cell_DataType::TYPE_STRING2;
		
		$styleArray = array(
				'borders' => array(
						'allborders' => array(
								'style' => PHPExcel_Style_Border::BORDER_THIN
						)
				)
		);
		$this->objPHPExcel->getDefaultStyle()->applyFromArray($styleArray);
		$datos = array();
		if(isset($data['datos'])){
			$datos = $data['datos'];
		} else {
			$datos = $data;
		}
		$encabezado = array();
		if(isset($data['encabezados'])){
			$encabezado =$data['encabezados'];
		} else { // uso como encabezado los key del array
			if(count($datos)>0){
				//print_object($datos);
				$row = $datos[0]; $i=0;
				foreach ($row as $key=>$valor){
					if(!is_int($key)) {
						$encabezado[$i] = $key;$i++;
					}
						
				}
			}
		}
		
		$fila = 1;
		$col = 0;
		foreach ($encabezado as $etiq)
		{
			$this->objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $fila, utf8_encode(trim($etiq)));
			$col++;
		}
	}
	
	public function generaCuerpo($data){
		$type = PHPExcel_Cell_DataType::TYPE_STRING2;
		$datos = array();
		if(isset($data['datos'])){
			$datos = $data['datos'];
		} else {
			$datos = $data;
		}
		$fila = 2;
		
		foreach ($datos as $row)
		{	$columna = 0;
			//print_object($row);
			foreach ($row as $key=>$valor) {
				if(!is_int($key)) {
					$this->objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($columna,$fila,$valor, $type);$columna++;
				}
					
				
			}
			$fila++;
		}
		
	}
	
	public function descargar($data){
		$this->objPHPExcel->setActiveSheetIndex(0);
		$nombreArchi = 'excel.xlsx';
 		if(isset($data['nombreArchivo'])){
 			$nombreArchi =$data['nombreArchivo'].".xlsx"; 
 		}
		
	
		$objWriter = PHPExcel_IOFactory::createWriter($this->objPHPExcel, 'Excel2007');
		$xlsName="filename.xlsx";
		$objWriter->save(str_replace(__FILE__,$_SERVER['DOCUMENT_ROOT'] .'/git/pjjurados/pjjurados/uploads/archivosrtf/'.$nombreArchi,__FILE__));
		
		
		
	}
		
	public function generar($data){
		echo "genera cabecera";
		$this->generaCabecera($data);
		echo "genera cuerpo";
		$this->generaCuerpo($data);
		echo "genera descargar";
		$this->descargar($data);
	}

}




		

			

?>
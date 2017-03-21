<?php header('Content-type: text/html; charset=utf-8');
require_once('../libs/PHPExcel.php');


class GeneraExcel {
	
	private $objPHPExcel;
	
	public function __construct() {
		$this->objPHPExcel = new PHPExcel();
	}
	
	public function generaCabecera($data){
		// Set document properties
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
				$row = $datos[0]; $i=0;
				foreach ($row as $key=>$valor){
					$encabezado[$i] = $key;$i++;
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
		$datos = array();
		if(isset($data['datos'])){
			$datos = $data['datos'];
		} else {
			$datos = $data;
		}
		$fila = 2;
		
		foreach ($datos as $row)
		{	$columna = 0;
			foreach ($row as $key=>$valor) {
				$this->objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($columna,$fila,$valor, $type);$columna++;
				
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
		// Redirect output to a client’s web browser (Excel2007)
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Type: text/html; charset=UTF-8');
		header('Content-Disposition: attachment;filename="'.$nombreArchi.'"');
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');
		
		// If you're serving to IE over SSL, then the following may be needed
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: public'); // HTTP/1.0
		
		$objWriter = PHPExcel_IOFactory::createWriter($this->objPHPExcel, 'Excel2007');
		$objWriter->save('php://output');
	}
		
	public function generar($data){
		$this->generaCabecera($data);
		$this->generaCuerpo($data);
		$this->descargar($data);
	}

}




		

			

?>
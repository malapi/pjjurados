<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('libs/PDOConfig.php');
require_once 'Negocios/utilidades.php';
require_once 'Negocios/parametros.php';
require_once('libs/PHPExcel.php');


if($_GET){

	
	$base = new PDOConfig ();
	$idL = $base->filtrar($_GET ["cbLote"]);
	$tipoDoc =$base->filtrar($_GET["cbTipoDocB"]);
	$nroDoc = $base->filtrar($_GET["txtNroDocB"]);
	$apellido = $base->filtrar($_GET["txtApellidoB"]);
	$nombre = $base->filtrar($_GET["txtNombreB"]);
	$soloAptos = $base->filtrar($_GET["ckAptos"]);
	$idEstado = $base->filtrar($_GET["idEstado"]);
	
	
		try {
			
			$where = "";
			
	
			if(($tipoDoc != "") && ($tipoDoc != "-1"))
			{
				$where .= " AND P.idTipoDocumento = $tipoDoc";
			}
	
			if($nroDoc != "")
			{
				$where .= " AND P.DNI = $nroDoc";
			}
	
			if($apellido != "")
			{
				$where .= " AND P.Apellido LIKE '%$apellido%'";
			}
	
			if($nombre != "")
			{
				$where .= " AND P.Nombre LIKE '%$nombre%'";
			}
	
			if($soloAptos == "1")
			{
				$where .= " AND LP.AptoJurado = 1";
			}else{
				if($soloAptos == "0")
				{
					$where .= " AND LP.AptoJurado = 0";
				}
			}
	
			if($idEstado != "")
			{
				$where .= " AND LP.idEstadoDDJJ = ".$idEstado;
			}
	
			$objPHPExcel = new PHPExcel();
			
			// Set document properties
			$objPHPExcel->getProperties()->setTitle($nombre)->setDescription("none");
			$objPHPExcel->setActiveSheetIndex(0);
			
	
			$sql = "SELECT LP.NroCedula,P.Apellido,P.Nombre,TD.Descripcion AS Tipo_Doc,P.DNI AS Nro_Doc,P.Sexo,
				P.CUIL,P.FechaNacimiento,P.Nacionalidad,P.LugarNacimiento,P.Domicilio, O.Descripcion AS Localidad,
				P.Circuito,CE.Nombre AS Centro_Distribucion,P.CaracteristicaFijo,P.TelefonoFijo,P.CaracteristicaCelu,P.TelefonoCelular,P.CorreoElectronico,
				P.Profesion,P.Ocupacion,P.Observaciones,E.Descripcion AS EstadoDDJJ,LP.ObservacionesEstado,LP.FechaCarga, LP.FechaNotificacion, LP.FechaRecepcionDDJJ,
				LP.AptoJurado,I.Descripcion AS Impedimento,
				LP.ObservacionesImpedimento
				FROM personas P
				INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona
				INNER JOIN lotes L ON LP.idLote = L.idLote
				INNER JOIN tipodocumentos TD ON P.idTipoDocumento = TD.idTipoDocumento
				INNER JOIN estadosddjj E ON LP.idEstadoDDJJ = E.idEstadoDDJJ
				LEFT JOIN centrodistribucion CE ON P.idCentroDistribucion = CE.idCentroDistribucion
				INNER JOIN localidades O ON P.idLocalidad = O.idLocalidad
				LEFT JOIN tipoimpedimentos I ON LP.idTipoImpedimento =I.idTipoImpedimento
				WHERE LP.idLote = $idL $where
				ORDER BY P.Apellido,P.Nombre ";
			//echo $sql;
			$res = $base->query ( $sql );
			if ($res) 
			{
				
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 1, "Listado de Personas por Lote");
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 2, "Total de Personas Listadas: ". $res->rowCount());
				$col = 0;
				$cantCols = $res->columnCount();
				while($col < $cantCols)
				{	
					$dd = $res->getColumnMeta($col);
					$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, 3, $dd["name"]);
					$col++;
				}
				
				$fila = 4;
				$type = PHPExcel_Cell_DataType::TYPE_STRING2;
				foreach ($res as $row)
				{
					$j = 0;
					$col = 0;
					while($col < $cantCols)
					{
						$dd = $res->getColumnMeta($col);
						$nomC = $dd["name"];		

						
						$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col,$fila, $row["$nomC"]);
						$col++;
					}
					$fila++;
				}
			}
			
			$objPHPExcel->setActiveSheetIndex(0);
			
			$nombreArchi = "personasXLote.xlsx";
			// Redirect output to a client’s web browser (Excel2007)
			header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
			header('Content-Disposition: attachment;filename="'.$nombreArchi.'"');
			header('Cache-Control: max-age=0');
			// If you're serving to IE 9, then the following may be needed
			header('Cache-Control: max-age=1');
			
			// If you're serving to IE over SSL, then the following may be needed
			header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
			header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
			header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
			header ('Pragma: public'); // HTTP/1.0
			
			$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
			$objWriter->save('php://output');
			
					
			} 
			catch ( Exception $e ) {
				echo $e->getMessage();
			}
	
}
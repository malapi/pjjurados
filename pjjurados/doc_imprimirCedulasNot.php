<?php
header ( 'Content-type: text/html; charset=utf-8' );
ini_set('memory_limit', '-1');
/*Para que nos e corte la ejecucion por timeout */
set_time_limit(0);
require_once ('libs/PDOConfig.php');
require_once 'Negocios/utilidades.php';
require_once 'Negocios/parametros.php';

$idNotificacion= "";
$PlantillaNotificacion= "";
$idL = 0;

if ($_GET) 
{
	$idL = $_GET ["id"];
		
	$sql = "SELECT idNotificacion,idLote,PlantillaNotificacion,ArchivoNotificaciones
	        FROM notificaciones WHERE idLote = $idL";
	
	$base = new PDOConfig ();
	if ($result = $base->query ($sql)) 
	{
		if($result->rowCount() > 0){
			if ($result = $base->query ($sql)) {
				if($row=$result->fetch(PDO::FETCH_ASSOC)){
					$idNotificacion= $row["idNotificacion"];
					$PlantillaNotificacion= $row["PlantillaNotificacion"];					
				}
			}
				
		}
	}
	
	if($PlantillaNotificacion != "")
	{		
			$fnombre =$idL."_notificaciones.rtf";
			$fsalida = "uploads/archivosrtf/".$fnombre;
			$plantilla = leerArchivo("uploads/plantillas/$PlantillaNotificacion");
			
			$matriz=explode("sectd", $plantilla);
			$cabecera=$matriz[0]."sectd";
			$inicio=strlen($cabecera);
			$final=strrpos($plantilla,"}");
			$largo=$final-$inicio;
			$cuerpo=substr($plantilla, $inicio, $largo);
			//Paso no.3 Escribo el fichero
			$punt = fopen($fsalida, "w");
			fputs($punt, $cabecera);
			
			
		$salida = "";
		$sqlSe = "SELECT P.idPersona,P.Apellido,P.Nombre,P.idTipoDocumento,P.DNI,TD.Descripcion AS tipoDoc,P.Sexo,
				 LP.NroCedula, P.Domicilio, P.idLocalidad,LOC.Descripcion AS localidad,DI.Nombre AS CentroDist FROM personas P
		INNER JOIN lotespersonas LP ON P.idPersona = LP.idPersona
		INNER JOIN localidades LOC ON P.idLocalidad = LOC.idLocalidad
		INNER JOIN tipodocumentos TD ON P.idTipoDocumento = TD.idTipoDocumento
                LEFT JOIN centrodistribucion DI ON P.idCentroDistribucion = DI.idCentroDistribucion
		WHERE LP.idLote = $idL
		ORDER BY DI.Nombre, LP.NroCedula";
		// echo $sql;
		$res = $base->query ( $sqlSe );
		if ($res) {
		
			foreach ( $res as $row ) {
                            
                                if($row["CentroDist"] == null || $row["CentroDist"] == "NULL")
                                {
                                    $row["CentroDist"] = "";
                                }
                            
				$despues=$cuerpo;				
				$despues=str_replace("#NROCEDULA#",$row["NroCedula"],$despues);
				$despues=str_replace("#ANIOCEDULA#",date("Y"),$despues);
				$despues=str_replace("#NOMBRE#", utf8_decode($row["Nombre"]),$despues);
				$despues=str_replace("#APELLIDO#", utf8_decode($row["Apellido"]),$despues);
				$despues=str_replace("#DNI#",$row["tipoDoc"]." ".$row["DNI"],$despues);
				$despues=str_replace("#DOMICILIO#",utf8_decode($row["Domicilio"]),$despues);
				$despues=str_replace("#LOCALIDAD#",utf8_decode($row["localidad"]),$despues);
				$despues=str_replace("#DIA#",date('d'),$despues);
				$despues=str_replace("#MES#",date('m'),$despues);
				$despues=str_replace("#ANIO#",date('Y'),$despues);
                                $despues=str_replace("#CENTRODISTRIBUCION#",utf8_decode($row["CentroDist"]),$despues);
				
				fputs($punt,$despues);
				//$saltopag="\par \pre \par";
                                $saltopag="\n\\page \\par \n";
				fputs($punt,$saltopag);
				
				/*$salida .= "<page>
						$Organismo <br />
					$Expediente <br />
					$Subdireccion<br />
					$Copias<br />
					$Nota <br />					
					 ".$row["NroCedula"]."/".date("Y")." <br />
				DESTINATARIO: ".$row["Apellido"].", ".$row["Nombre"]." - ".$row["tipoDoc"]." ".$row["DNI"]."
							".$row["Domicilio"]."<br /> CIUDAD: ".$row["localidad"]."<br />
							  			FECHA RECEPCI&Oacute;N NOT: ..../..../........<br />
							 $Nota<br /></page>";*/
				
				/*$salida .= "<page>
    					<table aling='center' cellpadding='0'style='font-size: 10pt;' cellspacing='0'>
							<tr>
							  <td style='border: 1px solid;text-align: center;'>URGENTE CON HABILITACION DE DIA Y HORA</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
							  <td style='text-align: center;font-weight: bold;'>CEDULA DE NOTIFICACI&Oacute;N N&deg; ".$row["NroCedula"]."/".date("Y")."</td>
							</tr>
							 <tr><td>&nbsp;</td></tr>
							<tr>
							  <td style='text-align: center;'>
							  		<table aling='center' cellpadding='0' cellspacing='0'>
										<tr>
							  				<td style='border: 1px solid;text-align: center;font-size: 25pt;' width='80' height='80'> P </td>
							  				<td  width='120'>&nbsp;</td>
							  				<td style='border: 1px solid;' width='400'>&nbsp;</td>
							  			</tr>
							  			<tr>
							  				<td style='text-align: center;' width='80'> Fuero </td>
							  				<td  width='120'>&nbsp;</td>
							  				<td style='text-align: center;' width='400'>C&oacute;digo de barras</td>
							  			</tr>
									</table>
							  </td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
							  <td style='text-align: center;'>
							  		<table aling='center' cellpadding='0' border='1' cellspacing='0'>
										<tr>
							  				<td style='border: 1px solid;text-align: center;' width='150'> ORGANISMO </td>
							  				<td style='border: 1px solid;text-align: center;' width='140'> SUBDIRECCION </td>
							  				<td style='border: 1px solid;text-align: center;' width='220'> EXPEDIENTE </td>
							  				<td style='border: 1px solid;text-align: center;' width='90'> CANT. COPIAS </td>
							  			</tr>
							  			<tr>
							  				<td style='border: 1px solid;text-align: center;' width='150'>".$Organismo."</td>
							  				<td style='border: 1px solid;text-align: center;' width='140'>".$Subdireccion."</td>
							  				<td style='border: 1px solid;text-align: center;' width='220'>".$Expediente."</td>
							  				<td style='border: 1px solid;text-align: center;' width='90'>".$Copias."</td>
							  			</tr>
									</table>
							  </td>
							</tr>  		
							 <tr><td>&nbsp;</td></tr>
							 <tr>
							  <td>DESTINATARIO: ".$row["Apellido"].", ".$row["Nombre"]." - ".$row["tipoDoc"]." ".$row["DNI"]."</td>
							 </tr>
							 <tr><td>&nbsp;</td></tr>  	
							 <tr>
							  <td style='text-align: center;'>
							  		<table aling='center' cellpadding='0' border='1' cellspacing='0'>
										<tr>
							  				<td style='border: 1px solid;text-align: center;' width='350'> DOMICILIO </td>
							  				<td style='border: 1px solid;text-align: center;' width='150'> CAR&Aacute;CTER DCLIO </td>
							  				<td style='border: 1px solid;text-align: center;' width='100'> ZONA </td>
							  			</tr>
							  			<tr>
							  				<td style='border: 1px solid;text-align: center;' width='350'>".$row["Domicilio"]."<br /> CIUDAD: ".$row["localidad"]."</td>
							  				<td style='border: 1px solid;text-align: center;' width='150'>DENUNCIADO</td>
							  				<td style='border: 1px solid;text-align: center;' width='100'>&nbsp;</td>
							  			</tr>
									</table>
							  </td>
							</tr> 
							 <tr><td>&nbsp;</td></tr>
							 <tr>
							  <td>FECHA RECEPCI&Oacute;N NOT: ..../..../........</td>
							 </tr>  
	  						 <tr><td>&nbsp;</td></tr>
	  						 <tr><td style='text-align: justify;font-size: 12pt;'>
							  	".$Nota."					
							  	</td></tr>			
						</table>
					  </page>";*/
				
			}
			
			fputs($punt,"}");
			fclose ($punt);
			
		}
	
	}
	
	$zip = new ZipArchive();
	
	$filename = $fsalida.".zip";
	
	if($zip->open($filename,ZIPARCHIVE::CREATE)===true) {
		$zip->addFile($fsalida,$fnombre);
		$zip->close();
		//echo 'Creado '.$filename;
	}
	else {
		//echo 'Error creando '.$filename;
	}
	
	$sql = "UPDATE notificaciones SET ArchivoNotificaciones = '$fnombre.zip'
			WHERE idLote = $idL";
	//echo $sql;	
	if ($base->query ($sql))
	{
		$sql = "UPDATE lotespersonas SET idEstadoDDJJ = ".$ESTADOSDDJJ["ENVIADA"]."
				WHERE idLote = $idL AND idEstadoDDJJ <= 2 ";
		
		if ($base->query ($sql))
		{	
			$inputFileName = $fsalida;
			unlink($inputFileName);
			?><script type="text/javascript">window.location='lot_listadoParaDocumentacion.php'</script><?php 
		}else{
			echo "error update personas";
		}
	}else{
			echo "error update archivos";
		}	
}
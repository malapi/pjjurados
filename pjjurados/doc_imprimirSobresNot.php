<?php
header ( 'Content-type: text/html; charset=utf-8' );
ini_set('memory_limit', '-1');
/*Para que nos e corte la ejecucion por timeout */
set_time_limit(0);
require_once ('libs/PDOConfig.php');
require_once 'Negocios/utilidades.php';
require_once 'Negocios/parametros.php';

$idNotificacion= "";
$PlantillaSobre= "";
$idL = 0;

if ($_GET)
{
	$idL = $_GET ["id"];

	$sql = "SELECT idNotificacion,idLote,PlantillaSobres
	FROM notificaciones WHERE idLote = $idL";
	echo $sql;
	$base = new PDOConfig ();
	if ($result = $base->query ($sql))
	{
		if($result->rowCount() > 0){
			if ($result = $base->query ($sql)) {
				if($row=$result->fetch(PDO::FETCH_ASSOC)){
					$idNotificacion= $row["idNotificacion"];
					$PlantillaSobre= $row["PlantillaSobres"];
				}
			}

		}
	}

	if($PlantillaSobre != "")
	{
		$fnombre =$idL."_sobres.rtf";
		$fsalida = "uploads/archivosrtf/".$fnombre;
		$plantilla = leerArchivo("uploads/plantillas/$PlantillaSobre");
			
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
		ORDER BY DI.Nombre, LP.NroCedula ";
		// echo $sql;
		$res = $base->query ( $sqlSe );
		if ($res) {                       
			foreach ( $res as $row ) {                            
                            if($row["CentroDist"] == null || $row["CentroDist"] == "NULL")
                            {
                                $row["CentroDist"] = "";
                            }

                            $despues=$cuerpo;				
                            $despues=str_replace("#NOMBRE#",utf8_decode($row["Nombre"]),$despues);
                            $despues=str_replace("#APELLIDO#",utf8_decode($row["Apellido"]),$despues);
                            $despues=str_replace("#DNI#",$row["tipoDoc"]." ".$row["DNI"],$despues);
                            $despues=str_replace("#DOMICILIO#",utf8_decode($row["Domicilio"]),$despues);
                            $despues=str_replace("#LOCALIDAD#",utf8_decode($row["localidad"]),$despues);
                            $despues=str_replace("#CENTRODISTRIBUCION#",utf8_decode($row["CentroDist"]),$despues);
                            
                            fputs($punt,$despues);
                            //$saltopag="\par \pre \par";
                            $saltopag="\n\\page \\par \n";
                            fputs($punt,$saltopag);
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
		echo 'Creado '.$filename;
	}
	else {
		echo 'Error creando '.$filename;
	}
	
	$sql = "UPDATE notificaciones SET ArchivoSobres = '$fnombre.zip'
	WHERE idLote = $idL";
	//echo $sql;
	if ($base->query ($sql))
	{?><script type="text/javascript">window.location='lot_listadoParaDocumentacion.php'</script><?php		
	}else{
			echo "error update archivos";
		}	
}
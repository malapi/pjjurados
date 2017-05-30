<?php  
function leerArchivo_2($ruta)
{
	//echo "lala ".$ruta;
	$texto = file($ruta);
	$tamano = sizeof($texto);
	$todo = "";
	for($n=0;$n<$tamano;$n++) {
		$todo = $todo.$texto[$n];
	}
	return $todo;
}

function generarArchivoRTF($datos,$mapeo,$nombreplantilla,$nombreArchivo){
	
	//print_object($datos);
	$fnombre =$nombreArchivo;
	$fsalida = "../uploads/archivosrtf/".$fnombre;
	$fsalidaRetorno = "uploads/archivosrtf/".$fnombre;
	//echo "<br>lala ".$fsalida;
	$plantilla = leerArchivo_2("../uploads/plantillas/".$nombreplantilla);
	
	$matriz=explode("sectd", $plantilla);
	$cabecera=$matriz[0]."sectd";
	$inicio=strlen($cabecera);
	$final=strrpos($plantilla,"}");
	
	//echo "<br>Final ".$final;
	//echo "<br>Inicio ".$inicio;
	$largo=$final-$inicio;
	//echo "<br>Largo ".$largo;
	$cuerpo=substr($plantilla, $inicio, $largo);
	
	//$cuerpo=$plantilla;
	//Paso no.3 Escribo el fichero
		
	$punt = fopen($fsalida, "w");
	fputs($punt, $cabecera);
	
	
	
	foreach ($datos as $row ) {
 		$despues=$cuerpo;
 		foreach ($mapeo as $columna) {
 			//echo "<br> Columna ".$columna['tagplantilla'];
 			$posicion=strrpos($despues,$columna['tagplantilla'])>0;
 			if($posicion > 0){
 				//echo "<br>  Valor encontrada ". $posision." ".utf8_decode($row[$columna['tagvalor']]);
 				$despues=str_replace($columna['tagplantilla'], utf8_decode($row[$columna['tagvalor']]),$despues);
 			}
 			
 		}
//  		echo "<br>NOMBRE ".strrpos($despues,"#NOMBRE");
//  		echo "<br>APELLIDO ".strrpos($despues,"#APELLIDO");
//  		echo "<br>DNI ".strrpos($despues,"#DNI");
// // 		//print_object($row);
// // 		//echo $cuerpo;
 		
//  		$despues=str_replace("#APELLIDO", utf8_decode($row["Apellido"]),$despues);
//  		$despues=str_replace("#DNI",$row["DNI"],$despues);
		fputs($punt,$despues);
		$saltopag="\n\\page \\par \n";
		fputs($punt,$saltopag);
	}
	fputs($punt,"}");
	fclose ($punt);
	
	$zip = new ZipArchive();
	//echo "lala dfd".$fsalida;
	$filename = $fsalida.".zip";
	
	if($zip->open($filename,ZIPARCHIVE::CREATE)===true) {
					$zip->addFile($fsalida,$fnombre);
					$zip->close();
					$inputFileName = $fsalida;
					unlink($inputFileName);
	}
	
	return $fsalidaRetorno.".zip";
}


function startsWith($haystack, $needle) {
	// search backwards starting from haystack length characters from the end
	return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== false;
}

function endsWith($haystack, $needle) {
	// search forward starting from end minus needle length characters
	return $needle === "" || (($temp = strlen($haystack) - strlen($needle)) >= 0 && strpos($haystack, $needle, $temp) !== false);
}

function generarParametrosParaSubmit($obj,$accion){
	$cadena = "[";
	foreach ($obj as $key=>$value){
		if(!is_numeric($key)){
			$cadena .="{ name: '".$key."', value:'".htmlentities($value)."'},";
			//echo $key." ".$value;
		}
	}
	if($accion != ""){
		$cadena .="{ name: '"."accion"."', value:'".$accion."'},";
	}
	$cadena .= "]";
	return $cadena;
}

function convertir_Fecha($valor){
	$date = new DateTime($valor);
	$fecha = $date->format('d-m-Y');
	return $fecha;
}
function is_Date($str){

	$str = str_replace('/', '-', $str);
	$stamp = strtotime($str);
	if (is_numeric($stamp)){

		$month = date( 'm', $stamp );
		$day   = date( 'd', $stamp );
		$year  = date( 'Y', $stamp );

		return checkdate($month, $day, $year);

	}
	return false;
}


function data_submitted_cadena($cadena) {
	$_AAux= array();
	$_AAux2= array();
	if (!empty($cadena) && is_string($cadena)){
		$_AAux =explode("&",$cadena);
		if (count($_AAux)){
			foreach ($_AAux as $indice => $valor) {
				$valor =explode("=",$valor);
				if ($valor[1]=="" || $valor[1]=="0")
					$_AAux2[$valor[0]] = 'null';
					else
						$_AAux2[$valor[0]] = $valor[1];
			}
		}
	}
	
	return $_AAux2;

}
function data_submitted() {
	$_AAux= array();
    if (!empty($_POST)) 
    	$_AAux =$_POST;
    else 
		if(!empty($_GET)) {
            $_AAux =$_GET;
		}
	if (count($_AAux)){
		foreach ($_AAux as $indice => $valor) {
				if ($valor=="")
                	$_AAux[$indice] = 'null'	;
			}
	}
	return $_AAux;

}


function __autoload($class_name){
	 //echo "class ".$class_name ;
        $directorys = array(
            $GLOBALS['ROOT'].'modelo/',
            $GLOBALS['ROOT'].'control/',
        	$GLOBALS['ROOT'].'libs/',
        );
      //print_object($directorys) ;
        foreach($directorys as $directory){
          if(file_exists($directory.$class_name . '.php')){  
          	    // echo "se incluyo".$directory.$class_name . '.php';
            	require_once($directory.$class_name . '.php');
                return;
            }           
        }
}



function print_object($object) {
    echo "<PRE>";
    print_r($object);
    echo "</PRE>";
}

function verificaCapcha($datos){
	 
	$salida = false;
	// respuesta vacía
	$response = null;
	// comprueba la clave secreta
	$reCaptcha = new ReCaptcha();
	$response = $reCaptcha->verifyResponse($_SERVER["REMOTE_ADDR"],	$_POST['g-recaptcha-response']);
	if ($response != null && $response->success) 
		$salida = true;
	return $salida;
	
}



/*est funcion solo sube el archivo no realiza cheqo de extencio se debe hacer en el cliente antes de llegar al servgidor*/
function subirArchivoServidor($origen,$nombre,$directorio,$funcJs){
//$origen es el nombre del input=file
//$nombre = nuevo nombre con el que se va a guardar al archivo
//$ directorio  = directorio en el que se va a guardar el archivo q se esta subiendo
//$funJs nombre de la funcion js que va a interpretar la salida del script php
	//Obtengo el nombre del archivo
	$archivo = $_FILES[$origen]['name'];


	//obtengo en $ext la extension del archivo que subieron
	$pos = strpos ($_FILES[$origen]['name'], ".");
	$ext = substr ($_FILES[$origen]['name'],$pos);
		
	//Cambio el nombre del archivo que han subido
	$_FILES[$origen]['name'] = $nombre;
	$tempor=$_FILES[$origen]['tmp_name'];
	$pathArchivo= $directorio."/" . $nombre;
	//echo "El nombre de la tempor es ::: ".$tempor."<br>";
	//echo "El nombre de la pathArchivo es ::: ".$pathArchivo."<br>";
	//chmod($pathArchivo,777);
	
		if (!copy($tempor, $pathArchivo)){
			
				return false;
			}else {
			
				return true;
			}
}

function debug($txt,$file="debug.txt"){
	$fp = fopen($file, "a");
	print_object($txt);
	$data = ob_get_contents();
	ob_end_clean();
	fwrite($fp, str_replace("\n","\r\n","\r\n".$data));
	fclose($fp);
}

?>
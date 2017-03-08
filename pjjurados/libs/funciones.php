<?php  
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
			$cadena .="{ name: '".$key."', value:'".$value."'},";
			//echo $key." ".$value;
		}
	}
	if($accion != ""){
		$cadena .="{ name: '"."accion"."', value:'".$accion."'},";
	}
	$cadena .= "]";
	return $cadena;
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
        	$GLOBALS['ROOT'].'util/class/',
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
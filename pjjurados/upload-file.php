<?php
include "libs/Archivo.php";
$uploaddir = 'uploads/';
/*require_once("libs/Login.php");
$oLogin=new Login();
 if(!$oLogin->activa()){
 	echo "0";
}*/
	
if (!file_exists($uploaddir)) {
	mkdir($uploaddir, 0777, true);
}
	$archi	= $_FILES['uploadfile']['name'];
	if($archi != "")
	{	
		$result = "";		
		$ext 	= array("xls","xlsx");
		$tam	= $_FILES['uploadfile']['size'];
		$tmp	= $_FILES['uploadfile']['tmp_name'];
				
		$Archivo = new Archivo($archi,$uploaddir,$ext,$tam,$tmp);	
		
		$up = $Archivo->upLoadFile();
		//print_r($Archivo);
		if ($up){			
			$result = $Archivo->nombre.".".$Archivo->tipoArchivo;
			echo $result;
		}else{
			echo "0";
		}
	}else{
		echo "0";
	}

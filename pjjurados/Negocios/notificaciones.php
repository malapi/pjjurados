<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('../libs/PDOConfig.php');
require_once 'utilidades.php';
require_once('../libs/html2pdf/html2pdf.class.php');

function GenerarCedula($idLote,$nroCedula,$arCedula,$arSobre,$cartaSaludo){
	try {
		$base = new PDOConfig ();
		$idLote = $base->filtrar ( $idLote );
		$nroCedula = $base->filtrar ( $nroCedula );
		$arCedula = $base->filtrar ( $arCedula );
		$arSobre = $base->filtrar ( $arSobre );	
		$cartaSaludo = $base->filtrar($cartaSaludo);
		$base->beginTransaction();
		$cargarCedulas = true;
		$sql = "SELECT * from notificaciones where idLote=$idLote";
		if ($result = $base->query ($sql)) {
			if($result->rowCount() > 0){				
				$sqlIN = "UPDATE notificaciones SET PlantillaNotificacion = '$arCedula',PlantillaSobres = '$arSobre',
							ArchivoNotificaciones=NULL,ArchivoSobres=NULL,CartaSaludo='$cartaSaludo' WHERE idLote = $idLote";
				$cargarCedulas = false;
			}else{
				$sqlIN = "INSERT INTO notificaciones(idLote,PlantillaNotificacion,PlantillaSobres,CartaSaludo,IniciarCedulas) VALUES
				     ($idLote,'$arCedula','$arSobre','$cartaSaludo',$nroCedula)";				
			}
			//echo $sqlIN;
			if ($base->query ( $sqlIN )) {
				
				if($cargarCedulas)
				{
					$sql = "SELECT * from lotespersonas where NroCedula >= $nroCedula";
					if ($result = $base->query ($sql)) 
					{
						if($result->rowCount() > 0)
						{
							$base->rollBack();
							return "<div class='alert alert-error' style='margin-top: 16px;'>
				                        <button type='button' class='close' data-dismiss='alert'>X</button>
				                        El numero de c&eacute;dula indicado no es correcto
				                    	</div>";
						}
					}
					else
					{
						$base->rollBack();
						return "<div class='alert alert-error' style='margin-top: 16px;'>
                                                        <button type='button' class='close' data-dismiss='alert'>X</button>
                                                        Ha ocurrido un error al intentar consultar los datos de c&eacute;dula
                                                        </div>";
					}
					
					
					$nc = $nroCedula;				
					$sql = "SELECT LP.idPersona FROM lotespersonas LP INNER JOIN personas P ON LP.idPersona = P.idPersona
					             WHERE idLote=$idLote ORDER BY P.Apellido, P.Nombre";
					//echo $sql;
					if ($result = $base->query ($sql)) {
						
						foreach ( $result as $row ) {
							$sqlUP = "UPDATE lotespersonas SET NroCedula = $nc WHERE idLote = $idLote AND idPersona = ".$row["idPersona"];						
							if (!$base->query ( $sqlUP )) 
							{
								$base->rollBack();
								return "<div class='alert alert-error' style='margin-top: 16px;'>
				                        <button type='button' class='close' data-dismiss='alert'>X</button>
				                        Ha ocurrido un error al intentar cargar los datos
				                    	</div>";
							}
							$nc = $nc + 1;
						}					
					}
					else {
						$base->rollBack();
						return "<div class='alert alert-error' style='margin-top: 16px;'>
	                        <button type='button' class='close' data-dismiss='alert'>X</button>
	                        Ha ocurrido un error al intentar cargar los datos
	                    	</div>";
					}
				}
				$base->commit();
				return "1";
				
			} else {
				$base->rollBack();
				return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>X</button>
                        Ha ocurrido un error al intentar cargar lo datos
                    	</div>";
				}
		}
		else {
			return "<div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>X</button>
                        Ha ocurrido un error al consultar datos
                    	</div>";
		}
		
			
		
	} catch ( Exception $e ) {
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>X</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}
}


function verUltimaNot($idLote){
	
	try {
		$base = new PDOConfig ();
		
		$sql = "SELECT idNotificacion,PlantillaNotificacion,PlantillaSobres,CartaSaludo,
		        IniciarCedulas AS NroCel,PlantillaIntimacion,ArchivoIntimacion FROM notificaciones
				WHERE idLote = $idLote";
		$resultado = "";
		if ($result = $base->query ($sql)) {
			if($result->rowCount() > 0){
				if ($result = $base->query ($sql)) {
                                    if($row=$result->fetch(PDO::FETCH_ASSOC)){
                                        $resultado["PlantillaNotificacion"] = $row["PlantillaNotificacion"];
                                        $resultado["PlantillaSobres"] = $row["PlantillaSobres"];
                                        $resultado["CartaSaludo"] = $row["CartaSaludo"];
                                        $resultado["NroCedula"] = $row["NroCel"];
                                        $resultado["idNotificacion"] = $row["idNotificacion"];
                                        $resultado["PlantillaIntimacion"] = $row["PlantillaIntimacion"];
                                        $resultado["ArchivoIntimacion"] = $row["ArchivoIntimacion"];
                                    }
				}
			
			}else{
                            $anioAc = date("Y");
                            
                            $sqlFcL = "SELECT YEAR(L.FechaDesde) AS Anio FROM lotes L WHERE idLote = $idLote";		
                            if ($rrr = $base->query ($sqlFcL)) {
                               $ddd = $rrr->fetch(PDO::FETCH_ASSOC);
                               $anioAc = $ddd["Anio"];
                            }                            
                            
                            $anioMin = substr($anioAc, 2);
                            
                            $sql = "SELECT MAX(P.NroCedula) AS NroCel FROM lotespersonas P "
                                . "INNER JOIN lotes L ON P.idLote = L.idLote WHERE YEAR(L.FechaDesde) = $anioAc";
                            //print_r($sql);
                            if ($result = $base->query ($sql)) {
                                if($row=$result->fetch(PDO::FETCH_ASSOC)){
                                    $anioMin = substr($anioAc, 2);
                                    $nroC = $row["NroCel"];
                                    if($nroC == "")
                                    {
                                        $nroC = 0;
                                        $nroC = ($anioMin * 100000) + ($nroC + 1);
                                    }else{
                                       $nroC = $nroC + 1;
                                    }
                                    
                                    $resultado["PlantillaNotificacion"] = "";
                                    $resultado["PlantillaSobres"] = "";
                                    $resultado["CartaSaludo"] = "";
                                    $resultado["NroCedula"] = $nroC;
                                    $resultado["idNotificacion"] = "0";
                                    $resultado["PlantillaIntimacion"] = "";
                                    $resultado["ArchivoIntimacion"] = "";						
                                }
                            }
			}			
		}		
		
		return json_encode($resultado);
		
	} catch ( Exception $e ) {
		return "0";
	}
}


if ($_POST) {
	$rta = "";
	try {
		$oper = $_POST ['oper'];

		switch ($oper) {
			case 'generarCedula' :
				//print_r($_POST);
				$idLote = $_POST ['hfIdSorteo'];
				$nroCedula = $_POST ["txtNroCedula"];
				$arCedula = $_POST ["hfArchiCedula"];
				$arSobre = $_POST ["hfArchiSobre"];	
				$Carta = $_POST ["hfCartaSaludo"];				
				$rta = GenerarCedula($idLote,$nroCedula,$arCedula,$arSobre, $Carta);
				break;
				
			case 'verUltima' :
					$idLote = $_POST ['hfIdSorteo'];
					$rta = verUltimaNot($idLote);
				break;
				
		}
	} catch ( Exception $e ) {
		echo " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al ejecutar la acci&oacute;n solicitada
                    	</div>";
	}

	echo $rta;
}
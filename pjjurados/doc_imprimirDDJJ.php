<?php
header ( 'Content-type: text/html; charset=utf-8' );
ini_set('memory_limit', '-1');
/*Para que nos e corte la ejecucion por timeout */
set_time_limit(0);
require_once ('libs/PDOConfig.php');
require_once 'Negocios/utilidades.php';
require_once 'Negocios/parametros.php';
require_once 'libs/html2pdf/html2pdf.class.php';
$salida = "";
$idL = 0;
if ($_GET)
{
	$idL = $_GET ["id"];

	$sql = "SELECT L.idLote,L.Descripcion,L.idPlantilla,N.idNotificacion,N.CartaSaludo
			FROM LoteS L 
			INNER JOIN notificaciones N ON L.idLote = N.idLote
			WHERE L.idLote = $idL";
	//ECHO $sql;
	$base = new PDOConfig ();
	if ($result = $base->query ($sql))
	{
            if($result->rowCount() > 0){
                    if ($result = $base->query ($sql)) {
                            if($row=$result->fetch(PDO::FETCH_ASSOC)){
                                    $titulo= $row["Descripcion"];
                                    $idNotificacion= $row["idNotificacion"];
                                    $carta= $row["CartaSaludo"];
                                    $idPlantilla = $row["idPlantilla"];
                            }
                    }

            }
	}

	if($carta != "")
	{
		$salida .= "<page backtop='10mm' backbottom='10mm' backleft='10mm' backright='10mm' pagegroup='inicio'>
				   <page_header>
			        <table>
			            <tr>
			                <td style='width: 100%; text-align: left'>
			                   <img src='img/logoOfijuICircunscripcion.png' />
			                </td>
			            </tr>
			        </table>
			    </page_header>
			    <page_footer>
			        <table>
			            <tr>
			                <td style='width: 100%; text-align: right'>
			                    pagina [[page_cu]]/[[page_nb]]
			                </td>
			            </tr>
			        </table>
			    </page_footer>
				".$carta."</page>";
		$salida .= "<page pageset='old'>
				      <h2 style='text-decoration:underline;padding:5px;'>Declaraci&oacute;n Jurada - Jurado Popular</h2>
				      <p>PODER JUDICIAL <br />PROVINCIA DE NEUQUEN <br />Ley 2784- Arts 43 y 44<</p>
					  <p>DATOS QUE DEBER&Aacute; CONSIGNAR CON VALOR DE DECLARACI&Oacute;N JURADA. LEER ATENTAMENTE</p>				
					<h4 style='text-decoration:underline;padding:5px;'>DATOS PERSONALES</h4>
					<table>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>1. Apellido (s)</strong>:<br /><br /></td></tr>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>2. Nombre Completo</strong>:<br /><br /></td></tr>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>3. Tipo y Nro. de Documento de Identidad</strong>:<br /><br /></td></tr>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>4. CUIL Nro.</strong>:<br /><br /></td></tr>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>5. Nacionalidad</strong>:<br /><br /></td></tr>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>6. Lugar de Nacimiento</strong>:<br /><br /></td></tr>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>7. Fecha Nacimiento</strong>:<br /><br /></td></tr>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>8. Lugar donde Ud. vive actualmente </strong>(Indique Calle, N&uacute;mero, Barrio y localidad. De ser posible,
				              entre que calles est� o alguna referencia puntual para encontrarlo):<br /><br /></td></tr>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>9. Telefono Fijo</strong>:<br /><br /></td></tr>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>10. Telefono Celular</strong>:<br /><br /></td></tr>
						<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;'><strong>11. Correo electr�nico</strong>:<br /><br /></td></tr>
					</table>
					
				    </page>";
		
		
		
		$sql = "SELECT DISTINCT C.idCategoria,C.Descripcion
				FROM plantillas_preguntas PP
				INNER JOIN preguntas E ON PP.idPregunta = E.idPregunta
				INNER JOIN categorias C ON E.idCategoria = C.idCategoria
				WHERE PP.idPlantilla = $idPlantilla
				ORDER BY C.Orden";
		
		$res = $base->query ( $sql );
		if ($res) {
			$totalCat = $res->rowCount();
			$i = 1;
			foreach ( $res as $row ) {
				$salida .= "<page pageset='old'>				     				
					<h4 style='text-decoration:underline;padding:5px;'>".$row ["Descripcion"]."</h4>
					<table style='width: 100%'>";
				
				$sqlP = "SELECT PP.idPlantilla, PP.idPregunta,PP.Orden, E.Descripcion AS Pregunta, E.idTipoRespuesta
				FROM plantillas_preguntas PP
				INNER JOIN preguntas E ON PP.idPregunta = E.idPregunta
				WHERE PP.idPlantilla = $idPlantilla AND E.idCategoria = " . $row ["idCategoria"] . " ORDER BY PP.Orden";
				// echo $sqlP;
				$resP = $base->query ( $sqlP );
				if ($resP) {
					foreach ( $resP as $rowP ) {
						
						switch ($rowP ["idTipoRespuesta"]) {
							case "1" :
								$salida .= "<tr><td style='padding:10px 2px; 10px 2px;width: 100%'><strong>".$rowP ["Orden"].". ".$rowP ["Pregunta"].
									"</strong> (Elija lo que corresponda):<br /><br />SI<br /><br />NO</td></tr>";
								break;
							case "2" :
								$salida .= "<tr><td style='border-bottom:1px solid;padding:18px 2px; 10px 2px;width: 100%'><strong>".$rowP ["Orden"].". ".$rowP ["Pregunta"].
									"</strong>:<br /><br /></td></tr>";
								break;
						}
						
					}
					$salida .= "</table>";
				}
				
				if($i >= $totalCat)
				{
					$salida .= "<br /><br /><br /><table style='width: 100%;margin-top:20px;'>
							<tr><td>Firma: .............................................................</td></tr>
							<tr><td>&nbsp;</td></tr>
							<tr><td>Aclaraci&oacute;n: .....................................................</td></tr>
							<tr><td>&nbsp;</td></tr>
							<tr><td><h4>LA PRESENTE DEBER&Aacute; SER COMPLETADA Y DEVUELTA DENTRO DE LA 72 HS. DE RECIBIDA.</h4></td></tr>
							</table>";
				}
				$i++;
				$salida .= "</page>";
			}
			
		}
		
		
				$html2pdf = new HTML2PDF('P', 'A4', 'es', true, 'UTF-8');
				$html2pdf->writeHTML($salida);
				$html2pdf->Output('exemple12.pdf');
				
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
}
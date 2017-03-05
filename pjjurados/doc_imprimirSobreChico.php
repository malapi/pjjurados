<?php
header ( 'Content-type: text/html; charset=utf-8' );
require_once ('libs/PDOConfig.php');
require_once 'Negocios/utilidades.php';
require_once 'Negocios/parametros.php';
require_once 'libs/html2pdf/html2pdf.class.php';
$salida = "";
$idL = 0;
		$salida .= "<table>
						 <tr>
			                <td colspan='2' style='width: 100%; border:1px solid;text-align: center; font-size:14pt;'>
			                  CORREO ARGENTINO <br />
								APARTADO <br />
								RESPUESTA POSTAL PAGA N&deg; 7 <br />
								NEUQUEN
			                </td>
			            </tr>
						<tr><td colspan='2'>&nbsp;</td>
						</tr>
						<tr>
			                <td style='width: 100%; border:1px solid;font-size:14pt;text-align: center;padding:10px;'>
			                OFICINA JUDICIAL I CIRCUNSCRIPCION <br />
							JUICIO POR JURADOS <br /> <br />
							<span style='font-size:11pt;'>ANT. ARGENTINA N&deg; 352 <br /> CP. 8300 - NEUQUEN</span>
			                </td>
			                <td style='width: 20%; text-align: center;font-size:8pt; padding:10px;'>
			                   <br /> <br /><img src='img/logoPJRec.png' /> <br />
								TRUBUNAL SUPERIOR DE JUSTICIA <br />
								PROVINCIA DEL NEUQUEN
			                </td>
			            </tr>
			        </table>";
		$html2pdf = new HTML2PDF('P','CARTA','es',true,'UTF-8', array(30, 10, 15, 8));
		$html2pdf->writeHTML($salida);
		$html2pdf->Output('Sobre2.pdf');
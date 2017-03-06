<?php
include ("header.php");
$idP = 0;
$idL = 0;
if ($_GET) {
	$idP = $_GET ["id"];
	$idL = $_GET ["idL"];
}
?>


<!-- Content -->
<div id="content">
	<!-- Content wrapper -->
	<div class="wrapper">
		<!-- Breadcrumbs line -->
		<div class="crumbs">
			<ul id="breadcrumbs" class="breadcrumb">
				<li><a href="#">Lotes</a></li>
				<li><a href="#">Lotes Activos</a></li>
				<li><a href="#">Personas por Lote</a></li>
				<li><a href="#">DDJJ</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->

		<!-- Page header -->
		<div class="page-header">
			<div class="page-title">
				<h5>Completar Declaraci&oacute;n Jurada</h5>
			</div>
			
		</div>
		<!-- /page header -->

		<div class="span12">
			<form id="formResultadoPersona" method="POST">
				<fieldset>
					<!-- General form elements -->
					<input type="hidden" name="oper" id="oper" value="completarDDJJ" />
					<input type="hidden" name="hfIdPer" id="hfIdPer"
						value="<?php echo $idP; ?>" /> <input type="hidden"
						name="hfIdLote" id="hfIdLote" value="<?php echo $idL; ?>" /> <input
						type="hidden" name="hfIdLP" id="hfIdLP" value="" />

					<div id="divResultado" class="span12">
						<div class="widget row-fluid">
							<div class="well">
								<div class="row-fluid">
									<div class="span4"> <label id="txtPersona" name="txtPersona"></label> </div>
                                     <div class="span4">
										<div class="control-group">
											<label class="radio inline"> 
											<input name="ckCargaWeb" id="ckCargaWeb" value="1" type="checkbox" > Carga V&iacute;a Web
											</label> 
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span7">
										<div class="control-group">
											<label class="control-label">Resultado:</label>
											<div class="controls">
												<select name="cbResultado" id="cbResultado"
													class="validate[required] span12"
													data-prompt-position="topLeft:-1,-5">
													<option value="">...</option>
													<option value="4">NO se Notific&oacute;</option>
													<option value="6">Se Notific&oacute;</option>
													<option value="7">Se envi&oacute; Intimaci&oacute;n</option>
													<option value="3">Se recibi&oacute; la Declaraci&oacute;n
														Jurada</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<!-- <div class="row-fluid"> -->
									<!-- Malapi: Lo quito, pues ahora hay un historico
									<div class="span4">
										<div class="control-group">
											<label class="control-label">Fecha Notificaci&oacute;n:</label>
											<div class="controls">
												<input type="text"
													class="datepicker validate[funcCall[valNoNot]] span8"
													data-mask="99/99/9999" id="txtNotificacion"
													data-prompt-position="topLeft:-1,-5" name="txtNotificacion"
													placeholder="99/99/9999">
											</div>
										</div>
										
									</div> -->
									<!-- MaLaPi: Lo quito para que solo se guarde en Generar Intimación
									<div class="span4">
										<div class="control-group">
											<label class="control-label">Fecha Intimaci&oacute;n:</label>
											<div class="controls">
												<input type="text"
													class="datepicker span8"
													data-mask="99/99/9999" id="txtIntimacion"
													data-prompt-position="topLeft:-1,-5" name="txtIntimacion"
													placeholder="99/99/9999">
											</div>
										</div>
									</div> -->
									
								<!-- </div> -->
								<!--  Malapi: Lo quito, pues ahora hay un historico; el de Notificaciones Persona
								 <div class="row-fluid"> 
									<div class="span12">
										<div class="control-group">
											<label class="control-label">Observaciones:</label>
											<div class="controls">
												<textarea id="txtObservacionesEst"
													name="txtObservacionesEst"
													class="validate[funcCall[valOb]] span12"></textarea>
											</div>
										</div>
									</div>
								</div> -->
								

</div>
							</div>
						</div>
					</div>

					<div id="divDDJJ" class="span12" style="display: none;">
						<div class="page-header">
							<div class="page-title">
								<h5>Completar Declaraci&oacute;n Jurada</h5>
							</div>
						</div>
						<!-- <div class="widget row-fluid"> -->
							<div class="well">
								<div class="row">
								    <div class="col-sm">
										<div class="control-group">
											<label class="control-label">Fecha Recepci&oacute;n DDJJ:</label>
											<div class="controls">
												<input type="text"
													class="datepicker validate[funcCall[valNoRec]] span8"
													data-mask="99/99/9999" id="txtRecepcion"
													data-prompt-position="topLeft:-1,-5" name="txtRecepcion"
													placeholder="99/99/9999" />
											</div>
										</div>
									</div>
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Apellido:</label>
											<div class="controls">
												<input type="text" id="txtApellido" name="txtApellido"
													class="validate[required] span12" />
											</div>
										</div>
									</div>

									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Nombre:</label>
											<div class="controls">
												<input type="text" id="txtNombre" name="txtNombre"
													class="validate[required] span12" />
											</div>
										</div>
									</div>
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Tipo Documento:</label>
											<div class="controls">
												<select name="cbTipoDoc" id="cbTipoDoc"
													class="validate[required] span12"
													data-prompt-position="topLeft:-1,-5">
													<option value="">...</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Nro Documento:</label>
											<div class="controls">
												<input type="text" id="txtNroDoc" name="txtNroDoc"
													class="validate[required] span12" />
											</div>
										</div>
									</div>
									
								</div>

								<div class="row">
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Nro CUIL:</label>
											<div class="controls">
												<input type="text" id="txtCUIL" name="txtCUIL"
													class="span12" />
											</div>
										</div>
									</div>
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Nacionalidad:</label>
											<div class="controls">
												<input type="text" id="txtNacionalidad"
													name="txtNacionalidad" class="span12" />
											</div>
										</div>
									</div>
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Lugar de Nacimiento:</label>
											<div class="controls">
												<input type="text" id="txtLugarNac" name="txtLugarNac"
													class="span12" />
											</div>
										</div>
									</div>
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Fecha Nacimiento:</label>
											<div class="controls">
												<input type="text" id="txtFechaNac" name="txtFechaNac"
													class="datepicker span10" placeholder="99/99/9999" />
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<!-- <div class="span3">
										<div class="control-group">
											<label class="control-label">Sexo:</label>
											<div class="controls">
												<select name="cbSexo" id="cbSexo"
													class="validate[required] span12"
													data-prompt-position="topLeft:-1,-5">
													<option value="">...</option>
													<option value="F">F</option>
													<option value="M">M</option>
												</select>
											</div>
										</div>
									</div> -->
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Domicilio:</label>
											<div class="controls">
												<input type="text" id="txtDomicilio" name="txtDomicilio"
													class="validate[required] span12" />
											</div>
										</div>
									</div>
									
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Localidad:</label>
											<div class="controls">
												<select name="cbLocalidad" id="cbLocalidad"
													class="validate[required] span12"
													data-prompt-position="topLeft:-1,-5">
													<option value="">...</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Telefono Fijo:</label>
											<div class="controls">
												<input type="text" id="txtCarTF" name="txtCarTF"
													class="span4" maxlength="4" /> <input type="text"
													id="txtTelFijo" name="txtTelFijo" class="span8"
													maxlength="10" />
											</div>
										</div>
									</div>
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Telefono Celular:</label>
											<div class="controls">
												<input type="text" id="txtCarTC" name="txtCarTC"
													class="span4" maxlength="4" /> <input type="text"
													id="txtTelCelu" name="txtTelCelu" class="span8"
													maxlength="10" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Email:</label>
											<div class="controls">
												<input type="text" id="txtEmail" name="txtEmail"
													class="span12" />
											</div>
										</div>
									</div>
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Profesi&oacute;n:</label>
											<div class="controls">
												<input type="text" id="txtProfesion" name="txtProfesion"
													class="span12" />
											</div>
										</div>
									</div>
									<div class="col-sm">
										<div class="control-group">
											<label class="control-label">Ocupaci&oacute;n:</label>
											<div class="controls">
												<input type="text" id="txtOcupacion" name="txtOcupacion"
													class="span12" />
											</div>
										</div>
									</div>
									<div class="col-sm">
										
									</div>
								</div>
							</div>
							<!-- /well -->
						<!-- </div> -->
						<!-- /general form elements -->
						<!-- Plantilla correspondiente al lote-->
						<div  id="completarPlantilla"></div> 
						<div class="widget row-fluid">
							<div class="navbar">
								<div class="navbar-inner">
									<h6>Evaluaci&oacute;n</h6>
								</div>
							</div>
							<div class="well">
								<div class="row-fluid">
									<div class="span12">
										<div class="control-group">
											<label class="radio inline"> <input name="rbApto" id="rbSi"
												value="1" type="radio"
												class="validate[funcCall[valchekApto]]">Apto
											</label> <label class="radio inline"> <input name="rbApto"
												id="rbNO" value="0" type="radio"
												class="validate[funcCall[valchekApto]]">No Apto
											</label>
										</div>
									</div>
								</div>
								<div class="row-fluid apto" style="display: none;">
									<div class="span6">
										<div class="control-group">
											<label class="control-label">Impedimento:</label>
											<div class="controls">
												<select name="cbImpedimento" id="cbImpedimento"
													class="validate[funcCall[valApto]] span12"
													data-prompt-position="topLeft:-1,-5">
													<option value="">...</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid apto" style="display: none;">
									<div class="span12">
										<div class="control-group">
											<label class="control-label">Observaciones:</label>
											<div class="controls">
												<textarea id="txtObservacionesImp"
													name="txtObservacionesImp" class="span12"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>
					<!-- / DDJJ -->

					<div class="well">
						<div id="respuesta"></div>
						<div class="form-actions align-right">
							<button id="btnGuardarDDJJ" type="button" class="btn btn-info">Guardar</button>
							<a id="btncancel"
								href="lot_personasXLote.php?id=<?php echo $idL; ?>"
								class="btn btn-default">Cancelar</a>
								<button id="boton-top" type="button" class="btn ">Ir Arriba</button>
								
						</div>
					</div>
					<br /> <br />

				</fieldset>

			</form>
			<!-- /basic inputs -->

		</div>
	</div>
	<!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/completarDDJJ.js"></script>

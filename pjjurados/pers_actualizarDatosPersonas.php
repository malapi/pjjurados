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
				<li><a href="index.html">Sorteo</a></li>
				<li><a href="forms.html">Personas</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->

		<!-- Page header -->
		<div class="page-header">
			<div class="page-title">
				<h5>Actualizar Datos de Personas</h5>
			</div>
		</div>
		<!-- /page header -->

		<div class="span12">
			<form id="formModificarPersona" method="POST">
				<fieldset>
					<!-- General form elements -->
					<div class="widget row-fluid">
						<input type="hidden" name="oper" id="oper" value="modificar" /> 
						<input type="hidden" name="hfIdPer" id="hfIdPer"
							value="<?php echo $idP; ?>" />
							
						<input type="hidden" name="hfIdLote" id="hfIdLote"
							value="<?php echo $idL; ?>" />	
						<div class="navbar">
							<div class="navbar-inner">
								<h6>Datos Personales</h6>
							</div>
						</div>
						<div class="well">
							<div class="row-fluid">
								<div class="span6">
									<div class="control-group">
										<label class="control-label">Apellido:</label>
										<div class="controls">
											<input type="text" id="txtApellido" name="txtApellido"
												class="validate[required] span12" />
										</div>
									</div>
								</div>

								<div class="span6">
									<div class="control-group">
										<label class="control-label">Nombre:</label>
										<div class="controls">
											<input type="text" id="txtNombre" name="txtNombre"
												class="validate[required] span12" />
										</div>
									</div>
								</div>
							</div>

							<div class="row-fluid">
								<div class="span3">
									<div class="control-group">
										<label class="control-label">Tipo Documento:</label>
										<div class="controls">
											<select name="cbTipoDoc" id="cbTipoDoc" class="validate[required] span12"
												data-prompt-position="topLeft:-1,-5">
												<option value="">...</option>
											</select>
										</div>
									</div>
								</div>
								<div class="span3">
									<div class="control-group">
										<label class="control-label">Nro Documento:</label>
										<div class="controls">
											<input type="text" id="txtNroDoc" name="txtNroDoc"
												class="validate[required] span12" />
										</div>
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label">Fecha Nacimiento:</label>
										<div class="controls">
											<input type="text" id="txtFechaNac" name="txtFechaNac"
												class="span10" placeholder="99/99/9999" />
										</div>
									</div>
								</div>
							</div>

							<div class="row-fluid">
								<div class="span3">
									<div class="control-group">
										<label class="control-label">Sexo:</label>
										<div class="controls">
											<select name="cbSexo" id="cbSexo" class="validate[required] span12"
												data-prompt-position="topLeft:-1,-5">
												<option value="">...</option>
												<option value="F">F</option>
												<option value="M">M</option>
											</select>
										</div>
									</div>
								</div>
								<div class="span3">
									<div class="control-group">
										<label class="control-label">Nro CUIL:</label>
										<div class="controls">
											<input type="text" id="txtCUIL" name="txtCUIL" class="span12" />
										</div>
									</div>
								</div>
								<div class="span6">
									<div class="control-group">
										<label class="control-label">Localidad:</label>
										<div class="controls">
											<select name="cbLocalidad" id="cbLocalidad" class="validate[required] span12"
												data-prompt-position="topLeft:-1,-5">
												<option value="">...</option>
											</select>
										</div>
									</div>
								</div>

							</div>							
							<div class="row-fluid">
								<div class="span12">
									<div class="control-group">
										<label class="control-label">Domicilio:</label>
										<div class="controls">
											<input type="text" id="txtDomicilio" name="txtDomicilio"
												class="validate[required] span12" />
										</div>
									</div>
								</div>
							</div>

							<div class="row-fluid">
								<div class="span6">
									<div class="control-group">
										<label class="control-label">Profesi&oacute;n:</label>
										<div class="controls">
											<input type="text" id="txtProfesion" name="txtProfesion"
												class="span12" />
										</div>
									</div>
								</div>

								<div class="span6">
									<div class="control-group">
										<label class="control-label">Ocupaci&oacute;n:</label>
										<div class="controls">
											<input type="text" id="txtOcupacion" name="txtOcupacion"
												class="span12" />
										</div>
									</div>
								</div>
							</div>

							<div class="row-fluid">
								<div class="span3">
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
								<div class="span3">
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
								<div class="span6">
									<div class="control-group">
										<label class="control-label">Email:</label>
										<div class="controls">
											<input type="text" id="txtEmail" name="txtEmail"
												class="span12" />
										</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span6">
									<div class="control-group">
										<label class="control-label">Nacionalidad:</label>
										<div class="controls">
											<input type="text" id="txtNacionalidad" name="txtNacionalidad"
												class="span12" />
										</div>
									</div>
								</div>
								<div class="span6">
									<div class="control-group">
										<label class="control-label">Lugar de Nacimiento:</label>
										<div class="controls">
											<input type="text" id="txtLugarNac" name="txtLugarNac"
												class="span12" />
										</div>
									</div>
								</div>
							</div>


							<div id="respuesta"></div>
							<div class="form-actions align-right">
								<button id="btnActualizarPersona" type="button"
									class="btn btn-info">Actualizar</button>
								<a id="btncancel" href="lot_personasXLote.php?id=<?php echo $idL; ?>" class="btn btn-default">Cancelar</a>
							</div>



						</div>
						<!-- /well -->
					</div>
					<!-- /general form elements -->

				</fieldset>

			</form>
			<!-- /basic inputs -->

		</div>
	</div>
	<!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/actualizarPersona.js"></script>
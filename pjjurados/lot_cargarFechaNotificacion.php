<?php
include ("header.php");
$id = "";
if ($_GET) {
	$id = $_GET ["id"];
}
?>

<!-- Content -->
<div id="content">
	<!-- Content wrapper -->
	<div class="wrapper">
		<!-- Breadcrumbs line -->
		<div class="crumbs">
			<ul id="breadcrumbs" class="breadcrumb">
				<li><a href="#">Nominas</a></li>
				<li><a href="#">Distribuci&oacute;n</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->

		<!-- Page header -->
		<div class="page-header">
			<div class="page-title">
				<h5>Asignar Centros de Distribuci&oacute;n</h5>
				<span></span>
			</div>
		</div>
		<!-- /page header -->

		<div class="span12" id="divNueva">
			<form id="formBuscarCentro" method="POST">
				<fieldset>
					<!-- General form elements -->
					<div class="widget row-fluid">
						<input type="hidden" name="oper" id="oper" value="buscar" />
						<input type="hidden" name="hfIdSorteo" id="hfIdSorteo"
							value="<?php echo $id; ?>" />
						<div class="navbar">
							<div class="navbar-inner">
								<h6>Sorteo</h6>
							</div>
						</div>
						<div class="well">
							<div class="row-fluid">
								<div class="control-group">
									<label class="control-label">Descripci&oacute;n:</label>
									<div class="controls">
										<input type="text" id="txtDescripcion" name="txtDescripcion"
											class="validate[required] span12" />
									</div>
								</div>
							</div>

							<div class="row-fluid">
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

							<div class="row-fluid">
								<div class="control-group">
									<label class="control-label">Centro Distribuci&oacute;n:</label>
									<div class="controls">
										<select name="cbCentro" id="cbCentro"
											class="validate[required] span12"
											data-prompt-position="topLeft:-1,-5">
											<option value="">...</option>
										</select>
									</div>
								</div>
							</div>
							<div class="widget">
								<div class='navbar'>
									<div class='navbar-inner'>
										<h6>Persona por Centro de Distribuci&oacute;n</h6>
									</div>
								</div>
								<div id="listadoDatos" class='table-overflow'
									style="max-height: 500px; overflow: auto;"></div>
							</div>

						</div>
					</div>



					<!-- /general form elements -->
				</fieldset>
			</form>
			<!-- /basic inputs -->
		</div>

		<div id="mdlNotificacion" class="modal" style="display: none;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Cargar Notificaci&oacute;n</h3>
			</div>
			<div class="modal-body">
				<form id="formCargarNot" method="POST">
				<input type="hidden" name="hfIdLP" id="hfIdLP" />
				<input type="hidden" name="oper" id="oper" value="cargaNotificacion" />
				<div class="row-fluid">
					<div class="span4">
						<div class="control-group">
							<label class="control-label">Fecha Notificaci&oacute;n:</label>
							<div class="controls">
								<input type="text" class="datepicker validate[required] span8"
									data-mask="99/99/9999" id="txtNotificacion"
									data-prompt-position="topLeft:-1,-5" name="txtNotificacion"
									placeholder="99/99/9999">
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="control-group">
							<label class="control-label">Observaciones:</label>
							<div class="controls">
								<textarea id="txtObservacionesEst" name="txtObservacionesEst"
									class="span12"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
					<span id="respuestaNot"></span>
					</div>
				</div>
				</form>	
			</div>
			<div class="modal-footer">
				<a id="btnGuardarNotificacion" href="#" class="btn btn-primary">Guardar</a> 
				<a id="btnClose" href="#" href="#"	class="btn">Cerrar</a>
			</div>
		</div>

	</div>
	<!-- /content wrapper -->




</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/personasCargarNotificacion.js"></script>



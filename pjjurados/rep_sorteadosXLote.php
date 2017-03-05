<?php
include ("header.php");
?>

<!-- Content -->
<div id="content">
	<!-- Content wrapper -->
	<div class="wrapper">
		<!-- Breadcrumbs line -->
		<div class="crumbs">
			<ul id="breadcrumbs" class="breadcrumb">
				<li><a href="#">Lotes</a></li>
				<li><a href="#">Personas Por Lote</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->

		<!-- Page header -->
		<div class="page-header">
			<div class="page-title">
				<h5>Personas Por Lote</h5>
				<span></span>
			</div>
		</div>
		<!-- /page header -->

		

		<div class="widget">
			<div class='navbar'>
				<div class='navbar-inner'>
					<h6>Persona incluidas en el Lote</h6>
				</div>
			</div>
			<form id="formBuscarPers" method="POST">
				<fieldset>
					<!-- General form elements -->
					<input type="hidden" name="oper" id="oper" value="verPersonas" />
					<input type="hidden" name="solover" id="solover" value="1" />
					<div class="widget row-fluid">	
						<div class="well">
						<div class="row-fluid">
						<div class="span12">
								<div class="control-group">
									<label class="control-label">Lote:</label>
									<div class="controls">
										<select name="cbLote" id="cbLote" class="validate[required] span12" data-prompt-position="topLeft:-1,-5" >
                                                <option value="">...</option>
                                            </select>
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
								<div class="span2">
								<div class="control-group">
									<label class="control-label">Tipo Documento:</label>
									<div class="controls">
									<select name="cbTipoDocB" id="cbTipoDocB" class="span12" 
									data-prompt-position="topLeft:-1,-5" >
                                                <option value="">...</option>
                                            </select>
									</div>
								</div>
								</div>								
								<div class="span4">
								<div class="control-group">
									<label class="control-label">Nro Documento:</label>
									<div class="controls">
										<input type="text" id="txtNroDocB" name="txtNroDocB"
											class="span12" />
									</div>
								</div>
								</div>
							</div>
						
							<div class="row-fluid">
								<div class="span6">
								<div class="control-group">
									<label class="control-label">Apellido:</label>
									<div class="controls">
										<input type="text" id="txtApellidoB" name="txtApellidoB"
											class="span12" />
									</div>
								</div>
								</div>
								
								<div class="span6">
								<div class="control-group">
									<label class="control-label">Nombre:</label>
									<div class="controls">
										<input type="text" id="txtNombreB" name="txtNombreB"
											class="span12" />
									</div>
								</div>
								</div>
							</div>
							
							<div class="row-fluid">
								<div class="span6">
								<div class="control-group">
									<label class="control-label">Estado:</label>
									<div class="controls">
										<select name="cbResultado" id="cbResultado" class="span12"
											data-prompt-position="topLeft:-1,-5">
											<option value="">...</option>
											<option value="1">Notificaci&oacute;n Generada</option>
											<option value="2">Notificaci&oacute;n Enviada</option>
											<option value="6">Notificaci&oacute;n Recibida</option>
											<option value="4">Sin Notificaci&oacute;n</option>
											<option value="5">Se Notific&oacute; y NO se recibi&oacute; la Declaraci&oacute;n Jurada</option>
											<option value="7">Se envi&oacute; Intimaci&oacute;n</option>	
											<option value="3">Se recibi&oacute; la Declaraci&oacute;n
												Jurada</option>
										</select>
									</div>
								</div>
								</div>
								<div class="span6">
								<div class="control-group"><br />
								<label class="radio inline">
									<input name="ckAptos" id="ckApto" value="1" type="radio"> Listar Solo Aptos									
								</label>
								<label class="radio inline">
								<input name="ckAptos" id="ckNoApto" value="0" type="radio"> Listar Solo No Aptos
								</label>
								</div>
								</div>							
								
							</div>
							<div class="row-fluid">
								<div class="span12" id="respuesta"></div>
							</div>	
							<div class="row-fluid">
								<div class="form-actions align-right">
									<button id="btnBuscarPersona" type="button" class="btn btn-info">Buscar</button>
									<button id="btnTodas" type="button" class="btn">Todos</button>
									<button id="btnExportar" type="button" class="btn">Exportar Excel</button>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>

			<div id="listadoDatos" class='table-overflow'></div>
		</div>

	</div>
	<!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/rep_personasXLote.js"></script>


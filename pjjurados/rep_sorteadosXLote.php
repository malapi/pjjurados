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
				<li><a href="#">Personas por Lote</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->

		<!-- Page header -->
		<div class="page-header">
			<div class="page-title">
				<h5>Persona incluidas en el Lote</h5>
			</div>
		</div>
		<!-- /page header -->

		

		<div class="widget">
			<div class="well">
			<form id="formBuscarPers" class="form-inline" method="POST">
					<input type="hidden" name="oper" id="oper" value="verPersonas" />
					<input type="hidden" name="solover" id="solover" value="1" />
					<label class="mr-sm-2">Lote:
					<select style='width:auto;' class="validate[required]" name="cbLote" id="cbLote"  data-prompt-position="topLeft:-1,-5" >
                                                <option value="">...</option>
                                            </select>
                                            </label>
					<label class="mr-sm-2">Tipo Documento:
					<select name="cbTipoDocB" id="cbTipoDocB" style='width:auto;' data-prompt-position="topLeft:-1,-5" >
                                                <option value="">...</option>
                                            </select>
                                            </label>
					<label class="mr-sm-2">Nro Documento:
					<input type="text" id="txtNroDocB" name="txtNroDocB"
											class="mb-2 mr-sm-2 mb-sm-0" /></label>
					<label class="mr-sm-2">Apellido:
					<input type="text" id="txtApellidoB" name="txtApellidoB" class="mb-2 mr-sm-2 mb-sm-0" /></label>
					<label class="mr-sm-2">Nombre:
					<input type="text" id="txtNombreB" name="txtNombreB" class="mb-2 mr-sm-2 mb-sm-0" /></label>
					<label class="mr-sm-2">Estado:
					<select name="cbResultado" id="cbResultado" class="mb-2 mr-sm-2 mb-sm-0"
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
										</select></label>
					<label class="radio inline">
									<input name="ckAptos" id="ckApto" value="1" type="radio"> Listar Solo Aptos									
								</label>
								<label class="radio inline">
								<input name="ckAptos" id="ckNoApto" value="0" type="radio"> Listar Solo No Aptos
								</label>
					<div class="span12" id="respuesta"></div>
					<button id="btnBuscarPersona" type="button" class="btn btn-info">Buscar</button>
					<button id="btnTodas" type="button" class="btn">Todos</button>
					<button id="btnExportar" type="button" class="btn">Exportar Excel</button>
			</form>

			<div id="listadoDatos" class='table-overflow'></div>
		</div>

	</div>
	<!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/rep_personasXLote.js"></script>


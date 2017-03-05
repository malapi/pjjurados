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
				<li><a href="#">Lotes</a></li>
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
			<form id="formAsociarCentro" method="POST">
				<fieldset>
					<!-- General form elements -->
					<div class="widget row-fluid">
						<input type="hidden" name="oper" id="oper" value="asociarCentro" /> <input
							type="hidden" name="hfIdSorteo" id="hfIdSorteo"
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
										<select name="cbLocalidad" id="cbLocalidad" class="validate[required] span12"
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
									<select name="cbCentro" id="cbCentro" class="validate[required] span12"
												data-prompt-position="topLeft:-1,-5">
												<option value="">...</option>
											</select>
									</div>
								</div>
							</div>
							
							<div class="widget">
								<div class='navbar'>
									<div class='navbar-inner'>
										<h6>Persona por Localidad</h6>
									
									<ul class="navbar-icons">
	                                    <li><a id="btnSelectTodo" href="#" class="tip" title="Seleccionar Todos"><i class="icon-plus"></i></a></li>
	                                    <li><a id="btnSelectNinguno" href="#" class="tip" title="No Seleccionar Ninguno"><i class="ico-minus"></i></a></li>
	                                    <li><a id="btnSelectInvertir" href="#" class="tip" title="Invertir Seleccion"><i class="ico-random"></i></a></li>
	                                </ul>
	                                </div>
								</div>								
								<div id="listadoDatos" class='table-overflow' style="max-height: 500px;overflow: auto;"></div>
							</div>
							
							
							<div id="respuesta"></div>
							<div class="form-actions align-right">
								<button id="btnAsociarPersonas" type="button"
									class="btn btn-info">Asociar</button>
							</div>
						</div>
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
<script type="text/javascript" src="js/personasXLoteYLocalidad.js"></script>



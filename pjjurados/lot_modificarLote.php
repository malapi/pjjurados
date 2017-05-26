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
				<li><a href="#">Modificar Nomina</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->

		<!-- Page header -->
		<div class="page-header">
			<div class="page-title">
				<h5>Modificar Sorteo</h5>
				<span></span>
			</div>
		</div>
		<!-- /page header -->

		<div class="span12" id="divNueva">
			<form id="formModificarSorteo" method="POST"
				enctype="multipart/form-data">
				<fieldset>
					<!-- General form elements -->
					<div class="widget row-fluid">
						<input type="hidden" name="oper" id="oper" value="modificar" /> <input
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
								<div class="span4">
									<div class="control-group">
										<label class="control-label">Fecha Inicio:</label>
										<div class="controls">
											<input type="text" class="span10"
												data-mask="99/99/9999" id="txtFechaDesde"
												name="txtFechaDesde" placeholder="99/99/9999">
										</div>
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label">Fecha Finalizaci&oacute;n:</label>
										<div class="controls">
											<input type="text" class="span10"
												data-mask="99/99/9999" id="txtFechaHasta"
												name="txtFechaHasta" placeholder="99/99/9999" />
										</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="control-group">
									<label class="control-label">Observaciones:</label>
									<div class="controls">
										<textarea id="txtObs" name="txtObs" class="span12" rows="2"></textarea>
									</div>
								</div>
							</div>
							<div class="row-fluid">    
						         <div class="control-group">
						        	<div id="container">
									    <div id="upload" class="btn btn-primary"><span><i class="ico-file"> </i> Adjuntar Archivos </span></div>
										<span id="status" ></span>
										<table id="files" ></table>		
										<span id="resultado" ></span>
									</div>		         
						         </div>
						      </div>   
							<div id="respuestaM"></div>
							<div class="form-actions align-right">
								<button id="btnModifSorteo" type="button"
									class="btn btn-info">Actualizar</button>
								<a id="btncancel" href="lot_listadoSorteos.php" class="btn btn-default">Cancelar</a>
							</div>
							
							
						</div>
					</div>
					<!-- /general form elements -->
				</fieldset>
			</form>
			<!-- /basic inputs -->
		</div>

		<div class="widget">
			<div class='navbar'>
				<div class='navbar-inner'>
					<h6>Asociar Plantilla de Declaraci&oacute;n Jurada</h6>
				</div>
			</div>
			<form id="formAsociarPlantillaSorteo" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" name="oper" id="oper" value="asocPlantilla" />
				<input type="hidden" name="hfIdSorteoP" id="hfIdSorteoP"
							value="<?php echo $id; ?>" />
				<fieldset>
					<!-- General form elements -->
					<div class="widget row-fluid">	
						<div class="well">
							<div class="row-fluid">
								<div class="span12">
								 <div class="control-group">
                                     <label class="control-label">Plantilla:</label>
                                      <div class="controls">
                                          <select name="cbPlantillas" id="cbPlantillas" class="validate[required] span12" data-prompt-position="topLeft:-1,-5">
                                              <option value="">...</option>
                                          </select>
                                      </div>
                                </div>
								</div>
							</div>
							<div id="respuestaAsoc"></div>
							<div class="form-actions align-right">
								<button id="btnAsocPlantilla" type="button"
									class="btn btn-info">Asociar Plantilla</button>
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
<script type="text/javascript" src="js/plugins/ajaxupload.3.5.js"></script>
<script type="text/javascript" src="js/modificarLote.js"></script>

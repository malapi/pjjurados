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
		         <li><a href="#">Generar Intimaci&oacute;n</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->

		<!-- Page header -->
		<div class="page-header">
			<div class="page-title">
				<h5>Generar Intimaci&oacute;n</h5>
				<span></span>
			</div>
		</div>
		<!-- /page header -->

		<div class="widget">
			<form id="formBuscarPers" method="POST">
				<fieldset>
					<!-- General form elements -->
					<input type="hidden" name="oper" id="oper" value="GenerarPersXIntimacion" />
					<input type="hidden" name="hfIdLote" id="hfIdLote" value="<?php echo $idL?>" />
					<input type="hidden" name="hfArchiCedula" id="hfArchiCedula"  value="" />
					<input type="hidden" name="hfIdPersona" id="hfIdPersona" value="<?php echo $idP?>" />
					<div class="widget row-fluid">	
						<div class="well">
						<div class="row-fluid">
								<div class="span4"> <label id="txtPersona" name="txtPersona"></label> </div>
							</div>	
							<div class="row-fluid">
								<div class="span12">
								 <div class="control-group">
                                        <label class="control-label">Plantilla Para C&eacute;dula Intimaci&oacute;n:</label>
                                        <div class="controls" >
                                            <div id="upload" class="btn btn-primary"><span><i class="ico-file"> </i> Adjuntar Plantilla </span></div>
											<span id="status" ></span>	
											<span id="resultado" ></span>                                            
                                        </div>
                                  </div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span12" id="respuesta"></div>
								<div class="span12" id="respuestaInt"></div>
							</div>	
						<div class="row-fluid">
						<div class="form-actions align-right">
							<button id="btnGenerarIntimacioPersona" type="button" class="btn btn-info" >Generar Intimaci&oacute;n </button>
						</div>
					</div>
						</div>
					</div>
				</fieldset>
			</form>
			
				
				
		</div>

	</div>
	<!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/plugins/ajaxupload.3.5.js"></script>
<script type="text/javascript" src="js/personasParaIntimacion.js"></script>

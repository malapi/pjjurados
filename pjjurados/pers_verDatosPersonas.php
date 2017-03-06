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
		        <li><a href="#">Ver Datos Declaraci&oacute;n Jurada</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->
		<div class="page-header">
			<div class="page-title">
				<h5>Datos Declaraci&oacute;n Jurada</h5>
			</div>
		</div>
		<!-- /page header -->
		  <form id="formNuevaPregunta" method="POST">
		  	<input type="hidden" name="oper" id="oper" value="cargarDatosPersonaHTML" />
		  	<input type="hidden" name="hfIdPer" id="hfIdPer" value="<?php echo $idP?>" />
		  	<input type="hidden" name="hfIdLote" id="hfIdLote" value="<?php echo $idL?>" />
		  	
		  </form>
		<div id="verInformacionDDJJ" class='table-overflow'></div>

		</div>
	</div>
	<!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/verDatosCompletosPersona.js"></script>

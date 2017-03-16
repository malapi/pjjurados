<?php include_once("configuracion.php");
include("header.php"); 
$datos = data_submitted();
//print_object($datos);
?>

<!-- Content -->
<div id="content">
	<!-- Content wrapper -->
	<div class="wrapper">
		<!-- Breadcrumbs line -->
		<div class="crumbs">
			<ul id="breadcrumbs" class="breadcrumb">
				<li><a href="#">Sorteos</a></li>
		        <li><a href="#">Ficha por Persona</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->
		<div class="page-header">
			<div class="page-title">
				<h5>Ver Información </h5>
			</div>
		</div>
		<!-- /page header -->
		  <form id="formVerDatosPersona" method="POST">
		  	<input type="hidden" name="liMenu" id="liMenu" value="liSorteojuicio" />
			<input type="hidden" name="itemMenu" id="itemMenu" value="opSorteoJuicio2" />
			<input type="hidden" name="accion" id="accion" value="consultar" />
		  	<input type="hidden" name="idPersona" id="idPersona" value="" />
		  	
		  	
		  </form>
		<div id="verInformacion" class='table-overflow'></div>

		</div>
	</div>
	<!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/persona_verDatosPersonas.js"></script>
<script type="text/javascript">
var $_POST = <?php echo json_encode($datos); ?>;
if($_POST != ""){
	cargarFormulario($_POST);
}
</script>
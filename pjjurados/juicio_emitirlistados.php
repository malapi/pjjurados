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
		                <li><a href="#">Emitir Listados</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Emitir Listados</h5>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12" id="divNueva">        
	    		<div id="divformEmitirListados" name="divformEmitirListados">
	            <form id="formEmitirListados" method="POST" >
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="liMenu" id="liMenu" value="liSorteojuicio" />
							<input type="hidden" name="itemMenu" id="itemMenu" value="opSorteoJuicio1" />
							<input type="hidden" name="accion" id="accion" value="listados" />
							<input  type="hidden"  name="idjuicio" id="idjuicio" value="0" ></input>
							<div class="well">	
						    
			
			 <div class="row-fluid">  
							<div class="control-group">
								<div id="respuesta"></div>
								</div> 
								</div>                         
						        <div class="row-fluid">
						         <div class="form-actions align-right">
	                                <button id="btn_formEmitirListados_Generar" type="button" class="btn btn-info">Generar</button>
	                                <button id="btnCancel" type="button" class="btn">Cerrar</button>
	                            </div>
	                            </div>
						     </div>
						</div><!-- /general form elements -->						
					 
 					
				</form>
				</div>
				<!-- /basic inputs -->
				<div id="listadoDatos" class="widget">
				
				</div>

		
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/juicio_emitirlistados.js"></script>
<script type="text/javascript">
var $_POST = <?php echo json_encode($datos); ?>;
if($_POST != ""){
	cargarFormulario($_POST);
}
</script>




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
		                <li><a href="#">Jurado Definitivo</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Jurado Definitivo</h5>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12" id="divNueva">        
	    		<div id="divformJuradoDefinitivo" name="divformJuradoDefinitivo">
	            <form id="formJuradoDefinitivo" method="POST" >
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="liMenu" id="liMenu" value="liSorteojuicio" />
							<input type="hidden" name="itemMenu" id="itemMenu" value="opSorteoJuicio1" />
							<input type="hidden" name="accion" id="accion" value="juradoDefinitivo" />
							<input  type="hidden"  name="idjuicio" id="idjuicio" value="0" ></input>
<input  type="hidden"  name="psnrojurado" id="psnrojurado" value="is not null" ></input>
							<div class="well">	
						    
			<div class="form-group">
					<label class="col-sm-2 control-label" for="selmujeres" > Cantidad de Mujeres:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="selmujeres" id="selmujeres" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="selhombres" >Cantidad de Hombres: </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="selhombres" id="selhombres" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="idLote" >Lote: </label>
					<div class="col-sm-4">
					<div class="ui-widget">
						<input  class="ui-autocomplete-input form-control" name="idLote" id="idLote"
						data-options='[{clavetabla:"idLote",campofiltrar:"Descripcion",campotablamostrar:"Descripcion",control:"lotes"}]'></input>
					</div>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="seleccionprevia" >Sorteados en otra seleccci&oacute;n?: </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="checkbox" name="seleccionprevia" id="seleccionprevia" data-options="required:true"></input>
					</div>
					</div>
			 <div class="row-fluid">  
							<div class="control-group">
								<div id="respuesta"></div>
								</div> 
								</div>                         
						        <div class="row-fluid">
						         <div class="form-actions align-right">
	                                <button id="btnSortearJuicio" type="button" class="btn btn-info">Sortear</button>
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
<script type="text/javascript" src="js/juicio_juradodefinitivo.js"></script>
<script type="text/javascript">
var $_POST = <?php echo json_encode($datos); ?>;
if($_POST != ""){
	cargarFormulario($_POST);
}
</script>




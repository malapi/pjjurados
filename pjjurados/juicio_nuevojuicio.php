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
		                <li><a href="#">Nuevo Sorteo para Juicio</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Nuevo Sorteo para Juicio</h5>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12" id="divNueva">        
	            <form id="formNuevoSorteo" method="POST" enctype="multipart/form-data">
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="liMenu" id="liMenu" value="liSorteojuicio" />
							<input type="hidden" name="itemMenu" id="itemMenu" value="opSorteoJuicio1" />
							<input type="hidden" name="accion" id="accion" value="nuevo" />
							<input  type="hidden"  name="idjuicio" id="idjuicio" value="0" ></input>
							<div class="well">	
			<div class="row">
			<div class="col">
				<div class="form-group">
						<label class="control-label" for="jufechainicio" > Fecha Inicio del Juicio:  </label>
						<div class="col-sm-4">
						<input class="form-control" type="date" name="jufechainicio" id="jufechainicio"></input>
						</div>
						</div>
				</div>
				<div class="col">
				<div class="form-group">
					<label class="control-label" for="jufechafin" > Fecha Final del Juicio:  </label>
					<div class="col-sm-4">
					<input class="form-control" type="date" name="jufechafin" id="jufechafin"></input>
					</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
				<div class="form-group">
					<label class="control-label" for="jufechaaudiencia" > Fecha Audiencia:  </label>
					<div class="col-sm-4">
					<input class="form-control" type="date" name="jufechaaudiencia" id="jufechaaudiencia"></input>
					</div>
					</div>
				</div>
				<div class="col">
				<div class="form-group">
					<label class="control-label" for="judireccionaudiencia" >Dir. Audiencia:  </label>
					<div class="col-sm-4">
					<input class="form-control" type="text" name="judireccionaudiencia" id="judireccionaudiencia" ></input>
					</div>
					</div>
				</div>
			</div>				   
			<div class="row">
				<div class="col">
				<div class="form-group">
					<label class="control-label" for="judescripcion" > Descripci&oacute;n:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="judescripcion" id="judescripcion" data-options="required:true"></input>
					</div>
					</div>
				</div>
				<div class="col">
				<div class="form-group">
					<label class="control-label" for="junroconvocatoria" > Nro.Convocatoria:  </label>
					<div class="col-sm-4">
					<input class="form-control" type="text" name="junroconvocatoria" id="junroconvocatoria" ></input>
					</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
				<div class="form-group">
					<label class="control-label" for="jujueces" > Jueces:  </label>
					<div class="col-sm-4">
					<input class="form-control" type="text" name="jujueces" id="jujueces" ></input>
					</div>
					</div>
				</div>
				<div class="col">
				<div class="form-group">
					<label class="control-label" for="juobservacion" > Observaci&oacute;n:  </label>
					<div class="col-sm-4">
					<textarea class="form-control" type="text" name="juobservacion" id="juobservacion" ></textarea>
					</div>
					</div>
				</div>
			</div>
			
			
			
			
			
			
						    
						       <div class="row-fluid">  
								<div class="control-group">
								<div id="respuesta"></div>
								</div> 
								</div>                         
						        <div class="row-fluid">
						         <div class="form-actions align-right">
	                                <button id="btnGuardarJuicio" type="button" class="btn btn-info">Guardar</button>
	                                <button id="btnCancel" type="button" class="btn">Cerrar</button>
	                            </div>
	                            </div>
						     </div>
						</div><!-- /general form elements -->						
					 
 					
				</form>
				<!-- /basic inputs -->
				<div id="listadoDatos" class="widget">
				
				</div>

		
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/juicio_nuevojuicio.js"></script>
<script type="text/javascript">
var $_POST = <?php echo json_encode($datos); ?>;
if($_POST != ""){
	cargarFormulario($_POST);
}
</script>




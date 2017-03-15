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
		                <li><a href="#">Audiencia de Selecci&oacute;n</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Audiencia de Selecci&oacute;n</h5>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12" id="divNueva">        
	    		<div id="divformAudiencia" name="divformAudiencia">
	            <form id="formAudiencia" method="POST" class="form-inline">
				<!-- General form elements -->
							<input type="hidden" name="liMenu" id="liMenu" value="liSorteojuicio" />
							<input type="hidden" name="itemMenu" id="itemMenu" value="opSorteoJuicio1" />
							<input type="hidden" name="accion" id="accion" value="audiencia" />
							<input  type="hidden"  name="idjuicio" id="idjuicio" value="0" ></input>
							<input  type="hidden"  name="idPersona" id="idPersona" value="0" ></input>
							<input  type="hidden"  name="idseleccion" id="idseleccion" value="0" ></input>
			<div class="widget row-fluid">
			<div class="well">	
			   <div class="row">
			   <div class="col">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="psasiste" > Asiste?:  </label>
					<div class="form-check form-check-inline">
					<input  type="radio" name="psasiste" id="psasiste" value='1' checked="checked" ><span>Si</span></input>
					<input  type="radio" name="psasiste" id="psasiste" value='0'><span>No</span></input>
					
					</div>
					</div>
				</div>
				<div class="col">
					<div class="form-group">
					<label class="col-sm-2 control-label" for="psasisteobservacion" > Asis.Obs.:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psasisteobservacion" id="psasisteobservacion" data-options="required:true"></input>
					</div>
					</div>
				</div>
				</div>
			<div class="row">
			<div class="col">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="idpersonaseleccionresultadotipos" > Resultado Seleccion:  </label>
						<div class="ui-widget">
						<input  class="ui-autocomplete-input form-control" name="idpersonaseleccionresultadotipos" id="idpersonaseleccionresultadotipos"
						data-options='[{clavetabla:"idpersonaseleccionresultadotipos",campofiltrar:"psrtdescripcion",campotablamostrar:"textocombo",control:"personaseleccionresultadotipos"}]'></input>
						
						</div>
						</div>
				</div>
				<div class="col">
				</div>
				</div>
			 <div class="row">
			   <div class="col">
			   <div class="form-group">
					<label class="col-sm-2 control-label" for="psexcusacion" > Excusaci&oacute;n:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psexcusacion" id="psexcusacion" data-options="required:true"></input>
					</div>
					</div>
				</div>
				 <div class="col">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="psfechaexcusacion" > Fecha Excusaci&oacute;n:  </label>
					<div class="col-sm-4">
					<input class="datepicker form-control" type="text" name="psfechaexcusacion" id="psfechaexcusacion" data-options="required:true" placeholder="99/99/9999"></input>
					</div>
					</div>
			   
			
				</div>
			</div>
			<div class="row">
			   <div class="col">
			   <div class="form-group">
						<label class="col-sm-2 control-label" for="idtiposeleccionrecusacion" > Recusaci&oacute;n:  </label>
						<div class="ui-widget">
						<input class="ui-autocomplete-input form-control" type="text" name="idtiposeleccionrecusacion" id="idtiposeleccionrecusacion"
						data-options='[{clavetabla:"idtiposeleccionrecusacion",campofiltrar:"trsdescripcion",campotablamostrar:"textocombo",control:"tiposeleccionrecusacion"}]'></input>
						</div>
						</div>
			   </div>
			   <div class="col">
			   <div class="form-group">
					<label class="col-sm-2 control-label" for="psrecusacioncausa" >Recusaci&oacute;n Causa:</label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psrecusacioncausa" id="psrecusacioncausa" data-options="required:true"></input>
					</div>
					</div>
			   </div>
			 </div>
				<div class="row">
			   	<div class="col">
			   	<div class="form-group">
					<label class="col-sm-2 control-label" for="pscaracter" > Designaci&oacute;n Efectiva:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="pscaracter" id="pscaracter" ></input>
					</div>
					</div>
			   	</div>
			   <div class="col">
			   <div class="form-group">
					<label class="col-sm-2 control-label" for="psnrojurado" > Nro. Jurado:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psnrojurado" id="psnrojurado" data-options="required:true"></input>
					</div>
					</div>
			   </div>
			   </div>
			<div class="row">
			   	<div class="col">
			   	<div class="form-group">
					<label class="col-sm-2 control-label" for="psobservacion" > No Designaciones:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psobservacion" id="psobservacion" data-options="required:true"></input>
					</div>
					</div>
			   	</div>
			   	<div class="col">
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
					
				</div> <!--<div class="well">	  -->	
				</div><!-- <div class="widget row-fluid">  -->						
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
<script type="text/javascript" src="js/juicio_audienciaseleccion.js"></script>
<script type="text/javascript">
var $_POST = <?php echo json_encode($datos); ?>;
if($_POST != ""){
	cargarFormulario($_POST);
}
</script>




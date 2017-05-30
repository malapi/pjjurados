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
							<input type="hidden" name="where" id="accion" value="notificacion" />
							<input  type="hidden"  name="idjuicio" id="idjuicio" value="0" ></input>
							<input  type="hidden"  name="psnrojurado" id="psnrojurado" value="is not null" ></input>
							<div class="well">	
						    
						    <div id="mdlSeleccionDocumentos">
			<form id="formCargarDocumento" method="POST" class="form-inline">
				 <input  type="hidden"  name="idpersonaselecciondocumento" id="idpersonaselecciondocumento" value="0" ></input>
				 <input  type="hidden"  name="idseleccion" id="idseleccion" value="0" ></input>
				 <input  type="hidden"  name="idPersona" id="idPersona" value="0" ></input>
				 <input  type="hidden"  name="psdarchivo" id="psdarchivo" value="" ></input>
				 <input  type="hidden" name="personaselecciondocumento_accion" id="personaselecciondocumento_accion" value="guardarDocumento"></input>
			<div class="row">
			<div class="col">
					<label class="control-label" for="psdfechafin" >Fecha Vto.Documento:  </label>
					<div class="col-sm-4">
					<input class="form-control" type="date" name="psdfechafin" id="psdfechafin" placeholder="99/99/9999" ></input>
					</div>
					</div>
			<div class="col">
					<label class="control-label" for="psddescripcion" >Obs.:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psddescripcion" id="psddescripcion" ></input>
					</div>
					</div>
			<div class="col">
						<label class="control-label" for="idpersonaselecciondocumentotipos" >Tipo Documento:</label>
						<div class="ui-widget">
						<input class="ui-autocomplete-input form-control" type="text" name="idpersonaselecciondocumentotipos" id="idpersonaselecciondocumentotipos"
						data-options='[{clavetabla:"idpersonaselecciondocumentotipos",campofiltrar:"psdtdescripcion",campotablamostrar:"textocombo",control:"personaselecciondocumentotipos"}]'></input>
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
				<div class="row-fluid">
						         <div class="form-actions align-right">
	                                <button id="btnGuardarDocumento" type="button" class="btn btn-info">Guardar Documento</button>
	                            </div>
	                    </div>
				<div class="row-fluid">
					<div class="span12">
					<span id="respuestaDocumento"></span>
					</div>
				</div>
				</form>	
				<div id="listadoDatosDocumentos" class="widget">
			</div>
			</div>  
						    
						    
						    
			
			 <div class="row-fluid">  
							<div class="control-group">
								<div id="respuesta"></div>
								</div> 
								</div> 
								
								
								                        
						        <div class="row-fluid">
						         <div class="form-actions align-right">
	                                <button id="btnGenerar" type="button" class="btn btn-info">Generar</button>
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




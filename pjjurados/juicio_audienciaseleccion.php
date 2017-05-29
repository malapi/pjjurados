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
					<input  type="radio" name="psasiste" id="psasiste" value='2' checked="checked" ><span>Si</span></input>
					<input  type="radio" name="psasiste" id="psasiste" value='1'><span>No</span></input>
					
					</div>
					</div>
				</div>
				<div class="col">
					<div class="form-group">
					<label class="col-sm-2 control-label" for="psasisteobservacion" > Asis.Obs.:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psasisteobservacion" id="psasisteobservacion" ></input>
					</div>
					</div>
				</div>
				</div>
			<div class="row">
			<div class="col">
					<div class="form-group" name="div_idpersonaseleccionresultadotipos">
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
			 <div class="row" id="div_psexcusacion" name="div_psexcusacion" >
			   <div class="col">
			   <div class="form-group" >
					<label class="col-sm-2 control-label" for="psexcusacion" > Motivo Excusaci&oacute;n:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control validate[required]" type="text" name="psexcusacion" id="psexcusacion" 
						data-errormessage-value-missing="Ingresar el Motivo" 
    					data-errormessage="No puede quedar vacio!" ></input>
					</div>
					</div>
				</div>
				 <div class="col">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="psfechaexcusacion" > Fecha  Fin Excusaci&oacute;n:  </label>
					<div class="col-sm-4">
					<input class="form-control validate[required]" type="date" name="psfechaexcusacion" id="psfechaexcusacion"  
					placeholder="99/99/9999"
					data-errormessage-value-missing="Ingresar la Fecha en la que concluye" 
    				data-errormessage="No puede quedar vacio!"></input>
					</div>
					</div>
			   
			
				</div>
			</div>
			<div class="row" id="div_recusacion" name="div_recusacion">
			   <div class="col">
			   <div class="form-group">
						<label class="col-sm-2 control-label" for="idtiposeleccionrecusacion" > Parte que recusa:  </label>
						<div class="ui-widget">
						<input class="ui-autocomplete-input form-control validate[required]" type="text" name="idtiposeleccionrecusacion" id="idtiposeleccionrecusacion"
						data-options='[{clavetabla:"idtiposeleccionrecusacion",campofiltrar:"trsdescripcion",campotablamostrar:"textocombo",control:"tiposeleccionrecusacion"}]'
						data-errormessage-value-missing="Ingresar la Parte que Recusa" 
    					data-errormessage="No puede quedar vacio!"
						></input>
						</div>
						</div>
			   </div>
			   <div class="col" >
			   <div class="form-group" id="div_recusacion_causa" name="div_recusacion_causa">
					<label class="col-sm-2 control-label" for="psrecusacioncausa" >Recusaci&oacute;n Causa:</label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psrecusacioncausa" id="psrecusacioncausa" 
						data-errormessage-value-missing="Ingresar la Causa!" 
    					data-errormessage="No puede quedar vacio!" ></input>
					</div>
					</div>
			   </div>
			 </div>
				<div class="row" id="div_designacion" name="div_designacion">
			   	<div class="col">
			   	<div class="form-group">
					<label class="col-sm-2 control-label" for="pscaracter" > Designaci&oacute;n Efectiva:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control validate[required]" type="text" name="pscaracter" id="pscaracter" 
					data-errormessage-value-missing="Ingresar el caracter de la designacion." 
    					data-errormessage="No puede quedar vacio!" ></input>
					</div>
					</div>
			   	</div>
			   <div class="col">
			   <div class="form-group">
					<label class="col-sm-2 control-label" for="psnrojurado" > Nro. Jurado:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control validate[required,custom[integer]]" type="text" name="psnrojurado" id="psnrojurado" 
					    data-errormessage-value-missing="Debe ingresar el Nro de Jurado" 
    					data-errormessage="Tiene que ser un Numero." ></input>
					</div>
					</div>
			   </div>
			   </div>
			<div class="row" id="div_no_designacion" name="div_no_designacion">
			   	<div class="col">
			   	<div class="form-group">
					<label class="col-sm-2 control-label" for="psobservacion" > No Designaciones:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psobservacion" id="psobservacion" ></input>
					</div>
					</div>
			   	</div>
			   	<div class="col">
			   	</div>
			</div>
						<div class="row-fluid">
						         <div class="form-actions align-right">
	                                <button id="btnSortearJuicio" type="button" class="btn btn-info">Guardar</button>
	                                <button id="btnDocumentos" type="button" class="btn btn-info">Documentos</button>
	                                <button id="btnCancel" type="button" class="btn">Cerrar</button>
	                            </div>
	                    </div>
					
				</div> <!--<div class="well">	  -->	
				</div><!-- <div class="widget row-fluid">  -->						
				</form>
				</div>
				<div class="row-fluid">  
							<div class="control-group">
								<div id="respuesta"></div>
							</div> 
				</div> 
				
			<div id="mdlSeleccionDocumentos">
			<form id="formCargarDocumento" method="POST" class="form-inline">
				 <input  type="hidden"  name="idpersonaselecciondocumento" id="idpersonaselecciondocumento" value="0" ></input>
				 <input  type="hidden"  name="idseleccion" id="idseleccion" value="0" ></input>
				 <input  type="hidden"  name="idPersona" id="idPersona" value="0" ></input>
				 <input  type="hidden"  name="psdarchivo" id="psdarchivo" value="" ></input>
				 <input  type="hidden" name="personaselecciondocumento_accion" id="personaselecciondocumento_accion" value="guardarDocumento"></input>
			<div class="form-group">
					<label class="control-label" for="psdfechafin" >Fecha Vto.Documento:  </label>
					<div class="col-sm-4">
					<input class="form-control" type="date" name="psdfechafin" id="psdfechafin" placeholder="99/99/9999" ></input>
					</div>
					</div>
			<div class="form-group">
					<label class="control-label" for="psddescripcion" >Obs.:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psddescripcion" id="psddescripcion" ></input>
					</div>
					</div>
			<div class="form-group">
						<label class="control-label" for="idpersonaselecciondocumentotipos" >Tipo Documento:</label>
						<div class="ui-widget">
						<input class="ui-autocomplete-input form-control" type="text" name="idpersonaselecciondocumentotipos" id="idpersonaselecciondocumentotipos"
						data-options='[{clavetabla:"idpersonaselecciondocumentotipos",campofiltrar:"psdtdescripcion",campotablamostrar:"textocombo",control:"personaselecciondocumentotipos"}]'></input>
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
				<!-- /basic inputs -->
				<div id="listadoDatos" class="widget">
				
				</div>

		
		    
		    <!-- /content wrapper -->

		   
				
		</div>
		    
		    
		    
		    
		    
		    
		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/plugins/ajaxupload.3.5.js"></script>
<script type="text/javascript">
$(function(){
	var $_POST = <?php echo json_encode($datos); ?>;
	if($_POST != ""){
		cargarFormulario($_POST);
	}
			
});
</script>
<script type="text/javascript" src="js/juicio_audienciaseleccion.js"></script>



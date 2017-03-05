<?php include("header.php");

if($_GET){

	$idP = $_GET["id"];
}

 ?>
		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Preguntas</a></li>
		                <li><a href="#">Modificar Pregunta</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Cargar Preguntas</h5>
				    	<span></span>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12">        
	            <form id="formNuevaPregunta" method="POST">
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="oper" id="oper" value="modificar" />	
							<input type="hidden" name="hfIdPreg" id="hfIdPreg" value="<?php echo $idP; ?>" />					    
							<div class="navbar"><div class="navbar-inner"><h6>Nueva Pregunta</h6></div></div>
						    <div class="well">	
						    	<div class="control-group">
                                        <label class="control-label">Tipo de Pregunta:</label>
                                        <div class="controls">
                                            <select name="cbTipoPregunta" id="cbTipoPregunta" class="validate[required] span4" data-prompt-position="topLeft:-1,-5" >
                                                <option value="">...</option>
                                            </select>
                                        </div>
                                    </div>
						    					    	
						        <div class="control-group">
						            <label class="control-label">Pregunta:</label>
						            <div class="controls"><input type="text" id="txtPregunta" name="txtPregunta" class="validate[required] span10" data-prompt-position="topLeft:-1,-5" /></div>
						        </div>
						         <div class="control-group">
                                     <label class="control-label">Categor&iacute;a:</label>
                                      <div class="controls">
                                          <select name="cbCategoria" id="cbCategoria" class="validate[required] span10" data-prompt-position="topLeft:-1,-5">
                                              <option value="">...</option>
                                          </select>
                                      </div>
                                </div>
						       
						        
						        <div id="respuesta"></div>
						         <div class="form-actions align-right">	                                
	                                <button id="btnGuardarPregunta" type="button" class="btn btn-info">Guardar</button>
	                                <button type="button" class="btn" onclick="window.location = 'preg_listadoPreguntas.php'">Cerrar</button>
	                            </div>
						     </div>
						</div><!-- /general form elements -->

					</fieldset> 
					
				</form>
				<!-- /basic inputs -->
				
				</div>				
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/modificarPreguntas.js"></script>



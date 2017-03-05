<?php include("header.php"); ?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="index.html">Preguntas</a></li>
		                <li><a href="forms.html">Listado Preguntas</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Preguntas</h5>
				    	<span></span>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12">        
	            <form id="formNuevaPregunta" method="POST">
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="oper" id="oper" value="add" />					    
							<div class="navbar"><div class="navbar-inner"><h6>B&uacute;squeda</h6></div></div>
						    <div class="well">	
						    	<div class="span4">
						    	<div class="control-group">
                                        <label class="control-label">Tipo de Pregunta:</label>
                                        <div class="controls">
                                            <select name="cbTipoPregunta" id="cbTipoPregunta" class="validate[required] span12" data-prompt-position="topLeft:-1,-5" >
                                                <option value="">...</option>
                                            </select>
                                        </div>
                                    </div>
                                 </div> 
                                 <div class="span8">  
						        <div class="control-group">
                                     <label class="control-label">Categor&iacute;a:</label>
                                      <div class="controls">
                                          <select name="cbCategoria" id="cbCategoria" class="validate[required] span12" data-prompt-position="topLeft:-1,-5">
                                              <option value="">...</option>
                                          </select>
                                      </div>
                                </div>
						        </div>
						        
						         <div class="form-actions align-right">
	                                <button id="btnBuscar" type="button" class="btn btn-info">Buscar</button>
	                                 <a id="lkNuevo" class="btn btn-primary" href="preg_nuevaPregunta.php">Nueva Pregunta</a>
	                            </div>
						     </div>
						</div><!-- /general form elements -->

					</fieldset> 

					
				</form>
				<!-- /basic inputs -->
				</div>	
				
				<div id="respuesta"></div>
				<div id="listadoDatos" class="widget">
				</div>
							
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/preguntasListado.js"></script>
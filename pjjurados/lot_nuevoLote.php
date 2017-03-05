<?php include("header.php"); ?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Lotes</a></li>
		                <li><a href="#">Nuevo Lote</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Nuevo Sorteo de Jurados</h5>
				    	<span></span>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12" id="divNueva">        
	            <form id="formNuevoSorteo" method="POST" enctype="multipart/form-data">
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="oper" id="oper" value="add" />					    
							<div class="navbar"><div class="navbar-inner"><h6>Nuevo Sorteo</h6></div></div>
						    <div class="well">	
						    <div class="row-fluid">					    	
						        <div class="control-group">
						            <label class="control-label">Descripci&oacute;n:</label>
						            <div class="controls"><input type="text" id="txtDescripcion" name="txtDescripcion" class="validate[required] span12" /></div>
						        </div>
						    </div>
						    <div class="row-fluid">
						       <div class="span4">				        
						       <div class="control-group">
                                    <label class="control-label">Fecha Inicio:</label>
                                    <div class="controls">
                                    <input type="text" class="validate[required] span10" data-mask="99/99/9999" id="txtFechaDesde" name="txtFechaDesde" placeholder="99/99/9999" ></div>
                                </div>
                                </div>
                                 <div class="span4">	
                                <div class="control-group">
                                    <label class="control-label">Fecha Finalizaci&oacute;n:</label>
                                    <div class="controls">
                                     <input type="text" class="validate[required] span10" data-mask="99/99/9999" id="txtFechaHasta" name="txtFechaHasta" placeholder="99/99/9999" /></div>
                                </div>
                                </div>
                            </div>
                            <div class="row-fluid">    
						        <div class="control-group">
						            <label class="control-label">Observaciones:</label>
						            <div class="controls"><textarea id="txtObs" name="txtObs" class="span12" rows="3"></textarea></div>
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
								<div class="control-group">
								<div id="respuesta"></div>
								</div> 
								</div>                         
						        <div class="row-fluid">
						         <div class="form-actions align-right">
	                                <button id="btnGuardarLote" type="button" class="btn btn-info">Guardar</button>
	                                <button id="btnCancel" type="button" class="btn">Cerrar</button>
	                            </div>
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
<script type="text/javascript" src="js/plugins/ajaxupload.3.5.js"></script>
<script type="text/javascript" src="js/nuevoLote.js"></script>





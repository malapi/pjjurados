<?php include("header.php"); ?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Preguntas</a></li>
		                <li><a href="#">Categorias</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Categor&iacute;as de Preguntas</h5>
				    	<span></span>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12" id="divNueva" style="display: none;">        
	            <form id="formNuevaCategoria" method="POST">
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="oper" id="oper" value="add" />					    
							<div class="navbar"><div class="navbar-inner"><h6>Nueva Categor&iacute;a</h6></div></div>
						    <div class="well">						    	
						        <div class="control-group">
						            <label class="control-label">Descripci&oacute;n:</label>
						            <div class="controls"><input type="text" id="txtDescripcion" name="txtDescripcion" class="validate[required] span12" /></div>
						        </div>
						        
						        <div class="control-group">
						            <label class="control-label">Orden en Plantillas:</label>
						            <div class="controls"><input type="text" id="txtOrden" name="txtOrden" class="validate[required,custom[onlyNumberSp]] span2" /></div>
						        </div>
						        
						        <div id="respuesta"></div>
						         <div class="form-actions align-right">
	                                <button id="btnGuardarCat" type="button" class="btn btn-info">Guardar</button>
	                                <button id="btnCancelNueCat" type="button" class="btn">Cerrar</button>
	                            </div>
						     </div>
						</div><!-- /general form elements -->

					</fieldset> 

					
				</form>
				<!-- /basic inputs -->
				</div>
				
				<div class="span12" id="divModif" style="display: none;">        
	            <form id="formModifCategoria" method="POST">	            	
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="oper" id="oper" value="modif" />
							<input type="hidden" name="hfIdCat" id="hfIdCat" value="" />					    
							<div class="navbar"><div class="navbar-inner"><h6>Modificar Categor&iacute;a</h6></div></div>
						    <div class="well">						    	
						        <div class="control-group">
						            <label class="control-label">Descripci&oacute;n:</label>
						            <div class="controls"><input type="text" id="txtDescripcionM" name="txtDescripcionM" class="validate[required] span12" /></div>
						        </div>
						        
						        <div class="control-group">
						            <label class="control-label">Orden en Plantillas:</label>
						            <div class="controls"><input type="text" id="txtOrdenM" name="txtOrdenM" class="validate[required,custom[onlyNumberSp]] span2" /></div>
						        </div>
						        
						        <div id="respuestaM"></div>
						         <div class="form-actions align-right">
	                                <button id="btnModificarCat" type="button" class="btn btn-info">Guardar</button>
	                                <button id="btnCancelModifCat" type="button" class="btn">Cerrar</button>
	                            </div>
						     </div>
						</div><!-- /general form elements -->
					</fieldset> 
					
				</form>
				<!-- /basic inputs -->
				</div>
				<div class="span12">
				<div class="form-actions align-right">
                   <button id="btnNuevaCat" type="button" class="btn btn-info">Nueva Categor&iacute;a</button>
                </div>
				</div>
				<div id="listadoDatos" class="widget">
				</div>
		
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/categorias.js"></script>



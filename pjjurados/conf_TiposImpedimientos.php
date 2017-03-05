<?php
include("header.php"); ?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Configuraci&oacute;n</a></li>
		                <li><a href="#">Tipos de Impedimento</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Tipos de Impedimento para Jurados</h5>
				    	<span></span>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12" id="divNueva" style="display: none;">        
	            <form id="formNuevoImpedimento" method="POST">
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="oper" id="oper" value="add" />					    
							<div class="navbar"><div class="navbar-inner"><h6>Nuevo Impedimento</h6></div></div>
						    <div class="well">						    	
						        <div class="control-group">
						            <label class="control-label">Descripci&oacute;n:</label>
						            <div class="controls"><input type="text" id="txtDescripcion" name="txtDescripcion" class="validate[required] span12" /></div>
						        </div>
						        
						        <div id="respuesta"></div>
						         <div class="form-actions align-right">
	                                <button id="btnGuardar" type="button" class="btn btn-info">Guardar</button>
	                                <button id="btnCancelNue" type="button" class="btn">Cerrar</button>
	                            </div>
						        
						     </div>
						</div><!-- /general form elements -->

					</fieldset> 

					
				</form>
				<!-- /basic inputs -->
				</div>
				
				<div class="span12" id="divModif" style="display: none;">        
	            <form id="formModifImpedimento" method="POST">	            	
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="oper" id="oper" value="modif" />
							<input type="hidden" name="hfIdImp" id="hfIdImp" value="" />					    
							<div class="navbar"><div class="navbar-inner"><h6>Modificar Impedimento</h6></div></div>
						    <div class="well">						    	
						        <div class="control-group">
						            <label class="control-label">Descripci&oacute;n:</label>
						            <div class="controls"><input type="text" id="txtDescripcionM" name="txtDescripcionM" class="validate[required] span12" /></div>
						        </div>						        
						        <div id="respuestaM"></div>
						         <div class="form-actions align-right">
	                                <button id="btnModificar" type="button" class="btn btn-info">Guardar</button>
	                                <button id="btnCancelModif" type="button" class="btn">Cerrar</button>
	                            </div>
						     </div>
						</div><!-- /general form elements -->
					</fieldset> 
					
				</form>
				<!-- /basic inputs -->
				</div>
				<div class="span12">
				<div class="form-actions align-right">
                   <button id="btnNuevoImp" type="button" class="btn btn-info">Cargar Impedimento</button>
                </div>
				</div>
				<div id="listadoDatos" class="widget">
				</div>
		
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/impedimentos.js"></script>

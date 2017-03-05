<?php include("header.php"); ?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Lotes</a></li>
		                <li><a href="#">Listado de Lotes</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Listado de Lotes</h5>
				    	<span></span>
			    	</div>
			    </div>
			    <div class="span12">        
	            <form id="formNuevaPregunta" method="POST">
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="oper" id="oper" value="tabla" />					    
							<div class="navbar"><div class="navbar-inner"><h6>B&uacute;squeda</h6></div></div>
						    <div class="well">
						    	<div class="row-fluid">
						    	<div class="span4">	
						    	<div class="control-group">
                                    <label class="control-label">Fecha Inicio Desde:</label>
                                    <div class="controls">
                                    <input type="text" class="span10" data-mask="99/99/9999" id="txtFechaDesde" name="txtFechaDesde" placeholder="99/99/9999" /></div>
                                </div>
                                </div>
                                <div class="span4">	
                                <div class="control-group">
                                    <label class="control-label">Fecha Inicio Hasta:</label>
                                    <div class="controls">
                                     <input type="text" class="span10" data-mask="99/99/9999" id="txtFechaHasta" name="txtFechaHasta" placeholder="99/99/9999" /></div>
                                </div>
                                </div>
                                </div>
                                <div class="row-fluid">
                                <div class="span12">	
                                <div class="control-group">
						            <label class="control-label">Descripci&oacute;n:</label>
						            <div class="controls"><input type="text" id="txtDescripcion" name="txtDescripcion" class="span12" /></div>
						        </div>
                                 </div>
                                 </div>
                                  <div class="control-group">
						        	<div id="respuesta"></div>
						          </div>
						         <div class="form-actions align-right">
	                                <button id="btnBuscarLote" type="button" class="btn btn-info">Buscar</button>	                                 
	                            </div>
						     </div>
						</div><!-- /general form elements -->

					</fieldset> 

					
				</form>
				<!-- /basic inputs -->
				</div>	
			    <!-- /page header -->
						
				<div id="listadoDatos" class="widget">
				</div>
							
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/listadoLotes.js"></script>



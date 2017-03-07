<?php include("header.php"); ?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Lotes</a></li>
		                <li><a href="#">Listar Lotes</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Listado de Lotes</h5>
			    	</div>
			    </div>
			    <div class="widget">
 				<div class="well">
			            
	            <form class="form-inline" id="formNuevaPregunta" method="POST">
							<input type="hidden" name="oper" id="oper" value="tabla" />					    
							
						    	    <label class="control-label">Fecha Inicio Desde:</label>
                                    <input type="text" class="span10" data-mask="99/99/9999" id="txtFechaDesde" name="txtFechaDesde" placeholder="99/99/9999" />
                                    <label class="control-label">Fecha Inicio Hasta:</label>
                                     <input type="text" class="span10" data-mask="99/99/9999" id="txtFechaHasta" name="txtFechaHasta" placeholder="99/99/9999" />
                                    <label class="control-label">Descripci&oacute;n:</label>
						            <input type="text" id="txtDescripcion" name="txtDescripcion" class="span12" />
						        <div id="respuesta"></div>
						        <button id="btnBuscarLote" type="button" class="btn btn-info">Buscar</button>	                                 
				</form>
				<!-- /basic inputs -->
				
				<div id="listadoDatos" class="widget">	</div>
				</div>
			</div>
				</div>	
			    <!-- /page header -->
						
				
					
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/listadoLotes.js"></script>



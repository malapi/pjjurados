<?php
include ("header.php");
$id = "";
if ($_GET) {
	$id = $_GET ["id"];
}
?>

<!-- Content -->
<div id="content">
	<!-- Content wrapper -->
	<div class="wrapper">
		<!-- Breadcrumbs line -->
		<div class="crumbs">
			<ul id="breadcrumbs" class="breadcrumb">
				<li><a href="#">Lotes</a></li>
				<li><a href="#">Lotes Activos</a></li>
				<li><a href="#">Personas por Lote</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->

		<!-- Page header -->
		<div class="page-header">
			<div class="page-title">
				<h5>Personas por Lote</h5>
			</div>
		</div>
		<!-- /page header -->

		 <div class="span12" id="divNueva">
			<form id="formModificarSorteo" method="POST"
				enctype="multipart/form-data">
				<fieldset>
					<!-- General form elements -->
					<div class="widget row-fluid">
						<input type="hidden" name="oper" id="oper" value="modificar" /> <input
							type="hidden" name="hfIdSorteo" id="hfIdSorteo" value="<?php echo $id; ?>" />
						<div class="navbar">
							<div class="navbar-inner">
								<!--  <h6>Lote</h6>-->
								<h6><label for="informacionLote" style="vertical-align: middle"  >Lala</label></h6>
							</div>
						</div>
						<!-- <div class="well">
							<div class="row-fluid">
								<div class="control-group">
									<label class="control-label">Descripci&oacute;n:</label>
									<div class="controls">
										<input type="text" id="txtDescripcion" name="txtDescripcion"
											class="validate[required] span12" />
									</div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span4">
									<div class="control-group">
										<label class="control-label">Fecha Inicio:</label>
										<div class="controls">
											<input type="text" class="span10"
												data-mask="99/99/9999" id="txtFechaDesde"
												name="txtFechaDesde" placeholder="99/99/9999">
										</div>
									</div>
								</div>
								<div class="span4">
									<div class="control-group">
										<label class="control-label">Fecha Finalizaci&oacute;n:</label>
										<div class="controls">
											<input type="text" class="span10"
												data-mask="99/99/9999" id="txtFechaHasta"
												name="txtFechaHasta" placeholder="99/99/9999" />
										</div>
									</div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="control-group">
									<label class="control-label">Observaciones:</label>
									<div class="controls">
										<textarea id="txtObs" name="txtObs" class="span12" rows="2"></textarea>
									</div>
								</div>
							</div>							
						</div> -->
					 </div>
					
				</fieldset>
			</form>
			
		</div>
 
		<div class="widget ">
 		<div class="well">
	 		<div class='navbar'>
				<div class='navbar-inner'>
					<h6>Filtrar Persona del Lote</h6>
				</div>
			</div> 
			<!-- <form id="formModificarSorteo" method="POST" 		enctype="multipart/form-data">
				<fieldset>					
					 <div class="widget row-fluid"> 	
					
						<div class="well">
						
							<div class="row-fluid">
								<div class="span2">
								<div class="control-group">
									<div class="controls">
									<label class="col-2 col-form-label">Apellido:
										<input type="text" id="txtApellidoB" name="txtApellidoB" class="span12" /></label>
									</div>
								</div>
								</div>
								
								<div class="span2">
								<div class="control-group">
									<label class="control-label">Nombre:</label>
									<div class="controls">
										<input type="text" id="txtNombreB" name="txtNombreB"
											class="span12" />
									</div>
								</div>
								</div>
								<div class="span2">
								<div class="control-group">
									<label class="control-label">Tipo Documento:</label>
									<div class="controls">
									<select name="cbTipoDocB" id="cbTipoDocB" class="span12" 
									data-prompt-position="topLeft:-1,-5" >
                                                <option value="">...</option>
                                            </select>
									</div>
								</div>
								</div>								
								<div class="span2">
								<div class="control-group">
									<label class="control-label">Nro Documento:</label>
									<div class="controls">
										<input type="text" id="txtNroDocB" name="txtNroDocB"
											class="span12" />
									</div>
								</div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="form-actions align-right">
									<button id="btnBuscarPersona" type="button" class="btn btn-info">Buscar</button>
									<button id="btnTodas" type="button" class="btn">Todos</button>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
 -->
 <div style="-moz-border-bottom-colors: none;-moz-border-left-colors: none;-moz-border-right-colors: none;-moz-border-top-colors: none;border-color: #f7f7f9; border-image: none; border-style: solid; border-width: 0.2rem 0 0; padding: 1rem;" >
 <form class="form-inline">
 
  <label class="mr-sm-2" for="txtApellidoB">Apellido:</label>
  <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="txtApellidoB" placeholder="Apellido">
  
  <label class="mr-sm-2" for="txtNombreB">Nombre:</label>
  <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="txtNombreB" placeholder="Nombre">

  <label class="mr-sm-2" for="inlineFormInputGroup">Nombre:</label>
  <div class="input-group mb-2 mr-sm-2 mb-sm-0">
    <div class="input-group-addon">@</div>
    <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Nombre">
  </div>

  <div class="form-check mb-2 mr-sm-2 mb-sm-0">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox"> Remember me
    </label>
  </div>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>

</div>


			<div id="listadoDatos" class='table-overflow'></div>
		</div>

	</div>
	<!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/personasXLote.js"></script>


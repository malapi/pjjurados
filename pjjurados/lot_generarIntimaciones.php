<?php
include ("header.php");
?>

<!-- Content -->
<div id="content">
	<!-- Content wrapper -->
	<div class="wrapper">
		<!-- Breadcrumbs line -->
		<div class="crumbs">
			<ul id="breadcrumbs" class="breadcrumb">
				<li><a href="#">Lotes</a></li>
				<li><a href="#">Personas Por Lote</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->

		<!-- Page header -->
		<div class="page-header">
			<div class="page-title">
				<h5>Personas Por Lote</h5>
				<span></span>
			</div>
		</div>
		<!-- /page header -->

		<div class="widget">
			<div class='navbar'>
				<div class='navbar-inner'>
					<h6>Persona incluidas en el Lote</h6>
				</div>
			</div>
			<form id="formBuscarPers" method="POST">
				<fieldset>
					<!-- General form elements -->
					<input type="hidden" name="oper" id="oper" value="verPersXIntimacion" />
					<div class="widget row-fluid">	
						<div class="well">
						<div class="row-fluid">
						<div class="span12">
								<div class="control-group">
									<label class="control-label">Lote:</label>
									<div class="controls">
										<select name="cbLote" id="cbLote" class="validate[required] span12" data-prompt-position="topLeft:-1,-5" >
                                                <option value="">...</option>
                                            </select>
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
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
								<div class="span4">
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
								<div class="span6">
								<div class="control-group">
									<label class="control-label">Apellido:</label>
									<div class="controls">
										<input type="text" id="txtApellidoB" name="txtApellidoB"
											class="span12" />
									</div>
								</div>
								</div>								
								<div class="span6">
								<div class="control-group">
									<label class="control-label">Nombre:</label>
									<div class="controls">
										<input type="text" id="txtNombreB" name="txtNombreB"
											class="span12" />
									</div>
								</div>
								</div>
							</div>							
							
							<div class="row-fluid">
								<div class="span12">
								 <div class="control-group">
                                        <label class="control-label">Plantilla Para C&eacute;dula Intimaci&oacute;n:</label>
                                        <div class="controls" >
                                            <div id="upload" class="btn btn-primary"><span><i class="ico-file"> </i> Adjuntar Plantilla </span></div>
											<span id="status" ></span>	
											<span id="resultado" ></span>                                            
                                        </div>
                                  </div>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span12" id="respuesta"></div>
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
			<form id="formGenerarInt" method="POST">
			<input type="hidden" name="hfArchiCedula" id="hfArchiCedula" value="" />
			<input type="hidden" name="oper" id="oper" value="generarIntimacion" />
			<input type="hidden" name="hfIdLote" id="hfIdLote" />
			<div class="widget">
				<div class='navbar'>
					<div class='navbar-inner'>
						<h6>Persona Notificadas</h6>
								<ul class="navbar-icons">
                                    <li><a id="btnSelectTodo" href="#" class="tip" title="Seleccionar Todos"><i class="icon-plus"></i></a></li>
                                    <li><a id="btnSelectNinguno" href="#" class="tip" title="No Seleccionar Ninguno"><i class="icon-minus"></i></a></li>
                                    <li><a id="btnSelectInvertir" href="#" class="tip" title="Invertir Seleccion"><i class="ico-random"></i></a></li>
                                </ul>
                     </div>
					</div>	
								
					<div id="listadoDatos" class='table-overflow' style="max-height: 400px;overflow: auto;"></div>
					<div class="row-fluid">
								<div class="span12" id="respuestaInt"></div>
							</div>	
					<div class="row-fluid">
						<div class="form-actions align-right">
							<button id="btnGenerarIntimaciones" type="button" class="btn btn-info" style="display: none;">Generar Intimaciones</button>
						</div>
					</div>					
			</div>
			</form>
				
				
		</div>

	</div>
	<!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/plugins/ajaxupload.3.5.js"></script>
<script type="text/javascript" src="js/personasParaIntimacion.js"></script>

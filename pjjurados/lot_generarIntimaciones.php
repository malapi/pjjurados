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
				<li><a href="#">Generar Intimaciones</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->
		<div class="page-header">
			<div class="page-title">
				<h5>Generar Intimaciones</h5>
			</div>
		</div>
		<div class="widget">
			<div class="well">
			<form id="formBuscarPers" class="form-inline" method="POST">
					<input type="hidden" name="oper" id="oper" value="verPersXIntimacion" />
					<label class="mr-sm-2">Lote:
										<select name="cbLote" id="cbLote" class="validate[required]" style='width:auto;' data-prompt-position="topLeft:-1,-5" >
                                                <option value="">...</option>
                                            </select></label>
				<label class="mr-sm-2">Tipo Documento:
				<select name="cbTipoDocB" style='width:auto;' id="cbTipoDocB" class="span12" 
									data-prompt-position="topLeft:-1,-5" >
                                                <option value="">...</option>
                                            </select></label>
				<label class="mr-sm-2">Nro Documento:
					<input type="text" id="txtNroDocB" name="txtNroDocB"
											class="span12" /></label>
				<label class="mr-sm-2">Apellido:
								<input type="text" id="txtApellidoB" name="txtApellidoB"
											class="span12" /></label>
				<label class="mr-sm-2">Nombre:
				<input type="text" id="txtNombreB" name="txtNombreB"
											class="span12" /></label>
				<label class="mr-sm-2">Plantilla Para C&eacute;dula Intimaci&oacute;n:
                                        <div class="controls" >
                                            <div id="upload" class="btn btn-primary"><span><i class="ico-file"> </i> Adjuntar Plantilla </span></div>
											<span id="status" ></span>	
											<span id="resultado" ></span>                                            
                                        </div></label>
                <div class="span12" id="respuesta"></div>
				<button id="btnBuscarPersona" type="button" class="btn btn-info">Buscar</button>
				<button id="btnTodas" type="button" class="btn">Todos</button>
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

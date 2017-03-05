<?php include("header.php"); 
$idP = "";
$Op = "";
if($_GET){
$idP = $_GET["id"];
if(isset($_GET["op"]))
$Op = $_GET["op"];
}
?>

<!-- Content -->
<div id="content">
	<!-- Content wrapper -->
	<div class="wrapper">
		<!-- Breadcrumbs line -->
		<div class="crumbs">
			<ul id="breadcrumbs" class="breadcrumb">
				<li><a href="index.html">Plantillas</a></li>
				<li><a href="forms.html">Generar Plantillas</a></li>
			</ul>
		</div>
		<!-- /breadcrumbs line -->

		<!-- Page header -->
		<div class="page-header">
			<div class="page-title">
				<h5>Generar Plantilla</h5>
				<span></span>
			</div>
		</div>
		<!-- /page header -->
<input type="hidden" name="hfOP" id="hfOP" value="<?php echo $Op; ?>" />
		<div class="span12">
			<div id="divTituloPlan">
			<form id="formNuevaPlantilla" method="POST">
				<fieldset>
					<!-- General form elements -->
					<div class="widget row-fluid">
						<input type="hidden" name="oper" id="oper" value="add" />
						<div class="well">
							<div class="control-group">
								<label class="control-label">T&iacute;tulo:</label>
								<div class="controls">
									<input type="text" id="txtTitulo" name="txtTitulo"
										class="validate[required] span12"
										data-prompt-position="topLeft:-1,-5" />
								</div>
							</div>
							<div id="respuesta"></div>
							<div class="form-actions align-right">
								<button id="btnGenerarPlantilla" type="button"
									class="btn btn-info">Generar Nueva Plantilla</button>
								<button type="button" class="btn"
									onclick="windows.location = ''">Cancelar</button>
							</div>
						</div>
					</div>
				</fieldset>			
			</form>
			</div>
				<div id="divPlantilla" style="display: none;">
				
					<div class="widget">
					  <h5 id="verTitulo"></h5>
					  <h4>Declaraci&oacute;n Jurada - Jurado Popular <small>PODER JUDICIAL - PROVINCIA DE NEUQUEN -Ley 2784- Arts 43 y 44</small></h4>
					  <p>DATOS QUE DEBER&Aacute; CONSIGNAR CON VALOR DE DECLARACI&Oacute;N JURADA. LEER ATENTAMENTE</p>						
					</div>
					<!-- /general form elements -->
					<h5 class="widget-name">
						<i class="icon-align-justify"></i> Datos Personales
					</h5>

					<div class="widget row-fluid">
						<div class="well">
							<div class="control-group">
								<label class="control-label"><strong class="subtitle">1 -
										Apellido/s:</strong></label>
								<div class="controls">
									<input type="text" id="txtTitulo" name="txtTitulo"
										class="span12 respuesta" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label"><strong class="subtitle">2 - Nombre
										Completo:</strong></label>
								<div class="controls">
									<input type="text" id="txtNombre" name="txtNombre"
										class="span12 respuesta" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"><strong class="subtitle">3 - Tipo y
										Nro de Documento de Identidad:</strong></label>
								<div class="controls">
									<input type="text" id="txtNombre" name="txtNombre"
										class="span12 respuesta" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"><strong class="subtitle">4 - Nro de
										CUIL:</strong></label>
								<div class="controls">
									<input type="text" id="txtNombre" name="txtNombre"
										class="span12 respuesta" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"><strong class="subtitle">5 -
										Nacionalidad:</strong></label>
								<div class="controls">
									<input type="text" id="txtNombre" name="txtNombre"
										class="span12 respuesta" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"><strong class="subtitle">6 - Lugar
										de Nacimiento:</strong></label>
								<div class="controls">
									<input type="text" id="txtNombre" name="txtNombre"
										class="span12 respuesta" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"><strong class="subtitle">7 - Fecha
										de Nacimiento:</strong></label>
								<div class="controls">
									<input type="text" id="txtNombre" name="txtNombre"
										class="span12 respuesta" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"><strong class="subtitle">8 - Lugar
										donde vive actualmente:</strong> (indique Calle, Nro, Barrio y
									Localidad. De ser posible, entre que calles est&aacute; su
									domicilio o alguna referencia puntual)</label>
								<div class="controls">
									<input type="text" id="txtNombre" name="txtNombre"
										class="span12 respuesta" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"><strong class="subtitle">9 -
										Tel&eacute;fono Fijo:</strong></label>
								<div class="controls">
									<input type="text" id="txtNombre" name="txtNombre"
										class="span12 respuesta" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"><strong class="subtitle">10 -
										Tel&eacute;fono Celular:</strong></label>
								<div class="controls">
									<input type="text" id="txtNombre" name="txtNombre"
										class="span12 respuesta" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"><strong class="subtitle">11 -
										Correo electr&oacute;nico:</strong></label>
								<div class="controls">
									<input type="text" id="txtNombre" name="txtNombre"
										class="span12 respuesta" />
								</div>
							</div>
						</div>

					</div>
					<!-- /general form elements -->
				
			<!-- /basic inputs -->
		

		<div class="span12" id="completarPlantilla"></div>
		
		<div class="span12" id="divCargarPreg">
			<!-- Form inline -->
			<form id="formAgregarPregunta" action="#">
				<input type="hidden" name="oper" id="oper" value="addPreg" />
				<input type="hidden" name="hfIdPlantilla" id="hfIdPlantilla" value="<?php echo $idP; ?>" />
				<div class="widget row-fluid">
					<div class="well">
						<div class="span12">
							<div class="control-group">
							<label class="control-label">Categoria:</label>
								<div class="controls">
								<select name="cbCategoria" id="cbCategoria"
									class="validate[required] span8"
									data-prompt-position="topLeft:-1,-5">
									<option value="">...</option>
								</select>
								</div>
							</div>
							<div class="control-group">
							<label class="control-label">Pregunta:</label>
								<div class="controls">
								<select name="cbPregunta" id="cbPregunta"
									class="validate[required] span8"
									data-prompt-position="topLeft:-1,-5">
									<option value="">...</option>
								</select>
								</div>							
							</div>							
							<div id="respuestaPreg"></div>
							<div class="form-actions align-right">
								<button id="btnAgregarPregunta" type="button" class="btn btn-success">
									<b class="icon-plus"></b> Agregar Pregunta
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- /form inline -->
		<div class="form-actions align-right">
			<a id="btnAgregarPregunta" class="btn btn-primary" href="preg_listadoPlantillas.php">
				Volver al listado
			</a>
		</div>

		</div>
	</div>

	</div>
	
	
	</div><!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/generarPlantilla.js"></script>
<script type="text/javascript" src="js/plugins/ui/jquery-ui-1.9.2.custom.min.js"></script>



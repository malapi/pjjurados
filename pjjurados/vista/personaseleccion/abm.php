<?php 
 
$ACCION = " Carrito:: Gestion de personaseleccion "; 
include_once("../../configuracion.php"); 
include_once("../estructura/encabezadohtml.php");
?>
</head>
<body>
<div id="content" class='content' >
<div class="easyui-panel" title=" <?php echo $ACCION?>"  name="personaseleccion_divabm" id="personaseleccion_divabm">
       <form id="personaseleccion_fabm" name="personaseleccion_fabm" class="form-horizontal" method="post">
       <input  type="hidden" name="personaseleccion_accion" id="personaseleccion_accion" value="sa"></input>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psobservacion" > psobservacion:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psobservacion" id="psobservacion" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
						<label class="col-sm-2 control-label" for="idtiposeleccionrecusacion" > idtiposeleccionrecusacion:  </label>
						<div class="col-sm-4">
						<input class="easyui-combobox form-control" type="text" name="idtiposeleccionrecusacion" id="idtiposeleccionrecusacion"
						data-options="valueField:'idtiposeleccionrecusacion',textField:'textocombo',url:'../util/datacombo.php?control=tiposeleccionrecusacion'"></input>
						</div>
						</div>
			<div class="form-group">
						<label class="col-sm-2 control-label" for="idpersonaseleccionresultadotipos" > idpersonaseleccionresultadotipos:  </label>
						<div class="col-sm-4">
						<input class="easyui-combobox form-control" type="text" name="idpersonaseleccionresultadotipos" id="idpersonaseleccionresultadotipos"
						data-options="valueField:'idpersonaseleccionresultadotipos',textField:'textocombo',url:'../util/datacombo.php?control=personaseleccionresultadotipos'"></input>
						</div>
						</div>
			<div class="form-group">
						<label class="col-sm-2 control-label" for="idjuicio" > idjuicio:  </label>
						<div class="col-sm-4">
						<input class="easyui-combobox form-control" type="text" name="idjuicio" id="idjuicio"
						data-options="valueField:'idjuicio',textField:'textocombo',url:'../util/datacombo.php?control=juicio'"></input>
						</div>
						</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psnrojurado" > psnrojurado:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psnrojurado" id="psnrojurado" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psfechaexcusacion" > psfechaexcusacion:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psfechaexcusacion" id="psfechaexcusacion" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psasisteobservacion" > psasisteobservacion:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psasisteobservacion" id="psasisteobservacion" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psasiste" > psasiste:  </label>
					<div class="col-sm-2">
					<input  type="radio" name="psasiste" id="psasiste" value='1' checked="checked" ><span>Si</span></input>
					<input  type="radio" name="psasiste" id="psasiste" value='0'><span>No</span></input>
					</div>
					</div>
<input  type="hidden"  name="idPersona" id="idPersona" value="0" ></input>
<input  type="hidden"  name="idseleccion" id="idseleccion" value="0" ></input>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psnroordenseleccion" > psnroordenseleccion:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psnroordenseleccion" id="psnroordenseleccion" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psexcusacion" > psexcusacion:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psexcusacion" id="psexcusacion" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psrecusacioncausa" > psrecusacioncausa:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psrecusacioncausa" id="psrecusacioncausa" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="pscaracter" > pscaracter:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="pscaracter" id="pscaracter" data-options="required:true"></input>
					</div>
					</div>
<div class="form-group"> 
		<div class="col-sm-offset-1 col-sm-6">
		<a id="personaseleccion_btn"  href="#" class="easyui-linkbutton btn btn-default" data-options="size:'large',iconAlign:'left'">Aceptar</a>
		</div>
		</div>
			
		
		</form>
		</div>
		<div style="margin:20px 0;"></div>
		<table id="personaseleccion_dg" class="easyui-datagrid" title="<?php echo $ACCION?>" style="width:98%;height:350px" 
		data-options="queryParams:{control: 'personaseleccion'}" >
		<thead>
		<tr>
		<th data-options="field:'psobservacion'">psobservacion</th>
<th data-options="field:'idtiposeleccionrecusacion'">idtiposeleccionrecusacion</th>
<th data-options="field:'idpersonaseleccionresultadotipos'">idpersonaseleccionresultadotipos</th>
<th data-options="field:'idjuicio'">idjuicio</th>
<th data-options="field:'psnrojurado'">psnrojurado</th>
<th data-options="field:'psfechaexcusacion'">psfechaexcusacion</th>
<th data-options="field:'psasisteobservacion'">psasisteobservacion</th>
<th data-options="field:'psasiste'">psasiste</th>
<th data-options="field:'idPersona',hidden:true">idPersona</th>
<th data-options="field:'idseleccion',hidden:true">idseleccion</th>
<th data-options="field:'psnroordenseleccion'">psnroordenseleccion</th>
<th data-options="field:'psexcusacion'">psexcusacion</th>
<th data-options="field:'psrecusacioncausa'">psrecusacioncausa</th>
<th data-options="field:'pscaracter'">pscaracter</th>
</tr> 
		</thead> 
		</table> 
		<script type="text/javascript"> 
		$(function(){ 
			var personaseleccion = $("seleccion").TableForm("personaseleccion",{prefijo:'personaseleccion',control:'personaseleccion'});
		});
		</script>
		</div>	
</body>
</html>
		
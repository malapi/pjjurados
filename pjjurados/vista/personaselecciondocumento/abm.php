<?php 
 
$ACCION = " Carrito:: Gestion de personaselecciondocumento "; 
include_once("../../configuracion.php"); 
include_once("../estructura/encabezadohtml.php");
?>
</head>
<body>
<div id="content" class='content' >
<div class="easyui-panel" title=" <?php echo $ACCION?>"  name="personaselecciondocumento_divabm" id="personaselecciondocumento_divabm">
       <form id="personaselecciondocumento_fabm" name="personaselecciondocumento_fabm" class="form-horizontal" method="post">
       <input  type="hidden" name="personaselecciondocumento_accion" id="personaselecciondocumento_accion" value="sa"></input>
			<div class="form-group">
						<label class="col-sm-2 control-label" for="idseleccion" > idseleccion:  </label>
						<div class="col-sm-4">
						<input class="easyui-combobox form-control" type="text" name="idseleccion" id="idseleccion"
						data-options="valueField:'idseleccion',textField:'textocombo',url:'../util/datacombo.php?control=seleccion'"></input>
						</div>
						</div>
			<div class="form-group">
						<label class="col-sm-2 control-label" for="idPersona" > idPersona:  </label>
						<div class="col-sm-4">
						<input class="easyui-combobox form-control" type="text" name="idPersona" id="idPersona"
						data-options="valueField:'idPersona',textField:'textocombo',url:'../util/datacombo.php?control=personas'"></input>
						</div>
						</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psdarchivo" > psdarchivo:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psdarchivo" id="psdarchivo" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psdfechafin" > psdfechafin:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psdfechafin" id="psdfechafin" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psddescripcion" > psddescripcion:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psddescripcion" id="psddescripcion" data-options="required:true"></input>
					</div>
					</div>
<input  type="hidden"  name="idpersonaselecciondocumento" id="idpersonaselecciondocumento" value="0" ></input>
<div class="form-group"> 
		<div class="col-sm-offset-1 col-sm-6">
		<a id="personaselecciondocumento_btn"  href="#" class="easyui-linkbutton btn btn-default" data-options="size:'large',iconAlign:'left'">Aceptar</a>
		</div>
		</div>
			
		
		</form>
		</div>
		<div style="margin:20px 0;"></div>
		<table id="personaselecciondocumento_dg" class="easyui-datagrid" title="<?php echo $ACCION?>" style="width:98%;height:350px" 
		data-options="queryParams:{control: 'personaselecciondocumento'}" >
		<thead>
		<tr>
		<th data-options="field:'idseleccion'">idseleccion</th>
<th data-options="field:'idPersona'">idPersona</th>
<th data-options="field:'psdarchivo'">psdarchivo</th>
<th data-options="field:'psdfechafin'">psdfechafin</th>
<th data-options="field:'psddescripcion'">psddescripcion</th>
<th data-options="field:'idpersonaselecciondocumento',hidden:true">idpersonaselecciondocumento</th>
</tr> 
		</thead> 
		</table> 
		<script type="text/javascript"> 
		$(function(){ 
			var personaselecciondocumento = $("seleccion").TableForm("personaselecciondocumento",{prefijo:'personaselecciondocumento',control:'personaselecciondocumento'});
		});
		</script>
		</div>	
</body>
</html>
		
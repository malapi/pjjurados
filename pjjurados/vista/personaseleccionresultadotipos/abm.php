<?php 
 
$ACCION = " Carrito:: Gestion de personaseleccionresultadotipos "; 
include_once("../../configuracion.php"); 
include_once("../estructura/encabezadohtml.php");
?>
</head>
<body>
<div id="content" class='content' >
<div class="easyui-panel" title=" <?php echo $ACCION?>"  name="personaseleccionresultadotipos_divabm" id="personaseleccionresultadotipos_divabm">
       <form id="personaseleccionresultadotipos_fabm" name="personaseleccionresultadotipos_fabm" class="form-horizontal" method="post">
       <input  type="hidden" name="personaseleccionresultadotipos_accion" id="personaseleccionresultadotipos_accion" value="sa"></input>
<input  type="hidden"  name="idpersonaseleccionresultadotipos" id="idpersonaseleccionresultadotipos" value="0" ></input>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psrtdescripcion" > psrtdescripcion:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="psrtdescripcion" id="psrtdescripcion" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="psrtactivo" > psrtactivo:  </label>
					<div class="col-sm-2">
					<input  type="radio" name="psrtactivo" id="psrtactivo" value='1' checked="checked" ><span>Si</span></input>
					<input  type="radio" name="psrtactivo" id="psrtactivo" value='0'><span>No</span></input>
					</div>
					</div>
<div class="form-group"> 
		<div class="col-sm-offset-1 col-sm-6">
		<a id="personaseleccionresultadotipos_btn"  href="#" class="easyui-linkbutton btn btn-default" data-options="size:'large',iconAlign:'left'">Aceptar</a>
		</div>
		</div>
			
		
		</form>
		</div>
		<div style="margin:20px 0;"></div>
		<table id="personaseleccionresultadotipos_dg" class="easyui-datagrid" title="<?php echo $ACCION?>" style="width:98%;height:350px" 
		data-options="queryParams:{control: 'personaseleccionresultadotipos'}" >
		<thead>
		<tr>
		<th data-options="field:'idpersonaseleccionresultadotipos',hidden:true">idpersonaseleccionresultadotipos</th>
<th data-options="field:'psrtdescripcion'">psrtdescripcion</th>
<th data-options="field:'psrtactivo'">psrtactivo</th>
</tr> 
		</thead> 
		</table> 
		<script type="text/javascript"> 
		$(function(){ 
			var personaseleccionresultadotipos = $("seleccion").TableForm("personaseleccionresultadotipos",{prefijo:'personaseleccionresultadotipos',control:'personaseleccionresultadotipos'});
		});
		</script>
		</div>	
</body>
</html>
		
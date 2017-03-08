<?php 
 
$ACCION = " Carrito:: Gestion de tiposeleccionrecusacion "; 
include_once("../../configuracion.php"); 
include_once("../estructura/encabezadohtml.php");
?>
</head>
<body>
<div id="content" class='content' >
<div class="easyui-panel" title=" <?php echo $ACCION?>"  name="tiposeleccionrecusacion_divabm" id="tiposeleccionrecusacion_divabm">
       <form id="tiposeleccionrecusacion_fabm" name="tiposeleccionrecusacion_fabm" class="form-horizontal" method="post">
       <input  type="hidden" name="tiposeleccionrecusacion_accion" id="tiposeleccionrecusacion_accion" value="sa"></input>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="trsactivo" > trsactivo:  </label>
					<div class="col-sm-2">
					<input  type="radio" name="trsactivo" id="trsactivo" value='1' checked="checked" ><span>Si</span></input>
					<input  type="radio" name="trsactivo" id="trsactivo" value='0'><span>No</span></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="trsdescripcion" > trsdescripcion:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="trsdescripcion" id="trsdescripcion" data-options="required:true"></input>
					</div>
					</div>
<input  type="hidden"  name="idtiposeleccionrecusacion" id="idtiposeleccionrecusacion" value="0" ></input>
<div class="form-group"> 
		<div class="col-sm-offset-1 col-sm-6">
		<a id="tiposeleccionrecusacion_btn"  href="#" class="easyui-linkbutton btn btn-default" data-options="size:'large',iconAlign:'left'">Aceptar</a>
		</div>
		</div>
			
		
		</form>
		</div>
		<div style="margin:20px 0;"></div>
		<table id="tiposeleccionrecusacion_dg" class="easyui-datagrid" title="<?php echo $ACCION?>" style="width:98%;height:350px" 
		data-options="queryParams:{control: 'tiposeleccionrecusacion'}" >
		<thead>
		<tr>
		<th data-options="field:'trsactivo'">trsactivo</th>
<th data-options="field:'trsdescripcion'">trsdescripcion</th>
<th data-options="field:'idtiposeleccionrecusacion',hidden:true">idtiposeleccionrecusacion</th>
</tr> 
		</thead> 
		</table> 
		<script type="text/javascript"> 
		$(function(){ 
			var tiposeleccionrecusacion = $("seleccion").TableForm("tiposeleccionrecusacion",{prefijo:'tiposeleccionrecusacion',control:'tiposeleccionrecusacion'});
		});
		</script>
		</div>	
</body>
</html>
		
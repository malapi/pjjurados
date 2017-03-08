<?php 
$ACCION = " Carrito:: Gestion de juicio "; 
include_once("../../configuracion.php"); 
include_once("../estructura/encabezadohtml.php");
?>
</head>
<body>
<div id="content" class='content' >
<div class="easyui-panel" title=" <?php echo $ACCION?>"  name="juicio_divabm" id="juicio_divabm">
       <form id="juicio_fabm" name="juicio_fabm" class="form-horizontal" method="post">
       <input  type="hidden" name="juicio_accion" id="juicio_accion" value="sa"></input>
			<input  type="hidden"  name="idjuicio" id="idjuicio" value="0" ></input>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="jufecha" > jufecha:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="jufecha" id="jufecha" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="jujueces" > jujueces:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="jujueces" id="jujueces" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="judescripcion" > judescripcion:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="judescripcion" id="judescripcion" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="juobservacion" > juobservacion:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="juobservacion" id="juobservacion" data-options="required:true"></input>
					</div>
					</div>
<div class="form-group"> 
		<div class="col-sm-offset-1 col-sm-6">
		<a id="juicio_btn"  href="#" class="easyui-linkbutton btn btn-default" data-options="size:'large',iconAlign:'left'">Aceptar</a>
		</div>
		</div>
			
		
		</form>
		</div>
		<div style="margin:20px 0;"></div>
		<table id="juicio_dg" class="easyui-datagrid" title="<?php echo $ACCION?>" style="width:98%;height:350px" 
		data-options="queryParams:{control: 'juicio'}" >
		<thead>
		<tr>
		<th data-options="field:'idjuicio',hidden:true">idjuicio</th>
<th data-options="field:'jufecha'">jufecha</th>
<th data-options="field:'jujueces'">jujueces</th>
<th data-options="field:'judescripcion'">judescripcion</th>
<th data-options="field:'juobservacion'">juobservacion</th>
</tr> 
		</thead> 
		</table> 
		<script type="text/javascript"> 
		$(function(){ 
			var juicio = $("seleccion").TableForm("juicio",{prefijo:'juicio',control:'juicio'});
		});
		</script>
		</div>	
</body>
</html>
		
<?php 
 
$ACCION = " Carrito:: Gestion de seleccion "; 
include_once("../../configuracion.php"); 
include_once("../estructura/encabezadohtml.php");
?>
</head>
<body>
<div id="content" class='content' >
<div class="easyui-panel" title=" <?php echo $ACCION?>"  name="seleccion_divabm" id="seleccion_divabm">
       <form id="seleccion_fabm" name="seleccion_fabm" class="form-horizontal" method="post">
       <input  type="hidden" name="seleccion_accion" id="seleccion_accion" value="sa"></input>
<input  type="hidden"  name="idseleccion" id="idseleccion" value="0" ></input>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="sefecha" > sefecha:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="sefecha" id="sefecha" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="sefechadesde" > sefechadesde:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="sefechadesde" id="sefechadesde" data-options="required:true"></input>
					</div>
					</div>
			<div class="form-group">
					<label class="col-sm-2 control-label" for="sefechahasta" > sefechahasta:  </label>
					<div class="col-sm-4">
					<input class="easyui-textbox form-control" type="text" name="sefechahasta" id="sefechahasta" data-options="required:true"></input>
					</div>
					</div>
<div class="form-group"> 
		<div class="col-sm-offset-1 col-sm-6">
		<a id="seleccion_btn"  href="#" class="easyui-linkbutton btn btn-default" data-options="size:'large',iconAlign:'left'">Aceptar</a>
		</div>
		</div>
			
		
		</form>
		</div>
		<div style="margin:20px 0;"></div>
		<table id="seleccion_dg" class="easyui-datagrid" title="<?php echo $ACCION?>" style="width:98%;height:350px" 
		data-options="queryParams:{control: 'seleccion'}" >
		<thead>
		<tr>
		<th data-options="field:'idseleccion',hidden:true">idseleccion</th>
<th data-options="field:'idLote'">idLote</th>
<th data-options="field:'sefecha'">sefecha</th>
<th data-options="field:'sefechadesde'">sefechadesde</th>
<th data-options="field:'sefechahasta'">sefechahasta</th>
</tr> 
		</thead> 
		</table> 
		<script type="text/javascript"> 
		$(function(){ 
			var seleccion = $("seleccion").TableForm("seleccion",{prefijo:'seleccion',control:'seleccion'});
		});
		</script>
		</div>	
</body>
</html>
		
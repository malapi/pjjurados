<?php include_once("configuracion.php");
include("header.php"); ?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Sorteos</a></li>
		                <li><a href="#">Nuevo Sorteo para Juicio</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Nuevo Sorteo para Juicio</h5>
				    	<span></span>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12" id="divNueva">        
	            <form id="formNuevoSorteo" method="POST" enctype="multipart/form-data">
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="liMenu" id="liMenu" value="liSorteojuicio" />
							<input type="hidden" name="itemMenu" id="itemMenu" value="opSorteoJuicio1" />
							<input type="hidden" name="juicio_accion" id="juicio_accion" value="nuevo" />
							
							<input type="hidden" name="oper" id="oper" value="add" />					    
							<div class="well">	
						          
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
						    
						       <div class="row-fluid">  
								<div class="control-group">
								<div id="respuesta"></div>
								</div> 
								</div>                         
						        <div class="row-fluid">
						         <div class="form-actions align-right">
	                                <button id="btnGuardarJuicio" type="button" class="btn btn-info">Guardar</button>
	                                <button id="btnCancel" type="button" class="btn">Cerrar</button>
	                            </div>
	                            </div>
						     </div>
						</div><!-- /general form elements -->						
					</fieldset> 
 					
				</form>
				<!-- /basic inputs -->
				
				<table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
                <th>Salary</th>
            </tr>
        </thead>
       
    </table>
    
				</div>

		
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/juicio_nuevojuicio.js"></script>
<<script type="text/javascript">
<!--

//-->
$(function() {
    $("#example").dataTable({
          "bServerSide": true,
          "sAjaxSource": "libs/datagrid.php",
          "aoColumns": [{
                "mData":"serialNumber"
              },{
                "mData": "sONumber"
              },{
                "mData": "partNumber"
              },{
                "mData": "desc"
              },{
                "mData":"shippedDate"
              },{
                "mData":"soldDate"
              },{
                "mData":"status"
              }
            ]                      
        });
});
</script>





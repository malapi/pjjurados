<?php include("header.php"); ?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Documentaci&oacute;n</a></li>
		                <li><a href="#">Generar Documentaci&oacute;n</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Listado de Lotes</h5>
				    	
			    	</div>
			    </div>
			    <div class="span12">        
	            <div id="listadoDatos" class="widget">
				</div>
				</div>	
			    <!-- /page header -->
						
				
							
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript">
seleccionarMenu("liDoc","opDoc1");
$.post("Negocios/lotes.php", {oper: 'listParaDoc'}, function(data){      	
$("#listadoDatos").html(data);
$('#data-table').dataTable();
$('.tip').tooltip();
}); 

</script>
<?php include("header.php"); ?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Inicio</a></li>
		                <li><a href="#">Plantillas</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Plantillas</h5>
				    	<span></span>
			    	</div>
			    </div>
			    <!-- /page header -->
						
				<div id="listadoDatos" class="widget">
				</div>
							
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript">
seleccionarMenu("liPla","opPla1");
$.post("Negocios/plantillas.php", {oper: 'tabla'}, function(data){      	
   	$("#listadoDatos").html(data);
   	$('#data-table').dataTable();
   	$('.tip').tooltip();
 });  
</script>


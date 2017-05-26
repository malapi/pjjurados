<?php include("header.php"); ?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Nominas</a></li>
		                <li><a href="#">Nominas Activas</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Listado de Nominas Activas</h5>
			    	</div>
			    </div>
				<div id="listadoDatos" class="widget">
				</div>
							
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript">

$(function(){
	
	seleccionarMenu("liSor","opSor1");
	 $.post("Negocios/lotes.php", {txtFechaDesde:"",txtFechaHasta:"",
		 				txtDescripcion:"", todo:"0",oper: 'tabla'}, function(data){      	
	   	$("#listadoDatos").html(data);
	   	$('#data-table').dataTable();
	   	$('.tip').tooltip();
	 }); 

	}); 
</script>




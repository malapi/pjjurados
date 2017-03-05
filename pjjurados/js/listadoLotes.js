/**
 * 
 */
$(function(){
	
//Modifica Malapi seleccionarMenu("liCon","opCon2");
//
	seleccionarMenu("liSor","opSor2");

 $.post("Negocios/lotes.php", {txtFechaDesde:$("#txtFechaDesde").val(),txtFechaHasta:$("#txtFechaHasta").val(),
	 				txtDescripcion:$("#txtDescripcion").val(), todo:"1",oper: 'tabla'}, function(data){      	
   	$("#listadoDatos").html(data);
   	$('#data-table').dataTable();
   	$('.tip').tooltip();
 }); 

 
 $("#btnBuscarLote").click(function(){
	 $.post("Negocios/lotes.php", {txtFechaDesde:$("#txtFechaDesde").val(),txtFechaHasta:$("#txtFechaHasta").val(),
			txtDescripcion:$("#txtDescripcion").val(), todo:"1",oper: 'tabla'}, function(data){      	
		$("#listadoDatos").html(data);
		$('#data-table').dataTable();
		$('.tip').tooltip();
	 }); 
	 
 });
 
}); 

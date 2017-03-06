/**
 * 
 */

function precargarDatos(){
	
	var idLote = $("#hfIdSorteo").val();
	$.post("Negocios/lotes.php", {oper: 'ver', idLote: idLote}, function(data){ 	 	
		var respuesta = parseInt(data);		
	    if(isNaN(respuesta)){    // como no es un numero, significa que devolvio un json	   
	    	var datos = JSON.parse(data);
	    	$("label[for='informacionLote']").html("<span><b>Lote: </b>"+datos.Descripcion+" &nbsp; <b>Fechas: </b> "+datos.FechaDesde+" - "+datos.FechaHasta+" &nbsp; <b> Observaciones: </b> "+datos.Observaciones+"</span>");
//	    	$("#txtDescripcion").val(datos.Descripcion);
//	    	$("#txtFechaDesde").val(datos.FechaDesde);
//	    	$("#txtFechaHasta").val(datos.FechaHasta);
//	    	$("#txtObs").val(datos.Observaciones);
	    	$.post("Negocios/personas.php", {oper: 'listarXLote', idLote: idLote, txtApellido:$("#txtApellidoB").val(),txtNombre:$("#txtNombreB").val(),
	    		                             txtNroDoc:$("#txtNroDocB").val(),cbTipoDoc:$("#cbTipoDocB").val()}, function(data){ 	 	
	    		$("#listadoDatos").html(data);
	    	   	$('#data-table').dataTable();
	    	   	$('.tip').tooltip();
	    	});
	    	
	    }
	});
      
}


//===== File uploader =====//
$(function(){
	seleccionarMenu("liSor","opSor1");	
	precargarDatos();
	$.post("Negocios/personas.php", {selected: '0', vdefaul: '...', oper: 'comboTD'}, function(data){      	
      	$("#cbTipoDocB").html(data);
    });
	
	$("#btnGuardarDDJJ").click(function(){
		$.post("Negocios/personas.php", {oper: 'listarXLote', idLote: $("#hfIdSorteo").val(), txtApellido:$("#txtApellidoB").val(),txtNombre:$("#txtNombreB").val(),
		            txtNroDoc:$("#txtNroDocB").val(),cbTipoDoc:$("#cbTipoDocB").val()}, function(data){ 	 	
		$("#listadoDatos").html(data);
		$('#data-table').dataTable();
		$('.tip').tooltip();
		});
		
	});
	
	$("#btnBuscarPersona").click(function(){
		$.post("Negocios/personas.php", {oper: 'listarXLote', idLote: $("#hfIdSorteo").val(), txtApellido:$("#txtApellidoB").val(),txtNombre:$("#txtNombreB").val(),
            txtNroDoc:$("#txtNroDocB").val(),cbTipoDoc:$("#cbTipoDocB").val()}, function(data){ 	 	
			$("#listadoDatos").html(data);
			$('#data-table').dataTable();
			$('.tip').tooltip();
		});
	});
	
	
	$("#btnTodas").click(function(){
		$("#cbTipoDocB").val("");
		$("#txtApellidoB").val("");
		$("#txtNombreB").val("");
		$("#txtNroDocB").val("");
		
		$.post("Negocios/personas.php", {oper: 'listarXLote', idLote: $("#hfIdSorteo").val(), txtApellido:"",txtNombre:"",txtNroDoc:"",cbTipoDoc:""}, function(data){ 	 	
		$("#listadoDatos").html(data);
		$('#data-table').dataTable();
		$('.tip').tooltip();
		});
		
	});
	
	
});
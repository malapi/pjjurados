function cargarNotificacion(idLP,FechaNotificacion,ObservacionesEstado)
{
	$("#hfIdLP").val(idLP);
	$("#txtNotificacion").val(FechaNotificacion);
	$("#txtNotificacion").datepicker({dateFormat: 'dd-mm-yy'});
	$("#txtObservacionesEst").val(ObservacionesEstado);	  
	$("#mdlNotificacion").modal({"show" : true}); 
	
}


$(function() {
	
	seleccionarMenu("liSor","opSor1");
	
	$.post("Negocios/localidades.php", {selected: "0", vdefaul: '...', oper: 'combo'}, function(data){      	
      	$("#cbLocalidad").html(data);
    });
	
		
	var idLote = $("#hfIdSorteo").val();
	$.post("Negocios/lotes.php", {oper: 'ver', idLote: idLote}, function(data){ 	 	
		var respuesta = parseInt(data);		
	    if(isNaN(respuesta)){ 
	    	var datos = JSON.parse(data);
	    	$("#txtDescripcion").val(datos.Descripcion);	    
	    }
	});
	
	
	$("#cbLocalidad").change(function () {
        $("#cbLocalidad option:selected").each(function () {
         var elegido=$(this).val();
	         $.post("Negocios/centrosDist.php", {selected: '0', idLocalidad: elegido, vdefaul: '...', oper: 'combo'}, function(data){	             	
	         	$("#cbCentro").html(data);
	         	
	        });   
	         	       
        });
	});
	
	
	$("#cbCentro").change(function () {
        $("#cbCentro option:selected").each(function () {
         var elegido=$(this).val();
         $.post("Negocios/personas.php", {oper: 'listarXCentro', idLote: $("#hfIdSorteo").val(), idCentro: elegido}, function(data){
        	 $("#listadoDatos").html(data);		    	   	
	    	   	$('.tip').tooltip();
	    	});  
	       
        });
	});
	
	
	
	$("#btnClose").click(function(){
		$("#hfIdLP").val("");
		$("#txtNotificacion").val("");
		$("#txtObservacionesEst").val("");	  
		$("#mdlNotificacion").modal("hide"); 
		
	});
		
	$("#btnGuardarNotificacion").click(function(){
		if($("#formCargarNot").validationEngine('validate')){
			$("#respuestaNot").html("");
			$.ajax({
                url: "Negocios/personas.php",
                type: 'post',
                data: $("#formCargarNot").serialize(),
                success: function(resp) {  
                		if(resp == "1")
                		{   
                			$.post("Negocios/personas.php", {oper: 'listarXCentro', idLote: $("#hfIdSorteo").val(), idCentro: $("#cbCentro").val()}, function(data){
                	        	 $("#listadoDatos").html(data);		    	   	
                		    	   	$('.tip').tooltip();
                		    	});
                			 
                			 $("#mdlNotificacion").modal("hide"); 
                			
                		}else
                		$("#respuestaNot").html(resp);
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuestaNot").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
				} 
            });
    
		}
	});
	
})
/**
 * 
 */


$(function() {
	
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
	         
	         $.post("Negocios/personas.php", {oper: 'listarXLoteYLoc', idLote: $("#hfIdSorteo").val(),idLocalidad: elegido}, function(data){ 	 	
		    		$("#listadoDatos").html(data);		    	   	
		    	   	$('.tip').tooltip();
		    	});  
	       
        });
	});
	
	$("#btnSelectTodo").click(function(){
		 $(".selCk").prop("checked", true);
		
	});
	
	$("#btnSelectNinguno").click(function(){
		 $(".selCk").prop("checked", false);
		
	});
	
	$("#btnSelectInvertir").click(function(){
		$(".selCk").each(function (indice, chk) {
            if ($(chk).is(':checked')) {
                $(chk).prop("checked", false);
            } else {
                $(chk).prop("checked", true);
            }
        });		
	});
	
	$("#btnAsociarPersonas").click(function(){
		if($("#formAsociarCentro").validationEngine('validate')){
			$("#respuesta").html("");
			$.ajax({
                url: "Negocios/personas.php",
                type: 'post',
                data: $("#formAsociarCentro").serialize(),
                success: function(resp) {  
                		if(resp == "1")
                		{                			
                			$("#respuesta").html("<div class='alert alert-success' style='margin-top: 16px;'>" +
                           " <button type='button' class='close' data-dismiss='alert'>×</button>"+
                           " 	Los datos se han cargado correctamente"+
                        	"</div>	");
                			
                			$.post("Negocios/personas.php", {oper: 'listarXLoteYLoc', idLote: $("#hfIdSorteo").val(),idLocalidad: $("#cbLocalidad").val()}, function(data){ 	 	
            		    		$("#listadoDatos").html(data);		    	   	
            		    	   	$('.tip').tooltip();
            		    	}); 
                			
                			
                		}else
                		$("#respuesta").html(resp);
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuesta").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
				} 
            });
    
		}
	});
	
})
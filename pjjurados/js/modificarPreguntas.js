/**
 * 
 */


$(function() {
	
	
	seleccionarMenu("liPreg","opPreg2");
	
	var idPregunta = $("#hfIdPreg").val();
	
	$.post("Negocios/preguntas.php", {oper: 'ver', idPregunta: idPregunta}, function(result)
	{ 	 	
		
		var respuesta = parseInt(result);		
		
	    if(isNaN(respuesta)){	
	    	
	    	var datosPreg = JSON.parse(result);
	    	
	    	//alert(result);
	    	
	    	$("#txtPregunta").val(datosPreg.Descripcion);
	    	
	    	$.post("Negocios/categorias.php", {selected: datosPreg.idCategoria, vdefaul: '...', oper: 'combo'}, function(data){      	
	          	$("#cbCategoria").html(data);
	        });
	    	
	    	$.post("Negocios/tiposPreguntas.php", {selected: datosPreg.idTipoRespuesta, vdefaul: '...', oper: 'combo'}, function(data){      	
	          	$("#cbTipoPregunta").html(data);
	        });
	    }
	});
	
	
	
	$("#btnGuardarPregunta").click(function(){
		if($("#formNuevaPregunta").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/preguntas.php",
                type: 'post',
                data: $("#formNuevaPregunta").serialize(),
                success: function(resp) {  
                		if(resp == "1")
                		{                			
                			$("#respuesta").html("<div class='alert alert-success' style='margin-top: 16px;'>" +
                           " <button type='button' class='close' data-dismiss='alert'>×</button>"+
                           " 	La pregunta se ha cargado correctamente"+
                        	"</div>	");
                			
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
});

$(function() {
	seleccionarMenu("liPreg","opPreg2");
	
	$.post("Negocios/categorias.php", {selected: '0', vdefaul: '...', oper: 'combo'}, function(data){      	
      	$("#cbCategoria").html(data);
    });
	
	$.post("Negocios/tiposPreguntas.php", {selected: '0', vdefaul: '...', oper: 'combo'}, function(data){      	
      	$("#cbTipoPregunta").html(data);
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
                			$("#txtPregunta").val('');
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


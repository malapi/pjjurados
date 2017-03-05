/**
 * 
 */

$(document).ready(function(){
	
	$("#btnCC").click(function(){
		
		if(($("#txtpass").val() != "") && ($("#txtRpass").val() != ""))
		{
			if($("#txtpass").val() == $("#txtRpass").val()){
				$.ajax({
	            url: "Negocios/usuario.php",
	            type: "POST",
	            data: {hfidUsu:$("#hfidUsu").val(),txtpass:$("#txtpass").val(),hfUsuario:$("#hfUsuario").val(),oper:"cambiarContrasenia"},
	            success: function(response) {    
	            	if(response == "1"){
	            		$("#txtpass").val("");
	            		$("#txtRpass").val("");	            		
	            		
	            	$("#respuestaCC").html("<div class='alert alert-success'>" +
	       	             "<button type='button' class='close' data-dismiss='alert'>×</button>Se ha realizado el cambio de contraseña con exito</div>");
	            		
	            	}else   	            	
	            		$("#respuestaCC").html(response);
	                 	            	 
	            },
	            error: function(xhr, status, error){		   	        	
   	        	var error = formatErrorMessage(xhr, error);
   	        	$("#respuestaCC").html("<div class='alert alert-error'>" +
                        "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                        error + "</div>");
 			}
	        });
			}else{
				$("#respuestaCC").html("<div class='alert alert-error'>" +
	             "<button type='button' class='close' data-dismiss='alert'>×</button>Las contraseñas no coinciden</div>");				
			}
		}else{
			$("#respuestaCC").html("<div class='alert alert-error'>" +
		             "<button type='button' class='close' data-dismiss='alert'>×</button>Complete todos los datos/div>");
		}
	})
	
	
	
	$("#btnActualizar").click(function(){
		if($("#formModif").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/usuario.php",
                type: 'post',
                data: $("#formModif").serialize(),
                success: function(resp) {
                	
                	$("#respuestaPer").html(resp);
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuestaPer").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
				} 
            });
    
		}
	});
	
	
	
	
});
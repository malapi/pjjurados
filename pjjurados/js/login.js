$(function() {

	function enviarDatos(){
		if($("#formLog").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/validarLogin.php",
                type: 'post',
                data: $("#formLog").serialize(),
                success: function(resp) {  
                		if(resp == "1")
                		{  
                			window.location = "lot_listadoLotesActivos.php"
                		}else
            			  $("#respuesta").html("<div class='alert alert-error'>" +  resp + "</div>");
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuesta").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
				} 
            });
    
		}
		
	}
	
	
	$('#formLog input').keydown(function(e) {
	    if (e.keyCode == 13) {
	    	enviarDatos();
	    }
	});
	
	$("#btnLogin").click(function(){
		enviarDatos();
	});
	
});

	

function editar(id,descripcion)	
{
	$("#txtDescripcionM").val(descripcion);
	$("#respuestaM").html("");
	$("#hfIdLoc").val(id);		
	$("#divModif").show();	
}

$(function() {
		
	seleccionarMenu("liCon","opCon2");
	$("#btnNuevaLoc").click(function(){		
		$("#divNueva").show();
	});
	
	$("#btnCancelNue").click(function(){
		$("#txtDescripcion").val("");		
		$("#respuesta").html("");
		$("#divNueva").hide();
	});
	
	
	$("#btnCancelModif").click(function(){
		$("#txtDescripcionM").val("");
		$("#respuestaM").html("");
		$("#hfIdLoc").val("");		
		$("#divModif").hide();
	});
	
	
	$.post("Negocios/localidades.php", {oper: 'tabla'}, function(data){
		$("#listadoDatos").html(data);
     	$('#data-table').dataTable();
    });

	$("#btnGuardar").click(function(){
		if($("#formNuevaLocalidad").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/localidades.php",
                type: 'post',
                data: $("#formNuevaLocalidad").serialize(),
                success: function(resp) {
                	if(resp == "1")
                	{
                		$("#txtDescripcion").val("");
                		$("#respuesta").html("");
                		$("#divNueva").hide();
                		$.post("Negocios/localidades.php", {oper: 'tabla'}, function(data){
                    		$("#listadoDatos").html(data);
                	     	$('#data-table').dataTable();
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
	
	
	$("#btnModificar").click(function(){
		if($("#formModifLocalidad").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/localidades.php",
                type: 'post',
                data: $("#formModifLocalidad").serialize(),
                success: function(resp) {
                	if(resp == "1")
                	{
                		$("#txtDescripcionM").val("");
                		$("#respuestaM").html("");
                		$("#divModif").hide();
                		$.post("Negocios/localidades.php", {oper: 'tabla'}, function(data){
               	     		$("#listadoDatos").html(data);
	               	     	$('#data-table').dataTable();
               	      	});
                		
                	}else                	
                		$("#respuestaM").html(resp);
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuestaM").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
				} 
            });
    
		}
	});

});
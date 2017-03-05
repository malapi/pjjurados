function editarCategoria(idCategoria,descripcion,orden)	
{
	$("#txtDescripcionM").val(descripcion);
	$("#txtOrdenM").val(orden);
	$("#respuestaM").html("");
	$("#hfIdCat").val(idCategoria);		
	$("#divModif").show();
	
	
}

$(function() {
	
	seleccionarMenu("liPreg","opPreg1");
	$.post("Negocios/categorias.php", {oper: 'tabla'}, function(data){
    		$("#listadoDatos").html(data);
    		$('#data-table').dataTable();
     	});
			
	$("#btnNuevaCat").click(function(){		
		$("#divNueva").show();
	});
	
	$("#btnCancelNueCat").click(function(){
		$("#txtDescripcion").val("");
		$("#txtOrden").val("");
		$("#respuesta").html("");
		$("#divNueva").hide();
	});
	
	
	$("#btnCancelModifCat").click(function(){
		$("#txtDescripcionM").val("");
		$("#txtOrdenM").val("");
		$("#respuestaM").html("");
		$("#hfIdCat").val("");		
		$("#divModif").hide();
	});

	$("#btnGuardarCat").click(function(){
		if($("#formNuevaCategoria").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/categorias.php",
                type: 'post',
                data: $("#formNuevaCategoria").serialize(),
                success: function(resp) {
                	if(resp == "1")
                	{
                		$("#txtDescripcion").val("");
                		$("#txtOrden").val("");
                		$("#respuesta").html("");
                		$("#divNueva").hide();
                		$.post("Negocios/categorias.php", {oper: 'tabla'}, function(data){
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
	
	
	$("#btnModificarCat").click(function(){
		if($("#formModifCategoria").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/categorias.php",
                type: 'post',
                data: $("#formModifCategoria").serialize(),
                success: function(resp) {
                	if(resp == "1")
                	{
                		$("#txtDescripcionM").val("");
                		$("#txtOrdenM").val("");
                		$("#respuestaM").html("");
                		$("#divModif").hide();
                		$.post("Negocios/categorias.php", {oper: 'tabla'}, function(data){
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


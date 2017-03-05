function editar(idImpedimento,descripcion)	
{
	$("#txtDescripcionM").val(descripcion);
	$("#respuestaM").html("");
	$("#hfIdImp").val(idImpedimento);		
	$("#divModif").show();
	
	
}

$(function() {
			
	seleccionarMenu("liCon","opCon1");
	$("#btnNuevoImp").click(function(){		
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
		$("#hfIdImp").val("");		
		$("#divModif").hide();
	});
	
	
	$.post("Negocios/impedimentos.php", {oper: 'tabla'}, function(data){
    		$("#listadoDatos").html(data);
	     	$('#data-table').dataTable();
     	});

	$("#btnGuardar").click(function(){
		if($("#formNuevoImpedimento").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/impedimentos.php",
                type: 'post',
                data: $("#formNuevoImpedimento").serialize(),
                success: function(resp) {
                	if(resp == "1")
                	{
                		$("#txtDescripcion").val("");
                		$("#txtOrden").val("");
                		$("#respuesta").html("");
                		$("#divNueva").hide();
                		$.post("Negocios/impedimentos.php", {oper: 'tabla'}, function(data){
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
		if($("#formModifImpedimento").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/impedimentos.php",
                type: 'post',
                data: $("#formModifImpedimento").serialize(),
                success: function(resp) {
                	if(resp == "1")
                	{
                		$("#txtDescripcionM").val("");
                		$("#txtOrdenM").val("");
                		$("#respuestaM").html("");
                		$("#divModif").hide();
                		$.post("Negocios/impedimentos.php", {oper: 'tabla'}, function(data){
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


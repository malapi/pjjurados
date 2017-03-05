/**
 * 
 */
function editar(id,descripcion, idLoc)	
{
	$("#txtDescripcionM").val(descripcion);
	$("#cbLocalidadM").val(idLoc);
	$("#respuestaM").html("");
	$("#hfId").val(id);	
	$("#divNueva").hide();
	$("#divModif").show();	
}

$(function() {
	seleccionarMenu("liCon","opCon4");		
	
	$("#btnNueva").click(function(){		
		$("#divNueva").show();
	});
	
	$("#btnCancelNue").click(function(){
		$("#txtDescripcion").val("");		
		$("#respuesta").html("");
		$("#cbLocalidad").val("");
		$("#divNueva").hide();
	});
	
	
	$("#btnCancelModif").click(function(){
		$("#txtDescripcionM").val("");
		$("#cbLocalidadM").val("");
		$("#respuestaM").html("");
		$("#hfId").val("");		
		$("#divModif").hide();
	});
	
	$.post("Negocios/localidades.php", {selected: "0", vdefaul: '...', oper: 'combo'}, function(data){      	
      	$("#cbLocalidad").html(data);
      	$("#cbLocalidadM").html(data);
    });
	
	$.post("Negocios/centrosDist.php", {oper: 'tabla'}, function(data){
		$("#listadoDatos").html(data);
     	$('#data-table').dataTable();
    });

	$("#btnGuardar").click(function(){
		if($("#formNuevo").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/centrosDist.php",
                type: 'post',
                data: $("#formNuevo").serialize(),
                success: function(resp) {
                	if(resp == "1")
                	{
                		$("#cbLocalidad").val("");
                		$("#txtDescripcion").val("");
                		$("#respuesta").html("");
                		$("#divNueva").hide();
                		$.post("Negocios/centrosDist.php", {oper: 'tabla'}, function(data){
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
		if($("#formModif").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/centrosDist.php",
                type: 'post',
                data: $("#formModif").serialize(),
                success: function(resp) {
                	if(resp == "1")
                	{
                		$("#cbLocalidadM").val("");
                		$("#txtDescripcionM").val("");
                		$("#respuestaM").html("");
                		$("#divModif").hide();
                		$.post("Negocios/centrosDist.php", {oper: 'tabla'}, function(data){
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
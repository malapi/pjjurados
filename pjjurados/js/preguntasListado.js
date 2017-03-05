function eliminarPregunta(id)
{
	if(confirm("Esta seguro que desea eliminar la pregunta?")){
		
		$.ajax({
            url: "Negocios/preguntas.php",
            type: 'post',
            data:{oper:"del", idPregunta:id},
            success: function(resp) {  
            		if(resp == "1")
            		{                			
            			$("#respuesta").html("<div class='alert alert-success' style='margin-top: 16px;'>" +
                       " <button type='button' class='close' data-dismiss='alert'>×</button>"+
                       " 	La pregunta se ha eliminado correctamente"+
                    	"</div>	");
            			$.post("Negocios/preguntas.php", {oper: 'tabla', categoria:$("#cbCategoria").val(), tipo: $("#cbTipoPregunta").val()}, function(data){
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
}

$(function() {
	
	seleccionarMenu("liPreg","opPreg3");
	
	$.post("Negocios/categorias.php", {selected: '0', vdefaul: '...', oper: 'combo'}, function(data){      	
      	$("#cbCategoria").html(data);
    });
	
	$.post("Negocios/tiposPreguntas.php", {selected: '0', vdefaul: '...', oper: 'combo'}, function(data){      	
      	$("#cbTipoPregunta").html(data);
    });
	
	$.post("Negocios/preguntas.php", {oper: 'tabla', categoria:$("#cbCategoria").val(), tipo: $("#cbTipoPregunta").val()}, function(data){
    		$("#listadoDatos").html(data);
	     	$('#data-table').dataTable();
     	});
		

	$("#btnBuscar").click(function(){
		$.post("Negocios/preguntas.php", {oper: 'tabla', categoria:$("#cbCategoria").val(), tipo: $("#cbTipoPregunta").val()}, function(data){
    		$("#listadoDatos").html(data);
	     	$('#data-table').dataTable();
     	});
		
	});
	
});
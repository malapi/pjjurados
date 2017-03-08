$(function(){
	seleccionarMenuConFormulario('#formNuevoSorteo');
	$("#btnGuardarJuicio").click(function(){
		$("#respuesta").html('');
		//if($("#btnGuardarJuicio").validationEngine('validate')){	
			
			$("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			$.ajax({
                url: "Negocios/accionjuicio.php",
                type: 'post',
                data: $('#formNuevoSorteo').serialize(),
                success: function(resp) {
                	if(!isNaN(resp))
                	{
                	   $("#respuesta").html("<div class='alert alert-success'>" +
                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
                                "Los datos se cargaron correctamente" +
                                "<a href='lot_personasXLote.php?id=" + resp + "'> VER LOTE </a>" +
                                "</div>");
                		
                	}else                	
                		$("#respuesta").html(resp);
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuesta").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
				} 
            });
			
		//}
	});
	
	
});
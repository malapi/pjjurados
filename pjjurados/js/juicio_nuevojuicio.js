/**
 * 
 */

$(function(){
	
	//seleccionarMenu("liSor","opSor3");
	seleccionarMenuConFormulario('#formNuevoSorteo');
	
	
	
	$("#btnGuardarLote").click(function(){
		$("#respuesta").html('');
		if($("#formNuevoSorteo").validationEngine('validate')){	
			
			$("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			$.ajax({
                url: "Negocios/lotesss.php",
                type: 'post',
                data: {oper:"add",descripcion: $("#txtDescripcion").val(),fechaDesde: $("#txtFechaDesde").val(),
                	   fechaHasta: $("#txtFechaHasta").val(),observaciones: $("#txtObs").val(), archivos: archivos},
                	   
                	   
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
			
		}
	});
	
	
});
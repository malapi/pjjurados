function cargarTablaPrincipal(){
	$.post("libs/datagridhtml.php", {control:"juicio"
		,juicio_accion:"verTabla"
			
		,tabla:"Id:idjuicio#Fecha Audiencia:jufechaaudiencia#Fecha inicio:jufechainicio#Fecha Final:jufechafin#Jueces:jujueces#Descripcion:judescripcion#Observacion:juobservacion"
		,eventos:[{titulo:"Editar",href:"juicio_nuevojuicio.php",icono:"icon-edit",accion:"editar"}
		,{titulo:"Sorteo",href:"juicio_sorteo.php",icono:"icon-retweet",accion:"sortear"}
		,{titulo:"Emitir Listados",href:"juicio_emitirlistados.php",icono:"icon-download",accion:"listados"}
		,{titulo:"Audiencia",href:"juicio_audienciaseleccion.php",icono:"icon-eye-open",accion:"audiencia"}
		,{titulo:"Jurado Definitivo",href:"juicio_juradodefinitivo.php",icono:"icon-comment",accion:"juradoDefinitivo"}
		]
					}, function(data){      	
		$("#listadoDatos").html(data);
		$('#data-table').dataTable({
			aaSorting:[[ 0, "desc" ]]
	    });
		$('.tip').tooltip();
		}); 
}

$(function(){
	seleccionarMenuConFormulario('#formNuevoSorteo');
	//alert("lala");
	$("#btnGuardarJuicio").click(function(){
		//$(location).attr("href", "comments.php?aid=1");
		
		$("#respuesta").html('');
		//if($("#btnGuardarJuicio").validationEngine('validate')){	
			
			$("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			$.ajax({
                url: "Negocios/accionjuicio.php",
                type: 'post',
                data: $('#formNuevoSorteo').serialize(),
                success: function(resp) {
                	//alert(resp);
                	var resp = eval('('+resp+')');
                	if(resp.respuesta)
                	{
                	   $("#respuesta").html("<div class='alert alert-success'>" +
                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
                                "" +resp.mensaje+""+
                                "</div>");
                		
                	}else                	
                		$("#respuesta").html(resp.mensaje);
                	
                	cargarTablaPrincipal();
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuesta").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
				} 
            });
			
		//}
	});
	

	cargarTablaPrincipal();
	 
});

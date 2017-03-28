function cargarTablaPrincipal(){
	$.post("libs/datagridhtml.php", {dataForm:$('#formEmitirListados').serialize(),control:"juicionotificaciones"
		,juicionotificaciones_accion:"verTabla"
		,tabla:"Juicio:judescripcion#Fecha Creacion:jnfechageneracion#Plantilla:jnnombreplantilla#Archivo:jnnombrearchivo#Descripcion:jndescripcion"
		,eventos:[]
	}, function(data){
						
						
						$("#listadoDatos").html(data);
						$('#data-table').dataTable();
						$('.tip').tooltip();
		}); 
	
	
	
	
}

$(function(){
	seleccionarMenuConFormulario('#formEmitirListados');
	
	//alert("lala");
	$("#btn_formEmitirListados_Generar").click(function(){
		//$(location).attr("href", "comments.php?aid=1");
		
		$("#respuesta").html('');
		//if($("#btnGuardarJuicio").validationEngine('validate')){	
			
			$("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			$.ajax({
                url: "Negocios/accionjuicio.php",
                type: 'post',
                data: $('#formEmitirListados').serialize(),
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
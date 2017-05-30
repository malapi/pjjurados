function cargarTablaPrincipal(){
	$.post("libs/datagridhtml.php", {dataForm:$('#formJuradoDefinitivo').serialize(),control:"personaseleccion"
		,personaseleccion_accion:"verTabla"
		,tabla:"Apellido:Apellido#Nombre:Nombre#Fecha Seleccion:psfechaseleccion#Fecha Fin Seleccion:psfechafinseleccion#Orden Sel:psnroordenseleccion#Archivo:nombrearchivo"
		,eventos:[{titulo:"Desvincular",href:"juicio_juradodefinitivo.php",icono:"icon-th-list",accion:"editar"}]
					}, function(data){
						if(data.search("<tbody></tbody>")<0){
							//alert("oculto");
							
							$('#divformJuradoDefinitivo').after("<div class='alert alert-success'>" +
	                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
	                                "" +"El Jurado ya fue realizado"+""+
	                                "</div>" );
							
						} else {

							$('#divformJuradoDefinitivo').after("<div class='alert alert-error'>" +
	                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
	                                "" +"El Jurado aun no fue seleccionado!"+""+
	                                "</div>" );
						}
						
						$("#listadoDatos").html(data);
						$('#data-table').dataTable();
						$('.tip').tooltip();
		}); 
	
	
	
	
}

$(function(){
	seleccionarMenuConFormulario('#formJuradoDefinitivo');
//$('#divformJuradoDefinitivo').hide();
	
	//alert("lala");
	$("#btnGenerar").click(function(){
		//$(location).attr("href", "comments.php?aid=1");
		
		$("#respuesta").html('');
		//if($("#btnGuardarJuicio").validationEngine('validate')){	
			
			$("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			$.ajax({
                url: "Negocios/accionjuicio.php",
                type: 'post',
                data: $('#formJuradoDefinitivo').serialize(),
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

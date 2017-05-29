function cargarTablaPrincipal(){
	$.post("libs/datagridhtml.php", {dataForm:$('#formNuevoSorteo').serialize(),control:"personaseleccion"
		,personaseleccion_accion:"verTabla"
		,tabla:"Apellido:Apellido#Nombre:Nombre#Fecha Seleccion:psfechaseleccion#Fecha Fin Seleccion:psfechafinseleccion#Orden Sel:psnroordenseleccion#Nro.Bolilla:psnrobolilla"
		,eventos:[
		]
					}, function(data){
						if(data.search("<tbody></tbody>")<0){
							//alert("oculto");
							$('#divformNuevoSorteo').hide();
							$('#divformNuevoSorteo').after("<div class='alert alert-success'>" +
	                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
	                                "" +"El sorteo ya fue realizado"+""+
	                                "</div>" );
							
						}
						
						$("#listadoDatos").html(data);
						$('#data-table').dataTable();
						$('.tip').tooltip();
		}); 
}

function autocombo_controles(autocombo_id){

	//alert(" autocombo_id "+autocombo_id);
	//alert($("#"+autocombo_id).val());
	
	
	$("#div_candidatos").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
	$.ajax({
        url: "Negocios/accionjuicio.php",
        type: 'post',
        data:{accion:"verificarCandidatos",idjuicio:$("#idjuicio").val(),selmujeres:$("#selmujeres").val(),selhombres:$("#selhombres").val(),idLote:$("#idLote").val()},
        success: function(resp) {
        	//alert(resp);
        	var resp = eval('('+resp+')');
        	if(resp.respuesta)
        	{
        	  $("#div_candidatos").html(resp.retorna);
        		
        	}
        },error: function(xhr, status, error){	
        	var error = formatErrorMessage(xhr, error);			        	
       	     $("#div_candidatos").html("<div class='alert alert-error'>" +
             "<button type='button' class='close' data-dismiss='alert'>×</button>"+
             error + "</div>");
		} 
    });
	
	
}

$(function(){
	seleccionarMenuConFormulario('#formNuevoSorteo');
	
	//alert("lala");
	$("#btnSortearJuicio").click(function(){
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
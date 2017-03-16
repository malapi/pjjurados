function cargarTablaPrincipal(){
	$.post("libs/datagridhtml.php", {dataForm:$('#formFichaPersona').serialize()
		,control:"fichapersona"
		,fichapersona_accion:"verTabla"
		,tabla:"Apellido:Apellido#Nombre:Nombre#DNI:DNI#Lote:idLote#Orden Sel:psnroordenseleccion#Nro.Bolilla:psnrobolilla"
		,eventos:[{titulo:"Ver Informacion Persona",href:"persona_verDatosPersonas.php",icono:"icon-th-list",accion:"consultar"}
		,{titulo:"Emitir Certificacion",href:"persona_emitirlistados.php",icono:"icon-book",accion:"documento"}
		]
					}, function(data){
						/*if(data.search("<tbody></tbody>")<0){
							//alert("oculto");
							$('#divformAudiencia').hide();
							$('#divformAudiencia').after("<div class='alert alert-success'>" +
	                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
	                                "" +"El sorteo ya fue realizado"+""+
	                                "</div>" );
							
						}*/
						
						$("#listadoDatos").html(data);
						$('#data-table').dataTable();
						$('.tip').tooltip();
		}); 
	
	
	
	
}

$(function(){
	seleccionarMenuConFormulario('#formFichaPersona');
	$("#btnBuscarPersona").click(function(){
		$("#respuesta").html('');
		if($("#formFichaPersona").validationEngine('validate')){	
			//$("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			cargarTablaPrincipal();
			
		}
	});
	

	//cargarTablaPrincipal();
	 
});
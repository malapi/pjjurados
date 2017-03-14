function cargarTablaPrincipal(){
	$.post("libs/datagridhtml.php", {dataForm:$('#formAudiencia').serialize(),control:"personaseleccion"
		,personaseleccion_accion:"verTabla"
		,tabla:"Apellido:Apellido#Nombre:Nombre#Fecha Seleccion:psfechaseleccion#Fecha Fin Seleccion:psfechafinseleccion#Orden Sel:psnroordenseleccion#Nro.Bolilla:psnrobolilla"
		,eventos:[{titulo:"Editar",href:"juicio_nuevojuicio.php",icono:"icon-edit",accion:"editar"}
		,{titulo:"Sortear",href:"juicio_sorteo.php",icono:"icon-retweet",accion:"sortear"}
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

function cargarCombos(){
	
	
	
	var opciones = eval($('#idtiposeleccionrecusacion').data('options'));
	opciones = opciones[0];
	//alert(opciones.campotablamostrar+" "+opciones.clavetabla + " "+opciones.control);
	/*$.post("libs/datacombohtml.php", opciones , function(data){
						
						alert(data);
						$("#idpersonaseleccionresultadotipos").html(data);
						//$('#data-table').dataTable();
						//$('.tip').tooltip();
		}); 
	*/
	
    $( "#idtiposeleccionrecusacion" ).autocomplete({
        source: function( request, response ) {
            $.ajax( {
              url: "libs/datacombohtml.php",
              dataType: "jsonp",
              data: {
                filtro:request.term
                ,control:opciones.control
                ,campotabla:opciones.campofiltrar
              },
              success: function( data ) {
            	  response( $.map( data, function( item ) {
                      return {
                          label: item.idpersonaseleccionresultadotipos,
                          value: item.psrtdescripcion
                      }
                  }));
            	  
               // response( data );
              }
            } );
          },
        minLength: 1,
        select: function( event, ui ) {
          alert( "Selected: " + ui.item.value + " aka " + ui.item.id );
        }
      });
    
	
	
}

$(function(){
	seleccionarMenuConFormulario('#formAudiencia');
	cargarCombos();
	
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
	

	//cargarTablaPrincipal();
	 
});
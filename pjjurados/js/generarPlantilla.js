function ordernarPreguntas(){
	var x,orden,ele;
	  var listaElementos = "";
	  var ordenElementos = $(".ui-state-default");			      
    for (x = 0; x < ordenElementos.length; x++){			    	  
  	  ele = ordenElementos[x];			    	  
  	  orden = parseInt(x) + 12;
  	  $("#s"+ele.id).html(orden);
  	  listaElementos += ele.id + ",";
  	}
    //alert(listaElementos);
    $.post("Negocios/plantillas.php", {lista: listaElementos,idPlantilla: $("#hfIdPlantilla").val(), oper: 'ordenarPreguntas'}, function(data){			    	  
  	 //alert(data);
    });
	
}


function cargarPreguntas(){
	$.post("Negocios/plantillas.php", {idPlantilla: $("#hfIdPlantilla").val(), oper: 'verPreguntas'}, function(data){      	
       	
		$("#completarPlantilla").html(data);
       	ordernarPreguntas();
       	$( ".sortable" ).sortable({
			revert: true,
			placeholder: "ui-state-highlight",
			update: function(){		
				ordernarPreguntas();  			      
			   } 
		});
		$( "#draggable" ).draggable({
			connectToSortable: ".sortable",
			helper: "clone",
			revert: "invalid",
			cursor: "move"
		});
		$( "ul, li" ).disableSelection();
     });
	
}

function cargarPreguntasSM(){
	$.post("Negocios/plantillas.php", {idPlantilla: $("#hfIdPlantilla").val(), oper: 'verPreguntas'}, function(data){
		$("#completarPlantilla").html(data);
		$(".btn-danger").hide();
	 });	
	
}

function precargarDatos(){
	
	$.post("Negocios/plantillas.php", {idPlantilla: $("#hfIdPlantilla").val(), oper: 'ver'}, function(data){      	
		var respuesta = parseInt(data);
	    if(isNaN(respuesta))
	    { 
	    	var datos = JSON.parse(data);	    	
	    	$("#verTitulo").html(datos.Descripcion);
	    	$("#divTituloPlan").hide();
	    	$("#divPlantilla").show();
	    	
	    	if($("#hfOP").val() != ""){
	    		$("#divCargarPreg").hide();	
	    		cargarPreguntasSM()
	    	}
	    	else{	    	
		    	if(datos.modificar == "0"){
		    		$("#divCargarPreg").hide();	
		    		cargarPreguntasSM()
		    	}else{
		    		$("#divCargarPreg").show();	    		
		    		cargarPreguntas();
		    	}
	    	}
	    	
	    }
     });
	
}


function EliminarPregunta(idPregunta,idPlantilla){
	if(confirm("Est\u00E1 seguro que desea eliminar la pregunta de la plantilla?"))
	{
	$.ajax({
        url: "Negocios/plantillas.php",
        type: 'post',
        data: {idPlantilla:idPlantilla,idPregunta:idPregunta, oper:'delPregunta'},
        success: function(resp) 
        {
        	var resultado = parseInt(resp);
    	    if(!isNaN(resultado)){//
    	    	cargarPreguntas(); 
        	}
        	else                	
        		$("#respuestaPreg").html(resp);
        	
        },error: function(xhr, status, error){	
        	var error = formatErrorMessage(xhr, error);			        	
       	     $("#respuestaPreg").html("<div class='alert alert-error'>" +
             "<button type='button' class='close' data-dismiss='alert'>X</button>"+
             error + "</div>");
		} 
    });
	}
}



$(function() {
	
	seleccionarMenu("liPla","opPla2");
	
	$.post("Negocios/categorias.php", {selected: '0', vdefaul: '...', oper: 'combo'}, function(data){      	
      	$("#cbCategoria").html(data);
    });
	
	
	
	$("#cbCategoria").change(function () {
        $("#cbCategoria option:selected").each(function () {
         var elegido=$(this).val();
         
         $.post("Negocios/preguntas.php", {selected: '0',categoria: elegido , vdefaul: '...', oper: 'combo'}, function(data){      	
           	$("#cbPregunta").html(data);
         });           
     });
    });
	
	if($("#hfIdPlantilla").val() != ""){
		
		precargarDatos();
	}
	
	
	$("#btnAgregarPregunta").click(function(){
		
		if($("#formAgregarPregunta").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/plantillas.php",
                type: 'post',
                data: $("#formAgregarPregunta").serialize(),
                success: function(resp) 
                {
                	var resultado = parseInt(resp);
    	    	    if(!isNaN(resultado)){//
    	    	    	$("#cbCategoria").val("");
    	    	    	$("#cbPregunta").val("");
    	    	    	$("#txtOrden").val("");
    	    	    	cargarPreguntas(); 
                	}
                	else                	
                		$("#respuestaPreg").html(resp);
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuestaPreg").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>X</button>"+
                     error + "</div>");
				} 
            });
    
		}
	});
	
	
	$("#btnGenerarPlantilla").click(function(){
		
		if($("#formNuevaPlantilla").validationEngine('validate')){			
			$.ajax({
                url: "Negocios/plantillas.php",
                type: 'post',
                data: $("#formNuevaPlantilla").serialize(),
                success: function(resp) 
                {
                	var resultado = parseInt(resp);
    	    	    if(!isNaN(resultado)){//
                		$("#verTitulo").html($("#txtTitulo").val());
                		$("#hfIdPlantilla").val(resultado);
                		$("#txtTitulo").val("");
                		$("#divTituloPlan").hide();
                		$("#divPlantilla").show();                		
                	}
                	else                	
                		$("#respuesta").html(resp);
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuesta").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>X</button>"+
                     error + "</div>");
				} 
            });
    
		}
	});
	
});
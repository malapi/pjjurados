/**
 * 
 */

function buscarPersonas(){
	
	$("#respuesta").html('');
	if($("#formBuscarPers").validationEngine('validate')){	
	
		$("#listadoDatos").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
		$.ajax({
            url: "Negocios/personas.php",
            type: 'post',
            data: $("#formBuscarPers").serialize(),
            success: function(resp) 
            {
            	$("#listadoDatos").html(resp);
            	$('.tip').tooltip();
            	$("#btnGenerarIntimaciones").show();
            	$("#hfIdLote").val($("#cbLote").val());
            	
            },error: function(xhr, status, error){	
	        	var error = formatErrorMessage(xhr, error);			        	
           	     $("#respuesta").html("<div class='alert alert-error'>" +
                 "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                 error + "</div>");
			} 
        });
	}	
}

//===== File uploader =====//
$(function(){	
	seleccionarMenu("liSor","opSor5");
	
	$("#btnSelectTodo").click(function(){
		 $(".selCk").prop("checked", true);
		
	});
	
	$("#btnSelectNinguno").click(function(){
		 $(".selCk").prop("checked", false);
		
	});
	
	$("#btnSelectInvertir").click(function(){
		$(".selCk").each(function (indice, chk) {
           if ($(chk).is(':checked')) {
               $(chk).prop("checked", false);
           } else {
               $(chk).prop("checked", true);
           }
       });		
	});
	
	$.post("Negocios/lotes.php", {selected: '0', vdefaul: '...', oper: 'comboAC'}, function(data){
      	$("#cbLote").html(data);
    });
	
	$.post("Negocios/personas.php", {selected: "0", vdefaul: '...', oper: 'comboTD'}, function(data){      	
      	$("#cbTipoDocB").html(data);
    });
	
	$("#cbLote").change(function () {
        $("#cbLote option:selected").each(function () {
         var elegido=$(this).val();
         $.post("Negocios/notificaciones.php", {oper:'verUltima', hfIdSorteo:$("#cbLote").val()}, function(data){ 	 	
     		var respuesta = parseInt(data);	
     		//alert(data);
     	    if(isNaN(respuesta)){    // como no es un numero, significa que devolvio un json
     	    	var datos = JSON.parse(data);
     	    	if(datos.PlantillaIntimacion != "" && datos.PlantillaIntimacion != null)
     	    	{
	     	    	$("#hfArchiCedula").val(datos.PlantillaIntimacion);
	     	    	$('#resultado').html("<a href='uploads/plantillas/" + datos.PlantillaIntimacion + "'>" + datos.PlantillaIntimacion + "</a>");     	    	
     	    	}else{
     	    		$("#hfArchiCedula").val("");
	     	    	$('#resultado').html("");
     	    		
     	    	}
     	    }
     	});
	       
        });
	});
	
	
	var btnUpload=$('#upload');
	var status=$('#status');
	
	new AjaxUpload(btnUpload, {
		action: 'upload-filePlantilla.php',
		name: 'uploadfilePlantilla',
		onSubmit: function(file, ext){
			$('#resultado').html("");
			 if (! (ext && /^(rtf|rtf)$/.test(ext))){ 
                // extension is not allowed 
				status.text('Tipo de archivo no valido.');
				return false;
			}
			status.html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
		},
		onComplete: function(file, response){
			//On completion clear the status
			status.text('');
			//Add uploaded file to list
			//alert(response);
			if(response != 0){
				$('#hfArchiCedula').val(response);
				$('#resultado').html("El archivo " + response + " se recibi&oacute; correctamente");
			} else{
				$('#resultado').html(file).addClass('error');
			}
		}
	});
	
	
	$("#btnBuscarPersona").click(function(){
		 buscarPersonas();
	});
	
	$("#btnTodas").click(function(){
		$("#cbTipoDocB").val("");
		$("#txtApellidoB").val("");
		$("#txtNombreB").val("");
		$("#txtNroDocB").val("");
		 buscarPersonas();
	});
	
	
	$("#btnGenerarIntimaciones").click(function(){
		if($("#hfArchiCedula").val() != ""){
			$("#respuesta").html("");
			$.ajax({
                url: "Negocios/personas.php",
                type: 'post',
                data: $("#formGenerarInt").serialize(),
                success: function(resp) {  
            		if(resp != "0")
            		{                			
            		   $("#respuestaInt").html("<div class='alert alert-success' style='margin-top: 16px;'>" +
                       " <button type='button' class='close' data-dismiss='alert'>×</button>"+
                       " Se han generado las intimaciones. Descargar Archivo " + resp +
                       "</div>	");                			
            			
            		}else
            		$("#respuestaInt").html("<div class='alert alert-error'>" +
                            "<button type='button' class='close' data-dismiss='alert'>×</button> Error al generar las Intimaciones</div>");
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuestaInt").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
				} 
            });
    
		}else{
			$("#respuestaInt").html("<div class='alert alert-error'>" +
            "<button type='button' class='close' data-dismiss='alert'>×</button> Debe carga la plantilla para las notificaciones</div>");
		}
	});
	
	
	
});
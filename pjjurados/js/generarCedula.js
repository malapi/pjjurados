/**
 * 
 */

	
function validarEnvio(){
    var bandera = true;
    var mensaje="";
    $("#respuestaCe").html("");
    if($("#txtNroCedula").val() == ""){
        bandera = false
        mensaje += "Debe cargar el nro inicial de cedula <br />";
    }

    if($("#hfArchiCedula").val() == ""){
        bandera = false
        mensaje += "No se ha cargado el modelo de la notificaci&oacute;n<br />";
    }
    
    if($("#hfArchiSobre").val() == ""){
        bandera = false
        mensaje += "No se ha cargado el modelo del sobre<br />";
    }
    var carta = CKEDITOR.instances.txtCarta.getData();
    if(carta == ""){
        bandera = false
        mensaje += "Debe cargar la carta de presentaci&oacute;n<br />";
    }
    
    
    if(!bandera){
        $("#respuestaCe").html("<div class='alert alert-danger'>" +mensaje+"</div>");
        
    }
    return bandera;
}

function precargarDatos(){
	$("#formGenerarCedulas").show();
	var idLote = $("#hfIdSorteo").val();
	$.post("Negocios/lotes.php", {oper: 'ver', idLote: idLote}, function(data){ 	 	
		var respuesta = parseInt(data);		
	    if(isNaN(respuesta)){    // como no es un numero, significa que devolvio un json	   
	    	
	    	var datos = JSON.parse(data);
	    	$("#txtDescripcion").val(datos.Descripcion);
	    	$("#txtExpediente").val(datos.Descripcion);
	    	$("#txtFechaDesde").val(datos.FechaDesde);
	    	$("#txtFechaHasta").val(datos.FechaHasta);
	    	$("#txtObs").val(datos.Observaciones);	
	    	
                $.post("Negocios/lotes.php", {oper: 'ChekearPlantilla', idLote: idLote}, function(respu){ 
                   //alert(respu);
                   if(respu != "1") {
                       $("#formGenerarCedulas").hide();
                       $("#respuestaPlantilla").html(respu);
                   }else{
                       $("#formGenerarCedulas").show();
                       $("#respuestaPlantilla").html(""); 
                   }
                });
	    }
	});
    
	
	$.post("Negocios/notificaciones.php", {oper: 'verUltima',hfIdSorteo:$("#hfIdSorteo").val()}, function(data){ 	 	
            var respuesta = parseInt(data);	
            //alert(data);
	    if(isNaN(respuesta)){    // como no es un numero, significa que devolvio un json
	    	var datos = JSON.parse(data);
	    	$("#txtNroCedula").val(datos.NroCedula);
	    	$("#hfArchiCedula").val(datos.PlantillaNotificacion);
	    	$('#resultado').html("<a href='uploads/plantillas/" + datos.PlantillaNotificacion + "'>" + datos.PlantillaNotificacion + "</a>");
	    	$('#hfArchiSobre').val(datos.PlantillaSobres);
			$('#resultadoSo').html("<a href='uploads/plantillas/" + datos.PlantillaNotificacion + "'>" + datos.PlantillaSobres + "</a>");
			$("#txtCarta").val(datos.CartaSaludo);
			
			if(datos.idNotificacion != "0"){
				$("#txtNroCedula").attr('readonly', true);				
			}else{				
				$("#txtNroCedula").attr('readonly', false);
			}
	    }
	});
}


$(function() {
	
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
	
	
	var btnUploadS=$('#uploadSo');
	var statuSo=$('#statusSo');
	
	new AjaxUpload(btnUploadS, {
		action: 'upload-filePlantilla.php',
		name: 'uploadfilePlantilla',
		onSubmit: function(file, ext){
			$('#resultadoSo').html("");
			 if (! (ext && /^(rtf|rtf)$/.test(ext))){ 
                // extension is not allowed 
				 statuSo.text('Tipo de archivo no valido.');
				return false;
			}
			 statuSo.html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
		},
		onComplete: function(file, response){
			//On completion clear the status
			statuSo.text('');
			//Add uploaded file to list
			//alert(response);
			if(response != "0"){
				$('#hfArchiSobre').val(response);	
				$('#resultadoSo').html("El archivo " + response + " se recibi&oacute; correctamente");
			} else{
				$('#resultadoSo').html(file).addClass('error');
			}
		}
	});
	
	
	
	precargarDatos();
	CKEDITOR.replace('txtCarta',{toolbar : 'Basic'});	
	
	
	$("#btnGenerarCedula").click(function(){
            if($("#formGenerarCedulas").validationEngine('validate'))
            {	
                if(validarEnvio()){
                    $("#respuestaCe").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
                    $("#hfCartaSaludo").val(CKEDITOR.instances.txtCarta.getData());

                    var formData = new FormData($('#formGenerarCedulas')[0]);
                     $("#respuestaCe").html("");
                    $.ajax({
                        url: "Negocios/notificaciones.php",
                        type: 'post',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function(resp) {
                            if(resp == "1")
                            {
                                    $("#respuestaCe").html("<div class='alert alert-success'>" +
                                    "<button type='button' class='close' data-dismiss='alert'>×</button>" +
                                    "Las C&eacute;dulas se generaron correctamente" +
                                    "</div>");

                                    $("#btnImprimirCedula").show();

                            }else                	
                                    $("#respuestaCe").html(resp);

                        },error: function(xhr, status, error){	
                                        var error = formatErrorMessage(xhr, error);			        	
                                     $("#respuestaCe").html("<div class='alert alert-error'>" +
                             "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                             error + "</div>");
                                    } 
                    });
    
		}
            }
	});
	
	
});
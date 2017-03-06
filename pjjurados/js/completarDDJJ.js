/**
 * 
 */

function valNoNot(field, rules, i, options){
	if($("#cbResultado").val() == "5" || $("#cbResultado").val() == "3")
	{	
	  if (field.val() == "") {	     
		  rules.push('required');
	  }
	}
}

function valOb(field, rules, i, options){
	if($("#cbResultado").val() == "4" || $("#cbResultado").val() == "5")
	{	
	  if (field.val() == "") {	     
		  rules.push('required');
	  }
	}
}

function valNoRec(field, rules, i, options){
	if($("#cbResultado").val() == "3")
	{	
	  if (field.val() == "") {	     
		  rules.push('required');
	  }
	}
}

function valApto(field, rules, i, options){
	if($('#rbSi').is(':checked'))
	{	
	  if (field.val() == "") {	     
		  rules.push('required');
	  }
	}
}


function valchekApto(field, rules, i, options){
	if($("#cbResultado").val() == "3")
	{	
	  if (!$('#rbSi').is(':checked') && !$('#rbNO').is(':checked') ) {	     
		  rules.push('required');
	  }
	}
}


function precargarDatos(){
	
	var idPersona = $("#hfIdPer").val();
	var idLote = $("#hfIdLote").val();
	$.post("Negocios/personas.php", {oper: 'ver', idPersona: idPersona, idLote: idLote}, function(data){ 	 	
		
		var respuesta = parseInt(data);		
		//alert(data);
	    if(isNaN(respuesta)){ 
	    	// como no es un numero, significa que devolvio un json  
	    	var datos = JSON.parse(data);
	    	$("#hfIdLP").val(datos.idLP);
	    	$("#txtApellido").val(datos.Apellido);
	    	$("#txtNombre").val(datos.Nombre);
	    	$("#txtNroDoc").val(datos.DNI);
	    	$("#txtPersona").html("&nbsp;&nbsp;N&deg; de C&eacute;dula:"+datos.NroCedula+" "+datos.Apellido+", "+datos.Nombre);
	    	$("#cbSexo").val(datos.Sexo);
	    	$("#txtCUIL").val(datos.CUIL);
	    	$("#txtFechaNac").val(datos.FechaNacimiento);
	    	
	    	$("#txtDomicilio").val(datos.Domicilio);
	    	$("#txtProfesion").val(datos.Profesion);
	    	$("#txtOcupacion").val(datos.Ocupacion);
	    	$("#txtCarTF").val(datos.CaracteristicaFijo);
	    	$("#txtTelFijo").val(datos.TelefonoFijo);
	    	$("#txtCarTC").val(datos.CaracteristicaCelu);
	    	$("#txtTelCelu").val(datos.TelefonoCelular);
	    	$("#txtEmail").val(datos.CorreoElectronico);
	    	$("#txtNacionalidad").val(datos.Nacionalidad);
	    	$("#txtLugarNac").val(datos.LugarNacimiento);
	    	
	    	$.post("Negocios/personas.php", {selected: datos.idTipoDocumento, vdefaul: '...', oper: 'comboTD'}, function(data){      	
                    $("#cbTipoDoc").html(data);
	        });
	    	
	    	$.post("Negocios/localidades.php", {selected: datos.idLocalidad, vdefaul: '...', oper: 'combo'}, function(data){      	
                    $("#cbLocalidad").html(data);
	        });
	    	
	    	/*$("#cbResultado").val(datos.idEstadoDDJJ);
	    	$("#txtNotificacion").val(datos.FechaNotificacion);
	    	$("#txtIntimacion").val(datos.FechaIntimacion);
                $("#txtRecepcion").val(datos.FechaRecepcionDDJJ);
	    	$("#txtObservacionesEst").val(datos.ObservacionesEstado);*/
	    	
                $.post("Negocios/personas.php", {oper: 'resultadoDDJJ', idPersona: idPersona, idLote: idLote}, function(data){ 	 
		
		var respuesta = parseInt(data);	
		//alert(data);
                    if(isNaN(respuesta)){ 	   
                        var respuesta = JSON.parse(data);
                           if(respuesta.idEstadoDDJJ == "1"){
                                   $("#divResultado").hide();			   
                           }else{
                                   $("#divResultado").show();
                           }

                                $("#cbResultado").val(respuesta.idEstadoDDJJ);
                                $("#txtNotificacion").val(respuesta.FechaNotificacion);
                                $("#txtIntimacion").val(respuesta.FechaIntimacion);
                                $("#txtRecepcion").val(respuesta.FechaRecepcionDDJJ);
                                $("#txtObservacionesEst").val(respuesta.ObservacionesEstado);
                                $("#cbImpedimento").val(respuesta.idTipoImpedimento);
                                $("#txtObservacionesImp").val(respuesta.ObservacionesImpedimento);

                                $.post("Negocios/impedimentos.php", {selected: respuesta.idTipoImpedimento, vdefaul: '...', oper: 'combo'}, function(data){
                                        $("#cbImpedimento").html(data);
                                });


                                if(respuesta.AptoJurado == "1")
                                {
                                    $('#rbSi').attr('checked', true); 
                                    $('#rbNO').attr('checked', false);
                                }

                                if(respuesta.AptoJurado == "0")
                                {
                                    $('#rbSi').attr('checked', false); 
                                    $('#rbNO').attr('checked', true);
                                }

                    }
                });
                
                
                //Se completo la declaracion jurada...
                if(datos.idEstadoDDJJ == "3"){
                   $("#divDDJJ").show(); 
                    $.post("Negocios/plantillas.php", {idLote: idLote, idPersona: idPersona, oper: 'planillaXPersona'}, function(respuestaPla){ 	 	
	    		$("#completarPlantilla").html(respuestaPla);
                        if ($("input[name='rbApto']:checked").val() == '0'){
                        $(".apto").show();
                        }else{
                                $(".apto").hide();
                        }
                                });
                    
                }else{     
                    //buscar plantilla en blanco
                    $.post("Negocios/plantillas.php", {idLote: idLote, oper: 'plantXLote'}, function(respuestaPla){ 	 	
	    		$("#completarPlantilla").html(respuestaPla);	    		
                    });
                }
                
                
                
                
                
                
                
	    }
	});
      
}

$(function() {
	
	precargarDatos();
	
	$("#cbResultado").change(function () {
            $("#cbResultado option:selected").each(function () {
                var elegido=$(this).val();
               // alert(elegido);
                if(elegido == "3"){
                        $("#divDDJJ").show();
                }else{
                        $("#divDDJJ").hide();
                }

            });
	});
	
	 $("input[name='rbApto']").change(function() 
	{
            if ($("input[name='rbApto']:checked").val() == '0'){
                    $(".apto").show();
            }else{
                    $(".apto").hide();
            }
	});
		
	 $.post("Negocios/impedimentos.php", {selected: '0', vdefaul: '...', oper: 'combo'}, function(data){
	      	$("#cbImpedimento").html(data);
	    });
	 
	 
	$("#btnGuardarDDJJ").click(function(){
		$("#respuesta").html('');
		if($("#formResultadoPersona").validationEngine('validate')){	
			
                    $("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
                    $.ajax({
                    url: "Negocios/personas.php",
                    type: 'post',
                    data: $("#formResultadoPersona").serialize(),                	   
                    success: function(resp) {
                            if(!isNaN(resp))
                            {
                               $("#respuesta").html("<div class='alert alert-success'>" +
                                    "<button type='button' class='close' data-dismiss='alert'>×</button>" +
                                    "Los datos fueron cargados correctamente" +
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
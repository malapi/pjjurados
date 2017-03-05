/**
 * 
 */


function cargarDatosPersona(){
	
	var idPersona = $("#hfIdPer").val();
	var idLote = $("#hfIdLote").val();
	$.post("Negocios/personas.php", {oper: 'ver', idPersona: idPersona, idLote: idLote}, function(data){ 	 	
		
		var respuesta = parseInt(data);		
		//alert(data);
	    if(isNaN(respuesta)){    // como no es un numero, significa que devolvio un json	   
	    	
	    	var datos = JSON.parse(data);
	    	$("#hfIdLP").val(datos.idLP);
	    	$("#txtApellido").val(datos.Apellido);
	    	$("#txtNombre").val(datos.Nombre);
	    	$("#txtNroDoc").val(datos.DNI);
	    	$("#txtNroCedula").val(datos.NroCedula);
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
	    		    
	    	
	    	
	    }
	});
      
}


function cargarDatosLote(){
	
	var idPersona = $("#hfIdPer").val();
	var idLote = $("#hfIdLote").val();
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
			
			if(respuesta.idEstadoDDJJ == 3)
			{
                            $.post("Negocios/personas.php", {idLote: idLote, idPersona: idPersona, oper: 'plantXLoteCompleto'}, function(respuestaPla){ 	 	
		    		$("#completarPlantilla").html(respuestaPla);	    		
                            });
			}
	    }
	});
}


$(function() {
	
	cargarDatosPersona();
	cargarDatosLote();
	
	
});	


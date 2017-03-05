/**
 * 
 */

function precargarDatos(){
	
	var idPersona = $("#hfIdPer").val();
	var idLote = $("#hfIdLote").val();
	$.post("Negocios/personas.php", {oper: 'ver', idPersona: idPersona, idLote: idLote}, function(data){ 	 	
		
		var respuesta = parseInt(data);		
	    if(isNaN(respuesta)){    // como no es un numero, significa que devolvio un json	   
	    	
	    	var datos = JSON.parse(data);
	    	
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
	    	
	    	/*$.post("Negocios/comisarias.php", {selected: datos.idComisaria, idLocalidad: datos.idLocalidad, vdefaul: '...', oper: 'combo'}, function(data){      	
	          	alert(data);
	    		$("#cbComisaria").html(data);
	        });
	    	
	    	
	    	$("#cbLocalidad").change(function () {
	            $("#cbLocalidad option:selected").each(function () {
	             var elegido=$(this).val();

	             $.post("Negocios/comisarias.php", {selected: '0', idLocalidad: elegido, vdefaul: '...', oper: 'combo'}, function(data){	             	
	             	$("#cbComisaria").html(data);
	            });            
	            });
	    	});*/
	    }
	});
      
}

$(function() {
	
	
	precargarDatos();
	
	
	
	$("#btnActualizarPersona").click(function(){
		$("#respuesta").html('');
		if($("#formModificarPersona").validationEngine('validate')){	
			
			$("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			$.ajax({
                url: "Negocios/personas.php",
                type: 'post',
                data: $("#formModificarPersona").serialize(),                	   
                success: function(resp) {
                	if(!isNaN(resp))
                	{
                	   $("#respuesta").html("<div class='alert alert-success'>" +
                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
                                "Los datos se actualizaron correctamente" +
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
function cargarDatosPersonaHTML(){
	seleccionarMenuConFormulario('#formVerDatosPersona');
	
	$.post("Negocios/accionseleccion.php", $('#formVerDatosPersona').serialize(), function(data){ 	 	
		$("#verInformacion").html(data);
	    
	});
      
}

$(function() {
	cargarDatosPersonaHTML();
});	


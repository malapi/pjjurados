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
            success: function(resp) {
            	$("#listadoDatos").html(resp);
            	$('#data-table').dataTable();
            	$('.tip').tooltip();
            	
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
	seleccionarMenu("liSor","opSor4");
	
	$.post("Negocios/lotes.php", {selected: '0', vdefaul: '...', oper: 'combo'}, function(data){
      	$("#cbLote").html(data);
    });
	
	$.post("Negocios/personas.php", {selected: "0", vdefaul: '...', oper: 'comboTD'}, function(data){      	
      	$("#cbTipoDocB").html(data);
    });
	
	$("#btnBuscarPersona").click(function(){
		 buscarPersonas();
	});
	
	
	$("#btnTodas").click(function(){
		$("#cbTipoDocB").val("");
		$("#txtApellidoB").val("");
		$("#txtNombreB").val("");
		$("#txtNroDocB").val("");
		$("#txtNroDocB").val("");
		$('#cbResultado').val(""); 
		$('#ckApto').attr('checked', false); 
		$('#ckNoApto').attr('checked', false); 
		
		 buscarPersonas();
	});
	
	
	$("#btnExportar").click(function(){
	
		var apto ="";
		if($("#ckApto").is(':checked')) {
			apto = "1";
		}
		
		if($("#ckNoApto").is(':checked')) {
			apto = "0";
		}
							
		window.open("rep_exportarPersonasXLote.php?cbLote=" + $("#cbLote").val() 
		     + "&cbTipoDocB="+$("#cbTipoDocB").val()
		     + "&txtNroDocB="+$("#txtNroDocB").val()
		     + "&txtApellidoB="+$("#txtApellidoB").val()
		     + "&txtNombreB="+$("#txtNombreB").val()
		     + "&ckAptos="+apto+ "&idEstado="+$('#cbResultado').val());
	});
	
	
});
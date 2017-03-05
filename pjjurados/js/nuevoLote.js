/**
 * 
 */

/**************ADJUNTAR ARCHIVOS**********************/
function insertarRow(idT,file){
		var myTable=document.getElementById(idT);
		var row=myTable.insertRow(myTable.rows.length);
		var cel0=row.insertCell(0);
		var cel1=row.insertCell(1);
		var cel2=row.insertCell(2);
		cel0.innerHTML= file;
		cel1.innerHTML="<a href='uploads/" + file + "' target='_blank'>[ver...]</a>";
		cel2.innerHTML="<a href='#' onclick=\"borrarRow('" + idT + "',this.parentNode.parentNode.rowIndex)\">[X]</a>";
	}


function borrarRow(idT,Numero){
	var myTable=document.getElementById(idT);
	myTable.deleteRow(Numero);
}

function obtenerArchivos(id){	
	var myTable=document.getElementById(id);
	var rows=myTable.rows;
	var archis = "";
	var cell;
	for(var i=0; i< rows.length; i++){
		if(i>0)
			archis += "||";	
		archis +=  rows[i].cells[0].innerHTML;
	}
	return archis; 
}



//===== File uploader =====//
$(function(){
	
	seleccionarMenu("liSor","opSor3");
	
	//alert(menuS);
	var btnUpload=$('#upload');
	var status=$('#status');
	
	new AjaxUpload(btnUpload, {
		action: 'upload-file.php',
		name: 'uploadfile',
		onSubmit: function(file, ext){
			$('#resultado').html("");
			 if (! (ext && /^(xls|xlsx)$/.test(ext))){ 
                // extension is not allowed 
				status.text('Tipo de archivo no valido.');
				return false;
			}
			status.text('Subiendo...');
		},
		onComplete: function(file, response){
			//On completion clear the status
			status.text('');
			//Add uploaded file to list
			//alert(response);
			if(response != "0"){
				insertarRow('files',response);				
			} else{
				$('#resultado').html(file).addClass('error');
			}
		}
	});
	
	
	$("#btnGuardarLote").click(function(){
		$("#respuesta").html('');
		if($("#formNuevoSorteo").validationEngine('validate')){	
			var archivos = obtenerArchivos("files");			
			if(archivos == ""){
				 $("#respuesta").html("<div class='alert alert-error'>" +
	                     "<button type='button' class='close' data-dismiss='alert'>×</button>No se cargaron los archivos correspondientes</div>");
			}else{
			$("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			$.ajax({
                url: "Negocios/lotes.php",
                type: 'post',
                data: {oper:"add",descripcion: $("#txtDescripcion").val(),fechaDesde: $("#txtFechaDesde").val(),
                	   fechaHasta: $("#txtFechaHasta").val(),observaciones: $("#txtObs").val(), archivos: archivos},
                	   
                	   
                success: function(resp) {
                	if(!isNaN(resp))
                	{
                	   $("#respuesta").html("<div class='alert alert-success'>" +
                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
                                "Los datos se cargaron correctamente" +
                                "<a href='lot_personasXLote.php?id=" + resp + "'> VER LOTE </a>" +
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
		}
	});
	
	
});
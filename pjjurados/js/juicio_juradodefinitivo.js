function cargarTablaPrincipal(){
	$.post("libs/datagridhtml.php", {dataForm:"idjuicio="+$('#idjuicio').val()+"&psnrojurado=is+not+null"+"",control:"personaseleccion"
		//$('#formJuradoDefinitivo').serialize()
	
		,personaseleccion_accion:"verTabla"
		,tabla:"Apellido:Apellido#Nombre:Nombre#Fecha Seleccion:psfechaseleccion#Fecha Fin Seleccion:psfechafinseleccion#Orden Sel:psnroordenseleccion#Archivo:nombrearchivo"
		,eventos:[{titulo:"Desvincular",href:"juicio_juradodefinitivo.php",icono:"icon-th-list",accion:"desvincular"}]
					}, function(data){
						if(data.search("<tbody></tbody>")<0){
							//alert("oculto");
							
							/*$('#divformJuradoDefinitivo').after("<div class='alert alert-success'>" +
	                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
	                                "" +"El Jurado ya fue realizado"+""+
	                                "</div>" );*/
							
						} else {

							$('#divformJuradoDefinitivo').after("<div class='alert alert-error'>" +
	                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
	                                "" +"El Jurado aun no fue seleccionado!"+""+
	                                "</div>" );
						}
						
						$("#listadoDatos").html(data);
						$('#data-table').dataTable();
						$('.tip').tooltip();
		}); 
	
	
	
	
}


function cargarTablaDocumentos(){
	$.post("libs/datagridhtml.php", {dataForm:"idseleccion="+$('#idseleccion').val()+"&idPersona="+$('#idPersona').val()+""
	//$('#formAudiencia').serialize()
		,control:"personaselecciondocumento"
		,tablahtml:"personaselecciondocumento"
		,personaselecciondocumento_accion:"verTabla"
		,tabla:"Descripcion:psddescripcion#Fecha Vto.:psdfechafin"
		,eventos:[]
					}, function(data){
						/*if(data.search("<tbody></tbody>")<0){
							//alert("oculto");
							$('#divformAudiencia').hide();
							$('#divformAudiencia').after("<div class='alert alert-success'>" +
	                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
	                                "" +"El sorteo ya fue realizado"+""+
	                                "</div>" );
							
						}*/
						
						$("#listadoDatosDocumentos").html(data);
						$('#data-tablepersonaselecciondocumento').dataTable();
						$('.tip').tooltip();
		}); 
	
	
	
	
}

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

function cargarDocumento(cadena){
	//alert(cadena);
	cadena = $('#formJuradoDefinitivo').serialize();
	arcadena =cadena.split('&');
	
	$.each(arcadena, function(uno) {
		//alert(arcadena[uno]);
		arunparametro = arcadena[uno].split('=');
		$('#formJuradoDefinitivo #'+arunparametro[0]).val(arunparametro[1]);
         
    });
	
	var btnUpload=$('#formJuradoDefinitivo #upload');
	var status=$('#formJuradoDefinitivo #status');
	cargarTablaDocumentos();
	new AjaxUpload(btnUpload, {
		action: 'upload-file-pdf.php',
		name: 'uploadfile',
		onSubmit: function(file, ext){
			$('#resultado').html("");
			 if (! (ext && /^(pdf|jpg)$/.test(ext))){ 
                status.text('Tipo de archivo no valido. son formatos validos: pdf y jpg');
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
				$('#formJuradoDefinitivo #psdarchivo').val(response);
				insertarRow('files',response);				
			} else{
				$('#resultado').html(file).addClass('error');
			}
		}
	});
	
	
		
	$("#btnGuardarDocumento").click(function(){
		//$(location).attr("href", "comments.php?aid=1");
		
		$("#respuestaDocumento").html('');
		if($("#formJuradoDefinitivo").validationEngine('validate')){	
			
			$("#respuestaDocumento").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			$.ajax({
                url: "Negocios/accionseleccion.php",
                type: 'post',
                data: $('#formJuradoDefinitivo').serialize(),
                success: function(resp) {
                	//alert(resp);
                	
                	var resp = eval('('+resp+')');
                	if(resp.respuesta)
                	{
                	   $("#respuesta").html("<div class='alert alert-success'>" +
                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
                                "" +resp.mensaje+""+
                                "</div>");
                	   $('#idPersona').val("0");
                	   $("#respuestaDocumento").html('');
                	   if(resp.ocultarForm){
                		   $('#mdlSeleccionDocumentos').hide();
                		   cargarTablaPrincipal();
                	   }else{
                		   cargarTablaDocumentos();
                	   }
                		
                	}else  {
                		//$("#respuesta").html(resp.mensaje);
                		$("#respuesta").html("<div class='alert alert-error'>" +
                                "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                                resp.mensaje + "</div>");
                		
                	}              	
                		
                	
                	
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuesta").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
				} 
            });
			
		}
	});
	
	$('#mdlSeleccionDocumentos').show();
}


$(function(){
	seleccionarMenuConFormulario('#formJuradoDefinitivo');
//$('#divformJuradoDefinitivo').hide();
	
	if($('#idPersona').val()=='0'){
		$('#divformJuradoDefinitivo').hide();
	} else {
		cargarDocumento($('#formJuradoDefinitivo').serialize());
	}
	
	
	//alert("lala");
	$("#btnGenerar").click(function(){
		//$(location).attr("href", "comments.php?aid=1");
		
		$("#respuesta").html('');
		//if($("#btnGuardarJuicio").validationEngine('validate')){	
			
		/*	$("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			$.ajax({
                url: "Negocios/accionjuicio.php",
                type: 'post',
                data: $('#formJuradoDefinitivo').serialize(),
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
            });*/
			
		//}
	});
	

	cargarTablaPrincipal();
	 
});

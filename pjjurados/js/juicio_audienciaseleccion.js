function cargarTablaPrincipal(){
	$.post("libs/datagridhtml.php", {dataForm:[{idjuicio:$('#idjuicio').val()}]
	//$('#formAudiencia').serialize()
		,control:"personaseleccion"
		,personaseleccion_accion:"verTabla"
		,tabla:"Apellido:Apellido#Nombre:Nombre#Fecha Seleccion:psfechaseleccion#Fecha Fin Seleccion:psfechafinseleccion#Orden Sel:psnroordenseleccion#Nro.Bolilla:psnrobolilla"
		,eventos:[{titulo:"Cargar Audiencia",href:"juicio_audienciaseleccion.php",icono:"icon-th-list",accion:"editar"}
		,{titulo:"Cargar Documento",js:"cargarDocumento",icono:"icon-book",accion:"documento"}
		]
					}, function(data){
						/*if(data.search("<tbody></tbody>")<0){
							//alert("oculto");
							$('#divformAudiencia').hide();
							$('#divformAudiencia').after("<div class='alert alert-success'>" +
	                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
	                                "" +"El sorteo ya fue realizado"+""+
	                                "</div>" );
							
						}*/
						
						$("#listadoDatos").html(data);
						$('#data-table').dataTable();
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
	
	$.each(cadena, function() {
		$('#formCargarDocumento #'+this.name).val(this.value);
         
    });
	
	var btnUpload=$('#formCargarDocumento #upload');
	var status=$('#formCargarDocumento #status');
	
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
	
	
	
	$("#mdlSeleccionDocumentos").modal({"show" : true}); 
	//alert(cadena);
	
}



$(function(){
	seleccionarMenuConFormulario('#formAudiencia');
	cargarCombos();
	cargarCalendario();
	
	
	
	
	
	
	//alert("lala");
	$("#btnSortearJuicio").click(function(){
		//$(location).attr("href", "comments.php?aid=1");
		
		$("#respuesta").html('');
		if($("#formAudiencia").validationEngine('validate')){	
			
			$("#respuesta").html('<img src="img/elements/loaders/6.gif" alt="" style="float: left;">');
			$.ajax({
                url: "Negocios/accionseleccion.php",
                type: 'post',
                data: $('#formAudiencia').serialize(),
                success: function(resp) {
                	//alert(resp);
                	var resp = eval('('+resp+')');
                	if(resp.respuesta)
                	{
                	   $("#respuesta").html("<div class='alert alert-success'>" +
                                "<button type='button' class='close' data-dismiss='alert'>×</button>" +
                                "" +resp.mensaje+""+
                                "</div>");
                	   
                	   if(resp.ocultarForm){
                		   $('#divformAudiencia').hide();
                	   }
                		
                	}else  {
                		//$("#respuesta").html(resp.mensaje);
                		$("#respuesta").html("<div class='alert alert-error'>" +
                                "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                                resp.mensaje + "</div>");
                		
                	}              	
                		
                	
                	cargarTablaPrincipal();
                	
                },error: function(xhr, status, error){	
		        	var error = formatErrorMessage(xhr, error);			        	
	           	     $("#respuesta").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
				} 
            });
			
		}
	});
	

	cargarTablaPrincipal();
	 
});
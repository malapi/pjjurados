
function reiniciarClaveUsuario(idUsuario,Usuario){
   if(confirm("Esta seguro que desea reiniciar la contrase\u00F1a del usuario " + Usuario+ "?")){
        $.ajax({
                url: "Negocios/usuario.php",
                type: 'post',
                data: {idUsuario:idUsuario,Usuario:Usuario, oper:'reiniciarClave'},
                success: function(resp) {
                        if(resp == "1")
                        {
                            alert("La contrase\u00F1a del usuario se ha reiniciado correctamente.");
                            $.post("Negocios/usuario.php", {oper: 'listar',ckActivo:'1'}, function(data){ 
                               $("#listaUsuarios").html(data);
                               $('#listadoUsuarios').dataTable();
                               $('.tip').tooltip();
                            }); 

                        }else                	
                                $("#respuestaPer").html(resp);

                },error: function(xhr, status, error){	
                                var error = formatErrorMessage(xhr, error);			        	
                             $("#respuestaPer").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
                                } 
        });
        
    } 
    
}


function borrarUsuario(idUsuario,Usuario){
    if(confirm("Esta seguro que desea dar de baja al usuario " + Usuario+ "?")){
        $.ajax({
                url: "Negocios/usuario.php",
                type: 'post',
                data: {idUsuario:idUsuario,Usuario:Usuario, oper:'baja'},
                success: function(resp) {
                        if(resp == "1")
                        {
                            $.post("Negocios/usuario.php", {oper: 'listar',ckActivo:'1'}, function(data){ 
                               $("#listaUsuarios").html(data);
                               $('#listadoUsuarios').dataTable();
                               $('.tip').tooltip();
                            }); 

                        }else                	
                                $("#respuestaPer").html(resp);

                },error: function(xhr, status, error){	
                                var error = formatErrorMessage(xhr, error);			        	
                             $("#respuestaPer").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
                                } 
        });
        
    }
}

function activarUsuario(idUsuario,Usuario){
 if(confirm("Esta seguro que desea reactivar al usuario " + Usuario+ "?")){
        $.ajax({
                url: "Negocios/usuario.php",
                type: 'post',
                data: {idUsuario:idUsuario,Usuario:Usuario, oper:'alta'},
                success: function(resp) {
                        if(resp == "1")
                        {
                            $.post("Negocios/usuario.php", {oper: 'listar',ckActivo:'1'}, function(data){ 
                               $("#listaUsuarios").html(data);
                               $('#listadoUsuarios').dataTable();
                               $('.tip').tooltip();
                            }); 

                        }else                	
                                $("#respuestaPer").html(resp);

                },error: function(xhr, status, error){	
                                var error = formatErrorMessage(xhr, error);			        	
                             $("#respuestaPer").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
                                } 
        });
        
    }   
}


$(function(){
	
seleccionarMenu("liCon","opCon5");

    $("#btnNuevo").click(function(){
        $("#divNueva").show();
    });

    $("#btnCancel").click(function(){
            $("#txtUsuario").val("");
            $("#cbPerfil").val("");
            $("#txtApellido").val("");
            $("#txtNombre").val("");
            $("#txtpass").val("");
            $("#txtRpass").val("");
            $("#respuestaPer").html("");
            
            $("#divNueva").hide();
    });


    $.post("Negocios/usuario.php", {oper: 'listar',ckActivo:'1'}, function(data){   
        //alert(data);
       $("#listaUsuarios").html(data);
       $('#listadoUsuarios').dataTable();
       $('.tip').tooltip();
    }); 

    $('#ckActivos').change(function() {
        if($(this).is(":checked")) {
         $.post("Negocios/usuario.php", {oper: 'listar',ckActivo:'1'}, function(data){       
            $("#listaUsuarios").html(data);
            $('#listadoUsuarios').dataTable();
            $('.tip').tooltip();
         });
       }else{
          $.post("Negocios/usuario.php", {oper: 'listar',ckActivo:'0'}, function(data){       
            $("#listaUsuarios").html(data);
            $('#listadoUsuarios').dataTable();
            $('.tip').tooltip();
         });
       }
    }); 
    



    $("#btnCargar").click(function(){
        if($("#formNuevoUsu").validationEngine('validate')){			
            $.ajax({
                url: "Negocios/usuario.php",
                type: 'post',
                data: $("#formNuevoUsu").serialize(),
                success: function(resp) {
                        if(resp == "1")
                        {
                            $("#txtUsuario").val("");
                            $("#cbPerfil").val("");
                            $("#txtApellido").val("");
                            $("#txtNombre").val("");
                            $("#txtpass").val("");
                            $("#txtRpass").val("");
                            $("#respuestaPer").html("");
                            $("#divNueva").hide();
                            $.post("Negocios/usuario.php", {oper: 'listar',ckActivo:'1'}, function(data){ 
                               $("#listaUsuarios").html(data);
                               $('#listadoUsuarios').dataTable();
                               $('.tip').tooltip();
                            }); 

                        }else                	
                                $("#respuestaPer").html(resp);

                },error: function(xhr, status, error){	
                                var error = formatErrorMessage(xhr, error);			        	
                             $("#respuestaPer").html("<div class='alert alert-error'>" +
                     "<button type='button' class='close' data-dismiss='alert'>×</button>"+
                     error + "</div>");
                                } 
        });
    
    }
    });





 
 /*$("#btnBuscarLote").click(function(){
	 $.post("Negocios/lotes.php", {txtFechaDesde:$("#txtFechaDesde").val(),txtFechaHasta:$("#txtFechaHasta").val(),
			txtDescripcion:$("#txtDescripcion").val(), todo:"1",oper: 'tabla'}, function(data){      	
		$("#listadoDatos").html(data);
		$('#data-table').dataTable();
		$('.tip').tooltip();
	 }); 
	 
 });*/
 
}); 
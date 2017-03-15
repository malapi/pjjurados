function cargarCombos(){
	$(".ui-autocomplete-input").each(function( index ) {
		//alert( index + ": " + $(this).attr('id') );
		var opciones = eval($("#"+$(this).attr('id')).data('options'));
		opciones = opciones[0];
		var autoCompelteElement = this;
		var formElementName = $(this).attr('name');
		var hiddenElementID  = formElementName + '_autocomplete_hidden';
		/* change name of orig input */
		$(this).attr('name', formElementName + '_autocomplete_label');
		/* create new hidden input with name of orig input */
		$(this).after("<input type=\"hidden\" name=\"" + formElementName + "\" id=\"" + hiddenElementID + "\" />");
		
		$("#"+$(this).attr('id')).autocomplete({
		        source: function( request, response ) {
		            $.ajax( {
		              url: "libs/datacombo.php",
		              dataType: "jsonp",
		              data: {
		                filtro:request.term
		                ,control:opciones.control
		                ,campotabla:opciones.campofiltrar
		              },
		              success: function( data ) {
		            	  response( $.map( data, function(item) {
		                      return {
		                          label: item[opciones.campofiltrar],
		                          value: item[opciones.campofiltrar],
		                          id: item[opciones.clavetabla]
		                      }
		                  }));
		            	  
		               // response( data );
		              }
		            } );
		          },
		        minLength: 1,
		       
		        select: function( event, ui ) {
		          //alert( "Selected: " + ui.item.value + " aka " + ui.item.id );
		        	var selectedObj = ui.item;
					$(autoCompelteElement).val(selectedObj.label);
					$('#'+hiddenElementID).val(selectedObj.id);
		        }
		      });
		  
		});
	
	
	
	//alert(opciones.campotablamostrar+" "+opciones.clavetabla + " "+opciones.control);
	/*$.post("libs/datacombohtml.php", opciones , function(data){
						
						alert(data);
						$("#idpersonaseleccionresultadotipos").html(data);
						//$('#data-table').dataTable();
						//$('.tip').tooltip();
		}); 
	*/
	
   
    
	
	
}
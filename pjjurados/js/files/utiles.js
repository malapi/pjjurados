function submit(action, method, values) {
    var form = $('<form/>', {
        action: action,
        method: method
    });
    $.each(values, function() {
        form.append($('<input/>', {
            type: 'hidden',
            name: this.name,
            value: this.value
        }));    
    });
    //cargarFormulario('#formNuevoSorteo',values);
    form.appendTo('body').submit();
    
}

function cargarFormulario(valores){
	//alert(valores);
	$.each(valores, function(key, valor) {
		//alert(key+" "+valor);
		$('#'+key).val(valor);
	});
	/*$.each(valores, function() {
        alert(this.name);
        //$('#formNuevoSorteo.#'+this.name).val(this.value);
    });*/
	
}


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


function cargarCalendario(){
	$('input[type=date]').each(function (index, element) {
        /* Create a hidden clone, which will contain the actual value */
        var clone = $(this).clone();
        clone.insertAfter(this);
        clone.hide();
        /* Rename the original field, used to contain the display value */
        $(this).attr('id', $(this).attr('id') + '-display');
        $(this).attr('name', $(this).attr('name') + '-display');
        /* Create the datepicker with the desired display format and alt field */
        $(this).datepicker({ dateFormat: "dd/mm/yy", altField: "#" + clone.attr("id"), altFormat: "yy-mm-dd" });
        /* Finally, parse the value and change it to the display format */
        if ($(this).attr('value')) {
            var date = $.datepicker.parseDate("yy-mm-dd", $(this).attr('value'));
            $(this).attr('value', $.datepicker.formatDate("dd/mm/yy", date));
        }
    });
	
}
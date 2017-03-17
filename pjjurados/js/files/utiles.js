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
	//alert("form");
	//alert(valores);
	$.each(valores, function(key, valor) {
		//alert(key+" "+valor);
		if(valor != 'null'){
			if($('#'+key+"-displayfecha").length)
			{
				//alert(valor+" "+valor.split(' ')[0]);
				var parsedDate = $.datepicker.parseDate('yy-mm-dd', valor.split(' ')[0]);
				//alert(parsedDate);
				
				$('#'+key+"-displayfecha").val($.datepicker.formatDate("dd/mm/yy", parsedDate));
				   
			} 
			$('#'+key).val(valor);
		}
			
	});
}

function cargarCombos(){
	//alert("combos");
	$(".ui-autocomplete-input").each(function( index ) {
		//alert( index + ": " + $(this).attr('id') );
		var opciones = eval($("#"+$(this).attr('id')).data('options'));
		if(opciones != null){
			//alert("combos "+opciones);
			opciones = opciones[0];
			var autoCompelteElement = this;
			var formElementName = $(this).attr('name');
			//var hiddenElementID  = formElementName + '_autocomplete_hidden';
			
			//$(this).attr('name', formElementName + '_autocomplete_label');
			/* change name of orig input */
			
			$(this).attr('style', ' visibility: hidden;');
			/* create new hidden input with name of orig input */
			$(this).before("<input type=\"text\" name=\"" + opciones.campofiltrar + "\" id=\"" + opciones.campofiltrar + "\" />");
			
			$("#"+opciones.campofiltrar).autocomplete({
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
			        minLength: 0,
			       
			        select: function( event, ui ) {
			          //alert( "Selected: " + ui.item.value + " aka " + ui.item.id );
			        	var selectedObj = ui.item;
						$('#'+opciones.campofiltrar).val(selectedObj.label);
						$('#'+formElementName).val(selectedObj.id);
			        }
			      });
		}
			});
	
		
	
	
	
}


function cargarCalendario(){
	//alert('calendarios')
	$('input[type=date]').each(function (index, element) {
        /* Create a hidden clone, which will contain the actual value */
        var clone = $(this).clone();
        clone.insertAfter(this);
        clone.hide();
        /* Rename the original field, used to contain the display value */
        $(this).attr('id', $(this).attr('id') + '-displayfecha');
        $(this).attr('name', $(this).attr('name') + '-displayfecha');
        /* Create the datepicker with the desired display format and alt field */
        $(this).datepicker({ dateFormat: "dd/mm/yy", altField: "#" + clone.attr("id"), altFormat: "yy-mm-dd" });
        /* Finally, parse the value and change it to the display format */
        if ($(this).attr('value')) {
            var date = $.datepicker.parseDate("yy-mm-dd", $(this).attr('value'));
            $(this).attr('value', $.datepicker.formatDate("dd/mm/yy", date));
        }
    });
	
}
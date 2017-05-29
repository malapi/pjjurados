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
			
			//$(this).css("border", "5px solid green");
			
			/* create new hidden input with name of orig input */
			$(this).before("<input type=\"text\" name=\"" + opciones.campofiltrar + "\" id=\"" + opciones.campofiltrar + "\" />");
			var img = $('<img class="inline" src="img/icons/stock_form-combobox.png" />');
			$("#"+opciones.campofiltrar).after(img);
			$("#"+opciones.campofiltrar).css("border", "1px solid #F0F8FF");
			
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
						//controles();
						if (typeof autocombo_controles == 'function') { 
							//alert('This is a function');
							//alert( "Selected: " + ui.item.value + " aka " + ui.item.id );
							autocombo_controles(formElementName);
							}
						/*if ( $.isFunction($.fn.controles) ) {
						   // $(".cs-text-cut").lettering('words');
							alert('This is a function');
						}else{
							alert('This is Not a function');
						}*/
						/*if(jQuery.isFunction("controles")) 
							alert('This is a function');
						else
							alert('This is not a function');
							*/
			        }
			      });
		}
			});
	
		
	
	
	
}

function cargarCalendario(){
	//alert('calendarios');
	
	 $('input[type=date]').each(function(){
		 	//alert($(this).attr("id"));
	        this.type="text";
	        //$(this).datepicker({dateFormat: 'yy-mm-dd'});
	        
	        var clone = $(this).clone();
	        //clone.attr('class', '');
	        clone.insertAfter(this);
	        clone.hide();
	        
	        $(this).attr('id', $(this).attr('id') + '-displayfecha');
	        $(this).attr('name', $(this).attr('name') + '-displayfecha');
	    	
	        
	      $(this).datepicker({ dateFormat: "dd/mm/yy", altField: "#" + clone.attr("id"), altFormat: "yy-mm-dd" });
	       
	       
	        //alert('calendarios 2')
	       
	        if ($(this).attr('value')) {
	        	//alert($(this).attr('value'));
	            var date = $.datepicker.parseDate("yy-mm-dd", $(this).attr('value'));
	            $(this).attr('value', $.datepicker.formatDate("dd/mm/yy", date));
	        }
	        
	    });
	   
	    
	//$('.datepicker').each(function (index, element) {
	/*$('input[type=date]').each(function (index, element) {
		//alert('calendarios 1');
        var clone = $(this).clone();
        //clone.attr('class', '');
        clone.insertAfter(this);
        //clone.hide();
        
        $(this).attr('id', $(this).attr('id') + '-displayfecha');
        $(this).attr('name', $(this).attr('name') + '-displayfecha');
    	
        
      $(this).datepicker({ dateFormat: "dd/mm/yy", altField: "#" + clone.attr("id"), altFormat: "yy-mm-dd" });
       
       
        //alert('calendarios 2')
       
        if ($(this).attr('value')) {
        	//alert($(this).attr('value'));
            var date = $.datepicker.parseDate("yy-mm-dd", $(this).attr('value'));
            $(this).attr('value', $.datepicker.formatDate("dd/mm/yy", date));
        }
    });*/
	
}
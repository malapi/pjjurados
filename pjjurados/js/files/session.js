//var time = 80000;
function mantenerSession() {
	
	//alert($(".navigation widget  > li"));
    $('.navigation.widget > li > ul > li > a').each(function (i) {
    	//alert($(this).attr('id'));
    	var opciones = eval($("#"+$(this).attr('id')).data('options'));
		if(opciones != null && opciones[0]['guardaSesion'] == "si"){
			//alert($('#secc').attr('value') + " " +$(this).attr('id'));
			//opciones = opciones[0];
			//alert('opciones is: ' +opciones['guardaSesion']);
			//class="current"
			/*var time = 8000;
			setInterval(function() {
			    $.ajax({
			        url: 'actualizar_sesion.php',
			        cache: false,
			        async: false,
			        type: "POST",
			        data: {},
			        success: function(){},
			        error: function(request, status, error){
			            alert('Error: ' + request.responseText + '  STATUS: ' + status + '  ERROR: '+error);
			        }
			    }); 
			}, time);*/
		}

        var index = $(this).index();
        var text = $(this).text();
        var value = $(this).attr('value');
       // alert('Index is: ' + index + ' and text is ' + text + ' and Value ' + value);
    });
    
}

$(function(){
	mantenerSession();
});


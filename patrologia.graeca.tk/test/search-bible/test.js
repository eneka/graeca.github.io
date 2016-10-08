 $(document).ready(function() {
	//	$('#framekeyboard').hide();
		 alert ("lxdll");
		
         
       
    $('#buttoninput').click(function(){
		 alert ("lxdqrqwrll");
	});

$('#framekeyboard').load('test.sh');
		   
	$( "#framekeyboard" ).on( "click", '#char',function(e) {
  //alert( $('.char').text() );
  alert( $( this ).text() );
});

	$( "#framekeyboard" ).on( "click", '.char',function(e) {
  //alert( $('.char').text() );
  alert( $( this ).text() );
});



	
});

 $(document).ready(function() {
		$('#framekeyboard').hide();
		$('.authors').load('authorslist.sh');
		$('#selectspan').load('authorsselect.sh');
		$('#framekeyboard').load('keyboard.sh');
		//$('#numofsearches').load('remoteaddr/remoteaddr.sh');	 
		
		
		
		 
		$( "#framekeyboard" ).on( "click", '.char',function(e) {
		$('#textinput').val($('#textinput').val()+$(this).text());
		});
   
		$('.key').click(function(){
		$('#framekeyboard').toggle();
		});
             
		$('#buttoninput').click(function(){
		$('#framekeyboard').hide();
		});

		
	
	/*####################################*/	
});

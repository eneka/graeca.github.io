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
			
	$("iframe").load(function() {
   var frameContents;
   frameContents = $("#myframe").contents();
   frameContents.find("body").css("color","black");
   frameContents.find("body").css("font-size","15");
   frameContents.find("body").css("width", "90%");
   frameContents.find("body").css("word-wrap", "break-all");
   frameContents.find("body").css("text-align", "justify") ;
   frameContents.find("body").css("font-family", "Calibri"); 
    frameContents.find("body").css("margin", "0 auto")
  
  
  
  
  
  /*########################################*/ 
    frameContents.find("#book").html(function () {
    return $(this).text().replace(/index\*text/g, ""); 
}); 
  frameContents.find("#book").html(function () {
    return $(this).text().replace(/∆ΡΟΜΟΙ ΤΗΣ ΠΙΣΤΗΣ – ΨΗΦΙΑΚΗ ΠΑΤΡΟΛΟΓΙΑ\./g, ""); 
});
  frameContents.find("#book").html(function () {
    return $(this).text().replace(/Ερευνητικο εργο:/g, ""); 
});
       frameContents.find("#book").html(function () {
    return $(this).text().replace(/Πανεπιστηµιο Αιγαιου, Τµηµα Πολιτισµικης Τεχνολογιας και Επικοινωνιας, © 2006\./g, ""); 
});
   
      frameContents.find("#book").html(function () {
    return $(this).text().replace(/Επιτρεπεται η ελευθερη χρηση του υλικου µε αναφορα στην πηγη προελευσης του\./g, ""); 
});

   frameContents.find("#book").html(function () {
    return $(this).text().replace(/Χρηµατοδοτηση:/g, ""); 
});
    frameContents.find("#book").html(function () {
    return $(this).text().replace(/ποροι 25%\)\./g, ""); 
});   
      frameContents.find("#book").html(function () {
    return $(this).text().replace(/ΚΠ Interreg ΙΙΙΑ \(ETΠΑ 75%, Εθν\./g, ""); 
}); 
   
     frameContents.find("#book").html(function () {
    return $(this).text().replace(/Εργαστηριο ∆ιαχειρισης Πολιτισµικης Κληρονοµιας, www\./g, ""); 
}); 
   
  frameContents.find("#book").html(function () {
    return $(this).text().replace(/gr\/culturaltec\/chmlab\./g, ""); 
});  

 frameContents.find("#book").html(function () {
    return $(this).text().replace(/aegean\./g, ""); 
});

frameContents.find("#book").html(function () {
    return $(this).text().replace(/\./g, ".<br><br>"); 
});
 /*########################################*/   
   
   // alert("2"); 
  // frameContents.find("body").css("font-family", "Verdana", "Geneva, sans-serif;"); 
return
     
   //alert(frameContents.find("body").text())
   

   return 

   var btext= frameContents.find("body").html();
 //frameContents.find("body").text(); 
// alert(frameContents.find("body").html())
 //
   ////frameContents.find("#framediv").text(btext);
   
  frameContents.find("body").text("")
  frameContents.find("body").prepend( "<div id='framediv' >Test</div>" );
  frameContents.find("#framediv").html(btext);
  frameContents.find("#framediv").css("color","red");
  frameContents.find("#framediv").css("width","200 px");
});
			
	
	/*####################################*/	
});

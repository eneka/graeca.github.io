  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-85127901-1', 'auto');
  ga('send', 'pageview');



 $(document).ready(function() {
	  
	  $("#book").html(function () {
    return $(this).text().replace(/index\*text/g, ""); 
}); 
  $("#book").html(function () {
    return $(this).text().replace(/∆ΡΟΜΟΙ ΤΗΣ ΠΙΣΤΗΣ – ΨΗΦΙΑΚΗ ΠΑΤΡΟΛΟΓΙΑ\./g, ""); 
});
  $("#book").html(function () {
    return $(this).text().replace(/Ερευνητικο εργο:/g, ""); 
});
       $("#book").html(function () {
    return $(this).text().replace(/Πανεπιστηµιο Αιγαιου, Τµηµα Πολιτισµικης Τεχνολογιας και Επικοινωνιας, © 2006\./g, ""); 
});
   
      $("#book").html(function () {
    return $(this).text().replace(/Επιτρεπεται η ελευθερη χρηση του υλικου µε αναφορα στην πηγη προελευσης του\./g, ""); 
});

   $("#book").html(function () {
    return $(this).text().replace(/Χρηµατοδοτηση:/g, ""); 
});
    $("#book").html(function () {
    return $(this).text().replace(/ποροι 25%\)\./g, ""); 
});   
      $("#book").html(function () {
    return $(this).text().replace(/ΚΠ Interreg ΙΙΙΑ \(ETΠΑ 75%, Εθν\./g, ""); 
}); 
   
     $("#book").html(function () {
    return $(this).text().replace(/Εργαστηριο ∆ιαχειρισης Πολιτισµικης Κληρονοµιας, www\./g, ""); 
}); 
   
  $("#book").html(function () {
    return $(this).text().replace(/gr\/culturaltec\/chmlab\./g, ""); 
});  

 $("#book").html(function () {
    return $(this).text().replace(/aegean\./g, ""); 
});
 
	  
	 $("#book").html(function () {
    return $(this).text().replace(/\./g, ".<br><br>"); 
});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 });

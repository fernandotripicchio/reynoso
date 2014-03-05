 $(function() {
    sales_functions();         
 });
  
  
 sales_functions = function(){ 
     $(".remitoFacturaFadio").on("change", function(){
     	if  ( $(this).val()  !="Ninguno"){
     		$("#rowRemitoFactura").show();     		
     	} else {
     		$("#rowRemitoFactura").hide();
     	}

     })
  }
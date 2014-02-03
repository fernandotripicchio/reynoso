 $(function() {
    sales_functions();         
 });
  
  
 sales_functions = function(){ 
     $(".selectStock").on("change", function(){
     	//alert($(this).val());
     	//alert($(this).parent().parent().parent().find(".precioStock").attr("value", "78"));
     })
  }
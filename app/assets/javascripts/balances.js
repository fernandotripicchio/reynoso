
 $(function() {
    balance_functions();         
 });
  
  
 balance_functions = function(){ 
       $(".radio-ingresos").on('change', function(){
         var tipo = $(this).attr("value");
         var select_tipo = $("#balance_kind_movement_id");
         
          $.ajax({
              url: "/caja_tipo_movimientos/"+ tipo+".json",
              type: "GET",
              success: function(data){
                select_tipo.empty();
               $.each(data, function(i, item) {
                 
                select_tipo.append($('<option>', { 
                      value: item.id,
                      text : item.description 
                  }));                 
                });                
              }              
            }) // Ajax
       }); 

  }
  
 

class Laboratory < ActiveRecord::Base
   attr_accessible :name, :address, :phone, :email, :observation
   has_many :products
   
   def actualizar_porcentajes( porcentaje )
     Supplier.transaction do
       self.products.each do |product|
         product.actualizar_porcentaje(porcentaje)
       end
     end     
   end
end

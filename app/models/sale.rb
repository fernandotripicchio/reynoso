class Sale < ActiveRecord::Base
   belongs_to :client
   belongs_to :branch
   
   #has_many :sale_items
   #accepts_nested_attributes_for :sale_items, :allow_destroy => true, :reject_if  => :all_blank


   has_many :items
   accepts_nested_attributes_for :items, :allow_destroy => true, :reject_if  => :all_blank
   
   attr_accessible :date_sale, :branch_id, :client_id,  :payment, :comments, :status, :items_attributes, :remito
   
   validate :date_sale, :payment, :client , :presence => true
   
   
   def decrement_stock(branch, user)
         items = self.items
         items.each do |item|
             size = item.size
             item.stock.product.decrement_stock(size, branch, user.id)
         end
   end
   
   def increment_stock(branch, user)
         items = self.items
         items.each do |item|
             size = item.size
             item.stock.product.increment_stock(size, branch, user.id)
         end     
   end
   
   def set_status
      self.status = false if self.payment == "Cuenta Corriente"
      self.save
   end
   
   def pagada?
       return ( self.pagada == true) ? "Si" : "No"
   end
   
   def monto( branch )
       items = self.items
       montos = 0
       items.each do |item|
             size = item.size
             stock =  item.stock.product.get_stock(branch)
             
             montos = montos + ( item.size * item.stock.product.price_branch( stock ) )
       end     
     
      return montos
   end   
   
   
   
   def pagar(branch)
      
      #tipo_movimiento = KindMovement.ingreso[0]
      description  = "Pago de venta nro #{self.id}"
      if self.payment == "Efectivo"
        #Nuevo Pago
          caja = Account.new
          caja.new_movement({:value => self.monto( branch ), :in => "Ingreso", :description => description})
      elsif tipo_pag == "Cuenta Corriente"  
         #registar pago cuenta corriente
      else
         
      end
      
      self.pagada = true       
      self.save
   end
end

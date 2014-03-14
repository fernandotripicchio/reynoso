class Sale < ActiveRecord::Base
   belongs_to :client
   belongs_to :branch
   
   #has_many :sale_items
   #accepts_nested_attributes_for :sale_items, :allow_destroy => true, :reject_if  => :all_blank


   has_many :items
   accepts_nested_attributes_for :items, :allow_destroy => true,  :reject_if => :reject_items
   
   attr_accessible :date_sale, :branch_id, :client_id,  :payment, :comments, :status, :items_attributes, :remito,:tipo_presupuesto, :factura_presupuesto 
   
   validate :date_sale, :payment, :presence => true
   
   def reject_items(attributed)
      attributed['stock_id'].blank?
   end
   
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
             unless item.stock.blank?
                stock =  item.stock.product.get_stock(branch)             
                montos = montos + ( item.size * item.stock.product.price_branch( stock ) )
             else
               montos = 0
             end
       end     
     
      return montos
   end   
   
   
   
   def pagar(branch)      
      monto = self.monto( branch )
      balance = Balance.new({:mount => monto})
      balance.branch_id = branch.id
      balance.description = "Ingreso por venta nro: #{self.id}"
      balance.client_id = self.client_id unless self.client_id.blank?
      balance.kind_movement = KindMovement.ingreso[0]
      balance.balance_date = self.date_sale
      balance.save
      self.pagada = true
      self.save
   end
   
   def cuenta_corriente( branch, user)
     monto = self.monto( branch )
     account = self.client.account
     if account.blank?
        account = Account.new
        account.client = self.client
        account.mount = 0
     end
     
       
     account.new_movement({:value => monto, :in => "Ingreso", :desc => "Venta nro #{self.id}"}, user)
     account.save
   end
   
   
   def is_cuenta_corriente?
     return self.payment == "Cuenta Corriente"
   end
   def getFecha
     if self.new_record?
       ""
     else
       self.date_sale.blank? ? "" : self.date_sale.strftime("%d/%m/%Y")  
     end
   end
end

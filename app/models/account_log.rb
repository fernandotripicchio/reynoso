class AccountLog < ActiveRecord::Base
   attr_accessible :account_id, :value, :user, :in, :log_date, :recibo
   
   validates :value, :presence => true,  :numericality => true
   
   def tipo_movimiento
       return ( self.in ) ? "Ingreso" : "Egreso"
   end
end

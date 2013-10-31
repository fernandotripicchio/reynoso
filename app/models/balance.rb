class Balance < ActiveRecord::Base
   attr_accessible  :balance_date, :size, :description, :kind_of_movm

   def show_mov
      return ( self.kind_of_movm == 0) ? "Egreso" : "Ingreso"
   end
end

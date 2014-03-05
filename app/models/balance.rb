class Balance < ActiveRecord::Base
   belongs_to :branch
   belongs_to :kind_movement
   belongs_to :client
   attr_accessible  :balance_date, :mount, :description, :kind_of_mov, :kind_movement_id, :branch_id, :client_id

  scope :ingreso, where(:in => true)

   def show_mov
      return ( self.kind_of_mov == 0) ? "Egreso" : "Ingreso"
   end
end

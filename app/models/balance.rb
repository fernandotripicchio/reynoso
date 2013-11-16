class Balance < ActiveRecord::Base
   belongs_to :branch
   belongs_to :kind_movement
   attr_accessible  :balance_date, :size, :description, :kind_of_mov, :kind_movement_id, :branch_id

  scope :ingreso, where(:in => true)

   def show_mov
      return ( self.kind_of_mov == 0) ? "Egreso" : "Ingreso"
   end
end

class KindMovement < ActiveRecord::Base
   has_many :balances
   attr_accessible :description, :in
   
   scope :ingreso, where(:in => true)
   scope :egreso, where(:in => false)
end

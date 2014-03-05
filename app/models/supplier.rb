class Supplier < ActiveRecord::Base
   attr_accessible :name, :address, :phone, :email, :observation
   has_many :products
   has_many :stocks
end

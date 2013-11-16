class Laboratory < ActiveRecord::Base
   attr_accessible :name, :address, :phone, :email, :observation
   has_many :products
      
end

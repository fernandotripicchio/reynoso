class Supplier < ActiveRecord::Base
   attr_accessible :name, :address, :phone, :email, :observation
end

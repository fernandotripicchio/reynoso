class Client < ActiveRecord::Base
   has_many :sales
   
   attr_accessible :name, :address, :email, :phone, :comments, :province, :zip_code
   
   validates :name, :presence => true
   
end
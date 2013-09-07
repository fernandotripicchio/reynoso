class Branch < ActiveRecord::Base
  attr_accessible :address, :name, :email, :phone, :comments, :city, :active
  
  has_many :stocks
  has_many :products, :through => :stocks
end

class Product < ActiveRecord::Base
  attr_accessible :name, :price, :iva, :profit
  validates  :name, :price, :iva, :profit, :presence => true
end

class Stock < ActiveRecord::Base
  belongs_to :product
  belongs_to :branch
  belongs_to :supplier
  
  attr_accessible :size, :discount, :product_id, :branch_id, :supplier_id
  
  validates  :size,:presence => true
  
end

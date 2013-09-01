class Stock < ActiveRecord::Base
  belongs_to :product
  belongs_to :branch
  
  attr_accessible :size, :discount, :product_id, :stock_id
  
end

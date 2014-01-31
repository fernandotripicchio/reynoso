class Stock < ActiveRecord::Base
  belongs_to :product
  belongs_to :branch
  has_many :stock_logs
  
  attr_accessible :size, :discount, :product_id, :branch_id, :profit, :initial_stock, :temporal_size, :minimum
  
  validates  :size,:presence => true
  
end

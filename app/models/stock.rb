class Stock < ActiveRecord::Base
  belongs_to :product
  belongs_to :branch
  has_many :stock_logs
  has_many :items
  
  attr_accessible :size, :discount, :product_id, :branch_id, :profit, :initial_stock, :temporal_size, :minimum, :id, :kind_movement
  
  validates  :size,:presence => true
  
  def product_name
    unless self.product.blank?
     return self.product.name + " - Precio    $"+  self.product.price_branch(self).to_s
    end
  end
  
end

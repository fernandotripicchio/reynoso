class Item < ActiveRecord::Base
   belongs_to :sale
   belongs_to :product
   belongs_to :stock
   attr_accessible :size, :sale_id, :product_id, :stock_id
   
   validates :size,  :presence => true
end

class Item < ActiveRecord::Base
   belongs_to :sale
   belongs_to :product
   attr_accessible :size, :sale_id, :product_id
end

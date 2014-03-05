class StockLog < ActiveRecord::Base
   belongs_to :supplier
   belongs_to :stock
   belongs_to :user
   attr_accessible :supplier_id, :stock_id, :type, :user_id, :size, :description
end

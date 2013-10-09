class StockLog < ActiveRecord::Base
   belongs_to :supplier
   belongs_to :stock
   attr_accessible :supplier_id, :stock_id, :type
end

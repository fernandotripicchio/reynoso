class Sale < ActiveRecord::Base
   belongs_to :client
   belongs_to :branch
   
   has_many :sale_items
   
   
   attr_accessible :date_sale, :branch_id, :client_id,  :payment, :comments
   
   validate :date_sale, :presence => true
end

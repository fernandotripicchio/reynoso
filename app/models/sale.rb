class Sale < ActiveRecord::Base
   belongs_to :client
   belongs_to :branch
   
   
   attr_accessible :date_sale, :branch_id, :client_id,  :payment, :comments
   
   validate :date_sale, :presence => true
end

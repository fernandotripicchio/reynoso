class Sale < ActiveRecord::Base
   belongs_to :client
   belongs_to :branch
   
   #has_many :sale_items
   #accepts_nested_attributes_for :sale_items, :allow_destroy => true, :reject_if  => :all_blank


   has_many :items
   accepts_nested_attributes_for :items, :allow_destroy => true, :reject_if  => :all_blank
   
   attr_accessible :date_sale, :branch_id, :client_id,  :payment, :comments,:items_attributes
   
   validate :date_sale, :presence => true
end

class Account < ActiveRecord::Base
   belongs_to :client
   attr_accessible :comments, :client_id, :mount
   
   validates :mount, :client_id,:presence => true
   
   
   def create_update_accountend
      client =  self.client
      raise "#{client.to_json}"  
   end
   
   
   end
   

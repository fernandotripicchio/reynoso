class Account < ActiveRecord::Base
   belongs_to :client
   attr_accessible :comments, :client_id, :mount
end

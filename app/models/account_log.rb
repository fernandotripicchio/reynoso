class AccountLog < ActiveRecord::Base
   attr_accessible :account_id, :value, :user, :in, :log_date
   
   validates :value, :presence => true,  :numericality => true
end

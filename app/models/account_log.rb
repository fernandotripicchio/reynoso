class AccountLog < ActiveRecord::Base
   attr_accessible :account_id, :value, :user, :in, :log_date
end

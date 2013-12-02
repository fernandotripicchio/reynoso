class Client < ActiveRecord::Base
   has_many :sales
   has_one  :account #Cuenta Corriente
   has_many :balances
   belongs_to :branch
   
   attr_accessible :name, :address, :email, :phone, :comments, :province, :zip_code, :branch_id
   
   validates :name, :presence => true
   
   
   #TODO Falta filtrar que no tenga account
   
   
   def has_account?
       return !self.account.blank?       
   end
   
   def set_account(params)
        if self.has_account?
           account = self.account
        else
           account = Account.new  
        end
        account
   end
   
end

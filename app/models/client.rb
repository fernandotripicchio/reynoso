class Client < ActiveRecord::Base
   has_many :sales
   has_one  :account #Cuenta Corriente
   has_many :balances
   belongs_to :branch
   
   attr_accessible :name, :address, :email, :phone, :comments, :province, :zip_code, :branch_id
   
   validates :name, :presence => true
   
end

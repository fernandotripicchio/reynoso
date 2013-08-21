class User < ActiveRecord::Base
  acts_as_authentic 
  attr_accessible :email, :login ,:password, :password_confirmation, :full_name, :phone
  
  validates :full_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, :with => /.+@.+\..+/
  
end

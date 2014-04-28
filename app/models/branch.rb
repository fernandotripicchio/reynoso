class Branch < ActiveRecord::Base
  attr_accessible :address, :name, :email, :phone, :comments, :city, :active
  
  has_many :stocks
  has_many :products, :through => :stocks
  has_many :clients
  has_many :sales
  
  def actualizar_porcentajes(porcentaje=0)
     Branch.transaction do
       self.products.each do |product|
         product.actualizar_porcentaje(porcentaje)
       end
     end
  end
end

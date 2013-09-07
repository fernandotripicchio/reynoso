class Product < ActiveRecord::Base
  attr_accessible :name, :price, :iva, :profit
  validates  :name, :price, :iva, :profit, :presence => true
  
  has_many :stocks
  has_many :branches, :through => :stocks
  
  def increment_stock(size, branch, supplier)
      raise "Debe ingresar cantidad" if size.blank?
      raise "Debe ingresar una sucursal" if branch.blank?
      
      #Obtengo el stock actual
      stock = self.stocks.where("branch_id = ?", branch).first
      if stock.blank?
         stock = Stock.new
         stock.product = self
         stock.branch_id = branch
         stock.supplier_id = supplier
         stock.size = size
      else
         stock.size = stock.size + size.to_i  
      end
      
      stock.save!
      return stock     
      
  end
  
end

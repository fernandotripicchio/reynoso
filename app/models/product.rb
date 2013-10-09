class Product < ActiveRecord::Base
  attr_accessible :name, :price, :iva, :profit, :code, :cost, :description
  validates  :name, :cost, :iva, :presence => true
  
  has_many :stocks
  has_many :branches, :through => :stocks
  
  def increment_stock(new_size, branch)
      raise "Debe ingresar cantidad" if new_size.blank?
      raise "Debe ingresar una sucursal" if branch.blank?
      
      #Obtengo el stock actual
      stock = self.stocks.where("branch_id = ?", branch).first
      if stock.blank?
         stock = Stock.new
         stock.product = self
         stock.branch_id = branch
         stock.size = size
      else
         cantidad = (stock.size + new_size.to_i)
         #raise "#{new_size} - #{stock.size} - #{cantidad}"
         stock.size =   cantidad
      end
      
      stock.save!
      return stock     
      
  end
  
  
  def decrement_stock(size, branch)
      raise "Debe ingresar cantidad" if size.blank?
      raise "Debe ingresar una sucursal" if branch.blank?
      
      #Obtengo el stock actual
      stock = self.stocks.where("branch_id = ?", branch).first
      if stock.blank?
         stock = Stock.new
         stock.product = self
         stock.branch_id = branch
         stock.size = 0
      else
         stock.size = stock.size - size.to_i  
      end
      
      stock.save!
      return stock     
      
  end  
  
  def add_product(branch)    
      stock = Stock.new
      stock.branch_id = branch.id      
      stock.size = 0      
      log = StockLog.new
      log.supplier_id = 0
      log.type = "Creacion"
      self.stocks << stock
      stock.stock_logs << log
      self.save
  end
  
  
  def price_branch(stock)
       cost = self.cost_iva
       profit = stock.profit
       price = cost  + ( (cost * profit) / 100 ) 
       return price    
  end
  
  def cost_iva
       cost = self.cost
       iva  = self.iva
       price = cost  + ( ( cost * iva) / 100 ) 
       return price    
       
  end
  
  def get_stock(branch)
    stock = self.stocks.where("branch_id = ?", branch.id).first
    stock
  end
  
end

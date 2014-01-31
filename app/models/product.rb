class Product < ActiveRecord::Base
  attr_accessible :name, :price, :iva, :profit, :code, :cost, :description, :laboratory_id
  validates  :name, :cost, :iva, :presence => true
  
  has_many :stocks
  has_many :branches, :through => :stocks
  belongs_to :laboratory
  belongs_to :supplier
  
  def increment_stock(size, branch, user)
      raise "Debe ingresar cantidad" if size.blank?
      raise "Debe ingresar una sucursal" if branch.blank?
      
      #Obtengo el stock actual
      stock = self.stocks.where("branch_id = ?", branch).first
      if stock.blank?
         stock = Stock.new
         stock.product = self
         stock.branch_id = branch
         stock.size = size
      else
         cantidad = (stock.size + size.to_i)
         stock.size =   cantidad
      end
      
      stock_log = StockLog.new
      stock_log.user_id = user
      stock_log.size = size
      stock_log.type = "Incremento"
      stock_log.description = "Se incrementa el stock en #{size} unidades"      
      stock.stock_logs << stock_log
      
      stock.save!
      return stock     
      
  end
  
  
  def decrement_stock(size, branch, user)
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

      stock_log = StockLog.new
      stock_log.user_id = user
      stock_log.size = size
      stock_log.type = "Descuento"
      stock_log.description = "Se baja el stock en #{size} unidades"      
      stock.stock_logs << stock_log
            
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
       cost = ( self.cost_iva.blank? ) ? 0 : self.cost_iva.to_i
       profit = ( stock.profit.blank? ) ?  0 : stock.profit.to_i
       
       price = cost  + ( (cost * profit) / 100 ) 
       return price    
  end
  
  def cost_iva
       cost = ( self.cost.blank? ) ? 0 : self.cost
       iva  = ( self.iva.blank? ) ? 0 : self.iva 
       price = cost  + ( ( cost * iva) / 100 ) 
       return price    
       
  end
  
  def get_stock(branch)
    stock = self.stocks.where("branch_id = ?", branch.id).first
    stock
  end
  
  
  #import users from Excel file
  def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
          when '.xls' then  Roo::Excel.new(file.path, nil, :ignore)
          when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
          else raise "Unknown file type: #{file.original_filename}"
      end
  end    
   def self.import(file)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(4)      
      result_products = { :result => false, :products => [], :errors => "" }
      users = [] 
      fails = false
      
      branch_santa_fe = Branch.find(:first, :conditions => ["name = ?", "Santa Fe"])
      branch_san_luis = Branch.find(:first, :conditions => ["name = ?", "San Luis"])
      
      (2..spreadsheet.last_row).each do |i|
            row   = spreadsheet.row(i)
            
            name   = row[0]
            cost   = row[3]
            iva    = row[8]
            code   =  row[2]
            
            laboratory_name = row[1]
            
            unless laboratory_name.blank?
                laboratory = Laboratory.find(:first, :conditions => [ "name = ?", laboratory_name])
                
                if laboratory.blank?
                     laboratory = Laboratory.create(:name => laboratory_name)
                end
                
                product = Product.find(:first, :conditions => ["name = ? and laboratory_id = ?", name, laboratory.id]) 
                
                if product.blank?
                    product = Product.create(:name => name, :cost => cost, :iva => iva, :laboratory_id => laboratory.id, :code => code)                    
                end
                
  # size integer,
  # branch_id integer,
  # product_id integer,
  # disccount numeric(8,2),
  # created_at timestamp without time zone NOT NULL,
  # updated_at timestamp without time zone NOT NULL,
  # suplier_id integer,
  # kind_movement character varying(255) DEFAULT 'Incremento'::character varying,
  # profit integer,
  # initial_stock integer,
  # temporal_size integer,     
             
                #Stock Santa Fe
                size_santa_fe = row[17]
                profit_santa_fe = row[12]
                stock = Stock.create(:branch_id => branch_santa_fe.id, 
                                     :product_id => product.id,
                                     :size => size_santa_fe, 
                                     :profit => profit_santa_fe, 
                                     :initial_stock  => size_santa_fe
                                    )
                
                #Stock Santa Fe
                size_san_luis = row[16]
                profit_san_luis = row[11]                
                stock = Stock.create(:branch_id => branch_san_luis.id, 
                                     :product_id => product.id,
                                     :size => size_san_luis, 
                                     :profit => profit_san_luis, 
                                     :initial_stock  => size_san_luis
                                    )
                
              
            end            
            
           

            
            #if product.valid?
            #    users << user
            #else
            #    result_products[:result] =  false
            #    result_products[:errors] =  "Error in Row #{i}: " + product.errors.full_messages.join(" - ")
            #    fails = true
            #    break            
            #end
       end
       
       
       #unless fails
          #result_products[:products]  = products
          #result_products[:result] = true               
       #end
                      
       result_products      
  end 
  
end

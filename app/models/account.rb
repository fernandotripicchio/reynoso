class Account < ActiveRecord::Base
   belongs_to :client
   has_many :account_logs
   
   accepts_nested_attributes_for :account_logs, :allow_destroy => true, :reject_if  => :all_blank

   attr_accessible :comments, :client_id, :mount, :account_logs_attributes
   
   validates :mount, :presence => true
   
   def self.new_account(params)
      mount = params[:mount]
      comments  = "Venta"
      acc = Account.new
      acc.mount = mount
      acc.comments =  comments
      acc.save 
           
   end

   def new_movement(params)
      
      value = params[:value]
      tipo_in = params[:in]
      desc  = params[:description]
      self.mount = 0 if self.mount.blank?
      if  tipo_in == "Ingreso"
          self.mount  =  self.mount  + value.to_i
      else
          self.mount  =  self.mount  - value.to_i
      end
      
      account_log = AccountLog.new
      account_log.description =  desc
      account_log.in =  tipo_in
      account_log.value =  value
      
      self.account_logs << account_log
      
   end
   
   def create_update_account
      client =  self.client
      if client.has_account?
          account = client. account
      else
          account = Account.new
      end  
      
      
   end
   
   
   end
   

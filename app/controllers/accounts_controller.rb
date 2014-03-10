class AccountsController < ApplicationController
  before_filter :current_user  
  before_filter :get_data
  
  
  layout "branch"   
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new
    @account.mount = 0
    @account.account_logs.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
    @account.account_logs.build
  end

  # POST /accounts
  # POST /accounts.json
  def create
    client =  Client.find(params[:account][:client_id])    
    @account = client.set_account(params[:account])
    @account.new_movement(params[:account][:account_logs_attributes]["0"])  
    @account.client = client    
    respond_to do |format|
      if @account.save
        format.html { redirect_to branch_accounts_path(@branch), notice: 'Se creo la cuenta corriente.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])
    
    @account.new_movement(params[:account][:account_logs_attributes].first.second, @current_user.full_name)
    respond_to do |format|
      if @account.save
        format.html { redirect_to branch_accounts_path(@branch), notice: 'Se modifico la cuenta corriente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end
  
  def download
    @accounts = Account.all
    respond_to do |format|
      format.html
      format.xls
    end    
  end    
  
  
  def movimientos
    @account = Account.find(params[:account_id])
    @account_logs = @account.account_logs
  end
  private
  
  def get_data
    @branch = Branch.find(params[:branch_id])
    @clients = @branch.clients(order: 'name')
  end
end

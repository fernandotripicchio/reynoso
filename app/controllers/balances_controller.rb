class BalancesController < ApplicationController
  before_filter :current_user  
  before_filter :get_data  
    
  
  layout "branch"  
  
  # GET /balances
  # GET /balances.json
  def index
    @balances = Balance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @balances }
    end
  end

  # GET /balances/1
  # GET /balances/1.json
  def show
    @balance = Balance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @balance }
    end
  end

  # GET /balances/new
  # GET /balances/new.json
  def new
    @balance = Balance.new
    @balance.balance_date = Time.now.strftime("%d/%m/%Y")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @balance }
    end
  end

  # GET /balances/1/edit
  def edit
    @balance = Balance.find(params[:id])
  end

  # POST /balances
  # POST /balances.json
  def create
    @balance = Balance.new(params[:balance])
    @balance.balance_date = params[:balance][:balance_date].to_time.strftime("%d/%m/%Y")
    respond_to do |format|
      if @balance.save
        format.html { redirect_to branch_balances_path(@branch), notice: 'Se creo la caja con exito' }
        format.json { render json: @balance, status: :created, location: @balance }
      else
        format.html { render action: "new" }
        format.json { render json: @balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /balances/1
  # PUT /balances/1.json
  def update
    @balance = Balance.find(params[:id])

    respond_to do |format|
      if @balance.update_attributes(params[:balance])
        format.html { redirect_to branch_balances_path(@branch), notice: 'Balance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /balances/1
  # DELETE /balances/1.json
  def destroy
    @balance = Balance.find(params[:id])
    @balance.destroy

    respond_to do |format|
      format.html { redirect_to branch_balances_path(@branch) }
      format.json { head :no_content }
    end
  end
  
  def download
    @balances = Balance.all
    respond_to do |format|
      format.html
      format.xls
    end    
  end   
  
  private
  
  def get_data
    @branch = Branch.find(params[:branch_id])
  end  
end

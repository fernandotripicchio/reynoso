class ExpensesController < ApplicationController
  before_filter :current_user  
  before_filter :get_data  
  
  
  layout "branch"  
  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = Expense.new
    @expense.expense_date = Time.now.strftime("%d/%m/%Y")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(params[:expense])
    @expense.expense_date = params[:expense][:expense_date].to_time.strftime("%d/%m/%Y")
    respond_to do |format|
      if @expense.save
        format.html { redirect_to branch_expenses_path(@branch), notice: 'Se creo el gasto correctament' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to branch_expenses_path(@branch), notice: 'Se modifico el gasto correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to branch_expenses_path(@branch) }
      format.json { head :no_content }
    end
  end
  
  def download
    @expenses = Expense.all
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

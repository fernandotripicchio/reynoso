class SalesController < ApplicationController
  before_filter :current_user  
  before_filter :get_data
  
  
  layout "branch"     
  # GET /sales
  # GET /sales.json
  def index
    @sales    = @branch.sales.page(params[:page]).per(20)
    @keys     =  ""
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales }
    end
  end
  
  def search
     @keys     =  params[:keys] || ""
     @sales = @branch.sales.includes(:client).where("clients.name ilike ? ", "%"+ @keys +"%").page(params[:page]).per(20)
  end  

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.json
  def new
    @sale = Sale.new
    @sale.date_sale = Time.now.strftime("%d/%m/%Y")
    @sale.items.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(params[:sale])
    @sale.date_sale = params[:sale][:date_sale].to_time.strftime("%d/%m/%Y")
    respond_to do |format|
      if @sale.save
        @sale.decrement_stock(@branch, @current_user)
        @sale.set_status
        format.html { redirect_to branch_sales_path(@branch), notice: "La venta #{@sale.id} se ha creado exitosamente" }
        format.json { render json: @sale, status: :created, location: @sale }
      else
        format.html { render action: "new" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to branch_sales_path(@branch), notice: "La venta #{@sale.id} se ha modificado exitosamente" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    @sale.increment_stock(@branch, @current_user)
    respond_to do |format|
      format.html { redirect_to branch_sales_path(@branch) }
      format.json { head :no_content }
    end
  end
  
  def reportes
    
  end
  
  def cobrar
    @sale = Sale.find(params[:sale_id])
  end
  
  def efectivizar_cobro
    
  end
  
  private
  
  def get_data
    @branch = Branch.find(params[:branch_id])
  end
end

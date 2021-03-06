class StocksController < ApplicationController
  before_filter :current_user  
  before_filter :get_data
  
  
  layout "branch"   
  
  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = @branch.stocks.page(params[:page]).per(20)
    @keys     =  params[:keys] || ""
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stocks }
    end
  end
  
  def search
     @keys     =  params[:keys] || ""
     @stocks = @branch.stocks.includes(:product).where("products.name ilike ? ", "%"+ @keys +"%").page(params[:page]).per(20)
  end
  

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @stock = Stock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock }
    end
  end

  # GET /stocks/new
  # GET /stocks/new.json
  def new
    @stock = Stock.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock }
    end
  end
  
  def edit
    @stock = Stock.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock }
    end
  end  


  # POST /stocks
  # POST /stocks.json
  def update_stock
    #  raise "#{params[:stock].to_json}"
    @product = Product.find(params[:stock][:product_id])
    if ( !params[:stock][:kind_movement].blank? && params[:stock][:kind_movement] == "Descuento")
        @product.decrement_stock( params[:stock][:size],  @branch.id)
    else
        @product.increment_stock( params[:stock][:size],  @branch.id)
    end
    
    redirect_to branch_stocks_path(@branch), notice: "Se modifico el  stock correctamente, para el producto #{@product.name}" 

  end
  
  def modificar_stock
    @stock = Stock.find(params[:stock_id])
    @product = @stock.product
    @stock = @product.get_stock(@branch)
  end
  
  
  def actualizar_stock
    Stock.transaction do
      @stock = Stock.find(params[:stock][:id])
      @stock.update_attributes(params[:stock]) 
      @product = Product.find(params[:product_id])
      if ( !params[:stock][:kind_movement].blank? && params[:stock][:kind_movement] == "Descuento")
          @product.decrement_stock( params[:stock][:temporal_size],  @branch.id, @current_user.id)
      else
  
          @product.increment_stock( params[:stock][:temporal_size],  @branch.id, @current_user.id)
      end
      
      redirect_to branch_stocks_path(@branch),notice: "Se modifico el  stock correctamente, para el producto #{@product.name}" 
    end 
  end

  # PUT /stocks/1
  # PUT /stocks/1.json
  def update
    @stock = Stock.find(params[:id])

    respond_to do |format|
      if @stock.update_attributes(params[:stock])
        format.html { redirect_to stocks_path, notice: 'Se modifico el stock correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to stocks_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_data
    @branch = Branch.find(params[:branch_id])
  end    
end

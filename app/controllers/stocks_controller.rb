class StocksController < ApplicationController
  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stocks }
    end
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
    @product = Product.find(params[:stock][:product_id])
    respond_to do |format|
    if @product.increment_stock( params[:stock][:size],  params[:stock][:branch_id] , params[:stock][:supplier_id])
      
        format.html { redirect_to stocks_path, notice: 'Se agrego el stock correctamente' }
        format.json { render json: @stock, status: :created, location: @stock }
      else
        format.html { render action: "new" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
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
end

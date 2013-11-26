class ProductsController < ApplicationController
  before_filter :current_user  
  before_filter :get_data
  
  
  layout "branch"
  # GET /products
  # GET /products.json
  def index
    @products = @branch.products.page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.add_product(@branch)
        format.html { redirect_to branch_product_edit_attributes_path(@branch, @product), notice: 'Se agrego el producto exitosamente.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to branch_products_path(@branch), notice: 'Se modifico el producto exitosamente.'  }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  
  def edit_attributes
     @product = Product.find(params[:product_id])
  end
  
  def actualizar_atributos
     @product = Product.find(params[:product_id])
     @stock   = Stock.find(params[:stock_id])
     @stock.size = params[:stock][:initial_stock]
     @stock.update_attributes(params[:stock])
     
     redirect_to branch_products_path(@branch), notice: 'Se modifico el producto exitosamente.' 
  end
  
  
  def save_attributes
     @product = Product.find(params[:product_id])
     @product.save_attributes_branch(@branch)
     
     redirect_to branch_products_path(@branch, notice: 'Se modifico el producto exitosamente.') 
  end
  
  def download
    @products = @branch.products
    respond_to do |format|
      format.html
      format.xls
    end    
  end  
  
  
  def actualizar
     @branchs = Branch.all
     @products = Product.all
     
     @branchs.each do |branch|
           @products.each do |product|
              Stock.create(:product_id => product.id, :branch_id => branch.id, :size => 0, :initial_stock => 0)   
           end
          
     end
     render json: "anduvo"
  end
  
  def import
   @product = Product.new  
  end
  
  def save_import
       Product.transaction do

         unless params[:excel_file].blank?
                @products = Product.import( params[:excel_file] )
                
                
                # if @participants[:result]
                    # if @project.assign_participants(@participants[:participants])
                         # flash[:notice] = "The users were successfully imported. "
                         # redirect_to branch_import_products_path(@branch)
                    # end
                # else
                   # flash[:error] = @participants[:errors]
                   # redirect_to branch_import_products_path(@branch)
                # end
        else
               flash[:error] = "Please attach a excel file"         
               redirect_to branch_import_products_path(@branch)
        end   
       end #Transaction      
  end
  
  private
  
  def get_data
    @branch = Branch.find(params[:branch_id])
    @laboratories = Laboratory.order("name").all
  end
end

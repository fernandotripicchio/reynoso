class SuppliersController < ApplicationController
  before_filter :current_user  
  before_filter :get_data
  
  
  layout "branch"   
  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @suppliers }
    end
  end
  
  def search
     @keys      =  params[:keys] || ""
     @suppliers = Supplier.where("name ilike ? ", "%"+ @keys +"%").page(params[:page]).per(20)
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supplier }
    end
  end

  # GET /suppliers/new
  # GET /suppliers/new.json
  def new
    @supplier = Supplier.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supplier }
    end
  end

  # GET /suppliers/1/edit
  def edit
    @supplier = Supplier.find(params[:id])
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(params[:supplier])

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to branch_suppliers_path(@branch), notice: 'Se agrego el proveedor exitosamente.' }
        format.json { render json: @supplier, status: :created, location: @supplier }
      else
        format.html { render action: "new" }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /suppliers/1
  # PUT /suppliers/1.json
  def update
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      if @supplier.update_attributes(params[:supplier])
        format.html { redirect_to branch_suppliers_path(@branch), notice: 'Se modifico el proveedor exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    flash[:notice] = "Se elimino el proveedor"

    respond_to do |format|
      format.html { redirect_to branch_suppliers_path(@branch) }
      format.json { head :no_content }
    end
  end
  
  def actualizar_porcentajes
     @supplier = Supplier.find(params[:supplier_id]) 
  end
  
  def save_actualizar_porcentajes
      @supplier = Supplier.find(params[:supplier_id])
      @supplier.actualizar_porcentajes(params[:porcentaje])
      redirect_to branch_suppliers_path(@branch), notice: 'Se actualizaron los precios exitosamente.' 
  end
    
  
  private
  
  def get_data
    @branch = Branch.find(params[:branch_id])
  end  
end

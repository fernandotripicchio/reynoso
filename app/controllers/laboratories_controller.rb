class LaboratoriesController < ApplicationController
  before_filter :current_user  
  before_filter :get_data  
  
 
  layout "branch"     
  # GET /laboratories
  # GET /laboratories.json
  def index
    @laboratories = Laboratory.page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @laboratories }
    end
  end


  def search
     @keys      =  params[:keys] || ""
     @laboratories = Laboratory.where("name ilike ? ", "%"+ @keys +"%").page(params[:page]).per(20)
  end
  # GET /laboratories/1
  # GET /laboratories/1.json
  def show
    @laboratory = Laboratory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @laboratory }
    end
  end

  # GET /laboratories/new
  # GET /laboratories/new.json
  def new
    @laboratory = Laboratory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @laboratory }
    end
  end

  # GET /laboratories/1/edit
  def edit
    @laboratory = Laboratory.find(params[:id])
  end

  # POST /laboratories
  # POST /laboratories.json
  def create
    @laboratory = Laboratory.new(params[:laboratory])

    respond_to do |format|
      if @laboratory.save
        format.html { redirect_to branch_laboratories_path(@branch), notice: 'Se creo el laboratorio con exito.' }
        format.json { render json: @laboratory, status: :created, location: @laboratory }
      else
        format.html { render action: "new" }
        format.json { render json: @laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /laboratories/1
  # PUT /laboratories/1.json
  def update
    @laboratory = Laboratory.find(params[:id])

    respond_to do |format|
      if @laboratory.update_attributes(params[:laboratory])
        format.html { redirect_to branch_laboratories_path(@branch), notice: 'Se modifico el laboratorio con exito.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratories/1
  # DELETE /laboratories/1.json
  def destroy
    @laboratory = Laboratory.find(params[:id])
    @laboratory.destroy

    respond_to do |format|
      format.html { redirect_to branch_laboratories_path(@branch) }
      format.json { head :no_content }
    end
  end
  
  
  def actualizar_porcentajes
     @laboratory = Laboratory.find(params[:laboratory_id]) 
  end
  
  def save_actualizar_porcentajes
      @laboratory = Laboratory.find(params[:laboratory_id])
      @laboratory.actualizar_porcentajes(params[:porcentaje])
      redirect_to branch_laboratories_path(@branch), notice: 'Se actualizaron los precios exitosamente.' 
  end  
  private
  
  def get_data
    @branch = Branch.find(params[:branch_id])
  end    
end

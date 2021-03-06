class BranchesController < ApplicationController
  before_filter :require_user
  before_filter :get_branches, :except => :elegir_branch
  
  
  layout :choose_layout  
  
  
  def pick
    @branches = Branch.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @branches }
    end
    
  end
  
  #Asocia ID de Branch
  def elegir_branch
    associate_branch
    get_branch
    redirect_to branch_products_path(params[:branch_id]) 
  end
  
  
  
  # GET /branches
  # GET /branches.json  
  def index
    @branches = Branch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @branches }
    end
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
    @branch = Branch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branch }
    end
  end

  # GET /branches/new
  # GET /branches/new.json
  def new
    @branch = Branch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @branch }
    end
  end

  # GET /branches/1/edit
  def edit
    @branch = Branch.find(params[:id])
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(params[:branch])

    respond_to do |format|
      if @branch.save
        format.html { redirect_to branches_path, notice: 'Se agrego la sucursal exitosamente.' }
        format.json { render json: @branch, status: :created, location: @branch }
      else
        format.html { render action: "new" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /branches/1
  # PUT /branches/1.json
  def update
    @branch = Branch.find(params[:id])

    respond_to do |format|
      if @branch.update_attributes(params[:branch])
        format.html { redirect_to branches_path, notice: 'Se modifico la sucursal exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy

    respond_to do |format|
      format.html { redirect_to branches_url }
      format.json { head :no_content }
    end
  end
  
  private 
  
  def get_branches
    
  end
  
  def choose_layout
        if [ 'pick' ].include? action_name
          'nobranch'
        else
          'nobranch'
        end      
  end
end

class UsersController < ApplicationController
  before_filter :current_user  
  before_filter :get_data
  
  
  layout "branch"  

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Se ha creado un nuevo usuario."
      redirect_to branch_users_path(@branch)
    else
      flash[:error] = "Ha ocurrido un problema cuando el usuario era creado."
      render :action => :new
    end

  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to branch_users_path(@branch)
    else
      render :action => :edit
    end
  end
  
  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to branch_users_path(@branch) }
      format.json { head :no_content }
    end  
 end  
 
 private
 
 def get_data
   @branch = Branch.find(params[:branch_id])
 end
end

class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create, :login]
  before_filter :require_user, :except => [:new, :create]
  
  layout "login"
  
  def new
    @user_session = UserSession.new 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end
 
  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session]) 
    respond_to do |format|
      if @user_session.save
        format.html { redirect_to(:users, :notice => 'Bienvenido !') }
        format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
      else
         flash[:error] = "El login o el password no son correctos" 
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    @user_session.destroy 
    respond_to do |format|
      format.html { redirect_to(:users, :notice => 'Nos Vemos!') }
      format.xml  { head :ok }
    end
  end  
  
end

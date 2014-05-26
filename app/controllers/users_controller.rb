class UserSessionsController < ApplicationController
  #skip_before_filter :require_login, only: [:new, :create]

  before_filter :require_login_from_http_basic, :only => [:login_from_http_basic]
  skip_before_filter :authenticate_user!, only: [:new, :create]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end




  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end



  #def new
  #  @user = User.new
  #  if @user.save
  #    redirect_to(:reservacions, notice: 'User was successfully created')
  #  end
  #end

  #def create
  #  if @user = login(params[:email], params[:password])
  #    redirect_back_or_to(:reservacions, notice: 'Login successful')
  #  else
  #    flash.now[:alert] = 'Login failed'
  #    render action: 'new'
  #  end
  #end
  ########
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(:users, :notice => 'Registration successfull. Check your email for activation instructions.') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  ###############




  #def destroy
  #  logout
  #  redirect_to(:reservacions, notice: 'Logged out!')
  #end

  ####################
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  ####################

##
  def edit
    @user = User.find(params[:id])
  end
##

  #def update
  #end

  ##############3
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end
  def login_from_http_basic
    redirect_to users_path, :notice => 'Login from basic auth successful'
  end
  ##############

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      #params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

class UsersController < ApplicationController
  
  def activate
    @user = User.find(params[:id])
    if @user.try_activate(params[:activation_token])
      redirect_to users_url
    else
      flash[:error] = "Could not activate user"
      render :new
    end
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      msg = UserMailer.welcome_email(@user)
      msg.deliver!
      redirect_to root_url
    else
      flash[:error] = "Unable to create user"
      render :new
    end
  end

  def edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end
end

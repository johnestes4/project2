class UsersController < ApplicationController
  require 'pry'

  wrap_parameters :user, include: [:username, :email, :password, :password_confirmation]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def conversation
    @user = User.find(params[:id])
    @messages = Message.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
    @messages = Message.all
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_url unless @current_user == @user
  end

  def update
    user = @current_user
    user.update(username: params[:user][:username])
    # binding.pry
    redirect_to user_path
  end

  def landing
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end

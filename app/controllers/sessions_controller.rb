class SessionsController < ApplicationController

  def new
    @user = User.new
  end
  # this is dope! handrolling user auth noice
  def create
    input_username = params[:user][:username]
    if User.exists?(username: input_username)
      @user = User.find_by(username: input_username)
      if @user.authenticate(params[:user][:password])
        flash[:notice] = "You're signed in!"
        session[:user_id] = @user.id
        redirect_to inbox_path
      else
        flash[:alert] = "Wrong password!"
        redirect_to new_session_path
      end
    else
      flash[:alert] = "That user doesn't exist!"
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end

end

class OutboxesController < ApplicationController

  def index
  end
  def show
    redirect_to root_url unless @current_user
    @messages = Message.all
    @users = User.all
  end

end

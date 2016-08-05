class MessagesController < ApplicationController

  def new
    redirect_to root_path unless @current_user
    @message = Message.new

  end

  def create
    redirect_to root_path unless @current_user
    @message = Message.create!(message_params)

    redirect_to @message
  end

end

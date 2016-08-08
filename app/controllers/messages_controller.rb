class MessagesController < ApplicationController
  def index
    redirect_to show_path
  end

  def new
    redirect_to root_path unless @current_user
    @outbox = Outbox
    @message = Message.new
  end

  def create
    redirect_to root_path unless @current_user
    recipient = User.find_by(:username => params[:message][:recipient_name])
    @users = User.all
    @message = Message.create!(:sender_id => @current_user.id, :recipient_id => recipient.id, :recipient_name => params[:message][:recipient_name], :content => params[:message][:content])
    redirect_to outbox_path
  end

  def show
    @message = Message.find(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :content)
  end

end

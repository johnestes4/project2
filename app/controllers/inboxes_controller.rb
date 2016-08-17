class InboxesController < ApplicationController

  def index
  end
  def show
    ## seems like the inbox/outbox should query for messages that match the user as the sender or recipient.
    redirect_to root_url unless @current_user
    @messages = Message.all
    @users = User.all
  end

end

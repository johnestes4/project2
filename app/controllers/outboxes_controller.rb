class OutboxesController < ApplicationController
  def index
  end
  def show
    @messages = Message.all
    @users = User.all
  end

end

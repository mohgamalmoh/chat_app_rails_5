class MessagesController < ApplicationController

  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      #redirect_to root_path
      #this will broadcast to the receive part of the coffee script
      ActionCable.server.broadcast "chatroom_channel" , foo: message.body
    end
  end

  private

  def message_params
    params.permit(:body)
  end

end

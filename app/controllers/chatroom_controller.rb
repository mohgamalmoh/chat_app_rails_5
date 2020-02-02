class ChatroomController < ApplicationController

  # GET /projects
  # GET /projects.json
  def index
    @messages = Message.all
  end

end

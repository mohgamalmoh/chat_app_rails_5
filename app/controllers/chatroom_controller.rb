class ChatroomController < ApplicationController
  before_action :require_user
  # GET /projects
  # GET /projects.json
  def index
    @messages = Message.all
  end

end

class SessionsController < ApplicationController

  before_action :logged_in_redirect, only: [:new, :create]
  # GET /projects
  # GET /projects.json
  def new
    render 'new'
  end

  def create
    user = User.find_by(username: params[:session][:user_name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      #we used this because we will go to another page
      # success is styling class
      flash[:success] = "Logged in successfully"
      redirect_to root_path
    else
      #we used flash.now because we want to show the flash in the same page (no redirect)
      # Error is styling class
      flash.now[:error] = "Login Error"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to login_path
  end

  private #the following function is only available to the session's controller

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end
end

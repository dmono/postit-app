class SessionsController < ApplicationController
  def new

  end

  def create
    # where returns an array
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      # save the fact that a user is logged in to a session hash
      # saved to browser's cookie
      session[:user_id] = user.id # only save id and not user object b/c of cookie size limitations
      flash[:notice] = "Welcome, you've logged in."
      redirect_to root_path
    else
      flash[:error] = "There is something wrong with your username or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out."
    redirect_to root_path
  end
end
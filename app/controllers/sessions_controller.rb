class SessionsController < ApplicationController
  def new
    redirect_to dashboard_path if authorize?
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:success] = "Login Success!"
      redirect_to dashboard_path
    else
      flash[:error] = "Login Error: Your login information was incorrect. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end

class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] ="Succesfully logged in"
      redirect_to root_path
    else
       flash.now[:error]="invalid credentials"
       render 'new'
    end
  end

  def destroy
      session[:user_id] = nil
      flash[:success] ="Succesfully logged out"
      redirect_to login_path
  end
end

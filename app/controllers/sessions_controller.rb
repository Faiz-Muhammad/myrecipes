class SessionsController < ApplicationController

  def new

  end

  def create
    chef = Chef.find_by(email: params[:session][:email].downcase)
    if chef && chef.authenticate(params[:session][:password])
      session[:chef_id] = chef.id #it saves the encrypted chef-id in browser cookies
      cookies.signed[:chef_id] = chef.id
      flash[:success] = "You have Successfully logged in"
      redirect_to chef
    else
      flash.now[:danger] = "Invalid email/password..!"
      render 'new'
    end
  end

  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end

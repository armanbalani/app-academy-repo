class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user_name = params[:user][:user_name]
    password = params[:user][:password]
    user = User.find_by_credentials(user_name, password)
    if !user.nil?
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to cats_url
    else
      render json: "credentials be wrong fam"
    end
  end

  def destroy
  end
end

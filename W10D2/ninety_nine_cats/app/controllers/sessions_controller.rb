class SessionsController < ApplicationController

  before_action :already_signed_in!, only: [:new, :create]

  def new
    render :new
  end

  def create
    user_name = params[:user][:user_name]
    password = params[:user][:password]
    user = User.find_by_credentials(user_name, password)
    if !user.nil?
      user.reset_session_token!
      login!(user)
      redirect_to cats_url
    else
      render json: "credentials be wrong fam"
    end
  end

  def destroy
    logout!
    redirect_to cats_url
  end
end

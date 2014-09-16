class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by_username(params[:username])
      puts params[:password]
      puts params[:username]
      if (user and user.authenticate(params[:password]))
        session[:user_id] = user.id
        redirect_to login_url, alert: "SUCCESS!!!!"
      else
        redirect_to login_url, alert: "Invalid username/password combination"
      end
  end

  def destroy
    session[:user_id] = nil
    # TODO: redirect where?
  end
end

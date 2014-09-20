class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by_username(params[:username])
      puts params[:password]
      puts params[:username]
      if (!user.nil? and user.authenticate(params[:password]))
        session[:user_id] = user.id
        session[:user_role] = user.role
        redirect_to "/sessions", alert: "SUCCESS!!!!" # TODO: convert to a path variable
      else
        redirect_to login_url, alert: "Invalid username/password combination"
      end
  end

  def signed_in?
    !session[:user_id].nil?
  end

  def index
    if session[:user_role].eql? User.USR_ROLE
      puts "show_usr"
      render 'show_usr'
    end
    if session[:user_role].eql? User.EMP_ROLE
      puts "show_emp"
      render 'show_emp'
    end
    if session[:user_role].eql? User.ADM_ROLE
      render 'show_adm'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_role] = nil
    redirect_to login_url, alert: "You have been logged out"
  end
end

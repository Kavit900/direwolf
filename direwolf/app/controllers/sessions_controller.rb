class SessionsController < ApplicationController
  layout false
  def new
  end

  def create
      user = User.find_by_username(params[:username])
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
      #render ''
      redirect_to(:controller => 'jobseekers', :action => "index")
    end
    if session[:user_role].eql? User.EMP_ROLE
      redirect_to(:action => 'employer_first')
    end
    if session[:user_role].eql? User.ADM_ROLE
      redirect_to(:action => 'admin_first')
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_role] = nil
    redirect_to login_url, alert: "You have been logged out"
  end
end

class AdminController < ApplicationController
  def index
  end

  def add_admins
    @user = User.new(:role => "ADM", :name => params[:name])
    @user[:password] = params[:password]
    @user[:email] = params[:email]
    @user.save
    redirect_to(:action => 'admin_first')
  end

  def add_employers
    @user = User.new(:role => "EMP", :name => params[:name])
    @user[:password] = params[:password]
    @user[:email] = params[:email]
    @user.save
    redirect_to(:action => 'admin_first')
  end

  def add_fields
    @field = Field.new(:name => params[:name])
    @field.save
    redirect_to(:action => 'admin_first')
  end
end

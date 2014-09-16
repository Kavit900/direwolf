class UsersController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
    role = params[:role]
    puts role
    if role == "EMP" then
      @user.role = "EMP"
    elsif role == "ADM" then
      @user.role = "ADM"
    else
      @user.role = "USR"
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(field_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Job Seeker was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # GET /fields/1/edit
  def edit
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_field
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def field_params
    params.require(:user).permit(:name, :password, :password_digest, :username, :email, :skills, :resume, :phone)
  end

end

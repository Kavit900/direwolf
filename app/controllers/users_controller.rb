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
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(field_params)
    # Dont allow the field_param to set the user_role to whatever they would like, only use one of the values we allow.
    role = field_params[:role]
    if role == User.EMP_ROLE then
      @user.role = User.EMP_ROLE
    elsif role == User.ADM_ROLE then
      @user.role = User.ADM_ROLE
    else
      @user.role = User.USR_ROLE
    end
    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to :root, alert: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(field_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /fields/1/edit
  def edit
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to users_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_field
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def field_params
    params.require(:user).permit(:name, :password, :password_digest, :password_confirmation, :username, :email, :skills, :resume, :phone, :role, :contactName)
  end

end

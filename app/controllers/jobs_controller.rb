class JobsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.where("employee_id = ? and isDeleted = 'f'", session[:user_id])
    @fields = Field.all

=begin
    if params[:search]
      puts " I am searching"
    if @jobs = Job.find(:all, :conditions => ["%#{params[:search]}%"]) then
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
    end
  else
    @jobs = Job.find(:all)
  end
=end

  end

  def show
  end

  def new
    @job = Job.new()
  end

  def edit
    #puts "Editing ID : "
    #puts @job.field.name
  end

  def create
    @job = Job.new(field_params)
    # associate this job posting with the currently logged in user
    @job.employee_id = session[:user_id]
    @job.isDeleted = false
    if @job.save
      redirect_to(:controller => 'sessions', :action => 'employer_first')
    else
      format.html { render :new }
    end
  end

  def update
    respond_to do |format|
      if @job.update(field_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    puts "DESTROY CALLED"
    @job.isDeleted = true
    if @job.save then
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_field
    @job = Job.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def field_params
    params.require(:job).permit(:title, :deadline, :field_id, :description)
  end
end

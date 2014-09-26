class JobsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.where("employee_id = ? and isDeleted = 'f'", session[:user_id])
    @fields = Field.all
  end

  def show
  end

  def new
    @job = Job.new()
  end

  def edit
  end

  def create
    @job = Job.new(field_params)
    # associate this job posting with the currently logged in user
    @job.employee_id = session[:user_id]
    @job.isDeleted = false
    if @job.save
      # TODO: find a way to have rails do this
      # then add all the tags back
      params[:job][:tags].each do |x|
        @tag = Tag.find_by_id(x)
        if (!@tag.nil?) then
          @job.tags << @tag
        end
      end
      redirect_to(:controller => 'sessions', :action => 'employer_first')
    else
      format.html { render :new }
    end
  end

  def update
    respond_to do |format|
      if @job.update(field_params)
        # for now do it manually, destroy all tags associated with the job
        # then add them back, ugly but it works
        #@job.tags.clear
        # then add all the tags back
        params[:job][:tags].each do |x|
          @tag = Tag.find_by_id(x)
          if (!@tag.nil?) then
            @job.tags << @tag
          end
        end
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
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
    params.require(:job).permit(:title, :deadline, :field_id, :description, :tags => [:id])
  end
end

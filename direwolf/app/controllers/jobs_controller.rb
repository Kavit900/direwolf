class JobsController < ApplicationController
  before_action :set_field, only: [:edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new()
  end

  def create
    @job = Job.new(field_params)
    if @job.save
      redirect_to(:controller => 'sessions', :action => 'employer_first')
    else
      format.html { render :new }
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_field
    @job = Job.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def field_params
    params.require(:job).permit(:title, :deadline)
  end
end

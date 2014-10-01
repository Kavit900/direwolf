class JobseekersController < ApplicationController

  def index
    @jobs = Job.all
    @fields = Field.all
    @applies = Apply.all
    @ap = Apply.pluck(:job_id)
  end
  def new
    @jobs = Job.all
    @fields = Field.all
    @applies = Apply.all
    @ap = Apply.pluck(:job_id)
  end

  def recommend
# Here we will be using the Job Model to actually search.
      @jobs = Job.where("title LIKE  '%#{params[:key]}%'")
  end

end
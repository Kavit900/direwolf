class JobseekersController < ApplicationController
  layout false
  def index
    @jobs = Job.all
    @fields = Field.all
  end

  def search
  	title = params[:search]
  	@jobs = Job.find(:all, title)
  	return @jobs
  end

end
class JobseekersController < ApplicationController
  def index
    @jobs = Job.all
    @fields = Field.all
  end

end
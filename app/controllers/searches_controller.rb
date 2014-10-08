class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end
  def search
# No code is required here.
  end
  def search_results
# Here we will be using the Job Model to actually search.
keywords = "%" + params[:keywords] + "%"
field_id = "%" + params[:field_id] + "%"
  @jobs = Job.where("title LIKE ? OR description LIKE ? OR field_id LIKE ?", keywords , keywords, field_id)
      end



end

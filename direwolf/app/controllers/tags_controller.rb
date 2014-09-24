class TagsController < ApplicationController
  layout false
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new()
  end

  def show
  end

  def create
    @tag = Tag.new()
    @tag.tag = field_params[:tag]
    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_field
    @tag = Tag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def field_params
    params.require(:tag).permit(:tag)
  end

end

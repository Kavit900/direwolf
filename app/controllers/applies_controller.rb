class AppliesController < ApplicationController
  before_action :set_apply, only: [:show, :edit, :update, :destroy]

  # GET /applies
  # GET /applies.json
  def index
    @jobs = Job.where("employee_id = ?", session[:user_id])
    @applies = Array.new
    if (!@jobs.nil?)
      @jobs.each do |job|
        @j = Apply.find_by_job_id(job.id)
        if (!@j.nil?) then
          puts @j
          @applies << @j
        end
      end
    end
  end

  # GET /applies/1
  # GET /applies/1.json
  def show
  end

  # GET /applies/new
  def new
    @apply = Apply.new
  end

  # GET /applies/1/edit
  def edit
  end

  # POST /applies
  # POST /applies.json
  def create
    @apply = Apply.new(apply_params)
    @apply.job_id = apply_params[:job_id]
    @apply.user_id = session[:user_id]
    respond_to do |format|
      if @apply.save
        ApplyMailer.new_app_email(@apply).deliver

        format.html { redirect_to :root, alert: 'You have successfully applied for ${@apply.job.title}' }
        format.json { render :show, status: :created, location: @apply }
      else
        format.html { render :new }
        format.json { render json: @apply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applies/1
  # PATCH/PUT /applies/1.json
  def update
    @temp = Apply.find_by_id @apply.id
    updated = false
    if (@temp.status != @apply.status) then
      updated = true
    end
    respond_to do |format|
      if @apply.update(apply_params)
        if updated then
          ApplyMailer.app_updated_email(@apply).deliver
        end
        format.html { redirect_to @apply, notice: 'Apply was successfully updated.' }
        format.json { render :show, status: :ok, location: @apply }
      else
        format.html { render :edit }
        format.json { render json: @apply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applies/1
  # DELETE /applies/1.json
  def destroy
    @apply.destroy
    respond_to do |format|
      format.html { redirect_to :root, alert: 'Application was successfully withdrawn.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply
      @apply = Apply.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_params
      params.require(:apply).permit(:cover, :job_id, :status)
    end
end

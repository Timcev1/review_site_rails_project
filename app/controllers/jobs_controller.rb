class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @jobs = Job.new
    @jobs.service_areas.build
  end

  def create
    @jobs = Job.new(job_params)
    @jobs = current_user.jobs.build(job_params)
    binding.pry
    if @jobs.save
      flash[:notice] = "Job successfully created!"
      redirect_to jobs_path
    else
      flash[:alert] = "Job not saved."
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @jobs = Job.find(params[:id])
  end

  def update
    @jobs = Job.find(params[:id])
    if @jobs.update(job_params)
      flash[:notice] = "Job successfully updated."
      redirect_to jobs_path
    else
      flash[:alert] = "Job not updated."
      render :edit
    end
  end

  def destroy
    @jobs = Job.find(params[:id])
    @jobs.destroy
    flash[:notice] = "Job successfully deleted"
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, category_attributes: [:name], service_area_attributes: [:name])
  end
end

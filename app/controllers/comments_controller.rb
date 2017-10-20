class CommentsController < ApplicationController
  before_action :get_job
  def new
    @comments = @job.comments.build
  end

  def create
    @jobs = Job.find(params[:job_id])
    @comments = @jobs.comments.create(comments_params)
    @comments.user_id = current_user.id
    @comments.save
    if @comments.valid?
      flash[:notice] = "Comment added."
      redirect_to job_path(@job)
    else
      flash[:alert] = "comment not added."
      redirect_to new_job_comment_path(@job)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully deleted."
    redirect_to root_path
  end

  private

  def get_job
    @job = Job.find(params[:job_id])
  end

  def comments_params
    params.require(:comment).permit(:comments, :rating, :user_id)
  end
end

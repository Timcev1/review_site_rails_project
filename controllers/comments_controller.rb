class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.comments.build(comments_params)
    if @recipe.save
      flash[:notice] = "Comment added."
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "comment not added."
      redirect_to recipe_path(@recipe)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully deleted."
    redirect_to root_path
  end

  def comments_params
    params.require(:comment).permit(:comment, :rating)
  end
end

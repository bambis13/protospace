class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to root_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id],user_id: current_user.id)
  end
end

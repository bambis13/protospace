class CommentsController < ApplicationController
  #before_action :set_comment

  def create
    @comment = Comment.create(comment_params)
    redirect_to root_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if @comment.user_id == current_user.id

    redirect_to root_path
  end

  def edit

  end
  def update

  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id],user_id: current_user.id)
  end

  def set_comment
  end
end

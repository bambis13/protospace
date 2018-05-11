class CommentsController < ApplicationController

  def index
    @prototype = Prototype.where(prototype_id: params[:prototype_id])
    @comments = @prototype.comments.includes(:user)
    # @comments = Comment.where(prototype_id: params[:prototype_id])
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id],user_id: current_user.id)
  end
end

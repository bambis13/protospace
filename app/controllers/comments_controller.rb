class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy, :edit, :update]
  before_action :set_prototype

  def create
    @comment = Comment.create(comment_params)
    redirect_to prototype_path(@prototype)
  end

  def destroy
    @comment.destroy if @comment.user_id == current_user.id

    redirect_to prototype_path(@prototype)
  end

  def edit
  end

  def update
    @comment.content = params[:content]
    @comment.update(comment_params)
    redirect_to prototype_path(@prototype)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id],user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end

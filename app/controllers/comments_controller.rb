class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
  end

  private
  def comment_params
    params.permit(:content, :prototype_id).merge(user_id: current_user.id)
  end
end

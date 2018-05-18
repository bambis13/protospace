class LikesController < ApplicationController
  before_action :set_prototype
  before_action :set_like, only: :destroy

  def create
    @like = Like.create(user_id: current_user.id, prototype_id: @prototype.id)
    # @likes = Like.where(prototype_id: @prototype.id)
    respond_to do |format|
      format.html {redirect_to prototype_path(@prototype)}
      format.json
    end
  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html {redirect_to prototype_path(@prototype)}
      format.json
    end
    # @likes = Like.where(prototype_id: @prototype.id)
  end

  def set_prototype
    # binding.pry
   @prototype = Prototype.find(params[:prototype_id])
  end

  def set_like
    @like = Like.find_by(user_id: current_user.id, prototype_id: @prototype.id)
  end
end

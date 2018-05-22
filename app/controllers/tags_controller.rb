class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  # def show
  #   @tag = Tag.find(params[:id])
  #   @prototypes = Prototype.where(prototype_id: params[:id]).include
  # end
end

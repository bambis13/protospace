class PrototypesController < ApplicationController

  before_action :set_prototype, only: [:show, :destroy, :edit, :update]
  before_action :set_like ,only: :show

  

  def index
    @prototypes = Prototype.rand.limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @prototype = Prototype.new
    4.times{@prototype.captured_images.build}
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      render :new, alert: 'New prototype was unsuccessfully created'
     end
  end

  def popular
    @prototypes = Prototype.popular.limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def newest
    @prototypes = Prototype.newest.limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(prototype_id: params[:id]).includes(:user)
  end

  def destroy
    @prototype.destroy if @prototype.user_id == current_user.id
    redirect_to root_path notice: '削除しました。'

  end

  def edit
    4.times{@prototype.captured_images.build}
    if user_signed_in?
      @like = Like.find_by(user_id: current_user.id, prototype_id: params[:id])
    else
      @like = Like.find_by(prototype_id: params[:id])
    end
  end

  def update
    @prototype.update(prototype_params)
    redirect_to prototype_path(@prototype)
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      :likes_count,
      captured_images_attributes: [:content, :status]
    )
  end

  def set_like
    if user_signed_in?
      @like = Like.find_by(user_id: current_user.id, prototype_id: params[:id])
    else
      @like = Like.find_by(prototype_id: params[:id])
    end
  end
end

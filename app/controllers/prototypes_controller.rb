class PrototypesController < ApplicationController
  before_action :set_prototype, only: :show
  before_action :set_like ,only: :show

  def index
    @prototypes = Prototype.rand.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    tag_list = params[:prototype][:tag_list].reject{|tag| tag == ""}
    if @prototype.save
      @prototype.save_prototypes(tag_list)
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
    @comments = Comment.includes(:user).where(prototype_id: params[:id])
    @tags = @prototype.tags
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy if @prototype.user_id == current_user.id
  end

  def edit
    @prototype = Prototype.find(params[:id])
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

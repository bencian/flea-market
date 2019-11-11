class Backend::TagsController < BackendController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @presenter = TagsPresenter.new(params)
  end

  def show; end

  def new
    @tag= Tag.new
  end

  def edit; end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = t('actions.new')
      redirect_to admin_tags_path
    else
      flash.now[:alert] = t('actions.error')
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      flash[:notice] = t('actions.update')
      redirect_to admin_tags_path
    else
      flash.now[:alert] = t('actions.error')
      render :edit
    end
  end

  def destroy
    flash[:notice] = t('actions.delete')
    redirect_to admin_tags_path
  end

  private

  def set_tag
    @tag = Tag.find(params[:id]).decorate
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end


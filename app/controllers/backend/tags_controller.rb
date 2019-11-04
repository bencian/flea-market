class Backend::TagsController < BackendController
  def index
    @presenter = TagsPresenter.new(params)
  end

  def show
    @tag = Tags.find(params[:id]).decorate
  end

  def new
    @tag= Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = 'Creado'
      redirect_to tags_path
    else
      flash.now[:alert] = 'Error'
      render :new
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = 'Creado'
      redirect_to tags_path
    else
      flash.now[:alert] = 'Error'
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = 'Eliminado'
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end


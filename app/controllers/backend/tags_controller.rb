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
      flash[:notice] = 'Creado'
      redirect_to admin_tags_path
    else
      flash.now[:alert] = 'Error'
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      flash[:notice] = 'Creado'
      redirect_to admin_tags_path
    else
      flash.now[:alert] = 'Error'
      render :edit
    end
  end

  def destroy
    if @tag.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'No puedes borrar una etiqueta con productos'
    end
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


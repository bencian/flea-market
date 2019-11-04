class Backend::CategoriesController < BackendController
  def index
    @presenter = Backend::CategoriesPresenter.new(params)
  end

  def show
    @category = Category.find(params[:id]).decorate
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Creado'
      redirect_to categories_path
    else
      flash.now[:alert] = 'Error'
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = 'Creado'
      redirect_to categories_path
    else
      flash.now[:alert] = 'Error'
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Eliminado'
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end


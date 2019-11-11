class Backend::CategoriesController < BackendController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @presenter = CategoriesPresenter.new(params)
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = t('actions.new')
      redirect_to admin_categories_path
    else
      flash.now[:alert] = t('actions.error')
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = t('actions.update')
      redirect_to admin_categories_path
    else
      flash.now[:alert] = t('actions.error')
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = t('actions.deleted')
    else
      flash[:alert] = t('actions.specific.category_delete')
    end
    redirect_to admin_categories_path
  end
  
  private

  def set_category
    @category = Category.find(params[:id]).decorate
  end

  def category_params
    params.require(:category).permit(:name)
  end
end


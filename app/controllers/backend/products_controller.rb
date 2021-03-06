class Backend::ProductsController < BackendController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @presenter = BackendProductsPresenter.new(params)
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = t('actions.new')
      redirect_to admin_products_path
    else
      flash.now[:alert] = t('actions.error')
      render :new
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = t('actions.update')
      redirect_to admin_products_path
    else
      flash.now[:alert] = t('actions.error')
      render :edit
    end
  end

  def destroy 
    @product.destroy
    flash[:notice] = t('actions.delete')
    redirect_to admin_products_path
  end

  private

  def set_product
    @product = Product.find(params[:id]).decorate
  end

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :code,
      :price,
      :cost,
      :active,
      :category_id,
      tag_ids: [],
      product_images_attributes: [
        :id,
        :primary,
        :image,
        :_destroy
      ]
    )
  end
end

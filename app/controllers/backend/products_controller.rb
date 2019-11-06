class Backend::ProductsController < BackendController
  def index
    @presenter = ProductsPresenter.new(params)
  end

  def show
    @product = Product.find(params[:id]).decorate
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = 'Creado'
      redirect_to products_path
    else
      flash.now[:alert] = 'Error'
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'Creado'
      redirect_to products_path
    else
      flash.now[:alert] = 'Error'
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Eliminado'
    redirect_to products_path
  end

  private

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
